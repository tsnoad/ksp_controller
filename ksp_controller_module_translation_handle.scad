$fn=72;

include <ksp_controller_include.scad>;

    b_o = 4;
    b_o2 = b_o*2;
    
    b_r = b_o+2;
    
    sw_o = 15;
    
r1 = 4;
r2 = 4+0.01;
r12 = r1+r2;

sw_yo = 8;
    
difference() {
    union() {
        //wings at front and back
        for(iym=[0,1]) mirror([0,iym,0]) {
            //wing
            hull() {
                for(ix=[(25-r12),-(25-r12)]) for(iy=[-(25-r12)]) for(iz=[r1,40-r1]) translate([ix,iy,iz]) {
                    rotate_extrude() translate([r2,0]) circle(r=r1);
                }
                for(ix=[(25-r1),-(25-r1)]) for(iy=[(-sw_yo-r1)]) for(iz=[r1,40-r1]) translate([ix,iy,iz]) {
                    sphere(r=r1);
                }
            }
            
            //fillet
            for(i=[($fn*2/4):($fn*3/4)-1]) {
                hull() {
                    for(xo=[0,10]) translate([-xo,0,0]) {
                        translate([25-sw_o+1+(1+r1)*cos(i/$fn*360),-sw_yo+1+(1+r1)*sin(i/$fn*360),40-r1]) sphere(r=r1);
                        translate([25-sw_o+1+(1+r1)*cos((i+1)/$fn*360),-sw_yo+1+(1+r1)*sin((i+1)/$fn*360),40-r1]) sphere(r=r1);
                    
                    }
                    
                    for(xo=[0,10]) translate([0,0,-xo]) {
                        translate([25-r1,-sw_yo+1+(1+r1)*cos(i/$fn*360+270),40-sw_o+1-(1+r1)*sin(i/$fn*360+270)]) sphere(r=r1);
                        translate([25-r1,-sw_yo+1+(1+r1)*cos((i+1)/$fn*360+270),40-sw_o+1-(1+r1)*sin((i+1)/$fn*360+270)]) sphere(r=r1);
                    }
                }
            }
        }
        
        //body of handle (this has the angle built-in)
        hull() {
            for(ix=[(25-r12),-(25-r12)]) for(iy=[(25-r12),-(25-r12)]) for(iz=[r1,40-sw_o-r1]) translate([ix,iy,iz]) {
                rotate_extrude() translate([r2,0]) circle(r=r1);
            }
            for(ix=[(25-sw_o-r12),-(25-r12)]) for(iy=[(25-r12),-(25-r12)]) for(iz=[r1,40-r1]) translate([ix,iy,iz]) {
                rotate_extrude() translate([r2,0]) circle(r=r1);
            }
            
            //prevent overhangs>45deg on the bottom
            for(ix=[(25-r12),-(25-r12)]) for(iy=[(25-r12),-(25-r12)]) translate([ix,iy,0]) {
                cylinder(r=r12-r1+r1*tan(22.5),h=1);
            }
        }
    }
    
    //switch co
    translate([25-sw_o/2-b_o,0,40-sw_o/2-b_o]) rotate([0,45,0]) translate([0,0,b_o]) rotate([0,0,90]) switch_co_b();
    
    //cable routing
    hull() {
        sphere(r=5);
        translate([0,0,15]) sphere(r=5);
        translate([-15,0,0]) sphere(r=5);
    }

    //co for nut for bolt to attach to pivots
    for(i=[0,1]) mirror([0,i,0]) translate([0,(8+4),0]) {
        translate([0,0,-1]) cylinder(r=m4_v_r,h=1+8+8);
        
        //washer co
        translate([0,0,4]) hull() {
            translate([0,-1,0]) cylinder(r=5,h=1.75-0.5);
            translate([0,50,0]) cylinder(r=5,h=1.75-0.5);
            
            translate([0,-1,0]) cylinder(r=5-2,h=1.75-0.5+2);
            translate([0,50,0]) cylinder(r=5-2,h=1.75-0.5+2);
        }
            
        //nut co
        translate([0,0,4]) hull() {
            translate([0,-1,0]) cylinder(r=m4n_v_r,h=9);
            translate([0,50,0]) cylinder(r=m4n_v_r,h=9);
            
            translate([0,-1,0]) cylinder(r=m4n_v_r-1,h=9+1);
            translate([0,50,0]) cylinder(r=m4n_v_r-1,h=9+1);
        }
    }
}

module switch_co() {
    body_co_r = 7.5;
    
    translate([0,0,-0.5]) cylinder(r1=7,r2=7+1,h=1);
    translate([0,0,-150]) cylinder(r=3+0.25,h=200);
    
    for(i=[0:1]) rotate([0,0,i*90]) hull() {
        translate([-1,6,-0.5-1.75]) cylinder(r=1,h=50);
        translate([+1,6,-0.5-1.75]) cylinder(r=1,h=50);
    }
    
    translate([0,0,-150]) hull() {
        cylinder(r=body_co_r,h=150-0.5-3);
        translate([-body_co_r*tan(22.5),-body_co_r,0]) cube([2*body_co_r*tan(22.5),2*body_co_r,150-0.5-2.5]);
    }
}

module switch_co_b() {
    body_co_r = 7.5;
    b_r = 20;
    
    translate([0,0,-0.5]) cylinder(r1=7,r2=7+1,h=1);
    translate([0,0,-5]) cylinder(r=3+0.25,h=50+5);
    
    for(i=[0:1]) rotate([0,0,i*90]) hull() {
        translate([-1,6,-0.5-1.75]) cylinder(r=1,h=50);
        translate([+1,6,-0.5-1.75]) cylinder(r=1,h=50);
    }
    
    translate([0,0,-50]) hull() {
        cylinder(r=body_co_r,h=50-0.5-3);
        translate([-body_co_r*tan(22.5),-body_co_r,0]) cube([2*body_co_r*tan(22.5),2*body_co_r,50-0.5-3]);
        
        *sphere(r=body_co_r);
        *translate([0,-body_co_r,0]) rotate([-90,0,0]) cylinder(r=body_co_r*tan(22.5),h=2*body_co_r);
    }
    
    *translate([0,0,-15]) hull() {
        sphere(r=body_co_r);
        translate([0,-body_co_r,0]) rotate([-90,0,0]) cylinder(r=body_co_r*tan(22.5),h=2*body_co_r);
        
        translate([-8,0,-8]) {
            sphere(r=body_co_r);
            translate([0,-body_co_r,0]) rotate([-90,0,0]) cylinder(r=body_co_r*tan(22.5),h=2*body_co_r);
        }
    }
    *translate([0,0,-15]) hull() {
        translate([-8,0,-8]) {
            sphere(r=body_co_r);
            translate([0,-body_co_r,0]) rotate([-90,0,0]) cylinder(r=body_co_r*tan(22.5),h=2*body_co_r);
        }
        translate([-8,0,-8-50]) {
            sphere(r=body_co_r);
            translate([0,-body_co_r,0]) rotate([-90,0,0]) cylinder(r=body_co_r*tan(22.5),h=2*body_co_r);
        }
    }
    
    *translate([0,b_r,-15+0.01]) intersection() {
        rotate([0,90,0]) rotate_extrude($fn=$fn*4) translate([b_r,0,0]) hull() {
            circle(r=body_co_r,$fn=$fn/4);
            rotate([0,0,90]) translate([-body_co_r*tan(22.5),-body_co_r]) square([2*body_co_r*tan(22.5),2*body_co_r]);
        }
        translate([-25,-b_r-50,-100]) cube([50,b_r+50,100]);
    }
}