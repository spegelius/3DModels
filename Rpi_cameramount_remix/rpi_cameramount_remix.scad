
include <../Dollo/NEW_long_ties/include.scad>;
use <../Original-Prusa-i3/Printed-Parts/scad/x-end-motor.scad>;

module original() {
    translate([-100,-100,0]) import("../_downloaded/rpi_cameramount/rpi-cameramount.stl", convexity=3);
}

module orig_mount() {
    translate([-31.35,0,0]) intersection() {
        original();
        translate([30,-20,0]) cube([40,40,50]);
    }
}

module orig_arm() {
    translate([-31.35,0,0]) intersection() {
        original();
        difference() {
            translate([21,10,0]) cube([40,40,50]);
            translate([31,-20,0]) cube([40,40,50]);
        }
    }
}

module orig_cover() {
    translate([-31.35,0,0]) intersection() {
        original();
        difference() {
            translate([-21,-40,0]) cube([51,80,50]);
            translate([21,5,0]) cube([40,40,50]);
        }
    }
}

module new_mount() {
    difference() {
        union() {
            difference() {
                orig_mount();
                translate([-1,-13.27,2.01]) cube([40,20,20]);
            }
            
            translate([0,-6.27,2.01]) difference() {
                cube([28,6,1]);
                translate([28/2,6/2,8/2]) hull() {
                    cube([5,8,8],center=true);
                    cube([8,8,5],center=true);
                }
            }
        }
        translate([28/2,-3.27,1]) cylinder(d=4.2,h=5,center=true, $fn=30);
    }
    //%translate([-1,-13.27,2]) cube([40,20,20]);
}

module new_cover() {
    difference() {
        union() {
            orig_cover();
            translate([-25.41,21.1,10]) rotate([0,90,0]) cylinder(d=10.4,h=4,$fn=30);
        }
        translate([-25.41,21.1,10]) rotate([0,90,0]) M4_nut(4);
    }
}

module new_plate() {
    difference() {
        original();
        translate([30,-20,0]) cube([40,40,50]);
    }
    translate([31.35,0,0]) new_mount();
}

module prusa_mount(debug=false) {
    rotate([90,0,0]) {
        if (debug) {
            %translate([-42,35,23.5]) rotate([180,-90,0]) x_end_motor();
            %translate([11,42,54]) rotate([180,90,0]) orig_arm();
        }
        
        difference() {
            union() {
                hull() {
                    translate([0,11,7]) cube([11,1,1]);
                    translate([0,0,17]) cube([11,12,1]);
                }
                translate([0,0,17]) cube([11,24,6]);
                hull() {
                    translate([-5,11/2,45.4]) rotate([0,90,0]) cylinder(d=11,h=21,$fn=50);
                    translate([11/2,11/2,21.4]) cube([11,11,1],center=true);
                }
                translate([3.75,18.5,17-1.09]) cylinder(d1=4,d2=6.2,h=1.1,$fn=40);
            }
            translate([3.75,18.5,0]) cylinder(d=3.5,h=25,$fn=30);
            translate([3.75,18.5,20]) cylinder(d=6.5,h=25,$fn=30);
            translate([0,5,45.4]) rotate([0,90,0]) cylinder(d=13,h=11.2,$fn=50);
            translate([-10,5,45.4]) rotate([0,90,0]) cylinder(d=4.3,h=35,$fn=50);
            translate([-10,5,45.4]) rotate([0,90,0]) cylinder(d=8.3,h=8,$fn=50);
            translate([13,5,45.4]) rotate([90,0,90]) M4_nut();
        }
    }
}

module new_arm() {
    difference() {
        union() {
            cylinder(d=10,h=11,$fn=30);
            translate([-14,-2,0]) rotate([0,0,-62]) cube([4,13,11]);
            translate([-14,-10,0]) hull() {
                translate([0,0,11/2]) rotate([0,90,0]) cylinder(d=11,h=4,$fn=30);
                cube([4,8,11]);
            }
        }
        cylinder(d=4.2,h=12,$fn=30);
        translate([-14,-10,11/2]) rotate([0,90,0]) cylinder(d=4.2,h=12,$fn=30);
    }
}

module new_plate_prusa() {
    difference() {
        original();
        translate([30,-20,-0.1]) cube([40,40,50]);
    }
    translate([37,23,0]) prusa_mount();
}

//prusa_mount(debug=true);
//original();
//orig_mount();
//orig_arm();
//orig_cover();
new_arm();
//new_mount();
//new_cover();
//new_plate();
//new_plate_prusa();