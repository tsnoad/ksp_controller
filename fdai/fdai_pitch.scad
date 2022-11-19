module fdai_pitch_yoke() difference() {
    m3_h_r = (3+0.2)/2;
    
    a_b_r = 60 + 2 + 2;
    
    union() {
        translate([-8-a_b_r,0,0]) rotate([0,90,0]) hull() {
            translate([(20-12),0,0]) cylinder(r=12,h=2*(a_b_r+8));
            translate([-(20-12),0,0]) cylinder(r=12,h=2*(a_b_r+8));
            rotate([0,0,90]) translate([-12*tan(22.5),-20,0]) cube([2*12*tan(22.5),2*20,2*(a_b_r+8)]);
        }
            
        hull() for(i=[0,1]) mirror([i,0,0]) {
            translate([(a_b_r+8-4),0,-20]) cylinder(r=4,h=40);
            //translate([(a_b_r+8-4),(a_b_r+8-4)*tan(22.5),-12]) cylinder(r=4,h=24);
            //translate([(a_b_r+8-4)*tan(22.5),(a_b_r+8-4),-12]) cylinder(r=4,h=24);
            
            translate([(a_b_r+8-4),(a_b_r+8-4)+27.5,-20]) cylinder(r=4,h=40);
        }
        intersection() {
            hull() {
                translate([-(a_b_r+8),(a_b_r+8+27.5)-40,-20]) cube([10,40,40+25/2]);
                translate([-(a_b_r+8),(a_b_r+8+27.5)-40-20,-20]) cube([10,40+20,40+25/2-20]);
                translate([-(a_b_r+8),(a_b_r+8+27.5)-40,-20]) cube([10+20,40,40+25/2-20]);
            }
            hull() {
                translate([-(a_b_r+8-4),(a_b_r+8-4)+27.5,-20]) cylinder(r=4,h=100);
                translate([-(a_b_r+8-4),(a_b_r+8-4)+27.5-100,-20]) cylinder(r=4,h=100);
                translate([-(a_b_r+8-4)+100,(a_b_r+8-4)+27.5,-20]) cylinder(r=4,h=100);
                translate([-(a_b_r+8-4)+100,(a_b_r+8-4)+27.5-100,-20]) cylinder(r=4,h=100);
            }
        }
    }
    
    //cut out empty space under motor
    translate([-(a_b_r+8-4-8),(a_b_r+4+8),-25]) hull() {
        cylinder(r=4,h=50);
        translate([0,6,0]) cylinder(r=4,h=50);
        translate([36,0,0]) cylinder(r=4,h=50);
        translate([36,6,0]) cylinder(r=4,h=50);
    }
    
    //cut out empty space opposite motor
    translate([(a_b_r+8-4)-8,(a_b_r+8-4)*tan(22.5)+8*tan(45)+8*sqrt(2),-25]) hull() {
        cylinder(r=4,h=50);
        translate([0,24+12,0]) cylinder(r=4,h=50);
        translate([-24,24,0]) cylinder(r=4,h=50);
        translate([-24,24+12,0]) cylinder(r=4,h=50);
    }
    
    //cut out center of yoke
    hull() for(i=[0,1]) mirror([i,0,0]) {
        translate([(a_b_r-4),-100,-25]) cylinder(r=4,h=50);
        translate([(a_b_r-4),(a_b_r-4)*tan(22.5),-25]) cylinder(r=4,h=50);
        
        translate([(a_b_r-4)*tan(22.5),(a_b_r-4),-25]) cylinder(r=4,h=50);
    }
    
    *translate([(50+4+16),0,0]) rotate([0,90,0]) rotate([0,0,90]) m4_co(25,true,8,8);
    *translate([(50+4+16),0,0]) rotate([0,0,90]) sep_co(50);
    
    *translate([0,(50+4),0]) rotate([-90,0,0]) rotate([0,0,0]) m4_co(25,true,8,8);
    *translate([0,(50+4),0]) rotate([0,0,0]) sep_co(16);
    
    //slipring body
    rotate([0,90,0]) hull() {
        cylinder(r=(6.25+0.25),h=100);
        rotate([0,0,90]) translate([-(6.25+0.25)*tan(22.5),-(6.25+0.25),0]) cube([2*(6.25+0.25)*tan(22.5),2*(6.25+0.25),100]);
    }
    
    //slipring flange
    rotate([0,90,0]) {
        cylinder(r=(12+0.25),h=a_b_r+2);
        rotate([0,0,90]) translate([-50+(12+0.25)*sin(45),-25,0]) cube([50,50,a_b_r+2]);
    }
    
    //slipring bolts
    for(i=[0:2]) rotate([i*120+60,0,0]) translate([0,-9,0]) rotate([-i*120-60,0,0]) rotate([0,90,0]) hull() {
        cylinder(r=m3_h_r,h=100);
        rotate([0,0,90]) translate([-m3_h_r*tan(22.5),-m3_h_r,0]) cube([2*m3_h_r*tan(22.5),2*m3_h_r,100]);
    }
    
    //pivot bolt
    rotate([0,-90,0]) hull() {
        cylinder(r=2.5,h=100);
        rotate([0,0,90]) translate([-2.5*tan(22.5),-2.5,0]) cube([2*2.5*tan(22.5),2*2.5,100]);
    }
    
    //pivot bearings
    for(i=[0,1]) translate([-i*(2*a_b_r+8),0,0]) mirror([i,0,0]) {
        rotate([0,-90,0]) hull() {
            cylinder(r=(5+0.25),h=a_b_r+2);
            rotate([0,0,90]) translate([-(5+0.25)*tan(22.5),-(5+0.25),0]) cube([2*(5+0.25)*tan(22.5),2*(5+0.25),a_b_r+2]);
        }
            
        rotate([0,-90,0]) hull() {
            cylinder(r=(5+0.25),h=a_b_r+1);
            rotate([0,0,90]) translate([-(5+0.25)*tan(22.5),-(5+0.25),0]) cube([2*(5+0.25)*tan(22.5),2*(5+0.25),a_b_r+1]);
            
            cylinder(r=(5+0.25+1),h=a_b_r);
            rotate([0,0,90]) translate([-(5+0.25+1)*tan(22.5),-(5+0.25+1),0]) cube([2*(5+0.25+1)*tan(22.5),2*(5+0.25+1),a_b_r]);
        }
    }
    
    //pivot to base
    rotate([-90,0,0]) hull() {
        cylinder(r=12,h=a_b_r+8+20-4-8);
        translate([0,-100,0]) cylinder(r=12,h=a_b_r+8+10);
    }
    
    //bore of slipring
    rotate([-90,0,0]) hull() {
        cylinder(r=(2.5+0.25),h=100);
        translate([-(2.5+0.25)*tan(22.5),-(2.5+0.25),0]) cube([2*(2.5+0.25)*tan(22.5),2*(2.5+0.25),100]);
    }
    
    //pivot attachment bolts
    for(i=[0:2]) rotate([0,i*120,0]) translate([0,0,10-m4_h_r]) rotate([0,-i*120,0]) {
        rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=100);
            translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,100]);
        }
        translate([0,60+2+2+8+27.5-2.5-5,0]) rotate([90,0,0]) m4_co(45,true,0);
    }
    
    //cutout for thrust bearing
    translate([0,(a_b_r+8-4)+27.5+4-2.5,0]) rotate([-90,0,0]) hull() {
        cylinder(r=(35/2+0.25),h=100);
        translate([-(35/2+0.25)*tan(22.5),-(35/2+0.25),0]) cube([2*(35/2+0.25)*tan(22.5),2*(35/2+0.25),100]);
    }
    
    //motor cutout
    translate([-(60+2+2+8-2.4),sqrt(pow(79.8,2)-pow(20,2)),20]) {
        //motor body
        hull() {
            rotate([0,-90,0]) translate([0,0,-60]) cylinder(r=(12.5+0.5),h=60);
            translate([0,0,50]) rotate([0,-90,0]) translate([0,0,-60]) cylinder(r=(12.5+0.5),h=60);
        }
        hull() for(i=[0,1]) translate([0,-50*i,0]) {
            rotate([0,-90,0]) translate([0,0,-60]) cylinder(r=(12.5+0.5),h=25);
            translate([2.5,0,0])rotate([0,-90,0]) translate([0,0,-60]) cylinder(r=(12.5+0.5)-2.5,h=25+5);
        }
        
        //motor bearing
        hull() rotate([0,-90,0]) translate([0,0,-60]) {
            cylinder(r=3.5,h=100);
            rotate([0,0,90]) translate([-3.5*tan(22.5),-3.5,0]) cube([2*3.5*tan(22.5),2*3.5,100]);
        }
        
        //motor bolts
        for(i=[0:1]) rotate([i*180+120,0,0]) translate([0,0,10]) rotate([-i*180-120,0,0]) hull() rotate([0,-90,0]) translate([0,0,-60]) {
            cylinder(r=1.5,h=100);
            rotate([0,0,90]) translate([-1.5*tan(22.5),-1.5,0]) cube([2*1.5*tan(22.5),2*1.5,100]);
        }
    }
}

//slipring
module fdai_pitch_slipring() translate([60+2+2+2-1.2,0,0]) rotate([0,90,0]) {
    cylinder(r=12,h=1.2);
    cylinder(r=6.25,h=13.5);
}

//pitch motor
module fdai_pitch_motor() translate([-(60+2+2+8-2.4),sqrt(pow(79.8,2)-pow(20,2)),20]) rotate([0,-90,0]) rotate([0,0,180]) motor();

//pitch drive belt
module fdai_pitch_drive_belt() difference() {
    //208 teeth
    hull() {
       translate([-(60+2+2+8+2)-1.5-7-1,sqrt(pow(79.8,2)-pow(20,2)),20]) rotate([0,-90,0]) cylinder(r=10.2/2+1,h=6);
       translate([-(60+2+2+8+2)-1.5-7-1,0,0]) rotate([0,-90,0]) cylinder(r=20.4/2+1,h=6);
    }
    translate([1,0,0]) hull() {
        translate([-(60+2+2+8+2)-1.5-7-1,sqrt(pow(79.8,2)-pow(20,2)),20]) rotate([0,-90,0]) cylinder(r=10.2/2,h=6+2);
        translate([-(60+2+2+8+2)-1.5-7-1,0,0]) rotate([0,-90,0]) cylinder(r=20.4/2,h=6+2);
    }
}
    
//pitch sensor belt
module fdai_pitch_sensor_belt() difference() {
    //208 teeth
    hull() {
       translate([-(60+2+2+8+2)-1.5,0,0]) rotate([0,-90,0]) cylinder(r=20.4/2+1,h=6);
       translate([-(60+2+2+8+2)-1.5,sqrt(pow(72,2)-pow(10,2)),-10]) rotate([0,-90,0]) cylinder(r=20.4/2+1,h=6);
    }
    translate([1,0,0]) hull() {
        translate([-(60+2+2+8+2)-1.5,0,0]) rotate([0,-90,0]) cylinder(r=20.4/2,h=6+2);
        translate([-(60+2+2+8+2)-1.5,sqrt(pow(72,2)-pow(10,2)),-10]) rotate([0,-90,0]) cylinder(r=20.4/2,h=6+2);
    }
}

//pitch pulley
module fdai_pitch_pulley() translate([-(60+2+2+8+2),0,0]) rotate([0,-90,0]) difference() {
    union() {
        gt2_pulley(32,1+7+1+7+1);
        //cylinder(r=8,h=45-6-8-12);
            
        teeth = 32;
        pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
        
        hull() {
            translate([0,0,1+7+1+7+0.5]) cylinder(r=pulley_OD/2+0.5,h=0.5);
            translate([0,0,1+7+1+7]) cylinder(r=pulley_OD/2,h=1);
        }
        hull() {
            translate([0,0,1+7+0.5]) cylinder(r=pulley_OD/2+0.5,h=0.01);
            translate([0,0,1+7]) cylinder(r=pulley_OD/2,h=1);
        }
        hull() {
            translate([0,0,0]) cylinder(r=pulley_OD/2+0.5,h=0.5);
            translate([0,0,0]) cylinder(r=pulley_OD/2,h=1);
        }
    }
    //translate([0,0,-1]) cylinder(r=m4_v_r,h=100);
}

//pitch bearings
module fdai_pitch_bearings() translate([-(60+2),0,0]) rotate([0,-90,0]) {
    difference() {
        union() {
            cylinder(r=10/2,h=4);
            translate([0,0,4+4]) cylinder(r=10/2,h=4);
        }
        translate([0,0,-1]) cylinder(r=2,h=100);
    }
}