module base() difference() {
    union() {
        hull() {
            translate([-(brh+32-4),(brh+32-4),-26-14]) cylinder(r=4,h=14);
            translate([-(brh+32-4),-(brh+32-4),-26-14]) cylinder(r=4,h=14);
            
            translate([(brh+32-4)-24,(brh+32-4),-26-14]) cylinder(r=4,h=14);
            translate([(brh+32-4)-24,-(brh+32-4),-26-14]) cylinder(r=4,h=14);
            
            translate([(brh+32-4),(brh+32-4)-24,-26-14]) cylinder(r=4,h=14);
            
            translate([(brh+32-4),-(brh+32-4),-26-14]) cylinder(r=4,h=14);
            
        }
        hull() {
            translate([(brh+32-4),-(brh+32-4),-26-14]) cylinder(r=4,h=14+10);
            translate([(brh+32-4),-(brh+32-4-16-8),-26-14]) cylinder(r=4,h=14+10);
        }
    }
    //cam arm clearance co
    hull() {
        for(i=[0,1]) mirror([i,0,0]) {
            translate([brh+2,24+24-12+2,-26-8]) cylinder(r=2,h=100);
            translate([brh+2,24+24-12+2+50,-26-8]) cylinder(r=2,h=100);
        }
    }
    //central co for actuator arm clearance
    *hull() {
        for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([brh-4,brh-4,-26-14-1]) cylinder(r=4,h=100);
        }
    }
    
    //co to prevent thin wall between cos
    *hull() {
        for(i=[0,1]) mirror([i,0,0]) {
            translate([brh-4,0,-26-8]) cylinder(r=4,h=100);
            translate([brh-4,100,-26-8]) cylinder(r=4,h=100);
        }
    }
    
    //upright mounting bolts
    for(j=[0,1]) mirror([0,j,0]) {
        translate([(brh+16),24,-26]) m4_co(25,false,8,8,false,true);
        translate([-(brh+16),48+8,-26]) m4_co(25,false,8,8,false,true);
    }
    
    //access to side cam arms co
    mirror([1,0,0]) {
        hull() for(i=[0,1]) mirror([0,i,0]) {
            translate([brh+8+1,24+16-1,-26-14-1]) cylinder(r=1+0.5,h=100);
            translate([brh+8+8+8-1,24+16-1,-26-14-1]) cylinder(r=1+0.5,h=100);
        }
    }
    
    
    //central cutout for actuator movement, also acts as a stop
    translate([0,0,0]) {
        hull() for(i=[0,1]) mirror([0,i,0]) for(j=[0,1]) mirror([j,0,0]) {
            rotate([0,-ms_p_a,0]) rotate([ms_p_a,0,0]) {
                translate([8-2,8-2,-100]) cylinder(r=2+0.25,h=100-10);
            }
        }
    }
    
    //ms placement co
    translate([0,0,-26]) for(i=[0:3]) ms_spacing(i) ms_bco();
        
    //ms bolt co
    for(i=[0:3]) ms_spacing(i) ms_co_spacing() {
        translate([0,0,-26-14-1]) cylinder(r=m3_v_r,h=50);
        translate([0,0,-50-26-5.15-2]) {
            cylinder(r=2.5+0.5,h=50-0.4);
            translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
            translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
        }
    }
    
    //arduino co
    translate([brh+32-8,-(brh+32-16),-26]) rotate([0,0,90]) ard_micro_co();
}

module upright() difference() {
    union() {
        hull() {
            for(i=[0,1]) mirror([0,i,0]) {
                translate([brh+4,8+4,-26]) cylinder(r=4,h=26+8);
                translate([brh+16-4,8+4,-26]) cylinder(r=4,h=26+8);
            }
        }
        hull() {
            for(i=[0,1]) mirror([0,i,0]) {
                translate([brh+8,8+16,-26]) cylinder(r=8,h=12);
                translate([brh+32-8,8+16,-26]) cylinder(r=8,h=12);
            }
        }
    }
    for(j=[0,1]) mirror([0,j,0]) {
        translate([(brh+16),24,-26]) m4_co(25,false,12);
    }
                
    translate([brh,0,0]) rotate([0,0,90]) sep_co(8+12+2);
    
    translate([brh-1,0,0]) {
        rotate([0,90,0]) hull() {
            cylinder(r=m4_h_r,h=100);
            rotate([0,0,90]) translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,100]);
        }
    }
    translate([brh+8,0,0]) {
        rotate([0,90,0]) hull() {
            cylinder(r=4,h=100);
            rotate([0,0,90]) translate([-4*tan(22.5),-4,0]) cube([2*4*tan(22.5),2*4,100]);
            
            translate([0,0,2]) {
                cylinder(r=(4+2),h=100);
                rotate([0,0,90]) translate([-(4+2)*tan(22.5),-(4+2),0]) cube([2*(4+2)*tan(22.5),2*(4+2),100]);
            }
        }
    }
    
    //ms placement co
    translate([0,0,-26]) for(i=[0:3]) ms_spacing(i) ms_bco();
}

module upright_withcam() intersection() {
    difference() {
        union() {
            mirror([1,0,0]) hull() {
                for(i=[0,1]) mirror([0,i,0]) {
                    translate([brh+8,24+16,-26]) cylinder(r=8,h=26+8+8+8);
                    translate([brh+32-8,24+16,-26]) cylinder(r=8,h=26+8+8+8);
                }
                translate([brh+2,24+24-2,-26]) cylinder(r=2,h=26+8+8+8);
            }
            
            mirror([1,0,0]) hull() {
                for(i=[0,1]) mirror([0,i,0]) {
                    translate([brh+4,brh+32-4,-26]) cylinder(r=4,h=8+4);
                    translate([brh+32-4,brh+32-4,-26]) cylinder(r=4,h=8+4);
                }
            }
        }
        
        for(j=[0,1]) mirror([0,j,0]) {
            translate([-(brh+16),48+8,-26]) m4_co(25,false,8+4);
        }
        
        mirror([1,0,0]) hull() {
            for(i=[0,1]) mirror([i,0,0]) {
                translate([brh+2,24+24-12+2,-26-1]) cylinder(r=2,h=100);
                translate([brh+2,24+24-12+2+50,-26-1]) cylinder(r=2,h=100);
            }
        }
        
        mirror([1,0,0]) rotate([0,0,0]) {
            translate([brh,0,0]) rotate([0,0,90]) sep_co(8+12+2);
        }
        
        mirror([1,0,0]) hull() {
            for(i=[0,1]) mirror([0,i,0]) {
                translate([0,24-16,16]) rotate([0,90,0]) cylinder(r=8,h=brh+8+8+8);
                translate([0,24-16,16+50]) rotate([0,90,0]) cylinder(r=8,h=brh+8+8+8);
            }
        }
        
        mirror([1,0,0]) translate([brh+8,0,0]) rotate([0,90,0]) hull() {
            cylinder(r=8,h=100);
            rotate([0,0,90]) translate([-8*tan(22.5),-8,0]) cube([2*8*tan(22.5),2*8,100]);
        }
        
        mirror([1,0,0]) hull() {
            translate([brh+8,0,0]) rotate([0,90,0]) cylinder(r=8,h=8+8);
            translate([brh+8,0,8]) rotate([0,90,0]) cylinder(r=8,h=8+8);
            translate([brh+8,0,0]) rotate([0,90,0]) cylinder(r=8+8,h=8);
            translate([brh+8,0,8]) rotate([0,90,0]) cylinder(r=8+8,h=8);
        }
        
        mirror([1,0,0]) {
            hull() for(i=[0,1]) mirror([0,i,0]) {
                translate([brh+8+1,24+16-1,-26-1]) cylinder(r=1+0.25,h=100);
                translate([brh+8+8-1,24+16-1,-26-1]) cylinder(r=1+0.25,h=100);
            }
            hull() for(i=[0,1]) mirror([0,i,0]) {
                translate([brh+8+8-1,24+16-1,-26-1]) cylinder(r=1+0.25,h=1+26+8);
                translate([brh+8+8+8-1,24+16-1,-26-1]) cylinder(r=1+0.25,h=1+26);
            }
        }
        
        mirror([1,0,0]) {
            translate([brh+8,24,16]) rotate([0,0,90]) sep_co(8);
            translate([brh+8,-24,16]) rotate([0,0,90]) sep_co(8);
        
            translate([brh+8+8,24,16]) rotate([0,0,90]) sep_co(8);
            translate([brh+8+8,-24,16]) rotate([0,0,90]) sep_co(8);
        }
        

        mirror([1,0,0]) translate([brh-1,0,0]) {
            rotate([0,90,0]) hull() {
                cylinder(r=m4_h_r,h=1+32);
                rotate([0,0,90]) translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,1+32]);
            }
        }
        
        mirror([1,0,0]) for(i=[0,1]) mirror([0,i,0]) translate([brh-1,24,16]) {
            rotate([0,90,0]) hull() {
                cylinder(r=m4_h_r,h=1+32);
                rotate([0,0,90]) translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,1+32]);
            }
            rotate([0,90,0]) hull() {
                cylinder(r=4,h=1+4);
                rotate([0,0,90]) translate([-4*tan(22.5),-4,0]) cube([2*4*tan(22.5),2*4,1+4]);
            }
        }
        
        mirror([1,0,0]) for(i=[0,1]) mirror([0,i,0]) translate([brh+8+8+4,24,16]) rotate([0,0,90]) {
            hull() {
                rotate([90,0,0]) translate([0,0,]) cylinder(r=5,h=2);
                translate([0,0,8]) rotate([90,0,0]) translate([0,0,]) cylinder(r=5,h=1.75);
            }
                
            hull() {
                translate([0,0,-1]) rotate([90,0,0]) translate([0,0,]) cylinder(r=m4n_h_r,h=9+5);
                translate([0,0,8]) rotate([90,0,0]) translate([0,0,]) cylinder(r=m4n_h_r,h=9+5);
            }
        }
    
        //ms placement co
        translate([0,0,-26]) for(i=[0:3]) ms_spacing(i) ms_bco();
    }
}