v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 380 -80 410 -80 {lab=0}
N 380 -60 380 -30 {lab=di}
C {summing_stage/iv_clamp.sym} 230 -80 0 0 {name=xc}
C {vsource.sym} -280 -80 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -280 -110 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -280 -50 0 0 {name=l1 lab=0}
C {code.sym} -290 40 0 0 {
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
C {devices/launcher.sym} -270 220 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} -270 280 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {vsource.sym} -180 -80 0 0 {name=Vmid value="dc 0.9" savecurrent=true}
C {lab_pin.sym} -180 -110 0 0 {name=p2 sig_type=std_logic lab=vmid}
C {gnd.sym} -180 -50 0 0 {name=l2 lab=0}
C {lab_pin.sym} 80 -100 0 0 {name=p3 sig_type=std_logic lab=vmid}
C {vsource.sym} -90 -80 0 0 {name=Vgate value="dc 1.8" savecurrent=true}
C {lab_pin.sym} -90 -110 0 0 {name=p4 sig_type=std_logic lab=vgate}
C {gnd.sym} -90 -50 0 0 {name=l3 lab=0}
C {lab_pin.sym} 80 -80 0 0 {name=p5 sig_type=std_logic lab=vgate}
C {lab_pin.sym} 380 -100 0 1 {name=p6 sig_type=std_logic lab=VDD}
C {gnd.sym} 410 -80 0 0 {name=l4 lab=0}
C {isource.sym} -90 40 2 1 {name=Iin value="dc 0 ac 1 pwl(0 0 20n 0 20.1n 10u 120n 10u 120.1n 0 220n 0 220.1n -10u 320n -10u 320.1n 0 420n 0 420.1n 20u 520n 20u 520.1n 0 620n 0 620.1n -20u 720n -20u 720.1n 0 820n 0)"}
C {gnd.sym} -90 70 0 0 {name=l5 lab=0}
C {lab_pin.sym} 380 -60 0 1 {name=p7 sig_type=std_logic lab=di}
C {lab_pin.sym} -90 10 0 0 {name=p8 sig_type=std_logic lab=di}
C {parax_cap.sym} 380 -20 0 0 {name=C1 gnd=0 value=100f m=1}
C {code_shown.sym} -40 120 0 0 {name=SPICE only_toplevel=false value="
.options reltol=1e-6
.nodeset v(di)=0.9
.save all
.save i(vmid)
.option savecurrents
.include iv_clamp_tb.save

.control
  * ---- 1. operating point, Iin = 0 ----
  op
  write @schname\\\\.raw
  let imid = -i(Vmid)
  print v(di) v(vmid) v(vgate) imid > op_f.log
  print @m.xc.xm3.msky130_fd_pr__nfet_01v8[vds] @m.xc.xm3.msky130_fd_pr__nfet_01v8[vdsat] @m.xc.xm3.msky130_fd_pr__nfet_01v8[vth] @m.xc.xm3.msky130_fd_pr__nfet_01v8[gm] @m.xc.xm3.msky130_fd_pr__nfet_01v8[id] >> op_f.log
  print @m.xc.xm2.msky130_fd_pr__pfet_01v8_lvt[vds] @m.xc.xm2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.xc.xm2.msky130_fd_pr__pfet_01v8_lvt[vth] @m.xc.xm2.msky130_fd_pr__pfet_01v8_lvt[gm] @m.xc.xm2.msky130_fd_pr__pfet_01v8_lvt[id] >> op_f.log
  print @m.xc.xm1.msky130_fd_pr__pfet_01v8_lvt[vds] @m.xc.xm1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @m.xc.xm1.msky130_fd_pr__pfet_01v8_lvt[vth] @m.xc.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] @m.xc.xm1.msky130_fd_pr__pfet_01v8_lvt[id] >> op_f.log

  * ---- 2. transfer curve V(Iin): fine sweep around zero, then the full range ----
  dc Iin -1u 1u 0.01u
  let vdi = v(di)
  let imid = -i(Vmid)
  wrdata dc_fine.csv vdi imid

  dc Iin -25u 25u 0.05u
  let vdi = v(di)
  let imid = -i(Vmid)
  wrdata dc_i.csv vdi imid

  * ---- 3. V_GATE sweep (outer loop), Iin inner ----
  dc Iin -25u 25u 0.25u Vgate 1.4 1.8 0.05
  let vdi = v(di)
  let imid = -i(Vmid)
  let vvg = v(vgate)
  wrdata dc_vg.csv vdi imid vvg
  alter Vgate dc = 1.8

  * ---- 4. V_MID sweep (outer loop), Iin inner ----
  dc Iin -25u 25u 0.25u Vmid 0.6 1.2 0.05
  let vdi = v(di)
  let imid = -i(Vmid)
  let vvm = v(vmid)
  wrdata dc_vm.csv vdi imid vvm
  alter Vmid dc = 0.9

  * ---- 5. small-signal impedance at three bias currents (ac 1 A on Iin, so v(di) is the impedance in ohm) ----
  alter Iin dc = 0
  ac dec 50 1k 10G
  let zdb = db(v(di))
  let zph = cph(v(di))*180/pi
  wrdata ac_0.csv zdb zph

  alter Iin dc = 5u
  ac dec 50 1k 10G
  let zdb = db(v(di))
  let zph = cph(v(di))*180/pi
  wrdata ac_p5.csv zdb zph

  alter Iin dc = -5u
  ac dec 50 1k 10G
  let zdb = db(v(di))
  let zph = cph(v(di))*180/pi
  wrdata ac_m5.csv zdb zph

  * ---- 6. transient: +/-10 uA and +/-20 uA current steps (the pwl on Iin) ----
  alter Iin dc = 0
  tran 0.1n 820n
  let vdi = v(di)
  wrdata tran.csv vdi
.endc
"}
