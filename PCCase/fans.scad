use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
include <../PCParts/common.scad>;


fan_mount_140mm(230);


module fan_mount_140mm(width) {

    w = width - 60;

    %translate([0, 140/2 + 4.3, 25/2 + 2])
    mock_fan_140mm();

    difference() {
        union() {
            difference() {
                union() {
                    translate([-w/2, 20/2, 0])
                    long_bow_tie_half(20);

                    translate([w/2, 20/2, 0])
                    long_bow_tie_half(20);
                }

                translate([0, 20/2, 2/2 + 2])
                cube([w, 21, 2], center=true);
            }

            translate([0, 20/2, 2/2])
            cube([w, 20, 2], center=true);

            hull() {
                translate([0, 4/2, 1/2])
                cube([w, 4, 1], center=true);

                translate([0, 4/2, 10/2])
                cube([w - 25, 4, 10], center=true);
            }

            translate([-140/2 - 2/2 - 0.5, 20/2, 10/2])
            cube([2, 20, 10], center=true);

            translate([140/2 + 2/2 + 0.5, 20/2, 10/2])
            cube([2, 20, 10], center=true);
        }

        translate([0, 140/2 + 4.3, 0])
        chamfered_cube(140, 140, 85, 40, center=true);

        translate([124.5/2, 4 + 15.5/2 + 0.3, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);

        translate([-124.5/2, 4 + 15.5/2 + 0.3, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);
    }
}