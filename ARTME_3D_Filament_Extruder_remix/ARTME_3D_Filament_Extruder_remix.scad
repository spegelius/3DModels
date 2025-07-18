use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
use <../PCParts/common.scad>;
use <../lib/bearings.scad>;

use <../M4_slide_t-nut_3030_remix/M4_slide_t-nut_3030_remix.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path,
    "ARTME 3D MK3/"
);


//_orig_MK3_ed_c();
//_orig_MK3_el_h();
//_orig_MK3_so_a();

//_MK3_ed_c_supports();
//_623zz_bearing_hole();

//debug_MK3_cheapass_filament_gauge();

//MK3_ed_c_supports();
//MK3_ed_c_supports_soluble();

//MK3_pu_b_gauge();

//MK3_cheapass_filament_gauge();
//MK3_cheapass_filament_gauge_tnut();
//MK3_cheapass_filament_gauge_arm();
//MK3_cheapass_filament_gauge_arm(bearings=false);
//MK3_cheapass_filament_gauge_small_arm();
//MK3_cheapass_filament_gauge_small_arm(bearings=false);
//MK3_cheapass_filament_gauge_test_sticks();

//MK3_el_h_40mm_fan_addition();
//MK3_en_a_250micron_mesh();

MK3_fixed_filament_hook();


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

module _orig_MK3_en_a() {
    translate([0, 0, 22.71])
    import(
        str(
            spath,
            "EN (Extruder Nozzle)/",
            "en-a.stl"
        ),
        convexity=10
    );  
}

module _orig_MK3_el_h() {
    import(
        str(
            spath,
            "EL (Electronics)/",
            "el-h.stl"
        ),
        convexity=10
    );  
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

module _orig_MK3_so_a() {
    import(
        str(
            spath,
            "SO (Sensor Optical)/",
            "so-a.stl"
        ),
        convexity=10
    );
}

module _MK3_assembly() {
    color("darkslategrey")
    render()
    translate([-75, -27, 40])
    rotate([0, 90, 0])
    import(
        str(
            stl_base_path,
            "3030 Extrusion/",
            "3030 X 150.stl"
        ), convexity=10
    );

    // puller
    translate([6.5, -22, 34.4])
    rotate([0, 0, 180])
    mock_stepper_motor();

    translate([46.5 - 40, -17.5, 26])
    rotate([-90, 0, 0])
    _orig_MK3_pu_a();

    %translate([6.5, -33.55, 14])
    rotate([-90, 0, 0])
    _orig_MK3_pu_c();

    translate([7.4, -16, -5])
    rotate([90, 0, 90])
    _orig_MK3_pu_e();

    translate([-20, -100, -70])
    rotate([80, 0, -90])
    _orig_MK3_el_h();

    translate([-20, -100, -70])
    rotate([80, 0, -90])
    translate([0, 0, -2])
    rotate([0, 180, 0])
    MK3_el_h_40mm_fan_addition();

    // puller gear
    translate([6.5, -45, 55.5])
    rotate([90, 0, 0])
    tube(13, 10, 4, $fn=60);
}

module debug_MK3_cheapass_filament_gauge() {
    gap = 0;
    //gap = 1.35;
    //gap = 1.5;
    //gap = 1.75;
    //gap = 2;

    //bearings = false;
    bearings = true;

    angle1 = gap/(2*PI*15.5)*360;

    _MK3_assembly();

    translate([22, -43, 40.05])
    rotate([0, -91.8, 0])
    //_orig_MK3_pu_b();
    rotate([0, angle1, 0])
    union() {
        MK3_pu_b_gauge();

        // bearing
        %translate([15.5, -4.4, 2])
        rotate([90, 0, 0])
        tube(13, 5, 4.5, $fn=60);
    }

//    %translate([22, -43, 40.05])
//    rotate([90, 0, 0,])
//    tube(57*2 + 2, 10, 1, $fn=100);

    color("darkgrey")
    render()
    translate([6.5 + 13/2 + gap/2, -49, 55.5])
    cube([gap, 2, 10], center=true);

    render()
    translate([55, -15, -8])
    rotate([90, 0, 0])
    MK3_cheapass_filament_gauge();

    render()
    translate([42, -6, 15])
    rotate([90, 0, 0])
    MK3_cheapass_filament_gauge_tnut();

    if (gap == 1.75) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, 3.15, 0])
        MK3_cheapass_filament_gauge_arm(
            bearings=bearings
        );

        color("darkgrey")
        translate([32.365, -26.8, 96.4])
        rotate([90, 7.85, 0])
        MK3_cheapass_filament_gauge_small_arm(
            bearings=bearings
        );
    } else if (gap == 2) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, 8.45, 0])
        MK3_cheapass_filament_gauge_arm(
            bearings=bearings
        );

        color("darkgrey")
        translate([33.28, -26.8, 96.22])
        rotate([90, 8.2, 0])
        MK3_cheapass_filament_gauge_small_arm(
            bearings=bearings
        );
    } else if (gap == 1.5) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, -2, 0])
        MK3_cheapass_filament_gauge_arm(
            bearings=bearings
        );

        color("darkgrey")
        translate([31.45, -26.8, 96.55])
        rotate([90, 7.65, 0])
        MK3_cheapass_filament_gauge_small_arm(
            bearings=bearings
        );
    } else if (gap == 1.35) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, -5.05, 0])
        MK3_cheapass_filament_gauge_arm(
            bearings=bearings
        );

        color("darkgrey")
        translate([30.91, -26.8, 96.645])
        rotate([90, 7.65, 0])
        MK3_cheapass_filament_gauge_small_arm(
            bearings=bearings
        );
    } else if (gap == 0) {
        color("darkgrey")
        translate([55, -21.4, 83])
        rotate([90, -33.9, 0])
        MK3_cheapass_filament_gauge_arm(
            bearings=bearings
        );

        color("darkgrey")
        translate([25.95, -26.8, 97.2])
        rotate([90, 9.9, 0])
        MK3_cheapass_filament_gauge_small_arm(
            bearings=bearings
        );
    }
}

module _623zz_bearing_hole() {
    d = 10;

    difference() {
        cylinder(d=d + 0.1, h=7, $fn=60);

        // for angle debugging
        //cylinder(d=2.8, h=7, $fn=60);

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

            translate([41, -11, -8])
            cube([40, 2, 2.4], center=true);

            translate([41, -3, -8])
            cube([40, 2, 2.4], center=true);

            translate([59, -1, -8])
            cube([4, 22, 6], center=true);

            hull() {
                translate([50, -2.5, -9.49])
                cube([22, 1, 4], center=true);

                translate([56, 9.1, -9.49])
                cube([10, 3, 4], center=true);
            }

//            translate([57, 6.6, -5.75])
//            rotate([90, 0, 0])
//            cylinder(d=5.3, h=10.6, center=true, $fn=40);

            translate([57, 6.3, -5.75])
            rotate([90, 0, 0])
            cylinder(d=10, h=8.6, center=true, $fn=40);

            translate([57, 6.8 - 9.6/2, -5.75])
            rotate([90, 0, 0])
            cylinder(
                d1=10, d2=1, h=3.7, $fn=40
            );
        }

        translate([57, 8, -5.75])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=17, center=true, $fn=40);
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
            translate([-18, -28, 0])
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
            translate([-10, -30.5, 0])
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
            translate([2, -30, 0])
            rotate([0, 0, 35])
            linear_extrude(4)
            text("1.5", size=4, font="Arial:style=Bold");

            // 1.35mm mark
            color("black")
            translate([9.65, -18.4, 4/2])
            rotate([0, 0, 8])
            cube([1, 2, 4], center=true);

            color("black")
            translate([10, -29.5, 0])
            rotate([0, 0, 35])
            linear_extrude(4)
            text("1.35", size=4, font="Arial:style=Bold");
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
        cylinder(d=7.6, h=20, $fn=40);
        
        translate([-13, 23, 1.4])
        cylinder(d=7.6, h=20, $fn=40);

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

module MK3_cheapass_filament_gauge_arm(
    bearings=true
) {
    h = 3;

    difference() {
        union() {
            if (bearings) {
                cylinder(d=13, h=5, $fn=60);

                translate([2.57, 10, 0])
                cylinder(d=13, h=5, $fn=60);
            } else {
                cylinder(d=10, h=5, $fn=60);

                translate([2.57, 10, 0])
                cylinder(d=10, h=5, $fn=60);
            }

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

        if (bearings) {
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
        } else {

            translate([0, 0, -1])
            cylinder(d=3, h=15, $fn=30);

            translate([2.57, 10, -1])
            cylinder(d=3, h=15, $fn=30);
        }
    }
}

module MK3_cheapass_filament_gauge_small_arm(
    bearings=true
) {
    difference() {
        union() {
            if (bearings) {
                cylinder(d=13, h=5, $fn=60);
            } else {
                cylinder(d=10, h=5, $fn=60);
            }

            translate([26, 0, 0])
            cylinder(d=10, h=6, $fn=60);

            hull() {
                cylinder(d=8, h=3, $fn=60);

                translate([26, 0, 0])
                cylinder(d=8, h=3, $fn=60);
            }
        }

        if (bearings) {
            translate([0, 0, 1])
            _623zz_bearing_hole();

            translate([0, 0, -1])
            cylinder(d=6.3, h=5, $fn=30);
        } else {
            translate([0, 0, -1])
            cylinder(d=3, h=15, $fn=30);
        }

        translate([26, 0, -1])
        cylinder(d=2.8, h=25, $fn=30);
    }
}

module MK3_cheapass_filament_gauge_test_sticks() {
    union() {
        translate([0, 1, 2.4/2])
        chamfered_cube(
            120, 1.75, 2.4, 0.3, center=true
        );

        translate([0, -2.5, 2.4/2])
        chamfered_cube(
            120, 1.5, 2.4, 0.3, center=true
        );

        translate([0, -5, 2.4/2])
        chamfered_cube(
            120, 1.35, 2.4, 0.3, center=true
        );        

        translate([0, 5, 2.4/2])
        chamfered_cube(
            120, 2, 2.4, 0.3, center=true
        );

        // brims
        translate([-57.2, 0, 0.2/2])
        cube([5, 18, 0.2], center=true);

        translate([57.2, 0, 0.2/2])
        cube([5, 18, 0.2], center=true);
    }
}

module MK3_el_h_40mm_fan_addition() {
//    %rotate([0, 180, 0])
//    _orig_MK3_el_h();

    difference() {
        hull() {
            translate([50, 27])
            rounded_cube_side(
                50, 15, 4, 4, center=true, $fn=30
            );

            translate([50, -17])
            rounded_cube_side(
                43, 10, 4, 6, center=true, $fn=30
            );
        }

        translate([50, 51, 0])
        cylinder(d2=52, d1=49, h=5, center=true, $fn=50);

        translate([50, 1, 0])
        cylinder(d2=42, d1=39, h=5, center=true, $fn=50);

        translate([50, 1, 0])
        fan_mount_holes(40, h_d=2.7, h=100);

        translate([50 - 20.43, 30.57, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);

        translate([50 + 20.43, 30.57, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);
    }
}

module MK3_en_a_250micron_mesh() {

    // original mesh thickness = 0.35mm, new 0.25mm

    // approximate scaling
    scaling = 8.75/8.6;

    union() {
        difference() {
            _orig_MK3_en_a();
            cylinder(d=8.7, h=20, $fn=50);

            rotate([0, 0, -90])
            translate([-11, 7, 3.6])
            linear_extrude(1)
            text(text="0.25", size=8);
        }

        scale([scaling, scaling, 1])
        intersection() {
            _orig_MK3_en_a();
            cylinder(d=8.6, h=20, $fn=80);
        }
    }
}

module MK3_fixed_filament_hook() {

    %translate([0, 1.52, 64])
    _orig_MK3_so_a();

    difference() {
        union() {
            translate([0, 0, 3/2])
            chamfered_cube(
                100, 24, 3, 0.5, center=true
            );

            translate([100/2 - 7, 0, 0])
            cylinder(d=6.5, h=4, $fn=30);
        }

        translate([100/2 - 7, 0, 0])
        cylinder(d=4.2, h=10, center=true, $fn=30);
    }
}