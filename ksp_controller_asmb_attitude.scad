$fn=16;

expl = 0;
//$vpr = [60, 0, 45];
//$vpt = [0, 0, 75];
//$vpd = 1000;
$t=0.75;



include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_attitude.scad>;
include <ksp_controller_module_base.scad>;

//piv_a = sin($t*360)*1*ms_p_a*2;
//piv_b = sin($t*360+90)*1*ms_p_a*1.5;
piv_a = -ms_p_a*0;
piv_b = ms_p_a*0;

base();
upright();
upright_withcam();

union() {
    rotate([piv_b,0,0]) {
        rotate([0,piv_a,0]) {
            piv_in();
            translate([0,0,8]) camactutor();
            translate([0,brh+8+8,8+8+6]) {
                rotate([90,0,0]) cylinder(r=6.5,h=8);
            }
            translate([0,0,8+35]) rotate([0,0,180]) import("STLs/ksp_controller_module_attitude_handle.stl");
        }
        piv_out_camcent();
        translate([0,0,8]) camactuator_out();
        rotate([0,0,90]) translate([0,brh+8+8,8+8+6]) {
            rotate([90,0,0]) cylinder(r=6.5,h=8);
        }
        
        def = piv_a;
        piv_def = abs(def/2);
        //piv_def = pow(def/8,2);
        //piv_def = abs(def/2)/2 + pow(def/8,2)/2;
        piv_def_ang = asin(piv_def/32);
        
        translate([0,brh+8+4,8+8]) {
            translate([24,0,0]) rotate([0,-piv_def_ang,0]) translate([-24,0,0]) camlever(0);
            translate([-24,0,0]) rotate([0,piv_def_ang,0]) translate([24,0,0]) camlever(1);
        }
    }
    
    
    rotate([0,0,90]) {
        translate([0,brh+8+4,8+8]) translate([24,0,0]) rotate([0,-abs(piv_b),0]) translate([-24,0,0]) camlever(0);
        translate([0,brh+8+4,8+8]) translate([-24,0,0]) rotate([0,abs(piv_b),0]) translate([24,0,0]) camlever(1);
    }
    
}


*union() {
    *translate([0,0,8]) piv_out_camcent();
    *translate([0,0,4]) {
        *translate([-(24+8+5),16,0]) rotate([-90,0,0]) camlever(0);
        translate([(24+8+5),-16,0]) rotate([90,0,0]) camlever(1);
    }
    
    *translate([55,0,0]) camactutor(); 
    *translate([60,50,4-0.5]) camspacer();
}


*difference() {
    att_box_frame();
    translate([-100,-100,64-16]) cube([200,200,200]);
}


//prototype test for frame
*union() {
    intersection() {
        !att_box_frame();
        
        *union() {
            hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                translate([60-5,25-5,-1]) cylinder(r=5,h=64);
            }
            
            for(i=[0,1]) mirror([i,0,0]) hull() for(j=[0,1]) mirror([0,j,0]) {
                translate([60-5,30-5,-1]) cylinder(r=5,h=64);
                translate([brh+10+5,30-5,-1]) cylinder(r=5,h=64);
            }
            
            hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                translate([60-5,30-5,0]) cylinder(r=5,h=10+6.85+5.15);
                translate([60-5-17.5,30-5+17.5,0]) cylinder(r=5,h=10+6.85+5.15);
            }
            
            *hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                translate([45-5,30-5,10+6.85-2.5]) cylinder(r=5,h=2.5+5.15);
                translate([45-5-17.5,30-5+17.5,10+6.85-2.5]) cylinder(r=5,h=2.5+5.15);
            }
        }
        union() {
            for(i=[0,1]) mirror([i,0,0]) hull() for(j=[0,1]) mirror([0,j,0]) {
                translate([brh+5,5,0]) cylinder(r=5,h=64-8);
            }
            hull() for(i=[0,1]) mirror([i,0,0]) for(j=[0,1]) mirror([0,j,0]) {
                translate([brh+5,5,0]) cylinder(r=5,h=10+6.85+5.15);
            }
            for(i=[0,180]) rotate([0,0,i]) hull() {
                translate([5,32.5,0]) cylinder(r=5,h=10+6.85+5.15);
                translate([20,0,0]) cylinder(r=5,h=10+6.85+5.15);
                translate([-20,0,0]) cylinder(r=5,h=10+6.85+5.15);
                translate([-20,32.5,0]) cylinder(r=5,h=10+6.85+5.15);
            }
        }
    }
    *translate([0,0,10+6.85+5.15]) for(i=[0,2]) ms_spacing(i) ms();
}

//attitude assembly
*union() {
    translate([0,0,64-16]) {
        *rotate([sin($t*360)*ms_p_a,0,0]) {
            translate([0,0,expl*3]) piv_out();
            rotate([0,sin($t*360+90)*ms_p_a,0]) {
                translate([0,0,expl*5]) piv_in();
                translate([0,0,expl*6]) difference() {
                    hull() {
                        translate([0,-6,8]) cylinder(r=12,h=35);
                        translate([0,6,8]) cylinder(r=12,h=35);
                    }
                    for(i=[0,2]) rotate([0,0,i*90]) translate([0,-8-4,-8-1]) cylinder(r=m4_v_r,h=100);
                }
                *translate([0,0,expl*6]) translate([0,0,35]) import("STLs/ksp_controller_module_attitude_handle.stl");
            }
            *translate([0,0,expl*4]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
        }
        *translate([0,0,expl*2]) rotate([0,0,90]) for(i=[0,1]) mirror([0,i,0]) translate([0,-brh-8,0]) rotate([90,0,0]) screw();
    }
    translate([0,0,expl*1]) translate([0,0,10+6.85+5.15]) for(i=[0,2]) ms_spacing(i) ms();
    *translate([0,0,expl*6]) att_box_lid();
    translate([0,0,expl*-2]) att_box_frame();
}