$fn=16;


r3 = 125;
a_o = 8;
a_h = 27.5; //height of thumb-side section
r4 = 4;
//r4x = 90-a_h;
b5 = 2;

ba_o = 18; //offset of thumb-button angle

//test for round bevels on an angle
*hull() {
    cylinder(r=20,h=10);
    
    for(i=[0:$fn-1]) translate([(20-4)*cos(360/$fn*i),(20-4)*sin(360/$fn*i),10+20+(20-4)*cos(360/$fn*i)*tan(30)]) sphere(r=4);
}

//translate([0,45,0]) rotate([90,0,0])
difference() {
    union() {
        *hull() {
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
            for(i=[0:($fn/4)-1]) translate([(32-r4)*cos(180-i/$fn*360),(32-r4)*sin(180-i/$fn*360),90-r4+min(0,((32-r4)*cos(180-i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            for(i=[0:($fn/4)-1]) translate([(32-r4)*cos(180-i/$fn*360),a_o+(32-r4)*sin(180-i/$fn*360),90-r4+min(0,((32-r4)*cos(180-i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                
            
            
            translate([0,12,0]) cylinder(r=12-b5,h=90-a_h);
            translate([0,12,b5]) cylinder(r=12,h=90-b5-a_h);
            for(i=[0:$fn-1]) translate([(12-r4)*cos(i/$fn*360),12+(12-r4)*sin(i/$fn*360),90-r4+min(0,((12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            
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
            for(i=[0:$fn-1]) translate([(12-r4)*cos(i/$fn*360),32-12+(12-r4)*sin(i/$fn*360),90-r4+min(0,((12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
                
            for(i=[0:$fn-1]) translate([(12-r4)*cos(i/$fn*360),32-12+a_o+(12-r4)*sin(i/$fn*360),90-r4+min(0,((12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            
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
            for(i=[0:$fn-1]) translate([-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360),(32-12)*sin(30)-25+(12-r4)*sin(i/$fn*360),90-r4+min(0,(-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360)+ba_o)+tan(45))]) sphere(r=r4);
            for(i=[0:$fn-1]) translate([-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360),(32-12)*sin(30)-25+a_o+(12-r4)*sin(i/$fn*360),90-r4+min(0,(-(32-12)*cos(30)-25*tan(30)+(12-r4)*cos(i/$fn*360)+ba_o)*tan(45))]) sphere(r=r4);
            
            
            ba_a2 = atan((-(32-12)*cos(30)-25*tan(30))/(12-(32-12)*sin(30)-25-12));
            
            translate([(32-r4)*cos(90+asin(ba_o/(32-r4))),a_o+(32-r4)*sin(90+asin(ba_o/(32-r4))),90-r4]) sphere(r=r4);
            translate([-ba_o,12-ba_o/tan(90-ba_a2)-(12-r4)/sin(90-ba_a2),90-r4]) sphere(r=r4);
        }
        
        import("/Users/tsnoad/Things/ksp_controller/thrust_controller_v2.stl");

        
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

*translate([0,-75,0]) import("/Users/tsnoad/Things/ksp_controller/thrust_controller.stl");



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