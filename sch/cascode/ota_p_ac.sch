v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 330 -390 1130 10 {flags=graph
y1=-48
y2=-24
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
rawfile=$netlist_dir/ota_p_ac.raw
sim_type=ac
autoload=0
color=4
node="\\"VdB;v(out) db20()\\""}
N -210 -360 -210 -320 {lab=VDD}
N -170 -290 -100 -290 {lab=Vb}
N -140 -290 -140 -260 {lab=Vb}
N -210 -260 -140 -260 {lab=Vb}
N 190 -60 250 -60 {lab=0}
N 190 -40 190 20 {lab=out}
N 160 20 190 20 {lab=out}
N 40 20 100 20 {lab=x}
N -160 20 -20 20 {lab=inn}
N -160 -60 -160 20 {lab=inn}
N -160 -60 -110 -60 {lab=inn}
N 10 -260 10 -240 {lab=vcm}
N 10 -350 10 -320 {lab=inp}
N 90 90 90 110 {lab=vot}
N 190 20 240 20 {lab=out}
N -160 20 -160 60 {lab=inn}
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
C {code_shown.sym} -570 -140 0 0 {name=SPICE only_toplevel=false value="
.option savecurrents
.include ota_p_ac.save
.save all
.control
  op
  let idd = -i(Vdd)
  let vos = v(inn) - v(inp)
  print idd vos v(out) > op_nom.log
  write @schname\\\\.raw

  alter Vot dc = 0.99
  op
  let idd = -i(Vdd)
  let vos = v(inn) - v(inp)
  print idd vos v(out) > op_volo.log

  alter Vot dc = 1.06
  op
  let idd = -i(Vdd)
  let vos = v(inn) - v(inp)
  print idd vos v(out) > op_vohi.log
  alter Vot dc = 1.03

  dc Vcm 0.05 1.75 0.01
  let vos = v(inn) - v(inp)
  let idd = -i(Vdd)
  wrdata cm_sweep.csv vos idd
  alter Vcm dc = 0.25

  dc Vot 0.05 1.75 0.01
  let vos = v(inn) - v(inp)
  let idd = -i(Vdd)
  wrdata vo_sweep.csv vos idd
  alter Vot dc = 1.03

  op
  ac dec 50 1 10G
  let gain = v(out)
  let Gdb = db(gain)
  let Gph = cph(gain)*180/pi
  wrdata ac.csv Gdb Gph
  write @schname\\\\.raw v(inp) v(inn) v(out)
.endc
"}
C {devices/launcher.sym} 430 110 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {isource.sym} -210 -230 0 1 {name=Iin value=10u}
C {vsource.sym} -630 -40 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -630 -70 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -630 -10 0 0 {name=l3 lab=0}
C {sky130_fd_pr/pfet3_01v8.sym} -190 -290 0 1 {name=M1
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
C {lab_pin.sym} -210 -360 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -110 -80 0 0 {name=p3 sig_type=std_logic lab=inp}
C {lab_pin.sym} -100 -290 0 1 {name=p4 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -110 -40 0 0 {name=p6 sig_type=std_logic lab=Vb}
C {lab_pin.sym} 190 -80 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {gnd.sym} 250 -60 0 0 {name=l2 lab=0}
C {launcher.sym} 430 70 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/@schname\\\\.raw ac"
}
C {/foss/designs/sar_adc/sch/cascode/ota_p.sym} 40 -60 0 0 {name=x1}
C {devices/launcher.sym} 430 150 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {ind.sym} 130 20 1 0 {name=Lfb
m=1
value=1G
footprint=1206
device=inductor}
C {bsource.sym} 10 20 3 1 {name=Bsh VAR=V FUNC="v(vcm) - v(vot)" m=1}
C {vsource.sym} 10 -210 0 0 {name=Vcm value="dc 0.25" savecurrent=true}
C {gnd.sym} 10 -180 0 0 {name=l4 lab=0}
C {vsource.sym} 10 -290 0 0 {name=Vac value="dc 0 ac 1" savecurrent=true}
C {lab_pin.sym} 10 -250 0 1 {name=p1 sig_type=std_logic lab=vcm}
C {lab_pin.sym} 10 -350 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_pin.sym} 190 0 0 1 {name=p9 sig_type=std_logic lab=out}
C {lab_pin.sym} 70 20 3 1 {name=p10 sig_type=std_logic lab=x}
C {lab_pin.sym} -160 -20 0 0 {name=p11 sig_type=std_logic lab=inn}
C {vsource.sym} 90 140 0 0 {name=Vot value="dc 1.03" savecurrent=true}
C {gnd.sym} 90 170 0 0 {name=l5 lab=0}
C {lab_pin.sym} 90 90 0 1 {name=p12 sig_type=std_logic lab=vot}
C {sky130_fd_pr/cap_mim_m3_2.sym} 240 50 0 0 {name=C1 model=cap_mim_m3_2 W=8 L=8 MF=1 spiceprefix=X}
C {gnd.sym} 240 80 0 0 {name=l7 lab=0}
C {capa.sym} -160 90 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -160 120 0 0 {name=l1 lab=0}
C {gnd.sym} -210 -200 0 0 {name=l6 lab=0}
