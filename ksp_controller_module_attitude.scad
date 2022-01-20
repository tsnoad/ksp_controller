module att_box_lid() {
    difference() {
        box_lid(70,70,60,60+40+5);
        
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
            
            translate([(50-7.5),0,0]) {
                box_lid_bolt_i2_co([10,-10]);
                for(j=[10,-10]) {
                    translate([0,j,-1]) cylinder(r=m4_v_r,h=50);
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