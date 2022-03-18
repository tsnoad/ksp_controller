$fn=72;

//$vpr = [60, 0, 45];
//$vpt = [0, 0, 0];
//$vpd = 875;
$t=1;


include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_base.scad>;

include <ksp_controller_module_cw.scad>;
include <ksp_controller_module_switches.scad>;
include <ksp_controller_module_attitude.scad>;
include <ksp_controller_module_translation.scad>;
include <ksp_controller_module_thrust.scad>;

//cam levers in printable orientation
//pair, hybrid
*union() {
    translate([-(24+8+5)-0,16,0]) rotate([-90,0,0]) camlever(0,0.5,0);
    translate([(24+8+5)+0,-16,0]) rotate([90,0,0]) camlever(1,0.5,0);
}
//pair, exponential
*union() {
    translate([-(24+8+5)-0,16,0]) rotate([-90,0,0]) camlever(0,1,0);
    translate([(24+8+5)+0,-16,0]) rotate([90,0,0]) camlever(1,1,0);
}
//pair, linear
*union() {
    translate([-(24+8+5)-0,16,0]) rotate([-90,0,0]) camlever(0,0,0);
    translate([(24+8+5)+0,-16,0]) rotate([90,0,0]) camlever(1,0,0);
}
//pair, sinusoidal hybrid
*union() {
    translate([-(24+8+5)-0,16,0]) rotate([-90,0,0]) camlever(0,0,0.5);
    translate([(24+8+5)+0,-16,0]) rotate([90,0,0]) camlever(1,0,0.5);
}

*translate([0,0,6]) rotate([90,0,0]) translate([0,0,-2]) cylinder(r=6,h=4);
*union() {
    translate([24,0,0]) rotate([0,-piv_def_ang,0]) translate([-24,0,0]) camlever(0,0.5,0);
    *translate([-24,0,0]) rotate([0,piv_def_ang,0]) translate([24,0,0]) camlever(1,0.5,0);
}

*base();
*upright();
*upright_withcam();

*base2();

*piv_out_camcent();
*camactuator_out();

*rotate([180,0,0]) piv_in();
*camactutor();

*rotate([180,0,0]) piv_in_thrust();
*camactutor_thrust();

*switch_box_lid();
*cw_box_lid();
*att_box_lid();
*trans_box_lid();
*thrust_box_lid();

cw_box_frame();
