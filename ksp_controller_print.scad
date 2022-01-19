$fn=16;

expl = 0;
//$vpr = [60, 0, 45+180];
$vpt = [0, 0, 0];
$vpd = 450;
$t=0.75;


include <ksp_controller_include.scad>;
include <ksp_controller_pivots.scad>;
include <ksp_controller_module_attitude.scad>;
include <ksp_controller_module_base.scad>;

//cam levers in printable orientation
//linear
*for(i=[0,1]) rotate([0,0,i*90]) {
    translate([-(24+8+5)-20,16,0]) rotate([-90,0,0]) camlever(0,0,2);
    translate([(24+8+5)+20,-16,0]) rotate([90,0,0]) camlever(1,0,2);
}
//exponential
*for(i=[0,1]) rotate([0,0,i*90]) {
    translate([-(24+8+5)-20,16,0]) rotate([-90,0,0]) camlever(0,1,2);
    translate([(24+8+5)+20,-16,0]) rotate([90,0,0]) camlever(1,1,2);
}
//hybrid
*for(i=[0,1]) rotate([0,0,i*90]) {
    translate([-(24+8+5)-20,16,0]) rotate([-90,0,0]) camlever(0,0.5,4);
    translate([(24+8+5)+20,-16,0]) rotate([90,0,0]) camlever(1,0.5,4);
}

//pair
*union() {
    translate([-(24+8+5)-0,16,0]) rotate([-90,0,0]) camlever(0,1,2);
    translate([(24+8+5)+0,-16,0]) rotate([90,0,0]) camlever(1,1,2);
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
