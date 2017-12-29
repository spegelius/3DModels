use <../lib/includes.scad>;
include <common.scad>;

module tube(d, wall, length=30) {
    difference() {
        cylinder(d=d, h=length);
        cylinder(d=d-2*wall, h=length);
    }
}

module tube_bend(d, wall, bend) {
    rotate([90,45,0]) {
        union() {
            intersection() {
                difference() {
                    donut(bend, d);
                    donut(bend, d-2*wall);
                }
                translate([0,0,-d]) cube([30,30,2*d]);
            }
            translate([bend/2,0.1,0]) rotate([90,0,0]) tube(d, wall, 20, $fn=80);
            translate([0.1,bend/2,0]) rotate([0,-90,0]) tube(d, wall, 20, $fn=80);
        }
    }
}


intersection() {
    translate([10,20,21]) tube_bend(tube1_outer_dia, 1, 30);
    cube([40,40,50]);
}

//tube_bend(tube2_inner_dia, 0.9, 25);