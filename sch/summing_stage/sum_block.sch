v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 520 -10 610 -10 {lab=#net1}
N 650 -150 650 -40 {lab=i1}
N 530 -230 610 -230 {lab=#net2}
N 610 -230 610 -180 {lab=#net2}
N 550 -230 550 -200 {lab=#net2}
N 490 -200 550 -200 {lab=#net2}
N -620 -200 -620 -160 {lab=VDD}
N -580 -130 -580 -100 {lab=Vbp1}
N -620 -100 -580 -100 {lab=Vbp1}
N -450 -200 -450 -160 {lab=VDD}
N -410 -130 -410 -100 {lab=Vbp2}
N -450 -100 -410 -100 {lab=Vbp2}
N -240 -140 -240 -110 {lab=Vbn1}
N -280 -140 -240 -140 {lab=Vbn1}
N -280 -80 -280 -50 {lab=GND}
N -70 -140 -70 -110 {lab=Vbn2}
N -110 -140 -70 -140 {lab=Vbn2}
N -110 -80 -110 -50 {lab=GND}
N 490 -290 490 -260 {lab=VDD}
N 310 -100 650 -100 {lab=i1}
N 310 -100 310 80 {lab=i1}
N 220 80 310 80 {lab=i1}
N 220 50 220 80 {lab=i1}
N 910 -10 1000 -10 {lab=#net3}
N 870 -150 870 -40 {lab=i2}
N 870 -100 1210 -100 {lab=i2}
N 1210 -100 1210 80 {lab=i2}
N 1210 80 1300 80 {lab=i2}
N 1300 50 1300 80 {lab=i2}
N 650 -250 650 -210 {lab=VDD}
N 870 -250 870 -210 {lab=VDD}
N 550 280 610 280 {lab=#net4}
N 470 480 470 520 {lab=#net5}
N 510 500 510 550 {lab=#net5}
N 470 500 510 500 {lab=#net5}
N 470 580 470 600 {lab=GND}
N -160 390 -160 440 {lab=Vbp}
N -200 440 -160 440 {lab=Vbp}
N -200 420 -200 460 {lab=Vbp}
N -200 340 -200 360 {lab=VDD}
N 510 500 570 500 {lab=#net5}
N 220 360 550 360 {lab=dac1}
N 200 260 200 360 {lab=dac1}
N 220 260 250 260 {lab=dac1}
N 650 310 650 410 {lab=dac1}
N 910 280 970 280 {lab=#net6}
N 1320 260 1320 360 {lab=dac2}
N 1270 260 1300 260 {lab=dac2}
N 870 310 870 410 {lab=dac2}
N 870 20 870 250 {lab=di_n}
N 650 20 650 250 {lab=di_p}
N 610 -180 830 -180 {lab=#net2}
N 570 500 610 500 {lab=#net5}
N 610 440 610 500 {lab=#net5}
N 610 440 830 440 {lab=#net5}
N 200 260 220 260 {lab=dac1}
N 200 360 220 360 {lab=dac1}
N 1300 260 1320 260 {lab=dac2}
N 870 370 1320 370 {lab=dac2}
N 1320 360 1320 370 {lab=dac2}
N 550 360 650 360 {lab=dac1}
N 570 50 570 70 {lab=GND}
N 940 50 940 70 {lab=GND}
C {vsource.sym} -450 70 0 0 {name=Vref2 value=1.55 savecurrent=true}
C {lab_pin.sym} -450 40 0 0 {name=p5 sig_type=std_logic lab=Vref2}
C {lab_pin.sym} 520 -50 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {cascode/ota_n.sym} 370 0 0 0 {name=x1}
C {sky130_fd_pr/pfet3_01v8.sym} 630 -180 0 0 {name=M1
W=46
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
C {sky130_fd_pr/pfet3_01v8.sym} 630 -10 0 0 {name=M2
W=40
L=1
body=VDD
nf=8
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
C {sky130_fd_pr/pfet3_01v8.sym} 510 -230 0 1 {name=M3
W=11.5
L=2
body=VDD
nf=1
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
C {isource.sym} 490 -170 0 0 {name=Ibsum value=10u}
C {isource.sym} -620 -70 0 1 {name=Iin value=12u}
C {lab_pin.sym} -620 -200 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -580 -100 0 1 {name=p4 sig_type=std_logic lab=Vbp1}
C {isource.sym} -450 -70 0 1 {name=Iin1 value=14u}
C {lab_pin.sym} -450 -200 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -410 -100 0 1 {name=p15 sig_type=std_logic lab=Vbp2}
C {isource.sym} -280 -170 0 0 {name=Iin2 value=20u}
C {lab_pin.sym} -240 -140 0 1 {name=p16 sig_type=std_logic lab=Vbn1}
C {isource.sym} -110 -170 0 0 {name=Iin3 value=14u}
C {lab_pin.sym} -70 -140 0 1 {name=p17 sig_type=std_logic lab=Vbn2}
C {sky130_fd_pr/pfet3_01v8.sym} -600 -130 0 1 {name=M9
W=13.25
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
C {sky130_fd_pr/pfet3_01v8.sym} -430 -130 0 1 {name=M7
W=2.3
L=2
body=VDD
nf=1
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
C {sky130_fd_pr/nfet3_01v8.sym} -90 -110 0 1 {name=M10
W=2.6
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
C {sky130_fd_pr/nfet3_01v8.sym} -260 -110 0 1 {name=M4
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
C {lab_pin.sym} 220 -10 0 0 {name=p6 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} 220 10 0 0 {name=p8 sig_type=std_logic lab=Vbp2}
C {lab_pin.sym} 220 -50 0 0 {name=p9 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 220 -30 0 0 {name=p11 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 490 -290 0 1 {name=p18 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1000 -50 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {cascode/ota_n.sym} 1150 0 0 1 {name=x2}
C {sky130_fd_pr/pfet3_01v8.sym} 850 -180 0 0 {name=M5
W=46
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
C {sky130_fd_pr/pfet3_01v8.sym} 890 -10 0 1 {name=M6
W=40
L=1
body=VDD
nf=8
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
C {lab_pin.sym} 1300 -10 0 1 {name=p12 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} 1300 10 0 1 {name=p13 sig_type=std_logic lab=Vbp2}
C {lab_pin.sym} 1300 -50 0 1 {name=p19 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 1300 -30 0 1 {name=p20 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 650 -250 0 1 {name=p21 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 870 -250 0 0 {name=p22 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 310 -100 0 0 {name=p23 sig_type=std_logic lab=i1}
C {lab_pin.sym} 1210 -100 0 1 {name=p24 sig_type=std_logic lab=i2}
C {sky130_fd_pr/nfet3_01v8.sym} 630 440 0 0 {name=M8
W=25
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
C {sky130_fd_pr/nfet3_01v8.sym} 630 280 0 0 {name=M11
W=15
L=2
body=GND
nf=3
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
C {cascode/ota_p.sym} 400 260 0 0 {name=x3}
C {vsource.sym} -550 70 0 0 {name=Vref1 value=0.25 savecurrent=true}
C {lab_pin.sym} -550 40 0 0 {name=p25 sig_type=std_logic lab=Vref1}
C {isource.sym} -200 490 0 1 {name=Iin4 value=5u}
C {sky130_fd_pr/pfet3_01v8.sym} -180 390 0 1 {name=M12
W=5
L=2
body=VDD
nf=1
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
C {lab_pin.sym} -200 340 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -160 440 0 1 {name=p27 sig_type=std_logic lab=Vbp}
C {isource.sym} 470 450 0 0 {name=Isum value=10u}
C {sky130_fd_pr/cap_mim_m3_2.sym} 580 310 0 1 {name=C1 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {sky130_fd_pr/nfet3_01v8.sym} 490 550 0 1 {name=M13
W=6.25
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
C {lab_pin.sym} 550 240 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 250 280 0 0 {name=p29 sig_type=std_logic lab=Vbp}
C {sky130_fd_pr/nfet3_01v8.sym} 850 440 0 0 {name=M14
W=25
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
C {sky130_fd_pr/nfet3_01v8.sym} 890 280 0 1 {name=M15
W=15
L=2
body=GND
nf=3
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
C {cascode/ota_p.sym} 1120 260 0 1 {name=x4}
C {lab_pin.sym} 1270 240 0 1 {name=p30 sig_type=std_logic lab=Vref1}
C {sky130_fd_pr/cap_mim_m3_2.sym} 930 310 0 0 {name=C2 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {lab_pin.sym} 970 240 0 0 {name=p31 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1270 280 0 1 {name=p32 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 220 30 0 0 {name=p33 sig_type=std_logic lab=Vref2}
C {lab_pin.sym} 1300 30 0 1 {name=p34 sig_type=std_logic lab=Vref2}
C {lab_pin.sym} 470 420 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -280 -200 0 1 {name=p35 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -110 -200 0 1 {name=p36 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 200 360 0 0 {name=p37 sig_type=std_logic lab=dac1}
C {lab_pin.sym} 1320 370 0 1 {name=p38 sig_type=std_logic lab=dac2}
C {lab_pin.sym} 650 140 0 1 {name=p39 sig_type=std_logic lab=di_p}
C {lab_pin.sym} 870 140 0 0 {name=p40 sig_type=std_logic lab=di_n}
C {lab_pin.sym} 250 240 0 0 {name=p41 sig_type=std_logic lab=Vref1}
C {sky130_fd_pr/cap_mim_m3_2.sym} 570 20 0 1 {name=C3 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 940 20 0 0 {name=C4 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {ipin.sym} 20 110 0 0 {name=p1 lab=dac1}
C {opin.sym} 10 230 0 0 {name=p42 lab=di_p}
C {iopin.sym} 20 40 0 0 {name=p43 lab=VDD}
C {lab_pin.sym} 20 40 0 0 {name=p44 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 20 110 0 1 {name=p45 sig_type=std_logic lab=dac1}
C {iopin.sym} 20 70 0 0 {name=p46 lab=GND}
C {lab_pin.sym} 20 70 0 0 {name=p47 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} 20 140 0 0 {name=p48 lab=dac2}
C {lab_pin.sym} 20 140 0 1 {name=p49 sig_type=std_logic lab=dac2}
C {lab_pin.sym} 10 230 0 0 {name=p50 sig_type=std_logic lab=di_p}
C {ipin.sym} 20 170 0 0 {name=p51 lab=i1}
C {lab_pin.sym} 20 170 0 1 {name=p52 sig_type=std_logic lab=i1}
C {lab_pin.sym} 520 -30 0 1 {name=p53 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 570 70 0 0 {name=p54 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 490 -140 0 0 {name=p55 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 1000 -30 0 0 {name=p56 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 940 70 0 1 {name=p57 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 970 260 0 0 {name=p58 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 550 260 0 1 {name=p59 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 580 340 0 1 {name=p60 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 930 340 0 0 {name=p61 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 870 470 0 0 {name=p62 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 650 470 0 1 {name=p63 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 470 600 0 1 {name=p64 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -200 520 0 1 {name=p65 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -450 100 0 0 {name=p66 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -550 100 0 0 {name=p67 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -620 -40 0 1 {name=p68 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -450 -40 0 1 {name=p69 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -280 -50 0 1 {name=p70 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} -110 -50 0 1 {name=p71 sig_type=std_logic lab=GND
only_toplevel=true}
C {opin.sym} 10 260 0 0 {name=p72 lab=di_n}
C {lab_pin.sym} 10 260 0 0 {name=p73 sig_type=std_logic lab=di_n}
C {ipin.sym} 20 200 0 0 {name=p74 lab=i2}
C {lab_pin.sym} 20 200 0 1 {name=p75 sig_type=std_logic lab=i2}
