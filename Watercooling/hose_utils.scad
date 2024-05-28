//use <../lib/includes.scad>;
use <../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;


//tube_bend1();
//tube_bend1_flat();
//tube_flat(tube1_outer_dia, 5, 1);
tube1_flat();

//adapter_11_12();

//hose_bend_support_1();
//hose_bend_support_2();


module tube_flat(d1, d2, wall, length=30) {
    _offset = (d1 * PI - d2 * PI);

    module _tflat(td1, td2, l) {
        hull() {
            cylinder(d=td1, h=1, $fn=80);

            translate([
                -(d1 - d2)/2, 0, l - 0.1
            ])
            hull() {
                cylinder(d=td2, h=0.1, $fn=80);

                translate([_offset, 0,0])
                cylinder(d=td2, h=0.1, $fn=80);
            }
        }
    }

    difference() {
        _tflat(d1, d2, length);
        _tflat(
            d1 - 2*wall, d2 - 2*wall, length
        );
    }
}

module tube_bend(d, wall, bend, l=20) {
    rotate([90, 45, 0])
    difference() {
        union() {
            intersection() {
                difference() {
                    donut(bend, d);
                    donut(
                        bend, d - 2*wall
                    );
                }
                translate([0, 0, -d])
                cube([30, 30, 2*d]);
            }
            translate([bend/2, 0.01, 0])
            rotate([90, 0, 0])
            tube(d, l + 20, wall);

            translate([0.01, bend/2, 0])
            rotate([0, -90, 0])
            tube(d, l, wall);
        }

        #translate([bend/2, -l, 0])
        cube([d - 1, 0.2, 20], center=true);

        translate([bend/2 + d/2, -l])
        rotate([0, 0, 45])
        translate([-50/2, -50/2, 0])
        cube([50, 50, 50], center=true);
    }
}

module tube_bend_flat(
    d, wall, bend, flat_rot=0
) {
    rotate([90, 45, 0])
    difference() {
        union() {
            intersection() {
                difference() {
                    donut(bend, d, $fn=80);
                    donut(
                        bend, d - 2*wall, $fn=80
                    );
                }
                translate([0, 0, -d])
                cube([30, 30, 2*d]);
            }
            translate([bend/2, 0.01, 0])
            rotate([90, 0, 0])
            tube(d, 40, wall, $fn=80);

            translate([0.01, bend/2, 0])
            rotate([0, -90, 0])
            rotate([0, 0, flat_rot])
            tube_flat(d, 5, wall, 30, $fn=80);
        }

        translate([bend/2, -20, 0])
        cube([d - 1, 0.2, 20], center=true);

        translate([bend/2 + d/2, -20])
        rotate([0, 0, 45])
        translate([-50/2, -50/2, 0])
        cube([50, 50, 50], center=true);
    }
}

module tube_bend1() {
    translate([0, 0, 25])
    tube_bend(
        tube1_outer_dia, 1, 30, 20, $fn=80
    );
}

module tube_bend1_flat() {
    translate([0, 0, 25])
    tube_bend_flat(
        tube1_outer_dia, 1, 30, 90
    );
}

module tube1_flat() {
    union() {
        tube(tube1_outer_dia, 15, 1, $fn=80);

        translate([0, 0, 14.99])
        tube_flat(tube1_outer_dia, 5, 1);
    }
}


module adapter_11_12() {
    difference() {
        union() {
            cylinder(d=12.2, h=20, $fn=50);

            translate([0, 0, 19.99])
            cylinder(
                d1=12.2, d2=11, h=0.5, $fn=50
            );

            cylinder(d=11, h=40, $fn=50);
        }

        cylinder(
            d=9.4, h=90, center=true, $fn=50
        );
    }
}

module _hose_bend_support(od=12) {
    difference() {

        translate([-2.7, 0, 0])
        rotate([0, 0, 45])
        cube(
            [39, 39, od + 4.4], center=true
        );

        // chamfers
        translate([30, 0, 0])
        cube([20, 40, 50], center=true);

        translate([-26.7, 0, 0])
        rotate([0, 0, 45])
        chamfered_cube(
            40, 40, 50, 11, center=true
        );

        translate([-8, 0, 0])
        rotate([90, 0, 0])
        tube_bend(
            od + 0.2, od, 30, 30, $fn=80
        );

        translate([-2, 0, 0])
        cylinder(
            d=3.2, h=4*od,
            center=true, $fn=20
        );

        translate([15.5, 0, 0])
        cylinder(
            d=3.2, h=4*od,
            center=true, $fn=20
        );
    }
}

module hose_bend_support_1(od=12) {
    difference() {
        intersection() {
            _hose_bend_support(od=od);

            translate([0, 0, -20/2])
            cube([100, 100, 20], center=true);
        }

        translate([-2, 0, -(od + 4.4)/2 - 0.1])
        cylinder(d1=6.8, d2=3, h=2, $fn=30);

        translate([15.5, 0, -(od + 4.4)/2 - 0.1])
        cylinder(d1=6.8, d2=3, h=2, $fn=30);
    }
}

module hose_bend_support_2(od=12) {
    difference() {
        intersection() {
            _hose_bend_support(od=od);

            translate([0, 0, -20/2])
            cube([100, 100, 20], center=true);
        }

        translate([-2, 0, -(od + 4.4)/2 - 0.1])
        rotate([0, 0, 30])
        M3_nut(3.1, cone=false, bridging=true);

        translate([15.5, 0, -(od + 4.4)/2 - 0.1])
        rotate([0, 0, 30])
        M3_nut(3.1, cone=false, bridging=true);
    }
}