//functions and variables used for multiple scad files

br = 72; //width of pivot hinge
brh = br/2;

m4_v_r = 2+0.125; // radius for M4 cutouts (vertical to buildplate)
m4_h_r = 2+0.0625; // radius for M4 cutouts (horizontal to buildplate)
m4n_v_r = 3.5+0.125; // radius for M4 nut cutouts (horizontal to buildplate)
m4n_h_r = 3.5+0.0625; // radius for M4 nut cutouts (horizontal to buildplate)

m3_v_r = 1.5+0.125; // radius for M3 cutouts (vertical to buildplate)
m3n_v_r = 2.75+0.125; // radius for M3 nut cutouts (vertical to buildplate)

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


module box_lid_bolt_i_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+2.5]) cylinder(r=7.5,h=10-2.5);
        }
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