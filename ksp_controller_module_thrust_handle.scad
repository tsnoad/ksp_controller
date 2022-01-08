$fn=36;


include <ksp_controller_include.scad>;


r3 = 125;
a_o = 8;
a_h = 27.5; //height of thumb-side section
r4 = 4;
//r4x = 90-a_h;
b5 = 2;

ba_o = 18; //offset of thumb-button angle

m_h = 30;
m_ha = 30;

//test for round bevels on an angle
*hull() {
    cylinder(r=20,h=10);
    
    for(i=[0:$fn-1]) translate([(20-4)*cos(360/$fn*i),(20-4)*sin(360/$fn*i),10+20+(20-4)*cos(360/$fn*i)*tan(30)]) sphere(r=4);
}


difference() {
    union() {
        translate([6+4,45+7.5,-((32-12)*sin(30)-25-(12))]) rotate([90,0,0]) {
            hull() {
                translate([(12-4)-(12-4)-ba_o+8,12-(12-4),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
                
                translate([(12-4)-(12-4)-ba_o+8,(32-12)*sin(30)-25-(12-4),0]) {
                    //translate([0,0,m_h]) cylinder(r=4,h=90-m_h-a_h);
                    *translate([0,0,m_h]) sphere(r=r4);
                    
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                    
                    translate([0,0,90-r4]) sphere(r=r4);
                }
                *translate([(12-4),(32-12)*sin(30)-25-(12-4)+m_h*tan(m_ha),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
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
                *translate([-ba_o,(32-12)*sin(30)-25-(12-4)+m_h*tan(m_ha),0]) {
                    translate([0,0,b5]) cylinder(r=4,h=90-b5-a_h);
                    cylinder(r=4-b5,h=90-a_h);
                }
            }
            
            
            //rear half
            hull() intersection() {
                *translate([-100,-50,0]) cube([100-ba_o+0.01,100,100]);
                union() {
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
                        for(i=[0:($fn/4)-1]) translate([(32-r4)*cos(180-i/$fn*360),a_o+(32-r4)*sin(180-i/$fn*360),90-r4+min(0,((32-r4)*cos(180-i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                        
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
                    for(i=[0:$fn-1]) translate([-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360),(32-12)*sin(30)-25+(12-r4)*sin(i/$fn*360),90-r4+min(0,(-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                    for(i=[0:$fn-1]) translate([-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360),(32-12)*sin(30)-25+a_o+(12-r4)*sin(i/$fn*360),90-r4+min(0,(-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                    
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
            }
            
            //fwd half
            hull() intersection() {
                *translate([-ba_o-0.01,-50,0]) cube([100,100,100]);
                union() {
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
        }
        intersection() {
            hull() {
                translate([6-50,0,0]) cylinder(r=12,h=35);
                translate([6,0,0]) cylinder(r=12,h=35);
                translate([6-50,50/tan(30),0]) cylinder(r=12,h=35);
            }
            translate([6+4-ba_o,-50,0]) cube([100,100,100]);
        }
    }
    
    translate([6+4,45+7.5,-((32-12)*sin(30)-25-(12))]) rotate([90,0,0]) translate([0,12,90]) switch_co();
    
    for(i=[0,1]) mirror([i,0,0]) translate([(8+4),0,-1]) {
        hull() {
            cylinder(r=m4_h_r,h=4+4+8);
            translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
        }
        hull() {
            translate([0,0,4]) rotate([0,0,0]) cylinder(r=5+0.25,h=200);
            translate([-(5+0.25)*tan(22.5),-(5+0.25),4]) cube([2*(5+0.25)*tan(22.5),2*(5+0.25),50]);
        }
    }
}







//translate([0,45,0]) rotate([90,0,0])
*difference() {
    union() {
        hull() {
            intersection() {
                union() {
                    cylinder(r=32-b5,h=90-a_h);
                    translate([0,0,b5]) cylinder(r=32,h=90-b5-a_h);
                    //translate([0,a_o,90-a_h]) cylinder(r=32,h=a_h-r4x);
                    intersection() {
                        translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                            translate([32-r3,0]) circle(r=r3,$fn=$fn*4);
                            translate([0,-r3]) square([50,r3*2]);
                        }
                        translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                    }
                }
                translate([-100,0,0]) cube([100,100,100]);
            }
            *for(i=[0:($fn/4)-1]) translate([(32-r4)*cos(180-i/$fn*360),(32-r4)*sin(180-i/$fn*360),90-r4+min(0,((32-r4)*cos(180-i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            *for(i=[0:($fn/4)-1]) translate([(32-r4)*cos(180-i/$fn*360),a_o+(32-r4)*sin(180-i/$fn*360),90-r4+min(0,((32-r4)*cos(180-i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                
            
            
            /*translate([0,12,0]) cylinder(r=12-b5,h=90-a_h);
            translate([0,12,b5]) cylinder(r=12,h=90-b5-a_h);
            *for(i=[0:$fn-1]) translate([(12-r4)*cos(i/$fn*360),12+(12-r4)*sin(i/$fn*360),90-r4+min(0,((12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);*/
            
            translate([0,32-12,0]) {
                cylinder(r=12-b5,h=90-a_h);
                translate([0,0,b5]) cylinder(r=12,h=90-b5-a_h);
                //translate([0,a_o,90-a_h]) cylinder(r=12,h=a_h-r4x);
                intersection() {
                    translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                        translate([12-r3,0]) circle(r=r3,$fn=$fn*4);
                        translate([0,-r3]) square([50,r3*2]);
                    }
                    translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                }
            }
            *for(i=[0:$fn-1]) translate([(12-r4)*cos(i/$fn*360),32-12+(12-r4)*sin(i/$fn*360),90-r4+min(0,((12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                
            *for(i=[0:$fn-1]) translate([(12-r4)*cos(i/$fn*360),32-12+a_o+(12-r4)*sin(i/$fn*360),90-r4+min(0,((12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            
            translate([-(32-12)*cos(30)-25*tan(30),(32-12)*sin(30)-25,0]) {
                cylinder(r=12-b5,h=90-a_h);
                translate([0,0,b5]) cylinder(r=12,h=90-b5-a_h);
                //translate([0,a_o,90-a_h]) cylinder(r=12,h=a_h-r4x);
                intersection() {
                    translate([0,a_o,90-a_h]) rotate_extrude() intersection() {
                        translate([12-r3,0]) circle(r=r3,$fn=$fn*4);
                        translate([0,-r3]) square([50,r3*2]);
                    }
                    translate([-50,-50,b5]) cube([100,100,90-b5-a_h]);
                }
            }
            *for(i=[0:$fn-1]) translate([-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360),(32-12)*sin(30)-25+(12-r4)*sin(i/$fn*360),90-r4+min(0,(-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360)+ba_o)+tan(45))]) sphere(r=r4);
            *for(i=[0:$fn-1]) translate([-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360),(32-12)*sin(30)-25+a_o+(12-r4)*sin(i/$fn*360),90-r4+min(0,(-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            
            
            ba_a2 = atan((-(32-12)*cos(30)-25*tan(30))/(12-(32-12)*sin(30)-25-12));
            
            *translate([(32-r4)*cos(90+asin(ba_o/(32-r4))),a_o+(32-r4)*sin(90+asin(ba_o/(32-r4))),90-r4]) sphere(r=r4);
            *translate([-ba_o,12-ba_o/tan(90-ba_a2)-(12-r4)/sin(90-ba_a2),90-r4]) sphere(r=r4);
        }
        
        //import("/Users/tsnoad/Things/ksp_controller/thrust_controller_v2.stl");

        
        *translate([-(32-12)*cos(30)-25*tan(30),(32-12)*sin(30)-25-12,90-37.5-10]) cube([(32-12)*cos(30)+25*tan(30)+12,(32-12)*sin(30)+25-(32-12)+12+12,20]);
        
        *hull() {
            translate([-12-6,(32-12)*sin(30)-25-12,90-37.5]) rotate([-90,0,0]) cylinder(r=12,h=(32-12)*sin(30)+25-(32-12)+12+12);
            translate([-12+6,(32-12)*sin(30)-25-12,90-37.5]) rotate([-90,0,0]) cylinder(r=12,h=(32-12)*sin(30)+25-(32-12)+12+12);
            
            translate([-12-6,(32-12)*sin(30)-25-12+20,90-37.5-20]) rotate([-90,0,0]) cylinder(r=12,h=20);
            translate([-12+6,(32-12)*sin(30)-25-12+20,90-37.5-20]) rotate([-90,0,0]) cylinder(r=12,h=20);
        }
    }
    
    translate([0,12,90]) switch_co();
    *translate([-12,0,90]) rotate([0,-45,0]) translate([-50,-50,0]) cube([100,100,50]);
    
    *translate([-12-(8+4),(32-12)*sin(30)-25-12-1,90-37.5]) rotate([-90,0,0]) {
        hull() {
            cylinder(r=2+0.25,h=200);
            translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),200]);
        }
        hull() {
            translate([0,0,4]) cylinder(r=3.5/cos(30)+0.5,h=200);
            translate([-(3.5/cos(30)+0.5)*tan(22.5),-(3.5/cos(30)+0.5),4]) cube([2*(3.5/cos(30)+0.5)*tan(22.5),2*(3.5/cos(30)+0.5),200]);
        }
    }
    *translate([-12+(8+4),(32-12)*sin(30)-25-12-1,90-37.5]) rotate([-90,0,0]) {
        hull() {
            cylinder(r=2+0.25,h=200);
            translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),200]);
        }
        hull() {
            translate([0,0,4]) cylinder(r=3.5/cos(30)+0.5,h=200);
            translate([-(3.5/cos(30)+0.5)*tan(22.5),-(3.5/cos(30)+0.5),4]) cube([2*(3.5/cos(30)+0.5)*tan(22.5),2*(3.5/cos(30)+0.5),200]);
        }
    }
}

//translate([0,-75,0]) import("/Users/tsnoad/Things/ksp_controller/thrust_controller.stl");



module switch_co() {
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
}