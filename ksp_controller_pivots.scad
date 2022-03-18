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
            mirror([0,0,1]) intersection() {
                union() {
                    //actuator base fillet
                    hull() for(i=[0:3]) rotate([0,0,i*90]) translate([8-2,8-2,0]) {
                        cylinder(r=2+2,h=8);
                        cylinder(r=2,h=8+2);
                    }
                    
                    //actuator body
                    hull() for(i=[0:3]) rotate([0,0,i*90]) translate([8-2,8-2,0]) {
                        cylinder(r=2,h=26+8+4-2);
                        cylinder(r=0.01,h=26+8+4);
                    }
                }
                *translate([0,50,0]) rotate([90,0,0]) cylinder(r=26+8,h=100,$fn=$fn*4);
                *translate([-50,0,0]) rotate([0,90,0]) cylinder(r=26+8,h=100,$fn=$fn*4);
            }
        }
        
        mirror([0,0,1]) {
            translate([0,brh,0]) sep_co(8+4+2);
            translate([0,-brh,0]) sep_co(8+4+2);
        }
        
        //pivot nut co
        mirror([0,0,1]) for(i=[0,1]) mirror([0,i,0]) {
            translate([0,brh-8,0]) m4_endnut_b_co();
        }
        for(i=[0,2]) rotate([0,0,i*90]) {
            translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                cylinder(r=m4_h_r,h=50);
                translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
            }
        }
        
        //handle nut co
        for(i=[0,1]) mirror([0,i,0]) translate([0,8+4,8-6]) mirror([0,0,1]) m4_co(25, false, 0);
    }
}

module piv_in_thrust() {
    rotate([0,0,90]) difference() {
        union() {
            //body
            difference() {
                hull() {
                    rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4+4,h=br);
                    rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=8+4+12,h=br-16);
                }
                
                translate([-50,-50,8]) cube([100,100,50]);
                translate([-50,-50,-50-8]) cube([100,100,50]);
            }
            
            //actuator
            mirror([0,0,1]) intersection() {
                union() {
                    //actuator base fillet
                    hull() for(i=[0:3]) rotate([0,0,i*90]) translate([8-2,8-2,0]) {
                        cylinder(r=2+2,h=8);
                        cylinder(r=2,h=8+2);
                    }
                    
                    //actuator body
                    hull() for(i=[0:3]) rotate([0,0,i*90]) translate([8-2,8-2,0]) {
                        cylinder(r=2,h=26+8+4-2);
                        cylinder(r=0.01,h=26+8+4);
                    }
                }
                *translate([0,50,0]) rotate([90,0,0]) cylinder(r=26+8,h=100,$fn=$fn*4);
                *translate([-50,0,0]) rotate([0,90,0]) cylinder(r=26+8,h=100,$fn=$fn*4);
            }
        }
        
        mirror([0,0,1]) {
            mirror([0,0,1]) {
                translate([0,brh,0]) sep_co(8+4+4+2);
                translate([0,-brh,0]) sep_co(8+4+4+2);
            }
            
            //pivot nut co
            mirror([0,0,1]) for(i=[0,1]) mirror([0,i,0]) {
                translate([0,brh-8,0]) m4_endnut_b_co(9,true);
            }
            for(i=[0,2]) rotate([0,0,i*90]) {
                translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                    cylinder(r=m4_h_r,h=50);
                    translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
                }
            }
        }
        
        //bolt co to attach to cam actuator
        for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) translate([12,20,8]) m4_co(25, false, 8, 8);
        
        //handle nut co
        rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,8+4,8-6]) mirror([0,0,1]) m4_co(25, false, 0);
    }
}

module piv_out_camcent() union() {
    difference() {
        union() {
            difference() {
                union() {
                    hull() for(i=[0,8]) translate([0,0,i]) {
                        rotate([90,0,0]) translate([0,0,-brh-8+0.25]) cylinder(r=8+12,h=br+16-0.25);
                        rotate([90,0,0]) translate([0,0,-brh-8+0.25]) cylinder(r=(br-8)/2,h=(br+16)/2-0.25);
                        
                        rotate([0,90,0]) translate([0,0,-brh]) cylinder(r=8+12,h=br);
                    }
                }
            
                //cutout to prevent cam arm fouling
                hull() for(i=[0,1]) mirror([i,0,0]) {
                    translate([24-8-4,brh+8-2,4]) rotate([-90,0,0]) cylinder(r=4,h=50);
                    translate([24-8-4,brh+8-2,8]) rotate([-90,0,0]) cylinder(r=4,h=50);
                }
            }
            hull() {
                translate([0,0,0]) rotate([-90,0,0]) cylinder(r=4,h=brh+8-0.25);
                for(i=[0,1]) mirror([i,0,0]) translate([4,0,-4]) rotate([-90,0,0]) cylinder(r=4,h=brh+8-0.25);
            }
        }
        
        //central co
        hull() for(i=[-8,8]) translate([0,0,i]) {
                rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4+2,h=br);
                rotate([90,0,0]) translate([0,0,-brh+16]) cylinder(r=8+4+6+2,h=br-32);
        }
        
        //slice of top and bottom of barrel to make a flat section
        translate([-50,-50,8]) cube([100,100,50]);
        translate([-50,-50,-50-8]) cube([100,100,50]);
        
        //clearance for inner pivot
        mirror([0,0,1]) {
            translate([0,brh,0]) sep_co(8+4+2-0.25);
            translate([0,-brh,0]) sep_co(8+4+2-0.25);
        }
        
        //clearance for outer pivot
        mirror([0,0,0]) rotate([0,0,90]) {
            translate([0,brh,0]) sep_co(8+12+2);
            translate([0,-brh,0]) sep_co(8+12+2);
        }
        
        //pivot bolt cos
        for(i=[0:3]) rotate([0,0,i*90]) {
            translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                cylinder(r=m4_h_r,h=50);
                translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
            }
        }
        
        //cutout for pivot nuts
        rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,(brh-8),0]) m4_endnut_co();
        
        //bolt co to attach to cam actuator
        for(i=[0,1]) mirror([i,0,0]) for(j=[-(8+4),(8+8)]) translate([(brh-8),j,8]) m4_co(25, false, 8, 8, false, true);
    }
}

module camlever(mir=0,piv_w_exp=0,piv_exp=2) mirror([mir,0,0]) mirror([0,mir,0]) difference() {
    //piv_w_exp = 0; //0 for linear, 1 for exponential
    //piv_exp = 4; //exponent - higher for a more j-shaped displacement curve
    
    piv_w_exp = 0.5;
    piv_w_sin = 0;
    piv_exp = 2;
    
    cam_res = ($fn > 18 ? 0.5 : 1);
    cam_res = 0.25;
    
    bearing_r = 6.5+0.5;
    
    union() {
        hull() {
            translate([24,4-0.5,0]) rotate([90,0,0]) cylinder(r=8,h=8-1);
            translate([24,4-0.5,-32]) rotate([90,0,0]) cylinder(r=8,h=8-1);
        }
        //cam track positive
        hull() {
            translate([24,4-0.5,0]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);
            translate([-8+1,4-0.5,0]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);
            //translate([-8+1,4-0.5,4]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);

            translate([0,4-0.5,6]) {
                //for(def=[-10:cam_res:10]) {
                for(def=[-10,10]) {
                    piv_def = abs(pow(def,piv_exp)*(5*piv_w_exp)/pow(10,piv_exp)) + (5*piv_w_sin/2*(sin((def-5)*180/10)+1)) + abs(def*(1-piv_w_exp-piv_w_sin)/2);
                    piv_def_ang = asin(piv_def/32);
                    
                    translate([24,0,-(22-16)]) rotate([0,piv_def_ang,0]) translate([-24,0,(22-16)]) {
                        //rotate around the joystick pivot
                        translate([0,0,-22]) rotate([0,def,0]) translate([0,0,22]) {
                            translate([def/10*(bearing_r),0,-4]) {
                                rotate([90,0,0]) cylinder(r=4,h=4-0.5-0.25);
                            }
                        }
                    }
                }
            }
        }
        
        //fillet pos
        translate([24-8,4-0.5,-8]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);
    }
    
    //fillet co
    translate([24-16,-4-1,-16]) rotate([-90,0,0]) cylinder(r=8,h=50);
    
    //pivot bolt co
    translate([24,-4-1,0]) rotate([-90,0,0]) cylinder(r=m4_v_r,h=50);
    
    //spring bolt co
    mirror([0,mir,0]) translate([24,-4-1,-32]) rotate([-90,0,0]) {
        cylinder(r=m3_v_r,h=50);
        translate([0,0,-50+4+1]) {
            cylinder(r=2.5+0.5,h=50-0.4);
            translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
            translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
        }
    }

    //circular cam track
    *difference() {
        translate([-50,-4,0]) cube([50,20,50]);
        translate([0,-4-1,0]) rotate([-90,0,0]) cylinder(r=16,h=50);
    }
    *translate([0,-4-1,16+16]) rotate([-90,0,0]) cylinder(r=16,h=50);
    
    //linear cam track
    *translate([0,-4-1,6.5]) hull() {
        rotate([-90,0,0]) cylinder(r=6.5,h=50);
        for(i=[0,10]) translate([0,0,i]) {
            rotate([0,-atan(0.5),0]) translate([8,0,0]) rotate([-90,0,0]) cylinder(r=6.5,h=50);
            rotate([0,atan(0.5),0]) translate([-8,0,0]) rotate([-90,0,0]) cylinder(r=6.5,h=50);
        }
    }
    
    //optimal cam track
    *translate([0,-4-1,6.5]) hull() {
        for(i=[-12:(18/$fn):12]) {
            translate([i,0,(22-22*cos(asin(-i/22)))/(24+i)*100]) {
                rotate([-90,0,0]) cylinder(r=6.5,h=50);
            }
        }
    }
    
    translate([0,-4-1,6]) {
        for(def=[-10:cam_res:10-cam_res]) {
            //this is the deflection equation
            //notes about linear vs exponentional
            //what is the deflection in the x axis (at the spring) based on the deflection angle (of the joystick pivot)
            piv_def = abs(pow(def,piv_exp)*(5*piv_w_exp)/pow(10,piv_exp)) + (5*piv_w_sin/2*(sin((def-5)*180/10)+1)) + abs(def*(1-piv_w_exp-piv_w_sin)/2);
            //what is the deflection angle of the cam arm based on the linear deflection
            piv_def_ang = asin(piv_def/32);
            
            //do the same for the next increment of deflection angle
            def2 = def + cam_res;
            piv_def2 = abs(pow(def2,piv_exp)*(5*piv_w_exp)/pow(10,piv_exp)) + (5*piv_w_sin/2*(sin((def2-5)*180/10)+1)) + abs(def2*(1-piv_w_exp-piv_w_sin)/2);
            piv_def2_ang = asin(piv_def2/32);
            
            hull() {
                //rotate around the cam pivot
                translate([24,0,-(22-16)]) rotate([0,piv_def_ang,0]) translate([-24,0,(22-16)]) {
                    //rotate around the joystick pivot
                    translate([0,0,-22]) rotate([0,def,0]) translate([0,0,22]) {
                        rotate([-90,0,0]) cylinder(r=bearing_r,h=50,$fn=$fn*2);
                    }
                }
                
                //rotate around the cam pivot
                translate([24,0,-(22-16)]) rotate([0,piv_def2_ang,0]) translate([-24,0,(22-16)]) {
                    //rotate around the joystick pivot
                    translate([0,0,-22]) rotate([0,def2,0]) translate([0,0,22]) {
                        rotate([-90,0,0]) cylinder(r=bearing_r,h=50,$fn=$fn*2);
                    }
                }
            }
        }
        
        def = -10;
        piv_def = abs(pow(def,piv_exp)*(5*piv_w_exp)/pow(10,piv_exp)) + (5*piv_w_sin/2*(sin((def-5)*180/10)+1)) + abs(def*(1-piv_w_exp-piv_w_sin)/2);
        piv_def_ang = asin(piv_def/32);
        
        def2 = 10;
        piv_def2 = abs(pow(def2,piv_exp)*(5*piv_w_exp)/pow(10,piv_exp)) + (5*piv_w_sin/2*(sin((def2-5)*180/10)+1)) + abs(def2*(1-piv_w_exp-piv_w_sin)/2);
        piv_def2_ang = asin(piv_def2/32);
        
        hull() {
            //rotate around the cam pivot
            translate([24,0,-(22-16)]) rotate([0,piv_def_ang,0]) translate([-24,0,(22-16)]) {
                //rotate around the joystick pivot
                translate([0,0,-22]) rotate([0,def,0]) translate([0,0,22]) {
                    rotate([-90,0,0]) cylinder(r=bearing_r,h=50,$fn=$fn*2);
                }
            }
            
            //rotate around the cam pivot
            translate([24,0,-(22-16)]) rotate([0,piv_def2_ang,0]) translate([-24,0,(22-16)]) {
                //rotate around the joystick pivot
                translate([0,0,-22]) rotate([0,def2,0]) translate([0,0,22]) {
                    rotate([-90,0,0]) cylinder(r=bearing_r,h=50,$fn=$fn*2);
                }
            }
        }
        
    }
}

module camactutor() {
    difference() {
        union() {
            hull() {
                translate([0,8,0]) cylinder(r=12,h=56);
                translate([0,-8,0]) cylinder(r=12,h=56);
            }
            difference() {
                hull() {
                    translate([0,8,0]) cylinder(r=12,h=8+6+8);
                    translate([0,-8,0]) cylinder(r=12,h=8+6+8);
                    
                    translate([8-2,brh-2,0]) cylinder(r=2,h=8+6+8);
                    translate([-(8-2),brh-2,0]) cylinder(r=2,h=8+6+8);
                }
                //prevent fouling the pivot
                translate([-50,brh-0.25,-50]) cube([100,50,100]);
            }
            
            //horn out to bearing
            hull() {
                translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=8,h=brh+8-0.5);
                translate([0,0,8+6-8-2]) rotate([-90,0,0]) cylinder(r=4,h=brh-0.5);
                
                translate([-8,0,8+6]) cube([16,brh+8-0.5,8]);
            }
            //extra spacer to prevent fouling bearing
            hull() {
                translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=4+0.5,h=brh+8-0.5);
                translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=4,h=brh+8);
            }
        }
        
        //prevent fouling while tilting
        for(i=[0,1]) mirror([i,0,0]) translate([0,0,-8]) rotate([0,15,0]) hull() {
            translate([20,brh-0.25,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
            translate([-20,brh-0.25,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
        }
        
        //handle bolts
        for(i=[0,1]) mirror([0,i,0]) translate([0,(8+4),-1]) {
            cylinder(r=m4_v_r,h=200);
            *translate([0,0,8]) rotate([0,0,0]) cylinder(r=3.5/cos(30)+0.5,h=200);
        }
        
        //translate([0,brh+8,8+6]) sep_co(8);
        
        //bearing bolt co
        translate([0,brh+8-8-1,8+6]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=50);
            translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
        }
        
        //cam arm bolt endnut co
        translate([0,brh,8+6]) m4_endnut_b_co();
        
        //cable routing cutout
        hull() {
            translate([0,0,56]) sphere(r=5);
            translate([0,0,35-6]) {
                sphere(r=5);
                translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
            }
        }
        hull() {
            translate([0,0,35-6]) {
                sphere(r=5);
                translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
            }
            translate([6,0,35-6-6]) {
                sphere(r=5);
                translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
            }
        }
        hull() {
            translate([6,0,35-6-6]) {
                sphere(r=5);
                translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
            }
            translate([12,0,35-6-6]) {
                sphere(r=5);
                translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
            }
        }
    }
}

module camactutor_thrust() rotate([0,0,90]) {
    difference() {
        union() {
            rotate([0,0,90]) hull() {
                translate([0,8,0]) cylinder(r=12,h=56);
                translate([0,-8,0]) cylinder(r=12,h=56);
            }
            hull() {
                translate([(8+12-4),-(24),0]) cylinder(r=4,h=8+4);
                translate([-(8+12-4),-(24),0]) cylinder(r=4,h=8+4);
                
                translate([(8+12-4),(0),0]) cylinder(r=4,h=8+4);
                translate([-(8+12-4),(0),0]) cylinder(r=4,h=8+4);
            }
            difference() {
                hull() {
                    translate([(8+12-4),(24),0]) cylinder(r=4,h=8+6+8);
                    translate([-(8+12-4),(24),0]) cylinder(r=4,h=8+6+8);
                    
                    translate([(8+12-4),(0),0]) cylinder(r=4,h=8+6+8);
                    translate([-(8+12-4),(0),0]) cylinder(r=4,h=8+6+8);
                    
                    translate([8-2,brh-2,0]) cylinder(r=2,h=8+6+8);
                    translate([-(8-2),brh-2,0]) cylinder(r=2,h=8+6+8);
                }
                //prevent fouling the pivot
                translate([-50,brh-0.25,-50]) cube([100,50,100]);
            }
            
            //horn out to bearing
            hull() {
                translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=8,h=brh+8-0.5);
                translate([0,0,8+6-8-2]) rotate([-90,0,0]) cylinder(r=4,h=brh-0.5);
                
                translate([-8,0,8+6]) cube([16,brh+8-0.5,8]);
            }
            //extra spacer to prevent fouling bearing
            hull() {
                translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=4+0.5,h=brh+8-0.5);
                translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=4,h=brh+8);
            }
        }
        
        //prevent fouling while tilting
        for(i=[0,1]) mirror([i,0,0]) translate([0,0,-8]) rotate([0,15,0]) hull() {
            translate([20,brh-0.25,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
            translate([-20,brh-0.25,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
        }
        
        //handle bolts
        rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,(8+4),-1]) {
            cylinder(r=m4_v_r,h=200);
            *translate([0,0,8]) rotate([0,0,0]) cylinder(r=3.5/cos(30)+0.5,h=200);
        }
        
        //translate([0,brh+8,8+6]) sep_co(8);
        
        //bearing bolt co
        translate([0,brh+8-8-1,8+6]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=50);
            translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
        }
        rotate([0,0,0]) translate([0,brh,8+6]) m4_endnut_b_co(9);
        
        //bolt co to attach to cam actuator
        for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) translate([12,20,0]) m4_co(25, false, 8, 8, false, true);
        
        //cable routing cutout
        rotate([0,0,-90]) {
            hull() {
                translate([0,0,56]) sphere(r=5);
                translate([0,0,35-6]) {
                    sphere(r=5);
                    translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
                }
            }
            hull() {
                translate([0,0,35-6]) {
                    sphere(r=5);
                    translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
                }
                translate([6,0,35-6-6]) {
                    sphere(r=5);
                    translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
                }
            }
            hull() {
                translate([6,0,35-6-6]) {
                    sphere(r=5);
                    translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
                }
                translate([12,0,35-6-6]) {
                    sphere(r=5);
                    translate([0,-5*tan(22.5),0]) rotate([-90,0,0]) cylinder(r=5,h=2*5*tan(22.5));
                }
            }
        }
    }
}

module camspacer() {
    difference() {
        union() {
            translate([0,0,-4+0.5]) cylinder(r=4,h=8-0.5);
            translate([0,0,-4+0.5]) cylinder(r=8,h=8-0.5-0.5);
        }
        translate([0,0,-4-1]) cylinder(r=m4_v_r,h=50);
    }
}


module camactuator_out() difference() {
    intersection() {
        union() {
            //barrel body positive
            difference() {
                hull() for(i=[0,50]) translate([0,0,i]) {
                    rotate([90,0,0]) translate([0,0,-brh-8]) cylinder(r=8+12,h=br+16);
                    rotate([90,0,0]) translate([0,0,-brh-8]) cylinder(r=(br-8)/2,h=(br+16)/2);
                    
                    rotate([0,90,0]) translate([0,0,-brh]) cylinder(r=8+12,h=br);
                }
                for(i=[0,1]) mirror([i,0,0]) translate([brh-0.25,-50,-50]) cube([50,100,100]);
            }
            
            //horn out to cam actuator bearing
            rotate([0,0,90]) {
                hull() {
                    translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=8,h=brh+8-0.5);
                    translate([0,0,8+6-8-2]) rotate([-90,0,0]) cylinder(r=4,h=brh-0.5);
                    
                    translate([-8,0,8+6]) cube([16,brh+8-0.5,8]);
                }
            
                //extra spacer to prevent fouling bearing
                hull() {
                    translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=4+0.5,h=brh+8-0.5);
                    translate([0,0,8+6]) rotate([-90,0,0]) cylinder(r=4,h=brh+8);
                }
            }
        }

        union() {
            //back of horseshoe shape
            translate([-50,-100,0]) cube([100,100,8]);
        
            //side horn
            translate([-100,-10,0]) cube([100,20,8+6+8]);
            
            //bolt towers for attachment to outer pivot assembly
            for(i=[0,1]) mirror([i,0,0]) {
                translate([16,0,0]) cube([100,50,16]);
                
                hull() {
                    translate([brh-2,-(12+8-2),0]) cylinder(r=2,h=8+(6*i)+8);
                    translate([brh-16+2,-(12+8-2),0]) cylinder(r=2,h=8+(6*i)+8);
                    
                    translate([brh-2,(12+12-2),0]) cylinder(r=2,h=8+(6*i)+8);
                    translate([brh-16+2,(12+12-2),0]) cylinder(r=2,h=8+(6*i)+8);
                }
            }
        }
    }
    
    //prevent fouling while tilting
    rotate([0,0,90]) for(i=[0,1]) mirror([i,0,0]) translate([0,0,-8]) rotate([0,15,0]) hull() {
        translate([20,brh-0.25,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
        translate([-20,brh-0.25,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
    }

    //central co for inner pivot
    hull() for(i=[0,8+8+8]) translate([0,0,i]) {
        rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4+2,h=br);
        rotate([90,0,0]) translate([0,0,-brh+16]) cylinder(r=8+4+6+2,h=br-32);
    }
    
    //bolt co to attach to cam actuator
    for(i=[0,1]) mirror([i,0,0]) for(j=[-(8+4),(8+8)]) translate([(brh-8),j]) m4_co(25, false, 8, 8, false, true);
    
    for(i=[0,1]) mirror([i,0,0]) translate([24,brh+8,8]) {
        sep_co(8+2);
        
        //co for bolts for cam arms
        translate([0,-8-8,0]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=50);
            translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
        }
        
        //cam arm bolt endnut co
        translate([0,-8,0]) m4_endnut_b_co();
    }
    
    rotate([0,0,90]) translate([0,brh+8,8+6]) {
        //bolt co for outer bearing
        translate([0,-8-8,0]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=50);
            translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
        }
        
        //endnut co for outer cam bearing
        translate([0,-8,0]) m4_endnut_b_co();
    }
}