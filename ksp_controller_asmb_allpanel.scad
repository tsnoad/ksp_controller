$fn=36;

$vpr = [30, 30, 14];
$vpt = [0, 0, 0];
$vpd = 1300;
$t=1;

include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_base.scad>;

include <ksp_controller_module_cw.scad>;
include <ksp_controller_module_switches.scad>;
include <ksp_controller_module_attitude.scad>;
include <ksp_controller_module_translation.scad>;
include <ksp_controller_module_thrust.scad>;

//piv_a = sin($t*360)*1*ms_p_a*2;
//piv_b = sin($t*360+90)*1*ms_p_a*1.5;

piv_a = ms_p_a*0;
piv_b = ms_p_a*0;

asmb_n = 9;
asmb_a = 5000;
asmb_1_z = asmb_a*pow(min(0,($t-0.2)),2);
asmb_2_z = asmb_a*pow(min(0,($t-0.3)),2);
asmb_3_z = -asmb_a*pow(min(0,($t-0.4)),2);
asmb_4_z = -asmb_a*pow(min(0,($t-0.5)),2);
asmb_5_z = asmb_a*pow(min(0,($t-0.6)),2);
asmb_6_z = -asmb_a*pow(min(0,($t-0.7)),2);
asmb_7_z = asmb_a*pow(min(0,($t-0.8)),2);
asmb_8_z = asmb_a*pow(min(0,($t-0.9)),2);
asmb_9_z = asmb_a*pow(min(0,($t-1)),2);

offset = 140+50;

//switches
translate([-2*offset,0,0]) translate([0,0,-14-26]) {
    translate([0,0,80]) switch_box_lid();
    cw_box_frame();
}

//thrust
translate([-1*offset,0,0]) {
    translate([0,0,asmb_8_z]) translate([0,0,(80-26-14)]) thrust_box_lid();

    translate([0,0,asmb_4_z]) rotate([0,0,180]) base2();
    
    translate([0,0,asmb_6_z]) rotate([0,0,180]) rotate([0,0,90]) {
        translate([0,brh+8+4,8+8]) translate([24,0,0]) rotate([0,-abs(piv_b),0]) translate([-24,0,0]) camlever(0);
        translate([0,brh+8+4,8+8]) translate([-24,0,0]) rotate([0,abs(piv_b),0]) translate([24,0,0]) camlever(1);
    }
    
    *rotate([0,0,180]) base();
    *rotate([0,0,180]) upright();
    *rotate([0,0,180]) upright_withcam();
    
    translate([0,0,asmb_3_z]) translate([0,0,-26]) for(i=[0,2]) ms_spacing(i) ms();
        
    rotate([piv_b,0,0]) {
        translate([0,0,asmb_1_z]) piv_in_thrust();
        translate([0,0,asmb_7_z]) rotate([0,0,180]) translate([0,0,8]) camactutor_thrust();
    
        translate([0,0,asmb_9_z]) translate([0,0,8+35]) rotate([0,0,90]) translate([0,0,56-35]) import("STLs/ksp_controller_module_thrust_handle.stl");
    
        *rotate([0,0,180]) rotate([0,0,90]) translate([0,brh+8+8,8+8+6]) {
            rotate([90,0,0]) cylinder(r=6.5,h=8);
        }
    }
}

//translation
translate([0*offset,0,0]) {
    translate([0,0,asmb_8_z]) translate([0,0,(80-26-14)]) trans_box_lid();

    translate([0,0,asmb_4_z]) rotate([0,0,180]) base2();
    
    translate([0,0,asmb_6_z]) rotate([0,0,180]) rotate([0,0,90]) {
        translate([0,brh+8+4,8+8]) translate([24,0,0]) rotate([0,-abs(piv_b),0]) translate([-24,0,0]) camlever(0);
        translate([0,brh+8+4,8+8]) translate([-24,0,0]) rotate([0,abs(piv_b),0]) translate([24,0,0]) camlever(1);
    }
    
    *rotate([0,0,180]) base();
    *rotate([0,0,180]) upright();
    *rotate([0,0,180]) upright_withcam();
    
    
    translate([0,0,asmb_3_z]) translate([0,0,-26]) for(i=[0:3]) ms_spacing(i) ms();
    
    rotate([piv_b,0,0]) {
        rotate([0,piv_a,0]) {
            translate([0,0,asmb_1_z]) rotate([0,0,180]) piv_in();
            translate([0,0,asmb_7_z]) rotate([0,0,180]) translate([0,0,8]) camactutor();
            *translate([0,brh+8+8,8+8+6]) {
                rotate([90,0,0]) cylinder(r=6.5,h=8);
            }
            translate([0,0,asmb_9_z]) translate([0,0,8+35]) translate([0,0,56-35]) import("STLs/ksp_controller_module_translation_handle.stl");
        }
        translate([0,0,asmb_2_z]) rotate([0,0,180]) piv_out_camcent();
        translate([0,0,asmb_5_z]) rotate([0,0,180]) translate([0,0,8]) camactuator_out();
        *rotate([0,0,90]) translate([0,brh+8+8,8+8+6]) {
            rotate([90,0,0]) cylinder(r=6.5,h=8);
        }
        
        def = piv_a;
        piv_def = abs(def/2);
        piv_def_ang = asin(piv_def/32);
        
        translate([0,0,asmb_6_z]) rotate([0,0,180]) translate([0,brh+8+4,8+8]) {
            translate([24,0,0]) rotate([0,-piv_def_ang,0]) translate([-24,0,0]) camlever(0,0.5);
            translate([-24,0,0]) rotate([0,piv_def_ang,0]) translate([24,0,0]) camlever(1,0.5);
        }
    }
}

//attitude
translate([1*offset,0,0]) rotate([0,0,180]) {
    translate([0,0,asmb_8_z]) rotate([0,0,180]) translate([0,0,(80-26-14)]) att_box_lid();
    
    translate([0,0,asmb_4_z]) base2();
    
    translate([0,0,asmb_6_z]) rotate([0,0,90]) {
        translate([0,brh+8+4,8+8]) translate([24,0,0]) rotate([0,-abs(piv_b),0]) translate([-24,0,0]) camlever(0);
        translate([0,brh+8+4,8+8]) translate([-24,0,0]) rotate([0,abs(piv_b),0]) translate([24,0,0]) camlever(1);
    }
    
    *base();
    *upright();
    *upright_withcam();
    
    
    translate([0,0,asmb_3_z]) translate([0,0,-26]) for(i=[0:3]) ms_spacing(i) ms();
    
    rotate([piv_b,0,0]) {
        rotate([0,piv_a,0]) {
            translate([0,0,asmb_1_z]) piv_in();
            translate([0,0,asmb_7_z]) translate([0,0,8]) camactutor();
            *translate([0,brh+8+8,8+8+6]) {
                rotate([90,0,0]) cylinder(r=6.5,h=8);
            }
            translate([0,0,asmb_9_z]) translate([0,0,8+35]) rotate([0,0,180]) translate([0,0,56-35]) import("STLs/ksp_controller_module_attitude_handle.stl");
        }
        translate([0,0,asmb_2_z]) piv_out_camcent();
        translate([0,0,asmb_5_z]) translate([0,0,8]) camactuator_out();
        *rotate([0,0,90]) translate([0,brh+8+8,8+8+6]) {
            rotate([90,0,0]) cylinder(r=6.5,h=8);
        }
        
        def = piv_a;
        piv_def = abs(def/2);
        piv_def_ang = asin(piv_def/32);
        
        translate([0,0,asmb_6_z]) translate([0,brh+8+4,8+8]) {
            translate([24,0,0]) rotate([0,-piv_def_ang,0]) translate([-24,0,0]) camlever(0,0.5);
            translate([-24,0,0]) rotate([0,piv_def_ang,0]) translate([24,0,0]) camlever(1,0.5);
        }
    }
}

//cw
translate([2*offset,0,0]) translate([0,0,-14-26]) {
    translate([0,0,80]) cw_box_lid();
    cw_box_frame();
}