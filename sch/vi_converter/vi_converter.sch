v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 520 -250 520 -160 {lab=s1}
N 740 -250 740 -160 {lab=s2}
N 410 -280 480 -280 {lab=g1}
N 110 -220 110 -180 {lab=s1}
N -140 20 -140 40 {lab=VDD}
N 780 -280 850 -280 {lab=g2}
N 740 -180 1150 -180 {lab=s2}
N 1150 -220 1150 -180 {lab=s2}
N 520 -360 520 -310 {lab=op}
N 740 -360 740 -310 {lab=on}
N 520 -210 600 -210 {lab=s1}
N 660 -210 740 -210 {lab=s2}
N -180 120 -180 180 {lab=Vbref}
N -180 120 -140 120 {lab=Vbref}
N -140 100 -140 150 {lab=Vbref}
N 480 -70 700 -70 {lab=Vbref}
N 520 -160 520 -100 {lab=s1}
N 740 -160 740 -100 {lab=s2}
N 350 -160 520 -160 {lab=s1}
N 110 -160 290 -160 {lab=s1}
N 110 -180 110 -160 {lab=s1}
N 290 -160 350 -160 {lab=s1}
N 520 -40 520 -0 {lab=GND}
N 740 -40 740 -0 {lab=GND}
N 440 -220 440 -200 {lab=GND}
N 820 -220 820 -200 {lab=GND}
C {vi_converter/ota_vi.sym} 260 -270 0 0 {name=x1}
C {sky130_fd_pr/nfet3_01v8.sym} 500 -280 0 0 {name=M1
W=6.1
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
C {sky130_fd_pr/nfet3_01v8.sym} 760 -280 0 1 {name=M2
W=6.1
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
C {sky130_fd_pr/nfet3_01v8.sym} 500 -70 0 0 {name=M3
W=36
L=8
body=GND
nf=6
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
C {sky130_fd_pr/nfet3_01v8.sym} 720 -70 0 0 {name=M4
W=36
L=8
body=GND
nf=6
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
C {lab_pin.sym} -400 -510 0 0 {name=p15 sig_type=std_logic lab=Vbp2}
C {isource.sym} -140 70 0 1 {name=Iref value=10u}
C {lab_pin.sym} -140 20 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 410 -320 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/cap_mim_m3_2.sym} 440 -250 0 0 {name=C1 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {vi_converter/ota_vi.sym} 1000 -270 0 1 {name=x2}
C {lab_pin.sym} 850 -320 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/cap_mim_m3_2.sym} 820 -250 0 1 {name=C2 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {sky130_fd_pr/res_high_po_0p35.sym} 630 -210 3 0 {name=R1
L=30.7
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {lab_pin.sym} 110 -320 0 0 {name=p9 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 110 -300 0 0 {name=p10 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 110 -280 0 0 {name=p11 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} 110 -260 0 0 {name=p12 sig_type=std_logic lab=Vbp2}
C {lab_pin.sym} 1150 -320 0 1 {name=p13 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 1150 -300 0 1 {name=p18 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 1150 -280 0 1 {name=p19 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} 1150 -260 0 1 {name=p20 sig_type=std_logic lab=Vbp2}
C {lab_pin.sym} 520 -360 2 0 {name=p21 sig_type=std_logic lab=op}
C {lab_pin.sym} 740 -360 2 1 {name=p22 sig_type=std_logic lab=on}
C {lab_pin.sym} 110 -240 0 0 {name=p30 sig_type=std_logic lab=inp}
C {lab_pin.sym} 1150 -240 0 1 {name=p31 sig_type=std_logic lab=inn}
C {lab_pin.sym} -180 120 0 0 {name=p27 sig_type=std_logic lab=Vbref}
C {lab_pin.sym} 480 -70 0 0 {name=p33 sig_type=std_logic lab=Vbref}
C {lab_wire.sym} 480 -280 0 0 {name=p39 sig_type=std_logic lab=g1}
C {lab_wire.sym} 780 -280 0 1 {name=p40 sig_type=std_logic lab=g2}
C {lab_wire.sym} 870 -180 0 1 {name=p41 sig_type=std_logic lab=s2}
C {vsource.sym} -400 -480 0 0 {name=Vbp2 value=0.497 savecurrent=true}
C {lab_pin.sym} -590 -510 0 0 {name=p4 sig_type=std_logic lab=Vbp1}
C {vsource.sym} -590 -480 0 0 {name=Vbp1 value=0.608 savecurrent=true}
C {lab_pin.sym} -220 -510 0 0 {name=p7 sig_type=std_logic lab=Vbn1}
C {vsource.sym} -220 -480 0 0 {name=Vbn1 value=0.681 savecurrent=true}
C {lab_pin.sym} -50 -510 0 0 {name=p14 sig_type=std_logic lab=Vbn2}
C {vsource.sym} -50 -480 0 0 {name=Vbn2 value=0.883 savecurrent=true}
C {sky130_fd_pr/nfet3_01v8.sym} -160 180 0 0 {name=M5
W=36
L=8
body=GND
nf=6
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
C {lab_wire.sym} 330 -160 0 1 {name=p1 sig_type=std_logic lab=s1}
C {lab_pin.sym} 410 -300 0 1 {name=p5 sig_type=std_logic lab=GND}
C {lab_pin.sym} 520 0 0 1 {name=p16 sig_type=std_logic lab=GND}
C {lab_pin.sym} 740 0 0 1 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 440 -200 0 1 {name=p23 sig_type=std_logic lab=GND}
C {lab_pin.sym} 820 -200 0 0 {name=p24 sig_type=std_logic lab=GND}
C {lab_pin.sym} 850 -300 0 0 {name=p25 sig_type=std_logic lab=GND}
C {lab_pin.sym} -50 -450 0 0 {name=p28 sig_type=std_logic lab=GND}
C {lab_pin.sym} -220 -450 0 0 {name=p29 sig_type=std_logic lab=GND}
C {lab_pin.sym} -590 -450 0 0 {name=p32 sig_type=std_logic lab=GND}
C {lab_pin.sym} -400 -450 0 0 {name=p34 sig_type=std_logic lab=GND}
C {lab_pin.sym} -140 210 0 0 {name=p35 sig_type=std_logic lab=GND}
C {lab_pin.sym} 630 -190 3 0 {name=p36 sig_type=std_logic lab=GND}
C {ipin.sym} -400 -180 0 0 {name=p37 lab=inp}
C {opin.sym} -410 -110 0 0 {name=p42 lab=op}
C {iopin.sym} -400 -250 0 0 {name=p43 lab=VDD}
C {lab_pin.sym} -400 -250 0 0 {name=p44 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} -400 -180 0 1 {name=p45 sig_type=std_logic lab=inp}
C {iopin.sym} -400 -220 0 0 {name=p46 lab=GND}
C {lab_pin.sym} -400 -220 0 0 {name=p47 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} -400 -150 0 0 {name=p48 lab=inn}
C {lab_pin.sym} -400 -150 0 1 {name=p49 sig_type=std_logic lab=inn}
C {lab_pin.sym} -410 -110 0 0 {name=p50 sig_type=std_logic lab=op}
C {opin.sym} -410 -80 0 0 {name=p72 lab=on}
C {lab_pin.sym} -410 -80 0 0 {name=p73 sig_type=std_logic lab=on}
