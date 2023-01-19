use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
include <../PCParts/common.scad>;
include <variables.scad>;


//debug_PSU_plate();

//test_PSU_plate();

//PSU_backplate(230);
//PSU_backplate(240);
//PSU_plate_mount_1();
//PSU_plate_mount_2();
//PSU_bottom_support(230);
PSU_bottom_support(240);
//PSU_bottom_support_long_bow_tie();

//PSU_plate_long_tie();
//PSU_plate_long_tie(lower_z=0.1);



module debug_PSU_plate() {
    rotate([90,0,0])
    PSU_backplate(230);

    translate([
        -atx_psu_width/2 - 9.75, -8 + 3 - 3/2,
        (atx_psu_height + 6)/2
    ])
    PSU_plate_mount_1(230);
}

module test_PSU_plate() {
    translate([150/2, -10, 0])
    intersection() {
        PSU_backplate(230);

        translate([-160/2, 10, 0])
        cube([20, 20, 5]);
    }
}

module PSU_backplate(width) {
    //w = atx_psu_width + 10;
    h = atx_psu_height + 6;

    w = width - 70;

    translate([0, 0, 3])
    rotate([-90, 0, 0])
    difference() {
        union() {
            translate([0, 3/2, h/2 - 2])
            rotate([90, 0, 0])
            cube([w, h, 3],center=true);

            hull() {
                translate([0, 1/2, h - 6/2 - 2])
                cube(
                    [atx_psu_width, 1, 6],
                    center=true);

                translate([
                    0, -3 + 1/2, h - 3/2 - 2
                ])
                cube(
                    [atx_psu_width, 1, 3],
                    center=true);
            }

            hull() {
                translate([0, 1/2, 4/2 - 2])
                cube(
                    [atx_psu_width, 1, 4],
                    center=true);

                translate([0, -5 - 1, 3/2 - 2])
                cube(
                    [atx_psu_width, 1, 3],
                    center=true);
            }
        }
        atx_psu_back_cutout(thickness=17);

        translate([0, -17 + 1, 0])
        atx_psu_holes(hole=8, h=17, $fn=30);

        translate([-w/2  +2, 0, 0])
        rotate([0, 0, 45])
        cube([1.1, 1.1, 3*h], center=true);

        translate([-w/2 + 2, 3, 0])
        rotate([0, 0, 45])
        cube([1.1, 1.1, 3*h], center=true);

        translate([w/2 - 2, 0, 0])
        rotate([0, 0, 45])
        cube([1.1, 1.1, 3*h], center=true);

        translate([w/2 - 2, 3, 0])
        rotate([0, 0, 45])
        cube([1.1, 1.1, 3*h], center=true);

        translate([0, -5 + 3/2, -2])
        rotate([45, 0, 0])
        cube([w + 1, 2, 2], center=true);
    }
}

module PSU_plate_mount_1() {

    h = atx_psu_height + 6;
    x_off = 9.75;

    module _joint() {
        difference() {
            cube([10.2, 3.2, h + 1], center=true);

            difference() {
                union() {
                    translate(
                        [-10.2/2 + 2.1, -3.2/2, 0])
                    rotate([0, 0, 45])
                    cube([1, 1, h + 1], center=true);

                    translate([-10.2/2 + 2.1, 3.2/2, 0])
                    rotate([0, 0, 45])
                    cube([1, 1, h + 1], center=true);
                }
                chamfered_cube(
                    10, 5, h/2, 2, center=true
                );
            }
        }
    }

    difference() {
        union() {
            hull() {
                translate([1/2, 10/2, 0])
                cube([1, 10, h], center=true);

                translate([x_off - 1/2 - 0.1, 10/2, 0])
                cube([1, 7, h], center=true);
            }
            rotate([-90, 0, 0])
            long_tie_half(h);

            translate([0, 2.5/2, 0])
            cube([0.1, 2.5, h], center=true);
        }
        translate([x_off, 8 - 6/2, 0])
         _joint();

        translate([-30/2, 0, 0])
        chamfered_cube(30, 30, h/2, 6, center=true);

        translate([5, 10/2 + 4, h/2 + 4])
        rotate([0, -45, 0])
        cube([40, 10, 10], center=true);
        
    }
}

module PSU_plate_mount_2(width) {
    mirror([1, 0, 0])
    PSU_plate_mount_1(width);
}

module PSU_bottom_support(width) {
    difference() {
        intersection() {
            union() {
                cube([
                    width - 40, 30, 10
                ], center=true);

                translate([
                    -(width - 60)/2 + 20/2, 6,
                    10/2 - 1/2
                ])
                hull() {
                    cube([20, 18, 1], center=true);

                    translate([-6, 0, 10])
                    cube([8, 18, 1], center=true);
                }

                translate([
                    (width - 60)/2 - 20/2, 6,
                    10/2 - 1/2
                ])
                hull() {
                    cube([20, 18, 1], center=true);

                    translate([6, 0, 10])
                    cube([8, 18, 1], center=true);
                }
            }

            rotate([0, 0, 45])
            cube([145, 145, 200], center=true);
        }

        translate([-(width - 30)/2, 6, 0])
        cube([30, 30, 30], center=true);

        translate([(width - 30)/2, 6, 0])
        cube([30, 30, 30], center=true);

        translate([(width - 60)/2, 6, -20/2])
        rotate([0, 0, 90])
        male_dovetail(40);

        translate([-(width - 60)/2, 6, -20/2])
        rotate([0, 0, -90])
        male_dovetail(40);

        translate([0, 25, 0])
        chamfered_cube(
            width - 85, 50, 60, 20, center=true
        );

        translate([0, -10/2 - 11, 10/2 - 2])
        cube([
            atx_psu_width + 0.5, 10, 10
        ], center=true);
    }
}

module PSU_bottom_support_long_bow_tie() {
    long_bow_tie_half(length=20);
}

module PSU_plate_long_tie(lower_z=0.0) {
    
    intersection() {
        union() {
            translate([0, 0, -lower_z])
            long_tie_half(length=40);

            rotate([0, 45, 0])
            cube([1.9, 40, 1.9], center=true);
        }
        translate([0, 0, 10/2])
        cube([10, 50, 10], center=true);
    }
}