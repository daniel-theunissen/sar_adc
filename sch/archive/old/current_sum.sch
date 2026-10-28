v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {sky130_fd_pr/nfet3_01v8.sym} -20 -10 0 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 130 -10 0 0 {name=M2
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
C {code.sym} -320 -190 0 0 {
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
C {code_shown.sym} -340 -10 0 0 {name=SPICE only_toplevel=false value="
.include dac_tb.save
.option savecurrents
.control
  save all
  op
  write dac_tb.raw
.endc
"}
C {devices/launcher.sym} -280 150 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {vsource.sym} -500 -30 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -500 -60 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -500 0 0 0 {name=l3 lab=0}
C {vsource.sym} -510 90 0 0 {name=Vref value=0.9 savecurrent=true}
C {lab_pin.sym} -510 60 0 0 {name=p1 sig_type=std_logic lab=Vref}
C {gnd.sym} -510 120 0 0 {name=l1 lab=0}
C {lab_pin.sym} -40 -10 0 0 {name=p2 sig_type=std_logic lab=Vref}
C {lab_pin.sym} 110 -10 0 0 {name=p3 sig_type=std_logic lab=Vref}
