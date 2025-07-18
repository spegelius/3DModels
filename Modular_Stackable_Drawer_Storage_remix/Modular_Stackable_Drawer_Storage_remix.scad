use <../Dollo/NEW_long_ties/include.scad>;

wall = 1.4;


//_orig_drawer_frame_1U();
//_orig_drawer_frame_2U();
//_orig_drawer_frame_3U();
//_orig_drawer_cap_topper();

//_orig_drawer_1U_2x1();
//_orig_drawer_1U_2x2();
//_orig_drawer_1U_3x1();
//_orig_drawer_1U_3x3();
//_orig_drawer_1U_4x1();
//_orig_drawer_1U_4x4();
//_orig_drawer_1U_5x5();

//_orig_drawer_2U();

//_orig_drawer_3U();

//debug_drawer_frame();
//debug_drawer();


//drawer_frame_1U_v2();
//drawer_frame_2U_v2();
//drawer_frame_3U_v2();

//drawer_1U_2x1_v2();
//drawer_1U_2x2_v2();
//drawer_1U_3x1_v2();
//drawer_1U_3x3_v2();
//drawer_1U_4x1_v2();
//drawer_1U_4x4_v2();
//drawer_1U_5x5_v2();

//drawer_2U_2x2();
//drawer_2U_1x2();

//drawer_3U_1x2();

//drawer_cap_v2();
//drawer_cap_topper_v2();

frame_bottom_nut_block();


module _orig_drawer_frame_1U() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer Frame 1U.stl",
        convexity=10
    );
}

module _orig_drawer_frame_2U() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer Frame 2U.stl",
        convexity=10
    );
}

module _orig_drawer_frame_3U() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer Frame 3U.stl",
        convexity=10
    );
}

module _orig_drawer_frame_3U() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer Frame 3U.stl",
        convexity=10
    );
}

module _orig_drawer_1U_2x1() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 2x1.stl",
        convexity=10
    );
}

module _orig_drawer_1U_2x2() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 2x2.stl",
        convexity=10
    );
}

module _orig_drawer_1U_3x1() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 3x1.stl",
        convexity=10
    );
}

module _orig_drawer_1U_3x3() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 3x3.stl",
        convexity=10
    );
}

module _orig_drawer_1U_4x1() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 4x1.stl",
        convexity=10
    );
}

module _orig_drawer_1U_4x4() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 4x4.stl",
        convexity=10
    );
}

module _orig_drawer_1U_5x5() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 1U 5x5.stl",
        convexity=10
    );
}

module _orig_drawer_2U() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 2U.stl",
        convexity=10
    );
}

module _orig_drawer_3U() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer 3U.stl",
        convexity=10
    );
}

module _orig_drawer_cap() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer Frame Cap.stl",
        convexity=10
    );
}

module _orig_drawer_cap_topper() {
    translate([-250/2, -210/2, 0])
    import(
        "_orig/Drawer Frame Cap Topper.stl",
        convexity=10
    );
}

module debug_drawer_frame() {
    intersection() {
        _orig_drawer_frame_1U();

//        translate([-20.1, 0, 0])
//        cube([250, 250, 200], center=true);

    }

    intersection() {
        translate([0, 0, 35])
        _orig_drawer_frame_1U();

        translate([-21.1, 0, 0])
        cube([250, 250, 200], center=true);
    }

    #translate([108, -92.5, -1])
    cylinder(d=3, h=100, $fn=30);

    #translate([108, -92.5, 50])
    //rotate([0, 0, 30])
    M3_nut();

    translate([107.9, -92.5, 6])
    rotate([180, 0, 0])
    frame_bottom_nut_block();
}

module debug_drawer() {
    intersection() {
        //_orig_drawer_1U_3x3();
        drawer_1U_3x3_v2();

        translate([250/2 + 10, 0, 0])
        cube([250, 250, 200], center=true);
    }

    //%cylinder(d=10, h=1.6);

    //_drawer_form();
    //#_drawer_inner_form();
}

module _bottom_pattern() {
    h = 1.2;
    step = h*2 + 1.3;
    size = sqrt(h*h*2);

    intersection() {
        for(i = [0:99]) {
            translate([0, step/2 + i*step + 1.5, 0])
            rotate([45, 0, 0])
            cube([500, size, size], center=true);

            translate([0, -step/2 - i*step - 1.5, 0])
            rotate([45, 0, 0])
            cube([500, size, size], center=true);
        }

        difference() {
            translate([5, 0, -10])
            cube([185, 187, 200], center=true);

            translate([5, 0, 0])
            cube([5, 300, 300], center=true);

            //cube([300, 6, 300], center=true);
        }
    }
}

module _drawer_form(h=30) {

    module _form() {
        hull() {
            translate([-90, 95, 0])
            chamfered_cylinder(
                10, 200, 0.4, $fn=100
            );

            translate([100, 95, 0])
            chamfered_cylinder(
                10, 200, 0.4, $fn=100
            );

            translate([-90, -95, 0])
            chamfered_cylinder(
                10, 200, 0.4, $fn=100
            );

            translate([100, -95, 0])
            chamfered_cylinder(
                10, 200, 0.4, $fn=100
            );
        }
    }

    union() {
        difference() {
            intersection() {
                _form();
                cylinder(d=2000, h=h);
            }
            _bottom_pattern();
        }

        intersection() {
            _orig_drawer_1U_3x3();

            translate([-104, 0, 0])
            cube([20, 180, 80], center=true);
        }
    }
}

module _drawer_inner_form() {

    c_d = 10 - wall*2;
    chamfer = 2.8;

    hull() {
        translate([-90, 95, 1.6])
        chamfered_cylinder(
            c_d, 200, chamfer, $fn=100
        );

        translate([100, 95, 1.6])
        chamfered_cylinder(
            c_d, 200, chamfer, $fn=100
        );

        translate([-90, -95, 1.6])
        chamfered_cylinder(
            c_d, 200, chamfer, $fn=100
        );

        translate([100, -95, 1.6])
        chamfered_cylinder(
            c_d, 200, chamfer, $fn=100
        );

    }
}

module drawer_frame_1U_v2() {
    h = 40;

    difference() {
        _orig_drawer_frame_1U();

        translate([113.9, 0, h])
        cube([4, 300, 10], center=true);

        translate([102.1, 0, h])
        cube([4, 300, 10], center=true);

        translate([-113.9, 0, h])
        cube([4, 300, 10], center=true);

        translate([-102.1, 0, h])
        cube([4, 300, 10], center=true);


        translate([0, -103.4, h])
        cube([300, 4, 10], center=true);

        translate([0, -81.6, h])
        cube([300, 4, 10], center=true);

        translate([0, 103.4, h])
        cube([300, 4, 10], center=true);

        translate([0, 81.6, h])
        cube([300, 4, 10], center=true);
    }
}

module drawer_frame_2U_v2() {
    h = 75;

    difference() {
        _orig_drawer_frame_2U();

        translate([113.9, 0, h])
        cube([4, 300, 10], center=true);

        translate([102.1, 0, h])
        cube([4, 300, 10], center=true);

        translate([-113.9, 0, h])
        cube([4, 300, 10], center=true);

        translate([-102.1, 0, h])
        cube([4, 300, 10], center=true);


        translate([0, -103.4, h])
        cube([300, 4, 10], center=true);

        translate([0, -81.6, h])
        cube([300, 4, 10], center=true);

        translate([0, 103.4, h])
        cube([300, 4, 10], center=true);

        translate([0, 81.6, h])
        cube([300, 4, 10], center=true);
    }
}

module drawer_frame_3U_v2() {
    h = 110;

    difference() {
        _orig_drawer_frame_3U();

        translate([113.9, 0, h])
        cube([4, 300, 10], center=true);

        translate([102.1, 0, h])
        cube([4, 300, 10], center=true);

        translate([-113.9, 0, h])
        cube([4, 300, 10], center=true);

        translate([-102.1, 0, h])
        cube([4, 300, 10], center=true);


        translate([0, -103.4, h])
        cube([300, 4, 10], center=true);

        translate([0, -81.6, h])
        cube([300, 4, 10], center=true);

        translate([0, 103.4, h])
        cube([300, 4, 10], center=true);

        translate([0, 81.6, h])
        cube([300, 4, 10], center=true);
    }
}

module drawer_1U_2x1_v2() {
    %_orig_drawer_1U_2x1();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_1U_2x2_v2() {
//    %_orig_drawer_1U_2x2();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            translate([5, 0, 0])
            cube([wall, 300, 300], center=true);

            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_1U_3x1_v2() {
    %_orig_drawer_1U_3x1();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            translate([0, -33.05, 0])
            cube([300, wall, 300], center=true);

            translate([0, 33.05, 0])
            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_1U_3x3_v2() {
//    %_orig_drawer_1U_3x3();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            translate([-28, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([38.1, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([0, -33.05, 0])
            cube([300, wall, 300], center=true);

            translate([0, 33.05, 0])
            cube([300, wall, 300], center=true);

        }
    }
}

module drawer_1U_4x1_v2() {
    %_orig_drawer_1U_4x1();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            cube([300, wall, 300], center=true);

            translate([0, -49.6, 0])
            cube([300, wall, 300], center=true);

            translate([0, 49.6, 0])
            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_1U_4x4_v2() {
//    %_orig_drawer_1U_4x4();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            translate([5, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([-44.5, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([54.5, 0, 0])
            cube([wall, 300, 300], center=true);

            cube([300, wall, 300], center=true);

            translate([0, -49.6, 0])
            cube([300, wall, 300], center=true);

            translate([0, 49.6, 0])
            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_1U_5x5_v2() {
    %_orig_drawer_1U_5x5();

    difference() {
        _drawer_form(h=30);

        difference() {
            _drawer_inner_form();

            translate([24.9, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([-14.8, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([64.6, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([-54.5, 0, 0])
            cube([wall, 300, 300], center=true);

            translate([0, 19.9, 0])
            cube([300, wall, 300], center=true);

            translate([0, -19.9, 0])
            cube([300, wall, 300], center=true);

            translate([0, 59.5, 0])
            cube([300, wall, 300], center=true);

            translate([0, -59.5, 0])
            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_2U_2x2() {
    %_orig_drawer_2U();

    difference() {
        _drawer_form(h=65);

        difference() {
            _drawer_inner_form();

            translate([5, 0, 0])
            cube([wall, 300, 300], center=true);

            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_2U_1x2() {
    %_orig_drawer_2U();

    difference() {
        _drawer_form(h=65);

        difference() {
            _drawer_inner_form();

            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_3U_1x2() {
    %_orig_drawer_3U();

    difference() {
        _drawer_form(h=100);

        difference() {
            _drawer_inner_form();

            cube([300, wall, 300], center=true);
        }
    }
}

module drawer_cap_v2() {
    difference() {
        _orig_drawer_cap();

        translate([-5, 0, 0])
        scale([1.06, 1, 1])
        _bottom_pattern();

        difference() {
            union() {
                translate([0, 0, 20/2 + 1.6])
                rounded_cube_side(
                    201, 210 - 4, 20,
                    3, center=true, $fn=40
                );

                translate([0, 0, 20/2 + 1.6])
                rounded_cube_side(
                    221 - 4, 160, 20,
                    3, center=true, $fn=40
                );

                translate([0, 0, 20/2 + 1.6])
                cube([212, 172, 20], center=true);
            }

            translate([-110.5, -95, 0])
            rounded_cube(
                20, 30, 30, 8, center=true, $fn=40
            );

            translate([110.5, -95, 0])
            rounded_cube(
                20, 30, 30, 8, center=true, $fn=40
            );

            translate([-110.5, 95, 0])
            rounded_cube(
                20, 30, 30, 8, center=true, $fn=40
            );

            translate([110.5, 95, 0])
            rounded_cube(
                20, 30, 30, 8, center=true, $fn=40
            );

            rotate([0, 0, 45])
            cube([400, 1, 30], center=true);

            translate([0, 60, 0])
            rotate([0, 0, 45])
            cube([400, 1, 30], center=true);

            translate([0, 120, 0])
            rotate([0, 0, 45])
            cube([400, 1, 30], center=true);

            translate([0, -60, 0])
            rotate([0, 0, 45])
            cube([400, 1, 30], center=true);

            translate([0, -120, 0])
            rotate([0, 0, 45])
            cube([400, 1, 30], center=true);

            rotate([0, 0, -45])
            cube([400, 1, 30], center=true);

            translate([0, 60, 0])
            rotate([0, 0, -45])
            cube([400, 1, 30], center=true);

            translate([0, 120, 0])
            rotate([0, 0, -45])
            cube([400, 1, 30], center=true);

            translate([0, -60, 0])
            rotate([0, 0, -45])
            cube([400, 1, 30], center=true);

            translate([0, -120, 0])
            rotate([0, 0, -45])
            cube([400, 1, 30], center=true);

        }
    }
}

module drawer_cap_topper_v2() {
    difference() {
        _orig_drawer_cap_topper();

        scale([1.09, 1, 1])
        translate([-5, 0, 0])
        _bottom_pattern();

        hull() {
            translate([-119.9, 94, 25])
            chamfered_cube(
                10, 10, 45, 2, center=true
            );

            translate([-119.9, 79, 25])
            chamfered_cube(
                10, 10, 45, 2, center=true
            );

            translate([-119.9, 8, 10])
            chamfered_cube(
                10, 10, 15, 2, center=true
            );
        }

        translate([-119.9, -50, 10])
        chamfered_cube(
            10, 100, 15, 2, center=true
        );

        hull() {
            translate([119.9, 94, 25])
            chamfered_cube(
                10, 10, 45, 2, center=true
            );

            translate([119.9, 79, 25])
            chamfered_cube(
                10, 10, 45, 2, center=true
            );

            translate([119.9, 8, 10])
            chamfered_cube(
                10, 10, 15, 2, center=true
            );
        }

        translate([119.9, -50, 10])
        chamfered_cube(
            10, 100, 15, 2, center=true
        );

        translate([-56, -109.5, 10])
        chamfered_cube(
            108, 10, 15, 2, center=true
        );

        translate([56, -109.5, 10])
        chamfered_cube(
            108, 10, 15, 2, center=true
        );

        translate([-56, 109.5, 25])
        chamfered_cube(
            108, 10, 45, 2, center=true
        );

        translate([56, 109.5, 25])
        chamfered_cube(
            108, 10, 45, 2, center=true
        );
    }
}

module frame_bottom_nut_block() {
    difference() {
        translate([0, 0, 6/2])
        rounded_cube_side(8, 14, 6, 2, center=true, $fn=20);

        translate([0.1, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([0.1, 0, 6.1])
        rotate([180, 0, 30])
        M3_nut_tapering(h=4.3, cone=false, bridging=false);
    }
}