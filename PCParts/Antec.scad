use <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


//debug_elevenhundred_hdd_rail();

elevenhundred_hdd_rail();


module debug_elevenhundred_hdd_rail() {
    %translate([102/2, 146/2, 0])
    rotate([0, 0, 180])
    mock_hd();

    translate([102/2 + 6.4/2 + 1, -11, 12.5/2 + 0.1])
    elevenhundred_hdd_rail();
}

module elevenhundred_hdd_rail() {
    difference() {
        union() {
            cube([6.4, 129, 12.5], center=true);

            translate([(6.4-5)/2, -129/2, 0])
            cylinder(
                d=5, h=12.5,
                center=true, $fn=30
            );

            // handle
            translate([0, -127/2 - 12/2 - 1.5, 0])
            rotate([0, 0, 3])
            translate([-22/2 + 2, 0, 0])
            difference() {
                chamfered_cube_side(
                    22, 12, 12.5, 3, center=true
                );

                translate([2, 0, 0])
                chamfered_cube_side(
                    22, 8, 12.7, 2, center=true
                );

                translate([3.5, -12/2, 0])
                cube([22, 5, 13], center=true);
            }

            // lock nub
            translate([6.4/2 - 1/2, -129/2 + 4, 0])
            hull() {
                translate([0, 2/2, 0])
                cube([1, 2, 6.5], center=true);

                translate([0, 4, 0])
                cube([1, 1, 2], center=true);

                translate([1, 2/2, 0])
                cube([1, 2, 5], center=true);
            }

            // center hd hole nubs
            translate([0, -45.8, 0])
            rotate([0, -90, 0])
            cylinder(d=2, h=6, $fn=30);

            translate([0, 55.7, 0])
            rotate([0, -90, 0])
            cylinder(d=2, h=6, $fn=30);
        }

        // handle cutout
        hull() {
            translate([(6.4-5)/2, -129/2, 0])
            cylinder(
                d=1, h=13, center=true, $fn=20
            );

            translate([
                -10/2 + 6.4/2 - 2,
                -129/2 + 12, 0
            ])
            cube([10, 1, 13], center=true);

            translate([(6.4-5)/2, -129/2 - 1/2.4, 0])
            rotate([0, 0, 3])
            translate([-10/2, 1/2, 0])
            cube([10, 1, 13], center=true);
        }

        // bolt hole
        translate([0, 14.2, 0])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=10, center=true, $fn=30);

            translate([0, 0, -1])
            cylinder(d=11, h=5, $fn=30);
        }

        // chamfers
        translate([0, 129/2, 12.5/2])
        rotate([45, 0, 0])
        cube([10, 5, 5], center=true);

        translate([0, 129/2, -12.5/2])
        rotate([45, 0, 0])
        cube([10, 5, 5], center=true);

        translate([0, -129/2 + 12, 12.5/2])
        rotate([45, 0, 0])
        cube([10, 2, 2], center=true);

        translate([0, -129/2 + 12, -12.5/2])
        rotate([45, 0, 0])
        cube([10, 2, 2], center=true);
    }
}
