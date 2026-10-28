v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 460 -80 460 -60 {lab=q}
N 460 -80 610 -80 {lab=q}
N 610 -80 610 -60 {lab=q}
N 810 -80 810 -60 {lab=qb}
N 810 -80 960 -80 {lab=qb}
N 960 -80 960 -60 {lab=qb}
N 650 -30 670 -30 {lab=qb}
N 750 -30 770 -30 {lab=q}
N 610 -80 670 -80 {lab=q}
N 750 -80 810 -80 {lab=qb}
N 670 -30 750 -80 {lab=qb}
N 670 -80 750 -30 {lab=q}
N 650 -160 770 -160 {lab=phi2}
N 750 -370 770 -370 {lab=a}
N 810 -340 810 -320 {lab=b}
N 750 -320 810 -320 {lab=b}
N 610 -130 610 -90 {lab=q}
N 610 -90 610 -80 {lab=q}
N 810 -130 810 -80 {lab=qb}
N 810 -320 810 -190 {lab=b}
N 650 -370 670 -370 {lab=b}
N 670 -370 750 -320 {lab=b}
N 610 -340 610 -320 {lab=a}
N 610 -320 670 -320 {lab=a}
N 670 -320 750 -370 {lab=a}
N 610 -320 610 -200 {lab=a}
N 610 -200 610 -190 {lab=a}
N 610 -230 680 -230 {lab=a}
N 740 -230 810 -230 {lab=b}
N 270 -280 270 -170 {lab=b}
N 270 -280 810 -280 {lab=b}
N 110 -300 110 -170 {lab=a}
N 110 -300 610 -300 {lab=a}
N 710 -160 710 -140 {lab=phi2}
N 270 -110 270 -90 {lab=tail}
N 110 -90 270 -90 {lab=tail}
N 110 -110 110 -90 {lab=tail}
N 190 -90 190 -60 {lab=tail}
N 810 -110 860 -110 {lab=qb}
N 560 -110 610 -110 {lab=q}
N 190 -0 190 20 {lab=GND}
N 460 0 460 20 {lab=GND}
N 610 0 610 20 {lab=GND}
N 810 0 810 20 {lab=GND}
N 960 0 960 20 {lab=GND}
N 610 -420 610 -400 {lab=VDD}
N 810 -420 810 -400 {lab=VDD}
C {sky130_fd_pr/nfet3_01v8.sym} 90 -140 0 0 {name=M1
W=4.15
L=0.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 290 -140 0 1 {name=M2
W=4.15
L=0.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 170 -30 0 0 {name=M12
W=4.3
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
C {sky130_fd_pr/nfet3_01v8.sym} 440 -30 0 0 {name=M10
W=1
L=0.15
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
C {sky130_fd_pr/nfet3_01v8.sym} 630 -30 0 1 {name=M5
W=0.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 790 -30 0 0 {name=M6
W=0.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 980 -30 0 1 {name=M11
W=1
L=0.15
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
C {sky130_fd_pr/pfet3_01v8.sym} 790 -160 0 0 {name=M8
W=1
L=0.15
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
C {sky130_fd_pr/pfet3_01v8.sym} 630 -160 0 1 {name=M7
W=1
L=0.15
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
C {lab_pin.sym} 710 -270 0 0 {name=p1 sig_type=std_logic lab=phi1}
C {lab_pin.sym} 710 -140 0 0 {name=p2 sig_type=std_logic lab=phi2}
C {lab_pin.sym} 420 -30 0 0 {name=p3 sig_type=std_logic lab=phi2}
C {lab_pin.sym} 1000 -30 0 1 {name=p4 sig_type=std_logic lab=phi2}
C {lab_pin.sym} 560 -110 0 0 {name=p5 sig_type=std_logic lab=q}
C {lab_pin.sym} 860 -110 0 1 {name=p6 sig_type=std_logic lab=qb}
C {ipin.sym} -90 -150 0 0 {name=p13 lab=Vbias}
C {opin.sym} -100 0 0 0 {name=p15 lab=q}
C {iopin.sym} -90 -220 0 0 {name=p19 lab=VDD}
C {lab_pin.sym} -90 -220 0 0 {name=p20 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} -90 -150 0 1 {name=p10 sig_type=std_logic lab=Vbias}
C {iopin.sym} -90 -190 0 0 {name=p11 lab=GND}
C {lab_pin.sym} -90 -190 0 0 {name=p12 sig_type=std_logic lab=GND
only_toplevel=true}
C {ipin.sym} -90 -120 0 0 {name=p14 lab=Vp}
C {lab_pin.sym} -90 -120 0 1 {name=p16 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -100 0 0 0 {name=p17 sig_type=std_logic lab=q}
C {ipin.sym} -90 -90 0 0 {name=p37 lab=Vn}
C {lab_pin.sym} 70 -140 0 0 {name=p38 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 150 -30 0 0 {name=p7 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 310 -140 0 1 {name=p8 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -90 -90 0 1 {name=p9 sig_type=std_logic lab=Vn}
C {opin.sym} -100 30 0 0 {name=p18 lab=qb}
C {lab_pin.sym} -100 30 0 0 {name=p21 sig_type=std_logic lab=qb}
C {ipin.sym} -90 -60 0 0 {name=p22 lab=phi1}
C {lab_pin.sym} -90 -60 0 1 {name=p23 sig_type=std_logic lab=phi1}
C {ipin.sym} -90 -30 0 0 {name=p24 lab=phi2}
C {lab_pin.sym} -90 -30 0 1 {name=p25 sig_type=std_logic lab=phi2}
C {lab_pin.sym} 190 20 0 0 {name=p26 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 460 20 0 0 {name=p27 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 610 20 0 0 {name=p28 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 810 20 0 0 {name=p29 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 960 20 0 0 {name=p30 sig_type=std_logic lab=GND
only_toplevel=true}
C {lab_pin.sym} 610 -420 0 0 {name=p31 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 810 -420 0 0 {name=p32 sig_type=std_logic lab=VDD
only_toplevel=true}
C {lab_pin.sym} 110 -300 0 0 {name=p33 sig_type=std_logic lab=a}
C {lab_pin.sym} 270 -280 0 0 {name=p34 sig_type=std_logic lab=b}
C {lab_pin.sym} 190 -90 1 0 {name=p35 sig_type=std_logic lab=tail}
C {sky130_fd_pr/annotate_fet_params.sym} 930 -310 0 0 {name=annot1 ref=M9}
C {sky130_fd_pr/pfet3_01v8_lvt.sym} 630 -370 0 1 {name=M3
W=1
L=0.5
body=VDD
nf=1
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
C {sky130_fd_pr/pfet3_01v8_lvt.sym} 790 -370 0 0 {name=M4
W=1
L=0.5
body=VDD
nf=1
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
C {sky130_fd_pr/pfet3_01v8_lvt.sym} 710 -250 1 0 {name=M9
W=1
L=0.35
body=VDD
nf=1
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
