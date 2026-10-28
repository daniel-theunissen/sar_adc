N_BITS = 7
CYCLES_PER_TICK = 10
TICKS_PER_CONV = 10
CYCLES_PER_CONV = CYCLES_PER_TICK * TICKS_PER_CONV


def expected_code(vin):
    return min(int(vin * 2 ** N_BITS), 2 ** N_BITS - 1)


def expected_phases(tick, cyc):
    comparing = tick >= 3
    phi1 = int(comparing and cyc >= 6)
    phi2 = int(not (comparing and cyc >= 7))
    return phi1, phi2


def expected_sar(tick, code):
    if tick < 3:
        return 0
    b = 9 - tick
    return ((code >> (b + 1)) << (b + 1)) | (1 << b)


def check_trace(trace, vins):
    """trace: one dict per clock cycle (phi1, phi2, sar, eoc, d, t) sampled just after the rising edge.
    vins[j] is the input held during the j-th conversion seen after the first eoc."""
    errors = []
    eocs = [i for i, s in enumerate(trace) if s['eoc']]
    if not eocs:
        return ['no eoc seen']
    e0 = eocs[0]
    for a, b in zip(eocs, eocs[1:]):
        if b - a != CYCLES_PER_CONV:
            errors.append(f'eoc spacing {b - a} cycles at index {b}')
    n_conv = min(len(vins), (len(trace) - e0) // CYCLES_PER_CONV)
    for j in range(n_conv):
        code = expected_code(vins[j])
        for k in range(CYCLES_PER_CONV):
            s = trace[e0 + j * CYCLES_PER_CONV + k]
            tick, cyc = divmod(k, CYCLES_PER_TICK)
            e1, e2 = expected_phases(tick, cyc)
            where = f'conv {j} tick {tick} cycle {cyc} (t={s["t"]} ns)'
            if (s['phi1'], s['phi2']) != (e1, e2):
                errors.append(f'{where}: phi1/phi2 = {s["phi1"]}{s["phi2"]}, expected {e1}{e2}')
            if s['phi2'] == 0 and s['phi1'] == 0:
                errors.append(f'{where}: comparator released without phi1')
            if s['sar'] != expected_sar(tick, code):
                errors.append(f'{where}: sar_reg = {s["sar"]:07b}, expected {expected_sar(tick, code):07b}')
            if s['eoc'] != int(k == 0):
                errors.append(f'{where}: eoc = {s["eoc"]}')
        end = trace[e0 + (j + 1) * CYCLES_PER_CONV] if e0 + (j + 1) * CYCLES_PER_CONV < len(trace) else None
        if end is not None and end['d'] != code:
            errors.append(f'conv {j}: d_out = {end["d"]}, expected {code} for vin = {vins[j]:.4f}')
    return errors