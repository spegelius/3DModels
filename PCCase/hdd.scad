use <../Dollo/NEW_long_ties/extention.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../PCParts/Antec.scad>;
include <../PCParts/common.scad>;
include <variables.scad>;


//debug_hdd_mount();
//debug_hdd_mount_rails();

//hdd_mount(230);
//hdd_mount(240);
//hdd_mount_rails(230);
//hdd_mount_rails(240);
//hdd_mount_joiner();
hdd_mount_cable_support();


module debug_hdd_mount() {
    hdd_mount(230);

    translate([-69, 123, 0])
    extention(units=4, support=false);

    translate([71, 123, 0])
    extention(units=4, support=false);

    translate([71, -77, 0])
    extention(units=4, support=false);
}

module debug_hdd_mount_rails() {
    hdd_mount_rails(230);

    translate([0, 0, 30.1])
    hdd_mount_rails(230);

    translate([-65.5, 123, 0])
    extention(units=4, support=false);

    translate([74.5, 123, 0])
    extention(units=4, support=false);

    translate([74.5, -77, 0])
    extention(units=4, support=false);

    translate([4.7, 95.5, 0])
    hdd_mount_cable_support();

    // positioning
//    #translate([4.575, 100, 50])
//    cube([105.5, 2, 10], center=true);
}

module hdd_mount(width, supports=true) {

    h = 30;
    w = hd_width + 3.7;

    difference() {
        union() {
            cube([w, 146, h], center=true);

            translate([-54, width - 107, 0])
            rotate([90, 0, 0])
            long_bow_tie_half(h);

            hull() {
                translate([-w/2 + 15/2, 146/2 - 1/2,
                           -h/2 + 2/2])
                cube([15, 1, 2], center=true);

                translate([
                    -54 + 4/2 + 0.5,
                    width - 107 - 2/2, -h/2 + 2/2
                ])
                cube([4, 2, 2], center=true);
            }

            hull() {
                translate([-w/2 + 3.5/4, 146/2 - 1/2, 0])
                cube([3.5/2, 1, h], center=true);

                translate([
                    -54 + 3.5/4 + 0.5,
                    width - 107 - 2/2, 0
                ])
                cube([3.5/2, 2, h], center=true);
            }

            translate([56, -200 + 123, 0])
            rotate([90, 0, 180])
            long_bow_tie_half(h);

            hull() {
                translate([w/2 - 15/2, 146/2 - 1/2,
                           -h/2 + 2/2])
                cube([15, 1, 2], center=true);

                translate([
                    56 - 4/2 - 0.5,
                    width - 107 - 2/2, -h/2 + 2/2
                ])
                cube([4, 2, 2], center=true);
            }

            hull() {
                translate([w/2 - 3.5/4, 146/2 - 1/2, 0])
                cube([3.5/2, 1, h], center=true);

                translate([
                    56 - 3.5/4 - 0.5,
                    width - 107 - 2/2, 0
                ])
                cube([3.5/2, 2, h], center=true);
            }

            translate([56, width - 107, 0])
            rotate([-90, 0, 180])
            long_bow_tie_half(h);

            hull() {
                translate([w/2 - 3.5/4, -146/2 + 1/2, 0])
                cube([3.5/2, 1, h], center=true);

                translate([56 - 3/2 - 2,
                           -200 + 123 + 2/2, 0])
                cube([3, 2, h], center=true);
            }

            translate([-w/2 + 0.01, -146/2 + 2.5, 0])
            rotate([90, 0, -90])
            long_tie(h);
        }

        translate([0, -2, 2])
        cube([hd_width + 0.2, 152, h], center=true);

        translate([20, 146/2 + 2, -h/2 + 4/2 + 1])
        cube([40, 15, 4], center=true);

        translate([0, 146/2 - 28.3, -h/2 + 2 + 6.4])
        rotate([0, 90, 0])
        cylinder(d=3.7, h=200, center=true, $fn=40);

        translate([0, 146/2 - 69.8, -h/2 + 2 + 6.4])
        rotate([0, 90, 0])
        cylinder(d=3.7, h=200, center=true, $fn=40);

        translate([0, 146/2 - 129.8, -h/2 + 2 + 6.4])
        rotate([0, 90, 0])
        cylinder(d=3.7, h=200, center=true, $fn=40);

        translate([0, 0, h/2 + 10])
        chamfered_cube(200, 140, 30, 10, center=true);

        translate([0, -27, -h/2 - 12.8])
        chamfered_cube(200, 62, 30, 10, center=true);

        translate([0, 24, -h/2 - 12.8])
        chamfered_cube(200, 42, 30, 10, center=true);

        translate([0, 59, -h/2 - 12.8])
        chamfered_cube(200, 30, 30, 10, center=true);

        translate([0, -28, -2])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 25, -2])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 78, 0])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 94, 0])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 110, 0])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

    }

    support_h = 1.95;

    if (supports) {
        translate([w/2 - 1.5/2, -27, -h/2 + support_h/2])
        cube([1.5, 41, support_h], center=true);

        translate([-w/2 + 1.5/2, -27, -h/2 + support_h/2])
        cube([1.5, 41, support_h], center=true);

        translate([w/2 - 1.5/2, 24, -h/2 + support_h/2])
        cube([1.5, 21, support_h], center=true);

        translate([-w/2 + 1.5/2, 24, -h/2 + support_h/2])
        cube([1.5, 21, support_h], center=true);

        translate([w/2 - 1.5/2, 59, -h/2 + support_h/2])
        cube([1.5, 9, support_h], center=true);

        translate([-w/2 + 1.5/2, 59, -h/2 + support_h/2])
        cube([1.5, 9, support_h], center=true);
    }

    %translate([hd_width/2, 146/2, -h/2 + 2])
    rotate([0, 0, 180])
    mock_hd();
}

module hdd_mount_rails(width, supports=true) {

    h = 30;
    w1 = hd_width + 3.7;
    w2 = w1 + 13.2;

    hd_rail_w = hd_width + 6.6 * 2;

    difference() {
        union() {
            // main mount
            translate([0, -3/2, 0])
            cube([w2, 153, h], center=true);

            translate([-50.5, width - 107, 0])
            rotate([90, 0, 0])
            long_bow_tie_half(h);

            hull() {
                translate([
                    -50.5 + 0.5 + 15/2,
                    146/2 - 1/2, -h/2 + 2/2
                ])
                cube([15, 1, 2], center=true);

                translate([
                    -50.5 + 4/2 + 0.5,
                    width - 107 - 2/2,
                    -h/2 + 2/2
                ])
                cube([4, 2, 2], center=true);
            }

            hull() {
                translate([
                    -50.5 + 3.5/4 + 0.5,
                    146/2 - 1/2, 0
                ])
                cube([3.5/2, 1, h], center=true);

                translate([
                    -50.5 + 3.5/4 + 0.5,
                    width - 107 - 2/2, 0
                ])
                cube([3.5/2, 2, h], center=true);
            }

            translate([59.5, -200 + 123, 0])
            rotate([90, 0, 180])
            long_bow_tie_half(h);

            hull() {
                translate([
                    w2/2 - 15/2, 146/2 - 1/2,
                    -h/2 + 2/2
                ])
                cube([15, 1, 2], center=true);

                translate([
                    59.5 - 4/2 - 0.5,
                    width - 107 - 2/2,
                    -h/2 + 2/2
                ])
                cube([4, 2, 2], center=true);
            }

            hull() {
                translate([
                    w2/2 - 3.5/4, 146/2 - 1/2, 0
                ])
                cube([3.5/2, 1, h], center=true);

                translate([
                    59.5 - 3.5/4 - 0.5,
                    width - 107 - 2/2, 0
                ])
                cube([3.5/2, 2, h], center=true);
            }

            translate([59.5, width - 107, 0])
            rotate([-90, 0, 180])
            long_bow_tie_half(h);

            hull() {
                translate([
                    59.5 - 6/2 - 0.15,
                    -146/2 + 1/2, 0
                ])
                cube([6, 1, h], center=true);

                translate([
                    59.5 - 5/2 - 0.15,
                    -200 + 123 + 2/2, 0
                ])
                cube([5, 2, h], center=true);
            }

            translate([
                -w2/2 + 0.01, -146/2 + 2.5, 0
            ])
            rotate([90, 0, -90])
            long_tie(h);
        }

        // hdd cutouts
        translate([0, -3, 2])
        cube([hd_width + 0.2, 152, h], center=true);

        translate([3, 2, 2])
        cube([hd_width + 0.2 - 6, 152, h], center=true);

        // rail cutout
        difference() {

            translate([0, -8, 2.4])
            cube([hd_rail_w, 162, h], center=true);

            translate([
                0, -60, -h/2 + 12.8 + 0.75 * 7 + 2.6
            ])
            rotate([0, 90, 0])
            scale([1.5, 1, 1])
            cylinder(d=7, h=200, center=true, $fn=30);

            translate([
                0, -7.5,
                -h/2 + 12.8 + 0.75 * 7 + 2.6
            ])
            rotate([0, 90, 0])
            scale([1.5, 1, 1])
            cylinder(d=7, h=200, center=true, $fn=30);

            translate([
                0, 45, -h/2 + 12.8 + 0.75 * 7 + 2.6
            ])
            rotate([0, 90, 0])
            scale([1.5, 1, 1])
            cylinder(d=7, h=200, center=true, $fn=30);
        }

        translate([0, -8, 12.5/2 - h/2 + 19.2])
        cube([hd_rail_w, 162, 12.5], center=true);

        // connector cutout
        translate([20, 146/2 + 2, -h/2 + 4/2 + 1])
        cube([40, 15, 4], center=true);

        // top/bottom cutouts
        translate([0, 0, h/2 + 10])
        chamfered_cube(200, 140, 30, 10, center=true);

        translate([0, -27, -h/2 - 12.6])
        chamfered_cube(200, 62, 30, 10, center=true);

        translate([0, -27, -h/2 + 15])
        intersection() {
            chamfered_cube(200, 62, 30, 10, center=true);
            cube([hd_width, 100, 100], center=true);
        }

        translate([0, 24, -h/2 - 12.6])
        chamfered_cube(200, 42, 30, 10, center=true);

        translate([0, 24, -h/2 + 15])
        intersection() {
            chamfered_cube(200, 42, 30, 10, center=true);
            cube([hd_width, 100, 100], center=true);
        }

        translate([0, 59, -h/2 - 12.6])
        chamfered_cube(200, 30, 30, 10, center=true);

        translate([0, 59, -h/2 + 12.5])
        intersection() {
            chamfered_cube(200, 25, 30, 10, center=true);
            cube([hd_width, 100, 100], center=true);
        }

        translate([0, -70 - 30/2, -h/2 - 12.6])
        chamfered_cube_side(w2, 30, 30, 10, center=true);

        // side holes
        translate([0, -28, -2])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 25, -2])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 81, 0])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 95.5, 0])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        translate([0, 110, 0])
        scale([1, 1, 1.2])
        rotate([45, 0, 0])
        cube([200, 8, 8], center=true);

        // rail clip cutout
        translate([0, -70, 12.5/2 -h/2 + 2.2])
        cube([w2 - 1 , 5, 8], center=true);
    }

    support_h = 2.15;

    if (supports) {
        translate([w2/2 - 1.5/2, -27, -h/2 + support_h/2])
        cube([1.5, 41, support_h], center=true);

        translate([-w2/2 + 1.5/2, -27, -h/2 + support_h/2])
        cube([1.5, 41, support_h], center=true);

        translate([w2/2 - 1.5/2, 24, -h/2 + support_h/2])
        cube([1.5, 21, support_h], center=true);

        translate([-w2/2 + 1.5/2, 24, -h/2 + support_h/2])
        cube([1.5, 21, support_h], center=true);

        translate([w2/2 - 1.5/2, 59, -h/2 + support_h/2])
        cube([1.5, 9, support_h], center=true);

        translate([-w2/2 + 1.5/2, 59, -h/2 + support_h/2])
        cube([1.5, 9, support_h], center=true);

        translate([
            -w2/2 + 6/2 + 2.5, -60,
            -h/2 + 2.6 + 12.6/2
        ])
        cube([6, 1.2, 12.6], center=true);

        translate([
            -w2/2 + 6/2 + 2.5, -7.5,
            -h/2 + 15/2
        ])
        cube([6, 1.2, 15], center=true);

        translate([
            -w2/2 + 10/2, -7.5,
            -h/2 + 0.2/2
        ])
        cube([10, 3, 0.2], center=true);

        translate([
            -w2/2 + 6/2 + 2.5, 45,
            -h/2 + 2.6 + 12.6/2
        ])
        cube([6, 1.2, 12.6], center=true);

        translate([
            w2/2 - 6/2 - 2.5, -60,
            -h/2 + 2.6 + 12.6/2
        ])
        cube([6, 1.2, 12.6], center=true);

        translate([
            w2/2 - 6/2 - 2.5, -7.5,
            -h/2 + 15/2
        ])
        cube([6, 1.2, 15], center=true);

        translate([
            w2/2 - 10/2, -7.5,
            -h/2 + 0.2/2
        ])
        cube([10, 3, 0.2], center=true);

        translate([
            w2/2 - 6/2 - 2.5, 45,
            -h/2 + 2.6 + 12.6/2
        ])
        cube([6, 1.2, 12.6], center=true);
    }
//
//    %translate([hd_width/2, 146/2, -h/2 + 2])
//    rotate([0, 0, 180])
//    mock_hd();
//
    %translate([hd_width/2 + 6.4/2, -11, 12.5/2 -h/2 + 2.5])
    elevenhundred_hdd_rail();

    %translate([-hd_width/2 - 6.4/2, -11, 12.5/2 -h/2 + 2.5])
    mirror([1, 0, 0])
    elevenhundred_hdd_rail();
}

module hdd_mount_joiner() {
    difference() {
        hull() {
            scale([1, 1.2, 1])
            cylinder(d=14, h=30, $fn=70);

            translate([-3, 4, 0])
            cylinder(d=7.2, h=30, $fn=50);

            translate([3, 4, 0])
            cylinder(d=7.2, h=30, $fn=50);

        }

        translate([0, 0, -1])
        male_dovetail(32);

        translate([0, -20/2, 0])
        cube([20, 20, 70], center=true);

        hull() {
            cube([8, 10, 15], center=true);
            cube([4, 10, 19], center=true);
        }

        translate([0, 0, 30])
        hull() {
            cube([8, 10, 15], center=true);
            cube([4, 10, 19], center=true);
        }
    }
}

module hdd_mount_cable_support() {
    difference() {
        union() {
            intersection() {
                scale([1, 1, 1.2])
                rotate([45, 0, 0])
                cube([109.4, 7.8, 7.8], center=true);

                cube([200, 200, 10], center=true);
            }

            intersection() {
                translate([0, -400/2 + 13, 0])
                cylinder(
                    d=400, h=10,
                    center=true, $fn=100
                );

                translate([0, 4, 0])
                cube([105.5, 19, 10], center=true);
            }
        }

        intersection() {
            translate([0, -400/2 + 13, 0])
            cylinder(
                d=394, h=20,
                center=true, $fn=100
            );

            translate([0, 4, 0])
            cube([100, 20, 20], center=true);
        }

        for (i = [0:6]) {
            translate([-45 + i*15, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=3, h=60, center=true, $fn=20);
        }
    }
}