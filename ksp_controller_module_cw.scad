sw_w = 24+0.5;
sw_h = 18+0.5;
sw_cr = 8+0.25;

module cw_box_lid() {
    difference() {
        box_lid(70,70,60,60+40+5);
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(70-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(70-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            for(j=[-(40+5)/2]) {
                translate([(70-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
        }
        
        translate([0,20-(40+5)/2,0]) for(mx=[-1.5,-0.5,0.5,1.5]) for(my=[-2,-1,0,1,2]) translate([mx*(sw_w+1.6),my*(sw_h+2.4),0]) {
            rect_switch_co();
        }
            
        translate([0,20-(40+5)/2,0]) hull() for(mx_1=[0,1]) mirror([mx_1,0,0]) for(my_1=[0,1]) mirror([0,my_1,0]) {
            translate([1.5*(sw_w+1.6),2*(sw_h+2.4),0]) {
                translate([sw_w/2-0.25,sw_h/2-0.25,2.5+1.25]) cylinder(r1=0.25,r2=0.25+20,h=20);
            }
        }
        
        for(i=[-1]) {
            translate([i*30,-60-20,0]) switch_recess();
            translate([i*30,-60-20,2.5]) switch_co();
        }
    }

    for(i=[-1:0]) {
        translate([i*30-15,-60-20,0]) switch_guard();
    }
}

module cw_box_frame() {
    difference() {
        *box_frame(70,70,60,60+40+5,64);
        union() {
            for(ixm=[0,1]) mirror([ixm,0,0]) {
                *hull() for(iy=[(60-5),(60-5-15)]) {
                    translate([70-5,iy,0]) cylinder(r=5,64);
                    translate([70-5-5,iy,0]) cylinder(r=5,64);
                }
                
                *hull() for(iy=[-(40+5)/2+7.5,-(40+5)/2-7.5]) {
                    translate([70-5,iy,0]) cylinder(r=5,64);
                    translate([70-5-5,iy,0]) cylinder(r=5,64);
                }
                
                *hull() for(iy=[-(60+40+5-5-15),-(60+40+5-5)]) {
                    translate([70-5,iy,0]) cylinder(r=5,64);
                    translate([70-5-5,iy,0]) cylinder(r=5,64);
                }
                
                hull() for(iy=[(60-5),-(60+40+5-5)]) {
                    translate([70-5,iy,0]) cylinder(r=5,64);
                    translate([70-5-5,iy,0]) cylinder(r=5,64);
                }
            }
            hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
                for(iy=[(60-5),-(60+40+5-5)]) {
                    translate([70-5,iy,0]) cylinder(r=5,2.5);
                }
            }
            
            hull() for(ix=[(70-5),(70-5)-50]) for(iy=[-(60+40+5-5)+40,-(60+40+5-5)]) {
                translate([ix,iy,0]) cylinder(r=5,7.5);
            }
            hull() for(ix=[(70-5),(70-5)-50]) for(iy=[-(60+40+5-5)]) {
                translate([ix,iy,0]) cylinder(r=5,20);
            }
        }
        
        mc_o = 12;
    
        //main cavity co
        *difference() {
            translate([0,0,2.5]) {
                hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([70-5-2.5-mc_o,60-5-2.5,0]) cylinder(r=2.5,100);
                    translate([70-5-2.5-mc_o,-((60+40+5)-5-2.5),0]) cylinder(r=2.5,100);
                }
                for(ixm=[0,1]) mirror([ixm,0,0]) translate([70-5-mc_o,60-5-mc_o,0]) rotate([0,0,180]) bevel_co(r=7.5);
                
                hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([70-5-2.5,60-5-2.5-mc_o,0]) cylinder(r=2.5,100);
                    translate([70-5-2.5,-((40+5)/2-mc_o),0]) cylinder(r=2.5,100);
                }
                for(ixm=[0,1]) mirror([ixm,0,0]) translate([70-5-mc_o,-((40+5)/2+2.5-mc_o),0]) mirror([0,1,0]) rotate([0,0,180]) bevel_co(r=7.5);
                for(ixm=[0,1]) mirror([ixm,0,0]) translate([70-5-mc_o,-((40+5)/2-2.5+mc_o),0]) rotate([0,0,180]) bevel_co(r=7.5);
                
                hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([70-5-2.5,-((60+40+5)-5-2.5-mc_o),0]) cylinder(r=2.5,100);
                    translate([70-5-2.5,-((40+5)/2+mc_o),0]) cylinder(r=2.5,100);
                }
                for(ixm=[0,1]) mirror([ixm,0,0]) translate([70-5-mc_o,-((60+40+5)-5-mc_o),0]) mirror([0,1,0]) rotate([0,0,180]) bevel_co(r=7.5);
            }
            hull() {
                translate([(70-7.5),-(60+40+5-7.5),0]) cylinder(r=7.5,h=7.5);
                translate([(70-7.5),-(60+40+5)+40,0]) cylinder(r=7.5,h=7.5);
                translate([(70)-40-15,-(60+40+5-7.5),0]) cylinder(r=7.5,h=7.5);
                translate([(70)-40-15,-(60+40+5)+40,0]) cylinder(r=7.5,h=7.5);
            }
        }
        
        hull() translate([0,60-(60+40+50)/4,0]) for(ixm=[0,1]) mirror([ixm,0,0]) for(iy=[((60+40+50)/4-20),-((60+40+50)/4)]) {
            translate([70-25,iy,-1]) cylinder(r=5,100);
        }
        hull() translate([0,60-(60+40+50)*3/4,0]) for(ixm=[0,1]) mirror([ixm,0,0]) for(iy=[((60+40+50)/4-20),-((60+40+50)/4)]) {
            translate([(70-25)*ixm,iy,-1]) cylinder(r=5,100);
        }
        
            
        //front bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            for(j=[(60-7.5),-(40+5)/2,-(60+40+5-7.5)]) {
                *translate([(70-7.5),j,0]) front_nut_co();
                translate([(70-7.5),j,64-30])  cylinder(r=m4_v_r,h=50);
            }
        }
        
        //arduino co
        translate([70-40,-60-40-5+5,7.5]) ard_micro_co();
    }
}
    
module rect_switch_co() {
    translate([0,0,-1]) cylinder(r=sw_cr,h=20);
    
    for(mx_1=[0,1]) mirror([mx_1,0,0]) for(my_1=[0,1]) mirror([0,my_1,0]) hull() {
        translate([9,9,-1]) cylinder(r=0.5,h=1+1);
        translate([9-2.5,9,-1]) cylinder(r=0.5,h=1+1);
        translate([9,9-2.5,-1]) cylinder(r=0.5,h=1+1);
    }
    
    hull() for(mx_1=[0,1]) mirror([mx_1,0,0]) for(my_1=[0,1]) mirror([0,my_1,0]) {
        translate([sw_w/2-0.25,sw_h/2-0.25,2.5]) cylinder(r=0.25,h=20);
    }
}