use <../Dollo/NEW_long_ties/include.scad>;

use <Antec.scad>;
use <hdrack.scad>;
use <Lepy7.scad>;
include <common.scad>;


w1 = hd_width + 2*6.4 + 0.6;

//debug();
//debug2();

//lepy7_hdrack_antec();
//lepy7_hdrack_antec_drill_jig();

lepy7_hdrack_antec2();
//lepy7_hdrack_antec2_drill_jig();


module debug() {
    mock_case_front();

    translate([0, 7, 65])
    rotate([90, 0, 180])
    lepy7_hdrack_antec();
}

module debug2() {
    mock_case_front2();

//    translate([90, 75, 55])
//    rotate([90, 0, -90])
//    lepy7_hdrack_antec2();

    translate([0, 10, 55])
    rotate([90, 0, 180])
    lepy7_hdrack_antec2();

    translate([0, -3/2, 55])
    rotate([90, 0, 0])
    color("grey")
    lepy7_hdrack_antec2_drill_jig();
}

module _support() {
    union() {
        translate([0, 0, 6.8/2])
        cube([w1 - 1, 1, 6.8], center=true);

        translate([0, 0, 0.2/2])
        cube([w1 - 1, 5, 0.2], center=true);
    }
}

module lepy7_hdrack_antec(supports=true) {
    h1 = 30 * 8 + 0.2;

    module _mount_part() {
        difference() {
            union() {
                translate([0, 0, 9.2/2])
                chamfered_cube_side(
                    w1 + 7.6, h1 + 7.6, 9.2, 2,
                    center=true
                );

                translate([0, 0, 3/2])
                chamfered_cube_side(
                    141, h1 + 7.6, 3, 3,
                    center=true
                );
            }

            cube([w1, h1, 19], center=true);
        }
    }

    difference() {
        union() {
            translate([0, 0, 7])
            rack_antec(8);

            _mount_part();

            _screw_positions()
            cylinder(d=10, h=20, $fn=30);

        }

        _screw_positions()
        cylinder(d=2.5, h=60, center=true, $fn=30);

        translate([0, 0, 7])
        _side_cuts(8);

        translate([0, 0, 7])
        _end_cuts(w1);
    }
    
    if (supports) {
        for(i = [0:6]) {
            translate([0, -90.2 + i*30, 0])
            _support();
        }
    }
}

module lepy7_hdrack_antec_drill_jig() {
    union() {
        difference() {
            translate([0, 0, 3/2])
            cube([138, 250, 3], center=true);

            _screw_positions()
            cylinder(d=3, h=20, center=true, $fn=30);

            translate([0, 240/2 - 77/2, 0])
            cube([120, 77, 20], center=true);

            translate([0, -240/2 + 77/2, 0])
            cube([120, 77, 20], center=true);

            cube([120, 77, 20], center=true);

            // marker
            translate([0, 240/2 - 15, 0])
            cube([121, 1, 20], center=true);
        }
    }
}

module lepy7_hdrack_antec2(supports=true) {
    h1 = 30 * 10 + 0.2;

    module _mount_part() {
        difference() {
            union() {
                translate([0, 0, 9.2/2])
                chamfered_cube_side(
                    w1 + 7.6, h1 + 7.6, 9.2, 2,
                    center=true
                );

                translate([0, 0, 3/2])
                chamfered_cube_side(
                    161, h1 + 7.6, 3, 3,
                    center=true
                );
            }

            cube([w1, h1, 19], center=true);
        }
    }

    difference() {
        union() {
            translate([0, 0, 7])
            rack_antec(10);

            _mount_part();

            _screw_positions2()
            hull() {
                cylinder(d=10, h=20, $fn=30);

                translate([-19, 0, 20/2])
                cube([1, 10, 20], center=true);
            }

        }
        _screw_positions2()
        cylinder(d=2.5, h=60, center=true, $fn=30);

        translate([0, 0, 7])
        _side_cuts(10);

        translate([0, 0, 7])
        _end_cuts(w1);
    }

    if (supports) {
        for(i = [0:8]) {
            translate([0, -120.2 + i*30, 0])
            _support();
        }
    }
}

module lepy7_hdrack_antec2_drill_jig() {
    union() {
        difference() {
            translate([0, 0, 3/2])
            cube([168, 303, 3], center=true);

            _screw_positions2()
            cylinder(d=3, h=20, center=true, $fn=30);

            translate([0, 293/2 - 94/2, 0])
            cube([141, 94, 20], center=true);

            translate([0, -293/2 + 94/2, 0])
            cube([141, 94, 20], center=true);

            cube([141, 94, 20], center=true);

            // marker
            translate([0, 293/2 - 15, 0])
            cube([121, 1, 20], center=true);
        }
    }
}