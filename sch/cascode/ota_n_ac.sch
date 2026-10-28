v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 330 -390 1130 10 {flags=graph
y1=-37
y2=-1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1
x2=8
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
dataset=-1
unitx=1
logx=1
logy=0
rawfile=$netlist_dir/ota_n_ac.raw
sim_type=ac
autoload=0
color=4
node="\\"VdB;v(vout) db20()\\""}
N -260 -510 -260 -470 {lab=VDD}
N 190 -120 250 -120 {lab=0}
N 190 -100 190 -60 {lab=Vout}
N -220 -440 -220 -410 {lab=Vbp1}
N -260 -410 -220 -410 {lab=Vbp1}
N -90 -510 -90 -470 {lab=VDD}
N -50 -440 -50 -410 {lab=Vbp2}
N -90 -410 -50 -410 {lab=Vbp2}
N 120 -450 120 -420 {lab=Vbn1}
N 80 -450 120 -450 {lab=Vbn1}
N 80 -390 80 -360 {lab=0}
N 290 -450 290 -420 {lab=Vbn2}
N 250 -450 290 -450 {lab=Vbn2}
N 250 -390 250 -360 {lab=0}
C {code.sym} -490 -290 0 0 {
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
C {code_shown.sym} -510 -140 0 0 {name=SPICE only_toplevel=false value="
.option savecurrents
.include ota_n_ac.save
.control
  save all
  op
  write @schname\\\\.raw
  set appendwrite
  ac dec 10 10 100Meg
  write @schname\\\\.raw v(vout) v(vp) v(vn)
.endc
"}
C {devices/launcher.sym} -450 80 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {isource.sym} -260 -380 0 1 {name=Iin value=24u}
C {vsource.sym} -630 -40 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -630 -70 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -630 -10 0 0 {name=l3 lab=0}
C {lab_pin.sym} -260 -510 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {vsource.sym} -10 -250 0 0 {name=Vp value="ac 0.5 dc 1.55" savecurrent=true}
C {lab_pin.sym} -10 -280 0 0 {name=p12 sig_type=std_logic lab=Vp}
C {gnd.sym} -10 -220 0 0 {name=l6 lab=0}
C {vsource.sym} 110 -250 0 0 {name=Vn value="ac -0.5 dc 1.55" savecurrent=true}
C {lab_pin.sym} 110 -280 0 0 {name=p1 sig_type=std_logic lab=Vn}
C {gnd.sym} 110 -220 0 0 {name=l1 lab=0}
C {lab_pin.sym} -110 -40 0 0 {name=p2 sig_type=std_logic lab=Vn}
C {lab_pin.sym} -110 -60 0 0 {name=p3 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -220 -410 0 1 {name=p4 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} -110 -140 0 0 {name=p6 sig_type=std_logic lab=Vbn1}
C {lab_pin.sym} 190 -140 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {gnd.sym} 250 -120 0 0 {name=l2 lab=0}
C {lab_pin.sym} 190 -100 0 1 {name=p9 sig_type=std_logic lab=Vout}
C {parax_cap.sym} 190 -50 0 0 {name=C1 gnd=0 value=120f m=1}
C {launcher.sym} 430 70 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/@schname\\\\.raw ac"
}
C {devices/launcher.sym} -450 120 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {/foss/designs/sar_adc/sch/cascode/ota_n.sym} 40 -90 0 0 {name=x1}
C {lab_pin.sym} -110 -120 0 0 {name=p10 sig_type=std_logic lab=Vbn2}
C {lab_pin.sym} -110 -100 0 0 {name=p11 sig_type=std_logic lab=Vbp1}
C {lab_pin.sym} -110 -80 0 0 {name=p13 sig_type=std_logic lab=Vbp2}
C {isource.sym} -90 -380 0 1 {name=Iin1 value=14u}
C {lab_pin.sym} -90 -510 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -50 -410 0 1 {name=p15 sig_type=std_logic lab=Vbp2}
C {isource.sym} 80 -480 0 0 {name=Iin2 value=20u}
C {gnd.sym} 80 -360 0 0 {name=l4 lab=0}
C {lab_pin.sym} 120 -450 0 1 {name=p16 sig_type=std_logic lab=Vbn1}
C {isource.sym} 250 -480 0 0 {name=Iin3 value=14u}
C {gnd.sym} 250 -360 0 0 {name=l5 lab=0}
C {lab_pin.sym} 290 -450 0 1 {name=p17 sig_type=std_logic lab=Vbn2}
C {sky130_fd_pr/pfet3_01v8.sym} -240 -440 0 1 {name=M9
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
C {sky130_fd_pr/pfet3_01v8.sym} -70 -440 0 1 {name=M7
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
C {sky130_fd_pr/nfet3_01v8.sym} 270 -420 0 1 {name=M10
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
C {sky130_fd_pr/nfet3_01v8.sym} 100 -420 0 1 {name=M2
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
