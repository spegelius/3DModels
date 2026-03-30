use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";

spath = str(
    stl_base_path,
    "Cassette Carousel/"
);


//_orig_bottom();
//_orig_cassette();
//_orig_pin();
//_orig_top();
//_orig_turndisk_stackable();
//_orig_turndisk();

//_dovetail();
//%_dovetail_hole();

//debug_cassette_carousel();


//new_bottom();
new_top();
//new_cassette();
//new_turndisk();
//new_turndisk_stackable();
//new_pin();

//test_cassette();


module _orig_bottom() {
    translate([-125, -105, 0])
    import(
        str(
            spath,
            "bottom.stl"
        ),
        convexity=10
    );

    //%cylinder(d=136, h=1);
}

module _orig_cassette() {
    translate([-125, -105, 0])
    import(
        str(
            spath,
            "cassette.stl"
        ),
        convexity=10
    );
}

module _orig_pin() {
    translate([-125, -105, 0])
    import(
        str(
            spath,
            "pin.stl"
        ),
        convexity=10
    );
}

module _orig_top() {
    translate([-125, -105, 0])
    import(
        str(
            spath,
            "top.stl"
        ),
        convexity=10
    );
}

module _orig_turndisk_stackable() {
    translate([-125, -105, 0])
    import(
        str(
            spath,
            "turndisk stackable.stl"
        ),
        convexity=10
    );
}

module _orig_turndisk() {
    translate([-125, -105, 0])
    import(
        str(
            spath,
            "turndisk.stl"
        ),
        convexity=10
    );
}

module debug_cassette_carousel() {

    intersection() {
        new_bottom();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    translate([0, 0, 10])
    rotate([180, 0, 0])
    new_pin();

//    intersection() {
//        translate([0, 0, -11.1])
//        new_turndisk();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 200], center=true);
//    }

    intersection() {
        translate([0, 0, -26.1])
        new_turndisk_stackable();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }


    for(i = [0:3]) {
        rotate([0, 0, i*90])
        intersection() {
            translate([31, -26.4, 67])
            rotate([90, 0, 0])
            new_cassette();

            translate([0, 200/2 - 80, 0])
            cube([200, 200, 400], center=true);
        }
    }

    translate([0, 0, 124])
    new_top();
}


module new_bottom() {
    difference() {
        union() {
            _orig_bottom();

            for(i = [0:3]) {
                rotate([0, 0, i*90]) {
                    translate([-23, -55, 8])
                    cube([8, 60, 4], center=true);

                    translate([31, -55, 8])
                    cube([8, 60, 4], center=true);

                    translate([69, -55, 8])
                    cube([8, 60, 4], center=true);
                }
            }
        }

        for(i = [0:3]) {
            rotate([0, 0, i*90]) {
                translate([0, -90, 16.4])
                rotate([45, 0, 0])
                cube([200, 20, 20], center=true);

                translate([-23, -89.3, 10])
                rotate([-90, 0, 0])
                _dovetail_hole();

                translate([31, -89.3, 10])
                rotate([-90, 0, 0])
                _dovetail_hole();

                translate([69, -89.3, 10])
                rotate([-90, 0, 0])
                _dovetail_hole();
            }
        }
    }
}

d_h = 62;

module _dovetail() {
    difference() {
        union() {
            hull() {
                translate([0, 1/2, d_h/2])
                cube([3, 1, d_h], center=true);

                translate([-2 + 0.15, 2.5 - 1/2 - 0.15, 0])
                cylinder(d=1, h=d_h, $fn=25);

                translate([2 - 0.15, 2.5 - 1/2 - 0.15, 0])
                cylinder(d=1, h=d_h, $fn=25);
            }

            translate([0, 0, d_h/2])
            cube([2.8, 1, d_h], center=true);
        }

        translate([0, 20/2 + 1.4, d_h/2 - 2])
        chamfered_cube(20, 20, d_h - 23, 3, center=true);
    }
}

module _dovetail_hole() {
    hull() {
        translate([0, 1/2, d_h/2 + 1])
        cube([3.4, 1, d_h], center=true);

        translate([0, 2.6, d_h/2 + 1])
        cube([5.72, 0.2, d_h], center=true);
    }
}

module _hex_pattern() {
    step = 12.5;
    hc = 11.5;

    rotate([0, 0, 30])
    for(j = [0:20]) {
        translate([0, j*step, 0])
        rotate([0, 0, -60])
        for (i = [0:49]) {
            translate([0, i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );

            translate([0, -i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );
        }

        translate([0, -j*step, 0])
        rotate([0, 0, -60])
        for (i = [0:49]) {
            translate([0, i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );

            translate([0, -i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );
        }
    }
}

module new_cassette() {
    difference() {
        union() {
            _orig_cassette();

            // dovetails
            translate([0, 57, 0])
            _dovetail();

            translate([-54, 57, 0])
            _dovetail();

            translate([38, 57, 0])
            _dovetail();

            translate([0, -57, 0])
            rotate([0, 0, 180])
            _dovetail();

            translate([-54, -57, 0])
            rotate([0, 0, 180])
            _dovetail();

            translate([38, -57, 0])
            rotate([0, 0, 180])
            _dovetail();

            // bottom edges
            difference() {
                intersection() {
                    intersection() {
                        union() {
                            translate([0, -60, 58])
                            cube([114.8, 9, 8], center=true);

                            translate([53.4, -60, 62/2])
                            cube([8, 9, 62], center=true);
                        }

                        hull() {
                            translate([49.4, -59, 0])
                            cylinder(d=16, h=62, $fn=80);

                            translate([49.4, -50, 0])
                            cylinder(d=16, h=62, $fn=80);

                            translate([-60, -59, 0])
                            cylinder(d=16, h=62, $fn=80);

                            translate([-60, -50, 0])
                            cylinder(d=16, h=62, $fn=80);
                        }
                    }

                    hull() {
                        translate([0, -59, 54])
                        rotate([0, 90, 0])
                        cylinder(d=16, h=114.8, center=true, $fn=80);

                        translate([0, -50, 54])
                        rotate([0, 90, 0])
                        cylinder(d=16, h=114.8, center=true, $fn=80);

                        translate([0, -59, -54])
                        rotate([0, 90, 0])
                        cylinder(d=16, h=114.8, center=true, $fn=80);

                        translate([0, -50, -54])
                        rotate([0, 90, 0])
                        cylinder(d=16, h=114.8, center=true, $fn=80);
                    }
                }

                translate([-6, 0, -6])
                hull() {
                    translate([0, -57 - 1/2, 0])
                    cube([114.8, 1, 124], center=true);

                    translate([0, -57 - 1/2 - 8, 0])
                    cube([114.8 + 16, 1, 124 + 16], center=true);

                }
           }

            // top edges
            difference() {
                intersection() {
                    intersection() {
                        union() {
                            translate([0, 59, 59.5])
                            cube([114.8, 6, 5], center=true);

                            translate([54.9, 59, 62/2])
                            cube([5, 6, 62], center=true);
                        }

                        hull() {
                            translate([54.4, 59, 0])
                            cylinder(d=6, h=140, center=true, $fn=80);

                            translate([54.4, 50, 0])
                            cylinder(d=6, h=140, center=true, $fn=80);

                            translate([-60, 59, 0])
                            cylinder(d=6, h=140, center=true, $fn=80);

                            translate([-60, 50, 0])
                            cylinder(d=6, h=140, center=true, $fn=80);
                        }
                    }

                    hull() {
                        translate([0, 59, 59])
                        rotate([0, 90, 0])
                        cylinder(d=6, h=140, center=true, $fn=80);

                        translate([0, 50, 59])
                        rotate([0, 90, 0])
                        cylinder(d=6, h=140, center=true, $fn=80);

                        translate([0, 59, -59])
                        rotate([0, 90, 0])
                        cylinder(d=6, h=140, center=true, $fn=80);

                        translate([0, 50, -59])
                        rotate([0, 90, 0])
                        cylinder(d=6, h=140, center=true, $fn=80);
                    }
                }

                translate([-5, 0, -5])
                hull() {
                    translate([0, 57 + 1/2, 0])
                    cube([114.8, 1, 124], center=true);

                    translate([0, 57 + 1/2 + 8, 0])
                    cube([114.8 + 16, 1, 124 + 16], center=true);

                }
            }
        }

        // side cuts
        hull() {
            translate([0, -30, 62/2])
            cube([200, 0.1, 50], center=true);

            translate([0, -30, 62/2])
            cube([200, 10, 39], center=true);
        }

        hull() {
            translate([0, -0, 62/2])
            cube([200, 0.1, 50], center=true);

            translate([0, -0, 62/2])
            cube([200, 10, 39], center=true);
        }

        hull() {
            translate([0, 30, 62/2])
            cube([200, 0.1, 50], center=true);

            translate([0, 30, 62/2])
            cube([200, 10, 39], center=true);
        }

        // bottom pattern
        intersection() {
            union() {

                translate([0, 0, 0])
                chamfered_cube(35, 107, 20, 2, center=true);

                translate([-37.5, 0, 0])
                chamfered_cube(35, 107, 20, 2, center=true);

                translate([37.5, 0, 0])
                chamfered_cube(35, 107, 20, 2, center=true);
             }
             _hex_pattern();
        }

    }
}

module new_top() {
    difference() {
        union() {
            _orig_top();

            for(i = [0:3]) {
                rotate([0, 0, i*90]) {
                    translate([-23, -55, 4/2])
                    cube([8, 60, 4], center=true);

                    translate([31, -55, 4/2])
                    cube([8, 60, 4], center=true);

                    translate([69, -55, 4/2])
                    cube([8, 60, 4], center=true);
                }
            }
        }

        for(i = [0:3]) {
            rotate([0, 0, i*90]) {
                translate([0, -90, -7.4])
                rotate([45, 0, 0])
                cube([200, 20, 20], center=true);

                translate([-23, -25.3, 0])
                rotate([90, 0, 0])
                _dovetail_hole();

                translate([31, -25.3, 0])
                rotate([90, 0, 0])
                _dovetail_hole();

                translate([69, -25.3, 0])
                rotate([90, 0, 0])
                _dovetail_hole();
            }
        }
    }
}

module new_turndisk() {
    difference() {
        union() {
            _orig_turndisk();
            cylinder(d=32, h=11);
        }

        translate([0, 0, -1])
        v_screw(
            h=13,
            screw_d=26,
            pitch=2,
            direction=0,
            steps=70,
            depth=0.7,
            chamfer=true
        );

        translate([0, 0, 5.2])
        chamfered_cylinder(31, 20, 6, $fn=50);
    }
}

module new_turndisk_stackable() {
    difference() {
        union() {
            _orig_turndisk_stackable();

            difference() {
                translate([0, 0, 11])
                cylinder(d=32, h=15);
                
                chamfered_cube(200, 20.6, 29.32, 2, center=true);
            }
        }

        translate([0, 0, 14])
        v_screw(
            h=13,
            screw_d=26,
            pitch=2,
            direction=0,
            steps=70,
            depth=0.7,
            chamfer=true
        );

        translate([0, 0, 20.2])
        chamfered_cylinder(31, 20, 6, $fn=50);

        translate([0, 0, 0])
        chamfered_cylinder(31.2, 38.5, 6, center=true, $fn=50);

    }
}

module new_pin() {
    difference() {
        _orig_pin();

        difference() {
            translate([0, 0, 20/2 + 10])
            cube([40, 40, 20], center=true);

            chamfered_cylinder(31, 16, 6, $fn=80);

            v_screw(
                h=20.6,
                screw_d=25.5,
                pitch=2,
                direction=0,
                steps=70,
                depth=0.7,
                chamfer=true
            );
        }

        translate([0, 0, -1])
        hexagon(4.32, 100);
    }
}

module test_cassette() {
    intersection() {
        translate([-28, 60, -55])
        new_cassette();

        cube([62, 10, 15], center=true);
        
    }
}