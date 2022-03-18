$fn=72;

$vpr = [60, 0, 45];
$vpt = [0, 0, 0];
$vpd = 875;
$t=1;

include <ksp_controller_include.scad>;
//include <ksp_controller_module_cw.scad>;


*union() {
    button();
    translate([0,10,0]) buttonguard();
    translate([0,-10,0]) buttonguard();
    difference() {
        union() {
            hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
                translate([25-5,15-5,0]) {
                    cylinder(r=5,h=2.5);
                }
            }
            hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
                translate([20-5-5,15-5,0]) {
                    cylinder(r=5,h=2.5);
                    cylinder(r=2.5,h=5);
                }
            }
        }
        buttonco();
        
        for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([25-5,15-5,-1]) {
                cylinder(r=1.5+0.1,h=50);
            }
        }
    }
    
    *translate([0,35,0]) difference() {
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([25-5,15-5,0]) {
                cylinder(r=5,h=5);
            }
        }
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([15-2,8+0.5-2,5-1]) {
                cylinder(r=2,h=10);
            }
        }
        for(ix=[0,1]) mirror([ix,0,0]) hull() for(iy=[0,1]) mirror([0,iy,0]) {
            translate([12.5-2,8+0.5-2,-1]) cylinder(r=2,h=10);
            translate([15-2,8+0.5-2,-1]) cylinder(r=2,h=10);
            translate([15+5-2,8-5+0.5-2,-1]) cylinder(r=2,h=10);
        }
        
        translate([0,0,-1]) cylinder(r=2.5,h=10);
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([3,3,-1]) {
                cylinder(r=0.5,h=1+2);
            }
        }
        for(iy=[0,1]) mirror([0,iy,0]) hull() for(ix=[0,1]) mirror([ix,0,0]) {
            translate([2.5,4,-1]) cylinder(r=0.5,h=1+1);
            translate([2.5,4-1,-1]) cylinder(r=0.5,h=1+1+1);
        }
        
        for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([25-5,15-5,-1]) {
                cylinder(r=1.5+0.1,h=50);
            }
        }
    }
    
    *translate([0,-35,0]) difference() {
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([25-5,15-5,0]) {
                cylinder(r=5,h=2);
            }
        }
        for(ix=[0,1]) mirror([ix,0,0]) hull() for(iy=[0,1]) mirror([0,iy,0]) {
            translate([12.5-2,8+0.5-2,-1]) cylinder(r=2,h=10);
            translate([15-2,8+0.5-2,-1]) cylinder(r=2,h=10);
            translate([15+5-2,8-5+0.5-2,-1]) cylinder(r=2,h=10);
        }
        for(iy=[0,1]) mirror([0,iy,0]) hull() for(ix=[0,1]) mirror([ix,0,0]) {
            translate([2.5,4,-1]) cylinder(r=0.5,h=10);
            translate([2.5,4-1,-1]) cylinder(r=0.5,h=10);
        }
        
        for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([25-5,15-5,-1]) {
                cylinder(r=1.5+0.1,h=50);
            }
        }
    }
}

*difference() {
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([75-5,90-5,-6]) {
            cylinder(r=5,h=6-2);
        }
    }
    
    hull() translate([-87.5/2-4+1,-155/2-4,-6-1]) {
        translate([0,0,0]) cylinder(r=1,h=20);
        translate([100,0,0]) cylinder(r=1,h=20);
        translate([0,165,0]) cylinder(r=1,h=20);
        translate([100,165,0]) cylinder(r=1,h=20);
    }
        
    for(ix2=[0,1]) mirror([ix2,0,0]) translate([65,0,0]) {
        for(i=[-70,-50,-30,-10,10,30,50,70]) translate([0,i/10*155/2/8,-6-1]) {
            cylinder(r=2.5,h=20);
        }
    }
    
    translate([-87.5/2-4,-155/2-4,-6-1]) translate([-8,0,0]) {
        translate([4,4,0]) cylinder(r=1.5,h=20);
        translate([106+16-4,4,0]) cylinder(r=1.5,h=20);
        translate([4,165-4,0]) cylinder(r=1.5,h=20);
        translate([106+16-4,165-4,0]) cylinder(r=1.5,h=20);
    }
}

*screen();

*for(ix2=[0,1]) mirror([ix2,0,0]) translate([65,0,0]) {
    *for(i=[-70,-50,-30,-10,10,30,50,70]) translate([0,i/10*155/2/8,0]) button();

    for(i=[-80,-60,-40,-20,0,20,40,60,80]) translate([0,i/10*155/2/8,0]) buttonguard();
}

*difference() {
    union() {
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([95-5,100-5,0]) {
                cylinder(r=5,h=2.5);
            }
        }
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([95-5,100-15-5,0]) {
                cylinder(r=5,h=2.5);
                cylinder(r=2.5,h=5);
            }
        }
    }
    for(ix=[0,1]) mirror([ix,0,0]) {
        for(iy=[0,1]) mirror([0,iy,0]) {
            translate([95-7.5,100-7.5,0]) {
                *box_lid_bolt_c_co();
                translate([0,0,-1]) cylinder(r=2+0.1,h=10);
            }
        }
        for(iy=[-(100-7.5)*1/3,(100-7.5)*1/3]) {
            translate([95-7.5,iy,0]) {
                box_lid_bolt_co();
                translate([0,0,-1]) cylinder(r=2+0.1,h=10);
            }
        }
    }
    for(ix=[-(95-7.5)*1/3,(95-7.5)*1/3]) {
        for(iy=[0,1]) mirror([0,iy,0]) {
            translate([ix,100-7.5,0]) {
                *rotate([0,0,90]) box_lid_bolt_co();
                translate([0,0,-1]) cylinder(r=2+0.1,h=10);
            }
        }
    }
    
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([87.5/2,155/2,-1]) {
            cylinder(r=1,h=10);
        }
    }
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([87.5/2,155/2,5-1.25]) {
            cylinder(r=1,h=10);
            translate([0,0,1.25]) cylinder(r=1+1.25,h=10);
        }
    }
    
    for(ix2=[0,1]) mirror([ix2,0,0]) translate([65,0,0]) {
        for(i=[-70,-50,-30,-10,10,30,50,70]) translate([0,i/10*155/2/8,0]) {
            buttonco();
            buttonmarkerco();
        }
    }
}





*hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
    translate([95-5,100-5,0]) {
        cylinder(r=5,h=5);
    }
}

difference() {
    union() {
        difference() {
            hull() for(i=[0,1]) mirror([i,0,0]) {
                translate([(95-7.5),(100-7.5),0]) cylinder(r=7.5,h=5);
                translate([(95-7.5),-(100-7.5),0]) cylinder(r=7.5,h=5);
            }
            
            hull() for(i=[0,1]) mirror([i,0,0]) {
                translate([(95-7.5)-15,(100-7.5)-15,-1]) cylinder(r=7.5,h=50);
                translate([(95-7.5)-15,-85/2+3.5+58+15,-1]) cylinder(r=7.5,h=50);
            }
            hull() for(i=[0,1]) mirror([i,0,0]) {
                translate([(95-7.5)-15,-85/2+3.5+58-15,-1]) cylinder(r=7.5,h=50);
                translate([(95-7.5)-15,-85/2+3.5+15,-1]) cylinder(r=7.5,h=50);
            }
            hull() for(i=[0,1]) mirror([i,0,0]) {
                translate([(95-7.5)-15,-85/2+3.5-15,-1]) cylinder(r=7.5,h=50);
                translate([(95-7.5)-15,-(100-7.5)+15,-1]) cylinder(r=7.5,h=50);
            }
        }
        
        intersection() {
            union() {
                hull() for(i=[0,100]) translate([0,-i,0]) translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([0,4,0]) cylinder(r=7.5,h=5);
                hull() for(i=[0,100]) translate([0,-i,0]) translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([114.8,4,0]) cylinder(r=7.5,h=5);
                
                
                hull() for(i=[0,-100]) translate([0,-i,0]) translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([0,165-4,0]) cylinder(r=7.5,h=5);
                hull() for(i=[0,-100]) translate([0,-i,0]) translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([114.8,165-4,0]) cylinder(r=7.5,h=5);
            }
            hull() for(i=[0,1]) mirror([i,0,0]) {
                translate([(95-7.5),(100-7.5),0]) cylinder(r=7.5,h=5);
                translate([(95-7.5),-(100-7.5),0]) cylinder(r=7.5,h=5);
            }
        }
        
        
        
        rasp_mnt() cylinder(r=m3_v_r+1.6,h=5+5);
        face_mnt() hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([7.5-5,7.5-5,0]) cylinder(r=5,h=5+5+15+12+8+2);
        }
        screen_mnt() cylinder(r=7.5,h=5+5+15+12);
    }
    
    rasp_mnt() {
        translate([0,0,-1]) cylinder(r=m3_v_r,h=50);
        translate([0,0,-50+5+5-6]) {
            cylinder(r=2.5+1,h=50-0.4);
            translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
            translate([-sqrt(pow(2.5+1,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+1,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
        }
    }
    //rasp_mnt() translate([0,0,5+5]) m3_co(50, false, 0, 5+1, false, true);
    
    face_mnt() {
        translate([0,0,5+5+15+12+8+2-25]) cylinder(r=m4_v_r+0.25,h=50);
        translate([0,0,5+5+15+12+8+2-8-0.5]) cylinder(r=(5.8+0.3+0.2)/2,h=50);
        translate([0,0,5+5+15+12+8+2-0.5]) cylinder(r1=(5.8+0.3+0.2)/2,r2=(5.8+0.3+0.2)/2+2,h=2);
    }
    
    
    screen_mnt() {
        translate([0,0,-1]) cylinder(r=m3_v_r,h=50);
        translate([0,0,-50+5+5+15+12-10]) {
            cylinder(r=2.5+1,h=50-0.4);
            translate([-m3_v_r,-m3_v_r,0]) cube([2*m3_v_r,2*m3_v_r,50]);
            translate([-sqrt(pow(2.5+1,2)-pow(m3_v_r,2)),-m3_v_r,0]) cube([2*sqrt(pow(2.5+1,2)-pow(m3_v_r,2)),2*m3_v_r,50-0.2]);
        }
    }
    //screen_mnt() translate([0,0,5+5+15+2]) m3_co(50, false, 0, 5, false, true);
}

*translate([0,0,5+5+15+12+8]) screen();

module rasp_mnt() {
    translate([-56/2,-85/2,0]) translate([3.5,3.5,0]) children();
    translate([-56/2,-85/2,0]) translate([3.5,3.5+58,0]) children();
    translate([-56/2,-85/2,0]) translate([3.5+49,3.5+58,0]) children();
    translate([-56/2,-85/2,0]) translate([3.5+49,3.5,0]) children();
}

module face_mnt() {
    translate([(95-7.5),(100-7.5)*3/3,0]) children();
    translate([-(95-7.5),(100-7.5)*3/3,0]) children();
    
    translate([(95-7.5),(100-7.5)*1/3,0]) children();
    translate([-(95-7.5),(100-7.5)*1/3,0]) children();
    
    //translate([(95-7.5),-(100-7.5)*1/3,0]) children();
    //translate([-(95-7.5),-(100-7.5)*1/3,0]) children();
    
    translate([(95-7.5),-(100-7.5)*3/3,0]) children();
    translate([-(95-7.5),-(100-7.5)*3/3,0]) children();
}

module screen_mnt() {
    translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([0,4,0]) children();
    translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([114.8,4,0]) children();
    translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([0,165-4,0]) children();
    translate([-87.5/2-4,-154.5/2-3.5,0]) translate([-5.7,0,0]) translate([114.8,165-4,0]) children();
}


module buttonmarkerco() {
    hull() {
        translate([-10,0,5-1]) {
            cylinder(r=0.5,h=10);
            translate([0,0,1]) cylinder(r=0.5+1,h=10);
        }
        translate([-(65-87.5/2),0,5-1]) {
            cylinder(r=0.5,h=10);
            translate([0,0,1]) cylinder(r=0.5+1,h=10);
        }
    }
    
    
    hull() {
        translate([-(65-87.5/2)+1.25*sqrt(2),0,5-1.25*sqrt(2)]) rotate([0,-45,0]) for(k=[-5,5]) translate([k,0,0]) {
            cylinder(r=0.5,h=10);
            translate([0,0,1]) cylinder(r=0.5+1,h=10);
        }
    }
}

module buttonco() {
    *hull() {
        for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([6+9-1,6-1,-1]) {
                cylinder(r=1,h=1+1);
            }
        }
        for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([7+0.5-1,8+0.5-1,-1]) {
                cylinder(r=1,h=1+1);
            }
        }
        for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([6-2,5-2,-1]) {
                cylinder(r=2+0.5,h=1+3);
            }
        }
    }
    *translate([-(7+0.5),-(5+0.5),-1]) cube([2*(7+0.5),2*(5+0.5),1+2+1+0.4]);
    *translate([-(6+0.5),-(5+0.5),-1]) cube([2*(6+0.5),2*(5+0.5),1+2+1+0.6]);
    
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([6-2,5-2,-1]) {
            cylinder(r=2+0.5,h=10);
        }
    }
    
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([6-2,5-2,-1]) {
            cylinder(r=2+2+0.5,h=1+1);
            cylinder(r=2+0.5,h=1+1+2);
        }
    }
    
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([6-2,5-2,5]) {
            translate([0,0,-1]) cylinder(r=2+0.5,h=10);
            cylinder(r=2+0.5+1,h=10);
        }
    }
}

module buttonguard() {
    hull() for(ix=[0,1]) mirror([ix,0,0]) {
        translate([5,0,5-1]) {
            cylinder(r=2,h=1);
            cylinder(r=2-1.5,h=1+1.5);
        }
    }
}

module button() {
    hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([6-2,5-2,0]) {
            cylinder(r=2,h=5);
            cylinder(r=2-1,h=5+1);
        }
    }
    
    *hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([7-1,8-1,0]) cylinder(r=1,h=1);
    }
    
    hull() for(ix=[0,1]) mirror([ix,0,0]) {
        translate([2.5,0,0]) {
            cylinder(r=0.8,h=5+1+0.4);
        }
    }
    
    *for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
        translate([7,3,0]) rotate([0,0,-90]) spring();
    }
}

module screen() translate([0,0,-7]) {
    difference() {
        union() {
            translate([-86.5/2-4,-154.5/2-3.5,0]) cube([99.2,165,7]);
            translate([-86.5/2-4-1.5,-154.5/2-3.5,0]) {
                cube([107,165,1]);
                translate([-8.8,0,0]) cube([124.2,8,1]);
                translate([-8.8,165-8,0]) cube([124.2,8,1]);
            }
        }
        hull() for(ix=[0,1]) mirror([ix,0,0]) for(iy=[0,1]) mirror([0,iy,0]) {
            translate([86.5/2,154.5/2,7-1]) {
                cylinder(r=1,h=10);
            }
        }
        translate([-87.5/2-4,-154.5/2-3.5,-1]) translate([-5.7,0,0]) {
            translate([0,4,0]) cylinder(r=1.5,h=20);
            translate([114.8,4,0]) cylinder(r=1.5,h=20);
            translate([0,165-4,0]) cylinder(r=1.5,h=20);
            translate([114.8,165-4,0]) cylinder(r=1.5,h=20);
        }
    }
}

module spring() {
    wh = 0.8;
    s_h = 0.6;
    
    translate([-1,0,0]) difference() {
        cylinder(r=1+wh,h=s_h);
        translate([0,0,-1]) cylinder(r=1-wh,h=10);
        translate([0,-5,-1]) cube([10,10,10]);
    }
        
    for(i=[0:1]) translate([0,4*i,0]) {
        translate([-1,1-wh,0]) cube([2,2*wh,s_h]);
        translate([1,2,0]) difference() {
            cylinder(r=1+wh,h=s_h);
            translate([0,0,-1]) cylinder(r=1-wh,h=10);
            translate([-10,-5,-1]) cube([10,10,10]);
        }
        translate([-1,3-wh,0]) cube([2,2*wh,s_h]);
        translate([-1,4,0]) difference() {
            cylinder(r=1+wh,h=s_h);
            translate([0,0,-1]) cylinder(r=1-wh,h=10);
            translate([0,-5,-1]) cube([10,10,10]);
        }
    }
}


/*module box_lid_bolt_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            translate([10,0,2.5]) cylinder(r=7.5-2.5,h=10);
        }
        hull() {
            translate([0,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10);
            
            translate([10,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
            translate([10,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10);
        }
        difference() {
            translate([5,-7.5+1.25,2.5]) cube([12.5,15-2.5,10]);
            for(i=[0,1]) mirror([0,i,0]) hull() {
                translate([5,-7.5+1.25,0]) cylinder(r=1.25,h=2.5+1.25);
                translate([5+1.25,-7.5+1.25,0]) cylinder(r=1.25,h=2.5);
                translate([5,-7.5+1.25,2.5+1.25]) cylinder(r1=1.25,r2=0,h=1.25);
            }
        }
    }
}

module box_lid_bolt_c_co() {
    union() {
        hull() {
            translate([0,0,2.5]) cylinder(r=7.5-2.5,h=10);
            
            for(i=[0,1]) rotate([0,0,i*90]) {
                translate([10,0,2.5]) cylinder(r=7.5-2.5,h=10);
            }
        }
        
        hull() {
            translate([0,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
            translate([0,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10-2.5);
            
            for(i=[0,1]) rotate([0,0,i*90]) {
                translate([10,0,2.5+1.25]) cylinder(r=7.5-2.5,h=10);
                translate([10,0,2.5+1.25+1.25]) cylinder(r=7.5-2.5+1.25,h=10-2.5);
            }
        }
        for(i=[0,1]) rotate([0,0,i*90]) difference() {
            translate([5,-7.5+1.25,2.5]) cube([12.5,15-2.5,10]);
            for(i=[0,1]) mirror([0,i,0]) hull() {
                translate([5,-7.5+1.25,0]) cylinder(r=1.25,h=2.5+1.25);
                translate([5+1.25,-7.5+1.25,0]) cylinder(r=1.25,h=2.5);
                translate([5,-7.5+1.25,2.5+1.25]) cylinder(r1=1.25,r2=0,h=1.25);
            }
        }
    }
}*/



module m3_co(thread_length=25, thread_horiz=false, head_offset=0, nut_offset=false, head_overhung=false, nut_overhung=false) {
    m3n_v_r = (5.5+0.3-0.2)/2; // radius for M4 nut cutouts (horizontal to buildplate)
    m3n2_v_r = m3n_v_r + 0.5; //for wedging m4 nuts in m4_co() function
    
    translate([0,0,-thread_length+head_offset]) cylinder(r=m3_v_r,h=thread_length+4);
    
    //translate([0,0,head_offset]) cylinder(r=4,h=4+50);
    
    if(nut_offset) {
        translate([0,0,-75-nut_offset]) {
            if(nut_overhung) {
                hull() for(i=[0:5]) rotate([0,0,i*60]) translate([2.75/cos(30),0,0]) cylinder(r=max(m3n_v_r-2.75,0.01),h=75-0.2);
                
                hull() for(i=[0:2]) rotate([0,0,i*120]) translate([2.75/cos(30),0,0]) cylinder(r=max(m3n_v_r-2.75,0.01),h=75);
            } else {
                //hull() for(i=[0:5]) rotate([0,0,i*60]) translate([3.5/cos(30),0,0]) cylinder(r=max(m4n_v_r-3.5,0.01),h=75);
            }
                
            hull() for(i=[0:5]) rotate([0,0,i*60]) {
                translate([2.75/cos(30),0,0]) cylinder(r=max(m3n_v_r-2.75,0.01),h=75-3);
                translate([2.75/cos(30),0,0]) cylinder(r=m3n2_v_r-2.75,h=75-3-2);
            }
        }
    }
}