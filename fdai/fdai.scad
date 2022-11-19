$fn=18;

//$vpr = [60, 0, 45];
//$vpt = [0, 0, 0];
//$vpd = 875;

include <../ksp_controller_include.scad>;
include <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;


include <fdai_base.scad>;
include <fdai_roll.scad>;
include <fdai_pitch.scad>;
include <fdai_yaw.scad>;
include <fdai_ball.scad>;

b_r = 60;

m_w = 2;
m_wh = m_w / 2;

mt_w = 1.5;
mt_wh = mt_w / 2;

pi=3.141592654;

//face();

//$t=0.125;

*union() {
    *difference() {
        fdai_yaw_equator();
        translate([0,-100,-50]) cube([100,200,100]);
    }
    
    *rotate([0,0,0]) translate([0,-22.9,22.5]) motor();
}
    
//base
fdai_base();
fdai_face();

fdai_roll_drive_belt();
fdai_roll_sensor_belt();
fdai_roll_motor();
fdai_roll_bearings();
fdai_roll_sensor_pulley();

rotate([0,$t*360,0]) {
    fdai_roll_pulley();
    
    fdai_pitch_yoke();
    fdai_pitch_slipring();
    fdai_pitch_motor();
    fdai_pitch_drive_belt();
    fdai_pitch_sensor_belt();
    fdai_pitch_pulley();
    fdai_pitch_bearings();
    
    *#translate([-(60+2-8),0,0]) rotate([0,-90,0]) m4_co(45,false,45-6,0.01);
    
    rotate([$t*360,0,0]) {
        fdai_yaw_equator();
        
        fdai_yaw_motor();
        
        fdai_yaw_drive_belt();
        fdai_yaw_sensor_belt();
        fdai_yaw_sensor_bearings();
        fdai_yaw_magnetholder();
        fdai_yaw_sensor_mount();
        fdai_yaw_sensor_pulley();
        
        //axial stem
        difference() {
            fdai_ball_upper_stem();
            m4_co(24.1,false,5+1+4,5+1+4);
        }
        
        *fdai_ball_upper();
        
        *import("/Users/tsnoad/Things/ksp_controller/fdai/fdai_ball_upper_c.stl",convexity=10);
    }
}

*fdai_ball_lower();
*fdai_ball_co_stadia();
*fdai_ball_co_stadia_labels_upper();
*fdai_ball_co_labels_upper();



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

        //translate([0,0,0]) pulley ( "GT2 2mm" , GT2_2mm_pulley_dia , 0.764 , 1.494 );
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







*rotate([0,0,45]) rotate([0,90-45,0]) rotate([0,0,270]) difference() {
    sphere(r=50,$fn=$fn);
    translate([-100,-100,-5-1]) cube([200,200,10+2]);
}


*rotate([0,0,45]) rotate([0,90-45,0]) rotate([0,0,270]) {
    import("/Users/tsnoad/Things/ksp_controller/fdai.stl",convexity=10);
    import("/Users/tsnoad/Things/ksp_controller/fdai2.stl",convexity=10);
}





*intersection() {
    difference() {
        translate([0,0,-5]) cylinder(r=50+5+10,h=10);
        translate([0,0,-5-1]) cylinder(r=50+5,h=20);
    }
    translate([0,0,-50]) cube([100,100,100]);
}