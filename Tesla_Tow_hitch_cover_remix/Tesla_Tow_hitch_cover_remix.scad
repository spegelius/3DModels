use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Tesla/Tow Hitch Cover/"
);



//_orig_cover_left();
//_orig_cover_right();
//_orig_electric_cover();
//_side_clip();

//debug();

//new_cover_left();
//new_cover_left_no_clips();
//new_cover_left_support();
//new_cover_left_soluble_support();

//new_cover_right();
//new_cover_right_no_clips();
//new_cover_right_support();
//new_cover_right_soluble_support();

//full_cover();
full_cover_no_clips();

//full_cover_supports();
//full_cover_soluble_supports();

//side_clip_left();
//side_clip_right();

//new_electric_cover();

//test_parts_side_clip();


module _orig_cover_left() {
    translate([-198.5, 0, 0])
    rotate([90, 0, 0])
    import(
        str(spath, "Cover_V2_RightPlate_.stl"),
        convexity=10
    );
}

module _orig_cover_right() {
    translate([-198.51, 0, 0])
    rotate([90, 0, 0])
    import(
        str(spath, "Cover_V2_LeftPlate_.stl"),
        convexity=10
    );
}

module _orig_electric_cover() {
    translate([-198.5, 0, -0.1])
    rotate([90, 0, 0])
    import(
        str(spath, "Cover_V2_ElectricConnector.stl"),
        convexity=10
    );
}

module debug() {
    intersection() {
        new_cover_left_no_clips();

        //cube([500, 104, 20], center=true);
    }

    intersection() {
        translate([0.1, 0, 0])
        new_cover_right_no_clips();

        //cube([1500, 104, 20], center=true);
    }

    translate([-221.3, 23.25])
    rotate([0, -90, 0])
    side_clip_right();

    translate([221.4, 23.25])
    rotate([0, 90, 0])
    side_clip_left();
}


module _clip_hole(screw_hole=true) {
    union() {
        translate([0, 2, 0])
        rotate([0, 0, 0])
        cube([10, 30, 50], center=true);

        hull() {
            translate([0, 1.6, 2.5])
            cube([10, 36, 0.1], center=true);

            translate([0, 1.6, 2.5])
            cube([10, 31.5, 5.1], center=true);
        }

        if (screw_hole) {
            translate([0, 0, 2.5])
            rotate([0, 90, 0])
            cylinder(d=2.5, h=30, center=true, $fn=20);
        }
    }
}

module _side_clip() {
    difference() {
        union() {
            translate([0, -23.25, -22.79])
            rotate([0, 90, 0])
            intersection() {
                translate([198.5, 0, 0])
                _orig_cover_left();

                translate([-27.79, 23.25, 0])
                scale([1, 0.99, 1])
                _clip_hole(screw_hole=false);
            }

            translate([2.5, 0, 0])
            cylinder(d=6, h=2.21, $fn=30);

            translate([3.5, 1, 2.21/2])
            cube([5, 23, 2.21], center=true);
        }

        translate([2.5, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=20);

        translate([2.5, 0, 0.8])
        cylinder(d1=3, d2=7, h=2, $fn=20);

        translate([-5/2, 0, 0])
        cube([5, 40, 13], center=true);
    }
}

module _indent_form() {
    difference() {
        linear_extrude(10)
        offset(-5)
        projection(cut=true)
        _full_cover(clips=true);

        // criss cross
        for(i=[0:6]) {
            translate([-170 + i* (170/3), 0, 0])
            cube([1.8, 200, 30], center=true);
        }

        translate([0, 20, 0])
        cube([500, 1.8, 30], center=true);

        translate([0, -30, 0])
        cube([500, 1.8, 30], center=true);

        // clips
        translate([-226, 25, 0])
        cube([20, 34, 30], center=true);

        translate([226, 25, 0])
        cube([20, 34, 30], center=true);

        translate([-226, -57, 0])
        cube([20, 34, 30], center=true);

        translate([226, -57, 0])
        cube([20, 34, 30], center=true);
    }
}

module _indent_form_split() {
    difference() {
        translate([0, 0, 1])
        _indent_form();

        cube([8, 200, 20], center=true);

        translate([0, -70/2 - 14, 4.9/2])
        rounded_cube_side(
            93, 70, 4.9, 8, center=true, $fn=30
        );
    }
}

module side_clip_right() {
    _side_clip();
}

module side_clip_left() {
    mirror([1, 0, 0])
    _side_clip();
}

module new_cover_left() {
    difference() {
        _new_cover_left(clips=true);

        _indent_form_split();
    }
}

module new_cover_left_no_clips() {
    difference() {
        _new_cover_left(clips=false);

        _indent_form_split();
    }
}

module _new_cover_left_base(clips=true) {
    difference() {
        union() {
            _orig_cover_left();

            // hole fill
            translate([-208, 25, 5/2])
            cube([30, 30, 4], center=true);

            translate([-208, -57, 5/2])
            cube([30, 30, 4], center=true);
        }

        // corner rounding
        difference() {
            translate([-204.5, -10, 5.1/2 - 0.1])
            cube([100, 160, 5.1], center=true);

            hull() {
                translate([-216.6, 44.4, -0.2])
                chamfered_cylinder(14, 5.3, 1, $fn=50);

                translate([-217.6, 15, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([-145.5, 56, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([-145.5, 15, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([-214.6, -75.6, -0.2])
                chamfered_cylinder(18, 5.3, 1, $fn=50);

                translate([-145.5, -80, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);
            }

            translate([-223.5, 24.85, 7])
            cube([10, 30, 11], center=true);

            translate([-223.5, -57.2, 7])
            cube([10, 30, 11], center=true);
        }

        difference() {
            translate([-198.5, -85, 5.1/2 - 0.1])
            cube([500, 12, 5.1], center=true);

            hull() {

                translate([-217.6, -78.6, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=50);

                translate([54.5, -78.6, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);
            }
        }

        difference() {
            translate([-16.5, 65, 5.1/2 - 0.1])
            cube([200, 12, 5.1], center=true);

            hull() {

                translate([-128.5, 58, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=50);

                translate([-78.5, 61.3, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([-28.5, 63.3, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([-28.5, 53.3, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);
            }
        }

        hull() {
            translate([-120.5 - 4/2, -67.5, 0])
            cube([4, 2, 20], center=true);

            translate([-120.5 + 4/2, -67.5, 0])
            cube([4, 2, 20], center=true);

            translate([-120.5, -67.5, 0])
            cylinder(d=7.2, h=20, center=true, $fn=40);
        }
    }
}

module _new_cover_left(clips=true) {
    difference() {
        _new_cover_left_base(clips=clips);

        if (!clips) {
            // clip holes
            translate([-226.2, 23.25, 0])
            _clip_hole();

            translate([-226.2, -59, 0])
            _clip_hole();
        }
    }
}

module new_cover_right() {
    difference() {
        _new_cover_right(clips=true);

        _indent_form_split();
    }
}

module new_cover_right_no_clips() {
    difference() {
        _new_cover_right(clips=false);

        _indent_form_split();
    }
}

module _new_cover_right_base(clips=true) {
    difference() {
        union() {
            _orig_cover_right();
        }

        // corner rounding
        difference() {
            translate([204.5, -10, 5.1/2 - 0.1])
            cube([100, 160, 5.1], center=true);

            hull() {
                translate([215.5, 43.4, -0.2])
                chamfered_cylinder(16, 5.3, 1, $fn=50);

                translate([217.5, 15, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([146.5, 56, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([146.5, 15, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([214.5, -75.6, -0.2])
                chamfered_cylinder(18, 5.3, 1, $fn=50);

                translate([146.5, -80, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);
            }
            translate([225.5, 24.85, 7])
            cube([10, 30, 11], center=true);

            translate([225.5, -57.2, 7])
            cube([10, 30, 11], center=true);
        }

        difference() {
            translate([1.5, -85, 5.1/2 - 0.1])
            cube([500, 12, 5.1], center=true);

            hull() {

                translate([-17.6, -78.6, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=50);

                translate([217.5, -78.6, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);
            }
        }

        difference() {
            translate([16.5, 65, 5.1/2 - 0.1])
            cube([200, 12, 5.1], center=true);

            hull() {

                translate([131.5, 57.3, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=50);

                translate([81.5, 61.2, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([31.5, 63.3, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);

                translate([31.5, 53.3, -0.2])
                chamfered_cylinder(12, 5.3, 1, $fn=30);
            }
        }

        hull() {
            translate([120.5 - 4/2, -67.5, 0])
            cube([4, 2, 20], center=true);

            translate([120.5 + 4/2, -67.5, 0])
            cube([4, 2, 20], center=true);

            translate([120.5, -67.5, 0])
            cylinder(d=7.2, h=20, center=true, $fn=40);
        }
        hull() {
            translate([145.3, 23, -13])
            chamfered_cylinder(61, 15, 3, $fn=80);

            translate([145.3, 19, -13])
            chamfered_cylinder(61, 15, 3, $fn=80);
        }

        hull() {
            translate([145.3, 23, 3])
            chamfered_cylinder(61, 15, 3, $fn=80);

            translate([145.3, 19, 3])
            chamfered_cylinder(61, 15, 3, $fn=80);
        }

        translate([173, -9.3, 10/2 + 3])
        chamfered_cube(37, 10, 10, 3, center=true);

        translate([173, -9.3, -10/2 + 2])
        chamfered_cube(37, 10, 10, 3, center=true);

        translate([178.6, 47.6, 10/2 + 3])
        rotate([0, 0, -8])
        chamfered_cube(37, 10, 10, 3, center=true);

        translate([178.6, 47.6, -10/2 + 2])
        rotate([0, 0, -8])
        chamfered_cube(37, 10, 10, 3, center=true);
    }
}

module _new_cover_right(clips=true) {
    difference() {
        _new_cover_right_base(clips=clips);

        if (!clips) {
            // clip holes
            translate([226.2, 23.25, 0])
            _clip_hole();

            translate([226.2, -59, 0])
            _clip_hole();
        }
    }
}

module _new_cover_left_support_form() {
    difference() {
        translate([-136.5, 60, 4.899/2])
        cube([38, 30, 4.899], center=true);

        translate([0, 0.5, 0])
        _orig_cover_left();

        translate([-134.5, 77, 0])
        rotate([0, 0, 6])
        cube([50, 10, 11], center=true);
    }
}

module new_cover_left_support() {
    intersection() {
        _new_cover_left_support_form();

        cube([400, 200, 4.4*2], center=true);
    }
}

module new_cover_left_soluble_support() {
    intersection() {
        _new_cover_left_support_form();

        translate([0, 0, 4.4 + 1/2])
        cube([400, 200, 1], center=true);
    }
}

module _new_cover_right_support_form() {
    difference() {
        translate([136, 65.5, 4.899/2])
        cube([38, 19, 4.899], center=true);

        translate([0, 0.5, 0])
        _orig_cover_right();

        translate([136, 77, 0])
        rotate([0, 0, -6])
        cube([50, 10, 11], center=true);
    }
}

module new_cover_right_support() {
    intersection() {
        _new_cover_right_support_form();

        cube([400, 200, 4.4*2], center=true);
    }
}

module new_cover_right_soluble_support() {
    intersection() {
        _new_cover_right_support_form();

        translate([0, 0, 4.4 + 1/2])
        cube([400, 200, 1], center=true);
    }
}

module _full_cover(clips=true) {
    union() {
        _new_cover_left(clips=clips);
        _new_cover_right(clips=clips);

        translate([0, -70/2 - 5, 4.9/2])
        cube([100, 70, 4.9], center=true);
    }
}

module full_cover() {
    difference() {
        _full_cover(clips=true);

        translate([0, 0, 1])
        _indent_form();
    }
}

module full_cover_no_clips() {
    difference() {
        _full_cover(clips=false);

        translate([0, 0, 1])
        _indent_form();
    }
}

module full_cover_supports() {
    new_cover_left_support();

    new_cover_right_support();
}

module full_cover_soluble_supports() {
    new_cover_left_soluble_support();

    new_cover_right_soluble_support();
}

module new_electric_cover() {
    difference() {
        union() {
            _orig_electric_cover();

            translate([215.4, 20.425, 3.2])
            cube([2, 14.85, 4], center=true);

            intersection() {
                translate([148.7, 22.3, 6.4])
                donut(58, 7.4, $fn=80);

                translate([0, 22.3, 0])
                cube([241, 19.5, 20], center=true);
            }

            translate([158.27, -9.4, 6.3])
            rotate([0, 90, 0])
            cylinder(d=7, h=30, $fn=30);

            translate([166.75, 49.3, 6.1])
            rotate([0, 90, -8])
            cylinder(d=7, h=25, $fn=30);
        }

        translate([215.4, 20.425, 5/2 + 5])
        cube([6, 16, 5], center=true);

        translate([149.6, 22.3, 2])
        rounded_cylinder(62, 20, 8, $fn=60);

        translate([165, -12, 13])
        rotate([-30, 0, 0])
        cube([50, 5, 15], center=true);

        translate([170, 51.26, 13])
        rotate([30, 0, -8])
        cube([50, 5, 15], center=true);

        translate([170, -4.7, 15/2 + 2])
        rotate([0, 0, 0])
        rounded_cube(50, 10, 15, 4, center=true, $fn=30);

        translate([170, 44.3, 15/2 + 2])
        rotate([0, 0, -8])
        rounded_cube(50, 10, 15, 4, center=true, $fn=30);

        translate([155, -15, 10/2 + 1.91])
        rotate([0, 0, 45])
        cube([10, 10, 10], center=true);

        translate([191.5, -15, 10/2 + 1.91])
        rotate([0, 0, 45])
        cube([10, 10, 10], center=true);

        translate([164, 55, 10/2 + 1.91])
        rotate([0, 0, 45 - 8])
        cube([10, 10, 10], center=true);

        translate([194, 53, 10/2 + 1.91])
        rotate([0, 0, 45 - 8])
        cube([10, 10, 10], center=true);
        
        translate([150, 20, 9.4])
        cylinder(d=200, h=10);

    }
}

module test_parts_side_clip() {
    side_clip_right();

    translate([-194, 56.75, 0])
    intersection() {
        new_cover_right_no_clips();

        translate([222.5, -57.2, 0])
        cube([15, 39, 20], center=true);
    }
}