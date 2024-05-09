v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 100 -410 100 -380 {
lab=PS}
N 40 -200 60 -200 {
lab=G}
N 100 -170 100 -150 {
lab=GND}
N 100 -320 100 -300 {
lab=GND}
N 40 -350 60 -350 {
lab=G}
N 100 -200 120 -200 {
lab=GND}
N 120 -200 120 -170 {
lab=GND}
N 100 -170 120 -170 {
lab=GND}
N 100 -350 120 -350 {
lab=PS}
N 120 -380 120 -350 {
lab=PS}
N 100 -380 120 -380 {
lab=PS}
N 100 -260 100 -230 {
lab=ND}
C {sky130_fd_pr/nfet_01v8.sym} 80 -200 0 0 {name=M1
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 80 -350 0 0 {name=M2
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 100 -260 0 0 {name=p1 lab=ND}
C {devices/ipin.sym} 40 -200 0 0 {name=p4 lab=G}
C {devices/ipin.sym} 40 -350 0 0 {name=p5 lab=G}
C {devices/ipin.sym} 100 -410 0 0 {name=p6 lab=PS}
C {devices/gnd.sym} 100 -300 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 100 -150 0 0 {name=l2 lab=GND}
C {devices/simulator_commands_shown.sym} 240 -390 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
VG G 0 dc 0.9
VP PS 0 dc 1.8
VN ND 0 dc 1.8
.control
save all
dc VG 0 1.8 0.1
write trbench.raw
op
show m > ~/test.txt
.endc
"}
C {devices/code.sym} 470 -360 0 0 {name=TT_MODELS
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
