use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "SPOOL refill 1kg/"
);

// PrusaMent spool dimensions
// od = 200mm
// center d = ~51mm
// attachment d bottom = ~93.5mm
// attachment d top = ~92.3mm
// attachment nubs = 2.4mm
// roll d = 99.3mm
// roll id = 93.7mm
// roll h = 59.8;

// Tape roll dimensions
// - 82mm OD
// - ~76.4mm ID
// - 49.3mm tall

// Anycubic roll dimensions
// - 89mm OD
// - 82mm ID
// - 59mm tall

//_orig_SPOOLD();
//_orig_SPOOLG_v3();
//_plate();
//_plate_new();

//debug();
//debug_tape_roll_center();
//debug_prusa_roll_center();

//new_spoold();
//new_spoolg();

//spool_tape_roll_center();
//spool_prusa_roll_center();
spool_anycubic_roll_center();


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
//    translate([220, 0, 0])
//    intersection() {
//        new_spoold1();
//
//        translate([0, 300/2])
//        cube([300, 300, 200], center=true);
//    }

//    translate([220, 0, 0])
//    intersection() {
//        translate([0, 0, 66])
//        rotate([0, 180, 900])
//        new_spoolg1();
//
//        translate([0, 300/2])
//        cube([300, 300, 200], center=true);
//    }

    intersection() {
        new_spoold();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }

    intersection() {
        translate([0, 0, 66.1])
        rotate([0, 180, 180])
        new_spoolg();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }
}

module debug_tape_roll_center() {
    intersection() {
        spool_tape_roll_center();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }

    %translate([0, 0, 7.6])
    tube(82, 49.3, (82 - 76.4)/2, $fn=60);
}

module debug_prusa_roll_center() {
    intersection() {
        spool_prusa_roll_center();

        translate([0, 300/2])
        cube([300, 300, 200], center=true);
    }

    %translate([0, 0, 3])
    tube(99.3, 59.8, (99.3 - 93.7)/2, $fn=60);
}

module _chamfered_form() {
    union() {
        chamfered_cylinder(201, 3, 0.5, $fn=120);
        cylinder(d=100, h=100);
    }
}

module _hole_bases() {
    for (i = [0:2]) {
        rotate([0, 0, i*360/3 - 0.6])
        translate([96.2, 0, 0])
        scale([1, 1.4, 1])
        chamfered_cylinder(8.4, 3, 0.5, $fn=20);

        rotate([0, 0, 18.6 + i*360/3])
        translate([96.2, 0, 0])
        scale([1, 1.4, 1])
        chamfered_cylinder(8.4, 3, 0.5, $fn=20);
    }
}

module _holes() {
    for (i = [0:2]) {
        rotate([40, 0, i*360/3])
        translate([96.2, 0, 0])
        cylinder(d=3.8, h=20, center=true, $fn=20);

        rotate([-40, 0, 18 + i*360/3])
        translate([96.2, 0, 0])
        cylinder(d=3.8, h=20, center=true, $fn=20);
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

module _plate_new(fd=90) {
    module _plate_main() {
        difference() {
            chamfered_cylinder(201, 3, 0.6, $fn=120);

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

            //translate([0, 0, 2.5])
            //chamfered_cylinder(
            //    196, 5, 0.5, $fn=120
            //);
        }
    }

    difference() {
        union() {
            _plate_main();
            _hole_bases();
            tube(fd, 1, 17.5, $fn=80);
            tube(70, 3, 7.5, $fn=80);

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
    h = 63;

    difference() {
        union() {
            _plate_new();
            cylinder(d=59, h=h, $fn=80);

            hull() {
                translate([0, 0, 37])
                cylinder(d=59, h=25.5, $fn=80);

                translate([0, 0, 46])
                cylinder(d=75, h=h - 46, $fn=80);
            }

            tube(90, h, 1.2, $fn=80);

            for (i = [0:4]) {
                rotate([0, 0, i*360/5])
                translate([90/2 - 8, 0, h/2])
                cube([15, 1.2, h], center=true);
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

        translate([0, 0, h - 5.5])
        chamfered_cylinder(71, 20, 7, $fn=80);

        cylinder(d=55.2, h=200, center=true, $fn=80);

        translate([0, 0, -19.2])
        chamfered_cylinder(56.8, 20, 0.8, $fn=80);
    }
}

module _spool_cardboard_roll_center(od, id, h, bh) {
    _id = id - 0.4;

    difference() {
        union() {
            _plate_new(fd=od);

            // bottom raiser
            cylinder(d=od, h=bh, $fn=80);

            // center tube
            cylinder(
                d=55.2 + 2.4,
                h=bh + h/2, $fn=80
            );

            // attachment
            chamfered_cylinder(
                _id, bh + 15, 1, $fn=80
            );

            // ridges
            for(i = [0:27]) {
                rotate([0, 0, 360/28 * i])
                translate([_id/2 - 0.3, 0, 0])
                hull() {
                    cylinder(
                        d=2.5, h=bh + 9.4, $fn=20
                    );

                    cylinder(
                        d=0.5, h=bh + 12.4, $fn=20
                    );
                };
            }
        }

        // attachment inner cut
        difference() {
            translate([0, 0, 2.6])
            cylinder(d=_id - 4.4, h=50, $fn=80);

            cylinder(
                d=55.2 + 2.4,
                h=bh + h/2, $fn=80
            );

            cube([1, 100, 100], center=true);
            cube([100, 1, 100], center=true);
        }

        // center cut
        cylinder(d=55.2, h=200, center=true, $fn=80);

        // bottom chamfer
        translate([0, 0, -19.2])
        chamfered_cylinder(56.8, 20, 0.8, $fn=80);
    }
}

module spool_tape_roll_center() {
    _spool_cardboard_roll_center(82, 76.4, 49.4, 7.6);
}

module spool_prusa_roll_center() {
    _spool_cardboard_roll_center(99.3, 93.7, 59.8, 3);
}

module spool_anycubic_roll_center() {
    _spool_cardboard_roll_center(89, 82, 59, 3);
}