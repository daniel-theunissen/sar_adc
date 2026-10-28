import sys
import numpy as np
import matplotlib.pyplot as plt

fname = sys.argv[1] if len(sys.argv) > 1 else "dac_tb.txt"
d = np.loadtxt(fname, skiprows=1)
code = d[:, 1].astype(int)
vout = d[:, 2]

# sort by code and drop any duplicate codes (keep the last write)
order = np.argsort(code, kind="stable")
code, vout = code[order], vout[order]
_, idx = np.unique(code[::-1], return_index=True)
keep = len(code) - 1 - idx
code, vout = code[np.sort(keep)], vout[np.sort(keep)]

N = int(np.ceil(np.log2(code.max() + 1)))
n_codes = code.max() + 1
assert len(code) == n_codes, f"expected {n_codes} codes, got {len(code)}"

# ---------- ideal LSB definitions ----------
lsb_ep = (vout[-1] - vout[0]) / (n_codes - 1)           # endpoint LSB
p = np.polyfit(code, vout, 1)                            # best-fit line
lsb_bf = p[0]
offset = vout[0]                                         # output at code 0
fs_span = vout[-1] - vout[0]

# ---------- DNL / INL (endpoint) ----------
dnl_ep = np.diff(vout) / lsb_ep - 1
inl_ep = (vout - (vout[0] + code * lsb_ep)) / lsb_ep

# ---------- DNL / INL (best fit) ----------
dnl_bf = np.diff(vout) / lsb_bf - 1
inl_bf = (vout - np.polyval(p, code)) / lsb_bf

# ---------- other specs ----------
steps = np.diff(vout)
monotonic = np.all(steps > 0)
non_mono_codes = np.where(steps <= 0)[0] + 1
missing = np.where(dnl_ep <= -1)[0] + 1                  # DNL <= -1 LSB
gain_error_lsb = (vout[-1] - vout[0]) / lsb_bf - (n_codes - 1)
# effective resolution implied by worst-case INL (endpoint)
inl_max = np.max(np.abs(inl_ep))
enob_inl = N - np.log2(max(2 * inl_max, 1))              # rough, assumes +/- INL

print(f"Resolution:            {N} bits ({n_codes} codes)")
print(f"Offset (code 0):       {offset*1e3:.4f} mV  ({offset/lsb_ep:.3f} LSB)")
print(f"Full-scale span:       {fs_span*1e3:.4f} mV")
print(f"LSB (endpoint):        {lsb_ep*1e6:.3f} uV")
print(f"LSB (best fit):        {lsb_bf*1e6:.3f} uV")
print(f"Gain error vs fit:     {gain_error_lsb:.3f} LSB")
print()
print("Endpoint-referenced:")
print(f"  DNL: {dnl_ep.min():+.3f} / {dnl_ep.max():+.3f} LSB  (max |DNL| = {np.max(np.abs(dnl_ep)):.3f} at code {np.argmax(np.abs(dnl_ep))+1})")
print(f"  INL: {inl_ep.min():+.3f} / {inl_ep.max():+.3f} LSB  (max |INL| = {inl_max:.3f} at code {np.argmax(np.abs(inl_ep))})")
print("Best-fit-referenced:")
print(f"  DNL: {dnl_bf.min():+.3f} / {dnl_bf.max():+.3f} LSB")
print(f"  INL: {inl_bf.min():+.3f} / {inl_bf.max():+.3f} LSB")
print()
print(f"Monotonic:             {monotonic}")
if not monotonic:
    print(f"  non-monotonic at codes: {non_mono_codes.tolist()}")
print(f"Missing codes:         {missing.tolist() if len(missing) else 'none'}")
print(f"Approx. effective bits from INL: {enob_inl:.2f}")

# worst major-carry transitions (binary-weighted ladders fail here first)
carries = [2**k for k in range(1, N)]
print("\nDNL at major carries (endpoint):")
for c in carries:
    print(f"  {c-1:3d} -> {c:3d}: {dnl_ep[c-1]:+.3f} LSB")

# ---------- plots ----------
fig, ax = plt.subplots(3, 1, figsize=(8, 9), sharex=True)
ax[0].plot(code, vout * 1e3, ".-")
ax[0].set_ylabel("Vout (mV)")
ax[0].grid(True)
ax[1].step(code[1:], dnl_ep, where="mid")
ax[1].axhline(0, color="k", lw=0.5)
# ax[1].axhline(-1, color="r", lw=0.5, ls="--")
ax[1].set_ylabel("DNL (LSB)")
ax[1].grid(True)
ax[2].plot(code, inl_ep, ".-", label="endpoint")
ax[2].plot(code, inl_bf, ".-", label="best fit")
ax[2].axhline(0, color="k", lw=0.5)
ax[2].set_ylabel("INL (LSB)")
ax[2].set_xlabel("code")
ax[2].legend()
ax[2].grid(True)
plt.tight_layout()
plt.show()