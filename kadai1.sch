v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -50 320 -50 {
lab=pinA}
N 480 -50 540 -50 {
lab=pinY}
N 70 -50 100 -50 {
lab=inA}
N 320 -50 360 -50 {
lab=pinA}
N 440 -50 480 -50 {
lab=pinY}
N 700 -50 730 -50 {
lab=outY}
C {devices/code_shown.sym} 20 -380 0 0 {name=ngspice
only_toplevel=false
value="VA inA 0 pulse(0 1.8 0 40p 40p 1n 2n) dc 0
VD VDD 0 dc 1.8
.control
save all
tran 1p 4n
meas tran delayA1 find time WHEN v(pinA)=0.9 RISE=2
meas tran delayY1 find time WHEN v(pinY)=0.9 FALL=2
let delay1 = delayY1 - delayA1
echo tpHL = $&delay1

meas tran delayA2 find time WHEN v(pinA)=0.9 FALL=1
meas tran delayY2 find time WHEN v(pinY)=0.9 RISE=1
let delay2 = delayY2 - delayA2
echo tpLH = $&delay2
.endc"}
C {devices/ipin.sym} 70 -50 0 0 {name=p10 lab=inA}
C {devices/opin.sym} 730 -50 0 0 {name=p4 lab=outY}
C {devices/lab_wire.sym} 320 -50 0 0 {name=p1 sig_type=std_logic lab=pinA}
C {devices/lab_wire.sym} 480 -50 0 1 {name=p2 sig_type=std_logic lab=pinY}
C {devices/code.sym} 570 -310 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".param mc_mm_switch=0
.param mc_pr_switch=0
.include $::SKYWATER_MODELS/corners/tt.spice
.include $::SKYWATER_MODELS/r+c/res_typical__cap_typical.spice
.include $::SKYWATER_MODELS/r+c/res_typical__cap_typical__lin.spice
.include $::SKYWATER_MODELS/corners/tt/specialized_cells.spice
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"}
C {inverter.sym} 140 -50 0 0 {name=x1}
C {inverter.sym} 220 -50 0 0 {name=x2}
C {inverter.sym} 400 -50 0 0 {name=x3}
C {inverter.sym} 580 -50 0 0 {name=x4}
C {inverter.sym} 660 -50 0 0 {name=x5}
