module thrust_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(70,70,60,60+40+5);
        
        //central co
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([(17.5-2.5),(25-2.5),-1]) cylinder(r=2.5,h=50);
        }
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
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
            
            for(j=[12.5,-12.5]) {
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