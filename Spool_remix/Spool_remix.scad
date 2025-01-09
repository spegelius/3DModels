use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "SPOOL refill 1kg/"
);


//_orig_SPOOLD();
//_orig_SPOOLG_v3();
//_plate();
//_plate_new();

//debug();

//new_spoold();
new_spoolg();


module _orig_SPOOLD() {
    import(
        str(spath, "SPOOLD.stl"),
        convexity=10
    );

    //%cylinder(d=80, h=20);
}

module _orig_SPOOLG_v3() {
    import(
        str(spath, "SPOOLG v3.stl"),
        convexity=10
    );

//    %translate([0, 0, 3])
//    cylinder(d=100, h=60);
}


module debug() {
    translate([220, 0, 0])
    intersection() {
        new_spoold1();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }

    intersection() {
        new_spoold();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }

    translate([220, 0, 0])
    intersection() {
        translate([0, 0, 66])
        rotate([0, 180, 900])
        new_spoolg1();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }

    intersection() {
        translate([0, 0, 65.1])
        rotate([0, 180, 130])
        new_spoolg();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }
}

module _chamfered_form() {
    union() {
        chamfered_cylinder(201, 3, 0.5, $fn=120);
        cylinder(d=100, h=100);
    }
}

module _hole_bases() {
    for (i = [0:2]) {
        rotate([0, 0, i*360/3])
        translate([96.2, 0, 0])
        chamfered_cylinder(8.2, 2.5, 0.5, $fn=20);

        rotate([0, 0, 17 + i*360/3])
        translate([96.2, 0, 0])
        chamfered_cylinder(8.2, 2.5, 0.5, $fn=20);
    }
}

module _holes() {
    for (i = [0:2]) {
        rotate([0, 0, i*360/3])
        translate([96.2, 0, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        rotate([0, 0, 17 + i*360/3])
        translate([96.2, 0, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);
    }
}

// not used due to OpenSCAD issues
module new_spoold1() {
    difference() {
        union() {
            intersection() {
                scale([1.03, 1.03, 1])
                _orig_SPOOLD();

                _chamfered_form();
            }

            _hole_bases();
            tube(64, 20, 5, $fn=80);
        }

        _holes();

        hull() {
            translate([0, 0, 10])
            cylinder(d=54, h=50, $fn=80);

            translate([0, 0, 18])
            cylinder(d=62, h=50, $fn=80);
        }

        translate([0, 0, -19.5])
        chamfered_cylinder(55, 20, 0.5, $fn=80);
    }
}

module _plate() {
    intersection() {
        difference() {
            union() {
                scale([1.03, 1.03, 1])
                _orig_SPOOLD();

                _hole_bases();
                tube(90, 1, 17.5, $fn=80);
            }
            _holes();

            difference() {
                translate([0, -50, 20/2 + 1])
                cube([55, 45, 20], center=true);

                rotate([0, 0, 180])
                scale([1.03, 1.03, 1])
                _orig_SPOOLD();

            }
        }
        chamfered_cylinder(201, 2.5, 0.6, $fn=120);
    }
}

module _plate_new() {
    module _plate_main() {
        difference() {
            chamfered_cylinder(201, 2.5, 0.6, $fn=120);

            cylinder(d=55.2, h=10, center=true, $fn=60);

            intersection() {
                cylinder(d=190, h=10, center=true, $fn=120);

                for(j = [0:40]) {
                    translate([0, -200 + j*10, 0])
                    rotate([0, 0, -60])
                    for (i = [0:49]) {
                        translate([0, i*10, 0])
                        cylinder(
                            d=9, h=60,
                            center=true, $fn=6
                        );

                        translate([0, -10 - i*10, 0])
                        cylinder(
                            d=9, h=60,
                            center=true, $fn=6
                        );

                    }
                }
            }
        }
    }

    difference() {
        union() {
            _plate_main();
            _hole_bases();
            tube(90, 1, 17.5, $fn=80);
            tube(70, 2.5, 7.5, $fn=80);

            translate([0, -53, 1/2])
            cube([54, 40, 1], center=true);
        }
        _holes();
    }
}

module new_spoold() {
    difference() {
        union() {
            _plate_new();

            v_screw(
                h=23,
                screw_d=69,
                pitch=6,
                direction=0,
                steps=90,
                depth=1,
                chamfer=true
            );
        }

        cylinder(d=55.2, h=200, center=true, $fn=80);

        translate([0, 0, -19.2])
        chamfered_cylinder(56.8, 20, 0.8, $fn=80);
    }
}

// not used due to OpenSCAD issues
module new_spoolg1() {
    %translate([0, 0, 3])
    cylinder(d=90, h=60);

    module _lifted_spoolg() {
        union() {
            intersection() {
                _orig_SPOOLG_v3();
                cylinder(d=300, h=20);
            }

            translate([0, 0, 9])
            intersection() {
                _orig_SPOOLG_v3();

                translate([0, 0, 5])
                cylinder(d=300, h=60);
            }
        }
    }

    difference() {
        union() {
            scale([1.03, 1.03, 1])
            _lifted_spoolg();

            tube(64, 20, 5, $fn=80);
            _hole_bases();

            translate([0, 0, 40])
            tube(76, 5.8, 7, $fn=80);
        }
        _holes();

        hull() {
            translate([0, 0, 10])
            cylinder(d=54, h=50, $fn=80);

            translate([0, 0, 18])
            cylinder(d=62, h=50, $fn=80);
        }

        translate([0, 0, -19.5])
        chamfered_cylinder(55, 20, 0.5, $fn=80);
    }
}

module new_spoolg() {
    difference() {
        union() {
            _plate_new();
            cylinder(d=59, h=62.5, $fn=80);

            hull() {
                translate([0, 0, 37])
                cylinder(d=59, h=25.5, $fn=80);

                translate([0, 0, 46])
                cylinder(d=75, h=16.5, $fn=80);

            }

            tube(90, 62.5, 1.2, $fn=80);

            for (i = [0:4]) {
                rotate([0, 0, i*360/5])
                translate([90/2 - 8, 0, 62.5/2])
                cube([15, 1.2, 62.5], center=true);
            }
        }

        translate([0, 0, 64])
        rotate([0, 180, 60])
        v_screw(
            h=21.2,
            screw_d=70.2,
            pitch=6,
            direction=0,
            steps=90,
            depth=1,
            chamfer=true
        );

        translate([0, 0, 63 - 5])
        chamfered_cylinder(71, 20, 7, $fn=80);

        cylinder(d=55.2, h=200, center=true, $fn=80);

        translate([0, 0, -19.2])
        chamfered_cylinder(56.8, 20, 0.8, $fn=80);
    }
}