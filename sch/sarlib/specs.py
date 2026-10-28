"""Design inputs and pass/fail limits for every sizing and analysis notebook.

Units are SI unless a name says otherwise. Plain numbers that feed the gm/Id sizing (currents,
widths, lengths) are in uA and um, as the lookup tables are.
"""
# ---------------------------------------------------------------- system
VDD = 1.8
N_BITS = 7
NCODE = 2 ** N_BITS
F_CONV = 1e6                     # conversions per second
T_BIT = 100e-9                   # one SAR bit cycle
TEMP = 300.0

I_FS = 20e-6                     # ladder full-scale input current
I_LSB = I_FS / NCODE
VREF1 = 0.25                     # held on dac1 / dac2 by the NMOS regulated cascodes
VREF2 = 1.55                     # held on i1 / i2 by the PMOS regulated cascodes
VMID = 0.9                       # DC level of the delta-I nodes (clamp reference)

# ---------------------------------------------------------------- values measured on earlier benches
I_LSB_MEAS = 156.16e-9           # ladder LSB, bench E section 2
I_FS_MEAS = I_LSB_MEAS * NCODE
VCM_CMP = 0.949                  # comparator input common mode, bench E clamp run (mean over codes)
VCM_CMP_PP = 47.1e-3             # its variation over the codes, bench E
V_LSB_CMP = 10.9e-3              # differential volts per LSB at the comparator input, bench F

# ---------------------------------------------------------------- comparator input node
R_NODE = 35e3                    # source resistance seen by each comparator input
C_NODE = 100e-15                 # total capacitance on each delta-I / comparator input node
SETTLE_NODE = 53.1e-9            # settling time of that node in the ADC (timing budget)


class tech:
    """sky130 placeholders for hand capacitance / mismatch estimates."""
    COX_FF_UM2 = 8.4
    COV_FF_UM = 0.3              # gate overlap per um of W, each side
    CJ_FF_UM = 0.5               # drain/source junction per um of W
    AVT_N = AVT_P = 5.0          # mV um
    ABETA_PCT = 1.0              # % um, current-factor mismatch
    MUCOX_N, MUCOX_P = 170.0, 55.0   # uA/V^2
    VTH_N, VTH_P_LVT = 0.50, 0.42
    GAMMA_N = 0.7                # thermal-noise factor
    N_SLOPE = 1.3
    L_MIN_PLVT = 0.35            # um, pfet_01v8_lvt


class ladder:
    """M2M ladder: NMOS unit device used as a resistor."""
    VGATE, VDS = 1.8, 0.05
    L, W = 3.5, 1.0
    VS = (0.25, 0.85)            # source-voltage range of the unit devices
    N_VS = 8


class cascode:
    """NMOS / PMOS regulated cascodes of the summing stage (hand numbers and bench C)."""
    IB = 40e-6                   # bias current copies; T1 carries IB - I_ladder
    R_OUT = 30e3                 # ladder output resistance, sets the R_in budget
    # first-cut device sizing: (ID uA, gm/Id, L um, VDS V, VSB V)
    T3 = (40, 12, 2, 0.25, 0.0)
    T1 = (30, 12, 2, 0.5, 0.25)
    T7 = (40, 8, 2, 0.25, 0.0)
    T5 = (30, 12, 1, 0.2, 0.25)
    LOOP_LEVELS = (0.0, 10e-6, 20e-6)        # ladder currents of the bench C loop-gain runs
    STEP = dict(istep=10e-6, t0=1e-6, t_end=5e-6)
    SPECS = dict(
        dc_range_mv=2.0,                     # movement of v(d1) over the code range
        rin_max=R_OUT / 2 ** (N_BITS + 1),   # input-resistance budget (ohm)
        t1_min_ua=5.0,
        pm_min=60.0,
        fu_min=5 * F_CONV,
        tran_err_mv=0.5,
        t_settle=600e-9,
        min_1pt=0.5,                         # min |1 + T|
    )


class ota_p:
    """PMOS-input 5T OTA of the NMOS-side cascode (first-cut L sweep and bench D)."""
    ID = 5.0                     # uA per side
    GMID = dict(pair=14, tail=8, load=8)
    VDS = dict(pair=0.65, tail=0.35, load=0.8)
    L_SWEEP = (0.5, 1, 2, 4)
    # bench D operating point
    VCM = 0.25                   # input common mode = V_ref1
    VO = 1.03                    # held output level: mid-code v(vo) from bench C
    VO_NEED = (0.99, 1.06)       # output range the loop uses (bench C)
    CM_MARGIN = 0.10
    SPECS = dict(gain_db_min=40.0, cm_tol_mv=1.0)


class ota_n:
    """NMOS-input folded-cascode OTA of the PMOS-side cascode, sized from a node plan."""
    VCM = VREF2
    I_TAIL = 20.0                # uA
    TOP_RATIO = 1.2              # I_TOP / I_TAIL
    MARGIN = 0.05
    I_T5 = (20, 40)              # uA, current range of the PMOS cascode T5 it drives
    V_FOLD = 1.5
    V_MIR = 0.18
    VDSAT_T1 = 0.20
    C_LOAD = 0.3e-12
    GMID = dict(pair=14, tail=8, mirror=14, ncasc=18, pcasc=8, ptop=8, t5=12)
    LEN = dict(pair=2, tail=2, mirror=2, ncasc=2, pcasc=2, ptop=2, t5=1)


class summing:
    """Bench E: summing stage with the real ladder, OTAs and clamps."""
    I1 = 10e-6                   # I1 during the code sweep; I2 = I_FS - I1
    R_TR = 33e3                  # clamp transresistance per delta-I node
    TRAN_EVENTS = [(20e-9, 63, 64), (120e-9, 64, 63), (220e-9, 63, 0), (320e-9, 0, 127), (420e-9, 127, 63)]
    SETTLE_BAND_LSB = 0.5
    SPECS = dict(
        inl_lsb_max=0.5,
        dnl_lsb_max=0.5,
        offset_lsb_max=0.5,
        lin_tol_lsb=0.25,
        op_margin_v=0.05,
        reg_err_mv_max=20.0,
        peaking_db_max=2.0,
    )


class clamp:
    """Bench F: the current-to-voltage clamp cell on each delta-I node."""
    VGATE = 1.8
    IB = 0.5e-6                  # bias of the PMOS diode XM2
    NODE_WINDOW = (0.50, 1.33)   # node range in which the bench E cascodes stay saturated
    WINDOW_MARGIN = 0.08
    I_SAR = 10e-6                # largest |delta-I| of a SAR sequence
    I_OVER = 20e-6               # over-range case
    CLAMP_ON = 1e-6              # XM1 current that counts as 'clamping'
    TRAN_EVENTS = [(20e-9, 0, 10e-6), (120e-9, 10e-6, 0), (220e-9, 0, -10e-6), (320e-9, -10e-6, 0),
                   (420e-9, 0, 20e-6), (520e-9, 20e-6, 0), (620e-9, 0, -20e-6), (720e-9, -20e-6, 0)]
    SETTLE_BAND = 2.5e-3
    SPECS = dict(
        vd_half_mv_min=5.0,      # differential voltage for +/-0.5 LSB of error current
        leak_lsb_max=0.1,
        v0_shift_mv_max=30.0,
        min_slope_frac=0.03,
        ac_dc_match_pct=10.0,
        peaking_db_max=1.0,
    )


class comparator:
    """Fig. 15 comparator: hand sizing and bench G."""
    # clocking within one bit cycle
    T_STEP = 2e-9                # inputs change
    T_EVAL = 70e-9               # phi1 rises: PMOS latch released
    # sizing inputs
    I_TAIL = 8.0                 # uA
    I_REF = 1.0                  # uA, mirror reference
    MARGIN = 0.05
    CM_MARGIN = 0.10             # extra common-mode window each side for corners
    CM_RANGE = (VCM_CMP - VCM_CMP_PP / 2 - CM_MARGIN, VCM_CMP + VCM_CMP_PP / 2 + CM_MARGIN)
    GMID = dict(pair=20, load=7, tail=14, latch=8)
    LEN = dict(pair=0.5, load=0.5, tail=1.0, latch=1.0)
    GM5_OVER_GM3 = 1.0
    SW = dict(T9=(1.0, 0.35), T78=(1.0, 0.15), T1011=(1.0, 0.15))   # (W, L) um
    CGG_FACTOR = 0.5
    C_WIRE_FF = 2.0
    C_Q_LOAD_FF = 13.0
    INJ_MISMATCH = 0.05
    GM_DERATE, C_DERATE = 0.7, 1.1
    V_CONNECT = 1.0
    N_TAU_LATCH = 2.0
    # what the ADC asks of it
    VIN_MIN = 0.5 * V_LSB_CMP
    SPECS = dict(
        t_dec_ns_max=15.0,
        noise_mv_max=0.25 * V_LSB_CMP * 1e3,
        offset_3sigma_mv_max=5.0,
        c_in_ff_max=15.0,
        kick_loop_max=0.2,
        kick_resid_lsb_max=0.1,
        # bench G
        offset_mv_max=1.0,
        hyst_mv_max=0.5,
        reset_resid_mv_max=20.0,
        reset_ab_mv_max=30.0,
        pair_vds_v_min=0.2,
    )
    # bench G stimulus
    OVERDRIVE_B = 5e-3
    DEC_FRAC, FULL_FRAC = 0.5, 0.9
    SAMPLE_BEFORE_END = 3e-9


def comparator_plan():
    """(group, common mode, differential) for every bit cycle of bench G."""
    cyc = [('A', VCM_CMP, s * mag * 1e-3) for mag in (0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50, 100) for s in (+1, -1)]
    cyc += [('B', vcm, d * 1e-3) for vcm in (0.6, 0.7, 0.8, 0.9, 0.949, 1.0, 1.1, 1.2, 1.3) for d in (5, -5, 1, -1)]
    ramp = [-12 + 0.25 * i for i in range(97)]
    cyc += [('C+', VCM_CMP, d * 1e-3) for d in ramp]
    cyc += [('C-', VCM_CMP, d * 1e-3) for d in ramp[::-1]]
    return cyc


class vi:
    """Fig. 16 V-to-I converter: OTA-driven NMOS source followers into resistor R."""
    V_FS_DESIGN = 0.6            # differential peak-to-peak full scale the sizing aims for
    R_GUARD = 0.05               # R = V_FS / I_FS x (1 + R_GUARD)
    R_OHM = 31.47e3              # as built: XR1, res_high_po_0p35, L = 30.7 um
    V_FS = R_OHM * I_FS_MEAS     # circuit full scale (differential peak-to-peak)
    VD_PEAK = 0.27               # differential peak actually driven (each input +/- VD_PEAK / 2)
    EDGE_SKIP = 1 - VD_PEAK / (V_FS / 2)
    VCM = 0.45                   # input common mode of the bench run
    MARGIN = 0.05
    C_COMP_FF = 200.0            # compensation cap on each OTA output (netlist cg)
    GMID = dict(t=12, sink=14)
    LEN = dict(t=1, sink=8.0)
    # folded-cascode OTA (PMOS-lvt input pair)
    FC_ID = 5.0
    FC_RATIO = 1.2
    FC_GMID = dict(pair=14, tail=10, sink=14, ncasc=16, pcasc=14, mir=12)
    FC_L = dict(pair=1, tail=2, sink=2, ncasc=1, pcasc=1, mir=2)
    RB_OTA = 10                  # OTA bias mirror ratio
    RSK = 10                     # sink mirror ratio
    CGG_FACTOR = 0.67
    C_WIRE_FF = 3.0
    KAPPA_A = 0.2                # fractional OTA-gain variation over its output swing
    VCR_PPM_PER_V = 50.0         # resistor voltage coefficient
    BW_NOISE = 10e6
    SETTLE_CYCLES = 3
    # bench
    CM_TOL = 0.10
    VREF2_TOL = 0.10
    T_WIN, M_PER, N_FFT = 256e-6, 29, 4096
    STEP_TIMES = (200e-9, 1000e-9, 1800e-9)
    SPECS = dict(
        inl_lsb_max=0.25,
        noise_lsb_max=0.1,
        offset_lsb_max=2.0,
        sum_err_lsb_max=0.5,
        cm_lsb_max=0.25,
        thd_db_max=-50.0,
        settle_ns_max=SETTLE_CYCLES * T_BIT * 1e9,
        pm_deg_min=60.0,
        op_margin_v=0.05,
        follow_mv_max=5.0,
    )


class adc:
    """Full converter, streamed transient (one conversion per microsecond)."""
    T_CONV = 1 / F_CONV
    T_SAR = 1040e-9              # SAR register bits d6..d1 read here (+ n T_CONV)
    T_OUT = 1055e-9              # d_out and eoc read here
    T_IDD = (60e-9, 1050e-9)     # supply-current averaging window within a conversion
    SINE_N, SINE_M = 128, 11     # samples and cycles of the coherent sine (netlist sn, sm)
    H_MAX = 9
    OUTLIER_LSB = 3
    SMOOTH_LSB = 8
    SINE_TOL = 1.5
    SPECS = dict(inl_lsb_max=0.5, enob_min=6.5, thd_db_max=-45.0, sfdr_db_min=45.0)

