module fdai_yaw_equator() rotate([0,0,90]) union() {
    difference() {
        union() {
            difference() {
                union() {
                    difference() {
                        sphere(r=60,$fn=$fn*2);
                        translate([0,0,-25]) cylinder(r=(60-4)*cos(22.5),h=50);
                    }
                    hull() {
                        mirror([0,1,0]) {
                            translate([0,0,-25]) cylinder(r=10,h=50);
                            translate([0,22.9,-25]) cylinder(r=12.5+0.5+2.4+2,h=50);
                        }
                        
                        
                        translate([8,29-8,-25]) cylinder(r=7.5,h=50);
                        translate([-8,29-8,-25]) cylinder(r=7.5,h=50);
                    }
                    
                    translate([-10,-sqrt(pow(60-2,2)-pow(10,2)),-25]) cube([20,2*sqrt(pow(60-2,2)-pow(10,2)),50]);
                    
                    mirror([0,1,0]) translate([-(12.5+0.5+2.4+2),22.9,-25]) cube([2*(12.5+0.5+2.4+2),sqrt(pow(60-2,2)-pow(10,2))-22.9,50]);
                    
                    translate([0,60+2,0]) rotate([90,0,0]) cylinder(r=8,h=2*(60+2));
            
                    //sensor
                    hull() {
                        translate([0,29+8+8,-25]) cylinder(r=7.5,h=50);
                        translate([0,29+8+8,-25]) cylinder(r=7.5,h=50);
                        
                        translate([8,29+8,-25]) cylinder(r=7.5,h=50);
                        translate([-8,29+8,-25]) cylinder(r=7.5,h=50);
                        
                        translate([8,29-8,-25]) cylinder(r=7.5,h=50);
                        translate([-8,29-8,-25]) cylinder(r=7.5,h=50);
                    }
                }
        
                //cutout above and below the equator
                translate([-100,-100,5]) cube([200,200,100]);
                translate([-100,-100,-100-5]) cube([200,200,100]);
            }
    
            //sensor
            translate([0,29,0]) hull() for(ixm=[0,1]) mirror([ixm,0,0]) for(iym=[0,1]) mirror([0,iym,0]) {
                translate([8,8,-5]) cylinder(r=7.5-1.5,h=10+8+1);
                translate([8,8,-5]) cylinder(r=7.5,h=10+8+1-1.5);
            }
        }
        
        difference() {
            for(i=[45,90,135,225,270,315]) rotate([0,0,i]) {
                hull() {
                    start_a = 90-asin((5)/60)+asin((2*m_wh)/60);
                    end_a = 90+asin((5)/60)-asin((2*m_wh)/60);
            
                    rotate([start_a,0,0]) cylinder(r=m_wh,h=100);
                    rotate([end_a,0,0]) cylinder(r=m_wh,h=100);
                }
            }
            sphere(r=60-m_wh);
        }
        
        translate([0,0,-25]) cylinder(r=m4_v_r+1,h=50);
        
        //cutout for thrust bearing
        for(i=[0,1]) mirror([0,0,i]) translate([0,0,5+1-4]) {
            cylinder(r=5+0.25,h=50);
            hull() {
                translate([0,0,1]) cylinder(r=5+0.25,h=50);
                translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
            }
            intersection() {
                translate([0,0,-0.2]) cylinder(r=(5+0.25)/cos(30),h=50,$fn=3);
                translate([0,0,-1]) cylinder(r=5+0.25,h=50);
            }
            rotate([0,0,30]) translate([0,0,-0.4]) cylinder(r=(m4_v_r+1)/cos(30),h=50,$fn=6);
        }
        
        //cutout for pitch pivot bolt
        translate([0,60-6,0]) for(i=[0,1]) mirror([0,0,i]) m4_endnut_b_co();
        translate([0,60-6-10-4,0]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=100);
            translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,100]);
        }
        
        //cable routing and slipring interface
        translate([0,-100,0]) rotate([-90,0,0]) hull() {
            cylinder(r=(2.5+0.25),h=100-60+14);
            translate([-(2.5+0.25)*tan(22.5),-(2.5+0.25),0]) cube([2*(2.5+0.25)*tan(22.5),2*(2.5+0.25),100-60+14]);
        }
        hull() for(i=[-60+12,-60+16]) translate([0,i,0]) {
            cylinder(r=(2.5+0.25),h=20);
            sphere(r=(2.5+0.25));
            translate([0,0,-(2.5+0.25)]) cylinder(r=(2.5+0.25)*tan(22.5),h=20+(2.5+0.25));
        }
        
        //cutout for motor body?
        rotate([0,0,180]) translate([0,22.9,-5-1]) cylinder(r=12.5+0.5,h=1+5+24);
        
        //cutout for sensor axis
        mirror([0,0,1]) translate([0,29,5-4-8-2]) {
            cylinder(r=5+0.25,h=50);
            hull() {
                translate([0,0,1]) cylinder(r=5+0.25,h=50);
                translate([0,0,1+((7+0.5)-(5+0.25))]) cylinder(r=7+0.5,h=50);
            }
            intersection() {
                translate([0,0,-0.2]) cylinder(r=(5+0.25)/cos(30),h=50,$fn=3);
                translate([0,0,-1]) cylinder(r=5+0.25,h=50);
            }
            rotate([0,0,30]) translate([0,0,-0.4]) cylinder(r=(m4_v_r+1)/cos(30),h=50,$fn=6);
        }
        
        translate([0,29,-25]) cylinder(r=m4_v_r+1,h=50);
        translate([0,29,5+8]) cylinder(r=5+0.25,h=50);
        
        translate([0,29,0]) for(ixm=[0,1]) mirror([ixm,0,0]) for(iym=[0,1]) mirror([0,iym,0]) {
            translate([8,8,-25]) cylinder(r=m3_v_r,h=50);
            translate([8,8,-5+1]) cylinder(r=3,h=50);
        }
    }
     
    //motor housing
    rotate([0,0,180]) translate([0,22.9,-5]) difference() {
        union() {
            hull() {
                cylinder(r=12.5+0.5+2.4,h=5+22.5+1.6-1);
                cylinder(r=12.5+0.5+2.4-1,h=5+22.5+1.6);
            }
            hull() {
                cylinder(r=12.5+0.5+2.4+2,h=10);
                cylinder(r=12.5+0.5+2.4,h=10+2);
            }
        }
        
        translate([0,0,-1]) cylinder(r=12.5+0.5,h=1+5+22.5);
        
        translate([-25,-50-(12.5+0.5+0.8),0]) cube([50,50,50]);
        
        rotate([0,0,30]) {
            translate([0,0,1]) cylinder(r=3.5+0.5,h=100);
            
            translate([10,0,-1]) cylinder(r=1.5+0.15,h=100);
            translate([-10,0,-1]) cylinder(r=1.5+0.15,h=100);
            
            translate([-sqrt(pow(12.5+0.5,2)-pow(3.5+0.5,2)),-(3.5+0.5),-1]) cube([2*sqrt(pow(12.5+0.5,2)-pow(3.5+0.5,2)),2*(3.5+0.5),1+5+22.5+0.2]);
            translate([-(3.5+0.5),-(3.5+0.5),-1]) cube([2*(3.5+0.5),2*(3.5+0.5),1+5+22.5+0.4]);
            
            translate([-(1.5+0.15)+10,-(3.5+0.5),-1]) cube([2*(1.5+0.15),2*(3.5+0.5),1+5+22.5+0.4]);
            translate([-(1.5+0.15)-10,-(3.5+0.5),-1]) cube([2*(1.5+0.15),2*(3.5+0.5),1+5+22.5+0.4]);
        }
    }
}

//yaw motor
module fdai_yaw_motor() rotate([0,0,90]) translate([0,-22.9,22.5]) motor();

module fdai_yaw_drive_belt() rotate([0,0,90]) translate([0,0,22.5+7-2+(14-7-1.5)+0.5]) difference() {
    //102 teeth
    hull() {
        translate([0,-22.9,0]) cylinder(r=10.2/2+1,h=6);
        translate([0,0,0]) cylinder(r=24.2/2+1,h=6);
    }
    hull() {
        translate([0,-22.9,-1]) cylinder(r=10.2/2,h=6+2);
        translate([0,0,-1]) cylinder(r=24.2/2,h=6+2);
    }
}

module fdai_yaw_sensor_belt() rotate([0,0,90]) translate([0,0,5+8+4+9/2-3]) difference() {
    //102 teeth
    hull() {
        translate([0,29,0]) cylinder(r=14/2+1,h=6);
        translate([0,0,0]) cylinder(r=14/2+1,h=6);
    }
    hull() {
        translate([0,29,-1]) cylinder(r=14/2,h=6+2);
        translate([0,0,-1]) cylinder(r=14/2,h=6+2);
    }
}

module fdai_yaw_sensor_bearings() rotate([0,0,90]) translate([0,29,0]) {
    difference() {
        union() {
            translate([0,0,5+8]) cylinder(r=10/2,h=4);
            translate([0,0,5]) cylinder(r=10/2,h=4);
        }
        translate([0,0,-1]) cylinder(r=2,h=100);
    }
}

module fdai_yaw_magnetholder() rotate([0,0,90]) translate([0,29,0]) difference() {
    translate([0,0,5-18]) cylinder(r=7,h=18);
    translate([0,0,5+8-4-4-2]) mirror([0,0,1]) m4_co(25,false,0,17.5);
    
    translate([0,0,5-18+5]) hull() {
        rotate([90,0,0]) translate([0,0,-(2+0.25)/2]) cylinder(r=5+0.25,h=2+0.25);
        translate([0,0,-5]) rotate([90,0,0]) translate([0,0,-(2+0.25)/2]) cylinder(r=5+0.25,h=2+0.25);
    }
    
    //translate([0,-100,-50]) cube([100,200,100]);
}

module fdai_yaw_sensor_mount() rotate([0,0,90]) translate([0,29,0]) difference() {
    union() {
        hull() for(ixm=[0,1]) mirror([ixm,0,0]) for(iym=[0,1]) mirror([0,iym,0]) {
            translate([8,8,-5-1.6]) cylinder(r=m3_v_r+1.6,h=1.6);
        }
        for(ixm=[0,1]) mirror([ixm,0,0]) for(iym=[0,1]) mirror([0,iym,0]) difference() {
            translate([8,8,5-18-1.6-1.25]) cylinder(r=m3_v_r+1.6,h=-10+18+1.6+1.25);
        }
    }
    translate([0,0,-50]) cylinder(r=8*sqrt(2)-(m3_v_r+1.6),h=50);
    
    for(ixm=[0,1]) mirror([ixm,0,0]) for(iym=[0,1]) mirror([0,iym,0]) difference() {
        translate([8,8,-5-20-1]) cylinder(r=m3_v_r,h=50);
    }
}

module fdai_yaw_sensor_pulley() rotate([0,0,90]) difference() {
    translate([0,29,5+8+4+9/2]) {
        teeth = 22;
        pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
        pulley_t_ht = (60-4)*cos(22.5)-(5+1)+1;
        
        tooth_depth = 0.764;
        tooth_width = 1.494;
        additional_tooth_width = 0.2;
        
        tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
        tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
        tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth);
        
        for(i=[0,1]) mirror([0,0,i]) translate([0,0,-(6+1)/2-1]) hull() {
            cylinder(r=pulley_OD/2+0.5,h=0.5);
            cylinder(r=pulley_OD/2,h=1);
        }
        
        difference() {
            union() hull() {
                translate([0,0,-(6+1)/2-1]) rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=(6+1)+2, $fn=teeth*4);
            }
    
            for(i=[1:teeth]) rotate([0,0,i*(360/teeth)]) translate([0,-tooth_distance_from_centre,pulley_b_ht -5]) scale ([ tooth_width_scale , tooth_depth_scale , 1 ])  {
                linear_extrude(height=pulley_t_ht+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
            }
        }
    }
    translate([0,29,5+8-4-4-2]) mirror([0,0,1]) m4_co(25,false,0,17.5);
}