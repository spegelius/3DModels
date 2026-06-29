use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "EggRider protector sock/"
);


module _orig_sw102guard() {
    translate([16.7, 9.8, 13.5])
    rotate([0, 90, 90])
    import(
        str(spath, "sw102guard.stl"),
        convexity=10
    );

    //%cylinder(d=20, h=1, $fn=40);
}


//_orig_sw102guard();
//mock_sw102();

//debug();

//sw102_mount_frame_1();
//sw102_mount_frame_2();
sw102_mount_clasp();


module mock_sw102() {
    color("grey")
    difference() {
        intersection() {
            union() {
                translate([-5.7, -56/2 + 42.2, 23/2])
                rotate([0, 90, 0])
                rounded_cube_side(
                    23,  56, 8.5, 9, center=true, $fn=60
                );

                rotate([0, 0, 53])
                translate([-3.5, -6.1, 23/2])
                rotate([0, 90, 0])
                rounded_cube_side(
                    23,  30, 13, 9, center=true, $fn=60
                );

                // inner corner padding
                translate([-2, 0, 23/2])
                rotate([0, 0, 26])
                cube([5, 10, 23], center=true);

                // more body
                translate([
                    27/2 - 5.7 - 8.5/2, 42.2 - 14 - 38/2, 23 - 14/2
                ])
                cube([27, 38, 14], center=true);
            }

            hull() {
                cylinder(d=20, h=30, $fn=40);

                translate([0, 50, 0])
                cylinder(d=20, h=30, $fn=40);

                translate([40, 50, 0])
                cylinder(d=20, h=30, $fn=40);

                rotate([0, 0, 53])
                translate([0, -50, 0])
                cylinder(d=20, h=30, $fn=40);
            }
        }

        hull() {
            translate([2.55, 3.09, 0])
            cylinder(d=8, h=9, $fn=60);

            translate([2.55, 13, 0])
            cylinder(d=8, h=9, $fn=60);

            translate([2.55, 3.09, 0])
            rotate([0, 0, 53])
            translate([0, -30, 0])
            cylinder(d=8, h=9, $fn=60);
        }

        translate([30/2 - 5.7 + 8.5/2, 42.2 - 17 + 30/2, 0])
        rounded_cube_side(
            30, 30, 60, 6, center=true, $fn=60
        );

        translate([
            -5.7 - 8.5/2 + 14.5 + 22.2/2,
            42.1 - 17 - 4 - 22.2/2, 0
        ])
        cylinder(d=22.2, h=60, $fn=60);

        translate([
            27 - 5.7 - 8.5/2, 42.1 - 17 - 4 - 22.2 - 3.5, 23 - 14/2
        ])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([20 - 5.7 - 8.5/2 + 10/2, 24, 0])
        cube([10, 10, 60], center=true);
    }
}

module debug() {
//    intersection() {
//        _orig_sw102guard();
//
//        translate([0, 0, 10/2 + 2.5])
//        cube([100, 100, 10], center=true);
//    }

    translate([0, 0, 2])
    mock_sw102();

    sw102_mount_frame_1();

    translate([0, 0, 27.2])
    rotate([0, 180, 0])
    sw102_mount_frame_2();

    translate([27.2, 11, 27/2])
    sw102_mount_clip();

    //color("grey")
    %translate([
        -5.7 - 8.5/2 + 14.5 + 22.2/2,
        42.1 - 17 - 4 - 22.2/2, -1
    ])
    cylinder(d=22.2, h=60, $fn=60);
}

module _sw102_body_cut() {
    // sw102 body cut
    difference() {
        intersection() {
            union() {
                translate([-4.7, -56/2 + 42.4, 23/2 + 2])
                rotate([0, 90, 0])
                rounded_cube_side(
                    23,  56, 11.9, 6, center=true, $fn=60
                );

                rotate([0, 0, 53])
                translate([-3.8, -6.3, 23/2 + 2])
                rotate([0, 90, 0])
                rounded_cube_side(
                    23,  30, 12.4, 6, center=true, $fn=60
                );

                // inner corner padding
                translate([-2, 0, 11/2 + 2])
                rotate([0, 0, 26])
                cube([5, 10, 11], center=true);
            }

            hull() {
                cylinder(d=20.2, h=30, $fn=40);

                translate([0, 50, 0])
                cylinder(d=20.2, h=30, $fn=40);

                translate([40, 50, 0])
                cylinder(d=20.2, h=30, $fn=40);

                rotate([0, 0, 53])
                translate([0, -50, 0])
                cylinder(d=20.2, h=30, $fn=40);
            }
        }

        hull() {
            translate([2.75, 3.44, -1.4])
            chamfered_cylinder(8, 13, 2, $fn=60);

            translate([2.75, 43, -1.4])
            chamfered_cylinder(8, 13, 2, $fn=60);

            translate([2.75, 3.44, -1.4])
            rotate([0, 0, 53])
            translate([0, -30, 0])
            chamfered_cylinder(8, 13, 2, $fn=60);
        }
    }
}

module _sw102_display_cut() {
    //sw102 display cut
    translate([-8, -56/2 + 41.2, 23/2 + 3])
    rotate([0, 90, 0])
    rounded_cube_side(
        23,  56, 11.7, 7, center=true, $fn=60
    );

    rotate([0, 0, 53])
    translate([-7.1, -8.5, 23/2 + 2.8])
    rotate([0, 90, 0])
    rounded_cube_side(
        23,  24, 10, 7, center=true, $fn=60
    );

    translate([-1, -20, 23/2 + 2.8])
    rotate([90, 0, 0])
    rounded_cube_side(
        23,  23, 11.7, 7, center=true, $fn=60
    );

}

module _sw102_mount_frame() {

    difference() {
        union() {
            intersection() {
                hull() {
                    translate([-4.2, -56/2 + 43.9, 23/2 - 0.4])
                    rotate([0, 90, 0])
                    rounded_cube_side(
                        23,  56, 14.7, 5, center=true, $fn=60
                    );

                    rotate([0, 0, 53])
                    translate([-2.1, -7.8, 23/2 - 0.4])
                    cube([19, 30, 23], center=true);
                }

                hull() {
                    //cylinder(d=23.2, h=5, $fn=40);
                    chamfered_cylinder(23.2, 5, 1.2, $fn=80);

                    translate([0, 50, 0])
                    cylinder(d=23.2, h=5, $fn=40);

                    translate([40, 50, 0])
                    cylinder(d=23.2, h=5, $fn=40);

                    rotate([0, 0, 53])
                    translate([0, -50, 0])
                    cylinder(d=23.2, h=5, $fn=40);
                }
            }
        }
    }
}

module _sw102_chamfers() {
    // chamfers
    translate([-5.8 - 11.7/2, 0, -2.2])
    rotate([0, 45, 0])
    cube([5, 100, 5], center=true);

    rotate([0, 0, 53])
    translate([-2.2 - 19/2, 0, -2.2])
    rotate([0, 45, 0])
    cube([5, 100, 5], center=true);

    translate([0, 46.3, 5])
    rotate([45, 0, 0])
    cube([100, 5, 5], center=true);

    translate([-5.8 - 11.7/2, 46.3, 0])
    rotate([0, 0, 45])
    cube([5, 5, 100], center=true);

    translate([0, 48.4, 0])
    rotate([0, 0, -20])
    cube([20, 10, 100], center=true);
}

module sw102_mount_frame_1() {
    difference() {
        union() {
            _sw102_mount_frame();

            hull() {
                translate([19.2, -17, 0])
                cylinder(d=9, h=11, $fn=30);

                rotate([0, 0, 53])
                translate([-4.35, -20.8, 11/2])
                cube([14.5, 4, 11], center=true);
            }

            hull() {
                translate([2.55, 3.09, 0])
                cylinder(d=7.9, h=11, $fn=60);

                translate([2.55, 37.8, 0])
                cylinder(d=8.2, h=11, $fn=60);

                translate([8, 33, 0])
                cylinder(d=7.9, h=11, $fn=60);

                translate([2.55, 3.09, 0])
                rotate([0, 0, 53])
                translate([0, -17.5, 0])
                cylinder(d=7.9, h=11, $fn=60);
            }
        }
        _sw102_body_cut();
        _sw102_display_cut();

        // thread insert holes
        translate([2.55, 37.8, 9])
        chamfered_cylinder(4, 17, 1.4, center=true, $fn=30);

        translate([19.2, -17, 9])
        chamfered_cylinder(4, 17, 1.4, center=true, $fn=30);

        // clip mount holes
        translate([
            27 - 5.7 - 8.5/2, 42.1 - 17 - 4 - 22.2 - 3.5, 11/2
        ])
        rotate([0, 90, 0])
        chamfered_cylinder(4, 17, 1, center=true, $fn=30);

        translate([
            22 - 5.7 - 8.5/2, 42.1 - 17, 11/2
        ])
        rotate([0, 90, 0])
        chamfered_cylinder(4, 17, 1, center=true, $fn=30);

        hull() {
            translate([17.05 + 10/2, 5.8, 0])
            cube([10, 30, 60], center=true);

            translate([21 + 10/2, 2.7, 0])
            cube([10, 30, 60], center=true);
        }

        translate([22 - 5.7 - 8.5/2 + 10/2, 28, 0])
        cube([10, 20, 60], center=true);

        translate([
            -5.7 - 8.5/2 + 14.5 + 22.2/2,
            42.1 - 17 - 4 - 22.2/2, -1
        ])
        cylinder(d=22.4, h=60, $fn=60);

        _sw102_chamfers();
    }
}


module sw102_mount_frame_2() {
    mirror([1, 0, 0])
    difference() {
        union() {
            _sw102_mount_frame();

            hull() {
                translate([19.2, -17, 0])
                cylinder(d=9, h=16, $fn=30);

                rotate([0, 0, 53])
                translate([-4.35, -20.8, 16/2])
                cube([14.5, 4, 16], center=true);
            }

            translate([2.55, 37.8, 0])
            cylinder(d=8.2, h=16, $fn=60);

            hull() {
                translate([2.55, 37.8, 0])
                cylinder(d=8.2, h=5, $fn=60);

                translate([8, 33, 0])
                cylinder(d=7.9, h=5, $fn=60);

                translate([16, -17, 0])
                cylinder(d=9, h=5, $fn=30);

                translate([2.75, 3.44, 0])
                cylinder(d=8, h=5, $fn=60);
            }
        }

        difference() {
            hull() {
                _sw102_body_cut();

                translate([20, 20, 2])
                cylinder(d=20, h=23);
            }

            translate([30/2 - 5.5 + 8.5/2, 42.2 - 16.8 + 30/2, 0])
            rounded_cube_side(
                30, 30, 60, 6, center=true, $fn=60
            );
        }
        _sw102_display_cut();

        // mount holes
        translate([2.55, 37.8, 0])
        cylinder(d=3.2, h=40, center=true, $fn=30);

        translate([2.55, 37.8, -1])
        chamfered_cylinder(6, 11, 1.6, center=true, $fn=30);

        translate([19.2, -17, 0])
        cylinder(d=3.2, h=40, center=true, $fn=30);

        translate([19.2, -17, -1])
        chamfered_cylinder(6, 11, 1.6, center=true, $fn=30);

        hull() {
            translate([17.05 + 10/2, 5.8, 0])
            cube([10, 30, 60], center=true);

            translate([21 + 10/2, 2.7, 0])
            cube([10, 30, 60], center=true);
        }

        translate([22 - 5.7 - 8.5/2 + 10/2, 28, 0])
        cube([10, 20, 60], center=true);

        translate([
            -5.7 - 8.5/2 + 14.5 + 22.2/2,
            42.1 - 17 - 4 - 22.2/2, -1
        ])
        cylinder(d=22.4, h=60, $fn=60);

        _sw102_chamfers();
    }
}

module sw102_mount_clasp() {
    difference() {
        intersection() {
            cube([30, 40, 27], center=true);

            translate([-30/2 - 80/2 + 18, -1.2, 0])
            chamfered_cylinder(80, 27, 2, center=true, $fn=100);
        }

        translate([-30/2 + 2.9, -1.2, 0])
        cylinder(d=22.4, h=60, center=true, $fn=60);

        translate([-30/2, -30/2, 0])
        cube([10, 20, 60], center=true);

        translate([0, -40/2 + 4.4, -27/2 + 11/2])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=20, center=true, $fn=30);

        translate([-5, -40/2 + 4.4, -27/2 + 11/2])
        rotate([0, 90, 0])
        cylinder(d=6.3, h=20, $fn=30);

        translate([0, -40/2 + 4.4, -27/2 + 25 - 14/2])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=20, center=true, $fn=30);

        translate([-5, -40/2 + 4.4, -27/2 + 25 - 14/2])
        rotate([0, 90, 0])
        cylinder(d=6.3, h=20, $fn=30);

        translate([0, 40/2 - 5.9, -27/2 + 11/2])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

        translate([-10, 40/2 - 5.9, -27/2 + 11/2])
        rotate([0, 90, 0])
        cylinder(d=6.3, h=20, $fn=30);
    }
    
}
