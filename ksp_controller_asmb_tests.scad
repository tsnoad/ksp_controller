$fn=36;

expl = 0;
//$vpr = [60, 0, 45+180];
$vpt = [0, 0, 0];
$vpd = 450;
$t=0.75;


include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_attitude.scad>;
include <ksp_controller_module_base.scad>;


//microswitch fit test
*difference() {
    translate([-10,-35,0]) cube([50,32,7.5]);
    translate([0,0,7.5]) {
        ms_bco();
        ms_co_spacing() {
            translate([0,0,-26-14-1]) cylinder(r=m3_v_r,h=50);
            translate([0,0,-50-26-5.15-2]) {
                cylinder(r=2.5+0.5,h=50-0.4);
                translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
                translate([-sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+0.5,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
            }
        }
    }
}

//arduino fit test
difference() {
    mirror([0,1,0]) translate([0,0,-26-14]) {
        hull() for(j=[(70-5),(70-5-75)]) for(i=[-12,12]) {
            translate([j,i,0]) cylinder(r=5,h=7.5);
        }
        hull() for(j=[(70-5),(70+5-30-15)]) for(i=[-12,12]) {
            translate([j,i,0]) cylinder(r=5,h=7.5+10);
        }
    }
    //arduino co
    translate([(70-15-30),0,-26-14+7.5]) rotate([0,0,90]) ard_micro_co();
}


//arduino fit test (but with an attiny85)
*difference() {
    mirror([0,1,0]) translate([0,0,-26-14]) {
        hull() for(j=[(70-5),(70-5-37.5)]) for(i=[-12,12]) {
            translate([j,i,0]) cylinder(r=5,h=7.5);
        }
        hull() for(j=[(70-5),(70+5-15)]) for(i=[-12,12]) {
            translate([j,i,0]) cylinder(r=5,h=7.5+10);
        }
    }
    //arduino co
    translate([(70-15),0,-26-14+7.5]) rotate([0,0,90]) attiny_co();
}

