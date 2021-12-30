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
        mirror([0,0,1]) translate([0,0,-50])  cylinder(r=m3_v_r,h=100);
        
        hull() translate([0,0,-8]) for(i=[0:5]) rotate([0,0,i*60]) translate([2.75/cos(30),0,0]) cylinder(r=m3n_v_r-2.75,h=50);
            
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
        for(i=[1,3]) rotate([0,0,i*90]) {
            translate([0,-8-4,-8-1]) cylinder(r=m4_v_r,h=50);
            hull() translate([0,-8-4,-8-50+16-4]) for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50);
        }
        
    }
}