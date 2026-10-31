v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 620 -250 620 -160 {lab=s1}
N 840 -250 840 -160 {lab=s2}
N 510 -280 580 -280 {lab=g1}
N 150 -220 150 -180 {lab=fb1}
N -140 20 -140 40 {lab=VDD}
N 450 -300 470 -300 {lab=0}
N 880 -280 950 -280 {lab=g2}
N 840 -180 1250 -180 {lab=s2}
N 1320 -220 1320 -180 {lab=s2}
N 1000 -300 1020 -300 {lab=0}
N 620 -360 620 -310 {lab=iop}
N 840 -360 840 -310 {lab=ion}
N 620 -210 700 -210 {lab=s1}
N 760 -210 840 -210 {lab=s2}
N -180 120 -180 180 {lab=Vbref}
N -180 120 -140 120 {lab=Vbref}
N -140 100 -140 150 {lab=Vbref}
N 580 -70 800 -70 {lab=Vbref}
N 620 -160 620 -100 {lab=s1}
N 840 -160 840 -100 {lab=s2}
N 450 -160 620 -160 {lab=s1}
N 150 -160 330 -160 {lab=fb1}
N 150 -180 150 -160 {lab=fb1}
N 390 -160 450 -160 {lab=s1}
N 450 -280 510 -280 {lab=g1}
N 950 -280 1020 -280 {lab=g2}
N 1250 -180 1320 -180 {lab=s2}
C {vi_converter/ota_vi.sym} 300 -270 0 0 {name=x1}
C {sky130_fd_pr/nfet3_01v8.sym} 600 -280 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 860 -280 0 1 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 600 -70 0 0 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} 820 -70 0 0 {name=M4
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
C {vsource.sym} -590 -330 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -590 -360 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -590 -300 0 0 {name=l1 lab=0}
C {code.sym} -90 -130 0 0 {
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
C {lab_pin.sym} -400 -510 0 0 {name=p15 sig_type=std_logic lab=Vbp2}
C {isource.sym} -140 70 0 1 {name=Iref value=10u}
C {lab_pin.sym} -140 20 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {gnd.sym} -140 210 0 0 {name=l20 lab=0}
C {devices/launcher.sym} 100 90 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 100 150 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {lab_pin.sym} 450 -320 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} 470 -300 0 0 {name=l3 lab=0}
C {sky130_fd_pr/cap_mim_m3_2.sym} 490 -250 0 0 {name=C1 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {gnd.sym} 490 -220 0 0 {name=l4 lab=0}
C {vi_converter/ota_vi.sym} 1170 -270 0 1 {name=x2}
C {lab_pin.sym} 1020 -320 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {gnd.sym} 1000 -300 0 1 {name=l6 lab=0}
C {sky130_fd_pr/cap_mim_m3_2.sym} 970 -250 0 1 {name=C2 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {gnd.sym} 970 -220 0 1 {name=l8 lab=0}
C {gnd.sym} 620 -40 0 0 {name=l9 lab=0}
C {gnd.sym} 840 -40 0 0 {name=l10 lab=0}
C {vsource.sym} -490 -330 0 0 {name=Vref2 value=1.55 savecurrent=true}
C {lab_pin.sym} -490 -360 0 0 {name=p5 sig_type=std_logic lab=vref2}
C {gnd.sym} -490 -300 0 0 {name=l11 lab=0}
C {lab_pin.sym} 620 -420 2 0 {name=p6 sig_type=std_logic lab=vref2}
C {lab_pin.sym} 840 -420 2 1 {name=p8 sig_type=std_logic lab=vref2}
C {sky130_fd_pr/res_high_po_0p35.sym} 730 -210 3 0 {name=R1
L=30.7
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {lab_pin.sym} 150 -320 0 0 {name=p9 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 150 -300 0 0 {name=p10 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 150 -280 0 0 {name=p11 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} 150 -260 0 0 {name=p12 sig_type=std_logic lab=Vbp2}
C {lab_pin.sym} 1320 -320 0 1 {name=p13 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 1320 -300 0 1 {name=p18 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 1320 -280 0 1 {name=p19 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} 1320 -260 0 1 {name=p20 sig_type=std_logic lab=Vbp2}
C {ammeter.sym} 620 -390 0 0 {name=Vo1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 840 -390 0 0 {name=Vo2 savecurrent=true spice_ignore=0}
C {lab_pin.sym} 620 -360 2 0 {name=p21 sig_type=std_logic lab=iop}
C {lab_pin.sym} 840 -360 2 1 {name=p22 sig_type=std_logic lab=ion}
C {vsource.sym} -390 -330 0 0 {name=Vcm value="dc 0.45" savecurrent=true}
C {lab_pin.sym} -390 -360 0 0 {name=p23 sig_type=std_logic lab=vcm}
C {gnd.sym} -390 -300 0 0 {name=l12 lab=0}
C {vsource.sym} -590 -220 0 0 {name=Vst value="dc 0 pwl(0n 0.0000 200n 0.0000 200.1n 0.2160 1000n 0.2160 1000.1n -0.2160 1800n -0.2160 1800.1n 0.0000 2600n 0.0000)" savecurrent=true}
C {lab_pin.sym} -590 -250 0 0 {name=p24 sig_type=std_logic lab=vst}
C {gnd.sym} -590 -190 0 0 {name=l13 lab=0}
C {bsource.sym} -590 -10 0 0 {name=Bd VAR=V FUNC="v(vdc) + (1 - v(mode))*v(vsn) + v(mode)*v(vst)" m=1}
C {gnd.sym} -590 20 0 0 {name=l15 lab=0}
C {lab_pin.sym} -590 -40 0 0 {name=p25 sig_type=std_logic lab=vd}
C {bsource.sym} -590 90 0 0 {name=Bp VAR=V FUNC="v(vcm) + 0.5*v(vd)" m=1}
C {gnd.sym} -590 120 0 0 {name=l16 lab=0}
C {lab_pin.sym} -590 60 0 0 {name=p28 sig_type=std_logic lab=inp}
C {bsource.sym} -390 90 0 0 {name=Bn VAR=V FUNC="v(vcm) - 0.5*v(vd)" m=1}
C {gnd.sym} -390 120 0 0 {name=l17 lab=0}
C {lab_pin.sym} -390 60 0 0 {name=p29 sig_type=std_logic lab=inn}
C {lab_pin.sym} 150 -240 0 0 {name=p30 sig_type=std_logic lab=inp}
C {lab_pin.sym} 1320 -240 0 1 {name=p31 sig_type=std_logic lab=inn}
C {vsource.sym} -90 -330 0 0 {name=Vtst value="dc 0 ac 1" savecurrent=true}
C {lab_pin.sym} -90 -360 0 0 {name=p32 sig_type=std_logic lab=tst}
C {gnd.sym} -90 -300 0 0 {name=l18 lab=0}
C {lab_pin.sym} -180 120 0 0 {name=p27 sig_type=std_logic lab=Vbref}
C {lab_pin.sym} 580 -70 0 0 {name=p33 sig_type=std_logic lab=Vbref}
C {ind.sym} 360 -160 1 0 {name=Lb1
m=1
value=1f
footprint=1206
device=inductor}
C {lab_pin.sym} 150 -100 0 0 {name=p37 sig_type=std_logic lab=tst}
C {lab_wire.sym} 490 -160 0 0 {name=p34 sig_type=std_logic lab=s1}
C {lab_wire.sym} 230 -160 0 0 {name=p38 sig_type=std_logic lab=fb1}
C {capa.sym} 150 -130 0 0 {name=Cb1
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 730 -190 0 0 {name=l19 lab=0}
C {lab_wire.sym} 580 -280 0 0 {name=p39 sig_type=std_logic lab=g1}
C {lab_wire.sym} 880 -280 0 1 {name=p40 sig_type=std_logic lab=g2}
C {lab_wire.sym} 1020 -180 0 1 {name=p41 sig_type=std_logic lab=s2}
C {vsource.sym} -280 -330 0 0 {name=Vmode value="dc 0" savecurrent=true}
C {lab_pin.sym} -280 -360 0 0 {name=p42 sig_type=std_logic lab=mode}
C {gnd.sym} -280 -300 0 0 {name=l21 lab=0}
C {vsource.sym} -180 -330 0 0 {name=Vdc value="dc 0" savecurrent=true}
C {lab_pin.sym} -180 -360 0 0 {name=p43 sig_type=std_logic lab=vdc}
C {gnd.sym} -180 -300 0 0 {name=l22 lab=0}
C {code.sym} 270 40 0 0 {name=SPICE_CTRL only_toplevel=false value="
.nodeset v(s1)=0.45 v(s2)=0.45 v(g1)=1.1 v(g2)=1.1
.save all
.option savecurrents
.include vi_converter_tb.save
.control
  save all
  set wr_singlescale
  set wr_vecnames
  * 1. operating points: mid scale, and the two ends of the input range (T1 or T2 nearly off)
  alter Vdc dc = 0
  op
  write @schname\\\\.raw
  let idd = -i(VDD)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  print idd io1 io2 v(inp) v(inn) v(s1) v(s2) v(g1) v(g2) v(vbref) v(vbp1) v(vbn1) v(vbn2) v(vbp2) > op_mid.log
  print @m.xm1.msky130_fd_pr__nfet_01v8[vds] @m.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.xm1.msky130_fd_pr__nfet_01v8[gm] @m.xm1.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm2.msky130_fd_pr__nfet_01v8[vds] @m.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.xm2.msky130_fd_pr__nfet_01v8[gm] @m.xm2.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm3.msky130_fd_pr__nfet_01v8[vds] @m.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.xm3.msky130_fd_pr__nfet_01v8[gm] @m.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm4.msky130_fd_pr__nfet_01v8[vds] @m.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.xm4.msky130_fd_pr__nfet_01v8[gm] @m.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.xm5.msky130_fd_pr__nfet_01v8[vds] @m.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.xm5.msky130_fd_pr__nfet_01v8[gm] @m.xm5.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm11.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm11.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm11.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_mid.log
  print @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_mid.log
  print @m.x1.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm5.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm6.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm6.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm6.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm6.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x1.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm7.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm8.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm9.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x1.xm10.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm10.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm10.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm10.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm11.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm11.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm11.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_mid.log
  print @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_mid.log
  print @m.x2.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm5.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm6.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm6.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm6.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm6.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm3.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm4.msky130_fd_pr__nfet_01v8[id] >> op_mid.log
  print @m.x2.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm7.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm8.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm9.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  print @m.x2.xm10.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm10.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm10.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm10.msky130_fd_pr__pfet_01v8[id] >> op_mid.log
  alter Vdc dc = -0.2646
  op
  let idd = -i(VDD)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  print idd io1 io2 v(inp) v(inn) v(s1) v(s2) v(g1) v(g2) v(vbref) v(vbp1) v(vbn1) v(vbn2) v(vbp2) > op_lo.log
  print @m.xm1.msky130_fd_pr__nfet_01v8[vds] @m.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.xm1.msky130_fd_pr__nfet_01v8[gm] @m.xm1.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm2.msky130_fd_pr__nfet_01v8[vds] @m.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.xm2.msky130_fd_pr__nfet_01v8[gm] @m.xm2.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm3.msky130_fd_pr__nfet_01v8[vds] @m.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.xm3.msky130_fd_pr__nfet_01v8[gm] @m.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm4.msky130_fd_pr__nfet_01v8[vds] @m.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.xm4.msky130_fd_pr__nfet_01v8[gm] @m.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.xm5.msky130_fd_pr__nfet_01v8[vds] @m.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.xm5.msky130_fd_pr__nfet_01v8[gm] @m.xm5.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm11.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm11.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm11.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_lo.log
  print @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_lo.log
  print @m.x1.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm5.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm6.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm6.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm6.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm6.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x1.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm7.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm8.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm9.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x1.xm10.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm10.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm10.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm10.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm11.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm11.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm11.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_lo.log
  print @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_lo.log
  print @m.x2.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm5.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm6.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm6.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm6.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm6.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm3.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm4.msky130_fd_pr__nfet_01v8[id] >> op_lo.log
  print @m.x2.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm7.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm8.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm9.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  print @m.x2.xm10.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm10.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm10.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm10.msky130_fd_pr__pfet_01v8[id] >> op_lo.log
  alter Vdc dc = 0.2646
  op
  let idd = -i(VDD)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  print idd io1 io2 v(inp) v(inn) v(s1) v(s2) v(g1) v(g2) v(vbref) v(vbp1) v(vbn1) v(vbn2) v(vbp2) > op_hi.log
  print @m.xm1.msky130_fd_pr__nfet_01v8[vds] @m.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.xm1.msky130_fd_pr__nfet_01v8[gm] @m.xm1.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm2.msky130_fd_pr__nfet_01v8[vds] @m.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.xm2.msky130_fd_pr__nfet_01v8[gm] @m.xm2.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm3.msky130_fd_pr__nfet_01v8[vds] @m.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.xm3.msky130_fd_pr__nfet_01v8[gm] @m.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm4.msky130_fd_pr__nfet_01v8[vds] @m.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.xm4.msky130_fd_pr__nfet_01v8[gm] @m.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.xm5.msky130_fd_pr__nfet_01v8[vds] @m.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.xm5.msky130_fd_pr__nfet_01v8[gm] @m.xm5.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm11.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm11.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm11.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_hi.log
  print @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_hi.log
  print @m.x1.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm5.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm6.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm6.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm6.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm6.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x1.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x1.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x1.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm7.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm8.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm9.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x1.xm10.msky130_fd_pr__pfet_01v8[vds] @m.x1.xm10.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xm10.msky130_fd_pr__pfet_01v8[gm] @m.x1.xm10.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm11.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm11.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm11.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm11.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_hi.log
  print @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_hi.log
  print @m.x2.xm5.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm5.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm5.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm5.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm6.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm6.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm6.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm6.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm3.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm3.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm3.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm4.msky130_fd_pr__nfet_01v8[vds] @m.x2.xm4.msky130_fd_pr__nfet_01v8[vdsat] @m.x2.xm4.msky130_fd_pr__nfet_01v8[gm] @m.x2.xm4.msky130_fd_pr__nfet_01v8[id] >> op_hi.log
  print @m.x2.xm7.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm7.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm7.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm7.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm8.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm8.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm8.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm8.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm9.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm9.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm9.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm9.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  print @m.x2.xm10.msky130_fd_pr__pfet_01v8[vds] @m.x2.xm10.msky130_fd_pr__pfet_01v8[vdsat] @m.x2.xm10.msky130_fd_pr__pfet_01v8[gm] @m.x2.xm10.msky130_fd_pr__pfet_01v8[id] >> op_hi.log
  alter Vdc dc = 0

  * 2. static transfer: vd from -(half + 0.05) to +(half + 0.05)
  dc Vdc -0.350 0.350 0.002
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vs1 = v(s1)
  let vs2 = v(s2)
  let vg1 = v(g1)
  let vg2 = v(g2)
  let vinp = v(inp)
  let vinn = v(inn)
  let idd = -i(VDD)
  wrdata dc_sweep.csv io1 io2 vs1 vs2 vg1 vg2 vinp vinn idd

  * 3. input common-mode sweeps at three differential inputs
  alter Vdc dc = -0.243
  dc Vcm 0.05 1.45 0.01
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vs1 = v(s1)
  let vs2 = v(s2)
  let vg1 = v(g1)
  let vg2 = v(g2)
  let vinp = v(inp)
  let vinn = v(inn)
  let idd = -i(VDD)
  wrdata cm_sweep_lo.csv io1 io2 vs1 vs2 vg1 vg2 vinp vinn idd
  alter Vdc dc = 0
  dc Vcm 0.05 1.45 0.01
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vs1 = v(s1)
  let vs2 = v(s2)
  let vg1 = v(g1)
  let vg2 = v(g2)
  let vinp = v(inp)
  let vinn = v(inn)
  let idd = -i(VDD)
  wrdata cm_sweep_mid.csv io1 io2 vs1 vs2 vg1 vg2 vinp vinn idd
  alter Vdc dc = 0.243
  dc Vcm 0.05 1.45 0.01
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vs1 = v(s1)
  let vs2 = v(s2)
  let vg1 = v(g1)
  let vg2 = v(g2)
  let vinp = v(inp)
  let vinn = v(inn)
  let idd = -i(VDD)
  wrdata cm_sweep_hi.csv io1 io2 vs1 vs2 vg1 vg2 vinp vinn idd
  alter Vdc dc = 0

  * 4. voltage of the regulated nodes (where do T1 and T2 stay saturated?)
  dc Vref2 0.3 1.8 0.01
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vs1 = v(s1)
  let vs2 = v(s2)
  let vg1 = v(g1)
  let vg2 = v(g2)
  let vinp = v(inp)
  let vinn = v(inn)
  let idd = -i(VDD)
  wrdata out_sweep.csv io1 io2 vs1 vs2 vg1 vg2 vinp vinn idd
  alter Vref2 dc = 1.55

  * 5. transient with the coherent sine (-0.5 dBFS, 113.28 kHz, 29 periods in 256 us)
  alter Vmode dc = 0
  option reltol=1e-4
  tran 5n 256.0u
  let vdiff = v(inp) - v(inn)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  wrdata tran_sine.csv vdiff io1 io2

  * 6. transient with large steps (settling): 0 -> +0.8 half -> -0.8 half -> 0
  alter Vmode dc = 1
  tran 0.1n 2.6u
  let vdiff = v(inp) - v(inn)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vg1 = v(g1)
  let vs1 = v(s1)
  wrdata tran_step.csv vdiff io1 io2 vg1 vs1

  * 7. loop gain of side 1: open the feedback into OTA 1 (1 GH from s1 to fb1) and feed the test signal in through 1 GF at tst.
  *    T(s) = - v(s1) / v(fb1); v(fb1) is the test signal itself. Mid scale and the two ends of the range.
  alter Vdc dc = 0
  alter Lb1 = 1G
  alter Cb1 = 1G
  op
  ac dec 40 1k 10G
  let lg = -v(s1)
  wrdata ac_loop_mid.csv lg
  alter Vdc dc = -0.243
  op
  ac dec 40 1k 10G
  let lg = -v(s1)
  wrdata ac_loop_lo.csv lg
  alter Vdc dc = 0.243
  op
  ac dec 40 1k 10G
  let lg = -v(s1)
  wrdata ac_loop_hi.csv lg
  alter Lb1 = 1p
  alter Cb1 = 1f
  alter Vdc dc = 0
.endc
"}
C {vsource.sym} -400 -480 0 0 {name=Vbp2 value=0.497 savecurrent=true}
C {gnd.sym} -400 -450 0 0 {name=l7 lab=0}
C {lab_pin.sym} -590 -510 0 0 {name=p4 sig_type=std_logic lab=Vbp1}
C {vsource.sym} -590 -480 0 0 {name=Vbp1 value=0.608 savecurrent=true}
C {gnd.sym} -590 -450 0 0 {name=l14 lab=0}
C {lab_pin.sym} -220 -510 0 0 {name=p7 sig_type=std_logic lab=Vbn1}
C {vsource.sym} -220 -480 0 0 {name=Vbn1 value=0.681 savecurrent=true}
C {gnd.sym} -220 -450 0 0 {name=l2 lab=0}
C {lab_pin.sym} -50 -510 0 0 {name=p14 sig_type=std_logic lab=Vbn2}
C {vsource.sym} -50 -480 0 0 {name=Vbn2 value=0.883 savecurrent=true}
C {gnd.sym} -50 -450 0 0 {name=l5 lab=0}
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
C {vsource.sym} -590 -120 0 0 {name=Vsin value="dc 0 sin(0 0.2549 113281.2 0 0 0)" savecurrent=true}
C {lab_pin.sym} -590 -150 0 0 {name=p16 sig_type=std_logic lab=vsn}
C {gnd.sym} -590 -90 0 0 {name=l23 lab=0}
