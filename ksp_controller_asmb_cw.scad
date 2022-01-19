$fn=72;

expl = 0;
//$vpr = [60, 0, 45];
//$vpt = [0, 0, 75];
//$vpd = 1000;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_cw.scad>;
include <ksp_controller_module_attitude.scad>;


//!ard_micro_co()

//caution and warning assembly
translate([0,0,0]) {
    *translate([0,0,expl*6]) translate([0,0,64]) cw_box_lid();
    translate([0,0,expl*-2]) cw_box_frame();
}

//test print for switch fitment
*difference() {
    box_lid(12+8,12+8,18+1.2+8,18+1.2+8);
    
    translate([0,0,0]) for(mx=[0]) for(my=[-0.5,0.5]) translate([mx*(sw_w+1.6),my*(sw_h+2.4),0]) {
        rect_switch_co();
    }
    
    translate([0,0,0]) hull() for(mx_1=[0,1]) mirror([mx_1,0,0]) for(my_1=[0,1]) mirror([0,my_1,0]) {
        translate([0*(sw_w+1.6),0.5*(sw_h+2.4),0]) {
            translate([sw_w/2-0.25,sw_h/2-0.25,2.5+1.25]) cylinder(r1=0.25,r2=0.25+20,h=20);
        }
    }
}