module att_box_frame() {
    difference() {
        box_frame(60,60,60,60+40+5,64);
        
        //pivot main cavity co
        translate([0,0,6.85+10]) {
            hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                translate([(brh-2.5),(brh+8+8-2.5),0]) cylinder(r=2.5,h=100);
            }
            for(i=[0,1]) mirror([0,i,0]) hull() for(j=[0,1]) mirror([j,0,0]) {
                translate([(brh-2.5),(brh+8+8-2.5),0]) cylinder(r=2.5,h=100);
                translate([(brh+10-2.5),(20+20-2.5),0]) cylinder(r=2.5,h=100);
                translate([(brh+10-2.5),(20+2.5),0]) cylinder(r=2.5,h=100);
                translate([(brh-2.5),(20-10+2.5),0]) cylinder(r=2.5,h=100);
            }
            //bevels
            for(i=[0,1]) mirror([0,i,0]) for(j=[0,1]) mirror([j,0,0]) {
                translate([(brh),(20-10+2.5-2.5*tan(22.5)),0]) mirror([1,0,0]) bevel_co45(r=2.5);
            }
        }
        
        //central cutout
        *hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([(20-2.5),(20-2.5),-1]) cylinder(r=2.5,h=100);
        }
        
        //central cutout for actuator movement, also acts as a stop
        translate([0,0,64-16]) {
            hull() for(i=[0,1]) mirror([0,i,0]) for(j=[0,1]) mirror([j,0,0]) {
                rotate([0,-ms_p_a,0]) rotate([ms_p_a,0,0]) {
                    translate([8-2,8-2,-100]) cylinder(r=2+0.25,h=100-10);
                }
            }
        }
        
        //bearing clearance co
        *intersection() {
            translate([0,0,64-16]) rotate([0,0,90]) {
                translate([0,brh,0]) sep_co(8+12);
                translate([0,-brh,0]) sep_co(8+12);
            }
            translate([-100,-100,10+6.85]) cube([200,200,100]);
        }
        
        //pivot bolt co
        translate([0,0,64-16]) { 
            for(i=[0,1]) mirror([i,0,0]) translate([brh+8,0,0]) rotate([0,90,0]) hull() {
                cylinder(r=5+0.25,h=50);
                rotate([0,0,90]) translate([-(5+0.25)*tan(22.5),-(5+0.25),0]) cube([2*(5+0.25)*tan(22.5),2*(5+0.25),50]);
            }
            for(i=[1,3]) rotate([0,0,i*90]) {
                translate([0,brh-10,0]) rotate([-90,0,0]) hull() {
                    cylinder(r=2+0.25,h=50);
                    translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),50]);
                }
            }
        }
        
        //front bolt co
        *for(i=[0,1]) mirror([i,0,0]) {
            for(j=[0,1]) mirror([0,j,0]) {
                translate([(60-7.5),12.5,0]) front_nut_co();
            }
            translate([(60-7.5),-(60-7.5),0]) front_nut_co();
        }
        
        //switch cavity co
        *hull() for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-15-2.5),-(60+20-20+2.5),-1]) cylinder(r=2.5,h=100);
            translate([(60-5-2.5),-(60+20-10+2.5),-1]) cylinder(r=2.5,h=100);
            
            translate([(60-5-2.5),-(60+20+5-2.5),-1]) cylinder(r=2.5,h=100);
            translate([(60-20-2.5),-(60+20+20-2.5),-1]) cylinder(r=2.5,h=100);
        }
        
        //spring cavity co
        for(i=[0:3]) rotate([0,0,i*90]) {
            translate([30,0,-1]) cylinder(r=m3_v_r,h=50);
            translate([30,0,-50+5-2]) intersection() {
                cylinder(r=2.5+0.5,h=50);
                union() {
                    translate([-m3_v_r,-10,0]) cube([2*m3_v_r,20,50]);
                    translate([-10,-10,0]) cube([20,20,50-0.2]);
                }
            }
            
            /*difference() {
                translate([0,0,5+5]) rotate([0,90,0]) cylinder(r=3.75,h=30-(m3_v_r+1.6));
                //translate([30,0,-1]) cylinder(r=m3_v_r+1.6,h=50);
            }*/
            
            /*rotate([0,0,45]) {
                translate([50,0,-1]) cylinder(r=m3_v_r,h=50);
                hull() {
                    translate([0,0,5]) cylinder(r=5,h=50);
                    translate([0,5*sqrt(2),5]) cylinder(r=5,h=50);
                    translate([0,-5*sqrt(2),5]) cylinder(r=5,h=50);
                    
                    translate([50,0,5]) cylinder(r=5,h=50);
                    *translate([50-(m3_v_r+1.6)-1.25,5-1.25,5]) cylinder(r=1.25,h=50);
                    *translate([50-(m3_v_r+1.6)-1.25,-(5-1.25),5]) cylinder(r=1.25,h=50);
                }
                *hull() {
                    translate([0,0,5+5]) cylinder(r=5,h=50);
                    translate([50,0,5+5]) cylinder(r=5,h=50);
                }
            }*/
            
            *for(j=[0,1]) mirror([0,j,0]) translate([-20,-5,5]) bevel_co(2.5);
            
            hull() {
                translate([0,0,5]) cylinder(r=5,h=50);
                translate([30-(m3_v_r+1.6)-1.25,5-1.25,5]) cylinder(r=1.25,h=50);
                translate([30-(m3_v_r+1.6)-1.25,-(5-1.25),5]) cylinder(r=1.25,h=50);
            }
            hull() {
                translate([0,0,5+2.5]) cylinder(r=5,h=50);
                translate([30,0,5+2.5]) cylinder(r=5,h=50);
            }
        }
        
        //ms bolt co
        *ms_spacing() ms_co_spacing() {
            translate([0,0,-1]) cylinder(r=m3_v_r,h=50);
            translate([0,0,-50+10+6.85-2]) intersection() {
                cylinder(r=2.5+0.5,h=50);
                union() {
                    translate([-m3_v_r,-10,0]) cube([2*m3_v_r,20,50]);
                    translate([-10,-10,0]) cube([20,20,50-0.2]);
                }
            }
        }
        
        *for(i=[0,1]) mirror([i,0,0]) {
            for(j=[0,1]) mirror([0,j,0]) {
                translate([25,0,10+6.85+6]) rotate([90,0,0]) hull() {
                    cylinder(r=6,h=100);
                    translate([-6*tan(22.5),-6,0]) cube([2*6*tan(22.5),2*6,100]);
                }
            }
            translate([25,-100,10+6]) rotate([90,0,0]) hull() {
                cylinder(r=6,h=100);
                translate([-6*tan(22.5),-6,0]) cube([2*6*tan(22.5),2*6,100]);
            }
        }
    }
}

module att_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
        //central co
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(25-2.5),(25-2.5),-1]) cylinder(r=2.5,h=50);
        }
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(25-2.5),(25-2.5),2.5]) cylinder(r=2.5,h=50);
            translate([(25-2.5),(25-2.5),5]) cylinder(r=5,h=50);
        }
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(60-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            
            for(j=[12.5,-12.5,-(60-7.5)]) {
                translate([(60-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
        }
        
        for(i=[-1:1]) {
            translate([i*30,-60-15,0]) switch_recess();
            translate([i*30,-60-15,2.5]) switch_co();
        }
    }

    for(i=[-1:2]) {
        translate([i*30-15,-60-15,0]) switch_guard();
    }
}