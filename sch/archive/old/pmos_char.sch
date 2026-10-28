v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 390 -680 1190 -280 {flags=graph
y1=1.3e-30
y2=2.8e-07
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.8
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
node=i(@m.xm1.msky130_fd_pr__pfet_01v8[id])
color=4
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/pmos_char.raw
sim_type=dc
autoload=0}
N 230 -150 290 -150 {lab=Vb}
C {lab_pin.sym} 190 -150 0 0 {name=p1 sig_type=std_logic lab=Vg}
C {lab_pin.sym} 230 -180 1 0 {name=p2 sig_type=std_logic lab=Vs}
C {lab_pin.sym} 290 -150 2 0 {name=p3 sig_type=std_logic lab=Vb}
C {lab_pin.sym} 230 -120 3 0 {name=p4 sig_type=std_logic lab=Vd}
C {code.sym} -110 -400 0 0 {
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
C {code_shown.sym} -370 -230 0 0 {name=SPICE only_toplevel=false value="
.include pmos_char.save
.option savecurrents
.control
  shell mkdir -p /foss/designs/sar_adc/sch/pmos_char
  shell pwd
  save all
  set wr_vecnames
  set wr_singlescale
  op
  write pmos_char.raw
  set appendwrite
  dc Vg 0 1.8 0.05
  write pmos_char.raw
  wrdata /foss/designs/sar_adc/sch/pmos_char/pmos_char.txt @m.xm1.msky130_fd_pr__pfet_01v8[id] @m.xm1.msky130_fd_pr__pfet_01v8[gm] @m.xm1.msky130_fd_pr__pfet_01v8[gds]
.endc
"}
C {vsource.sym} 210 -310 0 0 {name=Vsb value=-0.6 savecurrent=true}
C {lab_pin.sym} 210 -340 0 0 {name=p5 sig_type=std_logic lab=Vs}
C {vsource.sym} 300 -310 0 0 {name=Vds value=-0.3 savecurrent=true}
C {lab_pin.sym} 300 -340 0 0 {name=p6 sig_type=std_logic lab=Vd}
C {lab_pin.sym} 210 -280 0 0 {name=p7 sig_type=std_logic lab=Vb}
C {lab_pin.sym} 50 -340 0 0 {name=p8 sig_type=std_logic lab=Vb}
C {vsource.sym} 50 -310 0 0 {name=Vb value=1.8 savecurrent=true}
C {gnd.sym} 50 -280 0 0 {name=l2 lab=0}
C {lab_pin.sym} 300 -280 0 0 {name=p9 sig_type=std_logic lab=Vs}
C {vsource.sym} 120 -310 0 0 {name=Vg value=0 savecurrent=true}
C {lab_pin.sym} 120 -340 0 0 {name=p10 sig_type=std_logic lab=Vg}
C {gnd.sym} 120 -280 0 0 {name=l1 lab=0}
C {sky130_fd_pr/annotate_fet_params.sym} 360 -200 0 0 {name=annot1 ref=M1}
C {sky130_fd_pr/pfet_01v8.sym} 210 -150 0 0 {name=M1
W=10
L=0.5
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
C {devices/launcher.sym} 680 -150 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {launcher.sym} 680 -210 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/@schname\\\\.raw dc"
}
