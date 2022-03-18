//functions and variables used for multiple scad files

br = 72; //width of pivot hinge
brh = br/2;

//nut and bolt dimensions (including clearance)
m4_v_r = (4+0.3-0.1)/2; // radius for M4 cutouts (vertical to buildplate)
m4_h_r = (4+0.2-0.1)/2; // radius for M4 cutouts (horizontal to buildplate)
m4n_v_r = (7+0.2-0.2)/2; // radius for M4 nut cutouts (horizontal to buildplate)
m4n2_v_r = m4n_v_r + 0.4; //for wedging m4 nuts in m4_co() function
m4n_h_r = (7+0.3-0.1)/2; // radius for M4 nut cutouts (horizontal to buildplate)
m4n2_h_r = m4n_h_r + 0.4; //for wedging m4 nuts in m4_co() function

m3_v_r = (3+0.35-0.1)/2; // radius for M3 cutouts (vertical to buildplate)
//m3n_v_r = (5.5+0.25)/2; // radius for M3 nut cutouts (vertical to buildplate)

//microswitch and pivot travel parameters
ms_xt = 2; //extra travel (before contact with lever)
ms_pt = 1.6; //microswitch pre-travel
ms_ot = 0.8; //microswitch over-travel

ms_ptot = ms_xt + ms_pt + ms_ot; //maximum displacement at microswitch
ms_os = 26; //vertical offset from pivot to microswitches

ms_p_a = atan(ms_ptot/ms_os); //maximum angle of the joystick/pivots


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

module box_lid_bolt_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([10,0,2.5]) cylinder(r=7.5-2.5,h=10);
        }
        hull() {
            translate([0,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10);
            
            translate([10,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
            translate([10,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10);
        }
        difference() {
            translate([5,-7.5+1.25,2.5]) cube([12.5,15-2.5,10]);
            for(i=[0,1]) mirror([0,i,0]) hull() {
                translate([5,-7.5+1.25,0]) cylinder(r=1.25,h=2.5+1.25);
                translate([5+1.25,-7.5+1.25,0]) cylinder(r=1.25,h=2.5);
                translate([5,-7.5+1.25,2.5+1.25]) cylinder(r1=1.25,r2=0,h=1.25);
            }
        }
    }
}

module box_lid_bolt_c_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            
            for(i=[0,1]) rotate([0,0,i*90]) {
                translate([10,0,2.5]) cylinder(r=7.5-2.5,h=10);
            }
        }
        
        hull() {
            translate([0,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10-2.5);
            
            for(i=[0,1]) rotate([0,0,i*90]) {
                translate([10,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
                translate([10,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10-2.5);
            }
        }
        for(i=[0,1]) rotate([0,0,i*90]) difference() {
            translate([5,-7.5+1.25,2.5]) cube([12.5,15-2.5,10]);
            for(i=[0,1]) mirror([0,i,0]) hull() {
                translate([5,-7.5+1.25,0]) cylinder(r=1.25,h=2.5+1.25);
                translate([5+1.25,-7.5+1.25,0]) cylinder(r=1.25,h=2.5);
                translate([5,-7.5+1.25,2.5+1.25]) cylinder(r1=1.25,r2=0,h=1.25);
            }
        }
    }
}


module box_lid_bolt_i_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+2.5]) cylinder(r=7.5,h=10-2.5);
        }
    }
}

module box_lid_bolt_i2_co(i=[-10,10]) {
    hull() for(j=i) {
        translate([0,j,2.5]) cylinder(r=7.5-2.5,h=10);
    }
    hull() for(j=i) {
        translate([0,j,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
        translate([0,j,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10-1.25);
    }
}

module box_frame(x_p=60,x_n=60,y_p=60,y_n=60,z_h=48) difference() {
    hull() {
        translate([(x_p-5),(y_p-5),0]) cylinder(r=5,h=z_h);
        translate([-(x_n-5),(y_p-5),0]) cylinder(r=5,h=z_h);
        translate([(x_p-5),-(y_n-5),0]) cylinder(r=5,h=z_h);
        translate([-(x_n-5),-(y_n-5),0]) cylinder(r=5,h=z_h);
    }
    
    *translate([(x_p-7.5),(y_p-7.5),0]) front_nut_co();
    *translate([-(x_n-7.5),(y_p-7.5),0]) front_nut_co();
    *translate([(x_p-7.5),-(y_n-7.5),0]) front_nut_co();
    *translate([-(x_n-7.5),-(y_n-7.5),0]) front_nut_co();
    
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
        hull() for(iz=[0,8]) {
            translate([0,iz,-w2/2]) cylinder(r=5,h=w2);
            translate([0,iz,0]) cylinder(r=5+w2/2,h=0.01);
        }
        
        hull() for(iz=[-8,8]) {
            translate([0,iz,-w1/2]) cylinder(r=r1,h=w1);
            translate([0,iz,-0.01/2]) cylinder(r=r1+w1/2,h=0.01);
        }
    }
}

module screw() {
    translate([0,0,-25]) cylinder(r=2,h=25+4);
    cylinder(r=3.5,h=4);
}

module ms() mirror([1,0,0]) translate([-20.1,-(20.7-10.3),-10.3/2]) {
    difference() {
        union() {
            //body
            hull() {
                translate([0,0,0]) cylinder(r=2.8,h=10.3);
                translate([22.2,0,0]) cylinder(r=2.8,h=10.3);
                translate([0,-10.3,0]) cylinder(r=2.8,h=10.3);
                translate([22.2,-10.3,0]) cylinder(r=2.8,h=10.3);
            }
            
            //connectors
            *hull() {
                translate([-2.8+1,2.8-4-1,0]) cylinder(r=1,h=10.3);
                translate([-2.8+1,2.8-4-9+1,0]) cylinder(r=1,h=10.3);
                translate([-2.8-10-1,2.8-4-1,0]) cylinder(r=1,h=10.3);
                translate([-2.8-10-1,2.8-4-9+1,0]) cylinder(r=1,h=10.3);
            }
            *hull() {
                translate([-2.8+4+1,-10.3-2.8+1,0]) cylinder(r=1,h=10.3);
                translate([-2.8+4+15-1,-10.3-2.8+1,0]) cylinder(r=1,h=10.3);
                translate([-2.8+4+1,-10.3-2.8-10-1,0]) cylinder(r=1,h=10.3);
                translate([-2.8+4+15-1,-10.3-2.8-10-1,0]) cylinder(r=1,h=10.3);
            }
            
            //actuator
            hull() {
                translate([20.1,20.7-10.3-2,0]) cylinder(r=2,h=10.3);
                translate([20.1,2.8,0]) cylinder(r=2,h=10.3);
            }
            hull() {
                translate([8.1+1,15.9-10.3-1,0]) cylinder(r=1,h=10.3);
                translate([20.1+2-1,15.9-10.3-1,0]) cylinder(r=1,h=10.3);
                translate([8.1+1,2.8-1,0]) cylinder(r=1,h=10.3);
                translate([20.1+2-1,2.8-1,0]) cylinder(r=1,h=10.3);
            }
            
        }
        //bolt hole cos
        translate([0,0,-1]) cylinder(r=1.5,h=20);
        translate([22.2,-10.3,-1]) cylinder(r=1.5,h=20);
    }
}

module ms_spacing(i) {
    rotate([0,0,i*90]) translate([-1,-8-0.5-ms_xt,0]) children();
}

module ms_co_spacing() mirror([1,0,0]) translate([-20.1,-(20.7-10.3),0]) {
    //bolt hole cos
    translate([0,0,0]) children();
    translate([22.2,-10.3,0]) children();
}

module ms_bco() mirror([1,0,0]) translate([-20.1,-(20.7-10.3),-10.3/2]) {
    xr = 0.5;
    
    //body
    hull() {
        translate([0,0,0]) cylinder(r=2.8+xr,h=10.3);
        translate([22.2,0,0]) cylinder(r=2.8+xr,h=10.3);
        translate([0,-10.3,0]) cylinder(r=2.8+xr,h=10.3);
        translate([22.2,-10.3,0]) cylinder(r=2.8+xr,h=10.3);
    }
    
    //connectors
    hull() {
        translate([-2.8+1,-1,0]) {
            cylinder(r=1+xr,h=10.3);
            translate([0,0,10.3+(10+1+1)*tan(45)]) sphere(r=1+xr);
        }
        translate([-2.8+1,-10.3+1,0]) {
            cylinder(r=1+xr,h=10.3);
            translate([0,0,10.3+(10+1+1)*tan(45)]) sphere(r=1+xr);
        }
        translate([-2.8-10-1,-1,0]) {
            cylinder(r=1+xr,h=10.3);
            translate([0,0,10.3]) sphere(r=1+xr);
        }
        translate([-2.8-10-1,-10.3+1,0]) {
            cylinder(r=1+xr,h=10.3);
            translate([0,0,10.3]) sphere(r=1+xr);
        }
    }
    hull() {
        translate([2.8-3+1,-10.3-2.8+1,1.6]) {
            cylinder(r=1+xr,h=10.3-1.6);
            translate([0,0,10.3-1.6+(5+1+1)*tan(45)]) sphere(r=1+xr);
        }
        translate([22.2-1,-10.3-2.8+1,1.6]) {
            cylinder(r=1+xr,h=10.3-1.6);
            translate([0,0,10.3-1.6+(5+1+1)*tan(45)]) sphere(r=1+xr);
        }
        translate([2.8-3+1,-10.3-2.8-5-1,1.6]) {
            cylinder(r=1+xr,h=10.3-1.6);
            translate([0,0,10.3-1.6]) sphere(r=1+xr);
        }
        translate([22.2-1,-10.3-2.8-5-1,1.6]) {
            cylinder(r=1+xr,h=10.3-1.6);
            translate([0,0,10.3-1.6]) sphere(r=1+xr);
        }
    }
    
    //actuator
    hull() {
        translate([2.8+1,2.8+15-1,1.6]) cylinder(r=1+xr,h=10.3-1.6);
        translate([22.2-1,2.8+15-1,1.6]) cylinder(r=1+xr,h=10.3-1.6);
        translate([2.8+1,2.8-1,1.6]) cylinder(r=1+xr,h=10.3-1.6);
        translate([22.2-1,2.8-1,1.6]) cylinder(r=1+xr,h=10.3-1.6);
    }
    hull() {
        translate([2.8+10+1,2.8+15-1,0]) cylinder(r=1+xr,h=10.3);
        translate([22.2+2.8-1,2.8+15-1,0]) cylinder(r=1+xr,h=10.3);
        translate([2.8+10+1,2.8-10.3/2-1,0]) cylinder(r=1+xr,h=10.3);
        translate([22.2+2.8-1,2.8-10.3/2-1,0]) cylinder(r=1+xr,h=10.3);
    }
}

module ms_co() mirror([1,0,0]) translate([-20.1,-(20.7-10.3),-10.3/2]) {
    //bolt hole cos
    translate([0,0,-1]) cylinder(r=1.5,h=20);
    translate([22.2,-10.3,-1]) cylinder(r=1.5,h=20);
}

module bevel_co(r=5,pos_h=100) difference() {
    translate([-r,-r,0]) cube([r*2,r*2,pos_h]);
    translate([-r,-r,-1]) cylinder(r=r,h=pos_h+2);
}

module bevel_co45(r=5) difference() {
    translate([-(r-sqrt(pow(r,2)/2)),-r*tan(22.5),0]) cube([10,10,100]);
    translate([-r,-r*tan(22.5),-1]) cylinder(r=r,h=102);
}

module ard_micro_co() translate([0,-2+0.75,0]) {
    //pcb co
    hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
        translate([17.5/2,0,-1]) cylinder(r=0.5,h=1.6);
        translate([17.5/2,32.5,-1]) cylinder(r=0.5,h=1.6+2);
        translate([17.5/2,2,-1]) cylinder(r=0.5,h=1.6+2);
    }
        
    //co for end of pin headers
    for(ixm=[0,1]) mirror([ixm,0,0]) hull() for(iy=[2.54,32.5]) {
        translate([15.2/2-0.5,iy,-1-2.5]) cylinder(r=0.75,h=1.6+2.5);
        translate([15.2/2+2.54+0.5,iy,-1-2.5]) cylinder(r=0.75,h=1.6+2.5);
    }
    
    //hold-down bolt co
    translate([0,32.5+0.5+m3_v_r,-25]) cylinder(r=m3_v_r,h=50);
    hull() {
        translate([0,32.5+0.5+m3_v_r,-1]) cylinder(r=m3_v_r,h=50);
        translate([0,32.5,-1]) cylinder(r=m3_v_r,h=50);
    }
    translate([0,32.5+0.5+m3_v_r,-50-1-2]) {
        cylinder(r=2.5+0.5,h=50-0.4);
        translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
        translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
    }
    
    //cable co
    hull() for(ix=[(6-2),-(6-2)]) for(iz=[(4-2),-(4-2)]) translate([ix,-0.75+2+0.01,-1+3+iz]) rotate([90,0,0]) {
        cylinder(r=2,h=50+50);
        translate([-2*tan(22.5),-2,0]) cube([2*2*tan(22.5),2*2,50+50]);
    }
    hull() for(ix=[(6+4-2),-(6+4-2)]) for(iy=[(45-30)+50-2,(45-30)+2]) translate([ix,-0.75+2-iy,-50]) {
        cylinder(r=2,h=50+4+2);
    }
}

module attiny_co() translate([0,-2+0.75,0]) {
    //pcb co
    hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
        translate([18.2/2,0,-1]) cylinder(r=0.5,h=1.6);
        translate([18.2/2,24.2,-1]) cylinder(r=0.5,h=1.6+2);
        translate([18.2/2,2,-1]) cylinder(r=0.5,h=1.6+2);
    }
    
    //hold-down bolt co
    translate([0,24.2+0.5+m3_v_r,-25]) cylinder(r=m3_v_r,h=50);
    hull() {
        translate([0,24.2+0.5+m3_v_r,-1]) cylinder(r=m3_v_r,h=50);
        translate([0,24.2,-1]) cylinder(r=m3_v_r,h=50);
    }
    translate([0,24.2+0.5+m3_v_r,-50-1-2]) {
        cylinder(r=2.5+0.5,h=50-0.4);
        translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
        translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
    }
    
    //cable co
    hull() for(ix=[(6-2),-(6-2)]) for(iz=[(4-2),-(4-2)]) translate([ix,-0.75+2+0.01,-1+3+iz]) rotate([90,0,0]) {
        cylinder(r=2,h=50+50);
        translate([-2*tan(22.5),-2,0]) cube([2*2*tan(22.5),2*2,50+50]);
    }
    hull() for(ix=[(6+4-2),-(6+4-2)]) for(iy=[(45-30)+50-2,(45-30)+2]) translate([ix,-0.75+2-iy,-50]) {
        cylinder(r=2,h=50+4+2);
    }
}

module m4_co(thread_length=25, thread_horiz=false, head_offset=0, nut_offset=false, head_overhung=false, nut_overhung=false) {
    if(thread_horiz) {
        translate([0,0,-thread_length+head_offset])hull() {
            cylinder(r=m4_h_r,h=thread_length+4);
            translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,thread_length+4]);
        }
    } else {
        translate([0,0,-thread_length+head_offset]) cylinder(r=m4_v_r,h=thread_length+4);
    }
    
    if(thread_horiz) {
        translate([0,0,head_offset]) hull() {
            cylinder(r=4,h=4+50);
            translate([-4*tan(22.5),-4,0]) cube([2*4*tan(22.5),2*4,4+50]);
        }
    } else if(head_overhung) {
        translate([0,0,head_offset+0.4]) cylinder(r=4,h=4+50-0.4);
        translate([-m4_v_r,-m4_v_r,head_offset]) cube([2*m4_v_r,2*m4_v_r,50]);
        translate([-sqrt(pow(4,2)-pow(m4_v_r,2)),-m4_v_r,head_offset+0.2]) cube([2*sqrt(pow(4,2)-pow(m4_v_r,2)),2*m4_v_r,4+50-0.2]);
        
    } else {
        translate([0,0,head_offset]) cylinder(r=4,h=4+50);
    }
    
    if(nut_offset) {
        if(thread_horiz) {
            //this orientation is not supported
            //translate([0,0,-50-nut_offset]) hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_h_r-3.5,h=50);
            
        } else {
            translate([0,0,-50-nut_offset]) {
                if(nut_overhung) {
                    hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50-0.2);
                    
                    hull() for(i=[0:2]) rotate([0,0,i*120]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50);
                } else {
                    hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50);
                }
                    
                hull() for(i=[0:5]) rotate([0,0,i*60]) {
                    translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=50-3);
                    translate([3.5/cos(30),0,0]) cylinder(r=m4n2_v_r-3.5,h=50-3-2);
                }
            }
        }
    }
}

module m4_endnut_co(horiz_overhung=false) {
    //washer co
    hull() {
        for(iz=[0,8]) translate([0,0,iz]) {
            rotate([90,0,0]) {
                cylinder(r=5,h=1.5);
                if(horiz_overhung) translate([-5*tan(22.5),-5,0]) cube([2*5*tan(22.5),2*5,1.5]);
            }
        }
    }
        
    //nut co
    hull() {
        for(iz=[0,8]) {
            translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_h_r-3.5,h=8+5);
        }
    }
    hull() {
        for(iz=[0,8]) {
            translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) translate([3.5/cos(30),0,0]) {
                translate([0,0,4]) cylinder(r=m4n_h_r-3.5,h=8+5-4);
                translate([0,0,4+2]) cylinder(r=m4n2_h_r-3.5,h=8+5-(4+2));
            }
        }
    }
}

module m4_endnut_b_co(en_l=9,horiz_overhung=false) {
    //washer co
    hull() {
        for(iz=[0,8]) translate([0,0,iz]) {
            rotate([90,0,0]) {
                cylinder(r=5,h=1.5);
                if(horiz_overhung) translate([-5*tan(22.5),-5,0]) cube([2*5*tan(22.5),2*5,1.5]);
            }
        }
    }
        
    //nut co
    hull() {
        for(iz=[0,8]) translate([0,0,iz]) {
            rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) {
                translate([3.5/cos(30),0,0]) {
                    cylinder(r=m4n_h_r-3.5,h=en_l);
                    if(horiz_overhung) rotate([0,0,-(30+i*60)+90]) translate([-(m4n_h_r-3.5),-(m4n_h_r-3.5)*tan(22.5),0]) cube([2*(m4n_h_r-3.5),2*(m4n_h_r-3.5)*tan(22.5),en_l]);
                }
            }
        }
    }
    hull() {
        for(iz=[0,8]) {
            translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) {
                translate([3.5/cos(30),0,0]) {
                    translate([0,0,4]) {
                        cylinder(r=m4n_h_r-3.5,h=en_l-4);
                        if(horiz_overhung) rotate([0,0,-(30+i*60)+90]) translate([-(m4n_h_r-3.5),-(m4n_h_r-3.5)*tan(22.5),0]) cube([2*(m4n_h_r-3.5),2*(m4n_h_r-3.5)*tan(22.5),en_l-4]);
                    }
                    
                    translate([0,0,4+2]) {
                        cylinder(r=m4n2_h_r-3.5,h=en_l-(4+2));
                        if(horiz_overhung) rotate([0,0,-(30+i*60)+90]) translate([-(m4n2_h_r-3.5),-(m4n2_h_r-3.5)*tan(22.5),0]) cube([2*(m4n2_h_r-3.5),2*(m4n2_h_r-3.5)*tan(22.5),en_l-(4+2)]);
                    }
                }
                translate([3.5/cos(30)-1,0,0]) {
                    translate([0,0,4+2]) {
                        cylinder(r=m4n2_h_r-3.5,h=en_l-(4+2)+1);
                        if(horiz_overhung) rotate([0,0,-(30+i*60)+90]) translate([-(m4n2_h_r-3.5),-(m4n2_h_r-3.5)*tan(22.5),0]) cube([2*(m4n2_h_r-3.5),2*(m4n2_h_r-3.5)*tan(22.5),en_l-(4+2)+1]);
                    }
                }
            }
        }
    }
}

module m4_endnut_vert_co_wid(w=0) {
    translate([w,0,0]) children();
    if(w!=0) translate([-w,0,0]) children();
}

module m4_endnut_vert_co(w=0) rotate([-90,0,0]) {
    //washer co
    *hull() {
        for(iz=[0,50]) translate([0,0,iz]) {
            rotate([90,0,0]) {
                cylinder(r=5,h=0.75);
                cylinder(r=5-2/tan(37.5),h=0.75+2);
            }
        }
    }
        
    //nut co
    hull() m4_endnut_vert_co_wid(w) union() {
        for(iz=[0,50]) {
            translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=8);
        }
    }
    hull() m4_endnut_vert_co_wid(w) {
        for(iz=[0,50]) {
            translate([0,0,iz]) rotate([90,0,0]) for(i=[0:5]) rotate([0,0,30+i*60]) translate([3.5/cos(30),0,0]) {
                translate([0,0,4]) cylinder(r=m4n_v_r-3.5,h=8-4);
                translate([0,0,4+2]) cylinder(r=m4n2_v_r-3.5,h=8-(4+2));
            }
        }
    }
}