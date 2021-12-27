$fn=36;

wt = 0.8;

for(i=[0:5]) rotate([0,0,i*60]) hull() {
    translate([4+wt+0.25,(4+wt+0.25)*tan(30),0]) cylinder(r=wt,h=12+20);
    translate([4+wt+0.25,-(4+wt+0.25)*tan(30),0]) cylinder(r=wt,h=12+20);
}
for(i=[0:5]) rotate([0,0,i*60]) hull() {
    translate([4+wt+0.25,(4+wt+0.25)*tan(30),0]) cylinder(r=wt+2,h=12);
    translate([4+wt+0.25,-(4+wt+0.25)*tan(30),0]) cylinder(r=wt+2,h=12);
        
    translate([4+wt+0.25,(4+wt+0.25)*tan(30),0]) cylinder(r=wt,h=12+2);
    translate([4+wt+0.25,-(4+wt+0.25)*tan(30),0]) cylinder(r=wt,h=12+2);
}
difference() {
    hull() {
        cylinder(r=15-2,h=12);
        translate([0,0,2]) cylinder(r=15,h=12-4);
    }
    for(i=[0:2]) rotate([0,0,i*120]) translate([10+30,0,-1]) cylinder(r=30,h=20,$fn=$fn*4);
}