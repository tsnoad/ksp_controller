$fn=16;

expl = 0;
$vpr = [60, 0, 45];
$vpt = [0, 0, 75];
$vpd = 1000;

expl = 0;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_switches.scad>;
include <ksp_controller_module_attitude.scad>;

//switches assembly
translate([0,0,0]) {
    switch_box_lid();
}