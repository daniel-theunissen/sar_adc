v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -60 170 -10 {lab=Vx}
N 90 -10 170 -10 {lab=Vx}
N 170 -10 260 -10 {lab=Vx}
N 130 130 220 130 {lab=#net1}
N 90 50 90 100 {lab=#net1}
N 260 50 260 100 {lab=Vout}
N 180 80 180 130 {lab=#net1}
N 90 80 180 80 {lab=#net1}
N 170 -150 170 -120 {lab=VDD}
N 90 160 90 190 {lab=GND}
N 260 160 260 190 {lab=GND}
N 260 70 310 70 {lab=Vout}
C {sky130_fd_pr/pfet3_01v8.sym} 70 20 0 0 {name=M1
W=40
L=2
body=VDD
nf=20
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
C {sky130_fd_pr/pfet3_01v8.sym} 280 20 0 1 {name=M2
W=40
L=2
body=VDD
nf=20
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
C {sky130_fd_pr/pfet3_01v8.sym} 150 -90 0 0 {name=M3
W=40
L=2
body=VDD
nf=20
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
C {sky130_fd_pr/nfet3_01v8.sym} 110 130 0 1 {name=M4
W=18
L=6
body=GND
nf=9
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
C {sky130_fd_pr/nfet3_01v8.sym} 240 130 0 0 {name=M5
W=18
L=6
body=GND
nf=9
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
C {lab_pin.sym} 50 20 0 0 {name=p1 sig_type=std_logic lab=Vp}
C {lab_pin.sym} 300 20 0 1 {name=p2 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 130 -90 0 0 {name=p3 sig_type=std_logic lab=Vb}
C {lab_pin.sym} 170 -150 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 90 190 0 0 {name=p5 sig_type=std_logic lab=GND}
C {lab_pin.sym} 260 190 0 0 {name=p6 sig_type=std_logic lab=GND}
C {lab_pin.sym} 310 70 0 1 {name=p7 sig_type=std_logic lab=Vout}
C {iopin.sym} -100 -200 0 1 {name=p8 lab=VDD}
C {ipin.sym} -100 -120 0 0 {name=p9 lab=Vp}
C {opin.sym} -100 -10 0 1 {name=p10 lab=Vout}
C {lab_pin.sym} -100 -200 0 1 {name=p11 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -100 -170 0 1 {name=p12 sig_type=std_logic lab=GND}
C {iopin.sym} -100 -170 0 1 {name=p13 lab=GND}
C {lab_pin.sym} -100 -120 0 1 {name=p14 sig_type=std_logic lab=Vp}
C {ipin.sym} -100 -90 0 0 {name=p15 lab=Vn}
C {lab_pin.sym} -100 -90 0 1 {name=p16 sig_type=std_logic lab=Vn}
C {ipin.sym} -100 -60 0 0 {name=p17 lab=Vb}
C {lab_pin.sym} -100 -60 0 1 {name=p18 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -100 -10 0 1 {name=p19 sig_type=std_logic lab=Vout}
C {sky130_fd_pr/annotate_fet_params.sym} 400 -90 0 0 {name=annot1 ref=M2}
C {sky130_fd_pr/annotate_fet_params.sym} 410 50 0 0 {name=annot2 ref=M5}
C {lab_pin.sym} 170 -10 3 0 {name=p20 sig_type=std_logic lab=Vx}
C {sky130_fd_pr/annotate_fet_params.sym} 280 -220 0 0 {name=annot3 ref=M3}
