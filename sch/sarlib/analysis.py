"""Readers for ngspice output and the pass/fail report shared by the analysis notebooks."""
import re
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

plt.rcParams.update({'figure.dpi': 110, 'axes.grid': True, 'grid.alpha': 0.3, 'figure.constrained_layout.use': True})

_NUM = r'[-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?'


def read_matrix(path):
    """Numeric rows of a wrdata / csv file; header and text lines are skipped."""
    rows = []
    for line in Path(path).read_text().splitlines():
        try:
            rows.append([float(t) for t in line.replace(',', ' ').split()])
        except ValueError:
            continue
    rows = [r for r in rows if r]
    n = min(len(r) for r in rows)
    return np.array([r[:n] for r in rows])


def load_real(path):
    """(x, [y1, y2, ...]) from wrdata, which writes either x y1 x y2 ... or x y1 y2 ..."""
    M = read_matrix(path)
    nc = M.shape[1]
    if nc >= 4 and nc % 2 == 0 and np.allclose(M[:, 0], M[:, 2]):
        return M[:, 0], [M[:, k] for k in range(1, nc, 2)]
    return M[:, 0], [M[:, k] for k in range(1, nc)]


def load_cols(path, names):
    """(x, {name: column}) for a file whose vectors are written in the order of `names`."""
    x, ys = load_real(path)
    return x, dict(zip(names, ys))


def load_complex(path):
    """One complex vector from wrdata: columns x, real, imag."""
    M = read_matrix(path)
    return M[:, 0], M[:, 1] + 1j * M[:, 2]


def read_raw(path):
    """ngspice binary raw file -> {lower-case vector name: array}."""
    b = Path(path).read_bytes()
    i = b.index(b'Binary:\n') + len(b'Binary:\n')
    hdr = b[:i].decode('latin1')
    nv = int(re.search(r'No\. Variables:\s*(\d+)', hdr).group(1))
    npt = int(re.search(r'No\. Points:\s*(\d+)', hdr).group(1))
    names = [m[1] for m in re.findall(r'\t(\d+)\t(\S+)\t(\S+)', hdr[hdr.index('Variables:'):])]
    data = np.frombuffer(b, dtype='<f8', count=nv * npt, offset=i).reshape(npt, nv)
    return {n.lower(): data[:, j] for j, n in enumerate(names)}


def parse_op_log(path):
    """`name = value` lines of an ngspice print log -> {lower-case name: value}."""
    vals = {}
    for line in Path(path).read_text().splitlines():
        m = re.match(rf'^\s*(\S+)\s*=\s*({_NUM})\s*$', line)
        if m:
            vals[m.group(1).lower()] = float(m.group(2))
    return vals


def eng(v, unit=''):
    """Engineering notation, e.g. eng(3.3e4, 'ohm') -> '33 kohm'."""
    if v is None or not np.isfinite(v):
        return 'n/a'
    if v == 0 or not unit:
        return f'{v:.3g} {unit}'.strip()
    exp = max(min(int(np.floor(np.log10(abs(v)) / 3) * 3), 12), -15)
    pre = {12: 'T', 9: 'G', 6: 'M', 3: 'k', 0: '', -3: 'm', -6: 'u', -9: 'n', -12: 'p', -15: 'f'}[exp]
    return f'{v / 10 ** exp:.3g} {pre}{unit}'


def log_cross(x, y, level, falling=True):
    """First crossing of y through level, interpolated on a log x axis; NaN if none."""
    x, s = np.asarray(x, float), np.asarray(y, float) - level
    idx = np.where((s[:-1] > 0) & (s[1:] <= 0))[0] if falling else np.where((s[:-1] < 0) & (s[1:] >= 0))[0]
    if idx.size == 0:
        return np.nan
    i = idx[0]
    w = -s[i] / (s[i + 1] - s[i])
    return 10 ** (np.log10(x[i]) + w * (np.log10(x[i + 1]) - np.log10(x[i])))


def lin_cross(x, y, level=0.0):
    """First crossing of y through level, linear interpolation; NaN if none."""
    x, s = np.asarray(x, float), np.asarray(y, float) - level
    for i in range(len(s) - 1):
        if s[i] == 0:
            return x[i]
        if s[i] * s[i + 1] < 0:
            return x[i] + (x[i + 1] - x[i]) * s[i] / (s[i] - s[i + 1])
    return np.nan


def window_around(x, ok, x0):
    """(lo, hi) of the contiguous run of `ok` containing the point nearest x0; None if that point fails."""
    x, ok = np.asarray(x), np.asarray(ok)
    k = int(np.argmin(np.abs(x - x0)))
    if not ok[k]:
        return None
    lo = hi = k
    while lo > 0 and ok[lo - 1]:
        lo -= 1
    while hi < len(x) - 1 and ok[hi + 1]:
        hi += 1
    return float(x[lo]), float(x[hi])


def settle_time(t, y, final, band, t0=None):
    """Time after t0 (default t[0]) from which y stays within `band` of final; NaN if it never settles."""
    t0 = t[0] if t0 is None else t0
    out = np.where(np.abs(y - final) > band)[0]
    if out.size == 0:
        return 0.0
    if out[-1] >= len(y) - 1:
        return np.nan
    return float(t[out[-1] + 1] - t0)


class Report:
    """Pass/fail checklist collected while a notebook runs."""

    def __init__(self):
        self.rows = []

    def check(self, name, value, spec, ok):
        self.rows.append((name, value, spec, 'PASS' if ok else 'FAIL'))

    def info(self, name, value, comment=''):
        self.rows.append((name, value, comment, 'INFO'))

    def limit(self, name, val, fmt, lim, kind='<=', unit=''):
        ok = bool(np.isfinite(val) and (val <= lim if kind == '<=' else val >= lim))
        self.check(name, fmt.format(val) if np.isfinite(val) else 'n/a', f'{kind} {lim:g} {unit}'.strip(), ok)

    def table(self):
        return pd.DataFrame(self.rows, columns=['check', 'value', 'spec', 'result'])
