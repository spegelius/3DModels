use <../Dollo/NEW_long_ties/include.scad>;


GS_105B_v2_mount();


module GS_105B_v2_mount() {
    difference() {
        union() {
            translate([0, 0, 2/2])
            cube([40, 132, 2], center=true);

            hull() {
                translate([-28, 120/2, 0])
                cylinder(d=12, h=2, $fn=60);

                translate([28, 120/2, 0])
                cylinder(d=12, h=2, $fn=60);

            }

            hull() {
                translate([-28, -120/2, 0])
                cylinder(d=12, h=2, $fn=60);

                translate([28, -120/2, 0])
                cylinder(d=12, h=2, $fn=60);
            }
        }

        translate([-40/2 - 15/2, 0, 0])
        rounded_cube_side(
            40, 108, 10, 12, center=true, $fn=60
        );

        translate([40/2 + 15/2, 0, 0])
        rounded_cube_side(
            40, 108, 10, 12, center=true, $fn=60
        );

        translate([0, 120/2, 0])
        cylinder(d=3.8, h=10, center=true, $fn=30);

        translate([0, -120/2, 0])
        cylinder(d=3.8, h=10, center=true, $fn=30);

        rotate([0, 0, 5])
        translate([0, 120/2, 0])
        cylinder(d=2, h=10, center=true, $fn=30);
    }
}