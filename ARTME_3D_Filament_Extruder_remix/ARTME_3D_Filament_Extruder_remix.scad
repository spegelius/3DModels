use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;

use <../M4_slide_t-nut_3030_remix/M4_slide_t-nut_3030_remix.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path,
    "Original Desktop Filament Extruder MK3 by ARTME 3D/"
);


//_orig_MK3_ed_c();
//_MK3_ed_c_supports();
//_623zz_bearing_hole();

//debug_MK3_cheapass_filament_gauge();

//MK3_ed_c_supports();
//MK3_ed_c_supports_soluble();

//MK3_pu_b_gauge();

//MK3_cheapass_filament_gauge();
//MK3_cheapass_filament_gauge_tnut();
//MK3_cheapass_filament_gauge_arm();
//MK3_cheapass_filament_gauge_small_arm();
MK3_cheapass_filament_gauge_test_sticks();


module _orig_MK3_ed_c() {
    import(
        str(
            spath,
            "ED (Extruder Drive)/",
            "ed-c.stl"
        ),
        convexity=10
    );

//    %translate([0, 0, 20.25])
//    rotate([90, 0, 0])
//    cylinder(d=30.8, h=80, center=true, $fn=50);
    
}

module _orig_MK3_pu_a() {
    import(
        str(
            spath,
            "PU (Pulling Unit)/",
            "pu-a.stl"
        ),
        convexity=10
    );  
}

module _orig_MK3_pu_b() {
    import(
        str(
            spath,
            "PU (Pulling Unit)/",
            "pu-b.stl"
        ),
        convexity=10
    );  
}

module _orig_MK3_pu_c() {
    import(
        str(
            spath,
            "PU (Pulling Unit)/",
            "pu-c.stl"
        ),
        convexity=10
    );  
}

module _orig_MK3_pu_e() {
    import(
        str(
            spath,
            "PU (Pulling Unit)/",
            "pu-e.stl"
        ),
        convexity=10
    );  
}

module debug_MK3_cheapass_filament_gauge() {
    //gap = 0;
    //gap = 1.5;
    //gap = 1.75;
    gap = 2;

    angle1 = gap/(2*PI*15.5)*360;

    translate([-75, -27, 40])
    rotate([0, 90, 0])
    import(
        str(
            stl_base_path,
            "3030 Extrusion/",
            "3030 X 150.stl"
        ), convexity=10
    );

    translate([6.5, -22, 34.4])
    rotate([0, 0, 180])
    mock_stepper_motor();

    %translate([6.5, -45, 55.5])
    rotate([90, 0, 0])
    tube(13, 10, 4, $fn=60);

    translate([46.5 - 40, -17.5, 26])
    rotate([-90, 0, 0])
    _orig_MK3_pu_a();

    translate([22, -43, 40.05])
    rotate([0, -91.8, 0])
    //_orig_MK3_pu_b();
    rotate([0, angle1, 0])
    union() {
        MK3_pu_b_gauge();

        %translate([15.5, -4.4, 2])
        rotate([90, 0, 0])
        tube(13, 5, 4.5, $fn=60);
    }

//    %translate([22, -43, 40.05])
//    rotate([90, 0, 0,])
//    tube(57*2 + 2, 10, 1, $fn=100);

    color("darkgrey")
    translate([6.5 + 13/2 + 1.75/2, -49, 55.5])
    cube([1.75, 2, 10], center=true);

    %translate([6.5, -33.55, 14])
    rotate([-90, 0, 0])
    _orig_MK3_pu_c();

    translate([7.4, -16, -5])
    rotate([90, 0, 90])
    _orig_MK3_pu_e();

    translate([55, -15, -8])
    rotate([90, 0, 0])
    MK3_cheapass_filament_gauge();

    translate([42, -6, 15])
    rotate([90, 0, 0])
    MK3_cheapass_filament_gauge_tnut();

    if (gap == 1.75) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, 3.15, 0])
        MK3_cheapass_filament_gauge_arm();

        translate([32.365, -26.8, 96.4])
        rotate([90, 7.85, 0])
        MK3_cheapass_filament_gauge_small_arm();
    } else if (gap == 2) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, 8.45, 0])
        MK3_cheapass_filament_gauge_arm();

        translate([33.28, -26.8, 96.22])
        rotate([90, 8.2, 0])
        MK3_cheapass_filament_gauge_small_arm();
    } else if (gap == 1.5) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, -2, 0])
        MK3_cheapass_filament_gauge_arm();

        translate([31.45, -26.8, 96.55])
        rotate([90, 7.65, 0])
        MK3_cheapass_filament_gauge_small_arm();
    } else if (gap == 0) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, -33.9, 0])
        MK3_cheapass_filament_gauge_arm();

        translate([25.95, -26.8, 97.2])
        rotate([90, 9.9, 0])
        MK3_cheapass_filament_gauge_small_arm();
    }
}

module _623zz_bearing_hole() {
    d = 10;

    difference() {
        cylinder(d=d + 0.1, h=7, $fn=60);

        for(i = [0:4]) {
            rotate([0, 0, 360/5*i])
            translate([(d + 1)/2 + 0.2, 0, 0])
            cylinder(d=1.6, h=10, $fn=30);
        }   
    }
}

module _MK3_ed_c_supports() {
    %_orig_MK3_ed_c();

    difference() {
        translate([0, -23.1, 12/2])
        cube([29, 29.2, 12], center=true);

        translate([0, 0, 20.25])
        rotate([90, 0, 0])
        cylinder(d=30.8, h=80, center=true, $fn=50);
    }
}

module MK3_ed_c_supports() {
    difference() {
        _MK3_ed_c_supports();

        translate([0, -29.2/2 - 23.1])
        cube([30, 0.4, 40], center=true);

        translate([0, 0, 20.25])
        rotate([90, 0, 0])
        cylinder(d=32.8, h=80, center=true, $fn=50);
    }
}

module MK3_ed_c_supports_soluble() {

    intersection() {
        _MK3_ed_c_supports();

        translate([0, 0, 20.25])
        rotate([90, 0, 0])
        cylinder(d=32.8, h=80, center=true, $fn=50);
    }
}

module MK3_pu_b_gauge() {
//    %rotate([90, 0, 0])
//    cylinder(d=2.6, h=10, center=true, $fn=30);

//    %translate([15.5, 0, 2])
//    rotate([90, 0, 0])
//    cylinder(d=3.7, h=20, center=true, $fn=30);

    difference() {
        union() {
            translate([-12.75, 0, 28.25])
            _orig_MK3_pu_b();

            translate([57, 3.8, -9.49])
            cube([8, 13.6, 4], center=true);

            hull() {
                translate([51, -2.5, -9.49])
                cube([20, 1, 4], center=true);

                translate([57, 9, -9.49])
                cube([8, 1, 4], center=true);
            }

//            translate([57, 6.6, -5.75])
//            rotate([90, 0, 0])
//            cylinder(d=5.3, h=10.6, center=true, $fn=40);

            translate([57, 5.8, -5.75])
            rotate([90, 0, 0])
            cylinder(d=10, h=9.6, center=true, $fn=40);
        }

        translate([57, 8, -5.75])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=20, center=true, $fn=40);
    }
}

module MK3_cheapass_filament_gauge() {
    difference() {
        union() {
            translate([0, 0, 3/2])
            rounded_cube_side(
                40, 60, 3, 8, center=true, $fn=60
            );

            translate([0, 91, 0])
            cylinder(d=13, h=6, $fn=60);

            translate([0, 91, 0])
            cylinder(d=5.1, h=7.4, $fn=60);

            hull() {
                translate([0, 56, 1/2])
                cube([4, 64, 1], center=true);

                translate([0, 60, 5 - 1/2])
                cube([1.5, 60, 1], center=true);
            }

            hull() {
                cylinder(d=16, h=3, $fn=60);

                translate([0, 91, 0])
                cylinder(d=15, h=3, $fn=60);
            }

            hull() {
                translate([0, 60/2, 3/2])
                cube([32, 1, 3], center=true);

                translate([0, 40, 0])
                cylinder(d=16, h=3, $fn=60);
            }

            // 2mm mark
            color("black")
            translate([-16.3, -19, 4/2])
            rotate([0, 0, -7])
            cube([1, 4, 4], center=true);

            color("black")
            translate([-17, -28, 0])
            rotate([0, 0, 35])
            linear_extrude(4)
            text("2.0", size=4, font="Arial:style=Bold");

            // 1.875mm mark
            color("black")
            translate([-11.1, -18.8, 4/2])
            rotate([0, 0, -5.5])
            cube([1, 2, 4], center=true);

            // 1.75mm mark
            color("black")
            translate([-6.2, -20, 4/2])
            rotate([0, 0, -4])
            cube([1, 4, 4], center=true);

            color("black")
            translate([-9, -30, 0])
            rotate([0, 0, 35])
            linear_extrude(4)
            text("1.75", size=4, font="Arial:style=Bold");

            // 1.625mm mark
            color("black")
            translate([-1.2, -19.2, 4/2])
            rotate([0, 0, 0])
            cube([1, 2, 4], center=true);

            // 1.5mm mark
            color("black")
            translate([3.9, -19.9, 4/2])
            rotate([0, 0, 4])
            cube([1, 4, 4], center=true);

            color("black")
            translate([3, -29.5, 0])
            rotate([0, 0, 35])
            linear_extrude(4)
            text("1.5", size=4, font="Arial:style=Bold");
        }

        hull() {
            translate([16, 60/2 + 16/2, 0])
            cylinder(d=16, h=20, center=true, $fn=60);

            translate([16, 60, 0])
            cube([16, 1, 20], center=true);

            translate([40, 60/2 + 16/2, 0])
            cube([1, 16, 20], center=true);
        }

        hull() {
            translate([-16, 60/2 + 16/2, 0])
            cylinder(d=16, h=20, center=true, $fn=60);

            translate([-16, 60, 0])
            cube([16, 1, 20], center=true);

            translate([-40, 60/2 + 16/2, 0])
            cube([1, 16, 20], center=true);
        }

        translate([10, 23, 0])
        cylinder(d=4.2, h=20, center=true, $fn=40);

        translate([-13, 23, 0])
        cylinder(d=4.2, h=20, center=true, $fn=40);

        translate([0, 91, -1])
        cylinder(d=2.8, h=15, $fn=60);

        translate([10, 23, 1.4])
        cylinder(d=7, h=20, $fn=40);
        
        translate([-13, 23, 1.4])
        cylinder(d=7, h=20, $fn=40);

    }
}

module MK3_cheapass_filament_gauge_tnut() {
    union() {
        M4_slide_tnut_3030_new();

        
        translate([23, 0, 0])
        difference() {
            M4_slide_tnut_3030_new();

            translate([10, 0, 0])
            cube([10, 20, 20], center=true);
        }

        translate([11, 0, 5/2])
        cube([8, 7, 5], center=true);
    }
}

module MK3_cheapass_filament_gauge_arm() {
    h = 3;

    difference() {
        union() {
            cylinder(d=13, h=5, $fn=60);

            translate([2.57, 10, 0])
            cylinder(d=13, h=5, $fn=60);

            hull() {
                cylinder(d=8, h=h, $fn=60);

                translate([2.57, 10, 0])
                cylinder(d=8, h=h, $fn=60);
            }

            hull() {
                cylinder(d=6, h=h, $fn=60);

                translate([0, -98, 0])
                cylinder(d=4, h=h, $fn=60);

                translate([0, -109, 0])
                cylinder(d=0.5, h=1, $fn=60);
            }
        }

        translate([0, 0, 1])
        rotate([0, 0, 39])
        _623zz_bearing_hole();

        translate([2.57, 10, 1])
        rotate([0, 0, 3])
        _623zz_bearing_hole();

        hull() {
            translate([0, 0, 1])
            cylinder(d=3, h=5, $fn=30);

            translate([2.57, 10, 1])
            cylinder(d=3, h=5, $fn=30);
        }

        translate([0, 0, -1])
        cylinder(d=6.3, h=5, $fn=30);

        translate([2.57, 10, -1])
        cylinder(d=6.3, h=5, $fn=30);
    }
}

module MK3_cheapass_filament_gauge_small_arm() {
    difference() {
        union() {
            cylinder(d=13, h=5, $fn=60);

            translate([26, 0, 0])
            cylinder(d=10, h=6, $fn=60);

            hull() {
                cylinder(d=8, h=3, $fn=60);

                translate([26, 0, 0])
                cylinder(d=8, h=3, $fn=60);
            }
        }

        translate([0, 0, 1])
        _623zz_bearing_hole();

        translate([0, 0, -1])
        cylinder(d=6.3, h=5, $fn=30);

        translate([26, 0, -1])
        cylinder(d=2.8, h=25, $fn=30);
    }
}

module MK3_cheapass_filament_gauge_test_sticks() {
    union() {
        translate([0, 0, 2.4/2])
        chamfered_cube(
            120, 1.75, 2.4, 0.3, center=true
        );

        translate([0, -5, 2.4/2])
        chamfered_cube(
            120, 1.5, 2.4, 0.3, center=true
        );

        translate([0, 5, 2.4/2])
        chamfered_cube(
            120, 2, 2.4, 0.3, center=true
        );

        translate([-57.2, 0, 0.2/2])
        cube([5, 18, 0.2], center=true);

        translate([57.2, 0, 0.2/2])
        cube([5, 18, 0.2], center=true);

    }
}