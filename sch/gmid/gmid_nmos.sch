v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -90 80 -90 {lab=g}
N 120 -150 120 -120 {lab=d}
N 120 -60 120 -30 {lab=0}
N 120 -90 170 -90 {lab=b}
N 170 -90 210 -90 {lab=b}
N 210 -90 210 -70 {lab=b}
N 120 -150 290 -150 {lab=d}
N 290 -130 290 -80 {lab=d}
N 120 -30 120 -10 {lab=0}
N 290 -80 290 -70 {lab=d}
N 60 -90 60 -70 {lab=g}
N 290 -150 290 -130 {lab=d}
N 380 -90 380 -70 {lab=n}
C {sky130_fd_pr/nfet_01v8.sym} 100 -90 0 0 {name=M1
W=\{wx\}
L=\{lx\}
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
C {lab_pin.sym} 210 -90 2 0 {name=p1 sig_type=std_logic lab=b}
C {lab_pin.sym} 120 -150 0 0 {name=p3 sig_type=std_logic lab=d}
C {lab_pin.sym} 60 -90 2 1 {name=p4 sig_type=std_logic lab=g}
C {gnd.sym} 120 -10 0 0 {name=l1 lab=0}
C {vsource.sym} 210 -40 2 1 {name=vsb value=\{vbx\} savecurrent=false}
C {gnd.sym} 210 -10 0 0 {name=l2 lab=0}
C {vsource.sym} 290 -40 0 0 {name=vd value=\{vdx\} savecurrent=false}
C {gnd.sym} 290 -10 0 0 {name=l3 lab=0}
C {vsource.sym} 60 -40 0 1 {name=vg value="\{vgx\} ac 1" savecurrent=false}
C {gnd.sym} 60 -10 0 0 {name=l4 lab=0}
C {ccvs.sym} 380 -40 0 0 {name=H1 vnam=vd value=1}
C {lab_pin.sym} 380 -90 2 0 {name=p2 sig_type=std_logic lab=n}
C {gnd.sym} 380 -10 0 0 {name=l5 lab=0}
C {sky130_fd_pr/corner.sym} -160 -210 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} -170 -60 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} -620 -750 0 0 {name="NGSPICE"
only_toplevel=true
value="
.option sparse
.temp 27
.param wx=5 lx=0.15 vdx=0.9 vgx=0.8 vbx=0
.noise v(n) vg lin 1 1 1 1
.control
  option numdgt=3
  set wr_singlescale
  set wr_vecnames
  compose l_vec values 0.15 0.2 0.3 0.4 0.5 1 1.5 2 3 4 5 10
  compose vg_vec start=0 stop=1.8 step=25m
  compose vd_vec start=0 stop=1.8 step=25m
  compose vb_vec values 0 0.5 1 1.5 1.8

  foreach var1 $&l_vec
    alterparam lx=$var1
    reset
    foreach var2 $&vg_vec
      alter vg $var2
      foreach var3 $&vd_vec
        alter vd $var3
        foreach var4 $&vb_vec
          alter vsb $var4
          run
          wrdata techsweep_sky130A_nfet_01v8.txt noise1.all
          destroy all
          set appendwrite
          unset set wr_vecnames
        end
      end
    end
  end

  set appendwrite=0

  alterparam lx=0.15
  alterparam vbx=0 vdx=0.9 vgx=0.8
  reset
  op
  show
  write @schname\\\\.raw
.endc
" }
C {devices/code_shown.sym} 50 -580 0 0 {name=NGSPICE_SAVES
only_toplevel=true
value="
.save b g d n
.save @m.xm1.msky130_fd_pr__nfet_01v8[l]
.save @m.xm1.msky130_fd_pr__nfet_01v8[id]
.save @m.xm1.msky130_fd_pr__nfet_01v8[gm]
.save @m.xm1.msky130_fd_pr__nfet_01v8[gds]
.save @m.xm1.msky130_fd_pr__nfet_01v8[gmbs]
.save @m.xm1.msky130_fd_pr__nfet_01v8[vth]
.save @m.xm1.msky130_fd_pr__nfet_01v8[vdsat]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cgg]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cgs]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cgd]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cgb]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cdd]
.save @m.xm1.msky130_fd_pr__nfet_01v8[css]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cgso]
.save @m.xm1.msky130_fd_pr__nfet_01v8[cgdo]
.save onoise.m.xm1.msky130_fd_pr__nfet_01v8.id
.save onoise.m.xm1.msky130_fd_pr__nfet_01v8.1overf
" }
C {sky130_fd_pr/annotate_fet_params.sym} 450 -150 0 0 {name=annot1 ref=M1}
C {devices/launcher.sym} -170 -20 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
