module cw_box_lid() translate([0,0,48]) {
    difference() {
        box_lid(60,60,60,60+40+5);
        
        //bolt co
        for(i=[0,1]) mirror([i,0,0]) {
            translate([(60-7.5),(60-7.5),0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
            translate([(60-7.5),-(60+40+5-7.5),0]) mirror([0,1,0]) {
                translate([0,0,-1]) cylinder(r=m4_v_r,h=50);
                box_lid_bolt_c_co();
            }
        }
        
        hull() for(i=[-2,2]) for(j=[-2.5,2.5]) {
            translate([(24+1.6)*i-1.6/2*i/abs(i),-(40+5)/2+(18+2.4)*j-2.4/2*j/abs(j),2.5+1.25]) cylinder(r1=0,r2=5,h=5);
        }
        
        for(i=[-1.5:1.5]) for(j=[-2:2]) {
            translate([(24+1.6)*i,-(40+5)/2+(18+2.4)*j,-1]) cylinder(r=8,h=20);
            translate([(24+1.6)*i-24/2,-(40+5)/2+(18+2.4)*j-18/2,2.5]) cube([24,18,20]);
        }
    }
}