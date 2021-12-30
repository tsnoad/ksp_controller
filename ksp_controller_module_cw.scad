module cw_box_lid() {
    difference() {
        box_lid(70,70,60,60+40+5);
        
        sw_w = 24+0.25;
        sw_h = 18+0.25;
        sw_cr = 8+0.25;
        
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
            translate([0,0,-1]) cylinder(r=sw_cr,h=20);
            
            for(mx_1=[0,1]) mirror([mx_1,0,0]) for(my_1=[0,1]) mirror([0,my_1,0]) hull() {
                translate([8,8,-1]) cylinder(r=0.5,h=1+1);
                translate([8-2,8,-1]) cylinder(r=0.5,h=1+1);
                translate([8,8-2,-1]) cylinder(r=0.5,h=1+1);
            }
            
            hull() for(mx_1=[0,1]) mirror([mx_1,0,0]) for(my_1=[0,1]) mirror([0,my_1,0]) {
                translate([sw_w/2-0.25,sw_h/2-0.25,2.5]) cylinder(r=0.25,h=20);
            }
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