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

module cw_box_frame() difference() {
    f_h = 80;
    
    translate([0,0,80-f_h]) union() {
        box_frame(70,70,60,60+40+5,5);
        
        box_frame(70,70,-60-8+5,60+40+5,7.5);
        
        difference() {
            box_frame(70,70,60,60+40+5,f_h);
            translate([-(70-5),-(60-5)-(40+5),-1]) cube([2*(70-5),2*(60-5)+40+5,100]);
        }
        
        intersection() {
            box_frame(70,70,60,60+40+5,f_h);
            
            union() {
                for(iy=[60-7.5]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([70-7.5,iy,0]) hull() {
                        cylinder(r=7.5,h=f_h);
                        
                        translate([20,-20,0]) cylinder(r=7.5,h=f_h);
                        translate([-20,20,0]) cylinder(r=7.5,h=f_h);
                        
                        translate([20,20,0]) cylinder(r=7.5,h=f_h);
                    }
                }
                for(iy=[(60+40+5-7.5)]) mirror([0,1,0]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([70-7.5,iy,0]) hull() {
                        cylinder(r=7.5,h=f_h);
                        
                        translate([20,-20,0]) cylinder(r=7.5,h=f_h);
                        translate([-20,20,0]) cylinder(r=7.5,h=f_h);
                        
                        translate([20,20,0]) cylinder(r=7.5,h=f_h);
                    }
                }
                for(iy=[-(40+5)/2]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([70-7.5,iy,0]) hull() {
                        cylinder(r=7.5,h=f_h);
                        
                        translate([20,-20,0]) cylinder(r=7.5,h=f_h);
                        translate([20,20,0]) cylinder(r=7.5,h=f_h);
                    }
                }
                //positive area for arduino
                for(ixm=[0,1]) mirror([ixm,0,0]) hull() {
                    translate([(70-5),-(60+40+5-5),0]) cylinder(r=5,h=7.5+10);
                    translate([(70-5),-(60+8),0]) cylinder(r=5,h=7.5+10);
                
                    translate([(70-5-2.5),-(60+40+5-5),0]) cylinder(r=5,h=7.5+10);
                    translate([(70-5-2.5),-(60+8),0]) cylinder(r=5,h=7.5+10);
                }
                //positive area for mounting bolts
                hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([20,-(60+40+5-5-4.5),0]) cylinder(r=5,h=16);
                    translate([20,-(60+40+5-5),0]) cylinder(r=5,h=16);
                }
                //positive area for mounting bolts
                mirror([0,1,0]) hull() for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([40,-(60-5-4.5),0]) cylinder(r=5,h=16);
                    translate([40,-(60-5),0]) cylinder(r=5,h=16);
                }
            }
        }
    }
    
    //cutout to remove material on back
    hull() for(i=[0,1]) mirror([i,0,0]) {
        for(iy=[-(61-5),(43.5-5)]) {
            translate([40-5,iy,-1]) cylinder(r=5,h=100);
        }
    }
    
    translate([0,0,80-f_h+26+14]) mirror([0,1,0]) {
        //arduino co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(70-5-5-2.5),(60+8+14),-26-14+7.5]) rotate([0,0,90]) ard_micro_co();
        }
        //cutouts for bolts to mount to 8040 rail
        for(ix=[-20,0,20]) for(iy=[(60+40+5-5-4)]) {
            translate([ix,iy,-26-14]) m4_co(25,false,16);
        }
        for(ix=[-40,-20,0,20,40]) for(iy=[-(60-5-4)]) {
            translate([ix,iy,-26-14]) m4_co(25,false,16);
        }
    }
    
    
    //front bolt co
    for(i=[0,1]) mirror([i,0,0]) {
        for(j=[(60-7.5),-(40+5)/2,-(60+40+5-7.5)]) {
            //use hex nuts for front bolt closure
            //translate([(70-7.5),j,-1]) cylinder(r=m4_v_r,h=100);
            //translate([(70-7.5),j,80]) m4_co(25,false,8,8,true,true);
                    
            //use insert nuts
            translate([(70-7.5),j,80]) {
                translate([0,0,-25]) cylinder(r=m4_v_r,h=100);
                translate([0,0,-8-0.5]) cylinder(r=(5.8+0.3+0.2)/2,h=50);
                translate([0,0,-0.5]) cylinder(r1=(5.8+0.3+0.2)/2,r2=(5.8+0.3+0.2)/2+2,h=2);
            }
        }
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