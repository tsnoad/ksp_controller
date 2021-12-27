$fn=16;

br = 72;
brh = br/2;

expl = 0;

m4_v_r = 2+0.125; // radius for M4 cutouts (vertical to buildplate)
m4_h_r = 2+0.0625; // radius for M4 cutouts (horizontal to buildplate)
m4n_v_r = 3.5+0.125; // radius for M4 nut cutouts (horizontal to buildplate)
m4n_h_r = 3.5+0.0625; // radius for M4 nut cutouts (horizontal to buildplate)

m3_v_r = 1.5+0.125; // radius for M3 cutouts (vertical to buildplate)
m3n_v_r = 2.75+0.125; // radius for M3 nut cutouts (vertical to buildplate)

*piv_in();
*piv_out();

*trans_box_lid();

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

module att_box_frame() {
    difference() {
        box_frame(60,60,60,60+40+5,64);
        
        //pivot main cavity co
        translate([0,0,6.85+10]) {
            hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                translate([(brh-2.5),(brh+8+8-2.5),0]) cylinder(r=2.5,h=100);
            }
            for(i=[0,1]) mirror([0,i,0]) hull() for(j=[0,1]) mirror([j,0,0]) {
                translate([(brh-2.5),(brh+8+8-2.5),0]) cylinder(r=2.5,h=100);
                translate([(brh+10-2.5),(20+20-2.5),0]) cylinder(r=2.5,h=100);
                translate([(brh+10-2.5),(20+2.5),0]) cylinder(r=2.5,h=100);
                translate([(brh-2.5),(20-10+2.5),0]) cylinder(r=2.5,h=100);
            }
            //bevels
            for(i=[0,1]) mirror([0,i,0]) for(j=[0,1]) mirror([j,0,0]) {
                translate([(brh),(20-10+2.5-2.5*tan(22.5)),0]) mirror([1,0,0]) bevel_co45(r=2.5);
            }
        }
        
        //central cutout
        hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([(20-2.5),(20-2.5),-1]) cylinder(r=2.5,h=100);
        }
        
        //bearing clearance co
        intersection() {
            translate([0,0,64-16]) rotate([0,0,90]) {
                translate([0,brh,0]) sep_co(8+12);
                translate([0,-brh,0]) sep_co(8+12);
            }
            translate([-100,-100,10+6.85]) cube([200,200,100]);
        }
        
        //pivot bolt co
        translate([0,0,64-16]) { 
            for(i=[0,1]) mirror([i,0,0]) translate([brh+8,0,0]) rotate([0,90,0]) hull() {
                cylinder(r=5+0.25,h=50);
                rotate([0,0,90]) translate([-(5+0.25)*tan(22.5),-(5+0.25),0]) cube([2*(5+0.25)*tan(22.5),2*(5+0.25),50]);
            }
            for(i=[1,3]) rotate([0,0,i*90]) {
                translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                    cylinder(r=2+0.25,h=50);
                    translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),50]);
                }
            }
        }
        
        //front bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            for(j=[0,1]) mirror([0,j,0]) {
                translate([(60-7.5),12.5,0]) front_nut_co();
            }
            translate([(60-7.5),-(60-7.5),0]) front_nut_co();
        }
        
        //switch cavity co
        hull() for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-15-2.5),-(60+20-20+2.5),-1]) cylinder(r=2.5,h=100);
            translate([(60-5-2.5),-(60+20-10+2.5),-1]) cylinder(r=2.5,h=100);
            
            translate([(60-5-2.5),-(60+20+5-2.5),-1]) cylinder(r=2.5,h=100);
            translate([(60-20-2.5),-(60+20+20-2.5),-1]) cylinder(r=2.5,h=100);
        }
        
        //spring cavity co
        for(i=[0:3]) rotate([0,0,i*90]) {
            translate([30,0,-1]) cylinder(r=m3_v_r,h=50);
            translate([30,0,-50+5-2]) intersection() {
                cylinder(r=2.5+0.5,h=50);
                union() {
                    translate([-m3_v_r,-10,0]) cube([2*m3_v_r,20,50]);
                    translate([-10,-10,0]) cube([20,20,50-0.2]);
                }
            }
            
            /*difference() {
                translate([0,0,5+5]) rotate([0,90,0]) cylinder(r=3.75,h=30-(m3_v_r+1.6));
                //translate([30,0,-1]) cylinder(r=m3_v_r+1.6,h=50);
            }*/
            
            /*rotate([0,0,45]) {
                translate([50,0,-1]) cylinder(r=m3_v_r,h=50);
                hull() {
                    translate([0,0,5]) cylinder(r=5,h=50);
                    translate([0,5*sqrt(2),5]) cylinder(r=5,h=50);
                    translate([0,-5*sqrt(2),5]) cylinder(r=5,h=50);
                    
                    translate([50,0,5]) cylinder(r=5,h=50);
                    *translate([50-(m3_v_r+1.6)-1.25,5-1.25,5]) cylinder(r=1.25,h=50);
                    *translate([50-(m3_v_r+1.6)-1.25,-(5-1.25),5]) cylinder(r=1.25,h=50);
                }
                *hull() {
                    translate([0,0,5+5]) cylinder(r=5,h=50);
                    translate([50,0,5+5]) cylinder(r=5,h=50);
                }
            }*/
            
            for(j=[0,1]) mirror([0,j,0]) translate([-20,-5,5]) bevel_co(2.5);
            
            hull() {
                translate([0,0,5]) cylinder(r=5,h=50);
                translate([30-(m3_v_r+1.6)-1.25,5-1.25,5]) cylinder(r=1.25,h=50);
                translate([30-(m3_v_r+1.6)-1.25,-(5-1.25),5]) cylinder(r=1.25,h=50);
            }
            hull() {
                translate([0,0,5+2.5]) cylinder(r=5,h=50);
                translate([30,0,5+2.5]) cylinder(r=5,h=50);
            }
        }
        
        //ms bolt co
        ms_spacing() ms_co_spacing() {
            translate([0,0,-1]) cylinder(r=m3_v_r,h=50);
            translate([0,0,-50+10+6.85-2]) intersection() {
                cylinder(r=2.5+0.5,h=50);
                union() {
                    translate([-m3_v_r,-10,0]) cube([2*m3_v_r,20,50]);
                    translate([-10,-10,0]) cube([20,20,50-0.2]);
                }
            }
        }
        for(i=[0,1]) mirror([i,0,0]) {
            for(j=[0,1]) mirror([0,j,0]) {
                translate([25,0,10+6.85+6]) rotate([90,0,0]) hull() {
                    cylinder(r=6,h=100);
                    translate([-6*tan(22.5),-6,0]) cube([2*6*tan(22.5),2*6,100]);
                }
            }
            translate([25,-100,10+6]) rotate([90,0,0]) hull() {
                cylinder(r=6,h=100);
                translate([-6*tan(22.5),-6,0]) cube([2*6*tan(22.5),2*6,100]);
            }
        }
    }
}

module front_nut_co() {
        translate([0,0,-1]) {
        cylinder(r=m4_v_r,h=100);
        difference() {
            hull() translate([0,0,0]) for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=1+64-10);
                
            for(j=[0,1]) mirror([j,0,0]) translate([m4_v_r,-10,1+64-10-0.2]) cube([20,20,20]);
        }
        
        difference() {
            cylinder(r=(m4n_v_r+1)/cos(30),h=1+64-15);
            rotate([0,0,30+60]) for(j=[0,1]) mirror([j,0,0]) translate([m4n_v_r,-10,1+64-15-0.4]) cube([20,20,20]);
            rotate([0,0,30]) for(j=[0,1]) mirror([j,0,0]) translate([m4n_v_r,-10,1+64-15-0.2]) cube([20,20,20]);
        }
    }
}

module att_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
        //central co
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(25-2.5),(25-2.5),-1]) cylinder(r=2.5,h=50);
        }
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(25-2.5),(25-2.5),2.5]) cylinder(r=2.5,h=50);
            translate([(25-2.5),(25-2.5),5]) cylinder(r=5,h=50);
        }
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(60-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            
            for(j=[12.5,-12.5,-(60-7.5)]) {
                translate([(60-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
        }
        
        for(i=[-1:1]) {
            translate([i*30,-60-15,0]) switch_recess();
            translate([i*30,-60-15,2.5]) switch_co();
        }
    }

    for(i=[-1:2]) {
        translate([i*30-15,-60-15,0]) switch_guard();
    }
}

module cw_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(60-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
        }
        
        hull() for(i=[-2,2]) for(j=[-2.5,2.5]) {
            translate([(24+1.6)*i-1.6/2*i/abs(i),-(40+5)/2+(18+2.4)*j-2.4/2*j/abs(j),2.5+1.25]) cylinder(r1=0,r2=5,h=5);
        }
        
        for(i=[-1.5:1.5]) for(j=[-2:2]) {
            translate([(24+1.6)*i,-(40+5)/2+(18+2.4)*j,-1]) cylinder(r=8,h=20);
            translate([(24+1.6)*i-24/2,-(40+5)/2+(18+2.4)*j-18/2,2.5]) cube([24,18,20]);
        }
    }
}

module box_lid_bolt_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+2.5]) cylinder(r=7.5,h=10-2.5);
            
            translate([10,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([10,0,2.5+2.5]) cylinder(r=7.5,h=10-2.5);
        }
        difference() {
            translate([5,-7.5,2.5]) cube([12.5,15,10]);
            for(i=[0,1]) mirror([0,i,0]) hull() {
                translate([5,-7.5,0]) cylinder(r=2.5,h=2.5);
                translate([5,-7.5,2.5]) cylinder(r1=2.5,r2=0,h=2.5);
            }
        }
    }
}

module box_lid_bolt_c_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+2.5]) cylinder(r=7.5,h=10-2.5);
            
            for(i=[0,1]) rotate([0,0,i*90]) {
                translate([10,0,2.5]) cylinder(r=7.5-2.5,h=10);
                translate([10,0,2.5+2.5]) cylinder(r=7.5,h=10-2.5);
            }
        }
        for(i=[0,1]) rotate([0,0,i*90]) difference() {
            translate([5,-7.5,2.5]) cube([12.5,15,10]);
            for(i=[0,1]) mirror([0,i,0]) hull() {
                translate([5,-7.5,0]) cylinder(r=2.5,h=2.5);
                translate([5,-7.5,2.5]) cylinder(r1=2.5,r2=0,h=2.5);
            }
        }
    }
}

module trans_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
        //central co
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(30-2.5),(30-2.5),-1]) cylinder(r=2.5,h=50);
        }
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(30-2.5),(30-2.5),2.5]) cylinder(r=2.5,h=50);
            translate([(30-2.5),(30-2.5),5]) cylinder(r=5,h=50);
        }
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(60-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            
            for(j=[12.5,-12.5,-(60-7.5)]) {
                translate([(60-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
        }
        
        for(i=[-1:0]) {
            translate([i*30,-60-15,0]) switch_recess();
            translate([i*30,-60-15,2.5]) switch_co();
        }
    }
    
    ag_or = 60-7.5-7.5-1.25-2.5;
    ag_h = 30;
    
    //actuator guard
    for(i=[0:3]) rotate([0,0,i*90]) {
        //horiz ribs
        hull() for(j=[0,1]) mirror([0,j,0]) translate([ag_or,ag_or-15,ag_h]) {
            translate([0,0,0]) cylinder(r=2.5/2,h=10);
            translate([0,0,2.5]) cylinder(r=7.5/2,h=5);
        }
        //base ribs
        hull() for(j=[0,1]) mirror([0,j,0]) translate([ag_or,ag_or-15,0]) {
            translate([0,0,0]) cylinder(r=7.5/2,h=5);
            translate([0,0,0]) cylinder(r=2.5/2,h=7.5);
        }
        //wall
        hull() for(j=[0,1]) mirror([0,j,0]) translate([ag_or,ag_or-15,0]) {
            translate([0,0,0]) cylinder(r=2.5/2,h=ag_h);
        }
        
        //corner ribs
        translate([ag_or-15,ag_or-15,0]) intersection() {
            union() {
                rotate_extrude() hull() {
                    translate([15-7.5/2,ag_h+2.5]) square([7.5,5]);
                    translate([15-2.5/2,ag_h]) square([2.5,10]);
                }
                rotate_extrude() hull() {
                    translate([15-2.5/2,0]) square([2.5,7.5]);
                    translate([15-7.5/2,0]) square([7.5,5]);
                }
                rotate_extrude() {
                    translate([15-2.5/2,0]) square([2.5,ag_h]);
                }
            }
            translate([0,0,-50]) cube([50,50,150]);
        }
    }
    
    //vertical ribs
    for(i=[0,2]) rotate([0,0,i*90]) {
        for(j=[0,1]) mirror([0,j,0]) {
            translate([ag_or,ag_or-15-7.5,0]) difference() {
                translate([-7.5/2,-15/2,0]) cube([7.5,15,ag_h+7.5/2]);
                for(m=[0,1]) mirror([m,0,0]) for(k=[0,1]) mirror([0,k,0]) hull() {
                    for(l=[7+2.5,ag_h-2.5]) {
                        translate([2.5/2,15/2,l]) rotate([0,90,0]) cylinder(r=2.5,h=20);
                        translate([7.5/2,15/2,l]) rotate([0,90,0]) cylinder(r=5,h=20);
                    }
                }
            }
        }
    }

    for(i=[-1:1]) {
        translate([i*30-15,-60-15,0]) switch_guard();
    }
}


module switch_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(60-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            
            *for(j=[12.5,-12.5,-(60-7.5)]) {
                translate([(60-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
        }
        
        for(j=[-60-15+0,-60-15+35,-60-15+70,-60-15+105]) for(i=[-1:1]) {
            translate([i*30,j,0]) switch_recess();
            translate([i*30,j,2.5]) switch_co();
        }
    }

    for(j=[-60-15+0,-60-15+35,-60-15+70,-60-15+105]) for(i=[-1:2]) {
        translate([i*30-15,j,0]) switch_guard();
    }
}



module box_frame(x_p=60,x_n=60,y_p=60,y_n=60,z_h=48) difference() {
    hull() {
        translate([(x_p-5),(y_p-5),0]) cylinder(r=5,h=z_h);
        translate([-(x_n-5),(y_p-5),0]) cylinder(r=5,h=z_h);
        translate([(x_p-5),-(y_n-5),0]) cylinder(r=5,h=z_h);
        translate([-(x_n-5),-(y_n-5),0]) cylinder(r=5,h=z_h);
    }
    
    translate([(x_p-7.5),(y_p-7.5),0]) front_nut_co();
    translate([-(x_n-7.5),(y_p-7.5),0]) front_nut_co();
    translate([(x_p-7.5),-(y_n-7.5),0]) front_nut_co();
    translate([-(x_n-7.5),-(y_n-7.5),0]) front_nut_co();
    
    *hull() for(i=[0,1]) mirror([0,i,0]) {
        translate([(50+40+30-5),(60-5),-1]) cylinder(r=0.05,h=z_h+2);
        translate([-(50-5),(60-5),-1]) cylinder(r=0.05,h=z_h+2);
    }
}


module box_lid(x_p=60,x_n=60,y_p=60,y_n=60) {
    hull() {
        translate([(x_p-5),(y_p-5),0]) cylinder(r=2.5,h=5);
        translate([-(x_n-5),(y_p-5),0]) cylinder(r=2.5,h=5);
        translate([(x_p-5),-(y_n-5),0]) cylinder(r=2.5,h=5);
        translate([-(x_n-5),-(y_n-5),0]) cylinder(r=2.5,h=5);
        
        translate([(x_p-5),(y_p-5),0]) cylinder(r=5,h=2.5);
        translate([-(x_n-5),(y_p-5),0]) cylinder(r=5,h=2.5);
        translate([(x_p-5),-(y_n-5),0]) cylinder(r=5,h=2.5);
        translate([-(x_n-5),-(y_n-5),0]) cylinder(r=5,h=2.5);
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

module switch_recess() {
    hull() {
        translate([+15-7.5+1.25,7.5+1.25,5-2.5+0.05]) cylinder(r1=0,r2=2.5,h=2.5);
        translate([-15+7.5-1.25,7.5+1.25,5-2.5+0.05]) cylinder(r1=0,r2=2.5,h=2.5);
        translate([+15-7.5+1.25,-7.5-1.25,5-2.5+0.05]) cylinder(r1=0,r2=2.5,h=2.5);
        translate([-15+7.5-1.25,-7.5-1.25,5-2.5+0.05]) cylinder(r1=0,r2=2.5,h=2.5);
    }
}

module switch_guard() {
    for(j=[0,1]) mirror([0,j,0]) hull() for(i=[0,1]) mirror([i,0,0]) {
        translate([1.25,7.5+5,5-2.5-0.05]) cylinder(r1=1.25+2.5,r2=0,h=1.25+2.5);
        translate([2.5,7.5+5-1.25,5-2.5-0.05]) cylinder(r1=1.25+2.5,r2=0,h=1.25+2.5);
        translate([2.5,7.5,5-2.5-0.05]) cylinder(r1=1.25+2.5,r2=0,h=1.25+2.5);
        translate([1.25,7.5-1.25,5-2.5-0.05]) cylinder(r1=1.25+2.5,r2=0,h=1.25+2.5);
    }
    
    hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
        translate([1.25,7.5-1.25,5-2.5-0.05]) cylinder(r1=1.25+2.5,r2=0,h=1.25+2.5);
    }
    
    difference() {
        hull() {
            translate([-2.5,7.5,5]) rotate([0,90,0]) cylinder(r=5-1.25,h=5);
            translate([-2.5,-7.5,5]) rotate([0,90,0]) cylinder(r=5-1.25,h=5);
            translate([-2.5,7.5,5+12.5]) rotate([0,90,0]) cylinder(r=5-1.25,h=5);
            translate([-2.5,-7.5,5+12.5]) rotate([0,90,0]) cylinder(r=5-1.25,h=5);
            
            translate([-2.5+1.25,7.5,5]) rotate([0,90,0]) cylinder(r=5,h=5-2.5);
            translate([-2.5+1.25,-7.5,5]) rotate([0,90,0]) cylinder(r=5,h=5-2.5);
            translate([-2.5+1.25,7.5,5+12.5]) rotate([0,90,0]) cylinder(r=5,h=5-2.5);
            translate([-2.5+1.25,-7.5,5+12.5]) rotate([0,90,0]) cylinder(r=5,h=5-2.5);
        }
        hull() {
            translate([2.5-1.25+0.05,0,5+12.5-7.5]) rotate([0,90,0]) cylinder(r1=7.5-1.25,r2=7.5,h=1.25+0.05);
            translate([2.5-1.25+0.05,0,5]) rotate([0,90,0]) cylinder(r1=7.5-1.25,r2=7.5,h=1.25+0.05);
        }
        
        mirror([1,0,0]) hull() {
            translate([2.5-1.25+0.05,0,5+12.5-7.5]) rotate([0,90,0]) cylinder(r1=7.5-1.25,r2=7.5,h=1.25+0.05);
            translate([2.5-1.25+0.05,0,5]) rotate([0,90,0]) cylinder(r1=7.5-1.25,r2=7.5,h=1.25+0.05);
        }
    }
}

module sep_co(r1=8) {
    w1 = 0.5;
    w2 = 0.5+0.5;
    
    rotate([90,0,0]) {
        hull() {
            translate([0,0,-w2/2]) cylinder(r=5,h=w2);
            cylinder(r=5+w2/2,h=0.01);
            
            translate([0,8,-w2/2]) cylinder(r=5,h=w2);
            translate([0,8,0]) cylinder(r=5+w2/2,h=0.01);
        }
        
        hull() {
            translate([0,8,-w1/2]) cylinder(r=r1,h=w1);
            translate([0,-8,-w1/2]) cylinder(r=r1,h=w1);
        }
    }
}


module piv_out() difference() {
    hull() {
        rotate([90,0,0]) translate([0,0,-brh-8]) cylinder(r=8+12,h=br+16);
        rotate([0,90,0]) translate([0,0,-brh]) cylinder(r=8+12,h=br);
    }
    
    hull() for(i=[-8,8]) translate([0,0,i]) {
            rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4+2,h=br);
            rotate([90,0,0]) translate([0,0,-brh+16]) cylinder(r=8+4+6+2,h=br-32);
    }
    
    translate([-50,-50,8]) cube([100,100,50]);
    translate([-50,-50,-50-8]) cube([100,100,50]);
    
    mirror([0,0,1]) {
        translate([0,brh,0]) sep_co(8+4+2);
        translate([0,-brh,0]) sep_co(8+4+2);
    }
    
    mirror([0,0,0]) rotate([0,0,90]) {
        translate([0,brh,0]) sep_co(8+12+2);
        translate([0,-brh,0]) sep_co(8+12+2);
    }
    
    for(i=[0:3]) rotate([0,0,i*90]) {
        translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=50);
            translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
        }
    }
    
    rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) {
        hull() {
            rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=5,h=2);
            translate([0,0,8]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=5,h=1.75);
        }
            
        hull() {
            translate([0,0,-1]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=m4n_h_r,h=9+5);
            translate([0,0,8]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=m4n_h_r,h=9+5);
        }
    }
        
    
}

module piv_in() {
    difference() {
        union() {
            //body
            difference() {
                hull() {
                    rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4,h=br);
                    rotate([90,0,0]) translate([0,0,-brh+16]) cylinder(r=8+4+6,h=br-32);
                }
                
                translate([-50,-50,8]) cube([100,100,50]);
                translate([-50,-50,-50-8]) cube([100,100,50]);
            }
            
            //actuator
            mirror([0,0,1]) {
                hull() for(i=[0:3]) rotate([0,0,i*90]) translate([8-2,8-2,0]) {
                    cylinder(r=2+2,h=8);
                    cylinder(r=2,h=8+2);
                }
                
                hull() {
                    for(i=[0:3]) rotate([0,0,i*90]) translate([8-2,8-2,0]) {
                        cylinder(r=2,h=8+30-4);
                        *cylinder(r=0.01,h=8+30);
                    }
                    cylinder(r=m3_v_r+2.4,h=8+30-2.5);
                }
            }
        }
        
        //spring nut co
        *hull() {
            translate([0,0,-8-18+8]) cylinder(r=m3n_v_r,h=4);
            translate([20,0,-8-18+8]) cylinder(r=m3n_v_r,h=4);
        
            translate([0,0,-8-18+8]) cylinder(r=m3n_v_r-1,h=4+1);
            translate([20,0,-8-18+8]) cylinder(r=m3n_v_r-1,h=4+1);
        }
        mirror([0,0,1]) translate([0,0,-50])  cylinder(r=m3_v_r,h=100);
        
        hull() translate([0,0,-8]) for(i=[0:5]) rotate([0,0,i*60]) translate([2.75/cos(30),0,0]) cylinder(r=m3n_v_r-2.75,h=50);
            
        //spring co
        for(i=[0:3]) rotate([0,0,i*90]) mirror([0,0,1]) translate([0,0,8+30-2.5]) {
            hull() for(k=[0,1]) mirror([0,k,0]) {
                translate([m3_v_r+2.5+1.25,(2.5-1.25),-1.5]) cylinder(r=1.25,h=50);
                translate([50,(2.5-1.25)+50,-1.5-50*sqrt(2)*tan(0)]) cylinder(r=1.25,h=50);
            }
        }
        
        
        mirror([0,0,1]) {
            translate([0,brh,0]) sep_co(8+4+2);
            translate([0,-brh,0]) sep_co(8+4+2);
        }
        
        //pivot nut co
        mirror([0,0,1]) for(i=[0,1]) mirror([0,i,0]) {
            hull() {
                rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=5,h=2);
                translate([0,0,8]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=5,h=1.75);
            }
            
            hull() {
                translate([0,0,-1]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=m4n_h_r,h=9);
                translate([0,0,8]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=m4n_h_r,h=9);
                
                translate([0,0,-1]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=m4n_h_r-1,h=9+1);
                translate([0,0,8]) rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=m4n_h_r-1,h=9+1);
            }
        }
        for(i=[0,2]) rotate([0,0,i*90]) {
            translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                cylinder(r=m4_h_r,h=50);
                translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
            }
        }
        
        //handle nut co
        for(i=[0,2]) rotate([0,0,i*90]) {
            translate([0,-8-4,-8-1]) cylinder(r=m4_v_r,h=50);
            hull() translate([0,-8-4,-8-50+16-4]) for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50);
        }
        
    }
}



module screw() {
    translate([0,0,-25]) cylinder(r=2,h=25+4);
    cylinder(r=3.5,h=4);
}


module ms() translate([-27.7-8.8,20.8-10.4,-10.3/2]) {
    difference() {
        hull() {
            cylinder(r=2.75,h=10.3);
            translate([22.2,0,0]) cylinder(r=2.75,h=10.3);
            translate([0,10.4,0]) cylinder(r=2.75,h=10.3);
            translate([22.2,10.4,0]) cylinder(r=2.75,h=10.3);
        }
        translate([0,0,-1]) cylinder(r=1.5,h=20);
        translate([22.2,10.4,-1]) cylinder(r=1.5,h=20);
    }
    translate([8.8+1,-18.3+10.4,(10.3-5)/2]) rotate([0,0,-atan((20.8-18.3)/27.8)]) {
        cube([27.8-1,2,5]);
        translate([0,1,0]) cylinder(r=1,h=5);
        translate([27.7-1,1,0]) cylinder(r=1,h=5);
        translate([-1,1,0]) cube([2,10,5]);
    }
}

module ms_spacing() {
    for(i=[0:3]) rotate([0,0,i*90]) translate([2,-2,0]) translate([4,8,0]) children();
}

module ms_co_spacing() {
    translate([-27.7-8.8,20.8-10.4,0]) {
        translate([0,0,0]) children();
        translate([22.2,10.4,0]) children();
    }
}

module ms_co() translate([-27.7-8.8,20.8-10.4,-10.3/2]) {
    hull() {
        translate([0,0,-4]) cylinder(r=0.5,h=10.3+8);
        translate([0,0,-4+1]) cylinder(r=1.5,h=10.3+6);
    }
    translate([22.2,10.4,0]) hull() {
        translate([0,0,-4]) cylinder(r=0.5,h=10.3+8);
        translate([0,0,-4+1]) cylinder(r=1.5,h=10.3+6);
    }
}

module bevel_co(r=5) difference() {
    translate([-r,-r,0]) cube([r*2,r*2,100]);
    translate([-r,-r,-1]) cylinder(r=r,h=102);
}

module bevel_co45(r=5) difference() {
    translate([-(r-sqrt(pow(r,2)/2)),-r*tan(22.5),0]) cube([10,10,100]);
    translate([-r,-r*tan(22.5),-1]) cylinder(r=r,h=102);
}