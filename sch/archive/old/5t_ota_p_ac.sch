v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 330 -390 1130 10 {flags=graph
y1=-9.2
y2=28
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
rawfile=$netlist_dir/5t_ota_p_ac.raw
sim_type=ac
autoload=0
color=4
node="\\"VdB;v(vout) db20()\\""}
N -210 -360 -210 -320 {lab=VDD}
N -170 -290 -100 -290 {lab=Vb}
N -140 -290 -140 -260 {lab=Vb}
N -210 -260 -140 -260 {lab=Vb}
N 190 -60 250 -60 {lab=0}
N 190 -40 190 -0 {lab=Vout}
C {5t_ota_p.sym} 40 -60 0 0 {name=x1}
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
.include 5t_ota_p_ac.save
.control
  save all
  op
  write 5t_ota_p_ac.raw
  set appendwrite
  ac dec 10 10 100Meg
  write 5t_ota_p_ac.raw v(vout) v(vp) v(vn)
.endc
"}
C {devices/launcher.sym} -450 80 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {isource.sym} -210 -230 0 1 {name=Iin value=20u}
C {vsource.sym} -630 -40 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -630 -70 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -630 -10 0 0 {name=l3 lab=0}
C {sky130_fd_pr/pfet3_01v8.sym} -190 -290 0 1 {name=M1
W=20
L=2
body=VDD
nf=4
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} -210 -360 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {vsource.sym} -10 -250 0 0 {name=Vp value="ac 0.5 dc 0.4" savecurrent=true}
C {lab_pin.sym} -10 -280 0 0 {name=p12 sig_type=std_logic lab=Vp}
C {gnd.sym} -10 -220 0 0 {name=l6 lab=0}
C {vsource.sym} 110 -250 0 0 {name=Vn value="ac -0.5 dc 0.4" savecurrent=true}
C {lab_pin.sym} 110 -280 0 0 {name=p1 sig_type=std_logic lab=Vn}
C {gnd.sym} 110 -220 0 0 {name=l1 lab=0}
C {lab_pin.sym} -110 -60 0 0 {name=p2 sig_type=std_logic lab=Vn}
C {lab_pin.sym} -110 -80 0 0 {name=p3 sig_type=std_logic lab=Vp}
C {lab_pin.sym} -100 -290 0 1 {name=p4 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -110 -40 0 0 {name=p6 sig_type=std_logic lab=Vb}
C {lab_pin.sym} 190 -80 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {gnd.sym} 250 -60 0 0 {name=l2 lab=0}
C {lab_pin.sym} 190 -40 0 1 {name=p9 sig_type=std_logic lab=Vout}
C {parax_cap.sym} 190 10 0 0 {name=C1 gnd=0 value=20f m=1}
C {launcher.sym} 430 70 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/@schname\\\\.raw ac"
}
