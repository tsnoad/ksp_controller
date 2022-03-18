$fn=72;


include <ksp_controller_include.scad>;

//translate([50,0,0]) import("STLs/ksp_controller_module_attitude_handle.stl");


r1_theta1 = 5; //angle of bottom section
r1_a1 = 200; 
r1_o1 = r1_a1*tan(r1_theta1);
r1_h13 = r1_a1/cos(r1_theta1);
r1_theta2 = 7.5; //angle of top section
r1_a2 = r1_a1;
r1_h24 = r1_a2/cos(r1_theta2);
r1_theta3_theta4 = 30 - r1_theta1 - r1_theta2;
r1_o3_o4 = sqrt(pow(r1_h13,2) + pow(r1_h24,2) - 2*r1_h13*r1_h24*cos(r1_theta3_theta4));
r1_sigma3 = asin(r1_h24 * sin(r1_theta3_theta4) / r1_o3_o4);
r1_theta3 = 90-r1_sigma3;
r1_sigma4 = asin(r1_h13 * sin(r1_theta3_theta4) / r1_o3_o4);
r1_theta4 = 90-r1_sigma4;
r1_a34 = r1_h13 * cos(r1_theta3);
r1_o3 = r1_h13 * sin(r1_theta3);
r1_o4 = r1_h24 * sin(r1_theta4);

r2_theta1 = r1_theta1;
r2_a1 = 200+40-18-4;
r2_o1 = r2_a1*tan(r2_theta1);
r2_h13 = r2_a1/cos(r2_theta1);
r2_theta2 = r1_theta2;
r2_a2 = r2_a1;
r2_h24 = r2_a2/cos(r2_theta2);
r2_theta3_theta4 = 30 - r2_theta1 - r2_theta2;
r2_o3_o4 = sqrt(pow(r2_h13,2) + pow(r2_h24,2) - 2*r2_h13*r2_h24*cos(r2_theta3_theta4));
r2_sigma3 = asin(r2_h24 * sin(r2_theta3_theta4) / r2_o3_o4);
r2_theta3 = 90-r2_sigma3;
r2_sigma4 = asin(r2_h13 * sin(r2_theta3_theta4) / r2_o3_o4);
r2_theta4 = 90-r2_sigma4;
r2_a34 = r2_h13 * cos(r2_theta3);
r2_o3 = r2_h13 * sin(r2_theta3);
r2_o4 = r2_h24 * sin(r2_theta4);

r3_theta1 = r1_theta1;
r3_a1 = 200+40-18-12;
r3_o1 = r3_a1*tan(r3_theta1);
r3_h13 = r3_a1/cos(r3_theta1);
r3_theta2 = r1_theta2;
r3_a2 = r3_a1;
r3_h24 = r3_a2/cos(r3_theta2);
r3_theta3_theta4 = 30 - r3_theta1 - r3_theta2;
r3_o3_o4 = sqrt(pow(r3_h13,2) + pow(r3_h24,2) - 2*r3_h13*r3_h24*cos(r3_theta3_theta4));
r3_sigma3 = asin(r3_h24 * sin(r3_theta3_theta4) / r3_o3_o4);
r3_theta3 = 90-r3_sigma3;
r3_sigma4 = asin(r3_h13 * sin(r3_theta3_theta4) / r3_o3_o4);
r3_theta4 = 90-r3_sigma4;
r3_a34 = r3_h13 * cos(r3_theta3);
r3_o3 = r3_h13 * sin(r3_theta3);
r3_o4 = r3_h24 * sin(r3_theta4);

difference() {
    translate([0,0,0]) union() {
        base();
        hood();
        handle();
    }
      
    //cutout to install the side switch
    translate([0,r1_a2,0]) {
        rotate([-r1_theta1-r1_theta3,0,0]) translate([0,-r1_a34,r1_o4]) {
            translate([-(18-4)-16,0,-16]) {
                rotate([0,-45,0]) translate([10,0,4]) rotate([0,0,-90]) switch_co_b();
            }
        }
    }
    
    //import("STLs/ksp_controller_module_attitude_handle_v2.stl",convexity=10);
    
    //cable routing
    hull() {
        sphere(r=5);
        translate([0,0,20]) sphere(r=5);
    }
    hull() {
        translate([0,0,20]) sphere(r=5);
        translate([0,7.5,47.5]) sphere(r=5);
    }
    hull() {
        translate([0,7.5,47.5]) sphere(r=5);
        translate([0,25,90]) sphere(r=5);
    }
    hull() {
        translate([0,25,90]) sphere(r=5);
        translate([4,42.5,115]) sphere(r=5);
    }
    hull() {
        translate([0,25,90]) sphere(r=5);
        translate([-20,42.5,115]) sphere(r=5);
    }
    
    *for(i=[(8+4),-(8+4)]) translate([0,i,-1]) {
        cylinder(r=2+0.25,h=4+4+8);
        //translate([0,0,4]) hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=0.5,h=4+4+8);
        translate([0,0,4]) cylinder(r=3.5/cos(30)+0.5,h=8);
        translate([0,0,4+8]) sphere(r=3.5/cos(30)+0.5);
        translate([0,0,4+8]) rotate([7.5,0,0]) cylinder(r=3.5/cos(30)+0.5,h=200);
    }
    
    
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

module handle() {
    //body of handle
    translate([0,r1_a2,0]) difference() {
        union() {
            //bottom section
            hull() {
                rotate([0,0,0]) translate([0,-r1_a2,0]) sphere(r=18);
                rotate([0,0,0]) translate([-(18-4),-r2_a2,0]) sphere(r=4);
                rotate([0,0,0]) translate([(18-12),-r3_a2,0]) sphere(r=12);
                
                rotate([-r1_theta1,0,0]) translate([0,-r1_h13,0]) sphere(r=18);
                rotate([-r2_theta1,0,0]) translate([-(18-4),-r2_h13,0]) sphere(r=4);
                rotate([-r3_theta1,0,0]) translate([(18-12),-r3_h13,0]) sphere(r=12);
            }
            
            //middle section
            hull() {
                rotate([-r1_theta1,0,0]) translate([0,-r1_h13,0]) sphere(r=18);
                rotate([-r2_theta1,0,0]) translate([-(18-4),-r2_h13,0]) sphere(r=4);
                rotate([-r3_theta1,0,0]) translate([(18-12),-r3_h13,0]) sphere(r=12);
                
                rotate([-30+r1_theta2,0,0]) translate([0,-r1_h24,0]) sphere(r=18);
                rotate([-30+r2_theta2,0,0]) translate([-(18-4),-r2_h24,0]) sphere(r=4);
                rotate([-30+r3_theta2,0,0]) translate([(18-12),-r3_h24,0]) sphere(r=12);
            }
            
            //top section
            hull() {
                rotate([-30+r1_theta2,0,0]) translate([0,-r1_h24,0]) sphere(r=18);
                rotate([-30+r2_theta2,0,0]) translate([-(18-4),-r2_h24,0]) sphere(r=4);
                rotate([-30+r3_theta2,0,0]) translate([(18-12),-r3_h24,0]) sphere(r=12);
                
                rotate([-30,0,0]) translate([0,-r1_a2,0]) sphere(r=18);
                rotate([-30,0,0]) translate([-(18-4),-r2_a2,0]) sphere(r=4);
                rotate([-30,0,0]) translate([(18-12),-r3_a2,0]) sphere(r=12);
            }
        }
        
        //cut off the top and bottom
        translate([-50,-200-50,-50]) cube([100,100,50]);
        rotate([-30,0,0]) translate([-50,-200-50,0]) cube([100,100,50]);
    }
    
    //side bulge for side button
    translate([0,r1_a2,0]) {
        //here's a handy copy of the middle section
        *hull() {
            rotate([-r1_theta1-r1_theta3,0,0]) translate([0,-r1_a34,-r1_o3]) cylinder(r=18,h=r1_o3+r1_o4);
            rotate([-r2_theta1-r2_theta3,0,0]) translate([-(18-4),-r2_a34,-r1_o3]) cylinder(r=4,h=r1_o3+r1_o4);
            rotate([-r3_theta1-r3_theta3,0,0]) translate([(18-12),-r3_a34,-r1_o3]) cylinder(r=12,h=r1_o3+r1_o4);
        }
        
        //angle of the overhang up and out to the side bulge
        b_a = -37.5;
        
        hull() {
            //front
            rotate([-r1_theta1-r1_theta3,0,0]) translate([0,-r1_a34,-r1_o3]) {
                //tilt down and to the side
                translate([0,0,r1_o3+r1_o4]) {
                    translate([-(18-4),max(-(40-18-4-8),(18-4)),min(0,(18-4))*tan(45)]) sphere(r=4);
                    
                    for(i=[0:$fn-1]) translate([(18-4)*cos(i/$fn*360),max(-(40-18-4-8),(18-4)*sin(i/$fn*360)),min(0,(18-4)*cos(i/$fn*360)+(18-4))*tan(45)]) sphere(r=4);
                    
                    for(i=[0:$fn-1]) translate([-16+(18-4)*cos(i/$fn*360),max(-(40-18-4-8),(18-4)*sin(i/$fn*360)),min(0,-16+(18-4)*cos(i/$fn*360)+(18-4))*tan(45)]) sphere(r=4);
                }
                
                //up and out (the overhang out to the side bulge)
                translate([0,0,0]) {
                    translate([0,(18-4),min(0,0)*tan(b_a)]) sphere(r=4);
                    
                    for(i=[0:$fn-1]) translate([(18-4)*cos(i/$fn*360),(18-4)*sin(i/$fn*360),min(0,(18-4)*cos(i/$fn*360))*tan(b_a)]) sphere(r=4);
                    
                    for(i=[0:$fn-1]) translate([-16+(18-4)*cos(i/$fn*360),(18-4)*sin(i/$fn*360),min(0,-16+(18-4)*cos(i/$fn*360))*tan(b_a)]) sphere(r=4);
                }
            }
            
            //back left (the small one)
            rotate([-r2_theta1-r2_theta3,0,0]) translate([-(18-4),-r2_a34,-r1_o3]) {
                //tilt down and to the side
                translate([0,0,r1_o3+r1_o4]) {
                    translate([0,max(8,0),min(0,-(18-4)+(18-4))*tan(45)]) sphere(r=4);
                    translate([-16,max(8,0),min(0,-(18-4)-16+(18-4))*tan(45)]) sphere(r=4);
                }
                
                //tilt down for thumb
                translate([0,0,r1_o3+r1_o4]) {
                    translate([8,0,min(0,-(18-4-8)+(18-4))*tan(45)]) sphere(r=4);
                    
                    translate([0,8,min(0,-(18-4)+(18-4))*tan(45)]) sphere(r=4);
                    translate([0,0,min(0,-(18-4)+(18-4))*tan(45)-8]) sphere(r=4);
                    
                    translate([-16,8,min(0,-(18-4)-16+(18-4))*tan(45)]) sphere(r=4);
                    translate([-16,0,min(0,-(18-4)-16+(18-4))*tan(45)-8]) sphere(r=4);
                }
                
                //up and out (the overhang out to the side bulge)
                translate([0,0,0]) {
                    translate([0,0,min(0,-(18-4))*tan(b_a)]) sphere(r=4);
                    translate([-16,0,min(0,-(18-4)-16)*tan(b_a)]) sphere(r=4);
                }
            }
            
            //back right (the larger one)
            rotate([-r3_theta1-r3_theta3,0,0]) translate([(18-12),-r3_a34,-r1_o3]) {
                //dont need anything here
            }
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
    b_r = 100;
    
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

module hood() {
    translate([0,200,0]) rotate([-30,0,0]) translate([0,-200,0]) {
        difference() {
            union() {
                //wider version
                /*hull() {
                    for(i=[0,1]) mirror([i,0,0]) {
                        translate([-18-20+12,18,40-12]) rotate([90,0,0]) cylinder(r=12,h=40);
                        translate([-18-20+12,18-40+8,12]) rotate([90,0,0]) cylinder(r=12,h=8);
                    
                        translate([-18+12,18,12-10]) rotate([90,0,0]) cylinder(r=12,h=40);
                        translate([-18+12,18-40+8,12-20]) rotate([90,0,0]) cylinder(r=12,h=8);
                    }
                }*/
                
                //hood body
                hull() {
                    for(i=[(-18-20+12),-(-18-4+12)]) {
                        //front
                        translate([i,18,40-12]) rotate([90,0,0]) rotate_extrude() translate([12-4,4]) circle(r=4);
                        translate([i,18,40-12-4]) rotate([90,0,0]) rotate_extrude() translate([12-4,4]) circle(r=4);
                        
                        //top
                        translate([i,18-40,40-12]) rotate([90,0,0]) rotate_extrude() translate([12-2,-2]) circle(r=2);
                        translate([i,18-40,12]) rotate([90,0,0]) rotate_extrude() translate([12-2,-2]) circle(r=2);
                    }
                    translate([0,18-18,-20+18]) sphere(r=18);
                    translate([-(18-4),18-40+4,-20]) sphere(r=4);
                    translate([(18-12),18-40+12,-20]) sphere(r=12);
                }
                
                //switch guard
                difference() {
                    hull() {
                        for(i=[(-18-20+12),-(-18-4+12)]) {
                            translate([i,18-40,40-12]) rotate([90,0,0]) rotate_extrude() translate([12-2,-2]) circle(r=2);
                            translate([i,18-40,40-12]) rotate([90,0,0]) rotate_extrude() translate([12-2,8-2]) circle(r=2);
                            
                        }
                        for(i=[(-18-20+2),-(-18-4+2)]) {
                            translate([i,18-40+2,40-12]) sphere(r=2);
                            translate([i,18-40-8+2,40-12]) sphere(r=2);
                        
                            translate([i,18-40+2,12]) sphere(r=2);
                            translate([i,18-40-8+2,12+8]) sphere(r=2);
                        }
                    }
                    
                    //cutout
                    hull() {
                        for(i=[(-18-20+12),-(-18-4+12)]) {
                            translate([i,18-40-8,40-12]) rotate([90,0,0]) cylinder(r=12-4,h=50);
                            translate([i,18-40-8,12]) rotate([90,0,0]) cylinder(r=12-4,h=50);
                            
                            translate([i,18-40,40-12]) rotate([90,0,0]) cylinder(r=12-4-6,h=50);
                            translate([i,18-40,12]) rotate([90,0,0]) cylinder(r=12-4-6,h=50);
                        }
                    }
                }
                    
                //notch between switches
                hull() {
                    translate([-8,18-20,40-12-6-6]) rotate([90,0,0]) cylinder(r=1+3,h=20);
                    translate([-8,18-20,40-4]) rotate([90,0,0]) cylinder(r=1+3,h=20);
                    
                    translate([-8,18-20,40-12-6-6]) rotate([90,0,0]) cylinder(r=1,h=20+4);
                    translate([-8,18-20,40-4]) rotate([90,0,0]) cylinder(r=1,h=20+4);
                }
            }
            translate([(-18-20+12)+6,18-40,40-12-6]) rotate([90,0,0]) switch_co();
            translate([-(-18-4+12)-6,18-40,40-12-6]) rotate([90,0,0]) switch_co();
        }
    }
}

module base() {
    base_r = 10;
    base_r2 = base_r+6;
    
    //fillet cones
    difference() {
        cylinder(r=18+base_r,h=4+base_r);
        translate([0,0,4+base_r]) rotate_extrude() {
            translate([18+base_r,0]) circle(r=base_r);
        }
        cylinder(r=18+base_r2,h=4);
    }
    translate([(18-12),-(40-18-12),0]) difference() {
        cylinder(r=12+base_r,h=4+base_r);
        translate([0,0,4+base_r]) rotate_extrude() {
            translate([12+base_r,0]) circle(r=base_r);
        }
        cylinder(r=12+base_r2,h=4);
    }
    translate([-(18-4),-(40-18-4),0]) difference() {
        cylinder(r=4+base_r,h=4+base_r);
        translate([0,0,4+base_r]) rotate_extrude() {
            translate([4+base_r,0]) circle(r=base_r);
        }
        cylinder(r=4+base_r2,h=4);
    }
    
    //fillets between cones
    difference() {
        union() {
            translate([0,-(40-18-12),0]) cube([18+base_r,40-18-12,4+base_r]);
            translate([-18-base_r,-(40-18-4),0]) cube([18+base_r,40-18-4,4+base_r]);
            translate([-18+4,-(40-18+base_r),0]) cube([18-4+18-12,40-18+base_r,4+base_r]);
        }
        translate([(18+base_r),50,4+base_r]) rotate([90,0,0]) cylinder(r=base_r,h=100);
        translate([-(18+base_r),50,4+base_r]) rotate([90,0,0]) cylinder(r=base_r,h=100);
        translate([-50,-(40-18+base_r),4+base_r]) rotate([0,90,0]) cylinder(r=base_r,h=100);
    }
    
    //extra width on base (for hand support and buildplate adhesion)
    hull() {
        cylinder(r=18+base_r2,h=4);
        translate([(18-12),-(40-18-12),0]) cylinder(r=12+base_r2,h=4);
        translate([-(18-4),-(40-18-4),0]) cylinder(r=4+base_r2,h=4);
    }
}




