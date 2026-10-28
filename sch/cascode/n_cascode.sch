v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 -200 110 -200 {lab=Vg}
N 150 -170 150 -70 {lab=d1}
N -180 -220 -180 -130 {lab=vfb}
N -250 -220 -180 -220 {lab=vfb}
N -340 -240 -340 -200 {lab=Vref}
N -340 -240 -250 -240 {lab=Vref}
N -10 -110 -10 -60 {lab=d1}
N 150 -10 150 10 {lab=0}
N 50 -220 70 -220 {lab=0}
N -650 10 -650 50 {lab=Vbn}
N -610 30 -610 80 {lab=Vbn}
N -650 30 -610 30 {lab=Vbn}
N -650 110 -650 130 {lab=0}
N -780 0 -780 50 {lab=Vbp}
N -820 50 -780 50 {lab=Vbp}
N -820 30 -820 70 {lab=Vbp}
N -820 -50 -820 -30 {lab=VDD}
N 150 -260 150 -230 {lab=Vsum_out}
N 150 -260 300 -260 {lab=Vsum_out}
N 300 -260 300 -240 {lab=Vsum_out}
N -180 -110 -130 -110 {lab=vfb}
N -70 -110 150 -110 {lab=d1}
N -180 -130 -180 -110 {lab=vfb}
N 50 -200 50 -180 {lab=Vg}
C {sky130_fd_pr/nfet3_01v8.sym} 130 -40 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 130 -200 0 0 {name=M2
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
C {/foss/designs/sar_adc/sch/cascode/ota_p.sym} -100 -220 0 0 {name=x1}
C {vsource.sym} -340 -170 0 0 {name=Vref value=0.25 savecurrent=true}
C {lab_pin.sym} -340 -240 0 0 {name=p5 sig_type=std_logic lab=Vref}
C {gnd.sym} -340 -140 0 0 {name=l3 lab=0}
C {vsource.sym} -820 -150 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -820 -180 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -820 -120 0 0 {name=l1 lab=0}
C {isource.sym} -820 100 0 1 {name=Iin value=10u}
C {sky130_fd_pr/pfet3_01v8.sym} -800 0 0 1 {name=M3
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
C {lab_pin.sym} -820 -50 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -780 50 0 1 {name=p4 sig_type=std_logic lab=Vbp}
C {isource.sym} -10 -30 2 0 {name=Iladder value="dc 10u ac 0 pulse(0 10u 1u 1n 1n 4u 10u)"}
C {gnd.sym} 150 10 0 0 {name=l2 lab=0}
C {lab_pin.sym} 50 -240 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {gnd.sym} 70 -220 0 0 {name=l4 lab=0}
C {lab_pin.sym} -250 -200 0 0 {name=p6 sig_type=std_logic lab=Vbp}
C {isource.sym} -650 -20 0 0 {name=Isum value=40u}
C {gnd.sym} -650 130 0 1 {name=l5 lab=0}
C {vsource.sym} 300 -210 0 0 {name=Vsum_out value=0.5 savecurrent=true}
C {gnd.sym} 300 -180 0 0 {name=l6 lab=0}
C {lab_pin.sym} 300 -260 0 1 {name=p10 sig_type=std_logic lab=Vsum_out}
C {lab_pin.sym} 90 -200 1 1 {name=p11 sig_type=std_logic lab=Vg}
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
.include n_cascode.save
.option savecurrents
.control
  set wr_vecnames
  set wr_singlescale
  save all
  op
  let id1 = -i(Vsum_out)
  print v(Vsum_out) v(Vg) v(d1) v(Vbn)
  print @m.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.xm1.msky130_fd_pr__nfet_01v8[gm]
  print @m.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.xm2.msky130_fd_pr__nfet_01v8[gm]
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
C {lab_pin.sym} -610 30 0 1 {name=p8 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 110 -40 0 0 {name=p9 sig_type=std_logic lab=Vbn}
C {vsource.sym} -100 -110 3 1 {name=Vinj value="dc 0 ac 1" savecurrent=true}
C {lab_pin.sym} -180 -140 0 0 {name=p12 sig_type=std_logic lab=vfb}
C {lab_pin.sym} -10 -80 2 0 {name=p2 sig_type=std_logic lab=d1}
C {sky130_fd_pr/cap_mim_m3_2.sym} 50 -150 0 0 {name=C1 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {gnd.sym} 50 -120 0 0 {name=l7 lab=0}
C {sky130_fd_pr/annotate_fet_params.sym} 250 -70 0 0 {name=annot1 ref=M1}
C {sky130_fd_pr/nfet3_01v8.sym} -630 80 0 1 {name=M5
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
C {sky130_fd_pr/annotate_fet_params.sym} 130 -390 0 0 {name=annot2 ref=M2}
