use <../../../../Dollo/NEW_long_ties/include.scad>;

use <../mockup.scad>;


stl_base_path = "../../../../_downloaded/Qidi/";
spath = str(
    stl_base_path, "Qidi_Box/Spool_Drive_Upgrade/"
);


//_orig_drive_drum();
//_orig_gear();
//_orig_roller_shaft();
//_orig_support_drum();

//mock_bearing();

//debug();

spool_drive_axle();
//spool_drive_gear();
//spool_drive_drum();
//spool_drive_drum_2();
//spool_dive_spacer_1();
//spool_dive_spacer_2();


module _orig_drive_drum() {
    translate([23.5, 190.64, -349.158])
    rotate([0, -90, 0])
    import(
        str(spath, "drive-drum.stl"),
        convexity=10
    );

    //%cylinder(d=25.2, h=1);
}

module _orig_gear() {
    translate([23.5, 190.64, -337.175])
    rotate([0, -90, 0])
    import(
        str(spath, "gear.stl"),
        convexity=10
    );

    //%cylinder(d=28.2, h=1);
}

module _orig_roller_shaft() {
    translate([23.45, 190.66, -332.02])
    rotate([0, -90, 0])
    import(
        str(spath, "roller-shaft.stl"),
        convexity=10
    );

//    %rotate([0, 0, 30])
//    cylinder(d=9.28, h=40, $fn=6);
}

module _orig_support_drum() {
    translate([23.45, 190.66, -304.01])
    rotate([0, -90, 0])
    import(
        str(spath, "support-drum.stl"),
        convexity=10
    );

//    %rotate([0, 0, 30])
//    cylinder(d=20, h=40);
}

module orig_assembly() {
    intersection() {
        _orig_support_drum();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 28])
    intersection() {
        _orig_roller_shaft();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 32.9])
    intersection() {
        _orig_gear();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 32.9])
    intersection() {
        mock_bearing();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 44.9])
    intersection() {
        _orig_drive_drum();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }
}

module mock_bearing() {
    module _bearing_body() {
        difference() {
            cylinder(d=15, h=10.5);
            _orig_gear();
        }
    }

    intersection() {
        union() {
            _bearing_body();

            intersection() {
                translate([0, 0, 3])
                _bearing_body();

                cylinder(d=15, h=12);
            }
        }

        difference() {
            translate([0, 0, -5])
            rounded_cylinder(14.3, 17, 2, $fn=80);

            cylinder(d=8, h=50, center=true, $fn=40);
        }
    }
}

module debug() {

    orig_assembly();

    translate([30, 0, 82/2 - 4])
    rotate([0, 90, 0])
    mockup_qidi_box_front_roller();

    translate([-30, 0, 0])
    debug_new();
}

module debug_new() {
    translate([0, 0, 0])
    intersection() {
        spool_drive_axle();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }

    translate([0, 0, 46.5])
    intersection() {
        rotate([180, 0, 0])
        spool_drive_gear();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 46.5])
    intersection() {
        rotate([180, 0, 0])
        mock_bearing();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 46.6])
    spool_dive_spacer_2();

    translate([0, 0, 0.5])
    spool_drive_drum();

    translate([0, 0, 28.6])
    spool_dive_spacer_1();

    translate([0, 0, 72.5])
    rotate([180, 0, 0])
    spool_drive_drum_2();
}

module spool_drive_axle() {
    difference() {
        chamfered_cylinder(8.1, 73, 0.8, $fn=50);
        cylinder(d=3.1, h=300, center=true, $fn=50);

        translate([0, 0, 2])
        chamfered_cylinder(3.5, 25, 1, $fn=50);

        translate([0, 0, 72 - 27])
        chamfered_cylinder(3.5, 25, 1, $fn=50);

        translate([0, 0, 72/2 - 15/2])
        chamfered_cylinder(3.5, 15, 1, $fn=50);

        difference() {
            for(i = [0:5]) {
                rotate([0, 0, 360/6*i])
                translate([8/2 + 0.7, 0, 0])
                cylinder(d=2, h=300, center=true, $fn=20);
            }

            translate([0, 0, 28.6])
            cylinder(d=20, h=73 - 54.2);
        }
    }
}

module spool_drive_gear() {
    module _bearing_hole() {
        difference() {
            cylinder(d=15, h=10.5);

            translate([0, 0, -0.01])
            _orig_gear();
        }
    }

    intersection() {
        union() {
            difference() {
                _orig_gear();

                scale([1.01, 1.01, 1.001])
                _bearing_hole();
            }

            intersection() {
                chamfered_cylinder(40.3, 50, 10, $fn=100);
                tube(25.4, 10, 5, $fn=100);
            }
        }

        chamfered_cylinder(40.3, 50, 10, $fn=100);
    }

    //!_bearing_hole();
}

module spool_drive_drum(h=28) {

//    %_orig_drive_drum();
//    %_orig_support_drum();

    difference() {
        union() {
            //cylinder(d=19, h=1.6, $fn=50);
            cylinder(d=17, h=h, $fn=50);
        }

        difference() {
            cylinder(d=8, h=200, center=true, $fn=50);

            for(i = [0:5]) {
                rotate([0, 0, 360/6*i])
                translate([8/2 + 0.7, 0, 0])
                cylinder(
                    d=1.9, h=300, center=true, $fn=20
                );
            }
        }
    }
}

module spool_drive_drum_2() {
    spool_drive_drum(h=25);
}

module spool_dive_spacer_1() {
    tube(11.6, 5.8, 1.6, $fn=40);
}

module spool_dive_spacer_2() {
    tube(11.6, 0.8, 1.6, $fn=40);
}
