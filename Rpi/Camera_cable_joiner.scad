use <../Dollo/NEW_long_ties/include.scad>;


//_mock_cable();
//debug_cable_joiner();
//debug_cable_soldering_jig();

//camera_cable_joiner_base();
camera_cable_joiner_lid();

//camera_solder_jig_base();
//camera_solder_jig_clamp();


module _mock_cable() {
    union() {
        color("blue")
        translate([8.2/2, 0, 0.25/2])
        cube([8.2, 16, 0.25], center=true);

        color("white")
        translate([100/2, 0, 0.35 - 0.1/2])
        cube([100, 16, 0.1], center=true);

        color("grey")
        for(i = [0:14]) {
            translate([4/2, -16/2 + 1 + i, 0.35])
            cube([4, 0.8, 0.1], center=true);
        }
    }
}

module debug_cable_joiner() {
    intersection() {
        camera_cable_joiner_base();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([-4/2, 0, 3 - 0.35])
    _mock_cable();

    translate([4/2, 0, 3 + 0.35])
    rotate([0, 180, 0])
    _mock_cable();

    translate([0, 0, 3.6 + 3 + 0.1])
    rotate([180, 0, 0])
    camera_cable_joiner_lid();
}

module debug_cable_soldering_jig() {
    intersection() {
        camera_solder_jig_base();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }
    translate([-4/2, 0, 3 - 0.35])
    _mock_cable();

    translate([4/2, 0, 3.2 + 0.35])
    rotate([0, 180, 0])
    _mock_cable();

    translate([12, 0, 6.8])
    rotate([0, 180, 180])
    camera_solder_jig_clamp();

    translate([-12, 0, 7.1])
    rotate([0, 180, 0])
    camera_solder_jig_clamp();
}

module camera_cable_joiner_base() {
    h = 3.6;

    difference() {
        translate([0, 0, h/2])
        rounded_cube_side(
            25, 25.2, h, 6, center=true, $fn=40
        );

        // cable left
        translate([20/2, 0, h])
        cube([20, 16.1, 1.4], center=true);

        // cable right
        translate([-20/2, 0, h])
        cube([20, 16.1, 1.2], center=true);

        // left cable end
        translate([8.2/2 - 4/2, 0, h])
        cube([8.3, 16.1, 1.8], center=true);

        translate([-7, 10, 0])
        cylinder(d=2, h=20, center=true, $fn=30);

        translate([7, 10, 0])
        cylinder(d=2, h=20, center=true, $fn=30);

        translate([-7, -10, 0])
        cylinder(d=2, h=20, center=true, $fn=30);

        translate([7, -10, 0])
        cylinder(d=2, h=20, center=true, $fn=30);
    }
}

module camera_cable_joiner_lid() {
    h = 3;

    difference() {
        union() {
            translate([0, 0, h/2])
            rounded_cube_side(
                25, 25.2, h, 6, center=true, $fn=40
            );

            translate([25/2 - 10.4/2, 0, 3.6/2])
            cube([10.4, 16, 3.6], center=true);

            translate([-25/2 + 6.2/2, 0, 3.5/2])
            cube([6.2, 16, 3.5], center=true);

            translate([0, 0, 3.4/2])
            cube([25, 16, 3.4], center=true);
        }

        translate([-7, 10, 0])
        cylinder(d=2.5, h=20, center=true, $fn=30);

        translate([7, 10, 0])
        cylinder(d=2.5, h=20, center=true, $fn=30);

        translate([-7, -10, 0])
        cylinder(d=2.5, h=20, center=true, $fn=30);

        translate([7, -10, 0])
        cylinder(d=2.5, h=20, center=true, $fn=30);

        translate([-7, 10, -4 + h - 0.8])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        translate([7, 10, -4 + h - 0.8])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        translate([-7, -10, -4 + h - 0.8])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        translate([7, -10, -4 + h - 0.8])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );
    }
}

module camera_solder_jig_base() {
    h = 3.6;
    difference() {
        translate([0, 0, h/2])
        rounded_cube_side(
            38, 30, h, 6, center=true, $fn=40
        );
        translate([40/2, 0, h])
        cube([40, 16.2, 1.4], center=true);

        translate([-40/2, 0, h])
        cube([40, 16.2, 0.8], center=true);

        translate([8.2/2 - 4/2, 0, h])
        cube([8.4, 16.2, 1.9], center=true);

        translate([8.2/2 - 4/2 - 1, 0, h + 0.2])
        cube([8.4, 16.2, 1.9], center=true);

        translate([-12, 11, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([12, 11, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([-12, -11, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([12, -11, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([-12, 11, -0.05])
        M3_nut(cone=false, bridging=true);

        translate([12, 11, -0.05])
        M3_nut(cone=false, bridging=true);

        translate([-12, -11, -0.05])
        M3_nut(cone=false, bridging=true);

        translate([12, -11, -0.05])
        M3_nut(cone=false, bridging=true);
    }
}

module camera_solder_jig_clamp() {
    difference() {
        union() {
            translate([0, 0, 3/2])
            cube([12, 30, 3], center=true);

            translate([0, 0, 3.7/2])
            cube([12, 16, 3.7], center=true);
        }
        translate([0, 11, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, -11, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([-9.2, 0, 0])
        rotate([0, 45, 0])
        cube([10, 40, 10], center=true);
    }
}