use <../../Dollo/NEW_long_ties/include.scad>;


CR10_ptfe_x_mount();


module CR10_ptfe_x_mount() {
    difference() {
        union() {
            translate([0, 0, 15/2])
            rounded_cube_side(
                47, 47, 15, 15, center=true, $fn=40
            );
            translate([47/2 - 9/2, 35, 30/2 - 1])
            rotate([5, 0, 0])
            rounded_cube_side(
                9, 11, 30, 2, center=true, $fn=60
            );

            hull() {
                translate([47/2 - 9/2, 35, 15/2])
                cube([9, 1, 15], center=true);

                translate([47/2 - 9/2, 0, 15/2])
                cube([9, 1, 15], center=true);
            }
        }

        translate([0, 0, -10])
        cylinder(d=100, h=10);

        translate([-20, 0, 20/2 + 4])
        cube([30, 32, 20], center=true);

        translate([20, 0, 20/2 + 6])
        cube([30, 28, 20], center=true);

        translate([0, 44, 0])
        rotate([-20, 0, 0])
        cube([60, 10, 20], center=true);

        translate([0, 42, 30])
        rotate([40, 0, 0])
        cube([60, 10, 20], center=true);


        difference() {
            translate([0, 0, 15/2 + 2])
            rounded_cube_side(
                42, 42, 15, 10, center=true, $fn=40
            );

            translate([0, 42/2, 0])
            cube([8, 1, 40], center=true);

            translate([0, -42/2, 0])
            cube([8, 1, 40], center=true);
        }

        hull() {
            translate([47/2 - 9/2, 34.5, 2])
            rotate([5, 0, 0])
            cylinder(d=4.1, h=100, center=true, $fn=30);

            translate([47/2 - 9/2, 44.5, 2])
            rotate([5, 0, 0])
            cylinder(d=4.1, h=100, center=true, $fn=30);
        }

        translate([16, 35.96, 23])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=5, center=true, $fn=20);

        translate([16, 37.34, 7])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=5, center=true, $fn=20);

        translate([22, 35.96, 23])
        rotate([0, 90, 0])
        cylinder(d=3.1, h=5, center=true, $fn=20);

        translate([22, 37.34, 7])
        rotate([0, 90, 0])
        cylinder(d=3.1, h=5, center=true, $fn=20);

        translate([0, 0, 5])
        rotate([180, 0, 0])
        motor_plate_holes(
            h=5, bolt_head_cones=true,
            center_chamfer=true
        );
    }

    %translate([47/2 - 9/2, 34.5, 2])
    rotate([5, 0, 0])
    cylinder(d=4, h=100, center=true, $fn=30);
}