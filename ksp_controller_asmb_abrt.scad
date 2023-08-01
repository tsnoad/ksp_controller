$fn=72;

//$vpr = [60, 0, 45];
//$vpt = [0, -20, 75];
//$vpd = 875;
$t=1;

include <ksp_controller_include.scad>;
//include <ksp_controller_module_cw.scad>;


    
    ag_r = 40+10; //radius of guard
    ag_h = 40; //height of guard

    ah_b = 1.25;
    ah_b2 = 2*ah_b;
    ah_w = 16;
    ah_wh = ah_w/2;
    ah_l = 60+20;
    ah_lh = ah_l/2;
    ah_h = 12+4;
    ah_d = 40+2+10;
    
    ah_s_r = sqrt(pow(ah_w,2)/2);
    ah_fco_os = (ah_lh-ah_s_r-3*ah_b)/2;
    ah_fco_r = sqrt(2*pow(ah_fco_os,2));




//translate([0,70,ah_wh]) rotate([-90,0,0]) rotate([0,0,90]) abrt_handle();


box_widh = 70;
box_hgth = 57.5;

cam_z = 50-5-8-2;

tb_recess = 1.6; //how far are thrust bearings recessed into their seats?

hndl_rotate = 0;




*translate([0,0,50]) abrt_box_lid();
translate([0,0,50]) !inner_lid();

rotate([0,0,hndl_rotate]) {
    translate([0,0,cam_z+8-2]) abrt_handle();
    
    //thrust bearings
    *translate([0,0,cam_z-4+tb_recess]) cylinder(r=5,h=4);
    *translate([0,0,cam_z-4+tb_recess-20-4]) cylinder(r=5,h=4);
    
    //cam
    *translate([0,0,cam_z]) cam_track();
}


*translate([20,-25,cam_z]) rotate([0,0,-atan(10/50)*abs(hndl_rotate/90)]) translate([-20,--25,0]) {
    //cam bearings
    *translate([20,0,0]) cylinder(r=6.5,h=8);
    
    //thrust bearings
    *translate([20,-25,-10-1-4+tb_recess]) cylinder(r=5,h=4);
    *translate([20,-25,-10-1-tb_recess+10]) cylinder(r=5,h=4);
    
    translate([0,0,-10-1]) cam_lever();
}

abrt_base();


//handle bolt
%translate([0,0,cam_z-4+tb_recess-20-4]) mirror([0,0,1]) m4_co(45,false,0);
//microswitch
%translate([20+7.5+5,0,cam_z-10-1+10.3/2]) rotate([0,0,90]) mirror([1,0,0]) translate([0,ms_pt+ms_ot,0]) ms();


module abrt_base() difference() {
    union() {
        hull() {
            //pedestal for microswitch
            translate([20+7.5+7.5,0,0]) hull() {
                translate([2,7.5,0]) cylinder(r=2,h=20);
                translate([2,-25,0]) cylinder(r=2,h=20);
                translate([20,7.5,0]) cylinder(r=2,h=20);
                translate([20,-25,0]) cylinder(r=2,h=20);
            }
        
            //mounting boss for handle
            hull() {
                cylinder(r=10,h=20);
                *translate([-20,0,0]) cylinder(r=10,h=cam_z-4+tb_recess+tb_recess);
                *translate([-20,-20,0]) cylinder(r=10,h=cam_z-4+tb_recess+tb_recess);
            }
            
            //mounting boss for cam lever
            translate([20,-25,0]) cylinder(r=10,h=20);
            
            //mounting boss for spring bolt
            hull() for(i=[25,32.5,40]) translate([20-i,25,0]) cylinder(r=5,h=20);
        }
        
        //floor
        box_frame(box_widh,box_widh,box_hgth,box_hgth,5);
        
        //wall
        difference() {
            box_frame(box_widh,box_widh,box_hgth,box_hgth,50);
            translate([-(box_widh-5),-(box_hgth-5),-1]) cube([2*(box_widh-5),2*(box_hgth-5),100]);
        }

        intersection() {
            union() {
                //corner pillars
                for(iy=[box_hgth-7.5]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([box_widh-7.5,iy,0]) hull() {
                        cylinder(r=7.5,h=80);
                        
                        translate([20,-20,0]) cylinder(r=7.5,h=80);
                        translate([-20,20,0]) cylinder(r=7.5,h=80);
                        
                        translate([20,20,0]) cylinder(r=7.5,h=80);
                    }
                }
                for(iy=[(box_hgth-7.5)]) mirror([0,1,0]) for(ixm=[0,1]) mirror([ixm,0,0]) {
                    translate([box_widh-7.5,iy,0]) hull() {
                        cylinder(r=7.5,h=80);
                        
                        translate([20,-20,0]) cylinder(r=7.5,h=80);
                        translate([-20,20,0]) cylinder(r=7.5,h=80);
                        
                        translate([20,20,0]) cylinder(r=7.5,h=80);
                    }
                }
                
                //pillars that support the inner lid
                for(i=[0-5,90]) rotate([0,0,i]) translate([37.5,37.5,0]) hull() {
                    cylinder(r=7.5,h=50-5);
                    rotate([0,0,-i]) translate([0,100,0]) cylinder(r=7.5,h=50-5);
                }
                for(i=[180,270-5]) rotate([0,0,i]) translate([37.5,37.5,0]) hull() {
                    cylinder(r=7.5,h=50-5);
                    rotate([0,0,-i]) translate([0,-100,0]) cylinder(r=7.5,h=50-5);
                }
                
                translate([-37.5*sqrt(2)*sin(0-5-45)+7.5,box_hgth-5,0]) mirror([1,0,0]) bevel_co(5,50-5);
                translate([-37.5*sqrt(2)*sin(0-5-45)-7.5,box_hgth-5,0]) mirror([0,0,0]) bevel_co(5,50-5);
                translate([-37.5*sqrt(2)*sin(90-45)+7.5,box_hgth-5,0]) mirror([1,0,0]) bevel_co(5,50-5);
                translate([-37.5*sqrt(2)*sin(90-45)-7.5,box_hgth-5,0]) mirror([0,0,0]) bevel_co(5,50-5);
                
                translate([-37.5*sqrt(2)*sin(180-45)+7.5,-box_hgth+5,0]) mirror([1,0,0]) mirror([0,1,0]) bevel_co(5,50-5);
                translate([-37.5*sqrt(2)*sin(180-45)-7.5,-box_hgth+5,0]) mirror([0,0,0]) mirror([0,1,0]) bevel_co(5,50-5);
                translate([-37.5*sqrt(2)*sin(270-5-45)+7.5,-box_hgth+5,0]) mirror([1,0,0]) mirror([0,1,0]) bevel_co(5,50-5);
                translate([-37.5*sqrt(2)*sin(270-5-45)-7.5,-box_hgth+5,0]) mirror([0,0,0]) mirror([0,1,0]) bevel_co(5,50-5);
                
                //pedestal
                *hull() for(ix=[-1,1]) for(iy=[0,1]) mirror([0,iy,0]) translate([ix*37.5,37.5,0]) {
                    translate([0,-4,0]) cylinder(r=7.5,h=cam_z+(-10-1-4+tb_recess+tb_recess));
                }
                *hull() for(ix=[-1,1]) for(iy=[0,1]) mirror([0,iy,0]) translate([ix*37.5,37.5,0]) {
                    translate([0,100,0]) cylinder(r=7.5,h=16);
                }
                hull() {
                    for(i=[0-5,90]) rotate([0,0,i]) translate([37.5,37.5,0]) hull() {
                        cylinder(r=7.5,h=16);
                        //rotate([0,0,-i]) translate([0,100,0]) cylinder(r=7.5,h=16);
                    }
                    for(i=[180,270-5]) rotate([0,0,i]) translate([37.5,37.5,0]) hull() {
                        cylinder(r=7.5,h=16);
                        //rotate([0,0,-i]) translate([0,-100,0]) cylinder(r=7.5,h=16);
                    }
                }
                hull() for(i=[0-5,90]) rotate([0,0,i]) translate([37.5,37.5,0]) hull() {
                    cylinder(r=7.5,h=16);
                    rotate([0,0,-i]) translate([0,100,0]) cylinder(r=7.5,h=16);
                }
                hull() for(i=[180,270-5]) rotate([0,0,i]) translate([37.5,37.5,0]) hull() {
                    cylinder(r=7.5,h=16);
                    rotate([0,0,-i]) translate([0,-100,0]) cylinder(r=7.5,h=16);
                }
                
                //pedestal for microswitch
                translate([20+7.5+7.5,0,0]) hull() {
                    translate([2,7.5,0]) cylinder(r=2,h=cam_z-10-1+2);
                    translate([2,-25,0]) cylinder(r=2,h=cam_z-10-1+2);
                    translate([20,7.5,0]) cylinder(r=2,h=cam_z-10-1+2);
                    translate([20,-25,0]) cylinder(r=2,h=cam_z-10-1+2);
                }
            }
            box_frame(box_widh,box_widh,box_hgth,box_hgth,50);
        }
        
        //mounting boss for handle
        hull() {
            cylinder(r=10,h=cam_z-4+tb_recess+tb_recess);
            *translate([-20,0,0]) cylinder(r=10,h=cam_z-4+tb_recess+tb_recess);
            *translate([-20,-20,0]) cylinder(r=10,h=cam_z-4+tb_recess+tb_recess);
        }
        
        //mounting boss for cam lever
        translate([20,-25,0]) cylinder(r=10,h=cam_z+(-10-1-4+tb_recess+tb_recess));
        
        //mounting boss for spring bolt
        hull() for(i=[25,32.5,40]) translate([20-i,25,0]) cylinder(r=5,h=cam_z+(-10-1+5));
    }
    
    //mounting boss for handle cutouts
    union() {
        //top thrust bearing
        translate([0,0,cam_z-4+tb_recess]) {
            cylinder(r=5+0.25,h=50);
            hull() {
                translate([0,0,1]) cylinder(r=5+0.25,h=50);
                translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
            }
        }
        //bottom thrust bearing
        translate([0,0,cam_z-4+tb_recess-20]) mirror([0,0,1]) {
            cylinder(r=5+0.25,h=50);
            hull() {
                translate([0,0,1]) cylinder(r=5+0.25,h=50);
                translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
            }
            intersection() {
                translate([0,0,-0.2]) cylinder(r=(5+0.25)/cos(30),h=50,$fn=3);
                translate([0,0,-1]) cylinder(r=5+0.25,h=50);
            }
            rotate([0,0,30]) translate([0,0,-0.4]) cylinder(r=(m4_v_r+1)/cos(30),h=50,$fn=6);
        }
        
        //pivot bolt hole
        translate([0,0,-1]) cylinder(r=m4_v_r+1,h=100);
    }
    
    //mounting boss for cam lever cutouts
    translate([20,-25,0]) {
        //top thrust bearing
        translate([0,0,cam_z+(-10-1-4+tb_recess)]) {
            cylinder(r=5+0.25,h=50);
            hull() {
                translate([0,0,1]) cylinder(r=5+0.25,h=50);
                translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
            }
        }
        
        //pivot bolt
        translate([0,0,cam_z-10-1-4+tb_recess]) m4_co(25,false,10+2*(4-tb_recess),18-(10+2*(4-tb_recess)),false,true);
    }
    
    //cutouts for bolts to mount to 8040 rail
    for(ix=[-20,0,20]) for(iy=[-(box_hgth-5-4)]) {
        translate([ix,iy,0]) m4_co(25,false,16);
    }
    for(ix=[-20,0,20]) for(iy=[(box_hgth-5-4)]) {
        translate([ix,iy,0]) m4_co(25,false,16);
    }
    
    //microswitch cutouts
    translate([20+7.5+5,0,cam_z-10-1+10.3/2]) rotate([0,0,90]) mirror([1,0,0]) translate([0,ms_pt+ms_ot,0]) {
        //ms placement co
        ms_bco(true);
    
        //ms bolt co
        ms_co_spacing() {
            translate([0,0,-14-1]) cylinder(r=m3_v_r,h=50);
            translate([0,0,-50-5.15-2]) {
                cylinder(r=2.5+0.5,h=50-0.4);
                translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
                translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
            }
        }
    }
    
    //spring bolt co
    for(i=[25,32.5,40]) translate([20-i,25,0]) {
        cylinder(r=m3_v_r,h=50);
        translate([0,0,cam_z+(-10-1+5)-50-2]) {
            cylinder(r=2.5+0.5,h=50-0.4);
            translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
            translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
        }
    }
    
    mirror([0,1,0]) translate([0,0,0]) {
        //front bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            for(j=[(box_hgth-7.5),-(box_hgth-7.5)]) {
                //use hex nuts for front bolt closure
                //translate([(70-7.5),j,-1]) cylinder(r=m4_v_r,h=100);
                //translate([(70-7.5),j,80]) m4_co(25,false,8,8,true,true);
                
                //use insert nuts
                translate([(box_widh-7.5),j,50]) {
                    translate([0,0,-25]) cylinder(r=m4_v_r,h=100);
                    translate([0,0,-8-0.5]) cylinder(r=(5.8+0.3+0.2)/2,h=50);
                    translate([0,0,-0.5]) cylinder(r1=(5.8+0.3+0.2)/2,r2=(5.8+0.3+0.2)/2+2,h=2);
                }
            }
        }
    }
    
    //inner lid bolt and insert nut cutouts
    for(i=[0-5,90,180,270-5]) rotate([0,0,i]) translate([37.5,37.5,0]) {
        translate([0,0,-25]) cylinder(r=m4_v_r,h=100);
        translate([0,0,-50+50-5-5]) {
            cylinder(r=(5.8+0.3+0.2)/2,h=50-0.4);
            translate([-m4_v_r,-m4_v_r,0]) cube([2*m4_v_r,2*m4_v_r,50]);
            translate([-sqrt(pow((5.8+0.3+0.2)/2,2)-pow(m4_v_r,2)),-m4_v_r,0]) cube([2*sqrt(pow((5.8+0.3+0.2)/2,2)-pow(m4_v_r,2)),2*m4_v_r,50-0.2]);
        }
        hull() {
            translate([0,0,-50+50-5-5-8]) cylinder(r=(5.8+0.3+0.2)/2,h=50);
            translate([0,0,-50+50-5-5-8-0.75]) cylinder(r=(5.8+0.3+0.2)/2+0.75,h=50);
        }
    }
    
    //cable hole co
    for(i=[0,1]) mirror([i,0,0]) {
        translate([(70-5-5-2.5),30,7.5]) rotate([0,0,90]) {
            //cable co
            hull() for(ix=[(6-2),-(6-2)]) for(iz=[(4-2),-(4-2)]) translate([ix,-0.75+2+0.01,-1+3+iz]) rotate([90,0,0]) {
                cylinder(r=2,h=50+50);
                translate([-2*tan(22.5),-2,0]) cube([2*2*tan(22.5),2*2,50+50]);
            }
        }
    }
    
    //translate([-100,-100,-1]) cube([200,200,1+8]);
}



module cam_track() difference() {
    cam_inc = 90/$fn;
    
    intersection() {
        translate([-ah_wh-5,-50/2,0]) cube([5+ah_w+10,50,8]);
        cylinder(r=25,h=8,$fn=$fn*4);
    }
    
    for(i=[-90:cam_inc:90-cam_inc]) {
        hull() {
            rotate([0,0,i]) translate([20,-25,-1]) rotate([0,0,-atan(10/50)*abs(i/90)]) translate([-20,--25,0]) {
                translate([20,0,0]) cylinder(r=6.5,h=20);
            }
            rotate([0,0,i+cam_inc]) translate([20,-25,-1]) rotate([0,0,-atan(10/50)*abs((i+cam_inc)/90)]) translate([-20,--25,0]) {
                translate([20,0,0]) cylinder(r=6.5,h=20);
            }
        }
        hull() {
            rotate([0,0,i]) translate([20,-25,-1]) rotate([0,0,-atan(10/50)*abs(i/90)]) translate([-20,--25,0]) {
                translate([20,0,0]) cylinder(r1=6.5+1.5,r2=6.5,h=1.5);
            }
            rotate([0,0,i+cam_inc]) translate([20,-25,-1]) rotate([0,0,-atan(10/50)*abs((i+cam_inc)/90)]) translate([-20,--25,0]) {
                translate([20,0,0]) cylinder(r1=6.5+1.5,r2=6.5,h=1.5);
            }
        }
        hull() {
            rotate([0,0,i]) translate([20,-25,-1]) rotate([0,0,-atan(10/50)*abs(i/90)]) translate([-20,--25,0]) {
                translate([20,0,1+8-0.5]) cylinder(r1=6.5,r2=6.5+1.5,h=1.5);
            }
            rotate([0,0,i+cam_inc]) translate([20,-25,-1]) rotate([0,0,-atan(10/50)*abs((i+cam_inc)/90)]) translate([-20,--25,0]) {
                translate([20,0,1+8-0.5]) cylinder(r1=6.5,r2=6.5+1.5,h=1.5);
            }
        }
    }
    
    //recess for handle stem
    translate([0,0,8-2]) intersection() {
        cylinder(r=ah_s_r+0.375,h=50,$fn=$fn*2);
        translate([-ah_wh-0.375,-ah_lh-0.375,0]) cube([ah_w+2*0.375,ah_l+2*0.375,100]);
    }
    
    //pivot bolt hole
    translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
    
    //bottom thrust bearing
    translate([0,0,tb_recess]) mirror([0,0,1]) {
        cylinder(r=5+0.25,h=50);
        hull() {
            translate([0,0,1]) cylinder(r=5+0.25,h=50);
            translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
        }
        intersection() {
            translate([0,0,-0.2]) cylinder(r=(5+0.25)/cos(30),h=50,$fn=3);
            translate([0,0,-1]) cylinder(r=5+0.25,h=50);
        }
        rotate([0,0,30]) translate([0,0,-0.4]) cylinder(r=(m4_v_r+1)/cos(30),h=50,$fn=6);
    }
}

module cam_lever() difference() {
    union() {
        hull() {
            translate([20,0,0]) cylinder(r=4+1,h=10);
            translate([20,0,0]) cylinder(r=4,h=10+1);
        }
        hull() {
            translate([20,25,0]) cylinder(r=5,h=5);
            translate([20,0,0]) cylinder(r=7.5,h=5);
        }
        hull() {
            translate([20,0,0]) cylinder(r=7.5,h=10);
            translate([20,-25,0]) cylinder(r=10,h=10);
        }
        *hull() {
            translate([20,0,0]) cylinder(r=7.5,h=10);
            translate([20+5,0,0]) cylinder(r=7.5,h=10);
        }
    }
    
    //nut for cam bearings
    translate([20,0,10]) m4_co(25,false,10,5,false,true);
    
    //pivot bolt hole
    translate([20,-25,-1]) cylinder(r=m4_v_r+1,h=50);
    
    //bottom thrust bearing
    translate([20,-25,tb_recess]) mirror([0,0,1]) {
        cylinder(r=5+0.25,h=50);
        hull() {
            translate([0,0,1]) cylinder(r=5+0.25,h=50);
            translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
        }
        intersection() {
            translate([0,0,-0.2]) cylinder(r=(5+0.25)/cos(30),h=50,$fn=3);
            translate([0,0,-1]) cylinder(r=5+0.25,h=50);
        }
        rotate([0,0,30]) translate([0,0,-0.4]) cylinder(r=(m4_v_r+1)/cos(30),h=50,$fn=6);
    }
    
    //top thrust bearing
    translate([20,-25,10-tb_recess]) {
        cylinder(r=5+0.25,h=50);
        hull() {
            translate([0,0,1]) cylinder(r=5+0.25,h=50);
            translate([0,0,1+0.5]) cylinder(r=5+0.25+0.5,h=50);
        }
    }
    
    //spring bolt co
    translate([20,25,0]) {
        cylinder(r=m3_v_r,h=50);
        translate([0,0,-50+5-1]) {
            cylinder(r=2.5+0.5,h=50-0.4);
            translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
            translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
        }
    }
}

module inner_lid() difference() {
    union() {
        hull() for(i=[0-5,90,180,270-5]) rotate([0,0,i]) translate([37.5,37.5,-5]) cylinder(r=7.5,h=5);
        
        difference() {
            translate([0,0,-5]) cylinder(r=ag_r-7.5/2-0.5,h=5+5,$fn=$fn*4);
            
                        
            *translate([0,0,5-1.2]) hull() {
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
                
        intersection() {
            for(i=[-3:3]) translate([i*8*sqrt(2),0,0]) rotate([0,0,45]) translate([-2,-100,0]) cube([4,200,5-1.2+0.4]);
            cylinder(r=ag_r-7.5/2-0.5,h=5);
        }
    }
    translate([0,0,-5-1]) cylinder(r=ah_s_r+0.5,h=50);
    
    translate([0,0,5-1.2]) cylinder(r1=ah_s_r+0.5+1,r2=ah_s_r+0.5+1+50,h=50);
    
    for(i=[0-5,90,180,270-5]) rotate([0,0,i]) translate([37.5,37.5,-5]) m4_co(24,false,1.5);
}

module abrt_box_lid() {
    difference() {
        union() {
            difference() {
                box_lid(box_widh,box_widh,box_hgth,box_hgth);
                
                //bolt co
                for(i=[0,1]) mirror([i,0,0]) {
                    translate([(box_widh-7.5),(box_hgth-7.5),0]) {
                        translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                        box_lid_bolt_c_co();
                    }
                    translate([(box_widh-7.5),-(box_hgth-7.5),0]) mirror([0,1,0]) {
                        translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                        box_lid_bolt_c_co();
                    }
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
                    
                    for(j=[0,1]) translate([0,0,j*(ag_h+2.5)]) mirror([0,0,j]) hull() {
                        scale([(10+2.5)/sqrt(2),(10+2.5)/sqrt(2),1]) rotate([0,0,45]) translate([-0.5,-0.5,0]) cube([1,1,5+2.5]);
                        scale([(10+5+2.5)/sqrt(2),(10+5+2.5)/sqrt(2),1]) rotate([0,0,45]) translate([-0.5,-0.5,0]) cube([1,1,5]);
                    }
                }
            }
            
            *translate([0,0,0]) hull() {
                cylinder(r=ah_s_r,h=5,$fn=$fn*2);
                cylinder(r=ah_s_r+1.2,h=5-1.2,$fn=$fn*2);
            }
            
            *intersection() {
                for(i=[-3:3]) translate([i*8*sqrt(2),0,0]) rotate([0,0,45]) translate([-2,-50,0]) cube([4,100,5-1.2+0.4]);
                cylinder(r=40,h=5);
            }
        }
        
        translate([0,0,-1]) cylinder(r=ag_r-7.5/2,h=100,$fn=$fn*4);
        
        /*translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
        
        translate([0,0,5-3]) cylinder(r=5+0.15,h=50);
        
        hull() {
            translate([0,0,5-2]) cylinder(r=5+0.15,h=50);
            translate([0,0,5-1]) cylinder(r=5+1+0.15,h=50);
        }*/
    }
}

module abrt_handle() translate([0,0,(ah_d-ah_h)]) {
    difference() {
        union() {
            //handle tee
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
            
            //arrow
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
            
            //hazard marker lines
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
                for(j=[-2:2]) translate([ah_wh-ah_b-ws_w/2,j*15,ah_h]) rotate([0,0,-45+90*i]) hull() {
                    translate([-ws_w/2,-25,0.5]) cube([ws_w,50,50]);
                    translate([-ws_w/2+0.5,-25,0]) cube([ws_w-2*0.5,50,50]);
                }
            }
            
            //stem
            translate([0,0,-(ah_d-ah_h)]) intersection() {
                cylinder(r=ah_s_r,h=ah_d-ah_h/2,$fn=$fn*2);
                translate([-ah_wh,-ah_lh,0]) cube([ah_w,ah_l,100]);
            }
        }
        
        //nut cutout
        translate([0,0,-(ah_d-ah_h)]) rotate([0,0,90]) {
            translate([0,0,-1]) {
                cylinder(r=m4_h_r,h=1+4+8+8);
                translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,1+4+8+8]);
            }
            translate([0,0,4]) m4_endnut_vert_co();
        }
    }
}