$fn=72;


include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;


r3 = 125;
a_o = 8;
a_h = 27.5; //height of thumb-side section
r4 = 4;
//r4x = 90-a_h;
b5 = 2;

bah_o = 18;
ba_o = 18; //offset of thumb-button angle
ba_a = 45;
ba2_o = /*-(-(32-12)*cos(30)-25*tan(30))*/50;
ba2_a = 60;

m_h = 30;
m_ha = 30;

//test for round bevels on an angle
*hull() {
    cylinder(r=20,h=10);
    
    for(i=[0:$fn-1]) translate([(20-4)*cos(360/$fn*i),(20-4)*sin(360/$fn*i),10+20+(20-4)*cos(360/$fn*i)*tan(30)]) sphere(r=4);
}


*rotate([0,0,-90]) translate([0,0,-35]) camactutor_thrust();

difference() {
    union() {
        translate([-4+12+8,45+7.5,-((32-12)*sin(30)-25-(12))]) rotate([90,0,0]) union() {
            //switch hood
            difference() {
                hull() {
                    for(iz=[0,8]) translate([0,0,iz]) translate([(12-4),12-(12-4),0]) {
                        translate([0,0,90-r4]) sphere(r=r4);
                    }
                
                    for(iz=[0,8]) translate([0,0,iz]) for(i=[0:$fn-1]) translate([0+(12-r4)*cos(i/$fn*360),32-12+a_o+(12-r4)*sin(i/$fn*360),90-r4]) sphere(r=r4);
                        
                    
                    for(i=[0:($fn/4)-1]) {
                        if((32-r4)*cos(180-i/$fn*360) > -bah_o) {
                            translate([(32-r4)*cos(180-i/$fn*360),a_o+(32-r4)*sin(180-i/$fn*360),90-r4]) sphere(r=r4);
                        }
                        translate([0,0,8]) if((32-r4)*cos(180-i/$fn*360) > -bah_o+8) {
                            translate([(32-r4)*cos(180-i/$fn*360),a_o+(32-r4)*sin(180-i/$fn*360),90-r4]) sphere(r=r4);
                        }
                        
                        if((32-r4)*cos(180-i/$fn*360) < -bah_o+8) if((32-r4)*cos(180-i/$fn*360) > -bah_o) {
                            translate([(32-r4)*cos(180-i/$fn*360),a_o+(32-r4)*sin(180-i/$fn*360),90-r4+((32-r4)*cos(180-i/$fn*360)+bah_o)]) sphere(r=r4);
                        }
                    }
                            
                    translate([(32-r4)*cos(90+asin(bah_o/(32-r4))),(32-r4)*sin(90+asin(bah_o/(32-r4))),0]) {
                        translate([0,a_o,90-r4]) sphere(r=r4);
                    }
                    translate([(32-r4)*cos(90+asin((bah_o-8)/(32-r4))),(32-r4)*sin(90+asin((bah_o-8)/(32-r4))),8]) {
                        translate([0,a_o,90-r4]) sphere(r=r4);
                    }
                    
                    
                    for(iz=[0,8]) translate([0,0,iz]) translate([-bah_o+iz,12-(12-4),0]) {
                        translate([0,0,90-r4]) sphere(r=r4);
                    }
                }

                hull() {
                    translate([0,32-12+a_o,90+8]) cylinder(r=12-r4,h=50);
                    translate([0,32-12+a_o,90]) cylinder(r=12-r4-4,h=50);
                    
                    translate([(12-r4)-4,12-(12-4)+4,90+8]) cylinder(r=4,h=50);
                    translate([(12-r4)-4,12-(12-4)+4,90]) cylinder(r=4-4+0.01,h=50);
                    
                    translate([0,a_o,90+8]) intersection() {
                        cylinder(r=32-r4,h=50);
                        translate([-bah_o-5,0,0]) cube([bah_o+5,50,50]);
                    }
                    translate([0,a_o,90]) intersection() {
                        cylinder(r=32-r4-4,h=50);
                        translate([-bah_o-5,0,0]) cube([bah_o+5,50,50]);
                    }
                    
                    translate([-bah_o-5+4,12-(12-4)+4,90+8]) cylinder(r=4,h=50);
                    translate([-bah_o-5+4,12-(12-4)+4,90]) cylinder(r=4-4+0.01,h=50);
                }
            }
            
            //base piece
            hull() {
                translate([0,12-(12-4),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
                
                translate([0,(32-12)*sin(30)-25-(12-4),0]) {
                    //translate([0,0,m_h]) cylinder(r=4,h=90-m_h-a_h);
                    *translate([0,0,m_h]) sphere(r=r4);
                    
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
                
                translate([-ba_o,12-(12-4),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
                
                translate([-ba_o,(32-12)*sin(30)-25-(12-4),0]) {
                    //translate([0,0,m_h]) cylinder(r=4,h=90-m_h-a_h);
                    *translate([0,0,m_h]) sphere(r=r4);
                    
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
            }
            
            
            //rear half
            hull() {
                intersection() {
                    union() {
                        cylinder(r=32-b5,h=90-a_h);
                        translate([0,0,b5]) cylinder(r=32,h=90-b5-a_h);
                        intersection() {
                            translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                                translate([32-r3,0]) circle(r=r3,$fn=$fn*4);
                                translate([0,-r3]) square([50,r3*2]);
                            }
                            translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                        }
                    }
                    translate([-100,0,0]) cube([100-ba_o,100,100]);
                }
                intersection() {
                    for(i=[0:($fn/4)-1]) {
                        ix = (32-r4)*cos(180-i/$fn*360);
                        iy = a_o+(32-r4)*sin(180-i/$fn*360);
                        iz = 90-r4+(ix+ba_o)*tan(ba_a);
                        
                        #if(-ix>=ba_o) {
                            translate([ix,iy,iz]) sphere(r=r4);
                        }
                    }
                    
                    translate([-100,0,0]) cube([100-ba_o,100,100]);
                }
            
            
                translate([-(32-12)*cos(30)-25*tan(30),(32-12)*sin(30)-25,0]) {
                    cylinder(r=12-b5,h=90-a_h);
                    translate([0,0,b5]) cylinder(r=12,h=90-b5-a_h);
                    intersection() {
                        translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                            translate([12-r3,0]) circle(r=r3,$fn=$fn*4);
                            translate([0,-r3]) square([50,r3*2]);
                        }
                        translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                    }
                }
                for(i=[0:$fn-1]) {
                    ix = -(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360);
                    iy = (32-12)*sin(30)-25+(12-r4)*sin(i/$fn*360);
                    iz = 90-r4+(ix+ba_o)*tan(ba_a);
                    
                    if(-ix>=ba_o) if(-ix<=ba2_o) {
                        translate([ix,iy,iz]) sphere(r=r4);
                    }
                    
                    i2z = 90-r4+(ix+ba2_o)*tan(ba2_a)+(-(32-12)*cos(30)-25*tan(30)+ba_o)*tan(ba_a);
                    
                    if(-ix>=ba2_o) {
                        translate([ix,iy,i2z]) sphere(r=r4);
                    }
                }
                
                for(i=[0:$fn-1]) {
                    ix = -(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360);
                    iy = (32-12)*sin(30)-25+a_o+(12-r4)*sin(i/$fn*360);
                    iz = 90-r4+(ix+ba_o)*tan(ba_a);
                    
                    if(-ix>=ba_o) if(-ix<=ba2_o) {
                        translate([ix,iy,iz]) sphere(r=r4);
                    }
                    
                    i2z = 90-r4+(ix+ba2_o)*tan(ba2_a)+(-(32-12)*cos(30)-25*tan(30)+ba_o)*tan(ba_a);
                    
                    if(-ix>=ba2_o) {
                        translate([ix,iy,i2z]) sphere(r=r4);
                    }
                }
                
                translate([(32-r4)*cos(90+asin(ba_o/(32-r4))),(32-r4)*sin(90+asin(ba_o/(32-r4))),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,a_o,90-a_h]) sphere(r=r4);
                    translate([0,a_o,90-r4]) sphere(r=r4);
                }
                translate([-ba_o,(32-12)*sin(30)-25-(12-4),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
            }
            
            //fwd half
            hull() {
                intersection() {
                    union() {
                        cylinder(r=32-b5,h=90-a_h);
                        translate([0,0,b5]) cylinder(r=32,h=90-b5-a_h);
                        intersection() {
                            translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                                translate([32-r3,0]) circle(r=r3,$fn=$fn*4);
                                translate([0,-r3]) square([50,r3*2]);
                            }
                            translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                        }
                    }
                    hull() {
                        translate([-ba_o,0,b5]) cube([ba_o,100,100]);
                        translate([-ba_o,b5,0]) cube([ba_o,100,100]);
                    }
                }
                for(i=[0:($fn/4)-1]) translate([max(-ba_o,(32-r4)*cos(180-i/$fn*360)),a_o+(32-r4)*sin(180-i/$fn*360),90-r4]) sphere(r=r4);
                
                translate([(12-4),12-(12-4),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
            
                translate([0,32-12,0]) {
                    cylinder(r=12-b5,h=90-a_h);
                    translate([0,0,b5]) cylinder(r=12,h=90-b5-a_h);
                    intersection() {
                        translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                            translate([12-r3,0]) circle(r=r3,$fn=$fn*4);
                            translate([0,-r3]) square([50,r3*2]);
                        }
                        translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                    }
                }
                for(i=[0:$fn-1]) translate([0+(12-r4)*cos(i/$fn*360),32-12+a_o+(12-r4)*sin(i/$fn*360),90-r4]) sphere(r=r4);
                        
                translate([(32-r4)*cos(90+asin(ba_o/(32-r4))),(32-r4)*sin(90+asin(ba_o/(32-r4))),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,a_o,90-a_h]) sphere(r=r4);
                    translate([0,a_o,90-r4]) sphere(r=r4);
                }
                translate([-ba_o,12-(12-4),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
            }
        }
        
        echo(-4+12+8-(32-12)*cos(30)-25*tan(30));
        
        //mounting interface
        *hull() for(i=[0,1]) mirror([0,i,0]) translate([20,-12,0]) {
            translate([0,0,2]) rotate([0,-90,0]) cylinder(r=2,h=20-(-4+12+8-(32-12)*cos(30)-25*tan(30))+12);
            translate([0,-10,2+12-2]) rotate([0,-90,0]) cylinder(r=2,h=20-(-4+12+8-(32-12)*cos(30)-25*tan(30))+12);
        }
        hull() for(i=[0,1]) mirror([0,i,0]) translate([20,-12,0]) {
            translate([0,0,2]) rotate([0,-90,0]) cylinder(r=2,h=20+20);
            translate([0,-4,2+4-2]) rotate([0,-90,0]) cylinder(r=2,h=20+20);
        }
    }
    
    translate([6,45+7.5,-((32-12)*sin(30)-25-(12)-6)]) rotate([90,0,0]) translate([0,12,90]) {
        switch_co_thrust();
        hull() {
            translate([0,0,-15]) sphere(r=7.5);
            translate([-7.5,-20,-90]) sphere(r=7.5);
        }
    }
    
    //cable routing
    hull() {
        sphere(r=5);
        translate([0,-5,0]) rotate([-90,0,0]) cylinder(r=5*tan(22.5),h=2*5);
        
        translate([0,0,15]) {
            sphere(r=5);
            translate([0,-5,0]) rotate([-90,0,0]) cylinder(r=5*tan(22.5),h=2*5);
        }
    }
    hull() {
        translate([0,0,15]) {
            sphere(r=5);
            translate([0,-5,0]) rotate([-90,0,0]) cylinder(r=5*tan(22.5),h=2*5);
        }
        
        translate([3.75,0,37.5]) {
            sphere(r=5);
            translate([0,-5,0]) rotate([-90,0,0]) cylinder(r=5*tan(22.5),h=2*5);
        }
    }
    
    //mounting bolt endnut cos
    for(i=[0,1]) mirror([i,0,0]) rotate([0,0,90]) translate([0,(8+4),0]) {
        translate([0,0,-1]) hull() {
            cylinder(r=m4_v_r,h=1+6+8+8);
            rotate([0,0,90]) translate([-m4_v_r*tan(22.5),-m4_v_r,0]) cube([2*m4_v_r*tan(22.5),2*m4_v_r,1+6+8+8]);
        }
        //translate([0,0,4]) m4_endnut_vert_co(5);
        translate([0,0,6]) rotate([-90,0,0]) hull() m4_endnut_vert_co_wid(6) union() {
            for(iz=[0,50]) {
                translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) translate([3.5/cos(30),0,0]) cylinder(r=max(0.01,m4n_v_r-3.5),h=8);
            }
        }
    }
}


module switch_co_thrust() {
    body_co_r = 7.5;
    b_r = 125;
    
    translate([0,0,-0.5]) cylinder(r1=7,r2=7+1,h=1);
    translate([0,0,-5]) cylinder(r=3+0.25,h=50+5);
    
    for(i=[0:1]) rotate([0,0,i*90]) hull() {
        translate([-1,6,-0.5-1.75]) cylinder(r=1,h=50);
        translate([+1,6,-0.5-1.75]) cylinder(r=1,h=50);
    }
    
    translate([0,0,-15]) {
        hull() {
            cylinder(r=body_co_r,h=15-0.5-3-0.4);
            *translate([-body_co_r*tan(22.5),-body_co_r,0]) cube([2*body_co_r*tan(22.5),2*body_co_r,15-0.5-3]);
        }
        translate([-sqrt(pow(body_co_r,2)-pow(3+0.25,2)),-(3+0.25),0]) cube([2*sqrt(pow(body_co_r,2)-pow(3+0.25,2)),2*(3+0.25),15-0.5-3-0.2]);
        translate([-(3+0.25),-(3+0.25),0]) cube([2*(3+0.25),2*(3+0.25),15-0.5-3]);
    }
}

/*module switch_co() {
    body_co_r = 7.5;
    
    translate([0,0,-0.5]) cylinder(r1=7,r2=7+1,h=1);
    translate([0,0,-150]) cylinder(r=3+0.25,h=200);
    
    for(i=[0:1]) rotate([0,0,i*90]) hull() {
        translate([-1,6,-0.5-1.75]) cylinder(r=1,h=50);
        translate([+1,6,-0.5-1.75]) cylinder(r=1,h=50);
    }
    
    translate([0,0,-150]) intersection() {
        hull() {
            cylinder(r=body_co_r,h=150-0.5-3);
            *translate([-body_co_r*tan(22.5),-body_co_r,0]) cube([2*body_co_r*tan(22.5),2*body_co_r,150-0.5-2.5]);
        }
        union() {
            translate([-body_co_r,-body_co_r,0]) cube([body_co_r*2,body_co_r*2,150-0.5-3-0.2]);
            translate([-(3+0.25),-body_co_r,0]) cube([(3+0.25)*2,body_co_r*2,150-0.5-3]);
        }
    }
}*/