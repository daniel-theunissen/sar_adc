v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 120 -30 300 -30 {lab=Vx}
N 210 -30 210 20 {lab=Vx}
N 160 -180 260 -180 {lab=#net1}
N 120 -150 120 -90 {lab=#net1}
N 210 -180 210 -130 {lab=#net1}
N 120 -130 210 -130 {lab=#net1}
N 300 -150 300 -90 {lab=Vout}
N 120 -250 120 -210 {lab=VDD}
N 300 -250 300 -210 {lab=VDD}
N 210 80 210 110 {lab=GND}
C {sky130_fd_pr/nfet3_01v8.sym} 100 -60 0 0 {name=M5
W=24
L=6
body=GND
nf=12
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
C {sky130_fd_pr/nfet3_01v8.sym} 190 50 0 0 {name=M7
W=24
L=2
body=GND
nf=12
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
C {sky130_fd_pr/pfet3_01v8.sym} 140 -180 0 1 {name=M8
W=10
L=1
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
C {sky130_fd_pr/pfet3_01v8.sym} 280 -180 0 0 {name=M9
W=10
L=1
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
C {lab_pin.sym} 120 -250 0 0 {name=p20 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 300 -250 0 1 {name=p21 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 210 110 0 0 {name=p22 sig_type=std_logic lab=GND}
C {lab_pin.sym} 80 -60 0 0 {name=p1 sig_type=std_logic lab=Vp}
C {lab_pin.sym} 340 -60 0 1 {name=p2 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 170 50 0 0 {name=p3 sig_type=std_logic lab=Vb}
C {lab_pin.sym} 300 -120 0 1 {name=p4 sig_type=std_logic lab=Vout}
C {sky130_fd_pr/annotate_fet_params.sym} 420 -130 0 0 {name=annot1 ref=M1}
C {sky130_fd_pr/annotate_fet_params.sym} 410 -290 0 0 {name=annot2 ref=M9}
C {sky130_fd_pr/annotate_fet_params.sym} 330 0 0 0 {name=annot3 ref=M7}
C {lab_pin.sym} 210 -30 1 0 {name=p5 sig_type=std_logic lab=Vx}
C {sky130_fd_pr/nfet3_01v8.sym} 320 -60 0 1 {name=M1
W=24
L=6
body=GND
nf=12
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
