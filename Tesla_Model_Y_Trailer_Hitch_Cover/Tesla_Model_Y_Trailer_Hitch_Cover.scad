use <../Dollo/NEW_long_ties/include.scad>;

// VARIABLES
h = 90.5;
w1 = 381.5;
w2 = 310.5;


// ********** Debug etc models ********
//debug_cover_magnets();
//debug_cover_screws();
//debug_frame_clips();
//debug_frame_clips_flat();
//debug_magnet_screw_cap();

//original_cover();

//_bumper();
//_cover_body();
//_cover_body_flat();
//_cover_body_flat(inner=false);
//_frame_body();
//_frame_body_flat();
//_tesla_logo();


//test_side();
//test_cover_magnet_cap();

// ******** Printable models ********
//side_clips_left();
//side_clips_right();
//bottom_clips();
//top_clips();
//bottom_clips_split_1();
//bottom_clips_split_2();
//top_clips_split_1();
//top_clips_split_2();

//frame();
//frame_flat();
frame_flat(wood_screws=true);

//cover_flat(wood_screws=true, cover_holes=false);
//cover_flat(wood_screws=true, cover_holes=true);

//cover_flat(cover_holes=false);

//cover_flat_logo_1(wood_screws=true, cover_holes=false);
//cover_flat_logo_2(wood_screws=true, cover_holes=false);

//cover_flat_logo_1(wood_screws=true, cover_holes=true);
//cover_flat_logo_2(wood_screws=true, cover_holes=true);

//cover_flat_logo_1(cover_holes=false);
//cover_flat_logo_2(cover_holes=false);

//magnet_clip();
//magnet_screw_cap();
//magnet_screw_cap_tool();
//bolt_holder();
//bolt_spacer();


module debug_cover_magnets() {
    render()
    intersection() {
        translate([0, 0, -24.65 + 3.3])
        frame_flat();

//        translate([200/2 + 79, 0, 0])
//        cube([200, 400, 100], center=true);
    }

    render()
    intersection() {
        cover_flat(wood_screws=false, cover_holes=true);

        translate([200/2 + 79, 0, 0])
        cube([200, 400, 100], center=true);
    }

    translate([79, -28, 5.6])
    rotate([180, 0, 0])
    intersection() {
        magnet_screw_cap();

        translate([50/2, 0, 0])
        cube([50, 50, 20], center=true);
    }

    translate([79, -28, 5])
    mock_M8_bolt();

//    translate([79, -28, 10.6])
//    rotate([0, 0, 0])
//    bolt_holder();

    translate([79, -28, 10.5])
    bolt_spacer();

    // hole clip mockup
//    %union() {
//        translate([0, -40, 0])
//        cylinder(d=49, h=10, center=true);
//
//        translate([0, -40, 0])
//        cube([96, 20.5, 10], center=true);
//    }
}

module debug_cover_screws() {
    intersection() {
        translate([0, 0, -24.65 + 3.3])
        frame_flat(wood_screws=true);

        translate([200/2 + 79, 0, 0])
        cube([200, 400, 100], center=true);
    }

    render()
    intersection() {
        cover_flat(wood_screws=true, cover_holes=true);

        translate([200/2 + 79, 0, 0])
        cube([200, 400, 100], center=true);
    }

    // hole clip mockup
    %union() {
        translate([0, -40, 0])
        cylinder(d=49, h=10, center=true);

        translate([0, -40, 0])
        cube([96, 20.5, 10], center=true);
    }
}

module debug_frame_clips() {
    render()
    frame();

    render()
    translate([w2/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.86, 0])
    translate([2/2, 0, 0])
    _side_clips();

    render()
    mirror([1, 0, 0])
    translate([w2/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.86, 0])
    translate([2/2, 0, 0])
    _side_clips();

    render()
    translate([0, 0.1, 0])
    _top_clips();

    render()
    translate([0, 0.1, 2])
    rotate([0, 180, 0])
    _bottom_clips();
}

module debug_frame_clips_flat() {
    //render()
    rotate([-90 + 13.8, 0, 0])
    frame_flat();

    render()
    translate([w2/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.86, 0])
    translate([2/2, 0, 0])
    _side_clips();

    render()
    mirror([1, 0, 0])
    translate([w2/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.86, 0])
    translate([2/2, 0, 0])
    _side_clips();

    render()
    translate([0, 0.1, 0])
    _top_clips();

    render()
    translate([0, 0.1, 2])
    rotate([0, 180, 0])
    _bottom_clips();

    cover_flat();

    %_magnet_holes();

    %_cover_holes();
}

module debug_magnet_screw_cap() {
//    intersection() {
//        cover_flat(wood_screws=false);
//
//        translate([200/2 + 79, -50])
//        cube([200, 200, 100], center=true);
//    }

    translate([79, -28, 5.6])
    rotate([180, 0, 0])
    intersection() {
        rotate([0, 0, 30])
        magnet_screw_cap();

        translate([50/2, 0, 0])
        cube([50, 50, 20], center=true);
    }

    %translate([79, -28, 1])
    rounded_cylinder(19.6, 3.75, 0.5, $fn=40);

    translate([79, -28.5, 15.7])
    rotate([10, 180, 0])
    magnet_screw_cap_tool();
}

module mock_M8_bolt() {
    union() {
       M8_nut(cone=false);
       cylinder(d=7.81, h=25, $fn=30);
    }
}

module _cover_holes() {
    // for positioning
    //%translate([-159.5, 0, h - 10 - 48/2])
    //cube([36, 50, 2], center=true);

    // electric hole
    translate([-116, 0, 45])
    //rotate([0, 0, 10])
    hull() {

        rotate([90, 0, 0])
        cylinder(d=55, h=100, center=true, $fn=40);

        translate([-55/2 - 2, 0, -28])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=20);
        
        translate([-55/2 - 2, 0, -37])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=20);

        translate([50/2 - 4/2 + 7, 0, -37])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=20);

//        translate([50/2 - 4/2 + 10, 0, 50/2 - 4/2])
//        rotate([90, 0, 0])
//        cylinder(d=4, h=100, center=true, $fn=20);

    }

    // tow hook hole
//    translate([(100 - 71)/2, 0, h/2])
//    rounded_cube(
//        90, 100, 70, 10, center=true, $fn=30
//    );

    hull() {
        translate([-13, 0, h - 24.5])
        rotate([90, 0, 0])
        cylinder(d=30, h=100, center=true, $fn=40);

        translate([-13, 0, 27])
        rotate([90, 0, 0])
        cylinder(d=30, h=100, center=true, $fn=40);

        translate([58, 0, h - 14.5])
        rotate([90, 0, 0])
        cylinder(d=10, h=100, center=true, $fn=40);

        translate([58, 0, 17])
        rotate([90, 0, 0])
        cylinder(d=10, h=100, center=true, $fn=40);
    }
}

module _bumper() {
    intersection() {
        difference() {
            translate([0, 20, 120/2 - 10])
            cube([450, 60, 120], center=true);

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 600, 20, $fn=200);

            _cover_form(d=2.2);
        }
    }
}

module _cover_form(d=2) {
    hull() {
        translate([-w1/2 + 2/2, 0, h - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([w1/2 - 2/2, 0, h - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([-w2/2 + 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([w2/2 - 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);
    }
}

module _cover_form_outer(d=2) {
    hull() {
        translate([-390/2 + 2/2, 0, h - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([390/2 - 2/2, 0, h - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([-319/2 + 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([319/2 - 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);
    }
}

module _cover_body() {
    intersection() {
        difference() {
            _cover_form();

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 600, 20, $fn=200);
        }

        translate([0, 5200/2 - 300 + 24, -25])
        rotate([0, 0, -90])
        donut(5200, 618, 20, $fn=200);
    }
}

module _cover_body_flat(inner=true) {
    intersection() {
        difference() {
            if (inner) {
                _cover_form();
            } else {
                _cover_form_outer();
            }

//            %translate([0, 5200/2 - 300 + 24, -25])
//            rotate([0, 0, -90])
//            donut(5200, 600, 20, $fn=200);

            translate([0, -8.9, 0])
            rotate([13.8, 0, 0])
            cube([450, 60, 300], center=true);
        }

        translate([0, 5200/2 - 300 + 24, -25])
        rotate([0, 0, -90])
        donut(5200, 618, 20, $fn=200);
    }
}

module _tesla_logo() {
    stl_path = "../Tesla_Lug_Nut_Covers_remix/";

    union() {
        translate([-40, -1.6, 0])
        import(str(
            stl_path,
            "new_letter_t.stl"
        ), convexity=10);

        translate([-20, 0, 0])
        import(str(
            stl_path,
            "new_letter_e.stl"
        ), convexity=10);

        //translate([-20, 0, 0])
        import(str(
            stl_path,
            "new_letter_s.stl"
        ), convexity=10);

        translate([20, 0, 0])
        import(str(
            stl_path,
            "new_letter_l.stl"
        ), convexity=10);

        translate([40, 0, 0])
        import(str(
            stl_path,
            "new_letter_a.stl"
        ), convexity=10);
    }
}

module _side_clips() {

    difference() {
        union() {
            translate([-2/2, 0, 0])
            rotate([0, -111.86, 0])
            translate([-w2/2 + 2/2, 0, -2/2])
            intersection() {
                _cover_body();

                hull() {
                    translate([w1/2 - 2/2, 0, h - 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);

                    translate([w2/2 - 2/2, 0, 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);
                }
            }

            // clip 1
            %translate([-24.5, 26.3, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-24.5 - 19/2, 25, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-24.5 + 19/2, 27.3, 0])
            cylinder(d=1, h=4, $fn=10);

            translate([-24.5, 0, 0])
            hull() {
                translate([20/2 - 3/2, 27.3 + 8, 0])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20/2 + 3/2, 25 + 8, 0])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([19.5/2 - 3/2, 27.3 + 17.4, -0.1])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-19.5/2 + 3/2, 25 + 18, -0.1])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([12/2 - 3/2, 27.3 + 22, -0.2])
                chamfered_cylinder(
                    4, 1.6, 0.6, center=true, $fn=20
                );

                translate([-12/2 + 3/2, 25 + 23, -0.2])
                chamfered_cylinder(
                    4, 1.6, 0.6, center=true, $fn=20
                );
            }

            // clip 2
            %translate([-68, 18, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-68 - 22/2, 14.95, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-68 + 22/2, 20.7, 0])
            cylinder(d=1, h=4, $fn=10);
            
            translate([-68, 0, 0])
            hull() {
                translate([22/2 - 3/2, 20.7 + 9, 0])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-22/2 + 3/2, 14.95 + 9, 0])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([21.5/2 - 3/2, 20.7 + 17, -0.1])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-21.5/2 + 3/2, 14.95 + 18, -0.1])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([12/2 - 3/2, 20.7 + 20.3, -0.2])
                chamfered_cylinder(
                    4, 1.6, 0.6, center=true, $fn=20
                );

                translate([-12/2 + 3/2, 14.95 + 24, -0.2])
                chamfered_cylinder(
                    4, 1.6, 0.6, center=true, $fn=20
                );

            }

            // claw 1
            hull() {
                translate([-24.5, 26.3 + 15 + 1, 1.8])
                rotate([0, 90, 8])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-24.5, 26.3 + 15 + 1, 0])
                rotate([0, 0, 8])
                cube([8, 2, 1], center=true);

                translate([-24.5, 26.3 + 15 + 4.4, 0])
                rotate([0, 0, 8])
                cube([8, 1, 1], center=true);
            }

            // claw 2
            hull() {
                translate([-68, 18 + 15 + 1, 1.8])
                rotate([0, 90, 13])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-68, 18 + 15 + 1, 0])
                rotate([0, 0, 13])
                cube([8, 2, 1], center=true);

                translate([-68, 18 + 15 + 4.4, 0])
                rotate([0, 0, 13])
                cube([8, 1, 1], center=true);
            }
        }

        // claw hole 1
        translate([-24.5, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 26.3 + 10.5, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 26.3 + 11.3, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 26.3 + 18.7, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 26.3 + 19.6, 0])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 26.3 + 6, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 26.3 + 6, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 26.3 + 18.7, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 26.3 + 19.6, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

            }
        }

        // claw hole 2
        translate([-68, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 18 + 10.6, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 18 + 12.5, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 18 + 18.3, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 18 + 19.9, 0])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 18 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 18 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 18 + 18.4, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 18 + 19.8, 0])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // dovetails
        intersection() {
            translate([19.2/2 - 0.45, 0, 1.1])
            for(i = [0:5]) {
                translate([-10 - i * 19.2, 0, 0])
                rotate([-90, 0, 0])
                scale([0.98, 0.98, 1])
                triangle();

                translate([-10 - i * 19.2, 0, -3.2])
                rotate([-90, 180, 0])
                scale([0.98, 0.98, 1])
                triangle();
            }

            //translate([-2/2, 0, 0])
            rotate([0, -111.86, 0])
            translate([-w2/2 + 2/2, 0, 0])
            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 607.4, 20, $fn=200);
        }
    }
}

module _top_clips() {
    difference() {
        union() {
            intersection() {
                _cover_body();

                hull() {
                    translate([w1/2 - 2/2 - 2.2, 0, h - 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);

                    translate([-w1/2 + 2/2 + 2.2, 0, h - 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);
                }
            }

            // middle clip
            %translate([0, 0.7, 0])
            cylinder(d=1, h=4, $fn=10);
            hull() {
                translate([-22.5/2 + 3/2, 10, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([22.5/2 - 3/2, 10, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-22.4/2 + 3/2, 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([22.4/2 - 3/2, 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.7/2 + 3/2, 26.8, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.7/2 - 3/2, 26.8, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // left clip 1
            %translate([-75.4, 2, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([-75.4 - 19/2, 2.37, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([-75.4 + 19/2, 1.6, 90])
            cylinder(d=1, h=4, $fn=10);

            translate([-75.4, 0, 0])
            hull() {
                translate([-20.5/2 + 3/2, 2.37 + 9, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([20.5/2 - 3/2, 1.6 + 9, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20.3/2 + 3/2, 2.37 + 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([20.3/2 - 3/2, 1.6 + 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.2/2 + 3/2, 2.37 + 23, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.2/2 - 3/2, 1.6 + 23.3, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // left clip 2
            %translate([-149.8, 5.6, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([-149.8 - 19/2, 6.3, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([-149.8 + 19/2, 4.92, 90])
            cylinder(d=1, h=4, $fn=10);
            
            translate([-149.8, 0, 0])
            hull() {
                translate([-20.5/2 + 3/2, 6.3 + 9, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([20.5/2 - 3/2, 4.92 + 9, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20.3/2 + 3/2, 6.3 + 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([20.3/2 - 3/2, 4.92 + 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.2/2 + 3/2, 6.3 + 23, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.2/2 - 3/2, 4.92 + 23.6, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // right clip 3
            %translate([149.5, 5.7, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([149.5 - 19/2, 4.97, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([149.5 + 19/2, 6.36, 90])
            cylinder(d=1, h=4, $fn=10);


            translate([149.5, 0, 0])
            hull() {
                translate([-20.5/2 + 3/2, 4.97 + 9, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([20.5/2 - 3/2, 6.36 + 9, h - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20.3/2 + 3/2, 4.97 + 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([20.3/2 - 3/2, 6.36 + 18, h - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.2/2 + 3/2, 4.97 + 23.6, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.2/2 - 3/2, 6.36 + 23, h - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // right clip 1
            %translate([43, 1.3, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([43 - 15/2, 1.18, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([43 + 15/2, 1.4, 90])
            cylinder(d=1, h=4, $fn=10);

            translate([43, 0, 0])
            hull() {
                translate([
                    -15.5/2 + 1/2, 1.18 + 9, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([
                    15.5/2 - 1/2, 1.4 + 9, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([
                    -15.3/2 + 1/2, 1.18 + 19.4, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([
                    15.3/2 - 1/2, 1.4 + 19.4, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );
            }

            // right clip 2
            %translate([103, 3.25, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([103 - 15/2, 2.9, 90])
            cylinder(d=1, h=4, $fn=10);

            %translate([103 + 15/2, 3.55, 90])
            cylinder(d=1, h=4, $fn=10);

            translate([103, 0, 0])
            hull() {
                translate([
                    -15.5/2 + 1/2, 2.9 + 9, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([
                    15.5/2 - 1/2, 3.55 + 9, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([
                    -15.3/2 + 1/2, 2.9 + 19.4, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([
                    15.3/2 - 1/2, 3.55 + 19.4, h - 1.6/2 - 0.4
                ])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );
            }

            // middle claw
            hull() {
                translate([0, 0.7 + 15 + 1, h - 2/2 + 1.8])
                rotate([0, 90, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([0, 0.7 + 15 + 1, h - 2/2])
                cube([8, 2, 1], center=true);

                translate([0, 0.7 + 15 + 4.5, h - 2/2])
                cube([8, 1, 1], center=true);
            }

            // left claw 1
            hull() {
                translate([-75.4, 2 + 15 + 1, h - 2/2 + 1.8])
                rotate([0, 90, -3])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-75.4, 2 + 15 + 1, h - 2/2])
                rotate([0, 0, -3])
                cube([8, 2, 1], center=true);

                translate([-75.4, 2 + 15 + 4.5, h - 2/2])
                rotate([0, 0, -3])
                cube([8, 1, 1], center=true);
            }

            // left claw 2
            hull() {
                translate([-149.8, 5.6 + 15 + 1, h - 2/2 + 1.8])
                rotate([0, 90, -5])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-149, 5.6 + 15 + 1, h - 2/2])
                rotate([0, 0, -5])
                cube([8, 2, 1], center=true);

                translate([-149, 5.6 + 15 + 4.5, h - 2/2])
                rotate([0, 0, -5])
                cube([8, 1, 1], center=true);
            }

            // right claw 3
            hull() {
                translate([149.5, 5.7 + 15 + 1, h - 2/2 + 1.8])
                rotate([0, 90, 5])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([149.5, 5.7 + 15 + 1, h - 2/2])
                rotate([0, 0, 5])
                cube([8, 2, 1], center=true);

                translate([149.5, 5.7 + 15 + 4.5, h - 2/2])
                rotate([0, 0, 5])
                cube([8, 1, 1], center=true);
            }

            // right claw 2
            hull() {
                translate([103, 3.25 + 15 + 1, h - 2/2 + 1.8])
                rotate([0, 90, 2.7])
                cylinder(d=2, h=14.5, center=true, $fn=20);

                translate([103, 3.25 + 15 + 1, h - 2/2])
                rotate([0, 0, 2.7])
                cube([14.5, 2, 1], center=true);

                translate([103, 3.25 + 15 + 4.3, h - 2/2])
                rotate([0, 0, 2.7])
                cube([14.5, 1, 1], center=true);
            }

            // right claw 1
            hull() {
                translate([43, 1.3 + 15 + 1, h - 2/2 + 1.8])
                rotate([0, 90, 1])
                cylinder(d=2, h=14.5, center=true, $fn=20);

                translate([43, 1.3 + 15 + 1, h - 2/2])
                rotate([0, 0, 1])
                cube([14.5, 2, 1], center=true);

                translate([43, 1.3 + 15 + 4.3, h - 2/2])
                rotate([0, 0, 1])
                cube([14.5, 1, 1], center=true);
            }
        }

        translate([0, -5.5, 0])
        rotate([13.8, 0, 0])
        cube([450, 60, 300], center=true);

        // middle hole
        difference() {
            hull() {
                translate([-7/2, 0.7 + 12, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 0.7 + 12, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 20, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 20, h])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 10, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 10, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 20, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 20, h])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // left hole 1
        translate([-75.4, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 12.5, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 12.2, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 21.3, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 21, h])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 10, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 10, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 21.3, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 21, h])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // left hole 2
        translate([-149.8, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 16.1, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 15.6, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 25.1, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 24.6, h])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 14, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 14, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 25.1, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 24.6, h])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // right hole 3
        translate([149.5, 0, 0])
        difference() {
            hull() {
                translate([7/2, 16.1, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 15.6, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 25.1, h])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 24.6, h])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([6/2, 14, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 14, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 25.1, h])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 24.6, h])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // dovetails
        intersection() {
            translate([-19.8/2, 0, 0])
            for(i = [0:19]) {
                translate([-178 + i * 19.8, 0, h + 0.1])
                rotate([-90, 0, 0])
                scale([1.035, 1.035, 1])
                triangle();

                translate([-178 + i * 19.8, 0, h + 0.1 - 3.2])
                rotate([-90, 180, 0])
                scale([1.035, 1.035, 1])
                triangle();
            }
            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 607.4, 20, $fn=200);
        }
    }
}

module _bottom_clips() {
    difference() {
        union() {
            intersection() {
                translate([0, 0, 2])
                rotate([0, 180, 0])
                _cover_body();

                hull() {
                    translate([-w2/2 + 2/2 + 2.1, 0, 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);

                    translate([w2/2 - 2/2 - 2.1, 0, 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);
                }
            }

            // middle clip
            %translate([0, 22.8, 0])
            cylinder(d=1, h=4, $fn=10);

            hull() {
                translate([-21/2 + 3/2, 22.8 + 8, 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([21/2 - 3/2, 22.8 + 8, 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-21/2 + 3/2, 22.8 + 18, 1.8/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([21/2 - 3/2, 22.8 + 18, 1.8/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.7/2 + 3/2, 22.8 + 23, 1.6/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.7/2 - 3/2, 22.8 + 23, 1.6/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // left clip 1
            %translate([-43, 23.44, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-43 - 14.8/2, 23.51, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-43 + 14.8/2, 23.32, 0])
            cylinder(d=1, h=4, $fn=10);

            translate([-43, 0, 0])
            hull() {
                translate([-15/2 + 1/2, 23.44 + 8, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([15/2 - 1/2, 23.44 + 8, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([-14.8/2 + 1/2, 23.51 + 19.4, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([14.8/2 - 1/2, 23.32 + 19.4, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );
            }

            // left clip 2
            %translate([-103, 25.4, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-103 - 14.8/2, 25.7, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([-103 + 14.8/2, 25.05, 0])
            cylinder(d=1, h=4, $fn=10);

            translate([-103, 0, 0])
            hull() {
                translate([-15/2 + 1/2, 25.4 + 8, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([15/2 - 1/2, 25.4 + 8, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([-14.8/2 + 1/2, 25.7 + 19.4, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([14.8/2 - 1/2, 25.05 + 19.4, 1.6/2])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );
            }

            // right clip 1
            %translate([65, 23.73, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([65 - 20/2, 23.58, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([65 + 20/2, 24.12, 0])
            cylinder(d=1, h=4, $fn=10);

            translate([65, 0, 0])
            hull() {
                translate([-21/2 + 3/2, 23.58 + 8, 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([21/2 - 3/2, 24.12 + 8, 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-21/2 + 3/2, 23.58 + 18, 1.8/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([21/2 - 3/2, 24.12 + 18, 1.8/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.7/2 + 3/2, 23.58 + 23, 1.6/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.7/2 - 3/2, 24.12 + 23, 1.6/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // right clip 2
            %translate([130, 26.52, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([130 - 20/2, 26.08, 0])
            cylinder(d=1, h=4, $fn=10);

            %translate([130 + 20/2, 27.13, 0])
            cylinder(d=1, h=4, $fn=10);

            translate([130, 0, 0])
            hull() {
                translate([-21/2 + 3/2, 26.08 + 8, 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([21/2 - 3/2, 27.13 + 8, 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-21/2 + 3/2, 26.08 + 18, 1.8/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([21/2 - 3/2, 27.13 + 18, 1.8/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.7/2 + 3/2, 26.08 + 23.1, 1.6/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.7/2 - 3/2, 27.13 + 22.8, 1.6/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );
            }

            // middle claw
            hull() {
                translate([0, 22.8 + 15 + 1, 2/2 + 1.8])
                rotate([0, 90, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([0, 22.8 + 15 + 1, 2/2])
                cube([8, 2, 1], center=true);

                translate([0, 22.8 + 15 + 4.5, 2/2])
                cube([8, 1, 1], center=true);
            }

            // right claw 1
            hull() {
                translate([65, 23.73 + 15 + 1, 2/2 + 1.8])
                rotate([0, 90, 2])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([65, 23.73 + 15 + 1, 2/2])
                rotate([0, 0, 2])
                cube([8, 2, 1], center=true);

                translate([65, 23.73 + 15 + 4.5, 2/2])
                rotate([0, 0, 2])
                cube([8, 1, 1], center=true);
            }

            // right claw 2
            hull() {
                translate([130, 26.52 + 15 + 1, 2/2 + 1.8])
                rotate([0, 90, 4])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([130, 26.52 + 15 + 1, 2/2])
                rotate([0, 0, 2])
                cube([8, 2, 1], center=true);

                translate([130, 26.52 + 15 + 4.5, 2/2])
                rotate([0, 0, 4])
                cube([8, 1, 1], center=true);
            }

            // left claw 1
            hull() {
                translate([-43, 23.44 + 15 + 1, 2/2 + 1.8])
                rotate([0, 90, -1])
                cylinder(d=2, h=14, center=true, $fn=20);

                translate([-43, 23.44 + 15 + 1, 2/2])
                rotate([0, 0, -1])
                cube([14, 2, 1], center=true);

                translate([-43, 23.44 + 15 + 4.3, 2/2])
                rotate([0, 0, -1])
                cube([14, 1, 1], center=true);
            }

            // left claw 1
            hull() {
                translate([-103, 25.4 + 15 + 1, 2/2 + 1.8])
                rotate([0, 90, -2.9])
                cylinder(d=2, h=14, center=true, $fn=20);

                translate([-103, 25.4 + 15 + 1, 2/2])
                rotate([0, 0, -2.9])
                cube([14, 2, 2], center=true);

                translate([-103, 25.4 + 15 + 4.3, 2/2])
                rotate([0, 0, -2.8])
                cube([14, 1, 1], center=true);
            }
        }

        translate([0, -5.5, 2])
        rotate([-13.8, 0, 0])
        cube([450, 60, 300], center=true);

        // middle hole
        difference() {
            hull() {
                translate([-7/2, 22.8 + 11, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 22.8 + 11, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 22.8 + 19.1, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 22.8 + 19.1, 0])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 22.8 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 22.8 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 22.8 + 19.1, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 22.8 + 19.1, 0])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // right hole 1
        translate([65, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 23.73 + 11, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 23.73 + 11.2, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 23.73 + 19.1, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 23.73 + 19.3, 0])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 23.73 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 23.73 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 23.73 + 19.1, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 23.73 + 19.3, 0])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // right hole 2
        translate([130, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 26.52 + 10.9, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 26.52 + 11.3, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 26.52 + 18.9, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 26.52 + 19.3, 0])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 26.52 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 26.52 + 5, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 26.52 + 18.9, 0])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 26.52 + 19.3, 0])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }
        // dovetails
        intersection() {
            translate([-19.2/2, 0, 0])
            for(i = [0:16]) {
                translate([-144 + i * 19.2, 20, 2.1])
                rotate([-90, 0, 0])
                scale([0.98, 0.98, 1])
                triangle();

                translate([-144 + i * 19.2, 20, 2.1 - 3.2])
                rotate([-90, 180, 0])
                scale([0.98, 0.98, 1])
                triangle();
            }

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 607.4, 20, $fn=200);
        }
    }
}

module _frame_body() {
    difference() {
        union() {
            _cover_body();

            translate([0, 9, 0])
            _cover_body();
        }

        translate([0, 47.3 + 4.7, 0])
        rotate([12, 0, 0])
        cube([500, 30, 300], center=true);
    }
}

module _frame_body_flat() {
    difference() {
        _cover_body_flat();

        translate([0, -5.5, 0])
        rotate([13.8, 0, 0])
        cube([450, 60, 300], center=true);

        // side chamfers
        translate([w1/2 - 30, 12.4, 0])
        rotate([11.5, 21.75, 0])
        rotate([0, 0, 45])
        cube([30, 30, 300], center=true);

        translate([-w1/2 + 30, 12.4, 0])
        rotate([11.5, -21.75, 0])
        rotate([0, 0, 45])
        cube([30, 30, 300], center=true);

        // top chamfers
        translate([w1/2, -4, 100])
        rotate([0, 0, 3])
        rotate([45 + 12, 0, 0])
        cube([300, 30, 30], center=true);

        translate([-w1/2, -4, 100])
        rotate([0, 0, -3])
        rotate([45 + 12, 0, 0])
        cube([300, 30, 30], center=true);
    }
}


module triangle() {
    linear_extrude(100)
    polygon(
        points=[
            [5.5, 0],
            [-5.5, 0],
            [0, 11]
        ]
    );
}

module _frame_flange_cut() {
    difference() {
        difference() {
            cube([400, 100, 300], center=true);

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 607.2, 20, $fn=200);
        }

        union() {
            hull() {
                translate([w2/2 - 7.5, 0, 10])
                rotate([-90, 0, 0])
                cylinder(d=4, h=100, $fn=40);

                translate([w1/2 - 14, 0, h - 10])
                rotate([-90, 0, 0])
                cylinder(d=4, h=100, $fn=40);

                translate([-w2/2 + 7.5, 0, 10])
                rotate([-90, 0, 0])
                cylinder(d=4, h=100, $fn=40);

                translate([-w1/2 + 14, 0, h - 10])
                rotate([-90, 0, 0])
                cylinder(d=4, h=100, $fn=40);
            }
        }
    }
}

module _magnet_positions(z=-37) {
    rotate([90 + 13.8, 0, 0])
    translate([-160.2, 65, 0])
    //rotate([-13.8, 0, 0])
    translate([0, 0, z])
    children();

    rotate([90 + 13.8, 0, 0])
    translate([-60, 28, 0])
    //rotate([-13.8, 0, 0])
    translate([0, 0, z])
    children();

    rotate([90 + 13.8, 0, 0])
    translate([79, 28, 0])
    //rotate([-13.8, 0, 0])
    translate([0, 0, z])
    children();

    rotate([90 + 13.8, 0, 0])
    translate([160.2, 65, 0])
    //rotate([-13.8, 0, 0])
    translate([0, 0, z])
    children();
}

module _magnet_holes(d=20, h=4, z=-37) {
    _magnet_positions(z=z)
    rounded_cylinder(d, h, 1, $fn=40);
}

module _magnet_screw_cap(d=24, h=5) {
    v_screw(
        h=h,
        screw_d=d,
        pitch=1,
        direction=0,
        steps=80
    );
}

module _magnet_screw_cap_holes(d=20, h=4, z=-37) {
    _magnet_positions(z=z)
    _magnet_screw_cap(d=d, h=h);
}

module _cone() {
    difference() {
        hull() {
            cylinder(d=10, h=1, $fn=30);

            translate([0, 0, 8])
            cylinder(d=18, h=1, $fn=30);
        }
    }
}

module _screw_cones() {
    z = -32.1;

    _magnet_positions(z=z)
    _cone();
}

module _frame_cutouts(wood_screws=false) {

    bm = 6;

    _magnet_positions(z=-23)
    union() {
        hull() {
            cylinder(d=24, h=8, center=true, $fn=40);
            //cylinder(d=14, h=18, center=true, $fn=40);
            cylinder(d=8, h=24, center=true, $fn=40);
        }

        if (wood_screws) {
            cylinder(d=4.2, h=54, center=true, $fn=30);
        } else {
            cylinder(d=8, h=54, center=true, $fn=40);
        }
    }

    // coutouts
    difference() {
        union() {
            // leftest hole
            hull() {
                translate([-155.5, 0, 28])
                rotate([90, 0, 0])
                cylinder(d=3, h=100, center=true, $fn=20);

                translate([-156, 0, 58])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-167, 0, 58])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

            }

            // left hole (electric)
            hull() {
                translate([-69, 0, 9])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-69, 0, 80])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-146, 0, 9])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-146, 0, 80])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);
            }

            // middle hole
            hull() {
                translate([-46, 0, 12])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-46, 0, 79])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([65, 0, 12    ])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([65, 0, 79])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);
            }

            // right hole
            hull() {
                translate([145, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([95, 0, 54])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([95, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([162, 0, 54])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);
            }

            hull() {
                translate([145, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([80, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([145, 0, 18])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([80, 0, 18])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);
            }

            hull() {
                translate([145, 0, 79])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([80, 0, 79])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([80, 0, 48])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([145, 0, 48])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);
            }

            hull() {
                translate([85, 0, 18])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([95, 0, 18])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([95, 0, 28])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);
            }
            
        }
        _magnet_positions(z=-48)
        rounded_cube(
            15, 15, 50, 4, center=true, $fn=30
        );

        // beams
        hull() {
            rotate([90, 0, 0])
            translate([162, 80, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);

            rotate([90, 0, 0])
            translate([110, 7, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);
        }

        hull() {
            rotate([90, 0, 0])
            translate([71, 80, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);

            rotate([90, 0, 0])
            translate([110, 7, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);
        }

        hull() {
            rotate([90, 0, 0])
            translate([110, 83, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);

            rotate([90, 0, 0])
            translate([155, 0, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);
        }

        hull() {
            rotate([90, 0, 0])
            translate([110, 83, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);

            rotate([90, 0, 0])
            translate([68, 0, -38])
            cylinder(d=bm, h=200, center=true, $fn=20);
        }
    }
}

module frame() {
    difference() {
        _frame_body();

        _frame_flange_cut();

        _cover_holes();

        _frame_cutouts();

        // top dovetails
        for(i = [0:19]) {
            translate([-178 + i * 19.8, 20, h - 2.1])
            rotate([90, 0, 0])
            triangle();
        }

        // bottom dovetails
        for(i = [0:15]) {
            translate([-144 + i * 19.2, 20, 2.1])
            rotate([-90, 0, 0])
            triangle();
        }

        // left dovetails
        translate([-w2/2, 0, 0])
        rotate([0, -111.86, 0])
        for(i = [0:4]) {
            translate([10 + i * 19.2, 50, -0.3 - 2.1])
            rotate([90, 0, 0])
            triangle();
        }

        // right dovetails
        translate([w2/2, 0, 0])
        rotate([0, 111.86, 0])
        for(i = [0:4]) {
            translate([-10 - i * 19.2, 50, -0.3 - 2.1])
            rotate([90, 0, 0])
            triangle();
        }
    }
}

module frame_flat(wood_screws=false, body_only=false) {
    rotate([90 - 13.8, 0, 0])
    difference() {
        union() {
            _frame_body_flat();

            if (wood_screws) {
                _magnet_holes(d=15, h=20, z=-38.5);
            } else {
                _magnet_holes(d=15, h=20, z=-40.5);
            }
        }

        _frame_flange_cut();
        _cover_holes();
        _frame_cutouts(wood_screws=wood_screws);

        // dovetail cuts
        difference() {
            union() {
                // top dovetails
                for(i = [0:19]) {
                    translate([-178 + i * 19.8, 20, h - 2.1])
                    rotate([90, 0, 0])
                    triangle();
                }

                // bottom dovetails
                for(i = [0:15]) {
                    translate([-144 + i * 19.2, 20, 2.1])
                    rotate([-90, 0, 0])
                    triangle();
                }

                // left dovetails
                translate([-w2/2, 0, 0])
                rotate([0, -111.86, 0])
                for(i = [0:4]) {
                    translate([10 + i * 19.2, 50, -0.3 - 2.1])
                    rotate([90, 0, 0])
                    triangle();
                }

                // right dovetails
                translate([w2/2, 0, 0])
                rotate([0, 111.86, 0])
                for(i = [0:4]) {
                    translate([-10 - i * 19.2, 50, -0.3 - 2.1])
                    rotate([90, 0, 0])
                    triangle();
                }
            }

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 599.8, 20, $fn=200);
        }
    }
}

module original_cover() {

    union() {
        _cover_body();

        translate([w2/2 - 2/2, 0, 2/2])
        rotate([0, 111.86, 0])
        translate([2/2, 0, 0])
        _side_clips();

        mirror([1, 0, 0])
        translate([w2/2 - 2/2, 0, 2/2])
        rotate([0, 111.86, 0])
        translate([2/2, 0, 0])
        _side_clips();

        _top_clips();

        translate([0, 0, 2])
        rotate([0, 180, 0])
        _bottom_clips();
    }

    //    %translate([0, -276, -25])
//    rotate([0, 90, 0])
//    cylinder(d=600, h=400, center=true, $fn=100);
//    %translate([0, 2000, 0])
//    cylinder(d=4000, h=200, $fn=200);
}

module side_clips_right() {
    _side_clips();
}

module side_clips_left() {
    mirror([1, 0, 0])
    _side_clips();
}

module bottom_clips() {
    _bottom_clips();
}

module bottom_clips_split_1() {
    intersection() {
        bottom_clips();

        translate([400/2 - 11, 0, 0])
        cube([400, 200, 100], center=true);
    }
}

module bottom_clips_split_2() {
    difference() {
        bottom_clips();

        translate([400/2 - 11.1, 0, 0])
        cube([400, 200, 100], center=true);
    }
}

module top_clips() {
    translate([0, 0, -h + 2])
    _top_clips();
}

module top_clips_split_1() {
    intersection() {
        top_clips();

        translate([400/2 - 11.4, 0, 0])
        cube([400, 200, 100], center=true);
    }
}

module top_clips_split_2() {
    difference() {
        top_clips();

        translate([400/2 - 11.5, 0, 0])
        cube([400, 200, 100], center=true);
    }
}

module _wooden_screw_hole() {
    union() {
        cylinder(d=5.1, h=30, $fn=30);

        translate([0, 0, 25])
        cylinder(d=10, h=5, $fn=30);

        translate([0, 0, 25 - 3.1])
        cylinder(d2=10, d1=5.1, h=3.1, $fn=30);
    }
}

module _cover_flat(wood_screws=false, cover_holes=true) {
    module _cover_flat_body() {
        union() {
            difference() {
                intersection() {
                    _cover_body_flat(inner=false);

                    union() {
                        translate([0, 5200/2 - 300 + 23, -25])
                        rotate([0, 0, -90])
                        donut(5200, 599.8, 20, $fn=200);

                        translate([0, -4.5, 0])
                        rotate([13.8, 0, 0])
                        cube([450, 60, 300], center=true);
                    }
                }

                if (cover_holes) {
                    _cover_holes();
                }

                translate([0, -0.1, 0])
                scale([1.001, 1, 1])
                _frame_body_flat();

                // side chamfers
                translate([w1/2 - 28, 10.4, 0])
                rotate([11.5, 21.75, 0])
                rotate([0, 0, 49])
                cube([30, 30, 300], center=true);

                translate([-w1/2 + 28, 10.4, 0])
                rotate([11.5, -21.75, 0])
                rotate([0, 0, -49])
                cube([30, 30, 300], center=true);

                // top chamfers
                translate([w1/2, -6, 100])
                rotate([0, 0, 3])
                rotate([45 + 12, 0, 0])
                cube([300, 30, 30], center=true);

                translate([-w1/2, -6, 100])
                rotate([0, 0, -3])
                rotate([45 + 12, 0, 0])
                cube([300, 30, 30], center=true);

                translate([0, -11, 100])
                rotate([45 + 12, 0, 0])
                cube([300, 30, 30], center=true);

                // bottom chamfer
                translate([0, 21, -1])
                rotate([68, 0, 0])
                cube([500, 4, 10], center=true);
            }

            if (wood_screws) {
                difference() {

                    _screw_cones();

//                    translate([0, -7.8, 0])
//                    rotate([13.8, 0, 0])
//                    cube([450, 60, 300], center=true);
                }
            }
        }
    }

    difference() {
        _cover_flat_body();

        if (wood_screws) {
            _magnet_positions(z=-47.5)
            _wooden_screw_hole();
        } else {
            // magnet holes
            //_magnet_holes(h=6, z=-28.355);
            _magnet_screw_cap_holes(d=23.8, h=6, z=-28.355);
        }
    }
}

module magnet_screw_cap() {
    difference() {
        intersection() {
            _magnet_screw_cap(d=23.8, h=4.5);

            chamfered_cylinder(
                23.6, 4.5, 0.6, $fn=60
            );
        }

        translate([0, 0, 0.75])
        cylinder(d=19.8, h=5, $fn=40);

        cylinder(d=15, h=10, center=true, $fn=30);

        for(i = [0:5]) {
            rotate([0, 0, i*360/6])
            translate([19.8/2 + 10/2 + 0.8, 0, 0])
            chamfered_cube(
                10, 50, 7, 1.4, center=true
            );
        }
    }
}

module magnet_screw_cap_tool() {
    difference() {
        union() {
            hull() {
                rounded_cylinder(17, 4, 2, $fn=50);

                translate([0, -70, 0])
                rounded_cylinder(22, 4, 2, $fn=50);
            }

            translate([0, 0, -3])
            rotate([-10, 0, 0])
            rounded_cylinder(30, 15, 3, $fn=50);
        }

        translate([0, 0, -3])
        rotate([-10, 0, 0])
        translate([0, 0, -1])
        cylinder(d=24.8, h=40, $fn=6);

        translate([0, 0, -10])
        cylinder(d=50, h=10);

        translate([0, -70, -1])
        cylinder(d=16, h=20, $fn=50);
    }
}

module cover_flat(wood_screws=false, cover_holes=true) {
    translate([0, 0, -21.355])
    rotate([90 - 13.8, 0, 0])
    _cover_flat(
        wood_screws=wood_screws,
        cover_holes=cover_holes
    );
}

module cover_flat_logo_1(
    wood_screws=false, cover_holes=true
) {
    difference() {
        cover_flat(
            wood_screws=wood_screws,
            cover_holes=cover_holes
        );

        cover_flat_logo_2(
            wood_screws=wood_screws,
            cover_holes=false
        );
    }
}

module cover_flat_logo_2(
    wood_screws=false, cover_holes=true
) {
    intersection() {
        translate([-1, -45, 0])
        scale([3.4, 3.4, 0.5/0.4])
        _tesla_logo();

        cover_flat(
            wood_screws=wood_screws,
            cover_holes=cover_holes
        );
    }
}

module magnet_clip() {
    difference() {
        union() {
            rounded_cylinder(21.3, 1.9, 1.9/2 - 0.02, $fn=40);

            translate([-3, 6.4, 0])
            cylinder(d=5, h=4, $fn=30);

            translate([3, 6.4, 0])
            cylinder(d=5, h=4, $fn=30);
        }

        hull() {
            cylinder(d=3, h=20, center=true);

            translate([-4, 12, 0])
            cylinder(d=0.1, h=20, center=true);

            translate([4, 12, 0])
            cylinder(d=0.1, h=20, center=true);
        }

        difference() {
            cylinder(d=13, h=20, center=true, $fn=40);

            translate([-3, 6.4, 0])
            cylinder(d=5, h=20, center=true, $fn=30);

            translate([3, 6.4, 0])
            cylinder(d=5, h=20, center=true, $fn=30);
        }
    }
}

module bolt_holder() {
    difference() {
        union() {
            translate([0, 0, 7.1])
            rotate([180, 0, 0])
            v_screw(
                h=7.1,
                screw_d=16.7,
                pitch=1.25,
                direction=0,
                steps=70,
                chamfer=true
            );

            translate([0, 0, 7])
            M8_nut(cone=false);

            hull() {
                translate([0, 0, 6.1])
                cylinder(d=19, h=1, $fn=40);

                translate([0, 0, 7 - (20.8 - 15)/2])
                cylinder(d=15, h=1, $fn=40);
            }
                
        }

        translate([0, 0, -1])
        M8_thread(20);
    }
}

module bolt_spacer() {
    difference() {
        intersection() {
            translate([0, 0, -8.5])
            hull() {
                cylinder(d=24, h=8, center=true, $fn=40);
                
                cylinder(d=8, h=24, center=true, $fn=40);
            }
            cylinder(d=30, h=3.2);
        }
        cylinder(d=8.1, h=30, center=true, $fn=40);
    }
}

module test_side() {
    intersection() {
        rotate([-90, 0, 0])
        translate([150, -35.865, 0])
        rotate([-12, 0, 0])
        frame();

        translate([-3, 0, 0])
        rotate([0, 0, 21])
        cube([15, 200, 50], center=true);
    }
}

module test_cover_magnet_cap() {
    intersection() {
        cover_flat(wood_screws=false);

        translate([79, -28, 0])
        cylinder(d=32, h=10);
    }
}

module test_magnet_dual_holder() {
    %translate([-4, 0, 0])
    rotate([0, -90, 0])
    cylinder(d=19.8, h=3.8, $fn=40);

    %translate([4, 0, 0])
    rotate([0, 90, 0])
    cylinder(d=19.8, h=3.8, $fn=40);

    difference() {
        cube([20, 25, 20], center=true);

        hull() {

            translate([-4, 0, 0])
            rotate([0, -90, 0])
            cylinder(d=19.8, h=3.8, $fn=40);

            translate([-4, 0, 20])
            rotate([0, -90, 0])
            cylinder(d=19.8, h=3.8, $fn=40);
        }

        hull() {

            translate([4, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=19.8, h=3.8, $fn=40);

            translate([4, 0, 20])
            rotate([0, 90, 0])
            cylinder(d=19.8, h=3.8, $fn=40);
        }

        cylinder(d=6.6, h=50, center=true, $fn=30);
    }
}

//test_magnet_dual_holder();

module screw_qnd_fix() {
    difference() {
        union() {
            cylinder(d=19.7, h=6, $fn=30);
            cylinder(d=10, h=10, $fn=30);
        }

        cylinder(d=4.2, h=30, center=true, $fn=30);
    }
}

//screw_qnd_fix();