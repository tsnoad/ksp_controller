$fn=16;

$vpr = [60, 0, 45];
$vpt = [0, 0, 75];
$vpd = 875;
$t=1;

include <ksp_controller_include.scad>;
include <ksp_controller_module_switches.scad>;
include <ksp_controller_module_cw.scad>;

*translate([0,0,80]) switch_box_lid();
cw_box_frame();