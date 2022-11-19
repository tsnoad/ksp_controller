//roll pulley
module fdai_roll_pulley() translate([0,(60+2+2+8+27.5-2.5+10+8+10)+12,0]) rotate([90,0,0]) {
    difference() {
        union() {
            translate([0,0,12-(3+14)]) gt2_pulley(48,3+14);
            
            teeth = 48;
            pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
            
            hull() {
                translate([0,0,12-0.5]) cylinder(r=pulley_OD/2+0.5,h=0.5);
                translate([0,0,12-1]) cylinder(r=pulley_OD/2,h=1);
            }
            hull() {
                translate([0,0,12-1-7-0.5]) cylinder(r=pulley_OD/2+0.5,h=0.01);
                translate([0,0,12-1-7-1]) cylinder(r=pulley_OD/2,h=1);
            }
            hull() {
                translate([0,0,12-1-7-1-7-1]) cylinder(r=pulley_OD/2+0.5,h=0.5);
                translate([0,0,12-1-7-1-7-1]) cylinder(r=pulley_OD/2,h=1);
            }
            
            cylinder(r=(10-0.25-1),h=12+10+8+10-0.5);
            
            hull() {
                cylinder(r=(10-0.15),h=12+5);
                cylinder(r=(10-0.15)-2,h=12+5+2);
            }
            hull() {
                translate([0,0,12+10+8+10-5]) cylinder(r=(10-0.15),h=5-0.5);
                translate([0,0,12+10+8+10-5-2]) cylinder(r=(10-0.15)-2,h=2+5-0.5);
            }
        }
        translate([0,0,-1]) cylinder(r=(2.5+0.25),h=50);
        for(i=[0:2]) rotate([0,0,i*120+90]) {
            translate([10-2,0,12]) {
                translate([0,0,-12-1]) cylinder(r=m4_v_r,h=50);
                hull() {
                    cylinder(r=m4_v_r,h=50);
                    translate([50,0,0]) cylinder(r=m4_v_r,h=50);
                }
            }
            
            translate([10-2,0,12+10+8+10+5]) rotate([0,0,90]) m4_co(45,false,0,45-6,false,true);
        }
    }
}

//roll drive belt
module fdai_roll_drive_belt() rotate([0,45,0]) translate([0,(60+2+2+8+27.5-2.5+10+8+10)+1.5,0]) rotate([-90,0,0]) difference() {
    //208 teeth
    hull() {
        translate([0,71.272,0]) cylinder(r=10.2/2+1,h=6);
        translate([0,0,0]) cylinder(r=30.6/2+1,h=6);
    }
    hull() {
        translate([0,71.272,-1]) cylinder(r=10.2/2,h=6+2);
        translate([0,0,-1]) cylinder(r=30.6/2,h=6+2);
    }
}

//roll sensor belt
module fdai_roll_sensor_belt() rotate([0,-135,0]) translate([0,(60+2+2+8+27.5-2.5+10+8+10)+1.5+7+1,0]) rotate([-90,0,0]) difference() {
    //208 teeth
    hull() {
        translate([0,56,0]) cylinder(r=30.6/2+1,h=6);
        translate([0,0,0]) cylinder(r=30.6/2+1,h=6);
    }
    hull() {
        translate([0,56,-1]) cylinder(r=30.6/2,h=6+2);
        translate([0,0,-1]) cylinder(r=30.6/2,h=6+2);
    }
}

//roll motor
module fdai_roll_motor() rotate([0,45,0]) translate([0,(60+2+2+8+27.5-2.5+10+8+10)+1.5+7+1+7-2+4,0]) rotate([-90,0,0]) {
    translate([0,71.272,0]) {
        mirror([0,0,1]) motor();
    }
}

//roll bearings
module fdai_roll_bearings() translate([0,60+2+2+8+27.5-2.5,0]) rotate([-90,0,0]) {
    difference() {
        union() {
            cylinder(r=35/2,h=10);
            translate([0,0,10+8]) cylinder(r=35/2,h=10);
        }
        translate([0,0,-1]) cylinder(r=20/2,h=100);
    }
}

//roll sensor pulley
module fdai_roll_sensor_pulley() rotate([0,-135,0]) translate([0,(60+2+2+8+27.5-2.5+10+8+2.5)-1+4,0]) rotate([-90,0,0]) {
    translate([0,56,0]) {
        difference() {
            union() {
                translate([0,0,0]) gt2_pulley(48,-(4-1)-2.5+10+1+7+1+7+1);
                        
                teeth = 48;
                pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
                
                hull() {
                    cylinder(r=pulley_OD/2+0.5,h=-(4-1)-2.5+10+1+7+0.5);
                    cylinder(r=pulley_OD/2,h=-(4-1)-2.5+10+1+7+1);
                }
                
                translate([0,0,-(4-1)-2.5+10+1+7+1+7]) hull() {
                    translate([0,0,0.5]) cylinder(r=pulley_OD/2+0.5,h=0.5);
                    cylinder(r=pulley_OD/2,h=1);
                }
            }
        }
    }
}