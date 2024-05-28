include <../Dollo/NEW_long_ties/include.scad>;

use <common.scad>;


//debug();

body_lock_cable_holder();


module debug() {
    intersection() {
        body_lock_cable_holder();

        translate([0, 100/2, 0])
        cube([200, 100, 100], center=true);
    }

    // positioning
    %translate([0, 0, -4.9])
    rotate([0, 90, 0])
    cylinder(d=2.8, h=100, $fn=30);

    %translate([0, 0, -4.9])
    rotate([0, 90, 0])
    cylinder(d=4.5, h=87.15, $fn=30);
}


module body_lock_cable_holder() {
    difference() {
        union() {
            _orig_body_lock();

//            #translate([14.3, 0, -15.3])
//            rotate([0, 90, 0])
//            tube(11, 7, 1, $fn=40);

            translate([14.3, 0, -15.3 + 5.5/2])
            rotate([0, 90, 0])
            cylinder(d=16.5, h=80.85, $fn=80);

            translate([94.15, 0, -6.75])
            cube([2, 16.5, 11.6], center=true);

            translate([86.15, 0, -7.25])
            cube([18, 16.5, 10.6], center=true);
        }

        translate([0, 0, -15.3])
        rotate([0, 90, 0])
        cylinder(d=9, h=21, $fn=40);

        translate([0, 0, -4.9])
        rotate([0, 90, 0])
        cylinder(d=2.8, h=100, $fn=30);

        translate([0, 0, -4.9])
        rotate([0, 90, 0])
        cylinder(d=4.5, h=87.15, $fn=30);

        cube([130.9, 30, 17], center=true);

        // side cut
        hull() {
            translate([31, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=23, h=40, center=true, $fn=80);

            translate([64, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=23, h=40, center=true, $fn=80);
        }

        // wire cuts
        translate([80, 7.5, -11.5])
        rotate([0, 95, 0])
        cylinder(d=4, h=50, center=true, $fn=30);

        translate([80, -7.5, -11.5])
        rotate([0, 95, 0])
        cylinder(d=4, h=50, center=true, $fn=30);

        // zip tie cut
        translate([87, 0, -12])
        rotate([95, 0, 90])
        difference() {
            rounded_cube_side(
                20, 8.6, 3, 4, center=true, $fn=40
            );

            rounded_cube_side(
                17, 5.6, 4, 2, center=true, $fn=40
            );
        }
    }

    // supports
    translate([87.6, -11.9, -2.7])
    cube([15.1, 5, 1.2], center=true);

    translate([87.6, 11.9, -2.7])
    cube([15.1, 5, 1.2], center=true);

}