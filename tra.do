vlib work
vlog trafic_light_rtl.v +acc
vlog Trafic_loght_testbench.v +acc
vsim work.Trafic_loght_testbench
add wave -r *
wave zoom full
run -all

