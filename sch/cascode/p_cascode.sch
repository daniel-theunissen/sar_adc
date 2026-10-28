v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -340 -300 -340 -260 {lab=Vref}
N -60 -490 -60 -440 {lab=d1}
N 70 -360 90 -360 {lab=0}
N 300 -260 300 -240 {lab=Vsum_out}
N 70 -340 160 -340 {lab=#net1}
N -230 -280 -230 -220 {lab=vfb}
N -230 -220 -120 -220 {lab=vfb}
N 200 -310 200 -260 {lab=Vsum_out}
N 200 -260 300 -260 {lab=Vsum_out}
N 200 -480 200 -370 {lab=d1}
N -60 -440 -60 -220 {lab=d1}
N -60 -440 200 -440 {lab=d1}
N -340 -300 -230 -300 {lab=Vref}
N 80 -560 160 -560 {lab=#net2}
N 160 -560 160 -510 {lab=#net2}
N 100 -560 100 -530 {lab=#net2}
N 40 -530 100 -530 {lab=#net2}
N -1070 -530 -1070 -490 {lab=VDD}
N -1030 -460 -1030 -430 {lab=Vbp1}
N -1070 -430 -1030 -430 {lab=Vbp1}
N -900 -530 -900 -490 {lab=VDD}
N -860 -460 -860 -430 {lab=Vbp2}
N -900 -430 -860 -430 {lab=Vbp2}
N -690 -470 -690 -440 {lab=Vbn1}
N -730 -470 -690 -470 {lab=Vbn1}
N -730 -410 -730 -380 {lab=0}
N -520 -470 -520 -440 {lab=Vbn2}
N -560 -470 -520 -470 {lab=Vbn2}
N -560 -410 -560 -380 {lab=0}
N 200 -580 200 -540 {lab=VDD}
N 40 -620 40 -590 {lab=VDD}
C {vsource.sym} -340 -230 0 0 {name=Vref value=1.55 savecurrent=true}
C {lab_pin.sym} -340 -300 0 0 {name=p5 sig_type=std_logic lab=Vref}
C {gnd.sym} -340 -200 0 0 {name=l3 lab=0}
C {vsource.sym} -820 -150 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -820 -180 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -820 -120 0 0 {name=l1 lab=0}
C {isource.sym} -60 -520 0 1 {name=Iladder value="dc 10u ac 0 pulse(0 10u 1u 1n 1n 4u 10u)"}
C {lab_pin.sym} 70 -380 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {gnd.sym} 90 -360 0 0 {name=l4 lab=0}
C {vsource.sym} 300 -210 0 0 {name=Vsum_out value=1.35 savecurrent=true}
C {gnd.sym} 300 -180 0 0 {name=l6 lab=0}
C {lab_pin.sym} 300 -260 0 1 {name=p10 sig_type=std_logic lab=Vsum_out}
C {code.sym} -710 -210 0 0 {
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
C {code_shown.sym} -560 -80 0 0 {name=SPICE only_toplevel=false value="
.include p_cascode.save
.option savecurrents
.control
  set wr_vecnames
  set wr_singlescale
  save all
  op
  let id1 = -i(Vsum_out)
  print v(Vsum_out) v(Vg) v(d1) v(Vbn)
  print @m.xm1.msky130_fd_pr__pfet_01v8[vdsat] @m.xm1.msky130_fd_pr__pfet_01v8[gm]
  print @m.xm2.msky130_fd_pr__pfet_01v8[vdsat] @m.xm2.msky130_fd_pr__pfet_01v8[gm]
  write @schname\\\\.raw

  dc Iladder 0 20u 0.1u
  let id1 = -i(Vsum_out)
  wrdata dc_sweep.csv v(d1) v(Vg) id1

  foreach ilev 0 10u 20u
    alter Iladder dc = $ilev
    ac dec 50 10 1G
    let T   = -v(d1)/v(vfb)
    let Tdb = db(T)
    let Tph = cph(T)*180/pi
    wrdata loop_\{$ilev\}.csv Tdb Tph
  end

  alter Vinj ac = 0
  alter Iladder ac = 1
  ac dec 50 10 1G
  let zin = mag(v(d1))
  wrdata zin.csv zin

  alter Iladder ac = 0
  tran 1n 6u
  let id1 = -i(Vsum_out)
  wrdata tran.csv v(d1) v(Vg) id1
.endc
"}
C {devices/launcher.sym} -40 40 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} -40 80 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {vsource.sym} -90 -220 3 1 {name=Vinj value="dc 0 ac 1" savecurrent=true}
C {lab_pin.sym} -230 -220 0 0 {name=p12 sig_type=std_logic lab=vfb}
C {lab_pin.sym} -60 -470 0 1 {name=p2 sig_type=std_logic lab=d1}
C {sky130_fd_pr/annotate_fet_params.sym} 250 -70 0 0 {name=annot1 ref=M1}
C {/foss/designs/sar_adc/sch/cascode/ota_n.sym} -80 -330 0 0 {name=x1}
C {sky130_fd_pr/pfet3_01v8.sym} 180 -510 0 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 180 -340 0 0 {name=M2
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
C {sky130_fd_pr/pfet3_01v8.sym} 60 -560 0 1 {name=M3
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
C {isource.sym} 40 -500 0 0 {name=Ibsum value=40u}
C {isource.sym} -1070 -400 0 1 {name=Iin value=24u}
C {lab_pin.sym} -1070 -530 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1030 -430 0 1 {name=p4 sig_type=std_logic lab=Vbp1}
C {isource.sym} -900 -400 0 1 {name=Iin1 value=14u}
C {lab_pin.sym} -900 -530 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -860 -430 0 1 {name=p15 sig_type=std_logic lab=Vbp2}
C {isource.sym} -730 -500 0 0 {name=Iin2 value=20u}
C {gnd.sym} -730 -380 0 0 {name=l2 lab=0}
C {lab_pin.sym} -690 -470 0 1 {name=p16 sig_type=std_logic lab=Vbn1}
C {isource.sym} -560 -500 0 0 {name=Iin3 value=14u}
C {gnd.sym} -560 -380 0 0 {name=l5 lab=0}
C {lab_pin.sym} -520 -470 0 1 {name=p17 sig_type=std_logic lab=Vbn2}
C {sky130_fd_pr/pfet3_01v8.sym} -1050 -460 0 1 {name=M9
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
C {sky130_fd_pr/pfet3_01v8.sym} -880 -460 0 1 {name=M7
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
C {sky130_fd_pr/nfet3_01v8.sym} -540 -440 0 1 {name=M10
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
C {sky130_fd_pr/nfet3_01v8.sym} -710 -440 0 1 {name=M4
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
C {lab_pin.sym} -230 -340 0 0 {name=p6 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} -230 -320 0 0 {name=p8 sig_type=std_logic lab=Vbp2}
C {lab_pin.sym} -230 -380 0 0 {name=p9 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} -230 -360 0 0 {name=p11 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} 200 -580 0 1 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 40 -620 0 1 {name=p18 sig_type=std_logic lab=VDD}
