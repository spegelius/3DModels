include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
use <mockups.scad>;

stl_base_path = "../../_downloaded/";
dc_stl_path = str(
    stl_base_path,
    "Bondtech Style Extruder/"
);


//original_extruder_assembly();
//_lid_form();
//_orig_lid_M10();
//debug();

//new_lid_M10(bridging=true);
new_lid_M10_soluble_supports();
//cr_extruder_carriage_mount();


module _orig_lid_M10() {
    fname =
        "Lid__M10_Threaded_Fittings_v3.stl";

    translate([0, 0, 88.56])
    rotate([0, 180, 0])
    translate([319.5, 173.7, 0])
    import(
        str(dc_stl_path, fname), convexity=10
    );
}

module original_extruder_assembly() {

    translate([0, 0, 29])
    rotate([0, 180, 0])
    _orig_lid_M10();

    fname2 =
        "Base_v3.stl";

    translate([319.5, 173.7, -59.55])
    rotate([0, 0, 0])
    import(
        str(dc_stl_path, fname2), convexity=10
    );


    fname3 =
        "Latch_v3.stl";

    translate([319.5, 173.7, -59.55])
    rotate([0, 0, 0])
    import(
        str(dc_stl_path, fname3), convexity=10
    );

}

module debug() {
    mock_creality_x_carriage();

    translate([16.6, -10.5, -48.2])
    mock_creality_hotend();

    #translate([16.6, -10.5, -26])
    cylinder(d=2, h=60, $fn=30);

    translate([21.1, -27.5, 46])
    rotate([90, 0, 180])
    original_extruder_assembly();

    translate([58 - 20, 12/2 - 3, 11.5])
    rotate([0, -90, 0])
    cr_extruder_carriage_mount();
}

module _lid_form() {
    hull()
    _orig_lid_M10();
}

module new_lid_M10(bridging=true) {

    module _filler() {
        intersection() {
            _orig_lid_M10();

            translate([-4.5, 0.1, 13.8 + 2/2])
            cube([6, 12.4, 2], center=true);
        }
    }

    difference() {
        union() {
            _orig_lid_M10();

            translate([0, 0, -1.99])
            _filler();

            translate([0, 0, -3.98])
            _filler();

            if (bridging) {
                translate([-16, -16, 2.817])
                cylinder(d=8, h=0.2);

                translate([-16, -16, 9.083])
                cylinder(d=8, h=0.2);

                translate([16, -16, 2.817])
                cylinder(d=8, h=0.2);

                translate([-16, 16, 2.817])
                cylinder(d=8, h=0.2);

                translate([16, 16, 2.817])
                cylinder(d=8, h=0.2);
            }
        }

        // filament drill path guide
        translate([-4.55, 0, 11.94])
        rotate([90, 0, 0])
        cylinder(d=1, h=50, center=true, $fn=10);
    }
}

module new_lid_M10_soluble_supports() {

    %_orig_lid_M10();

    // hinge
    difference() {
        hull() {
            translate([-10, -4, 5])
            cylinder(d=3, h=4.4, $fn=20);

            translate([-13, -10, 0])
            cylinder(d=6, h=9.4, $fn=20);

            translate([-12, -22, 0])
            cylinder(d=3, h=9.4, $fn=20);

            translate([-18, -22, 0])
            cylinder(d=3, h=9.4, $fn=20);

            translate([-22, -18, 0])
            cylinder(d=3, h=9.4, $fn=20);

            translate([-22, -14, 0])
            cylinder(d=3, h=9.4, $fn=20);
        }
        _orig_lid_M10();
    }

    // bolt had indents
    difference() {
        union() {
            translate([15.5, -15.5, 0])
            cylinder(d=7, h=3);

            translate([15.5, 15.5, 0])
            cylinder(d=7, h=3);

            translate([-15.5, 15.5, 0])
            cylinder(d=7, h=3);
        }
        _orig_lid_M10();
    }

    // fitting holes
    difference() {

        union() {
            translate([-4.55, 0, 11.94])
            rotate([-90, 0, 0])
            union() {
                translate([0, 0, -21])
                cylinder(d=12, h=9);

                translate([0, 0, 12.2])
                cylinder(d=12, h=9);

                cylinder(d=4.6, h=42, center=true);
            }
            hull() {
                translate([-2, 22, 0])
                cylinder(d=3, h=10, $fn=30);

                translate([-7, 22, 0])
                cylinder(d=3, h=10, $fn=30);
            }

            hull() {
                translate([-2, -22, 0])
                cylinder(d=3, h=10, $fn=30);

                translate([-10, -22, 0])
                cylinder(d=3, h=10, $fn=30);
            }
        }
        new_lid_M10();

        translate([-4.55, 0.1, 12])
        cube([10, 12.4, 10], center=true);
    }

}

module cr_extruder_carriage_mount() {

    module _motor_bolt_hole() {
        cylinder(d=3.6, h=20, center=true, $fn=30);

        translate([0, 0, 2])
        cylinder(d=7, h=10, $fn=30);
    }

    difference() {
        union() {
            hull() {
                rotate([90, 0, 0])
                cylinder(d=12, h=12, center=true, $fn=30);

                translate([49, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=12, h=12, center=true, $fn=30);

                translate([49, 0, 34])
                rotate([90, 0, 0])
                cylinder(d=12, h=12, center=true, $fn=30);

                translate([0, 0, 58])
                rotate([90, 0, 0])
                cylinder(d=12, h=12, center=true, $fn=30);

                translate([10, 0, 58])
                rotate([90, 0, 0])
                cylinder(d=12, h=12, center=true, $fn=30);

            }
        }

        translate([0, 0, 18])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=22, center=true, $fn=30);

        translate([0, -12/2 + 1.5, 18])
        rotate([90, 0, 0])
        cylinder(d1=10, d2=13.2, h=1.6, $fn=30);

        translate([0, -12/2 + 3, 18])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=22, $fn=30);

        translate([0, 0, 58])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=22, center=true, $fn=30);

        translate([0, -12/2 + 1.5, 58])
        rotate([90, 0, 0])
        cylinder(d1=10, d2=13.2, h=1.6, $fn=30);

        translate([0, -12/2 + 3, 58])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=22, $fn=30);

        translate([34.5, -1.5, 16.9])
        rotate([90, 90, 0])
        scale([1.01, 1.01, 1])
        _lid_form();

        translate([34.5, -1.5, 46.9])
        rotate([90, 90, 0])
        scale([1.01, 1.01, 1])
        _lid_form();

        translate([50.3, 0, 1.3])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([50.3, 0, 1.3 + motor_bolt_hole_distance])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([
            50.3 - motor_bolt_hole_distance,
            0, 1.3 + motor_bolt_hole_distance
        ])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([
            50.3 - motor_bolt_hole_distance,
            0, 1.3
        ])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([
            50.3 - motor_bolt_hole_distance/2,
            0, 1.3 + motor_bolt_hole_distance/2
        ])
        rotate([90, 0, 0])
        cylinder(d=30, h=20, center=true, $fn=30);

        translate([0, -12/2 + 3 + 2.5/2, 60/2 + 5.9])
        cube([24, 2.5, 60], center=true);

        translate([-5, -12/2 - 10/2 + 7.3, 40])
        hull() {
            rotate([90, 0, 0])
            cylinder(d=15, h=10, center=true, $fn=30);

            translate([-5, 0, 0])
            cube([1, 10, 30], center=true);
        }

    }
    
}