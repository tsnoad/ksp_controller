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
                        cylinder(r=2,h=26+8-2);
                        cylinder(r=0.01,h=26+8);
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
            hull() {
                rotate([90,0,0]) translate([0,0,-brh+8]) cylinder(r=5,h=1.75);
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

module piv_in_thrust() {
    rotate([0,0,90]) difference() {
        union() {
            //body
            difference() {
                hull() {
                    rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4,h=br);
                    rotate([90,0,0]) translate([0,0,-brh+20]) cylinder(r=8+4+12,h=br-40);
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
        mirror([0,0,1]) translate([0,0,-50]) cylinder(r=m3_v_r,h=100);
        
        hull() translate([0,0,-8-8]) for(i=[0:5]) rotate([0,0,i*60]) translate([2.75/cos(30),0,0]) cylinder(r=m3n_v_r-2.75,h=50);
            
        //spring co
        for(i=[0:3]) rotate([0,0,i*90]) mirror([0,0,1]) translate([0,0,8+30-2.5]) {
            hull() for(k=[0,1]) mirror([0,k,0]) {
                translate([m3_v_r+2.5+1.25,(2.5-1.25),-1.5]) cylinder(r=1.25,h=50);
                translate([50,(2.5-1.25)+50,-1.5-50*sqrt(2)*tan(0)]) cylinder(r=1.25,h=50);
            }
        }
        
        
        mirror([0,0,0]) {
            translate([0,brh,0]) sep_co(8+4+2);
            translate([0,-brh,0]) sep_co(8+4+2);
        }
        
        //pivot nut co
        mirror([0,0,0]) for(i=[0,1]) mirror([0,i,0]) {
            hull() {
                for(j=[0,8]) translate([0,0,j]) rotate([90,0,0]) translate([0,0,-brh+8]) {
                    cylinder(r=5,h=1.75);
                    translate([-5*tan(22.5),-5,0]) cube([2*5*tan(22.5),2*5,1.75]);
                }
            }
            
            hull() {
                for(j=[-1,8]) translate([0,0,j]) rotate([90,0,0]) translate([0,0,-brh+8]) {
                    cylinder(r=m4n_h_r,h=9);
                    translate([-m4n_h_r*tan(22.5),-m4n_h_r,0]) cube([2*m4n_h_r*tan(22.5),2*m4n_h_r,9]);
                }
                for(j=[-1,8]) translate([0,0,j]) rotate([90,0,0]) translate([0,0,-brh+8]) {
                    cylinder(r=(m4n_h_r-1),h=9+1);
                    translate([-(m4n_h_r-1)*tan(22.5),-(m4n_h_r-1),0]) cube([2*(m4n_h_r-1)*tan(22.5),2*(m4n_h_r-1),9+1]);
                }
            }
        }
        for(i=[0,2]) rotate([0,0,i*90]) {
            translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                cylinder(r=m4_h_r,h=50);
                translate([-(m4_h_r)*tan(22.5),-(m4_h_r),0]) cube([2*(m4_h_r)*tan(22.5),2*(m4_h_r),50]);
            }
        }
        
        //handle nut co
        for(i=[1,3]) rotate([0,0,i*90]) {
            translate([0,-8-4,-8-1]) cylinder(r=m4_v_r,h=50);
            hull() translate([0,-8-4,-8-50+16-4]) for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50);
        }
        
    }
    
    difference() {
        mirror([0,0,1]) for(i=[1,3]) rotate([0,0,i*90]) hull() {
            translate([8,0,8+18+1]) sphere(r=3);
            translate([8,0,8+18-1]) sphere(r=3);
            
            translate([8+5-3,0,8+18+1]) sphere(r=3);
            translate([8+5-3,0,8+18-1]) sphere(r=3);
            
            translate([8-8,0,8+18-1-8*tan(60)]) sphere(r=3);
        }
        
        mirror([0,0,1]) translate([0,0,-50])  cylinder(r=m3_v_r,h=100);
        
        hull() translate([0,0,-8]) for(i=[0:5]) rotate([0,0,i*60]) translate([2.75/cos(30),0,0]) cylinder(r=m3n_v_r-2.75,h=50);
    }
}

module piv_out_camcent() union() {
    difference() {
        union() {
            hull() for(i=[0,8]) translate([0,0,i]) {
                rotate([90,0,0]) translate([0,0,-brh-8+0.25]) cylinder(r=8+12,h=br+16-0.25);
                rotate([90,0,0]) translate([0,0,-brh-8+0.25]) cylinder(r=(br-8)/2,h=(br+16)/2-0.25);
                
                rotate([0,90,0]) translate([0,0,-brh]) cylinder(r=8+12,h=br);
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
            translate([0,brh,0]) sep_co(8+4+2);
            translate([0,-brh,0]) sep_co(8+4+2);
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

module camlever(mir=0) mirror([mir,0,0]) mirror([0,mir,0]) difference() {
    union() {
        hull() {
            translate([24,4-0.5,0]) rotate([90,0,0]) cylinder(r=8,h=8-1);
            translate([24,4-0.5,-32]) rotate([90,0,0]) cylinder(r=8,h=8-1);
        }
        //cam track positive
        hull() {
            translate([24,4-0.5,0]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);
            translate([-8+1,4-0.5,0]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);
            translate([-8+1,4-0.5,4]) rotate([90,0,0]) cylinder(r=8,h=4-0.5-0.25);
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
    
    translate([0,-4-1,6]) /*hull()*/ {
        for(def=[-16:1:16]) {
            //rotate around the cam pivot
            piv_def = abs(def/2); //for every degree of joystick deflection there is 1/2mm of lateral movement at the spring
            //piv_def = pow(def/8,2);
            //piv_def = abs(def/2)/2 + pow(def/8,2)/2;
            piv_def_ang = asin(piv_def/32);
            
            def2 = def + 1;
            piv_def2 = abs(def2/2);
            //piv_def2 = pow(def2/8,2);
            //piv_def2 = abs(def2/2)/2 + pow(def2/8,2)/2;
            piv_def2_ang = asin(piv_def2/32);
            
            hull() {
                translate([24,0,-(22-16)]) rotate([0,piv_def_ang,0]) translate([-24,0,(22-16)]) {
                    //rotate around the joystick pivot
                    translate([0,0,-22]) rotate([0,def,0]) translate([0,0,22]) {
                        rotate([-90,0,0]) cylinder(r=6.5,h=50,$fn=$fn*2);
                    }
                }
                
                translate([24,0,-(22-16)]) rotate([0,piv_def2_ang,0]) translate([-24,0,(22-16)]) {
                    //rotate around the joystick pivot
                    translate([0,0,-22]) rotate([0,def2,0]) translate([0,0,22]) {
                        rotate([-90,0,0]) cylinder(r=6.5,h=50,$fn=$fn*2);
                    }
                }
            }
        }
    }
}

module camactutor() {
    difference() {
        union() {
            hull() {
                translate([0,8,0]) cylinder(r=12,h=35);
                translate([0,-8,0]) cylinder(r=12,h=35);
            }
            hull() {
                translate([0,8,0]) cylinder(r=12,h=8+6+8);
                translate([0,-8,0]) cylinder(r=12,h=8+6+8);
                
                translate([8-2,brh-2,0]) cylinder(r=2,h=8+6+8);
                translate([-(8-2),brh-2,0]) cylinder(r=2,h=8+6+8);
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
            translate([20,brh,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
            translate([-20,brh,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
        }
        
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
        
        //bearing washer co
        rotate([0,0,0]) translate([0,brh+8,8+6]) hull() {
            rotate([90,0,0]) translate([0,0,8]) cylinder(r=5,h=1.75);
            translate([0,0,8]) rotate([90,0,0]) translate([0,0,8]) cylinder(r=5,h=1.75);
        }
            
        //pivot nut co
        rotate([0,0,0]) translate([0,brh+8,8+6]) hull() {
            translate([0,0,-1]) rotate([90,0,0]) translate([0,0,8]) cylinder(r=m4n_h_r,h=9);
            translate([0,0,8]) rotate([90,0,0]) translate([0,0,8]) cylinder(r=m4n_h_r,h=9);
            
            translate([0,0,-1]) rotate([90,0,0]) translate([0,0,8]) cylinder(r=m4n_h_r-1,h=9+1);
            translate([0,0,8]) rotate([90,0,0]) translate([0,0,8]) cylinder(r=m4n_h_r-1,h=9+1);
        }
        
        //cable routing cutout
        hull() {
            translate([0,0,35]) sphere(r=5);
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
        translate([20,brh,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
        translate([-20,brh,0]) rotate([-90,0,0]) cylinder(r=8,h=20);
    }

    //central co for inner pivot
    hull() for(i=[0,8+8+8]) translate([0,0,i]) {
        rotate([90,0,0]) translate([0,0,-brh]) cylinder(r=8+4+2,h=br);
        rotate([90,0,0]) translate([0,0,-brh+16]) cylinder(r=8+4+6+2,h=br-32);
    }
    
    //bolt co to attach to cam actuator
    for(i=[0,1]) mirror([i,0,0]) for(j=[-(8+4),(8+8)]) translate([(brh-8),j]) m4_co(25, false, 8, 8, false, true);
    
    for(i=[0,1]) mirror([i,0,0]) translate([24,brh+8,8]) {
        sep_co(8);
        
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