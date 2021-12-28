$fn=16;

expl = 0;
$vpr = [60, 0, 45];
$vpt = [0, 0, 75];
$vpd = 1000;

expl = 0;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_cw.scad>;
include <ksp_controller_module_attitude.scad>;

//caution and warning assembly
translate([0,0,0]) {
    translate([0,0,expl*6]) cw_box_lid();
    *translate([0,0,expl*-2]) att_box_frame();
}