import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np


# # --- Plot Setup ---
# fig, ax = plt.subplots(figsize=(10, 8))
# fig.patch.set_facecolor('white')

# # Axis formatting
# ax.set_ylim(-6.0, 0.5)
# ax.set_xlim(-0.2, 4.2)
# ax.set_ylabel("Energy (eV)", fontsize=12)
# ax.set_xticks([0.5, 2.0, 3.5])
# ax.set_xticklabels(["ITO\n(Anode)", "MEH-PPV\n(Active Layer)", "EGaIn\n(Cathode)"], fontsize=12, fontweight='bold')
# ax.spines['top'].set_visible(False)
# ax.spines['right'].set_visible(False)
# ax.spines['bottom'].set_linewidth(1.5)
# ax.spines['left'].set_linewidth(1.5)
# ax.tick_params(width=1.5)
# ax.set_title("OLED Energy Band & Charge Transport Diagram", fontsize=16, pad=20, fontweight='bold')

# # Vacuum Level
# ax.axhline(0, color='gray', linestyle='--', linewidth=1.5)
# ax.text(2.0, 0.1, 'Vacuum Level', ha='center', va='bottom', color='gray', fontsize=11, fontstyle='italic')

# # --- Draw Energy Levels ---
# lw = 3.5
# # ITO Work Function
# ax.hlines(-4.7, 0, 1, colors='#1f77b4', linewidth=lw)
# # MEH-PPV LUMO & HOMO
# ax.hlines(-3.0, 1.2, 2.8, colors='#2ca02c', linewidth=lw)
# ax.hlines(-5.3, 1.2, 2.8, colors='#2ca02c', linewidth=lw)
# # EGaIn Work Function
# ax.hlines(-4.1, 3.0, 4.0, colors='#ff7f0e', linewidth=lw)

# # Vertical boundaries
# ax.vlines(1.1, -6, 0, colors='gray', linestyles=':', alpha=0.5)
# ax.vlines(2.9, -6, 0, colors='gray', linestyles=':', alpha=0.5)

# # --- Annotate Energy Values ---
# arrow_style = dict(arrowstyle='<|-|>', color='black', lw=1.2)
# text_bbox = dict(facecolor='white', edgecolor='none', alpha=0.8, pad=2)

# ax.annotate('', xy=(0.5, 0), xytext=(0.5, -4.7), arrowprops=arrow_style)
# ax.text(0.35, -2.35, '4.7 eV', va='center', ha='right', bbox=text_bbox)

# ax.annotate('', xy=(3.5, 0), xytext=(3.5, -4.1), arrowprops=arrow_style)
# ax.text(3.65, -2.05, '4.1 eV', va='center', ha='left', bbox=text_bbox)

# ax.text(1.25, -2.9, 'LUMO (3.0 eV)', ha='left', va='bottom', fontsize=10, color='#2ca02c')
# ax.text(1.25, -5.4, 'HOMO (5.3 eV)', ha='left', va='top', fontsize=10, color='#2ca02c')

# ax.annotate('', xy=(1.5, -3.0), xytext=(1.5, -5.3), arrowprops=arrow_style)
# ax.text(1.65, -4.15, 'Eg = 2.3 eV', va='center', ha='left', bbox=text_bbox, color='green', fontweight='bold')

# # --- Charge Transport & Recombination ---
# # # Hole injection (ITO -> HOMO)
# # ax.plot([0.5, 0.8], [-4.5, -4.5], marker='o', markersize=14, markerfacecolor='white', markeredgecolor='red', mew=1.5, ls='')
# # ax.text(0.5, -4.5, '+', ha='center', va='center', color='red', fontsize=12, fontweight='bold')
# # ax.text(0.8, -4.5, '+', ha='center', va='center', color='red', fontsize=12, fontweight='bold')

# # ax.annotate('', xy=(1.5, -5.1), xytext=(0.8, -4.5),
# #              arrowprops=dict(arrowstyle='->', color='red', lw=2, connectionstyle="arc3,rad=-0.3"))

# # # Holes in HOMO
# # holes_ppv = [1.8, 2.2, 2.6]
# # for hx in holes_ppv:
# #     ax.plot(hx, -5.5, marker='o', markersize=14, markerfacecolor='white', markeredgecolor='red', mew=1.5)
# #     ax.text(hx, -5.5, '+', ha='center', va='center', color='red', fontsize=12, fontweight='bold')

# # # Electron injection (EGaIn -> LUMO)
# # ax.plot([3.2, 3.5], [-3.9, -3.9], marker='o', markersize=14, markerfacecolor='white', markeredgecolor='blue', mew=1.5, ls='')
# # ax.text(3.2, -3.9, '-', ha='center', va='center', color='blue', fontsize=14, fontweight='bold')
# # ax.text(3.5, -3.9, '-', ha='center', va='center', color='blue', fontsize=14, fontweight='bold')

# # ax.annotate('', xy=(2.5, -3.2), xytext=(3.2, -3.9),
# #              arrowprops=dict(arrowstyle='->', color='blue', lw=2, connectionstyle="arc3,rad=-0.3"))

# # # Electrons in LUMO
# # elec_ppv = [1.8, 2.2, 2.6]
# # for ex in elec_ppv:
# #     ax.plot(ex, -2.8, marker='o', markersize=14, markerfacecolor='white', markeredgecolor='blue', mew=1.5)
# #     ax.text(ex, -2.8, '-', ha='center', va='center', color='blue', fontsize=14, fontweight='bold')

# # # Recombination (Electrons dropping to HOMO)
# # for x in elec_ppv:
# #     ax.annotate('', xy=(x, -5.1), xytext=(x, -3.0),
# #                  arrowprops=dict(arrowstyle='->', color='purple', lw=2.5, ls='solid'))
                 
# # # Photon emission indicator
# # ax.annotate('Photon\nEmission ($h\\nu$)', xy=(2.2, -4.15), xytext=(2.8, -4.15),
# #             arrowprops=dict(arrowstyle='<-', color='orange', lw=2, ls='dashed'),
# #             ha='left', va='center', color='darkorange', fontweight='bold')

# plt.tight_layout()
# plt.show()

# Load the SPICE data
# Assumes 'led.txt' is in the same directory as this script
try:
    data = np.loadtxt('/home/dt/Documents/LTspice/led.txt', skiprows=1)
    voltage = data[:, 0]
    current = data[:, 1]
except FileNotFoundError:
    print("Error: 'led.txt' not found. Please ensure the file is in the same directory.")
    exit()

# --- Plot Setup ---
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))
fig.patch.set_facecolor('white')

def format_axes(ax, title):
    """Utility to format the axes cleanly."""
    ax.set_title(title, fontsize=14, pad=15, fontweight='bold')
    ax.set_xlabel("Voltage (V)", fontsize=12, fontweight='bold')
    ax.set_ylabel("Current (A)", fontsize=12, fontweight='bold')
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['bottom'].set_linewidth(1.5)
    ax.spines['left'].set_linewidth(1.5)
    ax.tick_params(width=1.5, labelsize=11)
    ax.grid(True, linestyle='--', alpha=0.4)

# ==========================================
# Subplot 1: Linear Scale (Standard I-V)
# ==========================================
format_axes(ax1, "LXK2-PW14 I-V Curve (Linear Scale)")
ax1.plot(voltage, current, color='#1f77b4', linewidth=3.5)
ax1.fill_between(voltage, current, color='#1f77b4', alpha=0.1)

# Annotate approximate turn-on region
ax1.annotate('Turn-on Voltage\n(~2.5V)', xy=(2.6, 0.1), xytext=(1.0, 1.0),
             arrowprops=dict(facecolor='black', shrink=0.05, width=1.5, headwidth=8),
             fontsize=11, fontweight='bold', ha='center')

ax1.set_xlim(0, 5.0)
ax1.set_ylim(0, max(current) * 1.05)

# ==========================================
# Subplot 2: Logarithmic Scale (Subthreshold)
# ==========================================
format_axes(ax2, "LXK2-PW14 I-V Curve (Log Scale)")

# Mask zeros to avoid log(0) warnings
valid_idx = current > 0
ax2.semilogy(voltage[valid_idx], current[valid_idx], color='#ff7f0e', linewidth=3.5)

# Annotate exponential growth region
ax2.annotate('Exponential Growth\n(Ideal Diode Region)', xy=(1.5, 1e-8), xytext=(3.0, 1e-12),
             arrowprops=dict(facecolor='black', shrink=0.05, width=1.5, headwidth=8),
             fontsize=11, fontweight='bold', ha='center')

ax2.set_xlim(0, 5.0)
ax2.set_ylim(1e-14, 10)

plt.tight_layout()
plt.show()