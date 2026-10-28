v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 90 -180 90 -140 {lab=#net1}
N 90 -180 270 -180 {lab=#net1}
N 270 -180 270 -140 {lab=#net1}
N 180 -220 180 -180 {lab=#net1}
N 270 -80 270 -10 {lab=#net2}
N 270 -10 760 -10 {lab=#net2}
N 90 -80 90 10 {lab=#net3}
N 90 20 460 20 {lab=#net3}
N 460 -20 460 40 {lab=#net3}
N 760 -20 760 40 {lab=#net2}
N 460 -260 460 -80 {lab=#net4}
N 760 -260 760 -80 {lab=Vout}
N 500 -50 800 -50 {lab=Vbiasn2}
N 500 -290 800 -290 {lab=Vbiasp2}
N 500 70 800 70 {lab=Vbiasn1}
N 500 -410 720 -410 {lab=#net4}
N 460 -380 460 -320 {lab=#net5}
N 760 -380 760 -320 {lab=#net6}
N 580 -410 580 -200 {lab=#net4}
N 460 -200 580 -200 {lab=#net4}
N 90 10 90 20 {lab=#net3}
N 180 -310 180 -280 {lab=VDD}
N 460 100 460 120 {lab=GND}
N 760 100 760 120 {lab=GND}
N 460 -470 460 -440 {lab=VDD}
N 760 -470 760 -440 {lab=VDD}
N 760 -180 800 -180 {lab=Vout}
C {sky130_fd_pr/nfet3_01v8.sym} 480 -50 0 1 {name=M3
W=4.6
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 780 -50 0 1 {name=M4
W=4.6
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 480 70 0 1 {name=M5
W=12
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
C {sky130_fd_pr/nfet3_01v8.sym} 780 70 0 1 {name=M6
W=12
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
C {sky130_fd_pr/pfet3_01v8.sym} 480 -290 0 1 {name=M7
W=15.6
L=1
body=VDD
nf=3
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
C {sky130_fd_pr/pfet3_01v8.sym} 780 -290 0 1 {name=M8
W=15.6
L=1
body=VDD
nf=3
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
C {sky130_fd_pr/pfet3_01v8.sym} 480 -410 0 1 {name=M9
W=22.6
L=2
body=VDD
nf=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 740 -410 0 0 {name=M10
W=22.6
L=2
body=VDD
nf=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 160 -250 0 0 {name=M11
W=17.7
L=2
body=VDD
nf=3
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
C {ipin.sym} -110 -170 0 0 {name=p13 lab=Vbiasn2}
C {opin.sym} -110 -40 0 0 {name=p15 lab=Vout}
C {iopin.sym} -110 -250 0 0 {name=p19 lab=VDD}
C {lab_pin.sym} -110 -250 0 0 {name=p20 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} -110 -170 0 1 {name=p10 sig_type=std_logic lab=Vbiasn2}
C {iopin.sym} -110 -220 0 0 {name=p11 lab=GND}
C {lab_pin.sym} -110 -220 0 0 {name=p12 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} -110 -100 0 0 {name=p14 lab=Vp}
C {lab_pin.sym} -110 -100 0 1 {name=p16 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -110 -40 0 0 {name=p17 sig_type=std_logic lab=Vout}
C {ipin.sym} -110 -70 0 0 {name=p37 lab=Vn}
C {lab_pin.sym} -110 -70 0 1 {name=p38 sig_type=std_logic lab=Vn}
C {ipin.sym} -110 -150 0 0 {name=p18 lab=Vbiasp1}
C {lab_pin.sym} -110 -150 0 1 {name=p21 sig_type=std_logic lab=Vbiasp1}
C {ipin.sym} -110 -130 0 0 {name=p24 lab=Vbiasp2}
C {lab_pin.sym} -110 -130 0 1 {name=p25 sig_type=std_logic lab=Vbiasp2}
C {ipin.sym} -110 -190 0 0 {name=p28 lab=Vbiasn1}
C {lab_pin.sym} -110 -190 0 1 {name=p29 sig_type=std_logic lab=Vbiasn1}
C {lab_pin.sym} 140 -250 0 0 {name=p1 sig_type=std_logic lab=Vbiasp1}
C {sky130_fd_pr/pfet3_01v8_lvt.sym} 70 -110 0 0 {name=M1
W=14.6
L=1
body=VDD
nf=2
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
C {sky130_fd_pr/pfet3_01v8_lvt.sym} 290 -110 0 1 {name=M2
W=14.6
L=1
body=VDD
nf=2
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
C {lab_pin.sym} 50 -110 0 0 {name=p2 sig_type=std_logic lab=Vp}
C {lab_pin.sym} 310 -110 0 1 {name=p3 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 800 -290 0 1 {name=p4 sig_type=std_logic lab=Vbiasp2}
C {lab_pin.sym} 800 70 0 1 {name=p5 sig_type=std_logic lab=Vbiasn1}
C {lab_pin.sym} 800 -50 0 1 {name=p6 sig_type=std_logic lab=Vbiasn2}
C {lab_pin.sym} 180 -310 0 0 {name=p7 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 460 120 0 0 {name=p8 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 760 120 0 0 {name=p9 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 460 -470 0 0 {name=p22 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 760 -470 0 0 {name=p23 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 800 -180 0 1 {name=p26 sig_type=std_logic lab=Vout}
