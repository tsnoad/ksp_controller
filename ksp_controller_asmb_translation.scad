$fn=16;

expl = 0;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_translation.scad>;
include <ksp_controller_module_attitude.scad>;

//translation assembly
translate([0,0,0]) {
    translate([0,0,48-16]) {
        rotate([0*atan((20.8-18.3)/20),0,0]) {
            translate([0,0,expl*3]) piv_out();
            rotate([0,0*atan((20.8-18.3)/20),0]) {
                translate([0,0,expl*5]) piv_in();
                translate([0,0,expl*6]) difference() {
                    hull() {
                        translate([0,-6,8]) cylinder(r=12,h=35);
                        translate([0,6,8]) cylinder(r=12,h=35);
                    }
                    for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=2,h=100);
                }
                translate([0,0,expl*6]) translate([0,0,35]) import("/Users/tsnoad/Things/ksp_controller/translation_controller.stl");
    
            }
            translate([0,0,expl*4]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
        }
        translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    translate([0,0,expl*1]) for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,6.85+5.15]) ms();
    
    translate([0,0,expl*6]) trans_box_lid();
    *translate([0,0,expl*-2]) att_box_frame();
}