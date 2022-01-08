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
    translate([0,0,64]) switch_box_lid();
    *box_frame(70,70,60,60+40+5,64);
}


*difference() {
    hull()  for(i=[-1,1]) for(j=[-1,1]) translate([i*(17.5-5),j*(35-5),0]) cylinder(r=5,h=2.5);
    
    translate([-15,-5+22.5,2.5-0.4]) linear_extrude(height=10,convexity=10) import("label_co_stg_exp.svg");
    translate([-15,-5+7.5,2.5-0.4]) linear_extrude(height=10,convexity=10) import("label_co_abrt_exp.svg");
    translate([-15,-5-7.5,2.5-0.4]) linear_extrude(height=10,convexity=10) import("label_co_rcs_exp.svg");
    translate([-15,-5-22.5,2.5-0.4]) linear_extrude(height=10,convexity=10) import("label_co_ag2_exp.svg");
}