module fdai_base() translate([0,60+2+2+8+27.5-2.5,0]) rotate([-90,0,0]) difference() {
    hull() for(ixm=[0,1]) mirror([ixm,0,0]) for(iym=[0,1]) mirror([0,iym,0]) {
        translate([95-5,95-5,10]) cylinder(r=5,h=8+2.5);
    }
    
    translate([0,0,10+8]) cylinder(r=(35/2+0.25),h=100);
    translate([0,0,0]) cylinder(r=10+0.5,h=100);
}

//face
module fdai_face() {
    rotate([90,0,0])
    difference() {
        f_a = 45+22.5;
        
        *translate([-60,-60,(b_r+2)*cos(f_a)-5]) {
            cube([120,120,5+8]);
        }
        translate([0,0,(b_r+2)*cos(f_a)-5]) hull() for(i=[-1,1]) for(j=[-1,1]) {
            translate([i*(95-5),j*(95-5),0]) cylinder(r=5,h=25-2.5);
            translate([i*(95-5),j*(95-5),0]) cylinder(r=5-2.5,h=25);
        }
        
        translate([0,0,(b_r+2)*cos(f_a)-5]) for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([(95-7.5),(95-7.5),25-5]) box_lid_bolt_c_co();
            *translate([(95-7.5),(95-7.5),-1]) cylinder(r=m4_v_r,h=50);
        }
        
        *sphere(r=50+2);
        cylinder(r1=(b_r+2)/cos(90-(f_a)),r2=0,h=(b_r+2)/cos(f_a),$fn=$fn*2);
        *intersection() {
            cylinder(r1=0,r2=100*tan(f_a),h=100,$fn=$fn*2);
        }
        
        hull() for(i=[0:45:360-45]) rotate([0,0,i]) {
            translate([
                ((b_r+2)*cos(f_a)+8-1.2)*tan(f_a)-5+5,
                (((b_r+2)*cos(f_a)+8-1.2)*tan(f_a)-5+5)*tan(22.5),
                (b_r+2)*cos(f_a)+8-1.2
            ]) cylinder(r1=5,r2=5+100*tan(/*f_a*/30),h=100);
        }
        
        
        for(i=[0:45:360-45]) rotate([0,0,i]) {
            rotate([0,-90+f_a,0]) hull() {
                translate([(b_r+2+(3*1)),0,-1]) cylinder(r=1,h=100);
                translate([(b_r+2+12-(3*1)),0,-1]) cylinder(r=1,h=100);
            }
            
            for(j=[15,30]) rotate([0,0,j]) rotate([0,-90+f_a,0]) hull() {
                translate([(b_r+2+(3*1)),0,-1]) cylinder(r=1,h=100);
                translate([(b_r+2+8-(3*1)),0,-1]) cylinder(r=1,h=100);
            }
        }
    }
}



//base
*difference() {
    union() {
        translate([0,0,-(50+4+16)-8-4]) hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
            translate([(75-5),(75-5),0]) cylinder(r=5,h=8+4);
        }
        //uprights
        translate([0,0,-(50+4+16+8+4)]) for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) hull() {
            translate([(75-5),(75-5),0]) cylinder(r=5,h=(50+4+16+8+4)+(50+2)*cos(45+7.5)-5);
            *translate([(75-15),(75-15),0]) cylinder(r=5,h=(50+4+16+8+4)+(50+2)*cos(45+7.5)-5);
            translate([(75-15-10),(75-15+10),0]) cylinder(r=5,h=(50+4+16+8+4)+(50+2)*cos(45+7.5)-5);
            translate([(75-15+10),(75-15-10),0]) cylinder(r=5,h=(50+4+16+8+4)+(50+2)*cos(45+7.5)-5);
        }
    }
    translate([0,0,-(50+4+16)-8-4-1]) {
        for(j=[0:3]) rotate([0,0,j*90]) hull() for(i=[0,1]) mirror([0,i,0]) {
            translate([(75-15-5*sqrt(2))+5*sqrt(2)+5,(75-15-5*sqrt(2))-5*sqrt(2)-5,0]) cylinder(r=5,h=200);
            translate([(75-15-5*sqrt(2))+5*sqrt(2)+5,0,0]) cylinder(r=5,h=200);
            
            translate([(75-15-5*sqrt(2))+5*sqrt(2)+5-5,(75-15-5*sqrt(2))-5*sqrt(2)-5+5,0]) cylinder(r=5,h=200);
            translate([(75-15-5*sqrt(2))+5*sqrt(2)+5-5-40,(75-15-5*sqrt(2))-5*sqrt(2)-5+5-40,0]) cylinder(r=5,h=200);
        }
    }
    
    translate([0,0,-(50+4+16)]) mirror([0,0,1]) m4_co(25,false,8,8,true);
    
    
    for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) translate([(75-7.5),(75-7.5),(50+2)*cos(45+7.5)-5-8-8]) {
        cylinder(r=m4_v_r,h=8+50);
        
        hull() {
            for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=8);
            translate([20,0,0]) for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=8);
        }
        hull() {
            for(i=[0:3]) rotate([0,0,60+i*120]) translate([3.5/cos(30),0,0]) cylinder(r=m4n_v_r-3.5,h=8+0.2);
        }
    }
}