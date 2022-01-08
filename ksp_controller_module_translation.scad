module trans_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(70,70,60,60+40+5);
        
        //central co
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(30-2.5),(30-2.5),-1]) cylinder(r=2.5,h=50);
        }
        hull() for(i=[0:3]) rotate([0,0,i*90]) {
            translate([(30-2.5),(30-2.5),2.5]) cylinder(r=2.5,h=50);
            translate([(30-2.5),(30-2.5),5]) cylinder(r=5,h=50);
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
        
        for(i=[-1:0]) {
            translate([i*30,-60-15,0]) switch_recess();
            translate([i*30,-60-15,2.5]) switch_co();
        }
    }
    
    ag_or = 70-7.5-7.5-1.25-2.5;
    ag_h = 35;
    
    //actuator guard
    for(i=[0:3]) rotate([0,0,i*90]) {
        //horiz ribs
        hull() for(j=[0,1]) mirror([0,j,0]) translate([ag_or,ag_or-15,ag_h]) {
            translate([0,0,0]) cylinder(r=2.5/2,h=10);
            translate([0,0,2.5]) cylinder(r=7.5/2,h=5);
        }
        //base ribs
        hull() for(j=[0,1]) mirror([0,j,0]) translate([ag_or,ag_or-15,0]) {
            translate([0,0,0]) cylinder(r=7.5/2,h=5);
            translate([0,0,0]) cylinder(r=2.5/2,h=7.5);
        }
        //wall
        hull() for(j=[0,1]) mirror([0,j,0]) translate([ag_or,ag_or-15,0]) {
            translate([0,0,0]) cylinder(r=2.5/2,h=ag_h);
        }
        
        //corner ribs
        translate([ag_or-15,ag_or-15,0]) intersection() {
            union() {
                rotate_extrude() hull() {
                    translate([15-7.5/2,ag_h+2.5]) square([7.5,5]);
                    translate([15-2.5/2,ag_h]) square([2.5,10]);
                }
                rotate_extrude() hull() {
                    translate([15-2.5/2,0]) square([2.5,7.5]);
                    translate([15-7.5/2,0]) square([7.5,5]);
                }
                rotate_extrude() {
                    translate([15-2.5/2,0]) square([2.5,ag_h]);
                }
            }
            translate([0,0,-50]) cube([50,50,150]);
        }
    }
    
    //vertical ribs
    for(i=[0,2]) rotate([0,0,i*90]) {
        for(j=[0,1]) mirror([0,j,0]) {
            translate([ag_or,ag_or-15-7.5,0]) difference() {
                translate([-7.5/2,-15/2,0]) cube([7.5,15,ag_h+7.5/2]);
                for(m=[0,1]) mirror([m,0,0]) for(k=[0,1]) mirror([0,k,0]) hull() {
                    for(l=[7+2.5,ag_h-2.5]) {
                        translate([2.5/2,15/2,l]) rotate([0,90,0]) cylinder(r=2.5,h=20);
                        translate([7.5/2,15/2,l]) rotate([0,90,0]) cylinder(r=5,h=20);
                    }
                }
            }
        }
    }

    for(i=[-1:1]) {
        translate([i*30-15,-60-15,0]) switch_guard();
    }
}
