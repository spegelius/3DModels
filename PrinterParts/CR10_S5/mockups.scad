include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;


//mock_creality_hotend();
//mock_creality_x_carriage();


module mock_creality_nozzle() {
    difference() {
        intersection() {
            cylinder(d=6.8, h=8.5, $fn=6);

            union() {
                cylinder(d1=0.8, d2=7, h=3.6, $fn=40);

                translate([0, 0, 3.6])
                cylinder(d=7, h=6, $fn=40);
            }
        }

        cylinder(d=0.4, h=20, center=true, $fn=20);
    }
}

module mock_creality_hotend() {
    
    module _cr_body() {
        difference() {
            intersection() {
                cylinder(d=20, h=28, $fn=30);

                cube([30, 12, 100], center=true);
            }

            translate([14/2, 0, 28 - 4])
            rotate([90, 0, 0])
            cylinder(
                d=3, h=20, center=true, $fn=20
            );

            translate([-14/2, 0, 28 - 4])
            rotate([90, 0, 0])
            cylinder(
                d=3, h=20, center=true, $fn=20
            );

            translate([0, 0, 20.5])
            tube(30, 1, 10);

            translate([0, 0, 18.64])
            tube(30, 1, 10);

            translate([0, 0, 16.81])
            tube(30, 1, 11);

            translate([0, 0, 14.98])
            tube(30, 1, 11);

            translate([0, 0, 13.15])
            tube(30, 1, 11);

            translate([0, 0, 11.32])
            tube(30, 1, 11);

            translate([0, 0, 9.49])
            tube(30, 1, 11);

            translate([0, 0, 7.66])
            tube(30, 1, 11);

            translate([0, 0, 5.83])
            tube(30, 1, 11);

            translate([0, 0, 4])
            tube(30, 1, 11);

            translate([0, 0, -1])
            cylinder(d=4, h=30, $fn=30);

            translate([0, 0, 28 - 7])
            cylinder(d=10, h=30, $fn=30);
        }
    }

    module _cr_block() {
        difference() {
            cube([20, 20, 10], center=true);

            translate([0, -20/2 + 4.5, 0])
            rotate([0, 90, 0])
            cylinder(d=6, h=30, center=true, $fn=30);

            translate([0, 4.2, 0])
            cylinder(d=2, h=30, center=true, $fn=20);
        }
    }

    mock_creality_nozzle();

    translate([0, -4.2, 10/2 + 8.5])
    _cr_block();

    translate([0, 0, 10 + 8.5 + 4.7])
    _cr_body();

    translate([-14/2, 0, 17])
    cylinder(d=3, h=7, $fn=20);

    translate([14/2, 0, 17])
    cylinder(d=3, h=7, $fn=20);

    translate([0, 0, 17])
    tube(5, 7, 1.5, $fn=20);
}

module mock_creality_x_carriage() {

    difference() {
        union() {
            hull() {
                translate([-64/2 + 18/2, 0, 47/2 - 18/2])
                rotate([-90, 0, 0])
                cylinder(d=18, h=2.5, $fn=30);

                translate([64/2 - 18/2, 0, 47/2 - 18/2])
                rotate([-90, 0, 0])
                cylinder(d=18, h=2.5, $fn=30);

                translate([0, 2.5/2, -47/2 + 1/2])
                cube([64, 2.5, 1], center=true);
            }

            hull() {
                translate([0, 0, 47/2 - 64 + 24/2])
                rotate([-90, 0, 0])
                cylinder(d=24, h=2.5, $fn=30);
               
                translate([0, 2.5/2, -47/2 + 1/2])
                cube([24, 2.5, 1], center=true);
            }

            translate([-64/2 + 17/2, 23/2, -47/2 + 2.5/2])
            cube([17, 23, 2.5], center=true);

            translate([64/2 - 17/2, 23/2, -47/2 + 2.5/2])
            cube([17, 23, 2.5], center=true);

            translate([
                64/2 - 25 + 5.3/2, 0.5,
                47/2 - 27.1 + 5.3/2
            ])
            rotate([90, 0, 0])
            cylinder(d=5.3, h=5, $fn=20);

            translate([
                64/2 - 11 + 5.3/2, 0.5,
                47/2 - 27.1 + 5.3/2
            ])
            rotate([90, 0, 0])
            cylinder(d=5.3, h=5, $fn=20);
        }

        translate([-64/2 + 5 + 2/2, 23, -47/2])
        cube([2, 22, 10], center=true);

        translate([64/2 - 5 - 2/2, 23, -47/2])
        cube([2, 22, 10], center=true);

        translate([0, 0, 47/2 - 64 + 24/2])
        rotate([90, 0, 0])
        cylinder(d=7, h=10, center=true, $fn=30);

        translate([-64/2 + 12, 0, 47/2 - 12])
        rotate([90, 0, 0])
        cylinder(d=5, h=10, center=true, $fn=30);

        translate([64/2 - 12, 0, 47/2 - 12])
        rotate([90, 0, 0])
        cylinder(d=5, h=10, center=true, $fn=30);

        translate([
            64/2 - 25 + 5.3/2, 0.5,
            47/2 - 27.1 + 5.3/2
        ])
        rotate([90, 0, 0])
        cylinder(d=3, h=15, $fn=20);

        translate([
            64/2 - 11 + 5.3/2, 0.5,
            47/2 - 27.1 + 5.3/2
        ])
        rotate([90, 0, 0])
        cylinder(d=3, h=15, $fn=20);

        translate([
            -64/2 + 30.5, 0,
            47/2 - 14.5
        ])
        rotate([90, 0, 0])
        cylinder(d=3, h=15, center=true, $fn=20);

        translate([
            -64/2 + 13, 0,
            47/2 - 33
        ])
        rotate([90, 0, 0])
        cylinder(d=3, h=15, center=true, $fn=20);
    }
}

module mock_bondtech_gear() {
    difference() {
        union() {
            cylinder(d=8, h=14, $fn=40);

            for (i = [0:16]) {
                rotate([0, 0, 360/17*i])
                translate([9.5/2 - 2/2, 0, 4.8/2])
                cube([2, 0.8, 4.8], center=true);
            }
        }
        cylinder(d=5, h=30, center=true, $fn=40);

        translate([0, 0, 11])
        donut(11.5,4);
    }
}