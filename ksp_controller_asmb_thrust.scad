$fn=16;

//$vpr = [60, 0, 225];
//$vpt = [0, 0, 75];
//$vpd = 1000;

expl = 0;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_thrust.scad>;
include <ksp_controller_module_attitude.scad>;
include <ksp_controller_module_base.scad>;





//thrust assembly
translate([0,0,0]) {
    translate([0,0,64-16]) {
        rotate([0*atan((20.8-18.3)/20),0,0]) {
            translate([0,0,expl*3]) piv_in_thrust();
            translate([0,0,expl*6]) difference() {
                hull() {
                    translate([0,-6,8]) cylinder(r=12,h=35);
                    translate([0,6,8]) cylinder(r=12,h=35);
                }
                for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=2,h=100);
            }
            translate([0,0,expl*6]) translate([0,0,35]) rotate([0,0,90]) import("STLs/ksp_controller_module_thrust_handle.stl");

    
        }
        *translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    *translate([0,0,10+6.85+5.15]) for(i=[0,2]) ms_spacing(i) ms();
    
    
    translate([0,0,expl*6]) thrust_box_lid();
    *translate([0,0,expl*-2]) att_box_frame();
}