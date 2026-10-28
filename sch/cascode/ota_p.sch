v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 270 -70 270 -0 {lab=Vout}
N 80 -70 80 -0 {lab=#net1}
N 120 30 230 30 {lab=#net1}
N 170 -20 170 30 {lab=#net1}
N 80 -20 170 -20 {lab=#net1}
N 270 60 270 80 {lab=GND}
N 80 60 80 80 {lab=GND}
N 80 -150 80 -130 {lab=Vx}
N 80 -150 270 -150 {lab=Vx}
N 270 -150 270 -130 {lab=Vx}
N 170 -180 170 -150 {lab=Vx}
N 270 -40 300 -40 {lab=Vout}
N 170 -270 170 -240 {lab=VDD}
C {sky130_fd_pr/pfet3_01v8.sym} 60 -100 0 0 {name=M1
W=25
L=2
body=VDD
nf=5
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 290 -100 0 1 {name=M2
W=25
L=2
body=VDD
nf=5
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 100 30 0 1 {name=M3
W=1.5
L=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 250 30 0 0 {name=M4
W=1.5
L=2
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
C {sky130_fd_pr/pfet3_01v8.sym} 190 -210 0 1 {name=M5
W=10
L=2
body=VDD
nf=2
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 40 -100 0 0 {name=p1 sig_type=std_logic lab=Vp}
C {lab_pin.sym} 310 -100 0 1 {name=p2 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 300 -40 0 1 {name=p3 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 170 -150 1 1 {name=p4 sig_type=std_logic lab=Vx}
C {lab_pin.sym} 210 -210 0 1 {name=p5 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 170 -270 0 1 {name=p6 sig_type=std_logic lab=VDD}
C {ipin.sym} -130 -120 0 0 {name=p13 lab=Vbias}
C {opin.sym} -130 -30 0 0 {name=p15 lab=Vout}
C {iopin.sym} -130 -190 0 0 {name=p19 lab=VDD}
C {lab_pin.sym} -130 -190 0 0 {name=p20 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} -130 -120 0 1 {name=p10 sig_type=std_logic lab=Vbias}
C {iopin.sym} -130 -160 0 0 {name=p11 lab=GND}
C {lab_pin.sym} -130 -160 0 0 {name=p12 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} -130 -90 0 0 {name=p14 lab=Vp}
C {lab_pin.sym} -130 -90 0 1 {name=p16 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -130 -30 0 0 {name=p17 sig_type=std_logic lab=Vout}
C {ipin.sym} -130 -60 0 0 {name=p37 lab=Vn}
C {lab_pin.sym} -130 -60 0 1 {name=p38 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 80 80 0 0 {name=p7 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 270 80 0 0 {name=p8 sig_type=std_logic lab=GND
only_toplevel=true}
C {sky130_fd_pr/annotate_fet_params.sym} 290 -300 0 0 {name=annot1 ref=M5}
C {sky130_fd_pr/annotate_fet_params.sym} 380 -160 0 0 {name=annot2 ref=M2}
C {sky130_fd_pr/annotate_fet_params.sym} 390 -30 0 0 {name=annot3 ref=M4}
