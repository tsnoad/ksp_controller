$fn=72;

//$vpr = [60, 0, 45];
//$vpt = [0, 0, 0];
//$vpd = 875;

include <../ksp_controller_include.scad>;
include <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;

b_r = 60;

m_w = 2;
m_wh = m_w / 2;

mt_w = 1.5;
mt_wh = mt_w / 2;

pi=3.141592654;

rotate([0,$t*360,0]) {
    fdai_pitch_yoke();
    
    //roll bearings
    *translate([0,60+2+2+8+27.5-2.5,0]) rotate([-90,0,0]) {
        difference() {
            union() {
                cylinder(r=35/2,h=10);
                translate([0,0,10+8]) cylinder(r=35/2,h=10);
            }
            translate([0,0,-1]) cylinder(r=20/2,h=100);
        }
    }
    
    
    
    //roll pulley
    *translate([0,(60+2+2+8+27.5-2.5+10+8+10)+12,0]) rotate([90,0,0]) {
        difference() {
            union() {
                gt2_pulley(48,12);
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
    
        
    //slipring
    *translate([60+2+2+2-1.2,0,0]) rotate([0,90,0]) {
        cylinder(r=12,h=1.2);
        cylinder(r=6.25,h=13.5);
    }
    
    //pitch motor
    *translate([-(60+2+2+8-2.4),sqrt(pow(79.8,2)-pow(20,2)),20]) rotate([0,-90,0]) rotate([0,0,180]) motor();
    
    //pitch pulley
    translate([-(60+2+2+8+2),0,0]) rotate([0,-90,0]) difference() {
        union() {
            gt2_pulley(32,12);
            cylinder(r=8,h=45-6-8-12);
        }
        translate([0,0,-1]) cylinder(r=m4_v_r,h=100);
    }
    
    //pitch bearings
    translate([-(60+2),0,0]) rotate([0,-90,0]) {
        difference() {
            union() {
                cylinder(r=10/2,h=4);
                translate([0,0,4+4]) cylinder(r=10/2,h=4);
            }
            translate([0,0,-1]) cylinder(r=2,h=100);
        }
    }
    
    *#translate([-(60+2-8),0,0]) rotate([0,-90,0]) m4_co(45,false,45-6,0.01);
    
    rotate([$t*360,0,0]) {
        rotate([0,0,90]) fdai_yaw_equator();
        
        //yaw motor
        *rotate([0,0,90]) translate([0,22.9,22.5]) motor();
        
        fdai_ball_upper();
    }
}

!fdai_ball_upper();



module gt2_pulley(teeth=32, pulley_t_ht=12) {
    //teeth = 48;
    pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
    //pulley_t_ht = 12;
    
    tooth_depth = 0.764;
    tooth_width = 1.494;
    additional_tooth_width = 0.2;
    
    tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
    tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
    tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth);
    
   
    
    difference() {
        rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=pulley_t_ht, $fn=teeth*4);

        for(i=[1:teeth]) rotate([0,0,i*(360/teeth)]) translate([0,-tooth_distance_from_centre,pulley_b_ht -1]) scale ([ tooth_width_scale , tooth_depth_scale , 1 ])  {
            linear_extrude(height=pulley_t_ht+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
        }
    }
}

module fdai_ball_co_stadia() {
    /*difference() {
        intersection() {*/
            //lat circle at 80
            hull() {
                cylinder(r=mt_wh,h=100);
                $fn = $fn*2;
                for(j=[0:360/$fn:45]) {
                    rotate([0,0,j]) rotate([90-80,0,0]) cylinder(r=mt_wh,h=100);
                }
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
    
    /*difference() {
        intersection() {*/
            //longitude lines
            union() {
            //for(i=[0:45:360-45]) rotate([0,0,i]) {
                hull() {
                    rotate([90-asin((5)/b_r)-asin((3*m_wh)/b_r),0,0]) cylinder(r=m_wh,h=100);
                    rotate([90-45+asin((12/2)/b_r),0,0]) cylinder(r=m_wh,h=100);
                }
                
                hull() {
                    rotate([90-80+asin((3*mt_wh)/b_r),0,0]) cylinder(r=mt_wh,h=100);
                    rotate([90-45-asin((12/2)/b_r),0,0]) cylinder(r=mt_wh,h=100);
                }
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
    
    /*difference() {
        intersection() {*/
            //lat ring at 45
            union() {
            //for(i=[0:45:360-45]) rotate([0,0,i]) {
                $fn = $fn*2;
                start_a = asin((24/2)/(b_r*sin(90-45)));
                end_a = 45-asin((24/2)/(b_r*sin(90-45)));
                
                for(j=[start_a:360/$fn:end_a]) hull() {
                    rotate([0,0,j]) rotate([90-45,0,0]) cylinder(r=m_wh,h=100);
                    rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-45,0,0]) cylinder(r=m_wh,h=100);
                }
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
    
    /*difference() {
        intersection() {*/
            //lat ring at 75
            union() {
            //for(i=[0:45:360-45]) rotate([0,0,i]) {
                l=75;
                $fn = $fn*2;
                start_a = asin((m_wh+2*mt_wh)/(b_r*sin(90-l)));
                end_a = 45-asin((m_wh+2*mt_wh)/(b_r*sin(90-l)));
                
                for(j=[start_a:360/$fn:end_a]) hull() {
                    rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100);
                    rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100);
                }
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
    
    /*difference() {
        intersection() {*/
            //lat markers at 10,20,30 deg
            union() {
            //for(i=[0:45:360-45]) rotate([0,0,i]) {
                for(l=[15,30,60]) {
                    $fn = $fn*2;
                    if(l<=45) {
                        //start_a = asin((m_wh*3)/(50*sin(90-l)));
                        start_a = -22.5+asin((12/2)/(b_r*sin(90-l)));
                        end_a = 22.5-asin((12/2)/(b_r*sin(90-l)));
        
                        for(j=[start_a:360/$fn:end_a]) hull() {
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100);
                        }
                    } else {
                        //start_a = asin((m_wh*3)/(50*sin(90-l)));
                        start_a = -22.5+asin((12/2)/(b_r*sin(90-l)));
                        end_a = 22.5-asin((12/2)/(b_r*sin(90-l)));
        
                        for(j=[start_a:360/$fn:end_a]) hull() {
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100);
                        }
                    }
                }
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
    
    /*difference() {
        intersection() {*/
            //small lat markers at 15,25,35
            union() {
            //for(i=[0:45:360-45]) rotate([0,0,i]) {
                for(l=[10,20,25,35,55,65,70]) {
                    if(l<=45) {
                        $fn = $fn*2;
                        //start_a = asin((m_wh*3)/(50*sin(90-l)));
                        start_a = (-22.5+asin((12/2)/(b_r*sin(90-l))))*1/2;
                        end_a = (22.5-asin((12/2)/(b_r*sin(90-l))))*1/2;
        
                        for(j=[start_a:360/$fn:end_a]) hull() {
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100);
                        }
                    } else {
                        $fn = $fn*2;
                        //start_a = asin((m_wh*3)/(50*sin(90-l)));
                        start_a = (-22.5+asin((12/2)/(b_r*sin(90-l))))*1/2;
                        end_a = (22.5-asin((12/2)/(b_r*sin(90-l))))*1/2;
        
                        for(j=[start_a:360/$fn:end_a]) hull() {
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100);
                        }
                    }
                }
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
}

module fdai_ball_co_labels_upper() {
    /*difference() {
        intersection() {*/
            union() {
                rotate([0,0,0]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_n.svg");
                rotate([0,0,45]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_045.svg");
                rotate([0,0,90]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_090.svg");
                rotate([0,0,135]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_135.svg");
                rotate([0,0,180]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_180.svg");
                rotate([0,0,225]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_225.svg");
                rotate([0,0,270]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_270.svg");
                rotate([0,0,315]) rotate([90-45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_315.svg");
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
}

module fdai_ball_co_labels_lower() {
    difference() {
        intersection() {
            union() {
                rotate([0,0,0]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_n.svg");
                rotate([0,0,45]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_045.svg");
                rotate([0,0,90]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_090.svg");
                rotate([0,0,135]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_135.svg");
                rotate([0,0,180]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_180.svg");
                rotate([0,0,225]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_225.svg");
                rotate([0,0,270]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_270.svg");
                rotate([0,0,315]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_label_315.svg");
            }
            sphere(r=50+m_wh);
        }
        sphere(r=50-m_wh);
    }
}

module fdai_ball_co_stadia_labels_upper() {
    /*difference() {
        intersection() {*/
            union() {
                rotate([0,0,22.5]) rotate([90-15,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_labellat_15.svg");
                rotate([0,0,22.5]) rotate([90-30,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_labellat_30.svg");
                rotate([0,0,22.5]) rotate([90-60,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_labellat_60.svg");
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
}

module fdai_ball_co_stadia_labels_lower() {
    difference() {
        intersection() {
            union() {
                rotate([0,0,22.5]) rotate([90+15,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_labellat_15.svg");
                rotate([0,0,22.5]) rotate([90+30,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_labellat_30.svg");
                rotate([0,0,22.5]) rotate([90+60,0,0]) scale([8/16,8/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("fdai_labellat_60.svg");
            }
            sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }
}

*fdai_ball_co_stadia();
*fdai_ball_co_stadia_labels_upper();
*fdai_ball_co_stadia_labels_lower();
*fdai_ball_co_labels_upper();
*fdai_ball_co_labels_lower();

*fdai_ball_solid_upper();

module fdai_ball_solid_upper() {
    difference() {
        sphere(r=b_r);
                
        for(i=[0:45:360-45]) rotate([0,0,i]) {
            fdai_ball_co_stadia();
            fdai_ball_co_stadia_labels_upper();
        }
        fdai_ball_co_labels_upper();
        translate([-100,-100,-5-1]) cube([200,200,10+2]);
        translate([-100,-100,-100]) cube([200,200,100]);
    }
    difference() {
        sphere(r=b_r-m_wh);
        translate([-100,-100,-5-1]) cube([200,200,10+2]);
        translate([-100,-100,-100]) cube([200,200,100]);
    }
            
    /*difference() {
        sphere(r=b_r);
                
        for(i=[0:45:360-45]) rotate([0,0,i]) {
            fdai_ball_co_stadia();
            fdai_ball_co_stadia_labels_upper();
            *import("fdai_ball_co_stadia.stl",convexity=10);
            *import("fdai_ball_co_stadia_labels_upper.stl",convexity=10);
        }
        
        fdai_ball_co_labels_upper();
        *import("fdai_ball_co_labels_upper.stl",convexity=10);
        
        translate([-100,-100,-5-1]) cube([200,200,10+2]);
        translate([-100,-100,-100]) cube([200,200,100]);
    }*/
}

module fdai_ball_solid_lower() {
    difference() {
        sphere(r=50,$fn=$fn*2);
        mirror([0,0,1]) import("/Users/tsnoad/Things/ksp_controller/fdai_co1.stl",convexity=10);
                
        for(i=[0:45:360-45]) rotate([0,0,i]) {
            mirror([0,0,1]) import("/Users/tsnoad/Things/ksp_controller/fdai_co2.stl",convexity=10);
            import("/Users/tsnoad/Things/ksp_controller/fdai_co3b.stl",convexity=10);
        }
        
        import("/Users/tsnoad/Things/ksp_controller/fdai_co4b.stl",convexity=10);
    
        
        translate([-100,-100,-5-1]) cube([200,200,10+2]);
        translate([-100,-100,0]) cube([200,200,100]);
    }
}

//fdai ball upper
module fdai_ball_upper() difference() {
    union() {
        difference() {
            fdai_ball_solid_upper();
            
            /*sphere(r=b_r);
            
            //cut away the equator
            translate([-100,-100,-5-1]) cube([200,200,10+2]);
            //cut away the lower hemisphere
            translate([-100,-100,-5-1]) cube([200,200,2*(5+1)]);
            translate([-100,-100,-100]) cube([200,200,100]);
            
            //import("/Users/tsnoad/Things/ksp_controller/fdai/fdai_b.stl",convexity=10);*/
            
            //cut away the interior of the sphere
            for(i=[0,1]) mirror([0,0,i]) hull() {
                translate([0,0,0]) cylinder(r=(60-4)*sin(22.5),h=(60-4)*cos(22.5));
                translate([0,0,0]) cylinder(r=(60-4)*cos(22.5),h=(60-4)*sin(22.5));
            }
        }
        
        intersection() {
            sphere(r=60);
            translate([0,0,5+1]) cylinder(r=7.5,h=100);
        }
        
        //axial stem
        translate([0,0,5+1]) cylinder(r=7.5,h=(60-4)*cos(22.5)-(5+1)+1);
        
        translate([0,0,5+1]) {
            teeth = 38;
            pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
            pulley_t_ht = (60-4)*cos(22.5)-(5+1)+1;
            
            tooth_depth = 0.764;
            tooth_width = 1.494;
            additional_tooth_width = 0.2;
            
            tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
            tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
            tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth);
            
            
            translate([0,0,-(5+1)+22.5+7-2+(14-1.5-7)+7+1]) hull() {
                rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2-1,h=pulley_t_ht-(-(5+1)+22.5+7-2+(14-1.5-7))-7-1, $fn=teeth*4);
                translate([0,0,1]) rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=pulley_t_ht-(-(5+1)+22.5+7-2+(14-1.5-7))-7-1-1, $fn=teeth*4);
            }
            
            translate([0,0,-(5+1)+(60-4)*cos(22.5)-5]) hull() {
                cylinder(r1=pulley_OD/2,r2=pulley_OD/2+5+1,h=5+1);
            }
            
            difference() {
                union() hull() {
                    translate([0,0,-(5+1)+22.5+1.6]) cylinder(r=7.5,h=pulley_t_ht-(-(5+1)+22.5+1.6));
                    translate([0,0,-(5+1)+22.5+7-2+(14-1.5-7)-1]) rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=pulley_t_ht-(-(5+1)+22.5+7-2+(14-1.5-7))+1, $fn=teeth*4);
                }
        
                for(i=[1:teeth]) rotate([0,0,i*(360/teeth)]) translate([0,-tooth_distance_from_centre,pulley_b_ht -1]) scale ([ tooth_width_scale , tooth_depth_scale , 1 ])  {
                    linear_extrude(height=pulley_t_ht+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
                }
            }
        }
    }
    
    m4_co(24.1,false,5+1+4,5+1+4);
    
    //cut away one side (just so we can see if everthing fits)
    //translate([0,-100,-100]) cube([100,200,200]);
}


module motor() translate([0,0,-60]) {
    cylinder(r=12.5,h=60);
    cylinder(r=3.5,h=60+2.4);
    cylinder(r=2,h=60+22);
    rotate([0,0,90]) translate([-7,0,0]) cube([14,20,7]);

    translate([0,0,60+7-2]) {
        difference() {
            teeth = 16;
            pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
            pulley_t_ht = 14;
            
            tooth_depth = 0.764;
            tooth_width = 1.494;
            additional_tooth_width = 0.2;
            
            tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
            tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
            tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth) ;
            
            translate([0,0,0]) rotate ([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=pulley_t_ht, $fn=teeth*4);
	
			for(i=[1:teeth]) rotate([0,0,i*(360/teeth)]) translate([0,-tooth_distance_from_centre,pulley_b_ht -1]) scale ([ tooth_width_scale , tooth_depth_scale , 1 ])  {
                linear_extrude(height=pulley_t_ht+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
			}
        }

        translate([0,0,0]) pulley ( "GT2 2mm" , GT2_2mm_pulley_dia , 0.764 , 1.494 );
        translate([0,0,14-1.5]) cylinder(r=6.5,h=1.5);
        translate([0,0,0]) cylinder(r=6.5,h=14-7-1.5);
    }
}

*difference() {
    union() {
        difference() {
            /*sphere(r=50-2);
            translate([-100,-100,-5-1]) cube([200,200,10+2]);
            translate([-100,-100,-100]) cube([200,200,100]);*/
            import("/Users/tsnoad/Things/ksp_controller/fdai2.stl",convexity=10);
            mirror([0,0,1]) hull() {
                translate([0,0,0]) cylinder(r=(50-4)*sin(22.5),h=(50-4)*cos(22.5));
                translate([0,0,0]) cylinder(r=(50-4)*cos(22.5),h=(50-4)*sin(22.5));
            }
        }
        mirror([0,0,1]) {
            hull() {
                translate([0,0,5+1]) cylinder(r=7.5-2.5,h=(50-4)*cos(22.5)-(5+1)+1);
                translate([0,0,5+1+2.5]) cylinder(r=7.5,h=(50-4)*cos(22.5)-2.5-(5+1)+1);
            }
            translate([0,0,(50-4)*cos(22.5)-2]) cylinder(r1=7.5,r2=7.5+2+1,h=2+1);
            intersection() {
                sphere(r=50);
                translate([0,0,20]) cylinder(r=m4n_v_r/cos(30)+2,h=100);
            }
        }
    }
    m4_co(25,false,5+1+4,5+1+4);
}


*import("/Users/tsnoad/Things/ksp_controller/fdai_b.stl",convexity=10);
*import("/Users/tsnoad/Things/ksp_controller/fdai_b3.stl",convexity=10);


//face
*rotate([90,0,0])
difference() {
    f_a = 45+22.5;
    
    *translate([-60,-60,(b_r+2)*cos(f_a)-5]) {
        cube([120,120,5+8]);
    }
    translate([0,0,(b_r+2)*cos(f_a)-5]) hull() for(i=[-1,1]) for(j=[-1,1]) {
        translate([i*(95-5),j*(95-5),0]) cylinder(r=5,h=5+8-2.5);
        translate([i*(95-5),j*(95-5),0]) cylinder(r=5-2.5,h=5+8);
    }
    
    translate([0,0,(b_r+2)*cos(f_a)-5]) for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
        translate([(95-7.5),(95-7.5),8]) box_lid_bolt_c_co();
        translate([(95-7.5),(95-7.5),-1]) cylinder(r=m4_v_r,h=50);
    }
    
    *sphere(r=50+2);
    cylinder(r1=(b_r+2)/cos(90-(f_a)),r2=0,h=(b_r+2)/cos(f_a),$fn=$fn*2);
    cylinder(r1=0,r2=100*tan(f_a),h=100,$fn=$fn*2);
    
    hull() for(i=[0:45:360-45]) rotate([0,0,i]) {
        translate([
            ((b_r+2)*cos(f_a)+8-1.2)*tan(f_a)-5+5,
            (((b_r+2)*cos(f_a)+8-1.2)*tan(f_a)-5+5)*tan(22.5),
            (b_r+2)*cos(f_a)+8-1.2
        ]) cylinder(r1=5,r2=5+100*tan(f_a),h=100);
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



*rotate([0,0,45]) rotate([0,90-45,0]) rotate([0,0,270]) difference() {
    sphere(r=50,$fn=$fn);
    translate([-100,-100,-5-1]) cube([200,200,10+2]);
}


*rotate([0,0,45]) rotate([0,90-45,0]) rotate([0,0,270]) {
    import("/Users/tsnoad/Things/ksp_controller/fdai.stl",convexity=10);
    import("/Users/tsnoad/Things/ksp_controller/fdai2.stl",convexity=10);
}



module fdai_yaw_equator() union() {
    difference() {
        union() {
            difference() {
                sphere(r=60,$fn=$fn*2);
                translate([0,0,-25]) cylinder(r=(60-4)*cos(22.5),h=50);
            }
            hull() {
                translate([0,0,-25]) cylinder(r=10,h=50);
                translate([0,22.9,-25]) cylinder(r=12.5+0.5+2.4+2,h=50);
            }
            
            translate([-10,-sqrt(pow(60-2,2)-pow(10,2)),-25]) cube([20,2*sqrt(pow(60-2,2)-pow(10,2)),50]);
            translate([-(12.5+0.5+2.4+2),22.9,-25]) cube([2*(12.5+0.5+2.4+2),sqrt(pow(60-2,2)-pow(10,2))-22.9,50]);
            
            translate([0,60+2,0]) rotate([90,0,0]) cylinder(r=8,h=2*(60+2));
        }
        
        difference() {
            for(i=[45,90,135,225,270,315]) rotate([0,0,i]) {
                hull() {
                    start_a = 90-asin((5)/60)+asin((2*m_wh)/60);
                    end_a = 90+asin((5)/60)-asin((2*m_wh)/60);
            
                    rotate([start_a,0,0]) cylinder(r=m_wh,h=100);
                    rotate([end_a,0,0]) cylinder(r=m_wh,h=100);
                }
            }
            sphere(r=60-m_wh);
        }
        
        translate([0,0,-25]) cylinder(r=m4_v_r+1,h=50);
        
        //cutout for thrust bearing
        for(i=[0,1]) mirror([0,0,i]) translate([0,0,5+1-4]) {
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
        
        
        translate([0,60-6,0]) for(i=[0,1]) mirror([0,0,i]) m4_endnut_b_co();
        translate([0,60-6-8,0]) rotate([-90,0,0]) hull() {
            cylinder(r=m4_h_r,h=100);
            translate([-m4_h_r*tan(22.5),-m4_h_r,0]) cube([2*m4_h_r*tan(22.5),2*m4_h_r,100]);
        }
        
        //cable routing and slipring interface
        translate([0,-100,0]) rotate([-90,0,0]) hull() {
            cylinder(r=(2.5+0.25),h=100-60+30);
            translate([-(2.5+0.25)*tan(22.5),-(2.5+0.25),0]) cube([2*(2.5+0.25)*tan(22.5),2*(2.5+0.25),100-60+30]);
        }
        hull() for(i=[-10,10]) translate([0,-60+30+i,0]) {
            cylinder(r=(2.5+0.25),h=20);
            sphere(r=(2.5+0.25));
            translate([0,0,-(2.5+0.25)]) cylinder(r=(2.5+0.25)*tan(22.5),h=20+(2.5+0.25));
        }
        
        translate([-100,-100,5]) cube([200,200,100]);
        translate([-100,-100,-100-5]) cube([200,200,100]);
        
        translate([0,22.9,-5-1]) cylinder(r=12.5+0.5,h=1+5+24);
    }
            
    translate([0,22.9,-5]) difference() {
        union() {
            hull() {
                cylinder(r=12.5+0.5+2.4,h=5+22.5+1.6-1);
                cylinder(r=12.5+0.5+2.4-1,h=5+22.5+1.6);
            }
            hull() {
                cylinder(r=12.5+0.5+2.4+2,h=10);
                cylinder(r=12.5+0.5+2.4,h=10+2);
            }
        }
        
        translate([0,0,-1]) cylinder(r=12.5+0.5,h=1+5+22.5);
        
        translate([-25,-50-(12.5+0.5+0.8),0]) cube([50,50,50]);
        
        rotate([0,0,30]) {
            translate([0,0,1]) cylinder(r=3.5+0.5,h=100);
            
            translate([10,0,-1]) cylinder(r=1.5+0.15,h=100);
            translate([-10,0,-1]) cylinder(r=1.5+0.15,h=100);
            
            translate([-sqrt(pow(12.5+0.5,2)-pow(3.5+0.5,2)),-(3.5+0.5),-1]) cube([2*sqrt(pow(12.5+0.5,2)-pow(3.5+0.5,2)),2*(3.5+0.5),1+5+22.5+0.2]);
            translate([-(3.5+0.5),-(3.5+0.5),-1]) cube([2*(3.5+0.5),2*(3.5+0.5),1+5+22.5+0.4]);
            
            translate([-(1.5+0.15)+10,-(3.5+0.5),-1]) cube([2*(1.5+0.15),2*(3.5+0.5),1+5+22.5+0.4]);
            translate([-(1.5+0.15)-10,-(3.5+0.5),-1]) cube([2*(1.5+0.15),2*(3.5+0.5),1+5+22.5+0.4]);
        }
        
    }
}

*intersection() {
    difference() {
        translate([0,0,-5]) cylinder(r=50+5+10,h=10);
        translate([0,0,-5-1]) cylinder(r=50+5,h=20);
    }
    translate([0,0,-50]) cube([100,100,100]);
}