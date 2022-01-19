$fn=36;

include <ksp_controller_include.scad>;

difference() {
    union() {
        hull() {
            translate([2,(8-2),-8]) cylinder(r=2,h=14);
            translate([2,-(8-2),-8]) cylinder(r=2,h=14);
            
            translate([(8+12+8-2),(8-2),-8]) cylinder(r=2,h=14);
            translate([(8+12+8-2),-(8-2),-8]) cylinder(r=2,h=14);
        }
        hull() {
            translate([2,(8-2),-8]) cylinder(r=2,h=8);
            translate([2,-(8-2),-8]) cylinder(r=2,h=8);
            
            translate([(8+12+8+12-2),(8-2),-8]) cylinder(r=2,h=8);
            translate([(8+12+8+12-2),-(8-2),-8]) cylinder(r=2,h=8);
        }
    }
    translate([8,0,8]) {
        m4_co(25,false,0,8,false,true);
    }
    translate([8+12,0,0]) {
        m4_endnut_co();
    }
    
    translate([8+12,-25,0]) rotate([-90,0,0]) hull() {
        cylinder(r=m4_h_r,h=50);
        translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
    }
    
    translate([8+12+8+6,0,-8-1]) cylinder(r=m3_v_r,h=50);
    translate([8+12+8+6,0,-50-4]) {
        cylinder(r=2.5+0.5,h=50-0.4);
        translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
        translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
    }
}