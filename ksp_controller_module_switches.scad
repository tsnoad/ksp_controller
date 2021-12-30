module switch_box_lid() {
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
        
        for(j=[-1.5:1.5]) for(i=[-1:1]) {
            translate([i*30,-(40+5)/2+(j*37.5)-5,0]) switch_recess();
            translate([i*30,-(40+5)/2+(j*37.5)-5,2.5]) switch_co();
        }
    }

    for(j=[-1.5:1.5]) for(i=[-1:2]) {
        translate([i*30-15,-(40+5)/2+(j*37.5)-5,0]) switch_guard();
    }
}