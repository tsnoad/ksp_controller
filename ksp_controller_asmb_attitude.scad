$fn=16;

expl = 0;
//$vpr = [60, 0, 45];
$vpt = [0, 0, 75];
$vpd = 1000;
$t=0.75;

ms_pt = 1.6+0.4; //microswitch pre-travel
ms_ot = 0.8; //microswitch over-travel
ms_ptot = ms_pt + ms_ot;
ms_os = (48-16)-(6.85+5.15); //vertical offset from pivot to microswitches
ms_p_a = atan(ms_ptot/ms_os);
echo(ms_p_a);

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_attitude.scad>;

//attitude assembly
union() {
    translate([0,0,48-16]) {
        rotate([sin($t*360)*ms_p_a,0,0]) {
            translate([0,0,expl*3]) piv_out();
            rotate([0,sin($t*360+90)*ms_p_a,0]) {
                translate([0,0,expl*5]) piv_in();
                translate([0,0,expl*6]) difference() {
                    hull() {
                        translate([0,-6,8]) cylinder(r=12,h=35);
                        translate([0,6,8]) cylinder(r=12,h=35);
                    }
                    for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=m4_v_r,h=100);
                }
                translate([0,0,expl*6]) translate([0,0,35]) import("STLs/ksp_controller_module_attitude_handle.stl");
            }
            translate([0,0,expl*4]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
        }
        translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    translate([0,0,expl*1]) for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,6.85+5.15]) ms();
    translate([0,0,expl*6]) att_box_lid();
    !translate([0,0,expl*-2]) att_box_frame();
}