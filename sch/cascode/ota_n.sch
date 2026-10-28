v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 380 -530 380 -500 {lab=VDD}
N 570 -530 570 -500 {lab=VDD}
N 570 -80 570 -50 {lab=GND}
N 380 -80 380 -50 {lab=GND}
N 50 -320 50 -270 {lab=Vfold}
N 240 -320 240 -270 {lab=#net1}
N 50 -210 50 -180 {lab=Vx}
N 50 -180 240 -180 {lab=Vx}
N 240 -210 240 -180 {lab=Vx}
N 150 -180 150 -140 {lab=Vx}
N 240 -360 240 -320 {lab=#net1}
N 570 -440 570 -380 {lab=Vfold}
N 380 -440 380 -380 {lab=#net1}
N 50 -380 50 -320 {lab=Vfold}
N 420 -470 610 -470 {lab=Vbiasp1}
N 420 -350 610 -350 {lab=Vbiasp2}
N 420 -110 530 -110 {lab=#net2}
N 150 -80 150 -50 {lab=GND}
N 570 -270 620 -270 {lab=Vout}
N 380 -170 380 -140 {lab=#net3}
N 420 -200 610 -200 {lab=Vbiasn2}
N 570 -170 570 -140 {lab=#net4}
N 240 -400 240 -360 {lab=#net1}
N 240 -400 380 -400 {lab=#net1}
N 50 -420 50 -380 {lab=Vfold}
N 50 -420 570 -420 {lab=Vfold}
N 570 -320 570 -230 {lab=Vout}
N 380 -320 380 -230 {lab=#net2}
N 380 -260 440 -260 {lab=#net2}
N 440 -260 440 -110 {lab=#net2}
C {sky130_fd_pr/nfet3_01v8.sym} 260 -240 0 1 {name=M3
W=7.5
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
C {ipin.sym} -180 -170 0 0 {name=p13 lab=Vbiasn2}
C {opin.sym} -180 -40 0 0 {name=p15 lab=Vout}
C {iopin.sym} -180 -250 0 0 {name=p19 lab=VDD}
C {lab_pin.sym} -180 -250 0 0 {name=p20 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} -180 -170 0 1 {name=p10 sig_type=std_logic lab=Vbiasn2}
C {iopin.sym} -180 -220 0 0 {name=p11 lab=GND}
C {lab_pin.sym} -180 -220 0 0 {name=p12 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} -180 -100 0 0 {name=p14 lab=Vp}
C {lab_pin.sym} -180 -100 0 1 {name=p16 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -180 -40 0 0 {name=p17 sig_type=std_logic lab=Vout}
C {ipin.sym} -180 -70 0 0 {name=p37 lab=Vn}
C {lab_pin.sym} -180 -70 0 1 {name=p38 sig_type=std_logic lab=Vn}
C {sky130_fd_pr/nfet3_01v8.sym} 30 -240 0 0 {name=M2
W=7.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 400 -110 0 1 {name=M4
W=14
L=2
body=GND
nf=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 550 -110 0 0 {name=M5
W=14
L=2
body=GND
nf=2
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
C {sky130_fd_pr/pfet3_01v8.sym} 400 -470 0 1 {name=M8
W=26.5
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
C {sky130_fd_pr/pfet3_01v8.sym} 590 -470 0 1 {name=M9
W=26.5
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
C {lab_pin.sym} 380 -530 0 0 {name=p1 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 570 -530 0 1 {name=p2 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 380 -50 0 0 {name=p3 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 570 -50 0 1 {name=p4 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 280 -240 0 1 {name=p6 sig_type=std_logic lab=Vp}
C {lab_pin.sym} 10 -240 0 0 {name=p7 sig_type=std_logic lab=Vn}
C {ipin.sym} -180 -150 0 0 {name=p18 lab=Vbiasp1}
C {lab_pin.sym} -180 -150 0 1 {name=p21 sig_type=std_logic lab=Vbiasp1}
C {ipin.sym} -180 -130 0 0 {name=p24 lab=Vbiasp2}
C {lab_pin.sym} -180 -130 0 1 {name=p25 sig_type=std_logic lab=Vbiasp2}
C {sky130_fd_pr/nfet3_01v8.sym} 130 -110 0 0 {name=M1
W=5.5
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
C {sky130_fd_pr/pfet3_01v8.sym} 400 -350 0 1 {name=M6
W=13
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
C {sky130_fd_pr/pfet3_01v8.sym} 590 -350 0 1 {name=M7
W=13
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
C {lab_pin.sym} 150 -50 0 0 {name=p5 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 620 -270 0 1 {name=p8 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 610 -470 0 1 {name=p9 sig_type=std_logic lab=Vbiasp1}
C {lab_pin.sym} 610 -350 0 1 {name=p22 sig_type=std_logic lab=Vbiasp2}
C {lab_pin.sym} 110 -110 0 0 {name=p23 sig_type=std_logic lab=Vbiasn1}
C {lab_pin.sym} 150 -180 3 1 {name=p26 sig_type=std_logic lab=Vx}
C {sky130_fd_pr/nfet3_01v8.sym} 590 -200 0 1 {name=M10
W=26.5
L=2
body=GND
nf=5
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
C {sky130_fd_pr/nfet3_01v8.sym} 400 -200 0 1 {name=M11
W=26.5
L=2
body=GND
nf=5
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
C {lab_pin.sym} 610 -200 0 1 {name=p27 sig_type=std_logic lab=Vbiasn2}
C {ipin.sym} -180 -190 0 0 {name=p28 lab=Vbiasn1}
C {lab_pin.sym} -180 -190 0 1 {name=p29 sig_type=std_logic lab=Vbiasn1}
C {lab_pin.sym} 150 -420 3 1 {name=p30 sig_type=std_logic lab=Vfold}
