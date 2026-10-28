v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 130 -170 180 -170 {lab=#net1}
N 220 -200 220 -170 {lab=Vmid}
N 160 -170 160 -140 {lab=#net1}
N 160 -140 220 -140 {lab=#net1}
N 220 -140 220 -90 {lab=#net1}
N 220 -200 430 -200 {lab=Vmid}
N 430 -210 430 -160 {lab=Vmid}
N 90 -140 90 -90 {lab=GND}
N 90 -270 430 -270 {lab=Iin_Vout}
N 90 -270 90 -200 {lab=Iin_Vout}
N 20 -170 90 -170 {lab=VDD}
C {sky130_fd_pr/nfet3_01v8.sym} 450 -240 0 1 {name=M3
W=6
L=9
body=GND
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} -120 -220 0 0 {name=p13 lab=Vmid}
C {iopin.sym} -120 -290 0 0 {name=p19 lab=VDD}
C {lab_pin.sym} -120 -290 0 0 {name=p20 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} -120 -220 0 1 {name=p10 sig_type=std_logic lab=Vmid}
C {iopin.sym} -120 -260 0 0 {name=p11 lab=GND}
C {lab_pin.sym} -120 -260 0 0 {name=p12 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} -120 -190 0 0 {name=p14 lab=Vgate}
C {lab_pin.sym} -120 -190 0 1 {name=p16 sig_type=std_logic lab=Vgate}
C {lab_pin.sym} 90 -90 0 0 {name=p1 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 430 -160 0 1 {name=p3 sig_type=std_logic lab=Vmid}
C {lab_pin.sym} 470 -240 0 1 {name=p4 sig_type=std_logic lab=Vgate}
C {lab_pin.sym} 20 -170 0 0 {name=p2 sig_type=std_logic lab=VDD
only_toplevel=true}
C {iopin.sym} -130 -130 0 0 {name=p5 lab=Iin_Vout}
C {lab_pin.sym} -130 -130 0 0 {name=p6 sig_type=std_logic lab=Iin_Vout
only_toplevel=true}
C {lab_pin.sym} 90 -270 0 0 {name=p7 sig_type=std_logic lab=Iin_Vout
only_toplevel=true}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 110 -170 0 1 {name=M1
W=15
L=1
nf=3
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 200 -170 0 0 {name=M2
W=15
L=1
nf=3
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {isource.sym} 220 -60 0 0 {name=Ib value=500n}
C {lab_pin.sym} 220 -30 0 0 {name=p8 sig_type=std_logic lab=GND
only_toplevel=true}
