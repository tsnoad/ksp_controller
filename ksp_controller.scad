$fn=18;

hull() {
    translate([0,37.5/2,0]) cylinder(r=37.5/2+10,h=7);
    translate([0,72-37.5/2,0]) cylinder(r=37.5/2+10,h=7);
}

difference() {
    translate([-37.5/2,0,0]) cube([37.5,72,101]);
    
    translate([0,0,-1]) linear_co_v(37.5/2,200);
    
    translate([0,72,-1]) mirror([0,1,0]) linear_co_v(37.5/2,200);
    
    translate([0,72,20]) rotate([atan((72-40)/(101-20)),0,0]) mirror([0,1,0]) linear_co_v(37.5/2,sqrt(pow(72-40,2)+pow(101-20,2)));
    
    translate([0,40,101]) spindle_co(0,37.5/2);
}

*translate([0,37.5/2,0]) cylinder(r=37.5/2,h=147);
*translate([0,72-37.5/2,0]) cylinder(r=37.5/2,h=20);

*translate([0,72,20]) rotate([atan((72-40)/(101-20)),0,0]) translate([0,-37.5/2,0]) cylinder(r=37.5/2,h=sqrt(pow(72-40,2)+pow(101-20,2)));

*translate([0,40-37.5/2,101]) cylinder(r=37.5/2,h=15);

*translate([0,40,116]) rotate([atan((40-26)/(31)),0,0]) translate([0,-37.5/2,0]) cylinder(r=37.5/2,h=sqrt(pow(40-26,2)+pow(31,2)));

ah_ow = 71-7.5;

difference() {
    translate([-37.5/2,-21,111]) rotate([-32.5,0,0]) hull() {
        translate([0,0,10]) {
            *translate([0,12,0]) cube([12,70-12,75]);
            *translate([0,20,0]) cube([ah_ow,70-20-20,75]);
            *translate([12,0,0]) cube([ah_ow-12-20,70,75]);
            
            translate([10,10,0]) cylinder(r=10,h=75);
            
            translate([10,70+20-10,0]) cylinder(r=10,h=75);
            
            translate([ah_ow-20,20,0]) cylinder(r=20,h=75);
            
            translate([ah_ow-20,70-20,0]) cylinder(r=20,h=75);
        }
            
        
        #translate([37.5-5,70-5,-ah_ow+37.5+10]) cylinder(r=5,h=10);
        #translate([37.5-5,70-5-5,-ah_ow+37.5+10]) cylinder(r=5,h=10);
        #translate([5,70-5-5,-ah_ow+37.5+10]) cylinder(r=5,h=10);

    }
    
    hull() {
        translate([-37.5/2+10,37.5/2-5,157-16]) cylinder(r=5,h=50);
        translate([-37.5/2+10+50,37.5/2-5,157-16]) cylinder(r=5,h=50);
        translate([-37.5/2+10,37.5/2-5+50,157-16]) cylinder(r=5,h=50);
    }
    
    translate([-50,-50,147]) cube([100,200,100]);
    
    translate([-37.5/2+26,-21,111]) rotate([-32.5,0,0]) translate([0,-10,24]) cube([71,100,100]);
    
    translate([-50,40,101]) cube([100,100,100]);
    translate([0,40,101]) rotate([atan((72-40)/(101-20)),0,0]) translate([-50,0,-100]) cube([100,100,100]);
    
    difference() {
        union() {
            translate([0,72,20]) rotate([atan((72-40)/(101-20)),0,0]) mirror([0,1,0]) linear_co_v(37.5/2,sqrt(pow(72-40,2)+pow(101-20,2)));
            translate([0,40,101]) spindle_co(0,37.5/2);
            translate([0,40,101]) mirror([0,1,0]) linear_co_v(37.5/2,200);
            
            translate([0,40,116]) rotate([atan((40-26)/(31)),0,0]) mirror([0,1,0]) linear_co_v(37.5/2,200);
        }
        cube([100,100,200]);
    }
}


*piv_base();
*for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,-20]) ms();
*rotate([0,sin($t*360)*atan((20.8-18.3)/20),0]) {
    piv_out();
    rotate([sin($t*360+90)*atan((20.8-18.3)/20),0,0]) piv_in();
}

*translate([0,0,-(-20+10.3/2)]) piv_base();
*translate([50,10,8]) rotate([0,0,90]) rotate([0,90,0]) piv_in();
*translate([90,0,8]) rotate([0,180,0]) piv_out();


module ms() translate([-27.7-8.8,20.8-10.4,-10.3/2]) {
    difference() {
        hull() {
            cylinder(r=2.75,h=10.3);
            translate([22.2,0,0]) cylinder(r=2.75,h=10.3);
            translate([0,10.4,0]) cylinder(r=2.75,h=10.3);
            translate([22.2,10.4,0]) cylinder(r=2.75,h=10.3);
        }
        translate([0,0,-1]) cylinder(r=1.5,h=20);
        translate([22.2,10.4,-1]) cylinder(r=1.5,h=20);
    }
    translate([8.8+1,-18.3+10.4,(10.3-5)/2]) rotate([0,0,-atan((20.8-18.3)/27.8)]) {
        cube([27.8-1,2,5]);
        translate([0,1,0]) cylinder(r=1,h=5);
        translate([27.7-1,1,0]) cylinder(r=1,h=5);
        translate([-1,1,0]) cube([2,10,5]);
    }
        
}
module ms_co() translate([-27.7-8.8,20.8-10.4,-10.3/2]) {
    hull() {
        translate([0,0,-4]) cylinder(r=0.5,h=10.3+8);
        translate([0,0,-4+1]) cylinder(r=1.5,h=10.3+6);
    }
    translate([22.2,10.4,0]) hull() {
        translate([0,0,-4]) cylinder(r=0.5,h=10.3+8);
        translate([0,0,-4+1]) cylinder(r=1.5,h=10.3+6);
    }
}




module piv_base() difference() {
    hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0])
        translate([8+16+4,8+16+8,-20+10.3/2]) cylinder(r=8,h=20-10.3/2+8);
    
    hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0])
        translate([8+16+4-2,8+16+8-2+0.25,-8-1]) cylinder(r=2,h=100);
    
    hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0])
        translate([16-4,16-4,-50]) cylinder(r=4,h=100);
    
    translate([0,50,0]) rotate([90,0,0]) hull() {
        cylinder(r=2+0.25,h=100);
        rotate([0,0,0]) translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),100]);
    }
    
    for(i=[0,1]) mirror([0,i,0]) translate([0,8+16+8+0.75,0]) rotate([90,0,0]) cylinder(r1=6.25,r2=6.25+2,h=2);
    
    *translate([0,0,-50]) cube([100,100,100]);
    
    for(i=[0:3]) rotate([0,0,i*90]) translate([4,8,-20]) ms_co();
}

th_br = 7.5;

    
module piv_in() {
    difference() {
        union() {
            hull() {
                translate([0,0,-8-20]) cylinder(r=8,h=8+20+50);
                rotate([0,0,90]) translate([-8*tan(22.5),-8,-8-20]) cube([2*8*tan(22.5),2*8,8+20+50]);
            }
            translate([-8,0,0]) rotate([0,90,0]) cylinder(r=8,h=16);
        }
        
        translate([-25,0,0]) rotate([0,90,0]) cylinder(r=2+0.25,h=50);
    }
    translate([0,0,50]) rotate([0,90,0]) {
        for(i=[0,1]) mirror([0,i,0]) translate([0,25,0]) rotate_extrude() intersection() {
            translate([0,0]) circle(r=8*sqrt(2));
            translate([0,-8]) square([16,16]);
        }
        
        for(i=[0,1]) mirror([i,0,0]) intersection() {
            translate([(pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4)-8-4,0,0]) rotate_extrude($fn=$fn*4) intersection() {
                translate([(pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4)-8,0]) circle(r=8*sqrt(2),$fn=$fn/4);
                translate([0,-8]) square([100,16]);
            }
            //cylinder(r=(pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4),h=16,$fn=$fn*4);
            
            translate([(pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4)-8-4,0,-50]) rotate([0,0,90+atan(25/((pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4)-8-4))]) cube([100,100,100]);
            mirror([0,1,0]) translate([(pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4)-8-4,0,-50]) rotate([0,0,90+atan(25/((pow(25,2)+pow(8+4,2)-pow(8,2))/(2*4)-8-4))]) cube([100,100,100]);
            
            translate([-100,-50,-50]) cube([100,100,100]);
        }
    }
}

module piv_out() difference() {
        union() {
            translate([0,8+16+8,0]) rotate([90,0,0]) {
                hull() {
                    cylinder(r=16,h=8+8+8,$fn=$fn*2);
                    translate([0,0,8]) cylinder(r=16+8,h=8,$fn=$fn*2);
                }
                translate([0,0,8+16+8+8]) hull() {
                    cylinder(r=16,h=8+8+8,$fn=$fn*2);
                    translate([0,0,8]) cylinder(r=16+8,h=8,$fn=$fn*2);
                }
            }
            translate([-8-8,-2-16,-8]) cube([16+16,4+32+4,16]);
        }
    
        
    translate([-50,-50,8]) cube([100,100,50]);
        
    difference() {
        translate([-50,-50,-50]) cube([100,100,50]);
        
        hull() {
            translate([0,50,0]) rotate([90,0,0]) cylinder(r=8,h=100);
            for(i=[0,1]) mirror([i,0,0]) rotate([0,-atan((20.8-18.3)/20),0]) translate([0,-50,-8]) cube([50,100,50]);
        }
    }
    
    hull() {
        translate([-8-0.25,-8-16+1.6,-10-1]) cube([16+2*0.25,16+32-3.2,20+2]);
        translate([-8-0.25+1.6,-8-16,-10-1]) cube([16+2*0.25-2.3,16+32,20+2]);
    }
    
    translate([-25,0,0]) rotate([0,90,0]) hull() {
        cylinder(r=2+0.25,h=50);
        rotate([0,0,90]) translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),50]);
    }
    
    translate([0,50,0]) rotate([90,0,0]) hull() {
        cylinder(r=2+0.25,h=100);
        rotate([0,0,0]) translate([-(2+0.25)*tan(22.5),-(2+0.25),0]) cube([2*(2+0.25)*tan(22.5),2*(2+0.25),100]);
    }
    
    for(i=[0,1]) mirror([i,0,0]) translate([-8-1,0,0]) rotate([0,90,0]) cylinder(r1=6.25,r2=6.25+2,h=2);
}

*translate() hull() {
    translate([(25-th_br),(25-th_br),th_br]) sphere(r=th_br);
    translate([(25-th_br),-(25-th_br),th_br]) sphere(r=th_br);
    translate([-(25-th_br),(25-th_br),th_br]) sphere(r=th_br);
    translate([-(25-th_br),-(25-th_br),th_br]) sphere(r=th_br);
    
    translate([(25-th_br),(25-th_br),40-th_br]) sphere(r=th_br);
    translate([(25-th_br),-(25-th_br),40-th_br]) sphere(r=th_br);
    translate([-(25-th_br),(25-th_br),40-th_br]) sphere(r=th_br);
    translate([-(25-th_br),-(25-th_br),40-th_br]) sphere(r=th_br);
}

*difference() {
    translate([-12,-5,0]) cube([24,24+40,130]);
    translate([0,0,-5]) linear_co_v(12,90+5);
    translate([0,-5,90]) spindle_co(5,12);
    translate([0,-5,90]) rotate([-15,0,0]) translate([-25,-50,-25+5]) cube([50,50,100]);   
}
*difference() {
    translate([0,-5,90]) rotate([-15,0,0]) translate([0,0,5+12-50]) {
        cube([12+12,50,20+50]);
        translate([12+12,25,0]) cylinder(r=25,h=20+50);
    }
    hull() {
    #translate([-25,-5,90]) rotate([0,90,0]) cylinder(r=5+12,h=100);
    #translate([-25,-5+100,90-100*tan(15+30)]) rotate([0,90,0]) cylinder(r=5+12,h=100);
    #translate([-25,-5,0]) rotate([0,90,0]) cylinder(r=5+12,h=100);
    }
}

*translate([24,12,75]) rotate([-30,0,0]) cylinder(r=24,h=24);




module spindle_co(sp_r,co_r,squash=true,co_rd_tmp) rotate([0,90,0]) {
	co_rd = (co_rd_tmp == undef ? co_r : co_rd_tmp);
	
	*translate([0,0,-25]) cylinder(r=sp_r,h=50);
	rotate_extrude(convexity=10,$fn=$fn*pow(2,floor(ln((sp_r+co_rd)/10)/ln(2)))) difference() {
		translate([0,-25]) square([co_rd+sp_r,50]);
		
		if (squash==false) hull() {
			translate([co_rd+sp_r,co_r-co_rd]) circle(r=co_rd,$fn=$fn/pow(2,floor(ln((sp_r+co_rd)/10)/ln(2)))*pow(2,floor(ln(co_rd/10)/ln(2))));
			translate([co_rd+sp_r,-co_r+co_rd]) circle(r=co_rd,$fn=$fn/pow(2,floor(ln((sp_r+co_rd)/10)/ln(2)))*pow(2,floor(ln(co_rd/10)/ln(2))));
		} else {
			translate([co_rd+sp_r,0]) scale([co_rd/co_r,1,1]) circle(r=co_r,$fn=$fn/pow(2,floor(ln((sp_r+co_rd)/10)/ln(2)))*pow(2,floor(ln(co_r/10)/ln(2))));
		}
	}
}

module linear_co(co_r,length=150,height=150,squash=true,co_rd_tmp) translate([-25,0,0]) {
	co_rd = (co_rd_tmp == undef ? co_r : co_rd_tmp);

	*cube([50,150,150]);
	difference() {
		translate([0,0,-co_rd]) cube([50,length,height+co_rd]);
		
		if (squash==false) hull() {
			translate([25+co_r-co_rd,-10,-co_rd]) rotate([-90,0,0]) cylinder(r=co_rd,h=length+20);
			translate([25-co_r+co_rd,-10,-co_rd]) rotate([-90,0,0]) cylinder(r=co_rd,h=length+20);
		} else {
			translate([25,-10,-co_rd]) scale([1,1,co_rd/co_r]) rotate([-90,0,0]) cylinder(r=co_r,h=length+20);
		}
	}
}

module linear_co_v(co_r,length=150,height=150,squash=true,co_rd_tmp) rotate([90,0,0]) linear_co(co_r,length,height,squash,co_rd_tmp);

module torus_co(sp_r,co_r,angle=90,out_r=50,squash=true,co_rd_tmp) rotate([0,90,0]) intersection() {
        rotate_extrude(convexity=10,$fn=$fn*pow(2,floor(ln(sp_r/10)/ln(2)))) difference() {
        co_rd = (co_rd_tmp == undef ? co_r : co_rd_tmp);
    
        translate([sp_r-co_rd,-25]) square([out_r,50]);
    
        if (squash==false) hull() {
            translate([sp_r-co_rd,co_r-co_rd]) circle(r=co_rd,$fn=$fn/pow(2,floor(ln(sp_r/10)/ln(2)))*pow(2,floor(ln(co_rd/10)/ln(2))));
            translate([sp_r-co_rd,-co_r+co_rd]) circle(r=co_rd,$fn=$fn/pow(2,floor(ln(sp_r/10)/ln(2)))*pow(2,floor(ln(co_rd/10)/ln(2))));
        } else {
            translate([sp_r-co_rd,0]) scale([co_rd/co_r,1,1]) circle(r=co_r,$fn=$fn/pow(2,floor(ln(sp_r/10)/ln(2)))*pow(2,floor(ln(co_r/10)/ln(2))));
        }
    }
    translate([0,0,-25]) cube([sp_r+50,sp_r+50,50]);
    rotate([0,0,-90+angle]) translate([0,0,-25]) cube([sp_r+50,sp_r+50,50]);
}