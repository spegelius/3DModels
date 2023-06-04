use <../Dollo/NEW_long_ties/include.scad>;


//debug();
//debug_frame_clips();
debug_frame_clips_flat();

//original_cover();

//_bumper();
//_cover_body();
//_cover_body_flat();
//_frame_body();
//_frame_body_flat();

//side_clips_left();
//side_clips_right();
//bottom_clips();
//top_clips();

//frame();
//frame_flat();

//cover_flat();

//test_side();


module debug() {

}


module debug_frame_clips() {
    frame();

    translate([310/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.75, 0])
    translate([2/2, 0, 0])
    _side_clips();

    mirror([1, 0, 0])
    translate([310/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.75, 0])
    translate([2/2, 0, 0])
    _side_clips();

    translate([0, 0.1, 0])
    _top_clips();

    translate([0, 0.1, 2])
    rotate([0, 180, 0])
    _bottom_clips();
}

module debug_frame_clips_flat() {
    render()
    frame_flat();

    render()
    translate([310/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.75, 0])
    translate([2/2, 0, 0])
    _side_clips();

    render()
    mirror([1, 0, 0])
    translate([310/2 - 2/2, 0.1, 2/2])
    rotate([0, 111.75, 0])
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

    //%_magnet_holes();
}

module _cover_holes() {
    // for positioning
    //%translate([-159.5, 0, 91 - 10 - 48/2])
    //cube([36, 50, 2], center=true);

    // electric hole
    translate([-114, 0, 91 - 10 - 48/2])
    rotate([0, 0, 10])
    hull() {
        rotate([90, 0, 0])
        cylinder(d=50, h=100, center=true, $fn=40);

        translate([-50/2 + 4/2, 0, -47])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=20);

        translate([50/2 - 4/2 + 10, 0, -47])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=20);

        translate([50/2 - 4/2 + 10, 0, 50/2 - 4/2])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=20);

    }

    // tow hook hole
    hull() {
        translate([-7.5, 0, 25/2 + 16])
        rotate([90, 0, 0])
        cylinder(d=25, h=100, center=true, $fn=30);

        translate([-7.5, 0, 92 - 25/2 - 16])
        rotate([90, 0, 0])
        cylinder(d=25, h=100, center=true, $fn=30);

        translate([30, 0, (92 - 32)/2 + 16])
        rounded_cube(
            20, 100, 92 - 32, 10, center=true, $fn=30
        );
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
        translate([-381/2 + 2/2, 0, 91 - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([381/2 - 2/2, 0, 91 - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([-310/2 + 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([310/2 - 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);
    }
}

module _cover_form_outer(d=2) {
    hull() {
        translate([-389/2 + 2/2, 0, 91 - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([389/2 - 2/2, 0, 91 - 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([-318/2 + 2/2, 0, 2/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=100, $fn=40);

        translate([318/2 - 2/2, 0, 2/2])
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

            translate([0, -7.9, 0])
            rotate([13.8, 0, 0])
            cube([450, 60, 300], center=true);

//            // side chamfers
//            translate([381/2 - 30, 12.4, 0])
//            rotate([11.5, 21.75, 0])
//            rotate([0, 0, 45])
//            cube([30, 30, 300], center=true);
//
//            translate([-381/2 + 30, 12.4, 0])
//            rotate([11.5, -21.75, 0])
//            rotate([0, 0, 45])
//            cube([30, 30, 300], center=true);
//
//            // top chamfers
//            translate([381/2, -4, 100])
//            rotate([0, 0, 3])
//            rotate([45 + 12, 0, 0])
//            cube([300, 30, 30], center=true);
//
//            translate([-381/2, -4, 100])
//            rotate([0, 0, -3])
//            rotate([45 + 12, 0, 0])
//            cube([300, 30, 30], center=true);
        }

        translate([0, 5200/2 - 300 + 24, -25])
        rotate([0, 0, -90])
        donut(5200, 618, 20, $fn=200);
    }
}

module _side_clips() {

    difference() {
        union() {
            translate([-2/2, 0, 0])
            rotate([0, -111.75, 0])
            translate([-310/2 + 2/2, 0, -2/2])
            intersection() {
                _cover_body();

                hull() {
                    translate([381/2 - 2/2, 0, 91 - 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);

                    translate([310/2 - 2/2, 0, 2/2])
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
                scale([0.97, 0.97, 1])
                triangle();
            }

            //translate([-2/2, 0, 0])
            rotate([0, -111.75, 0])
            translate([-310/2 + 2/2, 0, 0])
            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 609.4, 20, $fn=200);
        }
    }
}

module _top_clips() {
    difference() {
        union() {
            intersection() {
                _cover_body();

                hull() {
                    translate([381/2 - 2/2 - 2.2, 0, 91 - 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);

                    translate([-381/2 + 2/2 + 2.2, 0, 91 - 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);
                }
            }

            // middle clip
            %translate([0, 0.7, 0])
            cylinder(d=1, h=4, $fn=10);
            hull() {
                translate([-22.5/2 + 3/2, 10, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([22.5/2 - 3/2, 10, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-22.4/2 + 3/2, 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([22.4/2 - 3/2, 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.7/2 + 3/2, 26.8, 91 - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.7/2 - 3/2, 26.8, 91 - 2.4/2])
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
                translate([-20.5/2 + 3/2, 2.37 + 9, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([20.5/2 - 3/2, 1.6 + 9, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20.3/2 + 3/2, 2.37 + 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([20.3/2 - 3/2, 1.6 + 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.2/2 + 3/2, 2.37 + 23, 91 - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.2/2 - 3/2, 1.6 + 23.3, 91 - 2.4/2])
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
                translate([-20.5/2 + 3/2, 6.3 + 9, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([20.5/2 - 3/2, 4.92 + 9, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20.3/2 + 3/2, 6.3 + 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([20.3/2 - 3/2, 4.92 + 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.2/2 + 3/2, 6.3 + 23, 91 - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.2/2 - 3/2, 4.92 + 23.6, 91 - 2.4/2])
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
                translate([-20.5/2 + 3/2, 4.97 + 9, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([20.5/2 - 3/2, 6.36 + 9, 91 - 2/2])
                chamfered_cylinder(
                    3, 2, 0.6, center=true, $fn=20
                );

                translate([-20.3/2 + 3/2, 4.97 + 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([20.3/2 - 3/2, 6.36 + 18, 91 - 2.2/2])
                chamfered_cylinder(
                    3, 1.8, 0.6, center=true, $fn=20
                );

                translate([-12.2/2 + 3/2, 4.97 + 23.6, 91 - 2.4/2])
                chamfered_cylinder(
                    3, 1.6, 0.6, center=true, $fn=20
                );

                translate([12.2/2 - 3/2, 6.36 + 23, 91 - 2.4/2])
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
                translate([-15.5/2 + 1/2, 1.18 + 9, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([15.5/2 - 1/2, 1.4 + 9, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([-15.3/2 + 1/2, 1.18 + 19.4, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([15.3/2 - 1/2, 1.4 + 19.4, 91 - 1.6/2 - 0.4])
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
                translate([-15.5/2 + 1/2, 2.9 + 9, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([15.5/2 - 1/2, 3.55 + 9, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([-15.3/2 + 1/2, 2.9 + 19.4, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );

                translate([15.3/2 - 1/2, 3.55 + 19.4, 91 - 1.6/2 - 0.4])
                chamfered_cylinder(
                    1, 1.6, 0.2, center=true, $fn=20
                );
            }

            // middle claw
            hull() {
                translate([0, 0.7 + 15 + 1, 91 - 2/2 + 1.8])
                rotate([0, 90, 0])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([0, 0.7 + 15 + 1, 91 - 2/2])
                cube([8, 2, 1], center=true);

                translate([0, 0.7 + 15 + 4.5, 91 - 2/2])
                cube([8, 1, 1], center=true);
            }

            // left claw 1
            hull() {
                translate([-75.4, 2 + 15 + 1, 91 - 2/2 + 1.8])
                rotate([0, 90, -3])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-75.4, 2 + 15 + 1, 91 - 2/2])
                rotate([0, 0, -3])
                cube([8, 2, 1], center=true);

                translate([-75.4, 2 + 15 + 4.5, 91 - 2/2])
                rotate([0, 0, -3])
                cube([8, 1, 1], center=true);
            }

            // left claw 2
            hull() {
                translate([-149.8, 5.6 + 15 + 1, 91 - 2/2 + 1.8])
                rotate([0, 90, -5])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-149, 5.6 + 15 + 1, 91 - 2/2])
                rotate([0, 0, -5])
                cube([8, 2, 1], center=true);

                translate([-149, 5.6 + 15 + 4.5, 91 - 2/2])
                rotate([0, 0, -5])
                cube([8, 1, 1], center=true);
            }

            // right claw 3
            hull() {
                translate([149.5, 5.7 + 15 + 1, 91 - 2/2 + 1.8])
                rotate([0, 90, 5])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([149.5, 5.7 + 15 + 1, 91 - 2/2])
                rotate([0, 0, 5])
                cube([8, 2, 1], center=true);

                translate([149.5, 5.7 + 15 + 4.5, 91 - 2/2])
                rotate([0, 0, 5])
                cube([8, 1, 1], center=true);
            }

            // right claw 2
            hull() {
                translate([103, 3.25 + 15 + 1, 91 - 2/2 + 1.8])
                rotate([0, 90, 2.7])
                cylinder(d=2, h=14.5, center=true, $fn=20);

                translate([103, 3.25 + 15 + 1, 91 - 2/2])
                rotate([0, 0, 2.7])
                cube([14.5, 2, 1], center=true);

                translate([103, 3.25 + 15 + 4.3, 91 - 2/2])
                rotate([0, 0, 2.7])
                cube([14.5, 1, 1], center=true);
            }

            // right claw 1
            hull() {
                translate([43, 1.3 + 15 + 1, 91 - 2/2 + 1.8])
                rotate([0, 90, 1])
                cylinder(d=2, h=14.5, center=true, $fn=20);

                translate([43, 1.3 + 15 + 1, 91 - 2/2])
                rotate([0, 0, 1])
                cube([14.5, 2, 1], center=true);

                translate([43, 1.3 + 15 + 4.3, 91 - 2/2])
                rotate([0, 0, 1])
                cube([14.5, 1, 1], center=true);
            }
        }

        translate([0, -4.5, 0])
        rotate([13.8, 0, 0])
        cube([450, 60, 300], center=true);

        // middle hole
        difference() {
            hull() {
                translate([-7/2, 0.7 + 12, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 0.7 + 12, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 20, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 20, 91])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 10, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 10, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 20, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 20, 91])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // left hole 1
        translate([-75.4, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 12.5, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 12.2, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 21.3, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 21, 91])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 10, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 10, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 21.3, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 21, 91])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // left hole 2
        translate([-149.8, 0, 0])
        difference() {
            hull() {
                translate([-7/2, 16.1, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 15.6, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 25.1, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 24.6, 91])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([-6/2, 14, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 14, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 25.1, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 24.6, 91])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // right hole 3
        translate([149.5, 0, 0])
        difference() {
            hull() {
                translate([7/2, 16.1, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 15.6, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([7/2, 25.1, 91])
                cylinder(d=2, h=8, center=true, $fn=20);

                translate([-7/2, 24.6, 91])
                cylinder(d=2, h=8, center=true, $fn=20);
            }

            hull() {
                translate([6/2, 14, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 14, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([6/2, 25.1, 91])
                cylinder(d=1, h=10, center=true, $fn=15);

                translate([-6/2, 24.6, 91])
                cylinder(d=1, h=10, center=true, $fn=15);
            }
        }

        // dovetails
        intersection() {
            translate([-19.8/2, 0, 0])
            for(i = [0:19]) {
                translate([-178 + i * 19.8, 0, 91 + 0.1])
                rotate([-90, 0, 0])
                scale([1.02, 1.02, 1])
                triangle();
            }
            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 609.4, 20, $fn=200);
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
                    translate([-310/2 + 2/2 + 2.1, 0, 2/2])
                    rotate([-90, 0, 0])
                    cylinder(d=2, h=100, $fn=40);

                    translate([310/2 - 2/2 - 2.1, 0, 2/2])
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

        translate([0, -4.5, 2])
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
                scale([0.97, 0.97, 1])
                triangle();
            }

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 609.4, 20, $fn=200);
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
        union() {
            _cover_body_flat();

//            translate([0, 9, 0])
//            _cover_body();
        }

        translate([0, 47.3 + 4.7, 0])
        rotate([12, 0, 0])
        cube([500, 30, 300], center=true);
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
    intersection() {
        difference() {
            cube([400, 100, 300], center=true);

            translate([0, 5200/2 - 300 + 24, -25])
            rotate([0, 0, -90])
            donut(5200, 609.2, 20, $fn=200);
        }

        union() {
            hull() {
                translate([-381/2 + 2/2, 0, 91 - 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);

                translate([381/2 - 2/2, 0, 91 - 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);
            }

            hull() {
                translate([-310/2 + 2/2, 0, 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);

                translate([310/2 - 2/2, 0, 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);
            }

            hull() {
                translate([-381/2 + 2/2, 0, 91 - 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);

                translate([-310/2 + 2/2, 0, 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);
            }

            hull() {
                translate([381/2 - 2/2, 0, 91 - 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);

                translate([310/2 - 2/2, 0, 2/2])
                rotate([-90, 0, 0])
                cylinder(d=11.1, h=100, $fn=40);
            }
        }
    }
}

module _magnet_holes(d=20.2, h=4, z=-37) {
    rotate([90 + 13.8, 0, 0])
    translate([-160, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    rounded_cylinder(d, h, 1, $fn=40);

    rotate([90 + 13.8, 0, 0])
    translate([-67, 21, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    rounded_cylinder(d, h, 1, $fn=40);

    rotate([90 + 13.8, 0, 0])
    translate([-34, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    rounded_cylinder(d, h, 1, $fn=40);

    rotate([90 + 13.8, 0, 0])
    translate([57, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    rounded_cylinder(d, h, 1, $fn=40);

    rotate([90 + 13.8, 0, 0])
    translate([160, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    rounded_cylinder(d, h, 1, $fn=40);

    rotate([90 + 13.8, 0, 0])
    translate([105, 21, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    rounded_cylinder(d, h, 1, $fn=40);
}

module _cone(screw_holes=false) {
    difference() {
        hull() {
            cylinder(d=10, h=1, $fn=30);

            translate([0, 0, 9])
            cylinder(d=19, h=5, $fn=30);
        }

        if (screw_holes) {
            cylinder(d=8, h=4, center=true, $fn=30);

            cylinder(d=2.8, h=20, center=true, $fn=30);
        }
    }
}

module _magnet_cone_holes(screw_holes=false) {
    z = -33.1;

    rotate([90 + 13.8, 0, 0])
    translate([-160, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    _cone(screw_holes=screw_holes);

    rotate([90 + 13.8, 0, 0])
    translate([-67, 21, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    _cone(screw_holes=screw_holes);

    rotate([90 + 13.8, 0, 0])
    translate([-34, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    _cone(screw_holes=screw_holes);

    rotate([90 + 13.8, 0, 0])
    translate([57, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    _cone(screw_holes=screw_holes);

    rotate([90 + 13.8, 0, 0])
    translate([160, 74, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    _cone(screw_holes=screw_holes);

    rotate([90 + 13.8, 0, 0])
    translate([105, 21, 0])
    rotate([-13.8, 0, 0])
    translate([0, 0, z])
    _cone(screw_holes=screw_holes);
}

module _frame_cutouts() {

    _magnet_holes(d=20, h=10, z=-43);

    _magnet_cone_holes();

    // coutouts
    difference() {
        union() {
            hull() {
                translate([-150.5, 0, 20])
                rotate([90, 0, 0])
                cylinder(d=3, h=100, center=true, $fn=20);

                translate([-151, 0, 70])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-170, 0, 70])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

            }

            hull() {
                translate([-68, 0, 17])
                rotate([90, 0, 0])
                cylinder(d=16, h=100, center=true, $fn=20);

                translate([-75, 0, 79])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-27, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([-33, 0, 73])
                rotate([90, 0, 0])
                cylinder(d=16, h=100, center=true, $fn=20);
            }

            hull() {
                translate([145, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([53, 0, 76])
                rotate([90, 0, 0])
                cylinder(d=10, h=100, center=true, $fn=20);

                translate([50, 0, 11])
                rotate([90, 0, 0])
                cylinder(d=4, h=100, center=true, $fn=20);

                translate([160.5, 0, 71])
                rotate([90, 0, 0])
                cylinder(d=20, h=100, center=true, $fn=20);

            }
        }
        _magnet_holes(d=26, h=40, z=-48);

        // beams
        hull() {
            rotate([90 + 13.8, 0, 0])
            translate([160.5, 64, -38])
            cylinder(d=5, h=100, center=true, $fn=20);

            rotate([90 + 13.8, 0, 0])
            translate([105, 11, -38])
            cylinder(d=5, h=100, center=true, $fn=20);
        }

        hull() {
            rotate([90 + 13.8, 0, 0])
            translate([57, 64, -38])
            cylinder(d=5, h=100, center=true, $fn=20);

            rotate([90 + 13.8, 0, 0])
            translate([105, 11, -38])
            cylinder(d=5, h=100, center=true, $fn=20);
        }

        hull() {
            rotate([90 + 13.8, 0, 0])
            translate([105, 84, -38])
            cylinder(d=5, h=100, center=true, $fn=20);

            rotate([90 + 13.8, 0, 0])
            translate([105, 11, -38])
            cylinder(d=5, h=100, center=true, $fn=20);
        }

        hull() {
            rotate([90 + 13.8, 0, 0])
            translate([105, 74, -38])
            cylinder(d=5, h=100, center=true, $fn=20);

            rotate([90 + 13.8, 0, 0])
            translate([163, 0, -38])
            cylinder(d=5, h=100, center=true, $fn=20);
        }

        hull() {
            rotate([90 + 13.8, 0, 0])
            translate([105, 74, -38])
            cylinder(d=5, h=100, center=true, $fn=20);

            rotate([90 + 13.8, 0, 0])
            translate([47, 0, -38])
            cylinder(d=5, h=100, center=true, $fn=20);
        }

        hull() {
            rotate([90 + 13.8, 0, 0])
            translate([-34, 64, -38])
            cylinder(d=5, h=100, center=true, $fn=20);

            rotate([90 + 13.8, 0, 0])
            translate([-67, 11, -38])
            cylinder(d=5, h=100, center=true, $fn=20);
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
            translate([-178 + i * 19.8, 20, 91 - 2.1])
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
        translate([-310/2, 0, 0])
        rotate([0, -111.75, 0])
        for(i = [0:4]) {
            translate([10 + i * 19.2, 50, -0.3 - 2.1])
            rotate([90, 0, 0])
            triangle();
        }

        // right dovetails
        translate([310/2, 0, 0])
        rotate([0, 111.75, 0])
        for(i = [0:4]) {
            translate([-10 - i * 19.2, 50, -0.3 - 2.1])
            rotate([90, 0, 0])
            triangle();
        }
    }
}

module frame_flat() {
    difference() {
        union() {
            _frame_body_flat();

            _magnet_holes(d=26, h=10, z=-41);
        }

        translate([0, -4.5, 0])
        rotate([13.8, 0, 0])
        cube([450, 60, 300], center=true);

        _frame_flange_cut();

        _cover_holes();

        _frame_cutouts();

        // side chamfers
        translate([381/2 - 30, 12.4, 0])
        rotate([11.5, 21.75, 0])
        rotate([0, 0, 45])
        cube([30, 30, 300], center=true);

        translate([-381/2 + 30, 12.4, 0])
        rotate([11.5, -21.75, 0])
        rotate([0, 0, 45])
        cube([30, 30, 300], center=true);

        // top chamfers
        translate([381/2, -4, 100])
        rotate([0, 0, 3])
        rotate([45 + 12, 0, 0])
        cube([300, 30, 30], center=true);

        translate([-381/2, -4, 100])
        rotate([0, 0, -3])
        rotate([45 + 12, 0, 0])
        cube([300, 30, 30], center=true);

        // dovetail cuts
        difference() {
            union() {
                // top dovetails
                for(i = [0:19]) {
                    translate([-178 + i * 19.8, 20, 91 - 2.1])
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
                translate([-310/2, 0, 0])
                rotate([0, -111.75, 0])
                for(i = [0:4]) {
                    translate([10 + i * 19.2, 50, -0.3 - 2.1])
                    rotate([90, 0, 0])
                    triangle();
                }

                // right dovetails
                translate([310/2, 0, 0])
                rotate([0, 111.75, 0])
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

        translate([310/2 - 2/2, 0, 2/2])
        rotate([0, 111.75, 0])
        translate([2/2, 0, 0])
        _side_clips();

        mirror([1, 0, 0])
        translate([310/2 - 2/2, 0, 2/2])
        rotate([0, 111.75, 0])
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

module top_clips() {
    translate([0, 0, -91 + 2])
    _top_clips();
}

module cover_flat() {
    union() {
        difference() {
            intersection() {
                _cover_body_flat(inner=false);

                union() {
                    translate([0, 5200/2 - 300 + 24, -25])
                    rotate([0, 0, -90])
                    donut(5200, 599.8, 20, $fn=200);

                    translate([0, -4.5, 0])
                    rotate([13.8, 0, 0])
                    cube([450, 60, 300], center=true);
                }
            }

            _cover_holes();

            translate([0, -0.1, 0])
            hull()
            frame_flat();

            // side chamfers
            translate([381/2 - 30, 10.4, 0])
            rotate([11.5, 21.75, 0])
            rotate([0, 0, 45])
            cube([30, 30, 300], center=true);

            translate([-381/2 + 30, 10.4, 0])
            rotate([11.5, -21.75, 0])
            rotate([0, 0, 45])
            cube([30, 30, 300], center=true);

            // top chamfers
            translate([381/2, -6, 100])
            rotate([0, 0, 3])
            rotate([45 + 12, 0, 0])
            cube([300, 30, 30], center=true);

            translate([-381/2, -6, 100])
            rotate([0, 0, -3])
            rotate([45 + 12, 0, 0])
            cube([300, 30, 30], center=true);
        }

        difference() {
            translate([0, -0.2, 0])
            _magnet_cone_holes(screw_holes=true);

            translate([0, -7.8, 0])
            rotate([13.8, 0, 0])
            cube([450, 60, 300], center=true);
        }
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