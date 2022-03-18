module thrust_box_lid() {
    difference() {
        b_h = 80-26-14+5+15;
        
        union() {
            box_lid(70,70,60,60+40+5);
            
            translate([0,0,-(80-26-14)]) {
                for(i=[0,1]) mirror([i,0,0]) hull() {
                    translate([12+5+2.5,0,0]) rotate([0,90,0]) cylinder(r=b_h,h=5,$fn=$fn*2);
                    translate([12+5,0,0]) rotate([0,90,0]) cylinder(r=b_h-2.5,h=5+5,$fn=$fn*2);
                }
                for(j=[0,1]) mirror([0,j,0]) rotate([ms_p_a+atan(20/b_h),0,0]) hull() {
                    translate([-(12+5+7.5),-20,0]) cube([2*(12+5+7.5),20,b_h]);
                    translate([-(12+5+10),-20,0]) cube([2*(12+5+10),20,b_h-2.5]);
                }
            }
        }
        
        translate([0,0,-(80-26-14)]) {
            for(j=[0,1]) mirror([0,j,0]) {
                hull() for(i=[0,1]) mirror([i,0,0]) {
                    translate([12,0,0]) rotate([ms_p_a+atan(20/b_h),0,0]) cylinder(r=5,h=b_h);
                }
                hull() for(i=[0,1]) mirror([i,0,0]) {
                    translate([12,0,0]) rotate([ms_p_a+atan(20/b_h),0,0]) translate([0,0,b_h-2.5]) cylinder(r1=5,r2=5+20,h=20);
                }
            }
            translate([-(12+5),0,0]) scale([1,tan(ms_p_a+atan(20/b_h)),1]) rotate([45,0,0]) cube([2*(12+5),100,100]);
            
            hull() for(j=[0,1]) mirror([0,j,0]) for(i=[0,1]) mirror([i,0,0]) {
                translate([12,0,0]) rotate([ms_p_a+atan(20/b_h),0,0]) translate([0,0,(b_h-5)]) rotate([-atan(20/b_h),0,0]) translate([0,0,-(b_h-5)]) cylinder(r=5,h=b_h);
            }
        }
        
        translate([-100,-100,-200]) cube([200,200,200]);
        
        //central co
        *hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([(17.5-2.5),(25-2.5),-1]) cylinder(r=2.5,h=50);
        }
        *hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([(17.5-2.5),(25-2.5),2.5]) cylinder(r=2.5,h=50);
            translate([(17.5-2.5),(25-2.5),5]) cylinder(r=5,h=50);
        }
        
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
            
            for(j=[-(60-7.5)]) {
                translate([(70-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
            
            *for(j=[12.5,-12.5]) {
                translate([(60-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_i_co();
                }
            }
        }
        
        for(i=[-1:0]) {
            translate([i*30,-60-15,0]) switch_recess();
            translate([i*30,-60-15,2.5]) switch_co();
        }
    }

    for(i=[-1:1]) {
        translate([i*30-15,-60-15,0]) switch_guard();
    }
}