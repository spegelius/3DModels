use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
use <../generic/washers.scad>;
include<../lib/bearings.scad>;
use <../_downloaded/Parametric_pulley/Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;


////// VARIABLES //////
bearing_hole_d = 16.25;


////// VIEW //////
//_orig_gearbox();
//_orig_cover();
//_tapering_M3_nut();
//mock_shaft();
//GT2_64_Tronxy_special();
//debug_cover();
//debug_cover_tall_pulley();
//debug_full_cover();
//debug_gearbox_bearing_holder();

////// PRINT /////
//gearbox_old();
gearbox();
//gearbox_cover();
//gearbox_cover_tall();
//gearbox_full_cover();
//gearbox_bearing_holder();
//gearbox_washer_1();
//gearbox_washer_2();
//gearbox_washer_3();

//axle_drill_jig();


////// MODULES //////
module _tapering_M3_nut(bridging=true) {
    union() {
        cylinder(d=3.3, h=20, $fn=30);

        translate([0, 0, -0.1])
        M3_nut_tapering(
            h=6.2, cone=false, bridging=bridging
        );
    }
}

module _bearing_hole(h=10) {
    difference() {
        cylinder(d=bearing_hole_d, h=h, $fn=30);

        for(i = [0:5]) {
            rotate([0, 0, 360/6*i])
            translate([17/2 + 0.2, 0, 0])
            cylinder(d=1.5, h=h, $fn=20);
        }
    }
}

module GT2_64_Tronxy_special() {
    //teeth = 64;
    //profile = 12;
    //motor_shaft = 5.1;
    //motor_shaft_flat = 1;
    //motor_shaft_flat_offset = 0;
    //m3_dia = 0;
    //m3_nut_hex = 0;
    //m3_nut_flats = 0;
    //m3_nut_depth = 2;
    //retainer = 1;
    //retainer_ht = 1.5;
    //idler = 1;
    //idler_ht = 1.5;
    //pulley_t_ht = 6.5;
    //pulley_b_ht = 7.5;
    //pulley_b_dia = 22;
    //no_of_nuts = 2;
    //nut_angle = 180;
    //nut_shaft_distance = 1.2;
    //total_h = pulley_b_ht + pulley_t_ht + retainer_ht;
    //additional_tooth_width = 0.3;
    //additional_tooth_depth = 0.4;

    %translate([0, 0, -7.6])
    rotate([0, 0, 90])
    mock_shaft();

    difference() {
        do_pulley();

        hull() {
            translate([0, 0, 17])
            rotate([90, 0, 0])
            cylinder(d=2, h=20, center=true, $fn=30);

            translate([0, 0, 12.4])
            rotate([90, 0, 0])
            cylinder(d=2, h=20, center=true, $fn=30);
        }

        translate([2/2 + 3.1/2, -6.5, 0])
        cylinder(d=3.1, h=50, center=true, $fn=20);

        hull() {
            translate([2/2 + 3.1/2, -6.5, 12.5])
            cylinder(d=3.1, h=20, $fn=20);
            
            translate([2/2 + 3.1/2, -6.5, 15.5])
            cylinder(d=7.3, h=20, $fn=20);
        }

        translate([-2/2 - 3.1/2, 6.5, 0])
        cylinder(d=3.1, h=50, center=true, $fn=20);

        hull() {
            translate([-2/2 - 3.1/2, 6.5, 12.5])
            cylinder(d=3.1, h=20, $fn=20);
            
            translate([-2/2 - 3.1/2, 6.5, 15.5])
            cylinder(d=7.3, h=20, $fn=20);
        }

        translate([2/2 + 3.1/2, -6.5, -0.1])
        M3_nut(6);

        translate([-2/2 - 3.1/2, 6.5, -0.1])
        M3_nut(6);

        translate([6, 3, 0])
        cylinder(d=5, h=40, center=true, $fn=6);

        translate([-6, -3, 0])
        cylinder(d=5, h=40, center=true, $fn=6);


        // hex
        for(i = [0:7]) {
            rotate([0, 0, i*360/8])
            translate([0, 13.85, 0])
            cylinder(d=6.5, h=40, center=true, $fn=6);
        }
    }
}

module _orig_gearbox() {
    // for positioning
//    %cylinder(d=14, h=30, center=true);
//
//    translate([-31.9, 0, 0])
//    %cylinder(d=2.5, h=30, center=true, $fn=20);

    translate([-33.5, 29, 0])
    import(
        "Gearbox_for_nema17_extruder.stl",
        convexity=10
    );
}

module _orig_cover() {
    // for positioning
    //%cylinder(d=14, h=30, center=true);

    translate([-3.02, -27, -0.102])
    import(
        "Gearbox_for_nema17_extruder_cover.stl",
        convexity=10
    );
}

module mock_shaft() {
    h = 56;
    echo(h);

    difference() {
        cylinder(d=5, h=h, $fn=20);

        translate([5/2, 0, 0])
        cube([1, 5, 46], center=true);

        translate([5/2, 0, 32 + 40/2])
        cube([1, 5, 40], center=true);
    }

    translate([0, 0, 20])
    rotate([0, 90, 0])
    cylinder(d=2, h=19.5, center=true, $fn=20);
}

module debug_cover() {
    intersection() {
        union() {
            gearbox();

            translate([0, 0, 18.9 + 9.6])
            rotate([180, 0, 0])
            gearbox_cover();
        }

        translate([-31.9, 0, -20])
        cube([100, 100, 50]);
    }
    //translate([20,-20,0]) cube([1,40,13.9]);
}

module debug_gearbox_bearing_holder() {
    intersection() {
        gearbox();

        translate([0, 100/2, 0])
        cube([200, 100, 100], center=true);
        
    }

    intersection() {
        translate([0, 0, -2])
        gearbox_bearing_holder();

        translate([0, 100/2, 0])
        cube([200, 100, 100], center=true);
    }
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
            gearbox();

            translate([0, 0, 9.6 + 23])
            rotate([180, 0, 0])
            gearbox_cover_tall();
        }

        translate([1.55, 0, -20])
        cube([100, 100, 60]);
    }
    //translate([20,-20,0]) 
    //cube([1,40,13.9]);

    translate([0, 0, 9.6 + 17])
    rotate([180, 0, 0])
    _pulley();
}

module debug_full_cover() {
    intersection() {
        union() {
            translate([0, 0, -9.6])
            gearbox();

            translate([0, 0, 19])
            rotate([180, 0, 0])
            gearbox_full_cover();

            translate([0, 0, -9.6 - 2])
            gearbox_bearing_holder();
        }
        translate([0, 100/2, 0])
        cube([200, 100, 100], center=true);
    }

    %translate([-58, 0, 38.9])
    rotate([-90, 0, 0])
    mock_stepper_motor(geared=false, center=true);

    %translate([-58, 0, -2])
    mock_pulley_GT2_16t();

//    %translate([-27,0,-29.6])
//    rotate([90,0,0])
//    mock_stepper_motor(geared=false, center=true);

    %translate([0, 0, 12])
    rotate([180, 0, 0])
    import(
     "../_downloaded/Parametric_pulley/GT2_64teeth.stl"
    );

    translate([0, 0, 19])
    rotate([180, 0, -90])
    mock_shaft();
    
    %translate([0, 0, 12])
    gearbox_washer_1();

    %translate([0, 0, -6])
    gearbox_washer_2();

    // belt
    %translate([-30, 13.5, 7.2])
    rotate([0, 0, 15])
    cube([50, 1, 6], center=true);
}

module gearbox_bearing_holder() {
    difference() {
        union() {
            translate([0, 0, 6 - 0.65])
            cylinder(d=26.7, h=0.65, $fn=60);

            cylinder(d=22, h=5.6, $fn=60);

            translate([0, 0, 5.6 - 3])
            cylinder(d1=22, d2=26.7, h=2.75, $fn=60);

            for(i = [0:8]) {
                rotate([0, 0, 360/9*i])
                translate([22/2 - 0.2, 0, 1])
                cylinder(d2=1.2, d1=0.2, h=3, $fn=20);
            }
        }
        // shaft bearing hole
        translate([0, 0, 0.6])
        _bearing_hole(h=6);

        cylinder(
            d=bearing_hole_d - 3, h=20,
            center=true, $fn=40
        );
    }

    translate([0, 0, 0.6])
    %625zz();
}

module gearbox_old(bridging=true, support=true) {
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

                translate([23 + 26.15, -10 - 5.64 + 31.3, 0])
                cylinder(d=8, h=9.6);

                translate([23 + 26.15 - 31.3, -10 - 5.66, 0])
                cylinder(d=8, h=9.6);

                translate([
                    23 + 26.15 - 31.3,
                    -10 - 5.64 + 31.3, 0
                ])
                cylinder(d=8, h=9.6);

                // fill center hole
                translate([1.55, 0, 0])
                cylinder(d=12, h=9.6);

                // fill cover back nut holes
                translate([50.7, -7, 9.6/2])
                rotate([0, 0, -22])
                cube([4, 7, 9.6], center=true);

                translate([50.7, 7, 9.6/2])
                rotate([0, 0, 22])
                cube([4, 7, 9.6], center=true);
            }

            translate([33.5, 0, 0.6])
            cylinder(d=bearing_hole_d, h=30, $fn=80);
            
            translate([23 + 26.15, -10 - 5.66, 0])
            _tapering_M3_nut();

            translate([23 + 26.15, -10 - 5.64 + 31.3, 0])
            _tapering_M3_nut();

            translate([23 + 26.15 - 31.3, -10 - 5.66, 0])
            _tapering_M3_nut();

            translate([23 + 26.15 - 31.3, -10 - 5.64 + 31.3, 0])
            _tapering_M3_nut();

            // cover back mount holes
            translate([55, 8.6, 9.6/2])
            rotate([0, 90, 22])
            cylinder(d=3, h=20, center=true, $fn=30);

            translate([55, -8.6, 9.6/2])
            rotate([0, 90, -22])
            cylinder(d=3, h=20, center=true, $fn=30);

            translate([55, 8.6, 9.6/2])
            rotate([0, 90, 22])
            hull() {
                translate([0, 0, -6])
                M3_nut(cone=false);

                translate([5, 0, -6])
                M3_nut(cone=false);
            }

            translate([55, -8.6, 9.6/2])
            rotate([0, 90, -22])
            hull() {
                translate([0, 0, -6])
                M3_nut(cone=false);

                translate([5, 0, -6])
                M3_nut(cone=false);
            }

            // center indent
            translate([1.59, -0.1, -0.1]) {
                cylinder(d1=9, d2=2, h=4, $fn=52);
                cylinder(d=2.9, h=18.5, $fn=30);
            }
        }

        // motor hole support
        if (support) {
            translate([33.5, 0, 0])
            difference() {
                union() {
                    cylinder(d=bearing_hole_d + 1, h=5.7, $fn=60);

                    translate([0, 0, 5.7 - 2])
                    cylinder(
                        d1=bearing_hole_d + 1,
                        d2=bearing_hole_d + 4.5,
                        h=2, $fn=60
                    );
                }
                translate([0, 0, 0.3])
                cylinder(d=bearing_hole_d, h=5.7, $fn=60);
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

module gearbox() {
    difference() {
        union() {
            intersection() {
                translate([0, 0, 9.6])
                mirror([0, 0, 1])
                _orig_gearbox();

                // delete the motor centering part
                translate([0, 0, 9.6/2])
                cube([200, 200, 9.6], center=true);
            }

            // fill nut holes
            translate([31/2, -31/2, 0])
            cylinder(d=8, h=9.6);

            translate([31/2, 31/2, 0])
            cylinder(d=8, h=9.6);

            translate([-31/2, 31/2, 0])
            cylinder(d=8, h=9.6);

            translate([-31/2, -31/2, 0])
            cylinder(d=8, h=9.6);

            // fill bearing hole
            cylinder(d=31, h=4);

            // fill the motor part
            translate([-53, 0, 9.6/2])
            chamfered_cube_side(
                57, 41, 9.6, 4, center=true
            );

            // fill cover back nut holes
            translate([17.2, -7, 9.6/2])
            rotate([0, 0, -22])
            cube([4, 7, 9.6], center=true);

            translate([17.2, 7, 9.6/2])
            rotate([0, 0, 22])
            cube([4, 7, 9.6], center=true);
        }

        // bearing cover holes
        translate([0, 0, 4])
        cylinder(d=31, h=30, $fn=80);
        
        translate([0, 0, -1])
        cylinder(d=22, h=30, $fn=80);

        hull() {
            translate([0, 0, 3.35])
            cylinder(d=26.7, h=30, $fn=80);

            translate([0, 0, 0.5])
            cylinder(d=22, h=2.85, $fn=80);
        }
       
        // motor mount nuts
        translate([31/2, 31/2, 10])
        rotate([180, 0, 0])
        _tapering_M3_nut(bridging=false);

        translate([31/2, -31/2, 10])
        rotate([180, 0, 0])
        _tapering_M3_nut(bridging=false);

        translate([-31/2, 31/2, 10])
        rotate([180, 0, 0])
        _tapering_M3_nut(bridging=false);

        translate([-31/2, -31/2, 10
        ])
        rotate([180, 0, 0])
        _tapering_M3_nut(bridging=false);

        // center indent
        translate([-31.9, 0, 9.6 - 3.9])
        cylinder(d2=9, d1=2, h=4, $fn=52);

        translate([-31.9, 0, -0.1])
        cylinder(d=2.9, h=18.5, $fn=30);

        translate([-31.9, 0, -1.4])
        _tapering_M3_nut(bridging=true);

        // motor center hole
        translate([-61.7, 0, 0])
        hull() {
            cylinder(d=23.4, h=30, center=true, $fn=60);

            translate([10, 0, 0])
            cylinder(d=23.4, h=30, center=true, $fn=60);
        }

        // pulley tightening groove
        translate([-70, 0, 9.6])
        rotate([0, 90, 0])
        cylinder(d=4, h=40, center=true, $fn=40);

        // better motor mount grooves
        hull() {
            translate([-77.2, 31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);

            translate([-67.2, 31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);
        }

        hull() {
            translate([-77.2, -31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);

            translate([-67.2, -31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);
        }

        hull() {
            translate([-77.2 + 31, 31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);

            translate([-67.2 + 31, 31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);
        }

        hull() {
            translate([-77.2 + 31, -31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);

            translate([-67.2 + 31, -31/2, -1])
            cylinder(d=3.3, h=10, $fn=30);
        }

        // screw head grooves
        hull() {
            translate([-77.2, 31/2, 5])
            cylinder(d=7, h=10, $fn=30);

            translate([-67.2, 31/2, 5])
            cylinder(d=7, h=10, $fn=30);
        }

        hull() {
            translate([-77.2, -31/2, 5])
            cylinder(d=7, h=10, $fn=30);

            translate([-67.2, -31/2, 5])
            cylinder(d=7, h=10, $fn=30);
        }

        hull() {
            translate([-77.2 + 31, 31/2, 5])
            cylinder(d=7, h=10, $fn=30);

            translate([-67.2 + 31, 31/2, 5])
            cylinder(d=7, h=10, $fn=30);
        }

        hull() {
            translate([-77.2 + 31, -31/2, 5])
            cylinder(d=7, h=10, $fn=30);

            translate([-67.2 + 31, -31/2, 5])
            cylinder(d=7, h=10, $fn=30);
        }
        // cover back mount holes
        translate([21.5, 8.6, 9.6/2])
        rotate([0, 90, 22])
        cylinder(d=3, h=18, center=true, $fn=30);

        translate([21.5, -8.6, 9.6/2])
        rotate([0, 90, -22])
        cylinder(d=3, h=18, center=true, $fn=30);

        translate([21.5, 8.6, 9.6/2])
        rotate([0, 90, 22])
        hull() {
            translate([0, 0, -6])
            M3_nut(cone=false);

            translate([5, 0, -6])
            M3_nut(cone=false);
        }

        translate([21.5, -8.6, 9.6/2])
        rotate([0, 90, -22])
        hull() {
            translate([0, 0, -6])
            M3_nut(cone=false);

            translate([5, 0, -6])
            M3_nut(cone=false);
        }
    }

}

module gearbox_cover() {
    difference() {
        union() {
            difference() {
                _orig_cover();

                translate([0, 0, 0.6])
                _bearing_hole();

                cylinder(
                    d=bearing_hole_d - 3, h=20,
                    center=true, $fn=40
                );

                translate([-25, 0, 18.9])
                cylinder(d=30, h=5);
            }

            translate([-31.9, 0, 0])
            cylinder(d=10.3, h=18.9, $fn=52);

            translate([-31.9, 0, 18.8])
            cylinder(d1=8.9, d2=4.6, h=2.45, $fn=52);
        }
        translate([-31.9, 0.1, -0.1])
        cylinder(d=7, h=3.6, $fn=30);

        translate([-31.9, 0.1, 3.49])
        cylinder(d1=7, d2=3.5, h=3.5/2, $fn=30);

        translate([-31.9, 0.1, 0])
        cylinder(d=3.5, h=29, $fn=40);
    }

    translate([0, 0, 0.6])
    %625zz();
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

    module screw_hole(d, h) {
        hull() {
            cylinder(d=d, h=h, center=true, $fn=30);

            translate([10, 0, 0])
            cylinder(d=d, h=h, center=true, $fn=30);
        }
    }

    module screw_holes(d, h) {
        translate([-77.4, -31/2, 0])
        screw_hole(d, h);

        translate([-77.4, 31/2, 0])
        screw_hole(d, h);

        translate([-77.4 + 31, -31/2, 0])
        screw_hole(d, h);

        translate([-77.4 + 31, 31/2, 0])
        screw_hole(d, h);
    }

    union() {
        gearbox_cover();

        difference() {
            union() {
                hull() {
                    translate([-77.7, 0, 7/2])
                    chamfered_cube_side(
                        12, 42, 7, 4, center=true
                    );

                    translate([-39, 0, 7/2])
                    chamfered_cube_side(
                        12, 42, 7, 4, center=true);

                    cylinder(d=25, h=7, $fn=40);
                }
                translate([0, 0, 18.9/2])
                intersection() {
                    screw_holes(9.8, 18.9);

                    translate([-77.4 + 31/2 + 5.2, 0, 0])
                    chamfered_cube(
                        52, 42, 100, 4, center=true
                    );
                }
            }

            // bearing hole
            translate([0, 0, 5]) {
                cylinder(d=20, h=30, center=true);
                cylinder(d=60, h=5);
            }

            // belt path
            hull() {
                translate([0, 0, 7])
                cylinder(d=43, h=20);

                translate([-62.7, 0, 7])
                cylinder(d=12, h=20);
            }

            // middle screw hole
            translate([-31.9, 0, 0])
            cylinder(d=8, h=30, center=true);

            // motor center hole
            translate([-61.7, 0, 0])
            hull() {
                cylinder(d=23.4, h=30, center=true, $fn=60);

                translate([10, 0, 0])
                cylinder(d=23.4, h=30, center=true, $fn=60);
            }

            // screw holes
            screw_holes(3.4, 60);

            // pulley tightening groove
            translate([-70, 0, 7])
            rotate([0, 90, 0])
            cylinder(d=4, h=40, center=true, $fn=40);
        }
    }
}

module gearbox_washer_1() {
    _washer(8, 5.4, 1.4);
}

module gearbox_washer_2() {
    _washer(8, 5.4, 2.4);
}

module gearbox_washer_3() {
    _washer(21, 13, 0.8);
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