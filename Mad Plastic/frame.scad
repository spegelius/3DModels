use <../Dollo/NEW_long_ties/include.scad>;

// calculations
bottom_rod = 12.5 + 6.4 + 1.5 + 6 + 2 + 36 + 1.5 + 8;
echo(bottom_rod);

long_rod = 312 + 6 + 1.5 + 8 - 1.5 - 6.4 - 12.5;
echo(long_rod);



//frame_mockup();
//platform_mockup();

//chute_top();
//container();
//container_lid();

//platform_leg_1();
//platform_leg_2();
platform_leg_soft_pad();


module _bottom() {
    difference() {
        translate([0, 0, 6/2])
        rounded_cube_side(
            196.5, 162, 6, 12, center=true, $fn=30
        );

        translate([-177/2, 132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);

        translate([-177/2, -132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);

        translate([177/2, 132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);

        translate([177/2, -132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);


        translate([-104.5/2, 143/2, 0])
        cube([20.3, 6.3, 20], center=true);

        translate([-104.5/2, -143/2, 0])
        cube([20.3, 6.3, 20], center=true);

        translate([104.5/2, 143/2, 0])
        cube([20.3, 6.3, 20], center=true);

        translate([104.5/2, -143/2, 0])
        cube([20.3, 6.3, 20], center=true);
    }
}

module _wall() {
    rotate([0, 0, 90])
    difference() {
        union() {
            cube([6, 155, 312], center=true);

            translate([0, 104.5/2, -312/2])
            cube([6, 20, 12], center=true);

            translate([0, -104.5/2, -312/2])
            cube([6, 20, 12], center=true);

            translate([0, 94.5/2, 312/2])
            cube([6, 20, 12], center=true);

            translate([0, -94.5/2, 312/2])
            cube([6, 20, 12], center=true);
        }

        translate([0, 104.5/2, 312/2 - 80 - 6.3/2])
        cube([20, 20.3, 6.3], center=true);

        translate([0, -104.5/2, 312/2 - 80 - 6.3/2])
        cube([20, 20.3, 6.3], center=true);

    }
}

module _shelf() {
    union() {
        translate([0, 0, 6/2])
        cube([155, 137, 6], center=true);

        translate([-104.5/2, 0, 6/2])
        cube([20, 149, 6], center=true);

        translate([104.5/2, 0, 6/2])
        cube([20, 149, 6], center=true);
    }
}

module _top() {
    difference() {
        translate([0, 0, 6/2])
        rounded_cube_side(
            196.5, 162, 6, 12, center=true, $fn=30
        );

        translate([0, -93/2 + 162/2 - 21, 0])
        rounded_cube_side(
            141, 93, 20, 12, center=true, $fn=30
        );

        translate([-177/2, 132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);

        translate([-177/2, -132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);

        translate([177/2, 132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);

        translate([177/2, -132/2, 0])
        cylinder(d=9, h=20, center=true, $fn=30);


        translate([-94.5/2, 143/2, 0])
        cube([20.3, 6.3, 20], center=true);

        translate([-94.5/2, -143/2, 0])
        cube([20.3, 6.3, 20], center=true);

        translate([94.5/2, 143/2, 0])
        cube([20.3, 6.3, 20], center=true);

        translate([94.5/2, -143/2, 0])
        cube([20.3, 6.3, 20], center=true);
    }
}

module frame_mockup() {
    _bottom();

    translate([0, 0, 312 + 6])
    _top();

    translate([0, 143/2, 312/2 + 6])
    _wall();

    translate([0, -143/2, 312/2 + 6])
    _wall();

//    translate([0, 0, 312 - 80.15])
//    _shelf();

    translate([0, 0, 312 - 80.15])
    chute_top();

    color("grey")
    translate([-177/2, 132/2, 0])
    cylinder(d=8, h=340, $fn=30);

    color("grey")
    translate([177/2, 132/2, 0])
    cylinder(d=8, h=340, $fn=30);

    color("grey")
    translate([-177/2, -132/2, 0])
    cylinder(d=8, h=340, $fn=30);

    color("grey")
    translate([177/2, -132/2, 0])
    cylinder(d=8, h=340, $fn=30);

    color("grey")
    translate([-177/2, 132/2, 6])
    cylinder(d=16, h=40, $fn=30);

    color("grey")
    translate([177/2, 132/2, 6])
    cylinder(d=16, h=40, $fn=30);

    color("grey")
    translate([-177/2, -132/2, 6])
    cylinder(d=16, h=40, $fn=30);

    color("grey")
    translate([177/2, -132/2, 6])
    cylinder(d=16, h=40, $fn=30);

    intersection() {
        color("lightgrey")
        translate([0, 0, 6])
        container();

        translate([0, 500/2, 0])
        cube([500, 500, 1000], center=true);
    }

    translate([0, 0, 231.2])
    rotate([180, 0, 0])
    container_lid();

    rotate([0, 0, 180])
    translate([0, -22, -72])
    platform_mockup();
}

module platform_mockup() {
    translate([0, 0, 33/2 + 38])
    cube([1000, 206, 33], center=true);

    translate([1000/2 - 42/2, -44/2, 38/2])
    cube([42, 250, 38], center=true);

    translate([-1000/2 + 42/2, -44/2, 38/2])
    cube([42, 250, 38], center=true);

    translate([-1000/2 + 42/2, -154.3, 38/2 - 1])
    rotate([-102, 0, 0])
    intersection() {
        platform_leg_1();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    translate([-1000/2 + 42/2, 107.3, 38/2 - 3])
    rotate([90, 0, 0])
    platform_leg_2();

    translate([-1000/2 + 42/2, -134.3, -10])
    platform_leg_soft_pad();

    translate([-1000/2 + 42/2, 84.3, -10])
    platform_leg_soft_pad();
}

module chute_top() {
    difference() {
        union() {
            _shelf();

            translate([0, 0, 6/2])
            rounded_cube_side(
                185, 122, 6, 10, center=true, $fn=30
            );

            hull() {
                translate([0, 0, 0.1/2])
                rounded_cube_side(
                    151, 105, 0.1, 8, center=true, $fn=30
                );

                translate([0, 14,  86 - 0.1/2])
                rounded_cube_side(
                    153, 105, 0.1, 8, center=true, $fn=30
                );
            }
        }

        hull() {
            translate([0, 0, 0.1/2])
            rounded_cube_side(
                147, 101, 0.2, 4, center=true, $fn=30
            );

            translate([0, 14,  86 - 0.1/2])
            rounded_cube_side(
                149, 101, 0.2, 4, center=true, $fn=30
            );
        }

        translate([52.5, -70, 6/2])
        rotate([90, 0, 0])
        cylinder(d=2.6, h=20, center=true, $fn=20);

        translate([52.5, 70, 6/2])
        rotate([90, 0, 0])
        cylinder(d=2.6, h=20, center=true, $fn=20);

        translate([-52.5, -70, 6/2])
        rotate([90, 0, 0])
        cylinder(d=2.6, h=20, center=true, $fn=20);

        translate([-52.5, 70, 6/2])
        rotate([90, 0, 0])
        cylinder(d=2.6, h=20, center=true, $fn=20);
    }
}

module container() {
    difference() {
        union() {
            translate([0, 0, 42/2])
            rounded_cube_side(
                205, 115, 42, 15, center=true, $fn=30
            );

            hull() {
                translate([0, 0, 42 - 1/2])
                rounded_cube_side(
                    205, 115, 1, 15, center=true, $fn=30
                );

                translate([0, 0, 48 + (223.2 - 48)/2])
                rounded_cube_side(
                    205, 123, 223.2 - 48,
                    15, center=true, $fn=30
                );
            }
        }

        union() {
            translate([0, 0, 400/2 + 2])
            rounded_cube_side(
                202, 112, 400, 12, center=true, $fn=30
            );

            hull() {
                translate([0, 0, 42.5 - 1/2])
                rounded_cube_side(
                    202, 112, 1, 12, center=true, $fn=30
                );

                translate([0, 0, 48.5 + 226/2])
                rounded_cube_side(
                    202, 120, 226,
                    12, center=true, $fn=30
                );
            }
        }

        for(i = [0:7]) {
            translate([0, -42 + i*12, 0])
            rotate([45, 0, 0])
            cube([180, 1, 1], center=true);
        }
    }
}

module container_lid() {
    difference() {
        union() {
            translate([0, 0, 2/2])
            rounded_cube_side(
                205, 123, 2,
                15, center=true, $fn=30
            );

            translate([0, 0, 12/2])
            rounded_cube_side(
                201, 119, 12,
                11, center=true, $fn=30
            );

        }

        translate([0, 0, 1.8 + 12/2])
        rounded_cube_side(
            198, 116, 12,
            8, center=true, $fn=30
        );

        rounded_cube_side(
            160, 105, 10, 8, center=true, $fn=30
        );
    }
}

module _screw_head_hole() {
    translate([0, 0, 10])
    rotate([180, 0, 0])
    union() {
        cylinder(d=4.6, h=11, $fn=30);
        cylinder(d=9.1, h=4, center=true, $fn=30);

        translate([0, 0, 1.99])
        cylinder(d1=9.1, d2=4.6, h=3, $fn=30);
    }
}

module platform_leg_1() {
    difference() {
        union() {
            rotate([12, 0, 0])
            hull() {
                translate([50/2 - 8/2, 48/2 - 8/2, -1.05])
                sphere(d=8, $fn=40);

                translate([50/2 - 8/2, 48/2 - 8/2, 50])
                cylinder(d=8, h=1, $fn=40);

                translate([-50/2 + 8/2, 48/2 - 8/2, -1.05])
                sphere(d=8, $fn=40);

                translate([-50/2 + 8/2, 48/2 - 8/2, 50])
                cylinder(d=8, h=1, $fn=40);

                translate([50/2 - 8/2, -48/2 + 8/2, 7.46])
                sphere(d=8, $fn=40);

                translate([50/2 - 8/2, -48/2 + 8/2, 50])
                cylinder(d=8, h=1, $fn=40);

                translate([-50/2 + 8/2, -48/2 + 8/2, 7.46])
                sphere(d=8, $fn=40);

                translate([-50/2 + 8/2, -48/2 + 8/2, 50])
                cylinder(d=8, h=1, $fn=40);
            }
        }

        translate([0, 0, -10/2])
        cube([100, 100, 10], center=true);

        translate([0, 0, 0])
        rotate([12, 0, 0])
        translate([0, -1, 44/2 + 7.1])
        cube([42, 38, 44], center=true);

        rotate([12, 0, 0])
        translate([0, 15, 15])
        rotate([-90, 0, 0])
        _screw_head_hole();

        rotate([12, 0, 0])
        translate([0, 15, 42])
        rotate([-90, 0, 0])
        _screw_head_hole();

        rotate([12, 0, 0])
        translate([12, 48/2 + 1, 4])
        rotate([0, 0, 180])
        male_dovetail();

        rotate([12, 0, 0])
        translate([-12, 48/2 + 1, 4])
        rotate([0, 0, 180])
        male_dovetail();
    }
}

module platform_leg_2() {
    difference() {
        translate([0, 0, 50/2 - 1])
        rounded_cube(50, 44, 50, 8, center=true, $fn=40);

        translate([0, 0, -10/2])
        cube([100, 100, 10], center=true);

        translate([0, -44/2 + 40/2 + 6, 50/2 + 4])
        cube([42, 40, 50], center=true);

        translate([0, -13, 40])
        rotate([90, 0, 0])
        _screw_head_hole();

        translate([0, -13, 15])
        rotate([90, 0, 0])
        _screw_head_hole();

        translate([12, -48/2 + 1, 10])
        male_dovetail();

        translate([-12, -48/2 + 1, 10])
        male_dovetail();
    }
}

module platform_leg_soft_pad() {
    module _dovetail() {
        difference() {
            male_dovetail(30);

            hull() {
                translate([0, 2, 0])
                cube([1.7, 1, 100], center=true);

                translate([0, 6, 0])
                cube([3.7, 1, 100], center=true);
            }
        }
    }

    difference() {
        union() {
            translate([0, 0, 4/2])
            rounded_cube_side(
                42, 40, 4, 8, center=true, $fn=30
            );

            translate([-12, 30/2, 3])
            rotate([90, 0, 0])
            scale(0.98)
            _dovetail();

            translate([12, 30/2, 3])
            rotate([90, 0, 0])
            scale(0.98)
            _dovetail();
        }

        translate([42/6, 0, 0])
        rotate([0, 45, 0])
        cube([1.4, 50, 1.4], center=true);

        translate([-42/6, 0, 0])
        rotate([0, 45, 0])
        cube([1.4, 50, 1.4], center=true);

        translate([0, 40/6, 0])
        rotate([45, 0, 0])
        cube([50, 1.4, 1.4], center=true);

        translate([0, -40/6, 0])
        rotate([45, 0, 0])
        cube([50, 1.4, 1.4], center=true);
    }
}