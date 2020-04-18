
use <../../Dollo/New_long_ties/include.scad>;

////// VARIABLES \\\\\\
w = 60;
h = 70;
l = 50;
wall = 3;
slop = 0.1;
ear_d = 17;
slide = 3;
slope = 5;

////// VIEW \\\\\\
//debug();
//bucket();
//bucket_bottom();
//bucket_mount();
//bucket_arm();
//bucket_centering_peg();

////// MODULES \\\\\\
module _rail(length=w) {
    intersection() {
        rotate([45,0,0])
        cube([length,1,1],center=true);
        translate([0,1/2-0.01,0])
        cube([length,1,2],center=true);
    }
}

module _bucket_form(w=w,l=l,h=h) {
    union() {
        hull() {
            translate([0,0,h/2-5/2])
            cube([w,l,5],center=true);
            translate([0,-slope/2,-h/2+0.1/2+5])
            cube([w,l-slope,0.1],center=true);
        }
        translate([0,-slope/2,-h/2+5/2])
        cube([w,l-slope,5],center=true);
    }
}

module _holee(length) {
    hull() {
        translate([0,-length/2,0])
        cylinder(d=4.3,h=20,center=true,$fn=40);
        translate([0,length/2,0])
        cylinder(d=4.3,h=20,center=true,$fn=40);
    }
}

module _ear(nut=true) {
    difference() {
        hull() {
            rotate([0,90,0])
            cylinder(d=ear_d,h=8,center=true,$fn=30);
            translate([0,ear_d/2,-(ear_d*1.5)/2+ear_d/2])
            cube([8,0.1,ear_d*1.5],center=true);
        }
        translate([0,0,0])
        rotate([0,-90,0]) {
            if(nut) M4_nut(7);
            cylinder(d=4.3,h=10,center=true,$fn=40);
        }
        
        translate([8/2-3/2,0,0])
        difference() {
            translate([5/2,0,0])
            cube([5,50,100],center=true);
            rotate([0,0,45])
            cube([slide,slide,105],center=true);
        }
    }
}

module _centering_peg_hole() {
    cube([6.2,20.2,5],center=true);
}

module _wipe_silicone_slot() {
    difference() {
        union() {
            intersection() {
                translate([w/2-wall-5,l/2-20/2,h/2])
                hull() {
                    cube([2*wall+2,20,21],center=true);
                    translate([0,20/2,-35])
                    cube([2*wall+2,1,0.2],center=true);
                }
                _bucket_form();
            }
            translate([w/2-wall-5/2,l/2-20+1/2,h/2-10/2])
            cube([5.1,1,10],center=true);
        }
        translate([w/2-wall-5,l/2-wall-(20-2*wall)/2,h/2-10/2+1])
        cube([2,20-2*wall,10],center=true);
    }
}

module _wipe_PTFE_slot() {
    intersection() {
        translate([w/2-wall-4/2-0.3,l/2-7/2,h/2-22])
        difference() {
            translate([4/2-1,0,24/2-4])
            cube([4,7,24],center=true);
            intersection() {
                cylinder(d=4.4,h=20,$fn=20);
                translate([8/2,0,21/2])
                cube([8,8,21],center=true);
            }
            translate([1,0,-4])
            rotate([0,45,0])
            cube([15,8,4],center=true);
            translate([0,0,21])
            rotate([0,-45,0])
            cube([10,8,1],center=true);
        }
        _bucket_form();
    }
}

module _wipe_slot() {
    difference() {
        hull() {
            cube([15,15,1],center=true);
            translate([-15/2+1/2+3,0,-20/2-10/2])
            cube([1,12,20],center=true);
        }
        translate([0,0,-0.3])
        hull() {
            translate([13,0,0])
            cube([1,3.4,5],center=true);
            cylinder(d=3.4,h=5,center=true,$fn=40);
        }
        translate([0,0,-13])
        hull() {
            translate([13,0,0])
            cube([1,7,20],center=true);
            cylinder(d=7,h=20,center=true,$fn=40);
        }
    }
}

module _mock_brush() {
    color("black")
    hull() {
        translate([0,0,1/2])
        cube([12,12,1],center=true);
        translate([0,0,8-1/2])
        cube([12,12,1],center=true);
    }
    color("grey")
    translate([0,0,8+11.8/2])
    cube([10,10,11.8],center=true);
}

module bucket() {
    difference() {
        union() {
            difference() {
                _bucket_form();
                _bucket_form(w-2*wall,l-2*wall,h);
            }

            translate([-8/2-10/2+3/2,-l/2-ear_d/2,h/2-15])
            _ear(nut=true);
            translate([8/2+10/2-3/2,-l/2-ear_d/2,h/2-15])
            mirror([1,0,0])
            _ear(nut=false);
            
            translate([0,l/2-slope,-h/2+3/2])
            _rail();
            translate([0,-l/2,-h/2+3/2])
            mirror([0,1,0])
            _rail();
        }
        // entry slot
        translate([0,l/2,h/2-2])
        hull() {
            cube([3,3*wall,1],center=true);
            translate([0,0,3])
            cube([6,3*wall,1],center=true);
        }
        
        // wipe slot
        translate([w/2,l/2-17/2,h/2-20+27/2])
        cube([2*wall+4,17+wall,28],center=true);
    }
    translate([w/2+15/2-wall-2,l/2-15/2-2,h/2-20])
    _wipe_slot();
    %translate([w/2+15/2-wall-3,l/2-15/2-2,h/2-19.5])
    _mock_brush();
}

module bucket_bottom() {
    difference() {
        union() {
            cube([w-wall-slop,l-2*wall-slop-5,3],center=true);
            translate([(w-wall-slop)/2,0,0])
            intersection() {
                donut(30,4,$fn=80);
                cube([40,40,3],center=true);
            }
        }
        translate([0,-l/2+wall+2/2,0])
        scale([1,1.08,1.08])
        _rail();
        translate([0,l/2-wall-2/2,0])
        scale([1,1.08,1.08])
        mirror([0,1,0])
        _rail();
        translate([-w/2+wall/2,0,0])
        rotate([0,0,-90])
        scale([1,1.08,1.08])
        _rail();
        translate([0,0,10/2])
        chamfered_cube(w-2,l-3-5,10,2,center=true);
    }
}

module bucket_mount() {
    difference() {
        union() {
            rounded_cube_side(52,20,5,6,center=true);
            translate([0,-3,0])
            rounded_cube_side(23,32,5,6,center=true);
            translate([-8/2-10/2+3/2,2,ear_d/2+5/2])
            rotate([-90,0,0])
            _ear();
            translate([8/2+10/2-3/2,2,ear_d/2+5/2])
            rotate([-90,0,0])
            mirror([1,0,0])
            _ear();

        }
        translate([50/2-5,0,0])
        cylinder(d=4.3,h=10,center=true,$fn=50);
        translate([-50/2+5,0,0])
        cylinder(d=4.3,h=10,center=true,$fn=50);
        
        translate([0,0,-3.4])
        rotate([0,0,90])
        _centering_peg_hole();
    }
}

module bucket_arm() {
    arm_h = 10;
    difference() {
        union() {
            hull() {
                translate([0,-10,0])
                cylinder(d=ear_d,h=arm_h,center=true,$fn=50);
                cylinder(d=ear_d,h=arm_h,center=true,$fn=50);
            }
            hull() {
                cylinder(d=ear_d,h=arm_h,center=true,$fn=50);
                translate([25,10,0])
                cube([1,ear_d,arm_h],center=true);
            }
            translate([25,10,0])
            hull() {
                cube([0.1,ear_d,arm_h],center=true);
                translate([30,0,0])
                cylinder(d=ear_d,h=arm_h,center=true,$fn=50);
            }
        }
        translate([0,-10/2,0])
        _holee(10);
        translate([25+30/2,10,0])
        rotate([0,0,90])
        _holee(30);
        
        translate([0,0,-10/2])
        rotate([0,45,0])
        cube([slide,50,slide],center=true);
        
        translate([0,0,10/2])
        rotate([0,45,0])
        cube([slide,50,slide],center=true);
        
        translate([0,10,-10/2])
        rotate([45,0,0])
        cube([150,slide,slide],center=true);

        translate([0,10,10/2])
        rotate([45,0,0])
        cube([150,slide,slide],center=true);
        
        // infill
        translate([15,5,0])
        rotate([0,0,22])
        cube([30,0.1,0.2],center=true);
        
        translate([25,5,0])
        cube([80,0.1,0.2],center=true);
        
        translate([25,15,0])
        cube([80,0.1,0.2],center=true);

    }
}

module bucket_centering_peg() {
    translate([0,0,5/2])
    cube([6,20,5],center=true);
}

module debug() {
    bucket();
    translate([wall/2,-5/2,-h/2+3/2])
    bottom();
}


difference() {
    cube([10,12,3],center=true);
    cylinder(d=3.3,h=5,center=true,$fn=30);
}
