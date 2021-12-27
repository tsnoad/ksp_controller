$fn=16;

    b_o = 4;
    b_o2 = b_o*2;
    
    b_r = b_o+2;
    
    sw_o = 15;
    
r1 = 4;
r2 = 4+0.01;
r12 = r1+r2;
    
difference() {
    union() {
        *hull() {
            /*translate([(25-b_r),(0-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            translate([(25-b_r),-(25-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            translate([-(25-b_r),(0-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            translate([-(25-b_r),-(25-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            
            translate([(25-b_r),(0-b_r),0]) cylinder(r=b_r-b_o,h=40);
            translate([(25-b_r),-(25-b_r),0]) cylinder(r=b_r-b_o,h=40);
            translate([-(25-b_r),(0-b_r),0]) cylinder(r=b_r-b_o,h=40);
            translate([-(25-b_r),-(25-b_r),0]) cylinder(r=b_r-b_o,h=40);*/
        }
        
        hull() for(ix=[(25-r12),-(25-r12)]) for(iy=[(0-r12),-(25-r12)]) for(iz=[r1,40-r1]) for(iz=[r1,40-r1]) translate([ix,iy,iz]) {
            rotate_extrude() translate([r2,0]) circle(r=r1);
        }
    
        *hull() {
            translate([(25-sw_o-b_r),(25-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            translate([(25-sw_o-b_r),-(25-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            translate([-(25-b_r),(25-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            translate([-(25-b_r),-(25-b_r),b_o]) cylinder(r=b_r,h=40-b_o2);
            
            translate([(25-sw_o-b_r),(25-b_r),0]) cylinder(r=b_r-b_o,h=40);
            translate([(25-sw_o-b_r),-(25-b_r),0]) cylinder(r=b_r-b_o,h=40);
            translate([-(25-b_r),(25-b_r),0]) cylinder(r=b_r-b_o,h=40);
            translate([-(25-b_r),-(25-b_r),0]) cylinder(r=b_r-b_o,h=40);
        
            translate([(25-b_r),(25-b_r),b_o]) cylinder(r=b_r,h=40-sw_o-b_o2);
            translate([(25-b_r),-(25-b_r),b_o]) cylinder(r=b_r,h=40-sw_o-b_o2);
            translate([-(25-b_r),(25-b_r),b_o]) cylinder(r=b_r,h=40-sw_o-b_o2);
            translate([-(25-b_r),-(25-b_r),b_o]) cylinder(r=b_r,h=40-sw_o-b_o2);
            
            translate([(25-b_r),(25-b_r),0]) cylinder(r=b_r-b_o,h=40-sw_o);
            translate([(25-b_r),-(25-b_r),0]) cylinder(r=b_r-b_o,h=40-sw_o);
            translate([-(25-b_r),(25-b_r),0]) cylinder(r=b_r-b_o,h=40-sw_o);
            translate([-(25-b_r),-(25-b_r),0]) cylinder(r=b_r-b_o,h=40-sw_o);
        }
        
        hull() {
            for(ix=[(25-r12),-(25-r12)]) for(iy=[(25-r12),-(25-r12)]) for(iz=[r1,40-r1]) for(iz=[r1,40-sw_o-r1]) translate([ix,iy,iz]) {
                rotate_extrude() translate([r2,0]) circle(r=r1);
            }
            for(ix=[(25-sw_o-r12),-(25-r12)]) for(iy=[(25-r12),-(25-r12)]) for(iz=[r1,40-r1]) for(iz=[r1,40-r1]) translate([ix,iy,iz]) {
                rotate_extrude() translate([r2,0]) circle(r=r1);
            }
        }
        
        *translate([(25-sw_o)-b_o,-b_o,40-b_o]) cube([b_o,b_o,b_o]);
    }
    
    translate([(25-sw_o),0,40-b_o]) cylinder(r1=0,r2=10,h=10); 
    
    translate([25-sw_o/2-2,12.5,40-sw_o/2-2]) rotate([0,45,0]) rotate([0,0,90]) switch_co_b();
    
    
    translate([0,(8+4),-1]) {
        cylinder(r=2+0.25,h=4+4+8);
        //translate([0,0,4]) hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=0.5,h=4+4+8);
        translate([0,0,4]) cylinder(r=3.5/cos(30)+0.5,h=8);
        translate([0,0,4+8]) sphere(r=3.5/cos(30)+0.5);
        translate([0,0,4+8]) rotate([0,0,0]) cylinder(r=3.5/cos(30)+0.5,h=200);
    }
    translate([0,-(8+4),-1]) {
        cylinder(r=2+0.25,h=4+4+8);
        //translate([0,0,4]) hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=0.5,h=4+4+8);
        translate([0,0,4]) cylinder(r=3.5/cos(30)+0.5,h=8);
        translate([0,0,4+8]) sphere(r=3.5/cos(30)+0.5);
        translate([0,0,4+8]) rotate([0,0,0]) cylinder(r=3.5/cos(30)+0.5,h=200);
    }
}

*translate([100,0,0]) import("/Users/tsnoad/Things/ksp_controller/attitude_controller.stl");

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
    b_r = 50;
    
    translate([0,0,-0.5]) cylinder(r1=7,r2=7+1,h=1);
    translate([0,0,-5]) cylinder(r=3+0.25,h=50+5);
    
    for(i=[0:1]) rotate([0,0,i*90]) hull() {
        translate([-1,6,-0.5-1.75]) cylinder(r=1,h=50);
        translate([+1,6,-0.5-1.75]) cylinder(r=1,h=50);
    }
    
    translate([0,0,-15]) hull() {
        cylinder(r=body_co_r,h=15-0.5-3);
        translate([-body_co_r*tan(22.5),-body_co_r,0]) cube([2*body_co_r*tan(22.5),2*body_co_r,15-0.5-3]);
    }
    
    translate([0,b_r,-15+0.01]) intersection() {
        rotate([0,90,0]) rotate_extrude($fn=$fn*4) translate([b_r,0,0]) hull() {
            circle(r=body_co_r,$fn=$fn/4);
            rotate([0,0,90]) translate([-body_co_r*tan(22.5),-body_co_r]) square([2*body_co_r*tan(22.5),2*body_co_r]);
        }
        translate([-25,-b_r-50,-100]) cube([50,b_r+50,100]);
    }
}