include <../Dollo/NEW_long_ties/globals.scad>;
include <../Dollo/NEW_long_ties/include.scad>;
use <../PCParts/common.scad>;


//debug();
debug_box2();

//box_bottom();
//box_top();

//box2_bottom();
//box2_top();


module debug() {
    intersection() {
        union() {
            box_bottom();

            translate([0, 0, 23])
            rotate([0, 180, 0])
            box_top();
        }
        translate([0, -5, 0])
        cube([100, 100, 100]);
    }
}

module debug_box2() {
    intersection() {
        union() {
            box2_bottom();

//            translate([0, 0, 21])
//            rotate([0, 180, 0])
//            box2_top();
        }

//        translate([0, -5, 0])
//        cube([100, 100, 100]);
    }

    translate([0, 0, 5.6])
    rotate([0, 0, 90])
    mock_stepdown_converter_2();
    
}

w = 26.8 + 3;
l = 62.3 + 3;

module box_bottom() {
    h = 7;
    difference() {
        union() {
            translate([0, 0, h/2])
            rounded_cube_side(
                w, l, h, 4, center=true, $fn=40
            );

            translate([0, 0,(h + 1)/2])
            rounded_cube_side(
                8, l + 15, h + 1, 4,
                center=true, $fn=40
            );
        }
        difference() {
            translate([0, 0, h + 1.4])
            cube([26.8, 62.3, h*2], center=true);

            translate([26.2/2 - 2.6, 61.7/2 - 2.8, 0])
            cylinder(d=7, h=4, $fn=50);

            translate([-26.2/2 + 2.5, 61.7/2 - 2.8, 0])
            cylinder(d=7, h=4, $fn=20);

            translate([26.2/2 - 2.6, -61.7/2 + 2.8, 0])
            cylinder(d=7, h=4, $fn=20);

            translate([-26.2/2 + 2.5, -61.7/2 + 2.8, 0])
            cylinder(d=7, h=4, $fn=20);
        }
        translate([26.2/2 - 2.6, 61.7/2 - 2.8, 0]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.2, d2=3.2, h=2, $fn=20);
        }
        translate([-26.2/2 + 2.5, 61.7/2 - 2.8, 0]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.2, d2=3.2, h=2, $fn=20);
        }
        translate([26.2/2 - 2.6, -61.7/2 + 2.8, 0]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.2, d2=3.2, h=2, $fn=20);
        }
        translate([-26.2/2 + 2.5, -61.7/2 + 2.8, 0]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.2, d2=3.2, h=2, $fn=20);
        }

        translate([0,0, h + 2])
        rotate([90, 0, 0])
        cylinder(d=4, h=l + 20, center=true, $fn=30);

        translate([w/2, -l/2 + 12/2 + 8.2, h + 1])
        cube([3, 12, 5], center=true);

        translate([-20/2, -l/2 - 7.5, -2])
        hull() {
            cube([20, 7.5, 1]);
            cube([20, 0.01, 8.5]);
        }
        mirror([0, 1, 0])
        translate([-20/2, -l/2 - 7.5, -2])
        hull() {
            cube([20, 7.5, 1]);
            cube([20, 0.01, 8.5]);
        }
    }
    %translate([0, 0, 4 + 1.6/2])
    mock_buck_converter();
}

module box_top() {
    h = 16;
    difference() {
        union() {
            difference() {
                union() {
                    translate([0, 0, h/2])
                    rounded_cube_side(
                        w, l, h, 4, center=true, $fn=40
                    );

                    translate([0, 0, (h - 1)/2])
                    rounded_cube_side(
                        8, l + 15, h - 1, 4,
                        center=true, $fn=40
                    );
                }
                translate([0, 0, h + 1.4])
                cube([26.8, 62.3, h*2], center=true);
            }

            translate([26.2/2 - 2.6, 61.7/2 - 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);

            translate([-26.2/2 + 2.5, 61.7/2 - 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);

            translate([26.2/2 - 2.6, -61.7/2 + 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);

            translate([-26.2/2 + 2.5, -61.7/2 + 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);
        }

        translate([26.2/2 - 2.5, 61.7/2 - 2.8, 0])
        cylinder(d=2.8, h=35, center=true, $fn=20);

        translate([-26.2/2 + 2.6, 61.7/2 - 2.8, 0])
        cylinder(d=2.8, h=35, center=true, $fn=20);

        translate([26.2/2 - 2.5, -61.7/2 + 2.8, 0])
        cylinder(d=2.8, h=35, center=true, $fn=20);

        translate([-26.2/2 + 2.6, -61.7/2 + 2.8, 0])
        cylinder(d=2.8, h=35, center=true, $fn=20);

        translate([-26.2/2 + 0.8 + 1.2, 9.5 + 2.5 - 1.2, 0])
        cylinder(d=3, h=5, center=true, $fn=20);

        translate([-26.2/2 + 0.8 + 1.2, 1.5 - 1.2, 0])
        cylinder(d=3, h=5, center=true, $fn=20);

        translate([0, 0, h])
        rotate([90, 0, 0])
        cylinder(d=4, h=l + 20, center=true, $fn=30);

        translate([0,0, h])
        cube([8.2, l + 1, 2], center=true);

        translate([-20/2, -l/2 - 7.5])
        hull() {
            cube([20, 7.5, h - 2.5 - 7.5]);
            cube([20, 0.01, h - 2.5]);
        }
        mirror([0, 1, 0])
        translate([-20/2, -l/2 - 7.5])
        hull() {
            cube([20, 7.5, h - 2.5 - 7.5]);
            cube([20, 0.01, h - 2.5]);
        }

        translate([w/2 + 3/2 - 1.6, 0, h + 3/2])
        cube([3, l, 3], center=true);

        translate([-w/2 - 3/2 + 1.6, 0, h + 3/2])
        cube([3, l, 3], center=true);

        translate([0, l/2 + 3/2 - 1.6, h + 3/2])
        cube([w, 3, 3], center=true);

        translate([0, -l/2 - 3/2 + 1.6, h + 3/2])
        cube([w, 3, 3],center=true);
    }
}

module box2_bottom() {
    h = 7;
    difference() {
        union() {
            translate([0, 0, h/2])
            rounded_cube_side(
                w, l, h, 4, center=true, $fn=40
            );

            translate([0, 0,(h + 1)/2])
            rounded_cube_side(
                10, l + 15, h + 1, 4,
                center=true, $fn=40
            );
        }

        difference() {
            translate([0, 0, h + 1.4])
            cube([26.8, 62.3, h*2], center=true);

            // top mount studs
            translate([26.2/2 - 2.6, 61.7/2 - 2.8, 0])
            cylinder(d=7, h=5.6, $fn=50);

            translate([-26.2/2 + 2.5, 61.7/2 - 2.8, 0])
            cylinder(d=7, h=5.6, $fn=20);

            translate([26.2/2 - 2.6, -61.7/2 + 2.8, 0])
            cylinder(d=7, h=5.6, $fn=20);

            translate([-26.2/2 + 2.5, -61.7/2 + 2.8, 0])
            cylinder(d=7, h=5.6, $fn=20);

            // coverter mount studs
            translate([8.1, 15.1, 0])
            cylinder(d=7, h=5.6, $fn=50);

            translate([-8.1, -15, 0])
            cylinder(d=7, h=5.6, $fn=50);
            
        }
        translate([26.2/2 - 2.6, 61.7/2 - 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        translate([-26.2/2 + 2.5, 61.7/2 - 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        translate([26.2/2 - 2.6, -61.7/2 + 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        translate([-26.2/2 + 2.5, -61.7/2 + 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }

        translate([0,0, h + 2])
        rotate([90, 0, 0])
        cylinder(d=5, h=l + 20, center=true, $fn=30);

        translate([-w/2, l/2 - 4/2 - 16, h + 1])
        cube([3, 4, 5], center=true);

        // chamfers
        translate([-20/2, -l/2 - 7.5, -2])
        hull() {
            cube([20, 7.5, 1]);
            cube([20, 0.01, 8.5]);
        }

        mirror([0, 1, 0])
        translate([-20/2, -l/2 - 7.5, -2])
        hull() {
            cube([20, 7.5, 1]);
            cube([20, 0.01, 8.5]);
        }

        // converter screw holes
        translate([8.1, 15.1, -1])
        cylinder(d=2.8, h=15, $fn=50);

        translate([-8.1, -15, -1])
        cylinder(d=2.8, h=15, $fn=50);

        // grills
        for(i = [0:4]) {
            translate([0, -13 + i*6, 0])
            hull() {
                translate([-8, 5, 0])
                cylinder(d=2.5, h=10, center=true, $fn=30);

                translate([8, -5, 0])
                cylinder(d=2.5, h=10, center=true, $fn=30);

            }
        }
    }
}

module box2_top() {
    h = 14;
    difference() {
        union() {
            difference() {
                union() {
                    translate([0, 0, h/2])
                    rounded_cube_side(
                        w, l, h, 4, center=true, $fn=40
                    );

                    translate([0, 0, (h - 1)/2])
                    rounded_cube_side(
                        10, l + 15, h - 1, 4,
                        center=true, $fn=40
                    );
                }
                translate([0, 0, h + 1.4])
                cube([26.8, 62.3, h*2], center=true);
            }

            translate([26.2/2 - 2.6, 61.7/2 - 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);

            translate([-26.2/2 + 2.5, 61.7/2 - 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);

            translate([26.2/2 - 2.6, -61.7/2 + 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);

            translate([-26.2/2 + 2.5, -61.7/2 + 2.8, 0])
            cylinder(d=6, h=h + 3 - 1.6, $fn=50);
        }

        translate([26.2/2 - 2.5, 61.7/2 - 2.8, 1])
        cylinder(d=2.8, h=35, $fn=20);

        translate([-26.2/2 + 2.6, 61.7/2 - 2.8, 1])
        cylinder(d=2.8, h=35, $fn=20);

        translate([26.2/2 - 2.5, -61.7/2 + 2.8, 1])
        cylinder(d=2.8, h=35, $fn=20);

        translate([-26.2/2 + 2.6, -61.7/2 + 2.8, 1])
        cylinder(d=2.8, h=35, $fn=20);

        translate([7.6, 3.8, 0])
        cylinder(d=3.2, h=5, center=true, $fn=20);

        translate([0, 0, h])
        rotate([90, 0, 0])
        cylinder(d=5, h=l + 20, center=true, $fn=30);

        translate([0,0, h])
        cube([8.2, l + 1, 2], center=true);

        // chamfers
        translate([-20/2, -l/2 - 7.5, -1])
        hull() {
            cube([20, 7.5, h - 2.5 - 7.5]);
            cube([20, 0.01, h - 2.5]);
        }

        mirror([0, 1, 0])
        translate([-20/2, -l/2 - 7.5, -1])
        hull() {
            cube([20, 7.5, h - 2.5 - 7.5]);
            cube([20, 0.01, h - 2.5]);
        }

        translate([w/2 + 3/2 - 1.6, 0, h + 3/2])
        cube([3, l, 3], center=true);

        translate([-w/2 - 3/2 + 1.6, 0, h + 3/2])
        cube([3, l, 3], center=true);

        translate([0, l/2 + 3/2 - 1.6, h + 3/2])
        cube([w, 3, 3], center=true);

        translate([0, -l/2 - 3/2 + 1.6, h + 3/2])
        cube([w, 3, 3],center=true);

        // grills
        for(i = [0:4]) {
            translate([0, -16 + i*8, 0])
            hull() {
                translate([8, 4, 0])
                cylinder(d=2.5, h=10, center=true, $fn=30);

                translate([-8, -4, 0])
                cylinder(d=2.5, h=10, center=true, $fn=30);

            }
        }
    }
}