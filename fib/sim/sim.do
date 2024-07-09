

quit -sim

if [file exists d:/userdata] {
   } else {
   file mkdir d:/userdata
   }

# set net_msg_user [get_net_msg_user] 
set net_msg_user user

if [file exists d:/userdata/$net_msg_user] {
   } else {
   file mkdir d:/userdata/$net_msg_user
   }

if [file exists d:/userdata/$net_msg_user/fib] {
   } else {
   file mkdir d:/userdata/$net_msg_user/fib
   }

if [file exists d:/userdata/$net_msg_user/fib/lib] {
   } else {
   file mkdir d:/userdata/$net_msg_user/fib/lib
   }

set design_root_directory_lib d:/userdata/$net_msg_user/fib

if [file exists $design_root_directory_lib/lib/design_lib] {
  vdel -all -lib $design_root_directory_lib/lib/design_lib }

if [file exists $design_root_directory_lib/lib/module_tb_lib] {
  vdel -all -lib $design_root_directory_lib/lib/module_tb_lib }

vlib $design_root_directory_lib/lib/design_lib
vlib $design_root_directory_lib/lib/module_tb_lib


# Compile modules under test (with code coverage enabled)
vcom +cover=bcesfx -quiet -work design_lib ../design_hdl/halfadd.vhd

# Compile test bench components required to simulate
vcom -quiet -work module_tb_lib ../testbench_hdl/fib_tb.vhd

# Simulate test bench
vsim -coverage -t ps -wlf $design_root_directory_lib/lib/vsim.wlf module_tb_lib.fib_tb

add log -r /*

run 12 ms

