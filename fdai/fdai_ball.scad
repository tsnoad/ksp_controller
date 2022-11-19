module fdai_ball_co_stadia() {
    /*difference() {
        intersection() {*/
            //lat circle at 80
            hull() {
                cylinder(r=mt_wh,h=100,$fn=$fn/4);
                $fn = $fn*2;
                for(j=[0:360/$fn:45]) {
                    rotate([0,0,j]) rotate([90-80,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
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
                    rotate([90-asin((5)/b_r)-asin((3*m_wh)/b_r),0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                    rotate([90-45+asin((12/2)/b_r),0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                }
                
                hull() {
                    rotate([90-80+asin((3*mt_wh)/b_r),0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
                    rotate([90-45-asin((12/2)/b_r),0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
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
                    rotate([0,0,j]) rotate([90-45,0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                    rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-45,0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
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
                    rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
                    rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
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
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                        }
                    } else {
                        //start_a = asin((m_wh*3)/(50*sin(90-l)));
                        start_a = -22.5+asin((12/2)/(b_r*sin(90-l)));
                        end_a = 22.5-asin((12/2)/(b_r*sin(90-l)));
        
                        for(j=[start_a:360/$fn:end_a]) hull() {
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
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
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=m_wh,h=100,$fn=$fn/4);
                        }
                    } else {
                        $fn = $fn*2;
                        //start_a = asin((m_wh*3)/(50*sin(90-l)));
                        start_a = (-22.5+asin((12/2)/(b_r*sin(90-l))))*1/2;
                        end_a = (22.5-asin((12/2)/(b_r*sin(90-l))))*1/2;
        
                        for(j=[start_a:360/$fn:end_a]) hull() {
                            rotate([0,0,j]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
                            rotate([0,0,min(end_a,j+360/$fn)]) rotate([90-l,0,0]) cylinder(r=mt_wh,h=100,$fn=$fn/4);
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
    /*difference() {
        intersection() {*/
            union() {
                rotate([0,0,0]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_n.svg");
                rotate([0,0,45]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_045.svg");
                rotate([0,0,90]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_090.svg");
                rotate([0,0,135]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_135.svg");
                rotate([0,0,180]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_180.svg");
                rotate([0,0,225]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_225.svg");
                rotate([0,0,270]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_270.svg");
                rotate([0,0,315]) rotate([90+45,0,0]) translate([-24/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_label_315.svg");
            }
            /*sphere(r=50+m_wh);
        }
        sphere(r=50-m_wh);
    }*/
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
    /*difference() {
        intersection() {*/
            union() {
                rotate([0,0,22.5]) rotate([90+15,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_labellat_15.svg");
                rotate([0,0,22.5]) rotate([90+30,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_labellat_30.svg");
                rotate([0,0,22.5]) rotate([90+60,0,0]) scale([12/16,12/16,1]) translate([-16/2,-12/2,0]) linear_extrude(height=100,convexity=10) import("label_svgs/fdai_labellat_60.svg");
            }
            /*sphere(r=b_r+m_wh);
        }
        sphere(r=b_r-m_wh);
    }*/
}

*fdai_ball_co_stadia();
*fdai_ball_co_stadia_labels_upper();
*fdai_ball_co_stadia_labels_lower();
*fdai_ball_co_labels_upper();
*fdai_ball_co_labels_lower();

*fdai_ball_solid_upper();

module fdai_ball_solid_upper() {
    difference() {
        sphere(r=b_r,$fn=$fn*2);
                
        for(i=[0:45:360-45]) rotate([0,0,i]) {
            fdai_ball_co_stadia();
            fdai_ball_co_stadia_labels_upper();
            //import("fdai_ball_co_stadia.stl",convexity=10);
            //import("fdai_ball_co_stadia_labels_upper.stl",convexity=10);
        }
        fdai_ball_co_labels_upper();
        //import("fdai_ball_co_labels_upper.stl",convexity=10);
        
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
        sphere(r=b_r,$fn=$fn*2);
                
        for(i=[0:45:360-45]) rotate([0,0,i]) {
            mirror([0,0,1]) fdai_ball_co_stadia();
            fdai_ball_co_stadia_labels_lower();
        }
        
        fdai_ball_co_labels_lower();
    
        translate([-100,-100,-5-1]) cube([200,200,10+2]);
        translate([-100,-100,0]) cube([200,200,100]);
    }
    difference() {
        sphere(r=b_r-m_wh);
        translate([-100,-100,-5-1]) cube([200,200,10+2]);
        translate([-100,-100,0]) cube([200,200,100]);
    }
}

module fdai_ball_upper_stem() {
    //translate([0,0,5+1]) cylinder(r=7.5,h=(60-4)*cos(22.5)-(5+1)+1);
    
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
                small_teeth = 22;
                small_pulley_OD = (2*((small_teeth*2)/(3.14159265*2)-0.254));
                
                translate([0,0,-(5+1)+(5+8+4+8)]) cylinder(r=small_pulley_OD/2,h=pulley_t_ht-(-(5+1)+(5+8+4+8)));
                
                translate([0,0,-(5+1)+22.5+7-2+(14-1.5-7)-1]) rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=pulley_t_ht-(-(5+1)+22.5+7-2+(14-1.5-7))+1, $fn=teeth*4);
            }
    
            for(i=[1:teeth]) rotate([0,0,i*(360/teeth)]) translate([0,-tooth_distance_from_centre,pulley_b_ht -1]) scale ([ tooth_width_scale , tooth_depth_scale , 1 ])  {
                linear_extrude(height=pulley_t_ht+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
            }
        }
    }
    
    translate([0,0,5+1]) {
        teeth = 22;
        pulley_OD = (2*((teeth*2)/(3.14159265*2)-0.254));
        pulley_t_ht = (60-4)*cos(22.5)-(5+1)+1;
        
        tooth_depth = 0.764;
        tooth_width = 1.494;
        additional_tooth_width = 0.2;
        
        tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
        tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
        tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth);
        
        hull() {
            cylinder(r=pulley_OD/2,h=-1+8+4+1);
            cylinder(r=7.5,h=-1+8+4+1-(7.5-pulley_OD/2));
        }
        
        difference() {
            translate([0,0,0]) rotate([0,0,360/(teeth*4)]) cylinder(r=pulley_OD/2,h=20, $fn=teeth*4);
    
            for(i=[1:teeth]) rotate([0,0,i*(360/teeth)]) translate([0,-tooth_distance_from_centre,pulley_b_ht -5]) scale ([ tooth_width_scale , tooth_depth_scale , 1 ])  {
                linear_extrude(height=pulley_t_ht+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
            }
        }
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
        fdai_ball_upper_stem();
    }
    
    m4_co(24.1,false,5+1+4,5+1+4);
    
    //cut away one side (just so we can see if everthing fits)
    //translate([0,-100,-100]) cube([100,200,200]);
}

//fdai ball upper
module fdai_ball_lower() difference() {
    union() {
        difference() {
            fdai_ball_solid_lower();
            
            /*difference() {
                sphere(r=b_r,$fn=$fn*2);
            
                translate([-100,-100,-5-1]) cube([200,200,10+2]);
                translate([-100,-100,0]) cube([200,200,100]);
            }*/
            
            //cut away the interior of the sphere
            for(i=[0,1]) mirror([0,0,i]) hull() {
                translate([0,0,0]) cylinder(r=(60-4)*sin(22.5),h=(60-4)*cos(22.5));
                translate([0,0,0]) cylinder(r=(60-4)*cos(22.5),h=(60-4)*sin(22.5));
            }
        }
        
        mirror([0,0,1]) intersection() {
            sphere(r=60);
            translate([0,0,5+1]) cylinder(r=7.5,h=100);
        }
        
        //axial stem
        mirror([0,0,1]) translate([0,0,5+1]) cylinder(r=7.5,h=(60-4)*cos(22.5)-(5+1)+1);
        
        mirror([0,0,1]) translate([0,0,5+1]) {
            translate([0,0,-(5+1)+(60-4)*cos(22.5)-5]) hull() {
                cylinder(r1=7.5,r2=7.5+5+1,h=5+1);
            }
        }
        

    }
    
    m4_co(24.1,false,5+1+4,5+1+4);
    
    //cut away one side (just so we can see if everthing fits)
    //translate([0,-100,-100]) cube([100,200,200]);
}