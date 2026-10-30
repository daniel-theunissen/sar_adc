v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 320 -90 400 -90 {lab=#net1}
N 400 -90 400 -50 {lab=#net1}
N 320 -70 340 -70 {lab=#net2}
N 340 -70 340 -50 {lab=#net2}
N -90 -400 -90 -360 {lab=VDD}
N -50 -330 20 -330 {lab=#net3}
N 60 -300 60 -240 {lab=Iin}
N 60 -400 60 -360 {lab=VDD}
N -20 -330 -20 -300 {lab=#net3}
N -90 -300 -20 -300 {lab=#net3}
C {isource.sym} -90 -270 0 1 {name=Iin value=20u}
C {vsource.sym} -360 -80 0 0 {name=Vgate value=1.8 savecurrent=true}
C {lab_pin.sym} -360 -110 0 0 {name=p10 sig_type=std_logic lab=Vgate}
C {gnd.sym} -360 -50 0 0 {name=l1 lab=0}
C {vsource.sym} -360 30 0 0 {name=Vd[0..6] value=1.8 savecurrent=true}
C {lab_pin.sym} -360 0 0 0 {name=p11 sig_type=std_logic lab=d[0..6]}
C {gnd.sym} -360 60 0 0 {name=l2 lab=0}
C {code.sym} -270 -270 0 0 {
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
C {code_shown.sym} -290 -90 0 0 {name=SPICE only_toplevel=false value="
.include ladder_tb.save
.option savecurrents
.control
  save all
  op
  write ladder_tb.raw
.endc
"}
C {devices/launcher.sym} -230 70 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {lab_pin.sym} 60 -240 0 0 {name=p1 sig_type=std_logic lab=Iin}
C {lab_pin.sym} 20 -60 0 0 {name=p2 sig_type=std_logic lab=Iin}
C {lab_pin.sym} 20 -80 0 0 {name=p3 sig_type=std_logic lab=Vgate}
C {lab_pin.sym} 20 -100 0 0 {name=p4 sig_type=std_logic lab=d[0..6]}
C {vsource.sym} -510 -80 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -510 -110 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -510 -50 0 0 {name=l3 lab=0}
C {gnd.sym} 170 -20 0 0 {name=l4 lab=0}
C {lab_pin.sym} 170 -140 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {ccvs.sym} 470 -70 0 0 {name=H2 vnam=VIout value=1000}
C {gnd.sym} 470 -40 0 0 {name=l5 lab=0}
C {lab_pin.sym} 470 -100 0 0 {name=p9 sig_type=std_logic lab=Vout}
C {ammeter.sym} 400 -20 0 0 {name=VIout savecurrent=true spice_ignore=0}
C {ammeter.sym} 340 -20 0 0 {name=VIdump savecurrent=true spice_ignore=0}
C {devices/code.sym} -440 -270 0 0 {name=SPICE_SWEEP only_toplevel=false value="
.control
  set wr_vecnames
  set wr_singlescale
  unset appendwrite
  set code = 0
  while $code < 128
    let b0 = floor($code/64) % 2
    let b1 = floor($code/32) % 2
    let b2 = floor($code/16) % 2
    let b3 = floor($code/8) % 2
    let b4 = floor($code/4) % 2
    let b5 = floor($code/2) % 2
    let b6 = $code % 2

    let vh = 1.8
    let v0 = b0*vh
    let v1 = b1*vh
    let v2 = b2*vh
    let v3 = b3*vh
    let v4 = b4*vh
    let v5 = b5*vh
    let v6 = b6*vh

    alter Vd0 $&v0
    alter Vd1 $&v1
    alter Vd2 $&v2
    alter Vd3 $&v3
    alter Vd4 $&v4
    alter Vd5 $&v5
    alter Vd6 $&v6

    op
    let cv = $code
    wrdata code_sweep.csv cv vout

    unset wr_vecnames
    set appendwrite
    let n = $code + 1
    set code = $&n
  end
.endc
"}
C {sky130_fd_pr/pfet3_01v8.sym} -70 -330 0 1 {name=M1
W=2
L=4
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
C {lab_pin.sym} -90 -400 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet3_01v8.sym} 40 -330 0 0 {name=M2
W=2
L=4
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
C {lab_pin.sym} 60 -400 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {vsource.sym} 330 90 0 0 {name=Vref value=0.25 savecurrent=true}
C {lab_pin.sym} 330 60 0 0 {name=p12 sig_type=std_logic lab=Vref}
C {gnd.sym} 330 120 0 0 {name=l6 lab=0}
C {lab_pin.sym} 340 10 0 0 {name=p13 sig_type=std_logic lab=Vref}
C {lab_pin.sym} 400 10 0 1 {name=p14 sig_type=std_logic lab=Vref}
C {/foss/designs/sar_adc/sch/ladder/ladder.sym} 170 -80 0 0 {name=x1}
C {devices/launcher.sym} -230 110 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
