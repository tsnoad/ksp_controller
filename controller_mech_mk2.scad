$fn=16;

expl = 0;

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

//attitude assembly
*union() {
    translate([0,0,48-16]) {
        rotate([0*atan((20.8-18.3)/20),0,0]) {
            *translate([0,0,expl*3]) piv_out();
            rotate([0,0*atan((20.8-18.3)/20),0]) {
                *translate([0,0,expl*5]) piv_in();
                *translate([0,0,expl*6]) difference() {
                    hull() {
                        translate([0,-6,8]) cylinder(r=12,h=35);
                        translate([0,6,8]) cylinder(r=12,h=35);
                    }
                    for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=m4_v_r,h=100);
                }
                *translate([0,0,expl*6]) translate([0,0,35]) import("/Users/tsnoad/Things/ksp_controller/attitude_controller.stl");
                //translate([0,0,expl*6]) translate([0,0,35]) import("/Users/tsnoad/Things/ksp_controller/translation_controller.stl");
    
            }
            *translate([0,0,expl*4]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
        }
        *translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    *translate([0,0,expl*1]) for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,6.85+5.15]) ms();
    translate([0,0,expl*6]) att_box_lid();
    intersection() {
        translate([0,0,expl*-2]) att_box_frame();
    }
}

//translation assembly
*translate([0,0,0]) {
    translate([0,0,48-16]) {
        rotate([1*atan((20.8-18.3)/20),0,0]) {
            *translate([0,0,expl*3]) piv_out();
            rotate([0,1*atan((20.8-18.3)/20),0]) {
                *translate([0,0,expl*5]) piv_in();
                *translate([0,0,expl*6]) difference() {
                    hull() {
                        translate([0,-6,8]) cylinder(r=12,h=35);
                        translate([0,6,8]) cylinder(r=12,h=35);
                    }
                    for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=2,h=100);
                }
                //translate([0,0,expl*6]) translate([0,0,35]) import("/Users/tsnoad/Things/ksp_controller/attitude_controller.stl");
                translate([0,0,expl*6]) translate([0,0,35]) import("/Users/tsnoad/Things/ksp_controller/translation_controller.stl");
    
            }
            *translate([0,0,expl*4]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
        }
        *translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    *translate([0,0,expl*1]) for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,6.85+5.15]) ms();
    
    
    translate([0,0,expl*6]) trans_box_lid();
    *translate([0,0,expl*-2]) att_box_frame();
}

*translate([0,0,0]) switch_box_lid();

//thrust assembly
*translate([0,0,0]) {
    translate([0,0,48-16]) {
        rotate([0*atan((20.8-18.3)/20),0,0]) {
            *translate([0,0,expl*3]) piv_out();
            rotate([0,0*atan((20.8-18.3)/20),0]) {
                *translate([0,0,expl*5]) piv_in();
                *translate([0,0,expl*6]) difference() {
                    hull() {
                        translate([0,-6,8]) cylinder(r=12,h=35);
                        translate([0,6,8]) cylinder(r=12,h=35);
                    }
                    for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=2,h=100);
                }
                //translate([0,0,expl*6]) translate([0,0,35]) import("/Users/tsnoad/Things/ksp_controller/attitude_controller.stl");
                translate([0,0,expl*6]) translate([-90+37.5,18,25+35]) rotate([90,0,0]) rotate([0,90,0]) import("/Users/tsnoad/Things/ksp_controller/thrust_controller_v2_asmb.stl");
    
            }
            *translate([0,0,expl*4]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
        }
        *translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    *translate([0,0,expl*1]) for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,6.85+5.15]) ms();
    
    
    translate([0,0,expl*6]) att_box_lid();
    *translate([0,0,expl*-2]) att_box_frame();
}

//CW assembly
translate([0,0,0]) {
    translate([0,0,expl*6]) cw_box_lid();
    *translate([0,0,expl*-2]) att_box_frame();
}



