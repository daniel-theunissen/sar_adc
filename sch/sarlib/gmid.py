"""gm/Id lookup tables and device sizing. Units: uA, um, V, uS."""
from pathlib import Path
import numpy as np
import pandas as pd
from pygmid import Lookup

_TABLES = Path(__file__).resolve().parent.parent / 'gmid'
nmos = Lookup(str(_TABLES / 'nfet_01v8.mat'))
pmos = Lookup(str(_TABLES / 'pfet_01v8.mat'))
pmos_lvt = Lookup(str(_TABLES / 'pfet_01v8_lvt.mat'))


def size(mos, ID, gm_id, L, VDS, VSB=0.0):
    """Width and operating point of a device carrying ID at gm/Id. PMOS values are magnitudes."""
    VDS, VSB = max(float(VDS), 0.05), max(float(VSB), 0.0)
    kw = dict(GM_ID=gm_id, L=L, VDS=VDS, VSB=VSB)
    vgs = float(mos.look_upVGS(**kw))
    gm = gm_id * ID
    return dict(ID=ID, gmid=gm_id, L=L, VDS=VDS, VSB=VSB,
                W=float(ID / mos.look_up('ID_W', **kw)),
                VGS=vgs,
                VDSAT=float(mos.lookup('VDSAT', VGS=vgs, VDS=VDS, VSB=VSB, L=L)),
                gm=gm,
                gds=float(gm / mos.look_up('GM_GDS', **kw)),
                fT=float(mos.look_up('GM_CGG', **kw) / (2 * np.pi)))


def vgs_at(mos, ID, W, L, VDS, VSB=0.0):
    """VGS at which a device of fixed width W carries ID (bisection on ID/W)."""
    target, lo, hi = ID / W, 0.05, 1.5
    for _ in range(40):
        mid = 0.5 * (lo + hi)
        if float(mos.lookup('ID_W', VGS=mid, VDS=max(VDS, 0.05), VSB=max(VSB, 0.0), L=L)) < target:
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)


def id_w(mos, VGS, VDS, L, VSB=0.0):
    """Current density (uA/um) at a bias point."""
    return float(mos.lookup('ID_W', VGS=VGS, VDS=max(VDS, 0.05), VSB=VSB, L=L))


def device_table(rows):
    """DataFrame of sized devices: rows = [(name, size() result), ...]."""
    cols = ['ID', 'W', 'L', 'gmid', 'VGS', 'VDS', 'VDSAT', 'gm', 'gds']
    return pd.DataFrame([{k: d[k] for k in cols} for _, d in rows], index=[n for n, _ in rows]).round(3)
