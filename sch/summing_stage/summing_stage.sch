v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 520 -30 540 -30 {lab=0}
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
N -280 -80 -280 -50 {lab=0}
N -70 -140 -70 -110 {lab=Vbn2}
N -110 -140 -70 -140 {lab=Vbn2}
N -110 -80 -110 -50 {lab=0}
N 490 -290 490 -260 {lab=VDD}
N 310 -100 650 -100 {lab=i1}
N 310 -100 310 80 {lab=i1}
N 220 80 310 80 {lab=i1}
N 220 50 220 80 {lab=i1}
N 980 -30 1000 -30 {lab=0}
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
N 470 580 470 600 {lab=0}
N -160 390 -160 440 {lab=Vbp}
N -200 440 -160 440 {lab=Vbp}
N -200 420 -200 460 {lab=Vbp}
N -200 340 -200 360 {lab=VDD}
N 510 500 570 500 {lab=#net5}
N 220 360 550 360 {lab=dac1}
N 200 260 200 360 {lab=dac1}
N 220 260 250 260 {lab=dac1}
N 650 310 650 410 {lab=dac1}
N 550 260 570 260 {lab=0}
N 910 280 970 280 {lab=#net6}
N 1320 260 1320 360 {lab=dac2}
N 1270 260 1300 260 {lab=dac2}
N 870 310 870 410 {lab=dac2}
N 950 260 970 260 {lab=0}
N 870 20 870 250 {lab=di_n}
N 650 20 650 250 {lab=di_p}
N 610 -180 830 -180 {lab=#net2}
N 570 500 610 500 {lab=#net5}
N 610 440 610 500 {lab=#net5}
N 610 440 830 440 {lab=#net5}
N 200 260 220 260 {lab=dac1}
N 200 360 220 360 {lab=dac1}
N 1300 260 1320 260 {lab=dac2}
N -840 370 -840 400 {lab=#net7}
N -840 370 -810 370 {lab=#net7}
N 870 370 1320 370 {lab=dac2}
N 1320 360 1320 370 {lab=dac2}
N 550 360 650 360 {lab=dac1}
N 270 -190 270 -180 {lab=0}
N 1060 -170 1060 -160 {lab=0}
N 710 100 740 100 {lab=mp}
N 740 100 740 130 {lab=mp}
N 790 100 810 100 {lab=mn}
N 780 100 780 130 {lab=mn}
N 780 100 790 100 {lab=mn}
N 740 190 740 200 {lab=vmid}
N 740 200 760 200 {lab=vmid}
N 760 200 780 200 {lab=vmid}
N 780 190 780 200 {lab=vmid}
N 610 150 650 150 {lab=di_p}
N 870 150 890 150 {lab=di_n}
C {vsource.sym} -450 70 0 0 {name=Vref2 value=1.55 savecurrent=true}
C {lab_pin.sym} -450 40 0 0 {name=p5 sig_type=std_logic lab=Vref2}
C {gnd.sym} -450 100 0 0 {name=l3 lab=0}
C {vsource.sym} -640 70 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -640 40 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -640 100 0 0 {name=l1 lab=0}
C {lab_pin.sym} 520 -50 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {gnd.sym} 540 -30 0 0 {name=l4 lab=0}
C {code.sym} -260 120 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false
      }
C {/foss/designs/sar_adc/sch/cascode/ota_n.sym} 370 0 0 0 {name=x1}
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
C {isource.sym} 490 -170 0 0 {name=Ibsum value=40u}
C {isource.sym} -620 -70 0 1 {name=Iin value=24u}
C {lab_pin.sym} -620 -200 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -580 -100 0 1 {name=p4 sig_type=std_logic lab=Vbp1}
C {isource.sym} -450 -70 0 1 {name=Iin1 value=14u}
C {lab_pin.sym} -450 -200 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -410 -100 0 1 {name=p15 sig_type=std_logic lab=Vbp2}
C {isource.sym} -280 -170 0 0 {name=Iin2 value=20u}
C {gnd.sym} -280 -50 0 0 {name=l2 lab=0}
C {lab_pin.sym} -240 -140 0 1 {name=p16 sig_type=std_logic lab=Vbn1}
C {isource.sym} -110 -170 0 0 {name=Iin3 value=14u}
C {gnd.sym} -110 -50 0 0 {name=l5 lab=0}
C {lab_pin.sym} -70 -140 0 1 {name=p17 sig_type=std_logic lab=Vbn2}
C {sky130_fd_pr/pfet3_01v8.sym} -600 -130 0 1 {name=M9
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
C {gnd.sym} 490 -140 0 0 {name=l6 lab=0}
C {lab_pin.sym} 1000 -50 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {gnd.sym} 980 -30 0 1 {name=l8 lab=0}
C {/foss/designs/sar_adc/sch/cascode/ota_n.sym} 1150 0 0 1 {name=x2}
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
C {/foss/designs/sar_adc/sch/cascode/ota_p.sym} 400 260 0 0 {name=x3}
C {vsource.sym} -550 70 0 0 {name=Vref1 value=0.25 savecurrent=true}
C {lab_pin.sym} -550 40 0 0 {name=p25 sig_type=std_logic lab=Vref1}
C {gnd.sym} -550 100 0 0 {name=l9 lab=0}
C {isource.sym} -200 490 0 1 {name=Iin4 value=10u}
C {sky130_fd_pr/pfet3_01v8.sym} -180 390 0 1 {name=M12
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
C {lab_pin.sym} -200 340 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -160 440 0 1 {name=p27 sig_type=std_logic lab=Vbp}
C {isource.sym} 470 450 0 0 {name=Isum value=40u}
C {gnd.sym} 470 600 0 1 {name=l10 lab=0}
C {sky130_fd_pr/cap_mim_m3_2.sym} 580 310 0 1 {name=C1 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {sky130_fd_pr/nfet3_01v8.sym} 490 550 0 1 {name=M13
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
C {gnd.sym} 580 340 0 0 {name=l11 lab=0}
C {gnd.sym} 650 470 0 0 {name=l12 lab=0}
C {gnd.sym} 570 260 0 0 {name=l13 lab=0}
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
C {/foss/designs/sar_adc/sch/cascode/ota_p.sym} 1120 260 0 1 {name=x4}
C {lab_pin.sym} 1270 240 0 1 {name=p30 sig_type=std_logic lab=Vref1}
C {sky130_fd_pr/cap_mim_m3_2.sym} 930 310 0 0 {name=C2 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {gnd.sym} 930 340 0 1 {name=l15 lab=0}
C {gnd.sym} 870 470 0 1 {name=l16 lab=0}
C {gnd.sym} 950 260 0 1 {name=l17 lab=0}
C {lab_pin.sym} 970 240 0 0 {name=p31 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1270 280 0 1 {name=p32 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 220 30 0 0 {name=p33 sig_type=std_logic lab=Vref2}
C {lab_pin.sym} 1300 30 0 1 {name=p34 sig_type=std_logic lab=Vref2}
C {lab_pin.sym} 470 420 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -450 -40 0 0 {name=l7 lab=0}
C {gnd.sym} -620 -40 0 0 {name=l14 lab=0}
C {lab_pin.sym} -280 -200 0 1 {name=p35 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -110 -200 0 1 {name=p36 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 200 360 0 0 {name=p37 sig_type=std_logic lab=dac1}
C {lab_pin.sym} 1320 370 0 1 {name=p38 sig_type=std_logic lab=dac2}
C {lab_pin.sym} 650 140 0 1 {name=p39 sig_type=std_logic lab=di_p}
C {lab_pin.sym} 870 140 0 0 {name=p40 sig_type=std_logic lab=di_n}
C {lab_pin.sym} 250 240 0 0 {name=p41 sig_type=std_logic lab=Vref1}
C {/foss/designs/sar_adc/sch/ladder/ladder.sym} -660 350 0 0 {name=x5}
C {lab_pin.sym} -660 290 0 0 {name=p42 sig_type=std_logic lab=VDD}
C {gnd.sym} -660 410 0 0 {name=l18 lab=0}
C {lab_pin.sym} -810 350 0 0 {name=p43 sig_type=std_logic lab=VDD}
C {isource.sym} -840 430 2 1 {name=Iin5 value=20u}
C {gnd.sym} -840 460 0 0 {name=l19 lab=0}
C {lab_pin.sym} -810 330 0 0 {name=p44 sig_type=std_logic lab=d[0..6]}
C {lab_pin.sym} -510 340 0 1 {name=p45 sig_type=std_logic lab=dac1}
C {lab_pin.sym} -510 360 0 1 {name=p46 sig_type=std_logic lab=dac2}
C {gnd.sym} -200 520 0 0 {name=l20 lab=0}
C {sky130_fd_pr/cap_mim_m3_2.sym} 570 20 0 1 {name=C3 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {gnd.sym} 570 50 0 0 {name=l24 lab=0}
C {sky130_fd_pr/cap_mim_m3_2.sym} 940 20 0 0 {name=C4 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {gnd.sym} 940 50 0 1 {name=l25 lab=0}
C {code.sym} -800 140 0 0 {name=DAC_CODES only_toplevel=false value="
Vcode code 0 dc 63 pwl(0 63 20n 63 20.1n 64 120n 64 120.1n 63 220n 63 220.1n 0 320n 0 320.1n 127 420n 127 420.1n 63 520n 63)
Bd0 d0 0 V = 1.8*(floor((v(code)+0.5)/64) - 2*floor((v(code)+0.5)/128))
Bd1 d1 0 V = 1.8*(floor((v(code)+0.5)/32) - 2*floor((v(code)+0.5)/64))
Bd2 d2 0 V = 1.8*(floor((v(code)+0.5)/16) - 2*floor((v(code)+0.5)/32))
Bd3 d3 0 V = 1.8*(floor((v(code)+0.5)/8) - 2*floor((v(code)+0.5)/16))
Bd4 d4 0 V = 1.8*(floor((v(code)+0.5)/4) - 2*floor((v(code)+0.5)/8))
Bd5 d5 0 V = 1.8*(floor((v(code)+0.5)/2) - 2*floor((v(code)+0.5)/4))
Bd6 d6 0 V = 1.8*(floor((v(code)+0.5)/1) - 2*floor((v(code)+0.5)/2))
"}
C {vsource.sym} 160 -210 0 0 {name=Vx value="dc 10 ac 1" savecurrent=true}
C {gnd.sym} 160 -180 0 0 {name=l21 lab=0}
C {lab_pin.sym} 160 -240 0 0 {name=p47 sig_type=std_logic lab=vx}
C {vccs.sym} 310 -210 0 0 {name=G1 value=1u}
C {gnd.sym} 310 -180 0 0 {name=l22 lab=0}
C {lab_pin.sym} 310 -240 0 1 {name=p48 sig_type=std_logic lab=i1}
C {lab_pin.sym} 270 -230 0 0 {name=p49 sig_type=std_logic lab=vx}
C {gnd.sym} 270 -180 0 0 {name=l23 lab=0}
C {vccs.sym} 1100 -190 0 0 {name=G2 value=-1u}
C {gnd.sym} 1100 -160 0 0 {name=l26 lab=0}
C {lab_pin.sym} 1100 -220 0 1 {name=p50 sig_type=std_logic lab=i2}
C {lab_pin.sym} 1060 -210 0 0 {name=p51 sig_type=std_logic lab=vx}
C {gnd.sym} 1060 -160 0 0 {name=l27 lab=0}
C {isource.sym} 1220 -190 0 0 {name=I2b value="dc 20u"}
C {gnd.sym} 1220 -160 0 0 {name=l28 lab=0}
C {lab_pin.sym} 1220 -220 0 1 {name=p52 sig_type=std_logic lab=i2}
C {res.sym} 680 100 3 0 {name=Rcp
value=1m
footprint=1206
device=resistor
m=1}
C {res.sym} 840 100 1 1 {name=Rcn
value=1m
footprint=1206
device=resistor
m=1}
C {vsource.sym} 740 160 0 1 {name=Vmp value=0 savecurrent=true}
C {vsource.sym} 780 160 0 0 {name=Vmn value=0 savecurrent=true}
C {vsource.sym} 760 230 0 0 {name=Vmid value="dc 0.9" savecurrent=true}
C {lab_pin.sym} 740 120 0 0 {name=p53 sig_type=std_logic lab=mp}
C {lab_pin.sym} 780 120 0 1 {name=p54 sig_type=std_logic lab=mn}
C {lab_pin.sym} 780 200 0 1 {name=p55 sig_type=std_logic lab=vmid}
C {gnd.sym} 760 260 0 1 {name=l29 lab=0}
C {parax_cap.sym} 610 160 0 1 {name=Ccp gnd=0 value=100f m=1}
C {parax_cap.sym} 890 160 0 0 {name=Ccn gnd=0 value=100f m=1}
C {code.sym} -70 130 0 0 {name=SPICE_CTRL only_toplevel=false value="
.nodeset v(i1)=1.55 v(i2)=1.55 v(dac1)=0.25 v(dac2)=0.25 v(di_p)=0.9 v(di_n)=0.9 v(net1)=0.35 v(net3)=0.35 v(net4)=1.0 v(net6)=1.0
.save all
.control
  alter Vcode dc = 64
  alter Vx dc = 10
  op
  write @schname\\\\.raw
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  print idd v(i1) v(i2) v(dac1) v(dac2) v(di_p) v(di_n) v(net1) v(net3) v(net4) v(net6) dip din > op_mid.log
  print @m.xm1.msky130_fd_pr__pfet_01v8[vds] @m.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.xm1.msky130_fd_pr__pfet_01v8[gm] @m.xm1.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.xm2.msky130_fd_pr__pfet_01v8[vds] @m.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.xm2.msky130_fd_pr__pfet_01v8[gm] @m.xm2.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.xm5.msky130_fd_pr__pfet_01v8[vds] @m.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.xm5.msky130_fd_pr__pfet_01v8[gm] @m.xm5.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.xm6.msky130_fd_pr__pfet_01v8[vds] @m.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.xm6.msky130_fd_pr__pfet_01v8[gm] @m.xm6.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.xm8.msky130_fd_pr__nfet_01v8[vds] @m.xm8.msky130_fd_pr__nfet_01v8[vdsat] @m.xm8.msky130_fd_pr__nfet_01v8[gm] @m.xm8.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm11.msky130_fd_pr__nfet_01v8[vds] @m.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.xm11.msky130_fd_pr__nfet_01v8[gm] @m.xm11.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm14.msky130_fd_pr__nfet_01v8[vds] @m.xm14.msky130_fd_pr__nfet_01v8[vdsat] @m.xm14.msky130_fd_pr__nfet_01v8[gm] @m.xm14.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm15.msky130_fd_pr__nfet_01v8[vds] @m.xm15.msky130_fd_pr__nfet_01v8[vdsat] @m.xm15.msky130_fd_pr__nfet_01v8[gm] @m.xm15.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm1.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm1.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm1.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm2.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm2.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm2.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm5.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm6.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm6.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm6.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm7.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm8.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm9.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm10.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm10.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm10.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm10.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm11.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm11.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm11.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm1.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm1.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm1.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm2.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm2.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm2.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm5.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm6.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm6.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm6.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm7.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm8.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm9.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm10.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm10.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm10.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm10.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm11.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm11.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm11.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x3.xm1.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm1.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm1.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x3.xm2.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm2.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm2.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x3.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x3.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x3.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x3.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x3.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x3.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x3.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x3.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x3.xm5.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm5.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm5.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x4.xm1.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm1.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm1.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x4.xm2.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm2.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm2.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x4.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x4.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x4.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x4.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x4.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x4.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x4.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x4.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x4.xm5.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm5.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm5.msky130_fd_pr__pfet_01v8[id] >> op_mid.log

  alter Vcode dc = 0
  alter Vx dc = 0
  op
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  print idd v(i1) v(i2) v(dac1) v(dac2) v(di_p) v(di_n) v(net1) v(net3) v(net4) v(net6) dip din > op_lo.log
  print @m.xm1.msky130_fd_pr__pfet_01v8[vds] @m.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.xm1.msky130_fd_pr__pfet_01v8[gm] @m.xm1.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.xm2.msky130_fd_pr__pfet_01v8[vds] @m.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.xm2.msky130_fd_pr__pfet_01v8[gm] @m.xm2.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.xm5.msky130_fd_pr__pfet_01v8[vds] @m.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.xm5.msky130_fd_pr__pfet_01v8[gm] @m.xm5.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.xm6.msky130_fd_pr__pfet_01v8[vds] @m.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.xm6.msky130_fd_pr__pfet_01v8[gm] @m.xm6.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.xm8.msky130_fd_pr__nfet_01v8[vds] @m.xm8.msky130_fd_pr__nfet_01v8[vdsat] @m.xm8.msky130_fd_pr__nfet_01v8[gm] @m.xm8.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm11.msky130_fd_pr__nfet_01v8[vds] @m.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.xm11.msky130_fd_pr__nfet_01v8[gm] @m.xm11.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm14.msky130_fd_pr__nfet_01v8[vds] @m.xm14.msky130_fd_pr__nfet_01v8[vdsat] @m.xm14.msky130_fd_pr__nfet_01v8[gm] @m.xm14.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm15.msky130_fd_pr__nfet_01v8[vds] @m.xm15.msky130_fd_pr__nfet_01v8[vdsat] @m.xm15.msky130_fd_pr__nfet_01v8[gm] @m.xm15.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm1.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm1.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm1.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm2.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm2.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm2.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm5.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm6.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm6.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm6.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm7.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm8.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm9.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm10.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm10.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm10.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm10.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm11.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm11.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm11.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm1.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm1.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm1.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm2.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm2.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm2.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm5.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm6.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm6.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm6.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm7.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm8.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm9.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm10.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm10.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm10.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm10.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm11.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm11.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm11.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x3.xm1.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm1.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm1.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x3.xm2.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm2.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm2.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x3.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x3.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x3.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x3.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x3.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x3.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x3.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x3.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x3.xm5.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm5.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm5.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x4.xm1.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm1.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm1.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x4.xm2.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm2.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm2.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x4.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x4.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x4.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x4.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x4.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x4.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x4.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x4.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x4.xm5.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm5.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm5.msky130_fd_pr__pfet_01v8[id] >> op_lo.log

  alter Vcode dc = 127
  alter Vx dc = 20
  op
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  print idd v(i1) v(i2) v(dac1) v(dac2) v(di_p) v(di_n) v(net1) v(net3) v(net4) v(net6) dip din > op_hi.log
  print @m.xm1.msky130_fd_pr__pfet_01v8[vds] @m.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.xm1.msky130_fd_pr__pfet_01v8[gm] @m.xm1.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.xm2.msky130_fd_pr__pfet_01v8[vds] @m.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.xm2.msky130_fd_pr__pfet_01v8[gm] @m.xm2.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.xm5.msky130_fd_pr__pfet_01v8[vds] @m.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.xm5.msky130_fd_pr__pfet_01v8[gm] @m.xm5.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.xm6.msky130_fd_pr__pfet_01v8[vds] @m.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.xm6.msky130_fd_pr__pfet_01v8[gm] @m.xm6.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.xm8.msky130_fd_pr__nfet_01v8[vds] @m.xm8.msky130_fd_pr__nfet_01v8[vdsat] @m.xm8.msky130_fd_pr__nfet_01v8[gm] @m.xm8.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm11.msky130_fd_pr__nfet_01v8[vds] @m.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.xm11.msky130_fd_pr__nfet_01v8[gm] @m.xm11.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm14.msky130_fd_pr__nfet_01v8[vds] @m.xm14.msky130_fd_pr__nfet_01v8[vdsat] @m.xm14.msky130_fd_pr__nfet_01v8[gm] @m.xm14.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm15.msky130_fd_pr__nfet_01v8[vds] @m.xm15.msky130_fd_pr__nfet_01v8[vdsat] @m.xm15.msky130_fd_pr__nfet_01v8[gm] @m.xm15.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm1.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm1.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm1.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm2.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm2.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm2.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm5.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm6.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm6.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm6.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm7.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm8.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm9.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm10.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm10.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm10.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm10.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm11.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm11.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm11.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm1.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm1.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm1.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm2.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm2.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm2.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm5.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm6.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm6.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm6.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm6.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm7.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm8.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm9.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm10.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm10.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm10.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm10.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm11.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm11.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm11.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm11.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x3.xm1.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm1.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm1.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x3.xm2.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm2.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm2.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x3.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x3.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x3.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x3.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x3.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x3.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x3.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x3.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x3.xm5.msky130_fd_pr__pfet_01v8[vds] @m.x3.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.x3.xm5.msky130_fd_pr__pfet_01v8[gm] @m.x3.xm5.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x4.xm1.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm1.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm1.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x4.xm2.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm2.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm2.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x4.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x4.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x4.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x4.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x4.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x4.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x4.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x4.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x4.xm5.msky130_fd_pr__pfet_01v8[vds] @m.x4.xm5.msky130_fd_pr__pfet_01v8[vdsat] @m.x4.xm5.msky130_fd_pr__pfet_01v8[gm] @m.x4.xm5.msky130_fd_pr__pfet_01v8[id] >> op_hi.log

  alter Vcode dc = 64
  alter Vx dc = 10
  dc Vcode 0 127 1
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  let vdac1 = v(dac1)
  let vdac2 = v(dac2)
  let vi1 = v(i1)
  let vi2 = v(i2)
  let vdip = v(di_p)
  let vdin = v(di_n)
  let vnet1 = v(net1)
  let vnet3 = v(net3)
  let vnet4 = v(net4)
  let vnet6 = v(net6)
  wrdata code_sweep.csv dip din vdac1 vdac2 vi1 vi2 vdip vdin vnet1 vnet3 vnet4 vnet6 idd

  alter Vcode dc = 64
  dc Vx 0 20 0.02
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  let vdac1 = v(dac1)
  let vdac2 = v(dac2)
  let vi1 = v(i1)
  let vi2 = v(i2)
  let vdip = v(di_p)
  let vdin = v(di_n)
  let vnet1 = v(net1)
  let vnet3 = v(net3)
  let vnet4 = v(net4)
  let vnet6 = v(net6)
  wrdata in_sweep.csv dip din vdac1 vdac2 vi1 vi2 vdip vdin vnet1 vnet3 vnet4 vnet6 idd
  alter Vx dc = 10

  dc Vmid 0.05 1.75 0.01
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  let vdac1 = v(dac1)
  let vdac2 = v(dac2)
  let vi1 = v(i1)
  let vi2 = v(i2)
  let vdip = v(di_p)
  let vdin = v(di_n)
  let vnet1 = v(net1)
  let vnet3 = v(net3)
  let vnet4 = v(net4)
  let vnet6 = v(net6)
  wrdata vmid_sweep.csv dip din vdac1 vdac2 vi1 vi2 vdip vdin vnet1 vnet3 vnet4 vnet6 idd
  alter Vmid dc = 0.9

  alter Rcp = 32k
  alter Rcn = 32k
  dc Vcode 0 127 1
  let idd = -i(Vdd)
  let dip = i(Vmp)
  let din = i(Vmn)
  let vdac1 = v(dac1)
  let vdac2 = v(dac2)
  let vi1 = v(i1)
  let vi2 = v(i2)
  let vdip = v(di_p)
  let vdin = v(di_n)
  let vnet1 = v(net1)
  let vnet3 = v(net3)
  let vnet4 = v(net4)
  let vnet6 = v(net6)
  wrdata code_sweep_clamp.csv dip din vdac1 vdac2 vi1 vi2 vdip vdin vnet1 vnet3 vnet4 vnet6 idd
  alter Vcode dc = 64

  op
  ac dec 50 1k 10G
  let dz = v(di_p) - v(di_n)
  let zdb = db(dz)
  let zph = cph(dz)*180/pi
  wrdata ac.csv zdb zph

  alter Vcode dc = 63
  tran 0.1n 520n
  let vdip = v(di_p)
  let vdin = v(di_n)
  let vdac1 = v(dac1)
  let vdac2 = v(dac2)
  let vi1 = v(i1)
  let vi2 = v(i2)
  let vnet1 = v(net1)
  let vnet3 = v(net3)
  wrdata tran.csv vdip vdin vdac1 vdac2 vi1 vi2 vnet1 vnet3
.endc
"}
C {devices/launcher.sym} 50 490 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 50 550 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
