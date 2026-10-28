v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 540 -670 540 -320 {}
L 4 540 -320 1590 -320 {}
L 4 1590 -680 1590 -320 {}
L 4 540 -680 1590 -680 {}
L 4 540 -680 540 -670 {}
L 4 1590 -320 1590 40 {}
L 4 540 40 1590 40 {}
L 4 540 -320 540 40 {}
L 4 -90 40 540 40 {}
L 4 -90 -680 -90 40 {}
L 4 -90 -680 -60 -680 {}
L 4 -60 -680 540 -680 {}
B 2 -110 -1220 690 -820 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3.306e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
node="clk
rst
phi1
phi2
d;d6,d5,d4,d3,d2,d1,d0
d_out;d_out6,d_out5,d_out4,d_out3,d_out2,d_out1,d_out0
eoc"
color="4 7 6 8 10 12 18"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/adc_ramp_a.raw
sim_type=tran
smz0=50
autoload=0
digital=1
rainbow=1}
B 2 690 -1220 1490 -820 {flags=graph
y1=0
y2=0.01
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3.306e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
node="iv_p
iv_n"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/adc_ramp_a.raw
sim_type=tran
rainbow=1
smz0=50}
T {inputs} -70 -20 0 0 0.5 0.5 {}
T {comparator} 590 -20 0 0 0.5 0.5 {}
T {current-mode conversion} 590 -380 0 0 0.5 0.5 {}
T {use shift+t to swap out spice control blocks} 50 0 0 0 0.4 0.4 {}
N 620 -530 620 -500 {lab=#net1}
N 620 -530 650 -530 {lab=#net1}
N 410 -310 430 -310 {lab=0}
N 1420 -550 1440 -550 {lab=0}
N 920 -170 940 -170 {lab=0}
N 920 -80 940 -80 {lab=0}
N 1350 -250 1370 -250 {lab=0}
N 400 -310 410 -310 {lab=0}
N 1390 -550 1420 -550 {lab=0}
N 1490 -100 1490 -70 {lab=Vb_comp}
N 1450 -100 1490 -100 {lab=Vb_comp}
N 1450 -40 1450 -10 {lab=0}
C {summing_stage/sum_block.sym} 1240 -540 0 0 {name=x2}
C {summing_stage/iv_clamp.sym} 770 -170 0 0 {name=x3}
C {summing_stage/iv_clamp.sym} 770 -80 0 0 {name=x4}
C {comparator/comparator.sym} 1200 -230 0 0 {name=x5}
C {vi_converter/vi_converter.sym} 250 -300 0 0 {name=x6}
C {dac_bridge.sym} 380 -510 0 0 {name=A[6..0] dac_bridge_model= dac_buff
device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=60p t_fall=60p
+ out_low=0 out_high=1.8"}
C {vsource.sym} -210 -600 0 0 {name=VDD value=1.8 savecurrent=true}
C {lab_pin.sym} -210 -630 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -210 -570 0 0 {name=l1 lab=0}
C {ladder/ladder.sym} 800 -550 0 0 {name=x1}
C {lab_pin.sym} 800 -610 0 0 {name=p42 sig_type=std_logic lab=VDD}
C {gnd.sym} 800 -490 0 0 {name=l18 lab=0}
C {lab_pin.sym} 650 -550 0 0 {name=p43 sig_type=std_logic lab=VDD}
C {isource.sym} 620 -470 2 1 {name=Iladder value=20u}
C {lab_pin.sym} 950 -560 0 1 {name=p45 sig_type=std_logic lab=dac1}
C {lab_pin.sym} 950 -540 0 1 {name=p46 sig_type=std_logic lab=dac2}
C {lab_pin.sym} 410 -510 0 1 {name=p2 sig_type=std_logic lab=d_out[6..0]}
C {lab_pin.sym} 290 -400 0 1 {name=p3 sig_type=std_logic lab=eoc}
C {lab_pin.sym} 410 -470 0 1 {name=p4 sig_type=std_logic lab=phi1}
C {lab_pin.sym} 410 -450 0 1 {name=p6 sig_type=std_logic lab=phi2}
C {adc_bridge.sym} 80 -470 0 0 {name=Arst adc_bridge_model= adc_buff
device_model=".model adc_buff adc_bridge in_low=0.8 in_high=1.0 rise_delay=60p fall_delay=60p"}
C {adc_bridge.sym} 80 -490 0 0 {name=Acmp adc_bridge_model= adc_buff
device_model=".model adc_buff adc_bridge in_low=0.8 in_high=1.0 rise_delay=60p fall_delay=60p"}
C {adc_bridge.sym} 80 -510 0 0 {name=Aclk adc_bridge_model= adc_buff
device_model=".model adc_buff adc_bridge in_low=0.8 in_high=1.0 rise_delay=60p fall_delay=60p"}
C {lab_pin.sym} 400 -330 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1390 -570 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 920 -190 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 920 -100 0 1 {name=p9 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1350 -270 0 1 {name=p10 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 620 -80 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 620 -170 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {vsource.sym} 620 -270 0 0 {name=Vmid value=0.9 savecurrent=true}
C {lab_pin.sym} 620 -300 0 0 {name=p60 sig_type=std_logic lab=vmid}
C {gnd.sym} 620 -240 0 0 {name=l30 lab=0}
C {lab_pin.sym} 620 -190 0 0 {name=p65 sig_type=std_logic lab=vmid}
C {lab_pin.sym} 620 -100 0 0 {name=p13 sig_type=std_logic lab=vmid}
C {lab_pin.sym} 1050 -210 0 0 {name=p14 sig_type=std_logic lab=phi1}
C {lab_pin.sym} 1050 -190 0 0 {name=p15 sig_type=std_logic lab=phi2}
C {gnd.sym} 430 -310 0 0 {name=l2 lab=0}
C {gnd.sym} 1440 -550 0 0 {name=l3 lab=0}
C {gnd.sym} 940 -170 0 0 {name=l4 lab=0}
C {gnd.sym} 940 -80 0 0 {name=l5 lab=0}
C {gnd.sym} 1370 -250 0 0 {name=l6 lab=0}
C {vsource.sym} -10 -600 0 0 {name=Vclk value="pulse(0 1.8 0 60p 60p 5n 10n)" savecurrent=true}
C {lab_pin.sym} -10 -630 0 0 {name=p16 sig_type=std_logic lab=clk}
C {gnd.sym} -10 -570 0 0 {name=l7 lab=0}
C {lab_pin.sym} 50 -510 0 0 {name=p17 sig_type=std_logic lab=clk}
C {lab_pin.sym} 1350 -230 0 1 {name=p18 sig_type=std_logic lab=cmp}
C {lab_pin.sym} 1350 -210 0 1 {name=p19 sig_type=std_logic lab=cmp_b}
C {vsource.sym} 200 -600 0 0 {name=Vrst value="pwl(0 0 50n 0 52n 1.8)" savecurrent=true}
C {lab_pin.sym} 200 -630 0 0 {name=p21 sig_type=std_logic lab=rst}
C {gnd.sym} 200 -570 0 0 {name=l8 lab=0}
C {lab_pin.sym} 100 -330 0 0 {name=p22 sig_type=std_logic lab=inp}
C {lab_pin.sym} 100 -310 0 0 {name=p23 sig_type=std_logic lab=inn}
C {lab_pin.sym} 1090 -570 0 0 {name=p24 sig_type=std_logic lab=dac1}
C {lab_pin.sym} 1090 -550 0 0 {name=p25 sig_type=std_logic lab=dac2}
C {lab_pin.sym} 400 -290 0 1 {name=p26 sig_type=std_logic lab=i1}
C {lab_pin.sym} 400 -270 0 1 {name=p27 sig_type=std_logic lab=i2}
C {lab_pin.sym} 1090 -530 0 0 {name=p28 sig_type=std_logic lab=i1}
C {lab_pin.sym} 1090 -510 0 0 {name=p29 sig_type=std_logic lab=i2}
C {lab_pin.sym} 1390 -530 0 1 {name=p30 sig_type=std_logic lab=iv_p}
C {lab_pin.sym} 1390 -510 0 1 {name=p31 sig_type=std_logic lab=iv_n}
C {lab_pin.sym} 1050 -250 0 0 {name=p32 sig_type=std_logic lab=iv_p}
C {lab_pin.sym} 1050 -230 0 0 {name=p33 sig_type=std_logic lab=iv_n}
C {lab_pin.sym} 920 -150 0 1 {name=p34 sig_type=std_logic lab=iv_p}
C {lab_pin.sym} 920 -60 0 1 {name=p35 sig_type=std_logic lab=iv_n}
C {isource.sym} 1450 -130 0 0 {name=Icomparator value=8u}
C {lab_pin.sym} 1490 -100 0 1 {name=p36 sig_type=std_logic lab=Vb_comp}
C {lab_pin.sym} 1450 -160 0 1 {name=p37 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet3_01v8.sym} 1470 -70 0 1 {name=M12
W=2.5
L=1
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
C {gnd.sym} 1450 -10 0 0 {name=l9 lab=0}
C {lab_pin.sym} 1050 -270 0 0 {name=p38 sig_type=std_logic lab=Vb_comp}
C {devices/launcher.sym} -280 -270 0 0 {name=h3
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} -280 -210 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {code.sym} -270 -470 0 0 {
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
C {lab_pin.sym} 50 -470 0 0 {name=p39 sig_type=std_logic lab=rst}
C {dac_bridge.sym} 380 -490 0 0 {name=A[13..7] dac_bridge_model= dac_buff
device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=60p t_fall=60p
+ out_low=0 out_high=1.8"}
C {lab_pin.sym} 410 -490 0 1 {name=p47 sig_type=std_logic lab=d[6..0]}
C {dac_bridge.sym} 380 -470 0 0 {name=A14 dac_bridge_model= dac_buff
device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=60p t_fall=60p
+ out_low=0 out_high=1.8"}
C {dac_bridge.sym} 380 -450 0 0 {name=A15 dac_bridge_model= dac_buff
device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=60p t_fall=60p
+ out_low=0 out_high=1.8"}
C {dac_bridge.sym} 260 -400 0 0 {name=A16 dac_bridge_model= dac_buff
device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=60p t_fall=60p
+ out_low=0 out_high=1.8"}
C {lab_pin.sym} 650 -570 0 0 {name=p44 sig_type=std_logic lab=d[6..0]}
C {lab_pin.sym} 50 -490 0 0 {name=p48 sig_type=std_logic lab=cmp_b}
C {vsource.sym} 380 -200 0 0 {name=Vcm value=0.45 savecurrent=true}
C {lab_pin.sym} 380 -230 0 0 {name=p20 sig_type=std_logic lab=vcm}
C {gnd.sym} 380 -170 0 0 {name=l12 lab=0}
C {bsource.sym} -20 -200 0 0 {name=Bp VAR=V FUNC="v(vcm) + 0.5*v(vd)" m=1}
C {gnd.sym} -20 -170 0 0 {name=l16 lab=0}
C {lab_pin.sym} -20 -230 0 0 {name=p50 sig_type=std_logic lab=inp}
C {bsource.sym} 180 -200 0 0 {name=Bn VAR=V FUNC="v(vcm) - 0.5*v(vd)" m=1}
C {gnd.sym} 180 -170 0 0 {name=l17 lab=0}
C {lab_pin.sym} 180 -230 0 0 {name=p51 sig_type=std_logic lab=inn}
C {code.sym} -420 40 0 0 {name=SPICE_CTRL_old only_toplevel=false value="
.nodeset v(i1)=1.55 v(i2)=1.55 v(dac1)=0.25 v(dac2)=0.25
.option sparse
.include adc.save
.save all
.control
set wr_singlescale
set wr_vecnames
option reltol=1e-4

set vpk = 0.27
set npts = 513
set vamp = 0.265
set sn = 128
set sm = 11
set vwave = 0.1
set tsamp = 1055n
set tsar = 1040n

alter Vd dc = 0
op
let idd = -i(vdd)
print v(i1) v(i2) v(dac1) v(dac2) v(iv_p) v(iv_n) idd

alter Vd dc = $vwave
tran 0.1n 1100n 0 0.2n
let idd = -i(vdd)
wrdata adc_wave.csv v(clk) v(rst) v(phi1) v(phi2) v(cmp) v(cmp_b) v(iv_p) v(iv_n) v(dac1) v(dac2) v(i1) v(i2) v(eoc) v(d6) v(d5) v(d4) v(d3) v(d2) v(d1) v(d0) v(d_out6) v(d_out5) v(d_out4) v(d_out3) v(d_out2) v(d_out1) v(d_out0) idd
write adc_tran.raw
destroy all

echo ramp A
echo vd code eoc idd_ua code_dout > adc_transfer.csv
set k = 0
repeat $npts
  reset
  option reltol=1e-4
  let vdnow = -$vpk + 2*$vpk*$k/($npts - 1 + ($npts < 2))
  alter Vd dc = $&vdnow
  tran 0.2n 1060n 0 0.25n
  meas tran d6m find v(d6) at=$tsar
  meas tran d5m find v(d5) at=$tsar
  meas tran d4m find v(d4) at=$tsar
  meas tran d3m find v(d3) at=$tsar
  meas tran d2m find v(d2) at=$tsar
  meas tran d1m find v(d1) at=$tsar
  meas tran d0m find v(d_out0) at=$tsamp
  meas tran o6m find v(d_out6) at=$tsamp
  meas tran o5m find v(d_out5) at=$tsamp
  meas tran o4m find v(d_out4) at=$tsamp
  meas tran o3m find v(d_out3) at=$tsamp
  meas tran o2m find v(d_out2) at=$tsamp
  meas tran o1m find v(d_out1) at=$tsamp
  meas tran eocm find v(eoc) at=$tsamp
  meas tran iavg avg i(vdd) from=60n to=1050n
  let code = 64*(d6m > 0.9) + 32*(d5m > 0.9) + 16*(d4m > 0.9) + 8*(d3m > 0.9) + 4*(d2m > 0.9) + 2*(d1m > 0.9) + (d0m > 0.9)
  let codeo = 64*(o6m > 0.9) + 32*(o5m > 0.9) + 16*(o4m > 0.9) + 8*(o3m > 0.9) + 4*(o2m > 0.9) + 2*(o1m > 0.9) + (d0m > 0.9)
  let eocok = eocm > 0.9
  let iddua = -1e6*iavg
  echo $&vdnow $&code $&eocok $&iddua $&codeo >> adc_transfer.csv
  let kk = $k + 1
  set k = $&kk
  destroy all
end

echo ramp B
echo vd code eoc idd_ua code_dout > adc_transfer_b.csv
set k = 0
repeat $npts
  reset
  option reltol=1e-4
  let vdnow = -$vpk + 2*$vpk*$k/($npts - 1 + ($npts < 2))
  alter Vd dc = $&vdnow
  tran 0.2n 1060n 0 0.2n
  meas tran d6m find v(d6) at=$tsar
  meas tran d5m find v(d5) at=$tsar
  meas tran d4m find v(d4) at=$tsar
  meas tran d3m find v(d3) at=$tsar
  meas tran d2m find v(d2) at=$tsar
  meas tran d1m find v(d1) at=$tsar
  meas tran d0m find v(d_out0) at=$tsamp
  meas tran o6m find v(d_out6) at=$tsamp
  meas tran o5m find v(d_out5) at=$tsamp
  meas tran o4m find v(d_out4) at=$tsamp
  meas tran o3m find v(d_out3) at=$tsamp
  meas tran o2m find v(d_out2) at=$tsamp
  meas tran o1m find v(d_out1) at=$tsamp
  meas tran eocm find v(eoc) at=$tsamp
  meas tran iavg avg i(vdd) from=60n to=1050n
  let code = 64*(d6m > 0.9) + 32*(d5m > 0.9) + 16*(d4m > 0.9) + 8*(d3m > 0.9) + 4*(d2m > 0.9) + 2*(d1m > 0.9) + (d0m > 0.9)
  let codeo = 64*(o6m > 0.9) + 32*(o5m > 0.9) + 16*(o4m > 0.9) + 8*(o3m > 0.9) + 4*(o2m > 0.9) + 2*(o1m > 0.9) + (d0m > 0.9)
  let eocok = eocm > 0.9
  let iddua = -1e6*iavg
  echo $&vdnow $&code $&eocok $&iddua $&codeo >> adc_transfer_b.csv
  let kk = $k + 1
  set k = $&kk
  destroy all
end

echo sine A
echo n vd code eoc idd_ua code_dout > adc_sine.csv
set k = 0
repeat $sn
  reset
  option reltol=1e-4
  let vdnow = $vamp*sin(2*3.14159265358979*$sm*$k/$sn)
  alter Vd dc = $&vdnow
  tran 0.2n 1060n 0 0.25n
  meas tran d6m find v(d6) at=$tsar
  meas tran d5m find v(d5) at=$tsar
  meas tran d4m find v(d4) at=$tsar
  meas tran d3m find v(d3) at=$tsar
  meas tran d2m find v(d2) at=$tsar
  meas tran d1m find v(d1) at=$tsar
  meas tran d0m find v(d_out0) at=$tsamp
  meas tran o6m find v(d_out6) at=$tsamp
  meas tran o5m find v(d_out5) at=$tsamp
  meas tran o4m find v(d_out4) at=$tsamp
  meas tran o3m find v(d_out3) at=$tsamp
  meas tran o2m find v(d_out2) at=$tsamp
  meas tran o1m find v(d_out1) at=$tsamp
  meas tran eocm find v(eoc) at=$tsamp
  meas tran iavg avg i(vdd) from=60n to=1050n
  let code = 64*(d6m > 0.9) + 32*(d5m > 0.9) + 16*(d4m > 0.9) + 8*(d3m > 0.9) + 4*(d2m > 0.9) + 2*(d1m > 0.9) + (d0m > 0.9)
  let codeo = 64*(o6m > 0.9) + 32*(o5m > 0.9) + 16*(o4m > 0.9) + 8*(o3m > 0.9) + 4*(o2m > 0.9) + 2*(o1m > 0.9) + (d0m > 0.9)
  let eocok = eocm > 0.9
  let iddua = -1e6*iavg
  echo $k $&vdnow $&code $&eocok $&iddua $&codeo >> adc_sine.csv
  let kk = $k + 1
  set k = $&kk
  destroy all
end

echo sine B
echo n vd code eoc idd_ua code_dout > adc_sine_b.csv
set k = 0
repeat $sn
  reset
  option reltol=1e-4
  let vdnow = $vamp*sin(2*3.14159265358979*$sm*$k/$sn)
  alter Vd dc = $&vdnow
  tran 0.2n 1060n 0 0.2n
  meas tran d6m find v(d6) at=$tsar
  meas tran d5m find v(d5) at=$tsar
  meas tran d4m find v(d4) at=$tsar
  meas tran d3m find v(d3) at=$tsar
  meas tran d2m find v(d2) at=$tsar
  meas tran d1m find v(d1) at=$tsar
  meas tran d0m find v(d_out0) at=$tsamp
  meas tran o6m find v(d_out6) at=$tsamp
  meas tran o5m find v(d_out5) at=$tsamp
  meas tran o4m find v(d_out4) at=$tsamp
  meas tran o3m find v(d_out3) at=$tsamp
  meas tran o2m find v(d_out2) at=$tsamp
  meas tran o1m find v(d_out1) at=$tsamp
  meas tran eocm find v(eoc) at=$tsamp
  meas tran iavg avg i(vdd) from=60n to=1050n
  let code = 64*(d6m > 0.9) + 32*(d5m > 0.9) + 16*(d4m > 0.9) + 8*(d3m > 0.9) + 4*(d2m > 0.9) + 2*(d1m > 0.9) + (d0m > 0.9)
  let codeo = 64*(o6m > 0.9) + 32*(o5m > 0.9) + 16*(o4m > 0.9) + 8*(o3m > 0.9) + 4*(o2m > 0.9) + 2*(o1m > 0.9) + (d0m > 0.9)
  let eocok = eocm > 0.9
  let iddua = -1e6*iavg
  echo $k $&vdnow $&code $&eocok $&iddua $&codeo >> adc_sine_b.csv
  let kk = $k + 1
  set k = $&kk
  destroy all
end

echo all sweeps done
.endc

"
spice_ignore=true}
C {lab_pin.sym} 620 -440 0 0 {name=p40 sig_type=std_logic lab=VDD}
C {launcher.sym} 60 -760 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/adc_ramp_a.raw tran"
}
C {code.sym} -590 30 0 0 {name=DEBUG_SPICE only_toplevel=false value="
.nodeset v(i1)=1.55 v(i2)=1.55 v(dac1)=0.25 v(dac2)=0.25
.option sparse
.include adc.save
.save all
.control
set wr_singlescale
set wr_vecnames
set vbad = 0.16031
set nscan = 2
tran 0.2n 1060n 0 0.25n
write adc_tran.raw

echo vd code eoc > adc_scan.csv
set k = 0
repeat $nscan
  reset
  option reltol=1e-4
  let vnow = $vbad + ($k - 10)*2e-5
  alter Vd dc = $&vnow
  tran 0.2n 1060n 0 0.25n
  meas tran d6m find v(d_out6) at=1055n
  meas tran d5m find v(d_out5) at=1055n
  meas tran d4m find v(d_out4) at=1055n
  meas tran d3m find v(d_out3) at=1055n
  meas tran d2m find v(d_out2) at=1055n
  meas tran d1m find v(d_out1) at=1055n
  meas tran d0m find v(d_out0) at=1055n
  meas tran eocm find v(eoc) at=1055n
  let code = 64*(d6m > 0.9) + 32*(d5m > 0.9) + 16*(d4m > 0.9) + 8*(d3m > 0.9) + 4*(d2m > 0.9) + 2*(d1m > 0.9) + (d0m > 0.9)
  let eocok = eocm > 0.9
  echo $&vnow $&code $&eocok >> adc_scan.csv
  let kk = $k + 1
  set k = $&kk
  destroy all
end
echo scan done
.endc
"
spice_ignore=true}
C {cosim/sar_controller_iverilog.sym} 270 -350 0 0 {name=Acontroller}
C {code.sym} 40 -140 0 0 {name=ramp_input only_toplevel=false value="
.param nconv=513 vpk=0.27 tr=2n tmax=0.25n
Bidx idx 0 V = min(max(floor((time-1.051e-6)/1e-6) + min(((time-1.051e-6)/1e-6 - floor((time-1.051e-6)/1e-6))*(1e-6/\{tr\}), 1), 0), \{nconv\}-1)
Bvd vd 0 V = -\{vpk\} + 2*\{vpk\}/(\{nconv\}-1)*v(idx)
.tran 0.2n \{nconv*1e-6+60e-9\} 0 \{tmax\}
.save v(vd) v(eoc) v(d_out6) v(d_out5) v(d_out4) v(d_out3) v(d_out2) v(d_out1) v(d_out0) v(d6) v(d5) v(d4) v(d3) v(d2) v(d1) i(vdd) v(iv_p) v(iv_n)
"
spice_ignore=true}
C {code.sym} 220 -140 0 0 {name=sin_input only_toplevel=false value="
.param nconv=128 vamp=0.265 sn=128 sm=11 tr=2n tmax=0.25n
Bidx idx 0 V = min(max(floor((time-1.051e-6)/1e-6) + min(((time-1.051e-6)/1e-6 - floor((time-1.051e-6)/1e-6))*(1e-6/\{tr\}), 1), 0), \{nconv\}-1)
Bvd vd 0 V = \{vamp\}*sin(2*pi*\{sm\}*v(idx)/\{sn\})
.tran 0.2n \{nconv*1e-6+60e-9\} 0 \{tmax\}
.save v(vd) v(eoc) v(d_out6) v(d_out5) v(d_out4) v(d_out3) v(d_out2) v(d_out1) v(d_out0) v(d6) v(d5) v(d4) v(d3) v(d2) v(d1) i(vdd)
"
}
C {code.sym} -450 -470 0 0 {name=SPICE_CTRL only_toplevel=false value="
.control
option reltol=1e-4
run
write adc_sine_a.raw
echo stream done
.endc
"}
