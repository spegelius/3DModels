use <common.scad>;
use <../Dollo/NEW_long_ties/include.scad>;


//caddy_mockup();

mount();

module caddy_mockup() {
    holx_1 = -130/2 + 34;
    holx_2 = holx_1 + 61.71;
    holy_1 = -131/2 + 26;
    holy_2 = holy_1 + 90.60 - 14;

    difference() {
        translate([0, 0, 28.5/2])
        cube([130, 131, 28.5], center=true);

        translate([0, 18.5, -20/2 + 28.5 - 13.5])
        cube([135, 131, 20], center=true);

        translate([0, 1, -20/2 + 28.5 - 14.5])
        cube([128, 131, 20], center=true);
     
        translate([0, 8, -20/2 + 28.5 - 14.5])
        cube([135, 131, 20], center=true);

        translate([0, -131/2 + 126/2 + 1,
                   28.5 - 10.5/2 - 2])
        cube([128, 126, 10.5], center=true);

        translate([0, 1, 28.5 - 9.5/2 - 2])
        cube([128, 131, 9.5], center=true);

        translate([0, 3, 28.5])
        cube([119, 131, 10.5], center=true);

        // mount holes
        translate([holx_1, holy_1, 0])
        cylinder(d=3.3, h=40, center=true, $fn=30);

        translate([holx_2, holy_1, 0])
        cylinder(d=3.3, h=40, center=true, $fn=30);

        translate([holx_1, holy_2, 0])
        cylinder(d=3.3, h=40, center=true, $fn=30);

        translate([holx_2, holy_2, 0])
        cylinder(d=3.3, h=40, center=true, $fn=30);
    }

    translate([-10, 8, 20])
    mount();

    translate([9.8, 8, 14.7])
    rotate([0, 180, 0])
    mount();
}

module mount() {
    %translate([70/2, 100/2 + 8, 2.6])
    rotate([0, 0, 180])
    mock_ssd();

    difference() {
        union() {
            difference() {
                translate([8/2, 0, 12/2])
                cube([70 + 11, 106, 12], center=true);

                translate([0, 0, 12/2 + 2.6])
                cube([70, 140, 12], center=true);

                translate([0, -68, 10/2 + 2.6])
                cube([100, 60, 10], center=true);

                translate([0, 80, 10/2 + 2.6])
                cube([100, 60, 10], center=true);

                translate([20/2 + 70/2 + 1.5,
                           0, 10/2 + 2.6])
                cube([20, 160, 10], center=true);

            }

            translate([-21, -47.5, 0])
            cylinder(d1=8, d2=6, h=6, $fn=20);
        }

        translate([0, -32.6, 5.6])
        rotate([0, 90, 0])
        hull() {
            cylinder(d=3.4, h=100, center=true, $fn=30);

            translate([-3.1, 0, 0])
            cylinder(d=3.4, h=100, center=true, $fn=30);
        }

        translate([0, -32.6 + 76.6, 5.6])
        rotate([0, 90, 0])
        hull() {
            cylinder(d=3.4, h=100, center=true, $fn=30);

            translate([-3.1, 0, 0])
            cylinder(d=3.4, h=100, center=true, $fn=30);
        }

        #translate([-21, -47.5, 0])
        cylinder(d=2.8, h=20, center=true, $fn=20);

        #translate([-21 + 61.71, -47.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        #translate([-21, -47.5 + 76.6, 0])
        cylinder(d=2.8, h=20, center=true, $fn=20);

        #translate([-21 + 61.71, -47.5 + 76.6, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        translate([51/2 - 16, -60, 0])
        rounded_cube(51, 40, 30, 8, center=true, $fn=30);

        translate([-50/2 - 26, -60, 0])
        rounded_cube(50, 40, 30, 8, center=true, $fn=30);

        translate([50, -6, 0])
        rounded_cube(25, 60, 30, 8, center=true, $fn=30);

        translate([50, 64, 0])
        rounded_cube(25, 60, 30, 8, center=true, $fn=30);

        translate([-24, -3, 0])
        rounded_cube(12, 50, 30, 8, center=true, $fn=30);

        translate([-3, 7, 0])
        rounded_cube(20, 70, 30, 8, center=true, $fn=30);

        translate([22, 7, 0])
        rounded_cube(20, 70, 30, 8, center=true, $fn=30);
    }
}

