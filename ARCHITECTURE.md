# Architecture

7-bit, 1 MS/s current-mode SAR ADC in sky130A at VDD = 1.8 V, after the current-mode converter of Hammerschmied & Huang (figure numbers below refer to that paper). Every number in this document comes from [`sch/sarlib/specs.py`](sch/sarlib/specs.py) or from the notebooks' current outputs. Symbols in `code font` are the names used there.

## Signal chain

```
 V+ ─┐                     I1 ──► i1 ─ PMOS reg. cascode ─┐                    ┌─ clamp ─ V_MID
     ├─ V-to-I (Fig. 16) ─┤      (held at V_ref2)        ├─► di_p ─┐          │
 V- ─┘                     I2 ──► i2 ─ PMOS reg. cascode ─┼─► di_n ─┼─ comparator ─► SAR logic ─► code
                                                          │         │  (Fig. 15)      (rtl/)       │
 I_FS ─ M2M ladder ─ I_D1 ──► dac1 ─ NMOS reg. cascode ───┘         └─ clamp ─ V_MID                │
                    I_D2 ──► dac2 ─ NMOS reg. cascode   (held at V_ref1)            ◄──────────────┘
```

1. The **V-to-I converter** turns the differential input into two complementary currents I1, I2 with I1 + I2 = I_FS.
2. The **M2M ladder** splits I_FS into I_D1 = k·I_LSB and I_D2 = I_FS − I_D1 for the trial code k.
3. **Regulated cascodes** hold the ladder outputs at V_ref1 and the input-current nodes at V_ref2, so neither current divides into a finite output resistance. Each delta-I node is where a PMOS cascode (input side) meets an NMOS cascode (ladder side). The current it carries is the difference.
4. A **clamp cell** (Fig. 14) on each delta-I node turns the error current into a voltage around V_MID and limits the swing.
5. The **comparator** (Fig. 15) decides the sign. The SAR controller ([`rtl/src/top.sv`](rtl/src/top.sv), co-simulated through [`sch/cosim/`](sch/cosim/)) sets the next bit.

## System quantities

| Quantity | Value | Name |
| --- | --- | --- |
| Resolution | 7 bit, 128 codes | `N_BITS`, `NCODE` |
| Conversion rate / bit cycle | 1 MS/s / 100 ns | `F_CONV`, `T_BIT` |
| Ladder full scale | 20 µA (measured 19.988 µA) | `I_FS`, `I_FS_MEAS` |
| LSB current | 156.25 nA (measured 156.16 nA) | `I_LSB`, `I_LSB_MEAS` |
| Regulated levels | V_ref1 = 0.25 V, V_ref2 = 1.55 V, V_MID = 0.9 V | `VREF1`, `VREF2`, `VMID` |
| V-to-I resistor | 31.47 kΩ (res_high_po_0p35, L = 30.7 µm) | `vi.R_OHM` |
| Input full scale | V_FS = R·I_FS,meas = 0.629 V p-p differential | `vi.V_FS` |
| Driven range | ±0.27 V differential | `vi.VD_PEAK` |

$$
I_\mathrm{LSB} = \frac{I_\mathrm{FS}}{2^N}, \qquad
V_\mathrm{LSB} = \frac{V_\mathrm{FS}}{2^N} = \frac{R\,I_\mathrm{FS}}{2^N} \approx 4.91\ \mathrm{mV}
$$

## Decision equation

With the trial code k on the ladder, the delta-I nodes carry

$$
\Delta I_p = I_{D1} - I_1 = k\,I_\mathrm{LSB} - I_1, \qquad
\Delta I_n = I_{D2} - I_2 = -(k\,I_\mathrm{LSB} - I_1)
$$

so the comparator sees $\Delta I_p - \Delta I_n = 2\,(k\,I_\mathrm{LSB} - I_1)$. A common-mode current ε (from mismatch between the 40 µA copies) adds equally to both and cancels. Substituting the V-to-I output gives the transition code

$$
k^* = \frac{I_1}{I_\mathrm{LSB}} = \frac{2^N}{2} + \frac{V_+ - V_-}{V_\mathrm{LSB}} .
$$

## V-to-I converter (Fig. 16)

Each side is an NMOS source follower (T1, T2) whose gate is driven by an OTA, so its source follows the input. An I_REF sink pulls each source node down, and R joins the two source nodes:

$$
I_{\mathrm{out}\pm} = I_\mathrm{REF} \pm \frac{V_+ - V_-}{R}, \qquad
I_\mathrm{REF} = \frac{I_\mathrm{FS}}{2}, \qquad
R = \frac{V_\mathrm{FS}}{I_\mathrm{FS}}\,(1 + R_\mathrm{guard})
$$

`R_GUARD` = 5 % keeps T1/T2 from reaching zero current at full scale. The resulting gain error is a scale factor the ADC reference absorbs.

**OTA.** A PMOS-lvt-input folded cascode with a wide-swing PMOS cascode mirror as the load. With I_fold = r·I_tail (`FC_RATIO` = 1.2), each cascode branch carries I_fold − I_tail/2. The gain is

$$
A = g_{m1}\,(R_\uparrow \parallel R_\downarrow), \quad
R_\uparrow = g_{m,pc}\,r_{o,pc}\,r_{o,mir} + r_{o,pc} + r_{o,mir}, \quad
R_\downarrow = g_{m,nc}\,r_{o,nc}\,r_\mathrm{fold} + r_{o,nc} + r_\mathrm{fold}
$$

**Common mode.** The notebook re-sizes every device at each candidate common mode, takes the worst slack over five headroom constraints, and picks the common mode with the most slack. That is 0.45 V (`vi.VCM`). The binding constraint is the OTA output reaching the T1 gate at full current: V_in,max + V_GS(T1, I_FS) ≤ V_out,max.

**Linearity.** The source error is the gate-drive curvature divided by the loop gain $A\,g_m/(g_m + g_{ds,sink} + 1/R)$. To that the model adds the OTA-gain variation over its swing, the sink output-impedance curvature and the resistor voltage coefficient, summed as a worst case.

**Settling.** Settling to ½ LSB takes $t = \ln(2^{N+1})\,\max(\tau_\mathrm{loop}, \tau_\mathrm{src})$ with $\tau_\mathrm{loop} = C_g / (g_{m,\mathrm{OTA}}\,f)$.

## Regulated cascodes and their OTAs

The ladder's output resistance R_out (`cascode.R_OUT` = 30 kΩ) must not divide the LSB current, which requires

$$
R_\mathrm{in} \approx \frac{1}{g_{m,T1}\,(1 + A_\mathrm{OTA})} < \frac{R_\mathrm{out}}{2^{N+1}} \approx 117\ \Omega .
$$

* **NMOS side (dac1/dac2 at V_ref1):** T1 is driven by a PMOS-input 5T OTA. Its gain is $A = g_{m}/(g_{ds,p} + g_{ds,n})$, and it must stay above 40 dB over the gate range the loop uses (bench D).
* **PMOS side (i1/i2 at V_ref2):** T5 is driven by an NMOS-input folded cascode (`ota_n`). Its output must sit at V_ref2 − V_SG(T5) over the 20–40 µA range of T5, so the node plan (V_fold, V_mir) is chosen around that window. The top current sources carry I_top = 1.2·I_tail, so a fully switched pair still leaves the cascodes biased.

## Clamp cell (Fig. 14)

XM3 (NMOS, linear region, gate at V_GATE) is the transresistance from the delta-I node to V_MID, with R0 = dV/dI at zero current. XM2 is a PMOS-lvt diode at V_MID carrying I_b. It biases the clamp XM1, which turns on only once the node rises above V_MID by the body-effect threshold difference |V_th1| − |V_th2|. For the comparator to resolve half an LSB of error current,

$$
V_d(\pm\tfrac12\,\mathrm{LSB}) = R_0\,I_\mathrm{LSB} \ge 5\ \mathrm{mV}
\;\Rightarrow\; R_0 \ge 32\ \mathrm{k\Omega},
$$

and the node must stay inside the window in which the bench E cascodes remain saturated (`clamp.NODE_WINDOW`) for ±10 µA, the largest SAR step.

## Comparator (Fig. 15)

NMOS pair T1/T2, PMOS-lvt latch/loads T3/T4, PMOS-lvt reset switch T9 and NMOS latch T5/T6. The clocks within each 100 ns bit cycle are: inputs step at 2 ns, `phi1` rises at 70 ns (`comparator.T_EVAL`) to release the PMOS latch, `phi2` falls 2 ns later to connect the NMOS latch, and the decision is read at 97 ns. The input node settles with τ = R_NODE·C_NODE = 3.5 ns.

$$
V_{AB} = V_{DD} - V_{SG,3}, \qquad
t_\mathrm{dec} = \tau\,\ln\!\Big(1 + \frac{V_\mathrm{conn}\,g_{m3}}{g_{m1}\,V_\mathrm{in}}\Big) + N_\tau\,\frac{C_Q}{g_{m5}}, \qquad
\tau = \frac{C_{ab}}{g_{m3}}
$$

$$
\overline{v_n^2} = \frac{2kT}{C_{ab}}\Big(\frac{g_{m3}}{g_{m1}}\Big)^2 + \frac{4kT\gamma\,(g_{m1}+g_{m3})}{g_{m1}^2\,\tau}, \qquad
\sigma_{os}^2 = \frac{A_{VT}^2}{W_1L_1} + \Big(\frac{g_{m3}}{g_{m1}}\Big)^2\frac{A_{VT}^2}{W_3L_3} + \sigma_\mathrm{inj}^2
$$

The reset must be monostable, which requires $g_\mathrm{on}(T9) \ge 3\,g_{m3}$. T9 needs the lvt device to turn on at the a/b level.

## ADC metrics

$$
\mathrm{ENOB} = \frac{\mathrm{SINAD} - 1.76 + 20\log_{10}(2^N / A_{pp})}{6.02}, \qquad
\mathrm{FoM_W} = \frac{P}{f_s\,2^{\mathrm{ENOB}}}
$$

INL and DNL are measured on a 513-point ramp (0.22 LSB steps). They are judged together with the floor that the same sweep gives for a perfect quantizer.

## Current results

| Block | Notebook | Key results |
| --- | --- | --- |
| ADC | `adc/adc_analysis` | ENOB 6.94, SINAD 42.1 dB, THD −57.6 dBc, SFDR 48.9 dBc; INL 0.086 LSB, no missing codes; 690 µW, 5.6 pJ/conv-step |
| V-to-I | `vi_converter/bench_vi_analysis` | INL 0.062 LSB, THD −70.7 dBc, PM ≥ 61°, settling 39.5 ns |
| Summing stage | `summing_stage/bench_e_analysis` | DAC INL 0.136 LSB, DNL 0.206 LSB, offset +0.10 LSB, 7.58 mV per code at the comparator |
| Clamp cell | `summing_stage/bench_f_analysis` | R0 = 33 kΩ, 5.16 mV for ½ LSB, leakage 0.053 LSB |
| Comparator | `comparator/bench_g_analysis` | 2.38 ns at ½ LSB, offset 0.00 mV, hysteresis 0.25 mV, works 0.6–1.3 V common mode |
| NMOS cascode | `cascode/bench_c_analysis` | R_in 20.9 Ω DC, PM 62–64°, f_u ≈ 37 MHz |
| PMOS-input OTA | `cascode/bench_d_analysis` | 43.9 dB, f_u 81 MHz |

### Open issues

Each of these is a FAIL in its notebook's summary table:

* **Comparator random offset:** 13.8 mV at 3σ against 5 mV (hand estimate). The common-mode window also misses its low end by 5 mV.
* **V-to-I random offset:** 2.70 LSB at 3σ against 2 LSB (hand estimate).
* **V-to-I bench:** the OTA fold sinks and mirror run at 25–35 mV of V_DS − V_DSAT. The I_out+ + I_out− error is 1.04 LSB and its common-mode sensitivity is 0.80 LSB, both against 0.5 LSB.
* **Summing stage:** XM1/XM5 have 46 mV of margin against 50 mV, and the transresistance is 8.4 % above 2·R_tr.
* **NMOS cascode:** |Z_in| reaches 119 Ω at 1 MHz against the 117 Ω budget.
* **Carried-over value:** `V_LSB_CMP` (10.9 mV, the comparator's ½-LSB target) predates the current clamp. Bench F now gives 2 × 5.16 = 10.3 mV, and bench E measures 7.58 mV per code in circuit.
