use <../Dollo/NEW_long_ties/include.scad>;
use <../PCParts/common.scad>;

w = 18;
l = 32;
wall = 1.2;
screw_d = 2;
screw_leg_d = 4.8;
corner = 6.6;

//mockup();

box_bottom();
//box_top();
//screw_test();

module mockup() {
    %mock_stepdown_converter();

    intersection() {
        union() {
            box_bottom();

            translate([0, 0, 5.01])
            rotate([0, 180, 0])
            box_top();
        }

        translate([30/2, 0, 0])
        cube([30, 60, 30], center=true);
    }
}

module _grill() {
    translate([-5.4, 0, -5/2])
    hull() {
        translate([0, 8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);

        translate([0, -8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);
    }

    translate([-1.8, 0, -5/2])
    hull() {
        translate([0, 8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);

        translate([0, -8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);
    }

    translate([1.8, 0, -5/2])
    hull() {
        translate([0, 8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);

        translate([0, -8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);
    }

    translate([5.4, 0, -5/2])
    hull() {
        translate([0, 8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);

        translate([0, -8, 0])
        cylinder(d=1.6, h=2*wall, center=true, $fn=20);
    }
}

module box_bottom() {

    difference() {
        union() {
            difference() {
                rounded_cube_side(
                    w, l, 5, corner, center=true, $fn=40);

                translate([0, 0, 1.2])
                rounded_cube_side(
                    w - wall * 2, l - wall * 2, 5,
                    corner - 2 * wall, center=true, $fn=40);
            }
            translate([w/2 - 3.5, l/2 - 3.5, 0])
            cylinder(d=screw_leg_d, h=3, center=true, $fn=30);

            translate([-w/2 + 3.5, l/2 - 3.5, 0])
            cylinder(d=screw_leg_d, h=3, center=true, $fn=30);

            translate([w/2 - 3.5, -l/2 + 3.5, 0])
            cylinder(d=screw_leg_d, h=3, center=true, $fn=30);

            translate([-w/2 + 3.5, -l/2 + 3.5, 0])
            cylinder(d=screw_leg_d, h=3, center=true, $fn=30);

            translate([0, -20/2 + 1/2, 0])
            cube([w - 1, 3, 3], center=true);

            translate([0, 5, 0])
            cube([w - 1, wall, 3], center=true);

            translate([w/2 - 4, l/2 - 5, 0])
            cube([1, 1, 3], center=true);

            translate([-w/2 + 4, l/2 - 5, 0])
            cube([1, 1, 3], center=true);
        }

        translate([0, 0, 1.8/2])
        cube([11.2, 20.2, 1.8], center=true);

        translate([w/2 - 3.5, l/2 - 3.5, 0])
        cylinder(d=screw_d, h=14, center=true, $fn=30);

        translate([-w/2 + 3.5, l/2 - 3.5, 0])
        cylinder(d=screw_d, h=14, center=true, $fn=30);

        translate([w/2 - 3.5, -l/2 + 3.5, 0])
        cylinder(d=screw_d, h=14, center=true, $fn=30);

        translate([-w/2 + 3.5, -l/2 + 3.5, 0])
        cylinder(d=screw_d, h=14, center=true, $fn=30);

        _grill();

        translate([0, 0, 5/2])
        rotate([90, 0, 0])
        scale([2.2, 1, 1])
        cylinder(d=1.2, h=l + 2, center=true, $fn=30);

        // chamfer
        translate([-w/2, 0, 5/2])
        rotate([0, 45, 0])
        cube([0.6, 50, 0.6], center=true);

        translate([w/2, 0, 5/2])
        rotate([0, 45, 0])
        cube([0.6, 50, 0.6], center=true);

    }
}

module box_top() {
    difference() {
        union() {
            difference() {
                rounded_cube_side(
                    w, l, 5, corner, center=true, $fn=40);

                translate([0, 0, 1.2])
                rounded_cube_side(
                    w - wall * 2, l - wall * 2, 5,
                    corner - 2 * wall, center=true, $fn=40);
            }
            translate([w/2 - 3.5, l/2 - 3.5, 0]) {
                translate([0, 0, 1])
                cylinder(d=screw_leg_d, h=5,
                    center=true, $fn=30);

                translate([0, 0, -5/2 + 2.6/2])
                cylinder(d=screw_leg_d + 0.6,
                    h=2.6, center=true, $fn=30);
            }

            translate([-w/2 + 3.5, l/2 - 3.5, 0]) {
                translate([0, 0, 1])
                cylinder(d=screw_leg_d, h=5,
                    center=true, $fn=30);

                translate([0, 0, -5/2 + 2.6/2])
                cylinder(d=screw_leg_d + 0.6,
                    h=2.6, center=true, $fn=30);
            }

            translate([w/2 - 3.5, -l/2 + 3.5, 0]) {
                translate([0, 0, 1])
                cylinder(d=screw_leg_d, h=5,
                    center=true, $fn=30);

                translate([0, 0, -5/2 + 2.6/2])
                cylinder(d=screw_leg_d + 0.6,
                    h=2.6, center=true, $fn=30);
            }

            translate([-w/2 + 3.5, -l/2 + 3.5, 0]) {
                translate([0, 0, 1])
                cylinder(d=screw_leg_d, h=5,
                    center=true, $fn=30);

                translate([0, 0, -5/2 + 2.6/2])
                cylinder(d=screw_leg_d + 0.6,
                    h=2.6, center=true, $fn=30);
            }

            translate([0, 0, -1])
            cube([8, wall, 3], center=true);
        }

        translate([0, 0, 5])
        difference() {
            rounded_cube_side(
                w, l, 5, corner, center=true, $fn=40);

            rounded_cube_side(
                w - wall * 2 - 0.2, l - wall * 2 - 0.2,
                6, corner - 2 * wall - 0.2,
                center=true, $fn=40);
        }

        translate([w/2 - 3.5, l/2 - 3.5, -5/2 + 2.2])
        cylinder(d=screw_d + 0.5, h=4, $fn=30);

        translate([-w/2 + 3.5, l/2 - 3.5, -5/2 + 2.2])
        cylinder(d=screw_d + 0.5, h=4, $fn=30);

        translate([w/2 - 3.5, -l/2 + 3.5, -5/2 + 2.2])
        cylinder(d=screw_d + 0.5, h=4, $fn=30);

        translate([-w/2 + 3.5, -l/2 + 3.5, -5/2 + 2.2])
        cylinder(d=screw_d + 0.5, h=4, $fn=30);

        translate([w/2 - 3.5, l/2 - 3.5, -5/2])
        cylinder(d=4, h=4, center=true, $fn=30);

        translate([-w/2 + 3.5, l/2 - 3.5, -5/2])
        cylinder(d=4, h=4, center=true, $fn=30);

        translate([w/2 - 3.5, -l/2 + 3.5, -5/2])
        cylinder(d=4, h=4, center=true, $fn=30);

        translate([-w/2 + 3.5, -l/2 + 3.5, -5/2])
        cylinder(d=4, h=4, center=true, $fn=30);

        translate([0, 0, 5/2])
        rotate([90, 0, 0])
        scale([2.2, 1, 1])
        cylinder(d=1.2, h=l + 2, center=true, $fn=30);

        _grill();

        // chamfer
        translate([-w/2, 0, 5/2])
        rotate([0, 45, 0])
        cube([0.6, 50, 0.6], center=true);

        translate([w/2, 0, 5/2])
        rotate([0, 45, 0])
        cube([0.6, 50, 0.6], center=true);
    }
}

module screw_test() {
    difference() {
        cube([15, 15, 7], center=true);

        cylinder(d=screw_d, h=20, center=true, $fn=30);
    }
}