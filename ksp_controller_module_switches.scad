module switch_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
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
            
            *for(j=[12.5,-12.5,-(60-7.5)]) {
                translate([(60-7.5),j,0]) {
                    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                    box_lid_bolt_co();
                }
            }
        }
        
        for(j=[-60-15+0,-60-15+35,-60-15+70,-60-15+105]) for(i=[-1:1]) {
            translate([i*30,j,0]) switch_recess();
            translate([i*30,j,2.5]) switch_co();
        }
    }

    for(j=[-60-15+0,-60-15+35,-60-15+70,-60-15+105]) for(i=[-1:2]) {
        translate([i*30-15,j,0]) switch_guard();
    }
}