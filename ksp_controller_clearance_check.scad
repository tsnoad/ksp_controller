$fn=36;

include <ksp_controller_include.scad>;

difference() {
    translate([0,-8,-8]) cube([8+40+8,16,16]);
    translate([8,0,0]) {
        m4_co(25,false,2.5,2.5,false,true);
        translate([0,0,-8-5]) cylinder(r1=10,r2=0,h=10);
        mirror([0,0,1]) translate([0,0,-8-5]) cylinder(r1=10,r2=0,h=10);
    }
    rotate([90,0,0]) translate([8+10,0,0]) {
        m4_co(25,true,2.5,2.5);
        translate([0,0,-8-5]) cylinder(r1=10,r2=0,h=10);
        mirror([0,0,1]) translate([0,0,-8-5]) cylinder(r1=10,r2=0,h=10);
    }
    rotate([180,0,0]) translate([8+20,0,0]) {
        m4_co(25,false,2.5,2.5,true,false);
        translate([0,0,-8-5]) cylinder(r1=10,r2=0,h=10);
        mirror([0,0,1]) translate([0,0,-8-5]) cylinder(r1=10,r2=0,h=10);
    }
    rotate([90,0,0]) translate([8+30,0,0]) {
        translate([0,0,-25]) hull() {
            cylinder(r=m4_h_r,h=50);
            translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,50]);
        }
        translate([0,0,-8-6.5]) cylinder(r1=10,r2=0,h=10);
        mirror([0,0,1]) translate([0,0,-8-6.5]) cylinder(r1=10,r2=0,h=10);
    }
    
        //nut co
    translate([8+30,0,0]) hull() {
        for(iz=[0,8]) {
            translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_h_r-3.5,h=8+5);
        }
    }
    
    translate([8+40,0,0]) {
        translate([0,0,-25]) cylinder(r=m4_v_r,h=50);
        translate([0,0,-8-6.5]) cylinder(r1=10,r2=0,h=10);
        mirror([0,0,1]) translate([0,0,-8-6.5]) cylinder(r1=10,r2=0,h=10);
    }
}