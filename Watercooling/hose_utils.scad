use <../lib/includes.scad>;
include <common.scad>;

module tube(d, wall, length=30) {
    difference() {
        cylinder(d=d, h=length);
        cylinder(d=d-2*wall, h=length);
    }
}

module tube_flat(d1, d2, wall, length=30) {
    _offset = (d1 * PI - d2 * PI);

    module _tflat(td1, td2, l) {
        hull() {
            cylinder(d=td1,h=1);
            translate([-(d1-d2)/2,0,l-0.1])
            hull() {
                cylinder(d=td2, h=0.1);
                translate([_offset,0,0])
                cylinder(d=td2, h=0.1);
            }
        }
    }

    difference() {
        _tflat(d1, d2, length);
        _tflat(d1-2*wall, d2-2*wall, length);
    }
}

module tube_bend(d, wall, bend) {
    rotate([90,45,0]) {
        union() {
            intersection() {
                difference() {
                    donut(bend, d, $fn=80);
                    donut(bend, d-2*wall, $fn=80);
                }
                translate([0,0,-d])
                cube([30,30,2*d]);
            }
            translate([bend/2,0.1,0])
            rotate([90,0,0])
            tube(d, wall, 20, $fn=80);

            translate([0.1,bend/2,0])
            rotate([0,-90,0])
            tube(d, wall, 20, $fn=80);
        }
    }
}

module tube_bend_flat(d, wall, bend, flat_rot=0) {
    rotate([90,45,0])
    union() {
        intersection() {
            difference() {
                donut(bend, d, $fn=80);
                donut(bend, d-2*wall, $fn=80);
            }
            translate([0,0,-d])
            cube([30,30,2*d]);
        }
        translate([bend/2,0.1,0])
        rotate([90,0,0])
        tube(d, wall, 20, $fn=80);

        translate([0.1,bend/2,0])
        rotate([0,-90,0])
        rotate([0,0,flat_rot])
        tube_flat(d, 5, wall, 20, $fn=80);
    }
}

module tube_bend1() {
    intersection() {
        translate([0,0,21])
        tube_bend(tube1_outer_dia, 1, 30);

        translate([-10,-20,0])
        cube([40,40,50]);
    }
}

module tube_bend1_flat() {
    intersection() {
        translate([0,0,21])
        tube_bend_flat(tube1_outer_dia, 1, 30, 90);

        translate([-20,-20,0])
        cube([50,50,100]);
    }
}

//tube_bend1();
tube_bend1_flat();