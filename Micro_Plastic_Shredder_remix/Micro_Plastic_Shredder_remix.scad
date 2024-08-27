use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Micro Plastic Shredder/"
);


//_orig_body();
//_orig_hopper();
//_orig_bottle();
//_orig_plunger();

//debug();
//debug_reinforcement();
//debug_hopper_extension();
//debug_jar_adapter();
//debug_plunger();
//_supports();


//ChopSueySlim_BodyV2_1();
//ChopSueySlim_BodyV2_1_special();

//ChopSueySlim_BodyV2_reinforcement();

//ChopSueySlim_BodyV2_1_supports();
//ChopSueySlim_BodyV2_1_supports_soluble();

//ChopSueySlim_Hopper_big();
//ChopSueySlim_Hopper_big_clamp_1();
//ChopSueySlim_Hopper_big_clamp_2();

//ChopSueySlim_Plunger_v2();
//ChopSueySlim_Plunger_v2(15);

//ChopSueySlim_output_extension();

//ChopSueySlim_jar_adapter();

test_holes_special();


module _orig_body() {
    import(
        str(spath, "ChopSueySlim-BodyV2.stl"),
        convexity=10
    );
}

module _orig_hopper() {
    translate([112.4, 321, 0])
    import(
        str(spath, "ChopSueySlim-Hopper.stl"),
        convexity=10
    );
}

module _orig_bottle() {
    translate([21.5, 330, 0])
    import(
        str(spath, "ChopSueySlim-Bottle.stl"),
        convexity=10
    );
}

module _orig_plunger() {
    translate([72, 283, 0])
    import(
        str(spath, "ChopSueySlim-Plunger.stl"),
        convexity=10
    );
}


module _router_bit() {
    union() {
        cylinder(d=6.35, h=93.5, $fn=40);

        translate([0, 0, 39.3])
        cylinder(d=12.7, h=5, $fn=60);

        translate([0, 0, 93.5 - 8.8])
        cylinder(d=12.7, h=5, $fn=60);

        translate([0, 0, 41])
        cylinder(d=10.4, h=44, $fn=30);

        translate([0, 0, 63])
        cube([0.1, 12.68, 44], center=true);
    }
}

module debug() {
    intersection() {
        union() {
            _orig_body();
            //ChopSueySlim_BodyV2_1();
            //ChopSueySlim_BodyV2_1_special();

            //_supports();
        }

        translate([0, 200/2 - 22, 0])
        cube([300, 200, 300], center=true);
    }

//    color("grey")
//    translate([56.62 - 12.7/2 - 1/2 - 0.02, -19.875, 60/2 + 9])
//    cube([1, 17, 60], center=true);

//    ChopSueySlim_BodyV2_1_supports();

    //color("lightgrey")
    //ChopSueySlim_BodyV2_1_supports_soluble();

//    color("grey")
//    translate([56.62, -22, -31])
//    _router_bit();

    #translate([65.65, -60, 54])
    rotate([90, 0, 0])
    cylinder(d=4, h=20, center=true, $fn=30);
}

module debug_reinforcement() {
    ChopSueySlim_BodyV2_1();

    translate([28, -20, 54.7/2 + 5 + 0.3/2])
    rotate([0, 90, 0])
    ChopSueySlim_BodyV2_reinforcement();
}

module debug_hopper_extension() {
//    translate([0, 0, -5.65])
//    rotate([0, 76.86, 0])

    translate([0, 0, -100])
    _orig_hopper();

    // mouth size testing
//    %translate([0, 0, 10])
//    cube([30, 55, 1], center=true);

    %ChopSueySlim_Hopper_extension();

    rotate([180, 0, 0])
    ChopSueySlim_Hopper_extension_clamp_1();
}

module debug_jar_adapter() {
    intersection() {
        ChopSueySlim_jar_adapter();

        translate([0, 200/2, 0])
        cube([100, 200, 300], center=true);
    }

    translate([0, 0, -51])
    ChopSueySlim_output_extension();
}

module debug_plunger() {
    _orig_body();

    intersection() {
        translate([56.62, 19, 32.25])
        rotate([-90, 0, 0])
        _orig_hopper();

        cube([300, 300, 60], center=true);
    }

    intersection() {
        translate([56.62, 64, 18])
        //_orig_plunger();
        ChopSueySlim_Plunger_v2();

        //cube([300, 200, 160], center=true);
    }
}

module ChopSueySlim_BodyV2_1() {
    difference() {
        _orig_body();

        // bearing holes
        translate([56.62, -22, 0])
        cylinder(d=12.9, h=30, center=true, $fn=100);

        translate([56.62, -22, 60])
        cylinder(d=12.9, h=20, center=true, $fn=100);

        translate([56.62, -22, 0])
        cylinder(d=19.2, h=16.01, center=true, $fn=100);

        // trim bearing holes
        translate([56.62 - 6, -22, 100/2])
        cube([2, 5.5, 100], center=true);

        // chamfers
        translate([56.62, -22, 0])
        cylinder(d1=21.3, d2=18.9, h=1.2, center=true, $fn=50);

//        translate([56.62, -22, 8])
//        cylinder(d1=15, d2=12.6, h=1.2, center=true, $fn=50);

        translate([56.62, -22, 60])
        cylinder(d1=12.6, d2=15, h=1.2, center=true, $fn=50);

    }
}

module ChopSueySlim_BodyV2_1_special() {
    difference() {
        ChopSueySlim_BodyV2_1();

        // bigger metal plate cut
        translate([
            56.62 - 12.7/2 - 1.35/2 - 0.02,
            -21.2, 100/2 + 8
        ])
        cube([1.35, 23.8, 100], center=true);
    }
}

module ChopSueySlim_BodyV2_reinforcement() {
    // TODO someday
    difference() {
        translate([0, 0, 10/2])
        cube([54.7, 30, 10], center=true);

        translate([-23, 10, 0])
        cylinder(d=2.5, h=30, center=true, $fn=30);

        translate([23, 10, 0])
        cylinder(d=2.5, h=30, center=true, $fn=30);

        translate([0, 10, 0])
        cylinder(d=2.5, h=30, center=true, $fn=30);

        translate([-23, -10, 0])
        cylinder(d=2.5, h=30, center=true, $fn=30);

        translate([23, -10, 0])
        cylinder(d=2.5, h=30, center=true, $fn=30);

        translate([0, -10, 0])
        cylinder(d=2.5, h=30, center=true, $fn=30);
    }
}

module _supports() {
    // bottom bearing hole
    translate([56.62, -22, 0])
    difference() {
        hull() {
            cylinder(d=15, h=1, $fn=30);

            translate([0, 0, 7])
            cylinder(d=18.7, h=1, $fn=30);
        }

        hull() {
            translate([0, 0, 0.2])
            cylinder(d=13.6, h=0.1, $fn=30);

            translate([0, 0, 6])
            cylinder(d=12, h=1, $fn=30);

            translate([0, 0, 4])
            cylinder(d=15.7, h=0.1, $fn=30);
        }

        translate([0, 0, -1])
        cylinder(d=10, h=3, $fn=30);

        translate([0, 0, 6])
        cylinder(d=12, h=3, $fn=30);
    }

    module _support_block() {
        spheres_1 = [
            [9/2, 30/2, 0.6/2],
            [11.2/2, 30/2 + 4.2, 35 - 0.6/2],
            [-9/2, 30/2, 0.6/2],
            [-11.2/2, 30/2 + 4.2, 35 - 0.6/2]
        ];

        spheres_2 = [
            [9/2, 30/2 - 6, 0.6/2],
            [11.2/2, 30/2 - 6 + 2, 35 - 0.6/2],
            [-9/2, 30/2 - 6, 0.6/2],
            [-11.2/2, 30/2 - 6 + 2, 35 - 0.6/2]
        ];

        spheres_3 = [
            [9/2, 30/2 - 12, 0.6/2],
            [11.2/2, 30/2 - 12 + 1, 35 - 0.6/2],
            [-9/2, 30/2 - 12, 0.6/2],
            [-11.2/2, 30/2 - 12 + 1, 35 - 0.6/2]
        ];

        s_spheres_1 = [
            spheres_1[0],
            spheres_1[1],
            spheres_2[0],
            spheres_2[1],
        ];

        s_spheres_2 = [
            spheres_2[2],
            spheres_2[3],
            spheres_3[2],
            spheres_3[3],
        ];

        s_spheres_3 = [
            spheres_3[0],
            spheres_3[1],
            [9/2, -1, 0.6/2],
            [12/2, -1, 35 - 0.6/2],
        ];

        union() {
            translate([0, 0, 1/2])
            cube([10.2, 31, 1], center=true);

            // 1
            hull() {
                for(i = spheres_1) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            mirror([0, 1, 0])
            hull() {
                for(i = spheres_1) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            // 2
            hull() {
                for(i = spheres_2) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            mirror([0, 1, 0])
            hull() {
                for(i = spheres_2) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            // 3
            hull() {
                for(i = spheres_3) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            mirror([0, 1, 0])
            hull() {
                for(i = spheres_3) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            // side 1
            hull() {
                for(i = s_spheres_1) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            mirror([0, 1, 0])
            hull() {
                for(i = s_spheres_1) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            // side 2
            hull() {
                for(i = s_spheres_2) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            mirror([0, 1, 0])
            hull() {
                for(i = s_spheres_2) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            // side 3
            hull() {
                for(i = s_spheres_3) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }

            mirror([0, 1, 0])
            hull() {
                for(i = s_spheres_3) {
                    translate(i)
                    sphere(d=0.6, $fn=15);
                }
            }
        }
    }

    // main chute
    union() {
        hull() {
            translate([56.62, -22, 50 - 0.3/2])
            cube([12.6, 83, 0.3], center=true);

            translate([56.62, -22, 50 - 1.25 + 0.1/2])
            cube([11.8, 83, 0.1], center=true);
        }

        translate([56.62, 0, 15])
        _support_block();

        translate([56.62, -44, 15])
        _support_block();

        hull() {
            translate([56.62 - 11.2/2 + 0.05, -44/2, 49])
            cube([0.6, 5.8, 0.1], center=true);

            translate([56.62 - 11.2/2 + 0.12, -44/2, 47])
            cube([0.6, 6.4, 0.1], center=true);
        }
    }
}

module ChopSueySlim_BodyV2_1_supports() {
    intersection() {
        _supports();

        union() {
            translate([0, 0, 15.5 + 34/2])
            cube([200, 200, 34], center=true);

            cube([200, 200, 15], center=true);
        }
    }
}

module ChopSueySlim_BodyV2_1_supports_soluble() {
    difference() {
        _supports();

        translate([0, 0, 15.5 + 34/2])
        cube([200, 200, 34], center=true);

        cube([200, 200, 15], center=true);
    }
}

module test_holes_special() {
    intersection() {
        ChopSueySlim_BodyV2_1_special();

        translate([56.62, -22, 0])
        cube([35, 35, 30], center=true);
    }
}

module ChopSueySlim_Hopper_big() {
    bottom_w = 28.8;
    bottom_d = 53.8;

    top_w = bottom_w * 5;
    top_d = bottom_d * 3;

    h = 100;

    module _form(
        b_w, b_d, t_w, t_d, h, d_b, d_t
    ) {
        hull() {
            translate([-b_w/2, -b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([b_w/2, -b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([-b_w/2, b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([b_w/2, b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([-t_w/2, -t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([t_w/2, -t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([-t_w/2, t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([t_w/2, t_d/2, h])
            sphere(d=d_t, $fn=30);
        }
    
    }

    difference() {
        union() {
            intersection() {
                _form(
                    bottom_w, bottom_d, top_w, top_d, h, 5.2, 10
                );

                cylinder(d=1000, h=h - 2);
            }

            translate([0, 0, 30/2])
            rounded_cube_side(
                50, 72.5, 30, 5, center=true, $fn=30
            );
        }

        translate([0, 0, -0.1])
        _form(
            bottom_w, bottom_d,
            top_w, top_d, h + 0.2, 1, 6
        );

        translate([21, 32, 0])
        cylinder(d=4, h=12, center=true, $fn=30);

        translate([-21, 32, 0])
        cylinder(d=4, h=12, center=true, $fn=30);

        translate([21, -32, 0])
        cylinder(d=4, h=12, center=true, $fn=30);

        translate([-21, -32, 0])
        cylinder(d=4, h=12, center=true, $fn=30);
    }
}

module _ChopSueySlim_Hopper_big_clamp() {

    difference() {
        union() {
            hull() {
                translate([0, 0, 3/2])
                rounded_cube_side(
                    50, 72.5, 3, 5, center=true, $fn=30
                );

                translate([0, 0, 12/2])
                rounded_cube_side(
                    37, 59.5, 12, 5, center=true, $fn=30
                );
            }

            hull() {
                translate([-25, 0, 7])
                rotate([90, 0, 0])
                cylinder(d=10, h=24, center=true, $fn=60);

                translate([25, 0, 7])
                rotate([90, 0, 0])
                cylinder(d=10, h=24, center=true, $fn=60);

                translate([0, 0, 1/2])
                cube([51, 24, 1], center=true);
            }
        }

        // hopper end cut
        translate([0, 0, 11.9])
        rotate([180, 0, 0])
        scale([1.01, 1.01, 1])
        hull()
        intersection() {
            translate([0, 0, -88])
            _orig_hopper();

            translate([0, 0, -1])
            cylinder(d=100, h=13);
        }

        // mount holes
        translate([21, 32, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

        translate([-21, 32, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

        translate([21, -32, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

        translate([-21, -32, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

        translate([21, 32, 3.5])
        cylinder(d=9, h=10, $fn=30);

        translate([-21, 32, 3.5])
        cylinder(d=9, h=10, $fn=30);

        translate([21, -32, 3.5])
        cylinder(d=9, h=10, $fn=30);

        translate([-21, -32, 3.5])
        cylinder(d=9, h=10, $fn=30);

        // join holes
        translate([25, 0, 7])
        rotate([90, 0, 0])
        cylinder(d=3.4, h=25, center=true, $fn=60);

        translate([-25, 0, 7])
        rotate([90, 0, 0])
        cylinder(d=3.4, h=25, center=true, $fn=60);
    }
}

module ChopSueySlim_Hopper_big_clamp_1() {
    difference() {
        intersection() {
            _ChopSueySlim_Hopper_big_clamp();

            translate([0, 100/2 + 0.2, 0])
            cube([100, 100, 100], center=true);
        }

        translate([25, 15, 7])
        rotate([90, 30, 0])
        M3_nut_tapering(7, cone=false);

        translate([-25, 15, 7])
        rotate([90, 30, 0])
        M3_nut_tapering(7, cone=false);

        translate([25, 27, 7])
        rotate([90, 30, 0])
        cylinder(d=7, h=30, center=true, $fn=60);

        translate([-25, 27, 7])
        rotate([90, 30, 0])
        cylinder(d=7, h=30, center=true, $fn=60);
    }
}

module ChopSueySlim_Hopper_big_clamp_2() {
    difference() {
        intersection() {
            _ChopSueySlim_Hopper_big_clamp();

            translate([0, -100/2 - 0.2, 0])
            cube([100, 100, 100], center=true);
        }

        translate([25, -22, 7])
        rotate([90, 30, 0])
        cylinder(d=7, h=30, center=true, $fn=60);

        translate([-25, -22, 7])
        rotate([90, 30, 0])
        cylinder(d=7, h=30, center=true, $fn=60);
    }
}

module ChopSueySlim_output_extension() {
    //%_orig_bottle();

    difference() {
        union() {
            translate([0, 0, 51/2])
            rounded_cube_side(
                33, 55, 51, 3, center=true, $fn=30
            );

        }

        cube([15, 36, 200], center=true);

        translate([0, 0, 3 + 100/2])
        cube([25, 36, 100], center=true);

        translate([-9, 21.5, -1])
        cylinder(d=3.4, h=5, $fn=30);

        translate([9, 21.5, -1])
        cylinder(d=3.4, h=5, $fn=30);

        translate([-9, -21.5, -1])
        cylinder(d=3.4, h=5, $fn=30);

        translate([9, -21.5, -1])
        cylinder(d=3.4, h=5, $fn=30);

        hull() {
            translate([-9, 21.5, 3])
            cylinder(d=7, h=4, $fn=30);

            translate([-9, 14, 51])
            cylinder(d=7, h=1, $fn=30);

        }

        hull() {
            translate([-9, -21.5, 3])
            cylinder(d=7, h=4, $fn=30);

            translate([-9, -14, 51])
            cylinder(d=7, h=1, $fn=30);

        }

        hull() {
            translate([9, 21.5, 3])
            cylinder(d=7, h=1, $fn=30);

            translate([9, 14, 51])
            cylinder(d=7, h=1, $fn=30);
        }

        hull() {
            translate([9, -21.5, 3])
            cylinder(d=7, h=1, $fn=30);

            translate([9, -14, 51])
            cylinder(d=7, h=1, $fn=30);
        }
 
        translate([9, 21.5, 51])
        cylinder(d=4, h=16, center=true, $fn=30);

        translate([9, -21.5, 51])
        cylinder(d=4, h=16, center=true, $fn=30);

        translate([-9, 21.5, 51])
        cylinder(d=4, h=16, center=true, $fn=30);

        translate([-9, -21.5, 51])
        cylinder(d=4, h=16, center=true, $fn=30);
    }
}

module ChopSueySlim_jar_adapter() {
    difference() {
        cylinder(d=66, h=21, $fn=50);

        translate([0, 0, 3])
        difference() {
            cylinder(d=62.8, h=23, $fn=50);

            difference() {
                cylinder(d=70, h=23);

                v_screw(
                    h=24,
                    screw_d=65.5,
                    pitch=4,
                    direction=0,
                    steps=80,
                    depth=1
                );
            }
        }

        hull() {
            cube([25.2, 37, 0.1], center=true);

            translate([0, 0, 3])
            cube([26.2, 38, 0.1], center=true);
        }
        
        translate([9, 21.5, 0])
        cylinder(d=3.4, h=16, center=true, $fn=30);

        translate([9, -21.5, 0])
        cylinder(d=3.4, h=16, center=true, $fn=30);

        translate([-9, 21.5, 0])
        cylinder(d=3.4, h=16, center=true, $fn=30);

        translate([-9, -21.5, 0])
        cylinder(d=3.4, h=16, center=true, $fn=30);
    }
}

module ChopSueySlim_Plunger_v2(h=28) {
    //%_orig_plunger();

    union() {
        intersection() {
            translate([0, 0, h/2])
            cube([4, 150, h], center=true);

            union() {
                translate([0, 150/2 - 50/2, h/2])
                rotate([0, 90, 0])
                cylinder(d=50, h=20, center=true, $fn=80);

                translate([0, -20, 0])
                cube([20, 110, 80], center=true);
            }
        }

        translate([0, 57.5, h/2])
        cube([30, 2, h], center=true);

        translate([0, 57, 0])
        intersection() {
            tube(30, h, 3, $fn=40);

            translate([0, -40/2, 0])
            cube([40, 40, 100], center=true);
        }

        hull() {
            translate([0, -150/2, h/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                9, h, 2, 2.5, center=true
            );

            translate([0, -150/2 + 9, h/2])
            cube([4, 1, h], center=true);
        }

    }
}