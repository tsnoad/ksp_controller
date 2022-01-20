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
            translate([(brh+32-4),-(brh+32-4-14-7),-26-14]) cylinder(r=4,h=14+10);
        
            translate([(brh+32-45+4),-(brh+32-4),-26-14]) cylinder(r=4,h=14+10);
            translate([(brh+32-45+4),-(brh+32-4-14-7),-26-14]) cylinder(r=4,h=14+10);
        }
    }
    
    base_co();
    uprightcam_co();
    
    //upright mounting bolts
    for(j=[0,1]) mirror([0,j,0]) {
        translate([(brh+16),24,-26]) m4_co(25,false,8,8,false,true);
        translate([-(brh+16),48+8,-26]) m4_co(25,false,8,8,false,true);
    }
    
    //arduino co
    translate([brh+32-45,-(brh+32-14),-26]) rotate([0,0,90]) ard_micro_co();
}

module base2() {
    difference() {
        union() {
            translate([0,0,-14-26]) box_frame(70,70,60+8,60,14+8);
            translate([0,0,-14-26]) box_frame(70,70,60+8,60,5);
           
            hull() {
                translate([(70-5),(20-5),-26-14]) cylinder(r=5,h=14+26+16);
                translate([(70-5),-(20-5),-26-14]) cylinder(r=5,h=14+26+16);
                translate([(brh+5),(20-5),-26-14]) cylinder(r=5,h=14+26+16);
                translate([(brh+5),-(20-5),-26-14]) cylinder(r=5,h=14+26+16);
            }
            
            hull() mirror([1,0,0]) {
                translate([(70-5),(60-5),-26-14]) cylinder(r=5,h=14+26+24);
                translate([(70-5),-(60-5),-26-14]) cylinder(r=5,h=14+26+24);
                translate([(brh+5),(60-5),-26-14]) cylinder(r=5,h=14+26+24);
                translate([(brh+5),-(60-5),-26-14]) cylinder(r=5,h=14+26+24);
            }
            
            mirror([0,1,0]) translate([0,0,-26-14]) {
                difference() {
                    box_frame(70,70,60,60+40+5,80);
                    translate([-(70-5),-(60-5)-(40+5),-1]) cube([2*(70-5),2*(60-5)+40+5,100]);
                }
                difference() {
                    box_frame(70,70,60,60+8,80);
                    translate([-(70-5),-(60-5),-1]) cube([2*(70-5),2*(60-5),100]);
                }
                intersection() {
                    box_frame(70,70,60,60,80);
                    
                    union() {
                        for(iy=[60-7.5]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                            translate([70-7.5,iy,0]) hull() {
                                cylinder(r=7.5,h=80);
                                
                                translate([20,-20,0]) cylinder(r=7.5,h=80);
                                translate([-20,20,0]) cylinder(r=7.5,h=80);
                                
                                translate([20,20,0]) cylinder(r=7.5,h=80);
                            }
                        }
                        for(iy=[(60-7.5)]) mirror([0,1,0]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                            translate([70-7.5,iy,0]) hull() {
                                cylinder(r=7.5,h=80);
                                
                                translate([20,-20,0]) cylinder(r=7.5,h=80);
                                translate([-20,20,0]) cylinder(r=7.5,h=80);
                                
                                translate([20,20,0]) cylinder(r=7.5,h=80);
                            }
                        }
                        *for(iy=[-(60-7.5)]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                            translate([70-7.5,iy,0]) hull() {
                                cylinder(r=7.5,h=80);
                                
                                translate([20,-20,0]) cylinder(r=7.5,h=80);
                                translate([20,20,0]) cylinder(r=7.5,h=80);
                            }
                        }
                    }
                }
                intersection() {
                    box_frame(70,70,60,60+40+5,80);
                    
                    union() {
                        for(iy=[(60+40+5-7.5)]) mirror([0,1,0]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                            translate([70-7.5,iy,0]) hull() {
                                cylinder(r=7.5,h=80);
                                
                                translate([20,-20,0]) cylinder(r=7.5,h=80);
                                translate([-20,20,0]) cylinder(r=7.5,h=80);
                                
                                translate([20,20,0]) cylinder(r=7.5,h=80);
                            }
                        }
                    }
                }
                hull() {
                    translate([(70-5),-(60+40+5-5),0]) cylinder(r=5,h=7.5);
                    translate([(70-5),-(60+8),0]) cylinder(r=5,h=7.5);
                
                    translate([(70-5-50),-(60+40+5-5),0]) cylinder(r=5,h=7.5);
                    translate([(70-5-50),-(60+8),0]) cylinder(r=5,h=7.5);
                }
                hull() {
                    translate([(70-5),-(60+40+5-5),0]) cylinder(r=5,h=7.5+10);
                    translate([(70-5),-(60+8),0]) cylinder(r=5,h=7.5+10);
                
                    translate([(70-5-10),-(60+40+5-5),0]) cylinder(r=5,h=7.5+10);
                    translate([(70-5-10),-(60+8),0]) cylinder(r=5,h=7.5+10);
                }
            }
            
            for(ixm=[0,1]) mirror([ixm,0,0]) {
                translate([(70-5),60+8,-26-14]) rotate([0,0,270]) bevel_co(5,80);
            }
            translate([-(brh),-(60-5),-26-14]) rotate([0,0,180]) bevel_co(5,14+26+24);
            
            for(iym=[0,1]) mirror([0,iym,0]) {
                translate([(70-5),20,-26-14]) rotate([0,0,270]) bevel_co(5,14+26+16);
            }
        }
        
        mirror([0,1,0]) translate([0,0,-26-14]) {
            //front bolt co
            for(i=[0,1]) mirror([i,0,0]) {
                for(j=[(60-7.5),-(60-7.5),-(60+40+5-7.5)]) {
                    translate([(70-7.5),j,0]) front_nut_co();
                    *translate([(70-7.5),j,64-30])  cylinder(r=m4_v_r,h=50);
                }
            }
        }
        
        uprightcam_co();
        base_co();
        
        difference() {
            for(i=[0,1]) mirror([i,0,0]) {
                translate([brh,0,0]) rotate([0,0,90]) sep_co(8+12+2);
            }
            translate([-100,-100,-100-26]) cube([200,300,100]);
        }
        
        hull() for(i=[0,1]) mirror([i,0,0]) {
            translate([(brh-2.5),(brh-2.5)+10,-26]) cylinder(r=2.5,h=100);
            translate([(brh-2.5),-(brh-2.5),-26]) cylinder(r=2.5,h=100);
        }
        
        //pivot bolt co
        translate([brh-1,0,0]) {
            rotate([0,90,0]) hull() {
                cylinder(r=m4_h_r,h=100);
                rotate([0,0,90]) translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,100]);
            }
        }
        translate([brh+8,0,0]) {
            rotate([0,90,0]) hull() {
                cylinder(r=5,h=100);
                rotate([0,0,90]) translate([-5*tan(22.5),-5,0]) cube([2*5*tan(22.5),2*5,100]);
                
                translate([0,0,2]) {
                    cylinder(r=(5+2),h=100);
                    rotate([0,0,90]) translate([-(5+2)*tan(22.5),-(5+2),0]) cube([2*(5+2)*tan(22.5),2*(5+2),100]);
                }
            }
        }
        
        translate([(brh+2+2),60-5,-26+8]) rotate([0,0,180]) bevel_co(4);
        mirror([1,0,0]) translate([(brh+2+2),60-5,24]) rotate([0,0,180]) bevel_co(4);
        
        //arduino co
        translate([(70-20),(60+8+12),-26-14+7.5]) rotate([0,0,90]) ard_micro_co();
        
        //wire routing co
        translate([brh+5+8,-20,-26+8+5]) rotate([-90,0,0]) hull() {
            cylinder(r=5,h=100);
            translate([-5*tan(22.5),-5,0]) cube([2*5*tan(22.5),2*5,100]);
        }
        
        //cutouts for bolts to mount to 8040 rail
        for(ixm=[0,1]) mirror([ixm,0,0]) for(iy=[-(60-12),(60+40+5-12)]) {
            translate([20,iy,-26-14]) m4_co(25,false,8);
        }
        
        //cutout to prevent fouling switches
        translate([-(brh+4),40,24+16-24]) cube([2*(brh+4),50,50]);
        for(ixm=[0,1]) mirror([ixm,0,0]) translate([(brh+4),60+8,24+16-24]) rotate([0,0,90]) bevel_co(4);
    }
}

module base_co() {
    //cam arm clearance co
    hull() {
        for(i=[0,1]) mirror([i,0,0]) {
            translate([brh+2,24+24-12+2,/*-26-8*/-26-14-1]) cylinder(r=2,h=100);
            translate([brh+2,24+24-12+2+24,/*-26-8*/-26-14-1]) cylinder(r=2,h=100);
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
    
    //central cutout for actuator movement, also acts as a stop (in theory)
    translate([0,0,0]) {
        hull() for(i=[0,1]) mirror([0,i,0]) for(j=[0,1]) mirror([j,0,0]) {
            rotate([0,-ms_p_a,0]) rotate([ms_p_a,0,0]) {
                translate([8-2,8-2,-100]) cylinder(r=2+0.25,h=100-10);
            }
        }
    }
    
    //access to side cam arms co
    mirror([1,0,0]) {
        hull() for(i=[0,1]) mirror([0,i,0]) {
            translate([brh+8+1,24+16-1,-26-14-1]) cylinder(r=1+0.25,h=14+1);
            translate([brh+8+8+8-1,24+16-1,-26-14-1]) cylinder(r=1+0.25,h=14+1);
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
}

module uprightcam_co() {
    //clearance for the bearing mount horn
    mirror([1,0,0]) hull() {
        for(i=[0,1]) mirror([0,i,0]) {
            translate([0,24-16,16]) rotate([0,90,0]) cylinder(r=8,h=brh+8+8+8);
            translate([0,24-16,16+50]) rotate([0,90,0]) cylinder(r=8,h=brh+8+8+8);
        }
    }
    
    //slot for cam arms
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
    
    //washer clearance for bolts that attach cam arms
    mirror([1,0,0]) {
        translate([brh+8,24,16]) rotate([0,0,90]) sep_co(8);
        translate([brh+8,-24,16]) rotate([0,0,90]) sep_co(8);
    
        translate([brh+8+8,24,16]) rotate([0,0,90]) sep_co(8);
        translate([brh+8+8,-24,16]) rotate([0,0,90]) sep_co(8);
    }
    
    //bolts for cam arms
    mirror([1,0,0]) for(i=[0,1]) mirror([0,i,0]) translate([brh-1,24,16]) {
        rotate([0,90,0]) hull() {
            cylinder(r=m4_h_r,h=1+24);
            rotate([0,0,90]) translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,1+24]);
        }
        rotate([0,90,0]) hull() {
            cylinder(r=4,h=1+4);
            rotate([0,0,90]) translate([-4*tan(22.5),-4,0]) cube([2*4*tan(22.5),2*4,1+4]);
        }
    }
    
    //endnuts for cam arms
    mirror([1,0,0]) for(i=[0,1]) mirror([0,i,0]) translate([brh+8+8+4,24,16]) rotate([0,0,90]) {
        m4_endnut_b_co();
    }
    
    //bolt for pivot
    mirror([1,0,0]) translate([brh-1,0,0]) {
        rotate([0,90,0]) hull() {
            cylinder(r=m4_h_r,h=1+32);
            rotate([0,0,90]) translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,1+32]);
        }
    }
    
    //hole to access pivot bolt (from beyond the cam arm slot)
    mirror([1,0,0]) translate([brh+8,0,0]) rotate([0,90,0]) hull() {
        cylinder(r=5+2,h=100);
        rotate([0,0,90]) translate([-(5+2)*tan(22.5),-(5+2),0]) cube([2*(5+2)*tan(22.5),2*(5+2),100]);
    }
    
    //prevent overhanging material above pivot bolt hole
    mirror([1,0,0]) hull() {
        translate([brh+8,0,0]) rotate([0,90,0]) cylinder(r=8,h=8+8);
        translate([brh+8,0,8]) rotate([0,90,0]) cylinder(r=8,h=8+8);
        translate([brh+8,0,0]) rotate([0,90,0]) cylinder(r=8+8,h=8);
        translate([brh+8,0,8]) rotate([0,90,0]) cylinder(r=8+8,h=8);
    }
    
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
    
    //pivot bolt co
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
    
    base_co();
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
        
        //upright mounting bolt
        for(j=[0,1]) mirror([0,j,0]) {
            translate([-(brh+16),48+8,-26]) m4_co(25,false,8+4);
        }
        
        mirror([1,0,0]) rotate([0,0,0]) {
            translate([brh,0,0]) rotate([0,0,90]) sep_co(8+12+2);
        }
        
        uprightcam_co();
    
        base_co();
    }
}