$fn=36;

//$vpr = [60, 0, 45];
//$vpt = [0, -20, 75];
$vpd = 875;
$t=1;

include <ksp_controller_include.scad>;
//include <ksp_controller_module_cw.scad>;


    
    ag_r = 40;
    ag_h = 30;

    ah_b = 1.25;
    ah_b2 = 2*ah_b;
    ah_w = 16;
    ah_wh = ah_w/2;
    ah_l = 60;
    ah_lh = ah_l/2;
    ah_h = 12;
    
    ah_s_r = sqrt(pow(ah_w,2)/2);
    ah_fco_os = (ah_lh-ah_s_r-3*ah_b)/2;
    ah_fco_r = sqrt(2*pow(ah_fco_os,2));

abrt_box_lid();
translate([0,70,ah_wh]) rotate([-90,0,0]) rotate([0,0,90]) abrt_handle();

module abrt_box_lid() {
    difference() {
        union() {
            difference() {
                box_lid(60,60,50,50);
                
                //bolt co
                for(i=[0,1]) mirror([i,0,0]) {
                    translate([(60-7.5),(50-7.5),0]) {
                        translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                        box_lid_bolt_c_co();
                    }
                    translate([(60-7.5),-(50-7.5),0]) mirror([0,1,0]) {
                        translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                        box_lid_bolt_c_co();
                    }
                }
                
                translate([0,0,5-1.2]) hull() {
                    cylinder(r=ah_s_r+5,h=50,$fn=$fn*2);
                    translate([0,0,1.2]) cylinder(r=ah_s_r+5+1.2,h=50,$fn=$fn*2);
                }
                
                translate([0,0,5-1.2]) intersection() {
                    hull() {
                        cylinder(r=ah_lh,h=50,$fn=$fn*2);
                        translate([0,0,1.2]) cylinder(r=ah_lh+1.2,h=50,$fn=$fn*2);
                    }
                    translate([0,-100,0]) cube([100,100,100]);
                }
                
                for(j=[0,180,270]) rotate([0,0,j]) hull() for(i=[0,1]) translate([i*(ah_lh-ah_wh),0,5-1.2]) {
                    cylinder(r=ah_wh,h=50);
                    translate([0,0,1.2]) cylinder(r=ah_wh+1.2,h=50);
                }
            }
            
            rotate_extrude(convexity=10,$fn=$fn*4) {
                translate([ag_r-2.5/2,0]) square([2.5,5+ag_h]);
                hull() {
                    translate([ag_r-7.5/2,0]) square([7.5,5]);
                    translate([ag_r-2.5/2,0]) square([2.5,5+2.5]);
                }
                hull() {
                    translate([ag_r-7.5/2,5+ag_h-2.5-5]) square([7.5,5]);
                    translate([ag_r-2.5/2,5+ag_h-5-5]) square([2.5,5+5]);
                }
            }
            intersection() {
                rotate_extrude(convexity=10,$fn=$fn*4) {
                    translate([ag_r-7.5/2,0]) square([7.5,5+ag_h-5]);
                }
                for(i=[-30,30,180-30,180+30]) rotate([0,0,i]) translate([ag_r,0,0]) {
                    scale([(10+2.5)/sqrt(2),(10+2.5)/sqrt(2),1]) rotate([0,0,45]) translate([-0.5,-0.5,0]) cube([1,1,5+ag_h-5]);
                    
                    for(j=[0,1]) translate([0,0,j*(30+2.5)]) mirror([0,0,j]) hull() {
                        scale([(10+2.5)/sqrt(2),(10+2.5)/sqrt(2),1]) rotate([0,0,45]) translate([-0.5,-0.5,0]) cube([1,1,5+2.5]);
                        scale([(10+5+2.5)/sqrt(2),(10+5+2.5)/sqrt(2),1]) rotate([0,0,45]) translate([-0.5,-0.5,0]) cube([1,1,5]);
                    }
                }
            }
            
            translate([0,0,0]) hull() {
                cylinder(r=ah_s_r,h=5,$fn=$fn*2);
                cylinder(r=ah_s_r+1.2,h=5-1.2,$fn=$fn*2);
            }
            
            intersection() {
                for(i=[-3:3]) translate([i*8*sqrt(2),0,0]) rotate([0,0,45]) translate([-2,-50,0]) cube([4,100,5-1.2+0.4]);
                cylinder(r=40,h=5);
            }
        }
        
        translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
        
        translate([0,0,5-3]) cylinder(r=5+0.15,h=50);
        
        hull() {
            translate([0,0,5-2]) cylinder(r=5+0.15,h=50);
            translate([0,0,5-1]) cylinder(r=5+1+0.15,h=50);
        }
    }
}

module abrt_handle() {
    difference() {
        union() {
            difference() {
                hull() {
                    for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
                        translate([ah_wh-ah_b,sqrt(pow(ah_lh-ah_b,2)-pow(ah_wh-ah_b,2)),0]) {
                           translate([0,0,ah_b]) cylinder(r=ah_b,h=ah_h-ah_b2);
                           cylinder(r=0.01,h=ah_h);
                        }
                    }
                    intersection() {
                        translate([0,0,ah_b]) cylinder(r=ah_lh,h=ah_h-ah_b2,$fn=$fn*4);
                        translate([-ah_lh*(ah_wh-ah_b)/(ah_lh-ah_b),-50,0]) cube([2*ah_lh*(ah_wh-ah_b)/(ah_lh-ah_b),100,100]);
                    }
                    intersection() {
                        cylinder(r=ah_lh-ah_b,h=ah_h,$fn=$fn*4);
                        translate([-(ah_wh-ah_b),-50,0]) cube([2*(ah_wh-ah_b),100,100]);
                    }
                }
                
                rotate_extrude($fn=$fn*2) translate([ah_s_r+ah_fco_os,-ah_fco_os]) circle(r=ah_fco_r,$fn=$fn*2);
                
                for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) hull() {
                    intersection() {
                        rotate_extrude($fn=$fn*2) translate([ah_s_r+ah_fco_os,-ah_fco_os]) circle(r=ah_fco_r,$fn=$fn*2);
                        translate([ah_wh-ah_b,0,0]) cube([ah_b+0.01,50,50]);
                    }
                    intersection() {
                        rotate_extrude($fn=$fn*2) translate([ah_s_r+ah_fco_os,-ah_fco_os]) circle(r=ah_fco_r+ah_b,$fn=$fn*2);
                        translate([ah_wh,0,0]) cube([0.01,50,50]);
                    }
                }
            }
            
            translate([0,ah_lh-ah_wh,ah_h/2]) hull() {
                translate([0,3.75,0]) {
                    cylinder(r=0.5,h=ah_h/2);
                    cylinder(r=0.01,h=ah_h/2+0.5);
                }
                for(i=[0,1]) mirror([i,0,0]) translate([2.5,-2.5,0]) {
                    cylinder(r=0.5,h=ah_h/2);
                    cylinder(r=0.01,h=ah_h/2+0.5);
                }
            }
            
            for(i=[0,1]) mirror([i,0,0]) difference() {
                    ws_w = 2.5;
                intersection() {
                    hull() {
                        cylinder(r=ah_lh,h=ah_h-ah_b,$fn=$fn*4);
                        cylinder(r=ah_lh-ah_b-0.5,h=ah_h+0.5,$fn=$fn*4);
                    }
                    hull() {
                        translate([ah_wh-ah_b-ws_w,-50,ah_h/2]) cube([ws_w,100,ah_h/2]);
                        translate([ah_wh-ah_b-ws_w+0.5,-50,ah_h/2]) cube([ws_w-2*0.5,100,ah_h/2+0.5]);
                    }
                }
                for(j=[-1:1]) translate([ah_wh-ah_b-ws_w/2,j*15,ah_h]) rotate([0,0,-45+90*i]) hull() {
                    translate([-ws_w/2,-25,0.5]) cube([ws_w,50,50]);
                    translate([-ws_w/2+0.5,-25,0]) cube([ws_w-2*0.5,50,50]);
                }
            }
            
            translate([0,0,-(30-ah_h)]) intersection() {
                cylinder(r=ah_s_r,h=30-ah_h/2,$fn=$fn*2);
                translate([-ah_wh,-ah_lh,0]) cube([ah_w,ah_l,100]);
            }
        }
        
        translate([0,0,-(30-ah_h)]) rotate([0,0,90]) {
            translate([0,0,-1]) {
                cylinder(r=m4_h_r,h=1+4+8+8);
                translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,1+4+8+8]);
            }
            translate([0,0,4]) m4_endnut_vert_co();
        }
    }
}