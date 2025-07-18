use <../Dollo/NEW_long_ties/include.scad>;


fastener_hole_l = 61;
fastener_l = fastener_hole_l - 5.2;
fastener_wall = 1.8;

fastener_dia = 7;


//_mock_hopper();

//debug();


hopper_mount();
//hopper_top();
//hopper_lid();

//fastener();


module _mock_hopper() {
    translate([0, 0, 200/2])
    difference() {
        rounded_cube_side(
            143.4, 97, 200, 6, center=true, $fn=30
        );

        rounded_cube_side(
            143.4 - 3, 97 - 3, 210,
            3, center=true, $fn=30
        );
    }

    translate([167.5/2, 0, 0])
    cylinder(d=9, h=10, $fn=30);

    translate([-167.5/2, 0, 0])
    cylinder(d=9, h=10, $fn=30);

    translate([167.5/2, -9/2 - 7.4 - 20/2, 0])
    cylinder(d=20, h=10, $fn=30);

    translate([-167.5/2, -9/2 - 7.4 - 20/2, 0])
    cylinder(d=20, h=10, $fn=30);
}

module _mock_M4_screw() {
    union() {
        cylinder(d=7.7, h=0.8, $fn=30);

        translate([0, 0, 0.8])
        cylinder(d1=7.7, d2=4, h=2, $fn=30);

        cylinder(d=4, h=10, $fn=30);
    }
}

module debug() {
    color("lightgrey")
    translate([0, 0, 2])
    _mock_hopper();

    intersection() {
        hopper_mount();

//        cube([200, 200, 16], center=true);
    }

    translate([-40, 54.5, 8])
    rotate([90, 0, 0])
    _mock_M4_screw();

    intersection() {
        translate([0, 0, 191])
        hopper_top();

        translate([0, 300/2, 0])
        cube([300, 300, 600], center=true);
    }

    intersection() {
        translate([0, 0, 210.4])
        rotate([180, 0, 0])
        hopper_lid();

        translate([0, 300/2, 0])
        cube([300, 300, 600], center=true);
    }

    translate([79.8, fastener_l/2, 197.6])
    rotate([90, 0, 0])
    fastener();
}

module _screw_hole() {
    hull() {
        cylinder(d=8, h=4, $fn=30);
        cylinder(
            d=2, h=4 + 3, $fn=30
        );
    }
    cylinder(d=2, h=20, $fn=30);
}


module hopper_mount() {
    h = 16;

    difference() {
        union() {
            hull() {
                translate([-195/2 + 8/2, 15, 0])
                cylinder(d=8, h=4, $fn=30);

                translate([195/2 - 8/2, 15, 0])
                cylinder(d=8, h=4, $fn=30);

                translate([-195/2 + 8/2, -25, 0])
                cylinder(d=8, h=4, $fn=30);

                translate([195/2 - 8/2, -25, 0])
                cylinder(d=8, h=4, $fn=30);

                translate([143.4/2, 97/2, 0])
                cylinder(d=12, h=4, $fn=30);

                translate([-143.4/2, 97/2, 0])
                cylinder(d=12, h=4, $fn=30);

                translate([143.4/2, -97/2, 0])
                cylinder(d=12, h=4, $fn=30);

                translate([-143.4/2, -97/2, 0])
                cylinder(d=12, h=4, $fn=30);
            }

            hull() {
                translate([143.4/2, 97/2, 0])
                chamfered_cylinder(
                    12, h, 1.5, $fn=30
                );

                translate([-143.4/2, 97/2, 0])
                chamfered_cylinder(
                    12, h, 1.5, $fn=30
                );

                translate([143.4/2, -97/2, 0])
                chamfered_cylinder(
                    12, h, 1.5, $fn=30
                );

                translate([-143.4/2, -97/2, 0])
                chamfered_cylinder(
                    12, h, 1.5, $fn=30
                );
            }

            hull() {
                translate([195/2 - 6.5, 8, 0])
                cylinder(d=13, h=h, $fn=30);

                translate([-195/2 + 6.5, 8, 0])
                cylinder(d=13, h=h, $fn=30);

                translate([195/2 - 6.5, -8, 0])
                cylinder(d=13, h=h, $fn=30);

                translate([-195/2 + 6.5, -8, 0])
                cylinder(d=13, h=h, $fn=30);
            }
        }

        rounded_cube_side(
            143.4 - 8, 97 - 8, 40,
            1, center=true, $fn=30
        );

        translate([0, 0, 22/2 + 2])
        difference() {
            rounded_cube_side(
                143.7, 97.3, 22, 5, center=true, $fn=30
            );

            rounded_cube_side(
                143.7 - 3.6, 97.3 - 3.6, 40,
                5.5, center=true, $fn=30
            );
        }

        hull() {
            translate([137.4/2 - 1.5, 91/2 - 1.5, 12.2])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );

            translate([-137.4/2 + 1.5, 91/2 - 1.5, 12.2])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );

            translate([137.4/2 - 1.5, -91/2 + 1.5, 12.2])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );

            translate([-137.4/2 + 1.5, -91/2 + 1.5, 12.2])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );
        }

        translate([177/2, 0, 0])
        cylinder(d=8.6, h=40, center=true, $fn=30);

        translate([-177/2, 0, 0])
        cylinder(d=8.6, h=40, center=true, $fn=30);

        translate([177/2, 0, 8])
        cylinder(d=16.5, h=40, $fn=30);

        translate([-177/2, 0, 8])
        cylinder(d=16.5, h=40, $fn=30);

        hull() {
            translate([-177/2, -9/2 - 7.4 - 20/2, 0])
            cylinder(d=19, h=50, center=true, $fn=30);

            translate([-200, -9/2 - 7.4 - 20/2, 0])
            cube([1, 19, 50], center=true);
        }

        hull() {
            translate([177/2, -9/2 - 7.4 - 20/2, 0])
            cylinder(d=19, h=50, center=true, $fn=30);

            translate([200, -9/2 - 7.4 - 20/2, 0])
            cube([1, 19, 50], center=true);
        }

        translate([-40, 57.8, 8])
        rotate([90, 0, 0])
        _screw_hole();

        translate([-40, -57.8, 8])
        rotate([-90, 0, 0])
        _screw_hole();

        translate([40, 57.8, 8])
        rotate([90, 0, 0])
        _screw_hole();

        translate([40, -57.8, 8])
        rotate([-90, 0, 0])
        _screw_hole();

        #translate([-81.1, 19, 8])
        rotate([0, 90, 0])
        _screw_hole();

        #translate([81.1, 19, 8])
        rotate([0, -90, 0])
        _screw_hole();
    }
}

module hopper_top() {
    module _fastener_slot() {
        w = fastener_dia;

        difference() {
            union() {
                difference() {
                    // main form
                    hull() {
                        rotate([0, 90, 0])
                        cylinder(d=w, h=7.4, $fn=30);

                        cube([7.4, w/2, w/2]);

                        translate([7.4/2, 1, -5 + 2/2])
                        cube([7.4, w + 2, 2], center=true);

                        translate([
                            7.4/2, w/2 - 1,
                            -7.4 + 0.1/2
                        ])
                        cube([7.4, 8, 0.1], center=true);
                    }

                    // hole
                    hull() {
                        translate([2.4, 1, -1])
                        rotate([0, 90, 0])
                        cylinder(d=w - 1.5, h=7.4, $fn=30);

                        translate([
                            (7.4 - 1.5)/2 + 2.4,
                            1 + 2, -3/2 - 13
                        ])
                        cube([
                            7.4 - 1.5, w + 2, 1
                        ], center=true);
                    }
                }
                // stopper
                translate([1.5, -w/2 + 2.4/2, -2.8])
                rotate([0, 90, 0])
                cylinder(d=2.2, h=7.4 - 1.5, $fn=30);
            }

            // chamfer
            translate([2.4, -4, -6.5])
            union() {
                rotate([0, 45, 0])
                cube([4, 4, 8]);

                translate([0, 0, -4])
                cube([2, 4, 4]);
            }
        }
    }
    difference() {
        union() {
            hull() {
                translate([143.4/2, 97/2, 0])
                chamfered_cylinder(
                    11, 14, 1.5, $fn=30
                );

                translate([-143.4/2, 97/2, 0])
                chamfered_cylinder(
                    11, 14, 1.5, $fn=30
                );

                translate([143.4/2, -97/2, 0])
                chamfered_cylinder(
                    11, 14, 1.5, $fn=30
                );

                translate([-143.4/2, -97/2, 0])
                chamfered_cylinder(
                    11, 14, 1.5, $fn=30
                );
            }

            hull() {
                translate([-81, 24, 13])
                rotate([90, 0, 0])
                cylinder(d=10, h=10, center=true, $fn=30);

                translate([-75, 24, 14/2])
                cube([1, 10, 14], center=true);
            }

            hull() {
                translate([-81, -24, 13])
                rotate([90, 0, 0])
                cylinder(d=10, h=10, center=true, $fn=30);

                translate([-75, -24, 14/2])
                cube([1, 10, 14], center=true);
            }

            translate([154.4/2 + 7/2, -31, 7.4])
            rotate([0, 0, 90])
            _fastener_slot();

            mirror([0, 1, 0])
            translate([154.4/2 + 7/2, -31, 7.4])
            rotate([0, 0, 90])
            _fastener_slot();

        }

        // hopper groove
        difference() {
            intersection() {
                rounded_cube_side(
                    143.7, 97.3, 23, 3,
                    center=true, $fn=30
                );

                chamfered_cube(
                    144.7, 98.3, 23, 1.5,
                    center=true
                );
            }

            rounded_cube_side(
                143.7 - 3.6, 97.3 - 3.6, 40,
                4, center=true, $fn=30
            );

            translate([0, 0, 20/2 + 10])
            chamfered_cube(
                143.7 - 1.5, 97.3 - 1.5, 20, 1.5, center=true
            );
        }

        cube([143.4 - 8, 97 - 8, 40], center=true);

        translate([-40, 57.8, 6])
        rotate([90, 0, 0])
        _screw_hole();

        translate([-40, -57.8, 6])
        rotate([-90, 0, 0])
        _screw_hole();

        translate([40, 57.8, 6])
        rotate([90, 0, 0])
        _screw_hole();

        translate([40, -57.8, 6])
        rotate([-90, 0, 0])
        _screw_hole();

        translate([-81.1, 0, 6])
        rotate([0, 90, 0])
        _screw_hole();

        translate([81.1, -19, 6])
        rotate([0, -90, 0])
        _screw_hole();

        translate([81.1, 19, 6])
        rotate([0, -90, 0])
        _screw_hole();

        hull() {
            translate([137.4/2 - 1.5, 91/2 - 1.5, 12])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );

            translate([-137.4/2 + 1.5, 91/2 - 1.5, 12])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );

            translate([137.4/2 - 1.5, -91/2 + 1.5, 12])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );

            translate([-137.4/2 + 1.5, -91/2 + 1.5, 12])
            chamfered_cylinder(
                5, 10, 2, $fn=40
            );
        }

        translate([-81, 0, 13])
        rotate([90, 0, 0])
        cylinder(d=4.2, h=100, center=true, $fn=30);

        translate([-81, 13.5, 19.6])
        rotate([0, 48, 0])
        cube([20, 11, 20], center=true);

        translate([-81, -13.5, 19.6])
        rotate([0, 48, 0])
        cube([20, 11, 20], center=true);

    }
}

module hopper_lid() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 5.4/2])
                rounded_cube_side(
                    143 - 2.8, 97 - 2.8, 5.4,
                    1, center=true, $fn=30
                );

                translate([0, 0, 4/2 + 1.4])
                rounded_cube_side(
                    143, 97, 4, 4, center=true, $fn=30
                );
            }

            hull() {
                translate([55, 0, 5.4/2])
                rounded_cube_side(
                    40 - 2.8, 70 - 2.8, 5.4,
                    1, center=true, $fn=30
                );

                translate([55, 0, 4/2 + 1.4])
                rounded_cube_side(
                    40, 70, 4, 4, center=true, $fn=30
                );
            }


            translate([-81, 0, 6.4])
            rotate([90, 0, 0])
            chamfered_cylinder(
                10, 37.6, 1, center=true, $fn=40
            );

            hull() {
                translate([-81, 0, 6.4])
                rotate([90, 0, 0])
                cylinder(
                    d=10, h=35.6, center=true, $fn=40
                );

                translate([-77, 0, 1.2/2])
                cube([10, 35.6, 1.2], center=true);
            }

            translate([-62, 0, 5.2/2])
            cube([40, 35.6, 5.2], center=true);

            hull() {
                translate([137.4/2 - 1.5, 91/2 - 1.5, 0])
                chamfered_cylinder(
                    4.9, 7.4, 2, $fn=40
                );

                translate([-137.4/2 + 1.5, 91/2 - 1.5, 0])
                chamfered_cylinder(
                    4.9, 7.4, 2, $fn=40
                );

                translate([137.4/2 - 1.5, -91/2 + 1.5, 0])
                chamfered_cylinder(
                    4.9, 7.4, 2, $fn=40
                );

                translate([-137.4/2 + 1.5, -91/2 + 1.5, 0])
                chamfered_cylinder(
                    4.9, 7.4, 2, $fn=40
                );
            }
        }

        difference() {
            translate([0, 0, 10/2 + 2])
            cube([133.4, 87, 10], center=true);

            for(i = [0:9]) {
                translate([i*19, 0, 0])
                rotate([0, 0, 45])
                cube([1.4, 200, 100], center=true);

                translate([-(i + 1)*19, 0, 0])
                rotate([0, 0, 45])
                cube([1.4, 200, 100], center=true);

                translate([i*19, 0, 0])
                rotate([0, 0, -45])
                cube([1.4, 200, 100], center=true);

                translate([-(i + 1)*19, 0, 0])
                rotate([0, 0, -45])
                cube([1.4, 200, 100], center=true);

            }
        }

        translate([-81, 0, 6.4])
        rotate([90, 0, 0])
        cylinder(d=4.2, h=40, center=true, $fn=40);

        translate([71.4, 0, -0.6])
        rotate([90, 0, 0])
        cylinder(d=3, h=58, center=true, $fn=30);

        translate([-97, 0, 0])
        rotate([0, 30, 0])
        cube([30, 17, 50], center=true);

        translate([-87, 0, 10/2 + 5.2])
        cube([30, 17, 10], center=true);
    }
}

module fastener() {
    difference() {
        union() {
            cylinder(
                d=fastener_dia - 2,
                h=fastener_l, $fn=30
            );

            translate([0, 0, 10/2])
            cube([
                fastener_wall, fastener_dia/2 + 2,
                fastener_l - 10
            ]);

            hull() {
                translate([0, fastener_dia/2 + 4.8, 0])
                cube([fastener_wall, 3, fastener_l]);

                translate([0, fastener_dia/2 + 1.6, 10/2])
                cube([fastener_wall, 1, fastener_l - 10]);
            }


            difference() {
                translate([-3.5, 12.5, 0])
                cylinder(d=11, h=fastener_l, $fn=40);

                translate([
                    -10, (fastener_dia - 1)/2, -1
                ])
                cube([10, 9.4, fastener_l + 2]);

                translate([-10, (fastener_dia - 1)/2, 0])
                cube([7, 9,fastener_l + 1]);
            }

            translate([-8.3, 12.7, 0])
            cylinder(d=2.1, h=fastener_l, $fn=20);

            translate([-8.9, 4.5, fastener_l/2])
            difference() {
                rotate([-90, 0, 60])
                cylinder(d=20, h=6, $fn=50);

                translate([1.7, -1.1, -30/2])
                cube([4, 10.1, 30]);

                translate([1, -2.1, -30/2])
                cube([4, 10.1, 30]);

                translate([-7, 0.8, -30/2])
                rotate([0, 0, -30])
                cube([5, 10, 30]);

                translate([-13, -10, -30/2])
                cube([15, 15, 30]);
                
                translate([-6.5, 10, 20/2 - 5/2 - 0.5])
                rotate([0, 45, -30])
                cube([5, 5, 5]);

                translate([-6.5, 10, -20/2 + 5/2 + 0.5])
                rotate([0, 45, -30])
                cube([5, 5, 5]);
            }
        }

        translate([0, 0, -1])
        cylinder(d=0.5, h=fastener_l + 2, $fn=30);

        translate([-7, 4, fastener_l/2])
        rotate([-90, 0, 60])
        cylinder(d=20 - 2*fastener_wall, h=10, $fn=50);

        difference() {
            translate([-3.5, 12.5, -1])
            cylinder(
                d=11 - 2*fastener_wall,
                h=fastener_l + 2, $fn=40
            );

            translate([-8.3, 12.7, 0])
            cylinder(d=2.1, h=fastener_l, $fn=20);

        }
    }
}
