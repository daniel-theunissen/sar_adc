"""gm/Id lookup tables and device sizing. Units: uA, um, V, uS."""
from pathlib import Path
import numpy as np
import pandas as pd
from pygmid import Lookup

_TABLES = Path(__file__).resolve().parent.parent / 'gmid'
nmos = Lookup(str(_TABLES / 'nfet_01v8.mat'))
pmos = Lookup(str(_TABLES / 'pfet_01v8.mat'))
pmos_lvt = Lookup(str(_TABLES / 'pfet_01v8_lvt.mat'))


class tech:
    """Generic constants for hand estimates of parasitic capacitance, mismatch, noise and switch resistance.
    Not extracted from sky130: COX matches a ~4.1 nm gate oxide, the rest are textbook-typical values."""
    COX_FF_UM2 = 8.4
    COV_FF_UM = 0.3              # gate overlap per um of W, each side
    CJ_FF_UM = 0.5               # drain/source junction per um of W
    AVT_N = AVT_P = 5.0          # mV um
    ABETA_PCT = 1.0              # % um, current-factor mismatch
    MUCOX_N, MUCOX_P = 170.0, 55.0   # uA/V^2
    VTH_N, VTH_P_LVT = 0.50, 0.42
    GAMMA_N = 0.7                # thermal-noise factor
    N_SLOPE = 1.3                # subthreshold slope factor
    L_MIN_PLVT = 0.35            # um, pfet_01v8_lvt


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
