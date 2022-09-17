use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
use <../generic/washers.scad>;

////// VARIABLES //////
bearing_hole = 16.2;


////// VIEW //////
//!_tapering_M3_nut();
//debug_cover();
//debug_cover_tall_pulley();
//debug_full_cover();

//gearbox();
//gearbox_cover();
//gearbox_cover_tall();
//gearbox_full_cover();

axle_drill_jig();

////// MODULES //////
module _tapering_M3_nut() {
    rotate([0, 0, 360/12]) union() {
        translate([0, 0, -0.1])
        hull() {
            cylinder(d=6.9, h=0.1, $fn=6);
            translate([0, 0, 5])
            cylinder(d=6.5, h=0.1, $fn=6);
        }
        cylinder(d=3.2, h=10, $fn=30);
        translate([0, 0, 5])
        intersection() {
            cube([10, 3.2, 0.4], center=true);
            cylinder(d=6.5, h=0.5, center=true, $fn=6);
        }
        translate([0, 0, 5.2])
        cube([3.2, 3.2, 0.4], center=true);
    }
}

module gearbox(bridging=true, support=true) {
    union() {
        difference() {
            union() {
                translate([0, 29, 0])
                import(
                    "Gearbox_for_nema17_extruder.stl",
                    convexity=10
                );

                // fill nut holes
                translate([23 + 26.15, -10 - 5.66, 0])
                cylinder(d=8, h=9.6);

                translate([23 + 26.15, -10 -5.64 + 31.3, 0])
                cylinder(d=8, h=9.6);

                translate([23 + 26.15 - 31.3, -10 - 5.66, 0])
                cylinder(d=8, h=9.6);

                translate([23 + 26.15 - 31.3, -10 - 5.64 + 31.3, 0])
                cylinder(d=8, h=9.6);

                // fill center hole
                translate([1.55, 0, 0])
                cylinder(d=12, h=9.6);
            }

            translate([33.5, 0, 0.6])
            cylinder(d=bearing_hole, h=30, $fn=80);
            
            translate([23 + 26.15, -10 - 5.66, 0])
            _tapering_M3_nut();

            translate([23 + 26.15, -10 - 5.64 + 31.3, 0])
            _tapering_M3_nut();

            translate([23 + 26.15 - 31.3, -10 - 5.66, 0])
            _tapering_M3_nut();

            translate([23 + 26.15 - 31.3, -10 - 5.64 + 31.3, 0])
            _tapering_M3_nut();

            translate([1.59, -0.1, 0]) {
                cylinder(d1=10.5, d2=1, h=(10.5 - 1)/2, $fn=52);
                cylinder(d=2.9, h=18.5, $fn=30);
            }
        }

        // motor hole support
        if (support) {
            translate([33.5, 0, 0])
            difference() {
                union() {
                    cylinder(d=bearing_hole + 1, h=5.7, $fn=60);

                    translate([0, 0, 5.7 - 2])
                    cylinder(
                        d1=bearing_hole + 1,
                        d2=bearing_hole + 4.5,
                        h=2, $fn=60
                    );
                }
                translate([0, 0, 0.3])
                cylinder(d=bearing_hole, h=5.7, $fn=60);
            }
        }

        // support bridges
        if (bridging) {
            translate([-15, -10 - 7.5, 3.6])
            cube([15, 4, 0.2]);

            translate([-15 - 31, -10 - 7.5, 3.6])
            cube([15, 4, 0.2]);

            translate([-15, -10 - 7.5 + 31, 3.6])
            cube([15, 4, 0.2]);

            translate([-15 - 31, -10 - 7.5 + 31, 3.6])
            cube([15, 4, 0.2]);
        }
    }
}

module gearbox_cover() {
    difference() {
        union() {
            difference() {
                translate([0, -27, -0.102])
                import(
                    "Gearbox_for_nema17_extruder_cover.stl",
                    convexity=10
                );

                translate([3, 0, 0.6])
                cylinder(d=bearing_hole, h=30, $fn=80);

                translate([-25, 0, 19])
                cylinder(d=30, h=5);
            }
            translate([-28.99, 0.05, 0])
            cylinder(d=10.2, h=19, $fn=52);

            translate([-28.99, 0.05, 19])
            cylinder(d1=10.2, d2=1, h=(10.2 - 1)/2, $fn=52);
        }
        translate([-28.99, 0.1, -0.1])
        cylinder(d=7, h=3.6, $fn=30);

        translate([-28.99, 0.1, 3.49])
        cylinder(d1=7, d2=3.5, h=3.5/2, $fn=30);

        translate([-28.99, 0.1, 0])
        cylinder(d=3.5, h=29, $fn=40);
    }
}

module gearbox_cover_tall() {
    union() {
        intersection() {
            gearbox_cover();

            translate([0, 0, -1 + 8/2])
            cube([100, 100, 8], center=true);
        }

        intersection() {
            gearbox_cover();

            translate([0, 0, 5.5 + 13/2])
            cube([100, 100, 13], center=true);
        }

        translate([0, 0, 23 - 18.89])
        intersection() {
            gearbox_cover();

            translate([0, 0, 29 - 15/2])
            cube([100, 100, 15], center=true);
        }

    }
}

module gearbox_full_cover() {

    module screw_hole(d,h) {
        hull() {
            cylinder(d=d, h=h, center=true, $fn=30);

            translate([10, 0, 0])
            cylinder(d=d, h=h, center=true, $fn=30);
        }
    }

    module screw_holes(d, h) {
        translate([-74.4, -31/2, 0])
        screw_hole(d, h);

        translate([-74.4, 31/2, 0])
        screw_hole(d, h);

        translate([-74.4 + 31, -31/2, 0])
        screw_hole(d, h);

        translate([-74.4 + 31, 31/2, 0])
        screw_hole(d, h);
    }

    union() {
        gearbox_cover();

        difference() {
            union() {
                hull() {
                    translate([-73.7, 0, 7/2])
                    chamfered_cube_side(
                        12, 42, 7, 4, center=true
                    );

                    translate([-36, 0, 7/2])
                    chamfered_cube_side(
                        12, 42, 7, 4, center=true);

                    cylinder(d=20, h=7, $fn=40);
                }
                translate([0, 0, 18.9/2])
                intersection() {
                    screw_holes(9.8, 18.9);

                    translate([-74.4 + 31/2 + 5.2, 0, 0])
                    chamfered_cube(
                        52, 42, 100, 4, center=true
                    );
                }
            }

            // bearing hole
            translate([3, 0, 5]) {
                cylinder(d=20, h=30, center=true);
                cylinder(d=60, h=5);
            }

            // belt path
            hull() {
                translate([3, 0, 7])
                cylinder(d=42, h=20);

                translate([-58.7, 0, 7])
                cylinder(d=12, h=20);
            }

            // middle screw hole
            translate([-29, 0, 0])
            cylinder(d=8, h=30, center=true);

            // motor center hole
            translate([-58.7, 0, 0])
            hull() {
                cylinder(d=23, h=30, center=true, $fn=30);

                translate([10, 0, 0])
                cylinder(d=23, h=30, center=true, $fn=30);
            }

            // screw holes
            screw_holes(3.4, 60);
        }
    }
}

module washer_1() {
    _washer(7.4, 5.4, 2);
}

module washer_2() {
    _washer(7.4, 5.4, 2.5);
}

module washer_3() {
    _washer(7.4, 5.4, 1);
}

module debug_cover() {
    intersection() {
        union() {
            rotate([180, 0, 0])
            gearbox();

            translate([30.5, 0, 18.89])
            rotate([180, 0, 0])
            gearbox_cover();
        }

        translate([1.55, 0, -20])
        cube([100, 100, 50]);
    }
    //translate([20,-20,0]) cube([1,40,13.9]);
}

module debug_cover_tall_pulley() {

    module _pulley() {
        difference() {
            union() {
                cylinder(d=20, h=22, $fn=30);
                cylinder(d=42, h=1.5, $fn=30);

                translate([0, 0, 14 - 1.5])
                cylinder(d=42, h=1.5, $fn=30);

                cylinder(d=38, h=14, $fn=40);
            }
            cylinder(d=5, h=100, center=true, $fn=20);
        }
    }

    intersection() {
        union() {
            rotate([180, 0, 0])
            gearbox(support=false);

            translate([30.5, 0, 23])
            rotate([180, 0, 0])
            gearbox_cover_tall();
        }

        translate([1.55, 0, -20])
        cube([100, 100, 50]);
    }
    //translate([20,-20,0]) cube([1,40,13.9]);

    translate([33.5, 0, 17])
    rotate([180, 0, 0])
    _pulley();
}

module debug_full_cover() {
    intersection() {
        union() {
            rotate([180, 0, 0])
            gearbox(bridging=false);

            translate([30.5, 0, 18.9])
            rotate([180, 0, 0])
            gearbox_full_cover();
        }
        translate([0, 100/2, 0])
        cube([200, 100, 100], center=true);
    }

    %translate([-27, 0, 38.9])
    rotate([-90, 0, 0])
    mock_stepper_motor(geared=false, center=true);

    %translate([-27, 0, -2])
    mock_pulley_GT2_16t();

//    %translate([-27,0,-29.6])
//    rotate([90,0,0])
//    mock_stepper_motor(geared=false, center=true);

    %translate([33.5, 0, 12])
    rotate([180, 0, 0])
    import("../_downloaded/Parametric_pulley/GT2_64teeth.stl");
    
    %translate([33.5, 0, 12])
    washer_1();

    %translate([33.5, 0, -6])
    washer_2();

    // belt
    %translate([0, 20, 7.2])
    cube([50, 1, 6], center=true);
}

module axle_drill_jig(d=2) {

    difference() {
        hull() {
            cylinder(d=14, h=15, center=true);

            translate([0, 14, 0])
            cube([11, 2, 15], center=true);
        }

        cylinder(d=5.2, h=32, center=true, $fn=30);

        translate([0, 0, 15/2 - 3])
        rotate([90, 0, 0])
        cylinder(d=d + 0.2, h=50, center=true);
    }
}