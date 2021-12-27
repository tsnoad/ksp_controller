$fn=16;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;

//prototype test for frame
*union() {
    difference() {
        intersection() {
            att_box_frame();
            
            *union() {
                hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                    translate([brh+8+8-5,20-5,-1]) cylinder(r=5,h=64-8);
                }
                
                hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                    translate([brh-15+8+8-5,20-5,0]) cylinder(r=5,h=10+6.85);
                    translate([brh-15+8+8-5-17.5,20-5+17.5,0]) cylinder(r=5,h=10+6.85);
                }
            }
            union() {
                hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                    translate([60-5,25-5,-1]) cylinder(r=5,h=64);
                }
                
                for(i=[0,1]) mirror([i,0,0]) hull() for(j=[0,1]) mirror([0,j,0]) {
                    translate([60-5,30-5,-1]) cylinder(r=5,h=64);
                    translate([brh+10+5,30-5,-1]) cylinder(r=5,h=64);
                }
                
                hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                    translate([60-5,30-5,0]) cylinder(r=5,h=10+6.85);
                    translate([60-5-17.5,30-5+17.5,0]) cylinder(r=5,h=10+6.85);
                }
            }
        }
        
        *hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([32.5-10,32.5,-1]) cylinder(r=2.5,h=50);
            translate([32.5,32.5-10,-1]) cylinder(r=2.5,h=50);
        }
        *translate([-200,-200,-50]) cube([200,400,200]);
    }
    *translate([0,0,expl*1]) translate([0,0,10+6.85+5.15]) ms_spacing() ms();
}

*for(i=[0:1]) rotate([0,0,i*90]) translate([0,0,64-16-38]) {
    translate([0,0,2.5-0.5]) cylinder(r=2.5,h=0.5);
    translate([2.5,0,0]) rotate([0,90,0]) cylinder(r=2.5,h=30-5);
    translate([30,0,-(2.5-0.5)]) cylinder(r=2.5,h=0.5);
}
*translate([0,0,64-16]) piv_in();



//prototype servo spacing
*difference() {
    hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
        translate([32.5-10,32.5,0]) cylinder(r=2.5-0.5,h=6.85);
        translate([32.5,32.5-10,0]) cylinder(r=2.5-0.5,h=6.85);
    }
    hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
        translate([(20-2.5),(20-2.5),-1]) cylinder(r=2.5,h=50);
    }
    
    *difference() {
        translate([-100,-100,-1]) cube([200,200,1+6.85-2]);
        for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([25,25,-2]) cylinder(r=5,h=50);
        }
    }
    
    *translate([-27.7-8.8,20.8-10.4,-10.3/2]) {
        translate([0,0,-1]) cylinder(r=1.5,h=20);
        translate([22.2,10.4,-1]) cylinder(r=1.5,h=20);
    }
}
*translate([0,0,expl*1]) translate([0,0,6.85+5.15]) ms_spacing() ms();








