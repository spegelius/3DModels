use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Foldable Book Stand/"
);


//_orig_fbs_pins_etc();
//_orig_fbs_spine();
//debug();
//debug_rest();


//fbs_spine();

//fbs_left_cover();
//fbs_right_cover();

//fbs_left_leg();
//fbs_right_leg();

//fbs_left_rest();
//fbs_right_rest();

//fbs_rest_pin();
//fbs_rest_pin(supports=true);
//fbs_leg_pin();
//fbs_cover_pin();

//fbs_rest_arm_left();
//fbs_rest_arm_right();


module _orig_fbs_pins_etc() {
    translate([0, 0, 0])
    import(
        str(spath, "fbs_pins_etc.stl"),
        convexity=10
    );
}

module _orig_fbs_spine() {
    import(
        str(spath, "fbs_spine_no_lettering.stl"),
        convexity=10
    );
}

module _orig_fbs_left_cover() {
    import(
        str(spath, "fbs_left_cover.stl"),
        convexity=10
    );
}

module _fbs_left_cover_simple() {
    // simplified in PrusaSlicer, high detail
    import(
        "fbs_left_cover_simple.stl",
        convexity=10
    );
}

module _orig_fbs_right_cover() {
    import(
        str(spath, "fbs_right_cover.stl"),
        convexity=10
    );
}

module _orig_fbs_left_leg() {
    import(
        str(spath, "fbs_left_leg.stl"),
        convexity=10
    );
}

module _orig_fbs_right_leg() {
    import(
        str(spath, "fbs_right_leg.stl"),
        convexity=10
    );
}

module _orig_fbs_left_rest() {
    import(
        str(spath, "fbs_left_rest.stl"),
        convexity=10
    );
}

module debug() {
    render()
    intersection() {
        fbs_spine();

        translate([0, -50/2 + 9, 0])
        cube([50, 50, 600], center=true);
    }

    render()
    intersection() {
        translate([97.8, 1.4, 119])
        rotate([-90, 0, 0])
        fbs_left_cover();

        translate([0, 0, 0])
        cube([380, 16, 600], center=true);
    }

    render()
    intersection() {
        translate([-97.8, 1.4, 119])
        rotate([-90, 0, 0])
        fbs_right_cover();

        translate([0, 0, 0])
        cube([380, 16, 600], center=true);
    }

    render()
    intersection() {
        translate([118.4, 1.3, 153.4])
        rotate([90, 0, 180])
        fbs_left_leg();

        translate([0, 0, 0])
        cube([600, 15, 600], center=true);
    }

    render()
    intersection() {
        translate([-118.4, 1.3, 153.4])
        rotate([90, 0, 180])
        fbs_right_leg();

        translate([0, 0, 0])
        cube([600, 15, 600], center=true);
    }
    
    render()
    intersection() {
        translate([15.1, 15.4, 9])
        rotate([-90, 0, 180])
        fbs_left_rest();

        translate([0, 0, 0])
        cube([600, 20, 600], center=true);
    }

    render()
    intersection() {
        translate([-15.1, 15.4, 9])
        rotate([-90, 0, 180])
        fbs_right_rest();

        translate([0, 0, 0])
        cube([600, 20, 600], center=true);
    }

    render()
    translate([102.3, 5.5, 15])
    rotate([90, 0, 180])
    fbs_rest_pin();

    render()
    translate([-102.3, 5.5, 15])
    rotate([-90, 0, 0])
    fbs_rest_pin();

    translate([53.8, 5, 187.9])
    rotate([90, 23.4, 180])
    fbs_leg_pin();

    translate([-53.8, 5, 187.9])
    rotate([-90, 23.4, 0])
    fbs_leg_pin();

    translate([8.05, 6.1, 18])
    rotate([0, -90, -90])
    fbs_cover_pin();

    translate([8.05, 6.1, 220.2])
    rotate([0, 90, 90])
    fbs_cover_pin();
    
    translate([-8.05, 6.1, 18])
    rotate([0, -90, -90])
    fbs_cover_pin();

    translate([-8.05, 6.1, 220.2])
    rotate([0, 90, 90])
    fbs_cover_pin();
}

module debug_rest() {

    intersection() {
        difference() {
            fbs_left_rest();

            %translate([-77.52, -64, 3.29])
            rotate([90, 0, 0])
            cylinder(d=3.5, h=30, center=true, $fn=30);
        }

        cube([300, 300, 7], center=true);
    }

//    translate([-38.7, -62.3, 2.6])
//    rotate([90, 0, 0])
//    fbs_rest_arm_left();
}


module fbs_rest_pin(supports=false) {
    difference() {
        translate([130, -33.22, 0])
        intersection() {
            _orig_fbs_pins_etc();

            translate([-130, 24, 0])
            cube([200, 30, 40], center=true);
        }
        translate([0, 0, 4.5])
        rotate([0, 90, 0])
        cylinder(d=1, h=300, center=true, $fn=20);

        translate([81, 0, 0])
        cylinder(d=1.8, h=40, $fn=20);

        if (supports) {
            translate([4, 0, 0])
            cube([170, 6, 4.8], center=true);
        }
    }

    if (supports) {
        difference() {
            hull() {
                translate([1.9, 0, 0.2/2 + 2])
                cube([165.5, 4, 0.2], center=true);

                translate([1.9, 0, 0.2/2])
                cube([163, 4, 0.2], center=true);
            }

            translate([1.9, 0, 0])
            cube([165.6, 2, 3], center=true);
        }

        difference() {
            translate([-83.7, 0, 2/2])
            cube([5, 8.5, 2], center=true);

            translate([0, 0, 9/2])
            rotate([0, 90, 0])
            cylinder(d=9.2, h=200, center=true, $fn=30);
        }
    }
}

module fbs_leg_pin() {
    difference() {
        translate([170, -56.64, -1.6])
        intersection() {
            _orig_fbs_pins_etc();

            translate([-170, 56.64, 21.6])
            cube([90, 8, 40], center=true);
        }

        translate([0, 0, 4.6/2])
        rotate([0, 90, 0])
        cylinder(d=0.3, h=100, center=true, $fn=10);

        translate([35, 0, 0])
        cylinder(d=1.8, h=40, $fn=20);
    }

//    %translate([0, 0, 2.18])
//    rotate([0, 90, 0])
//    cylinder(d=5.6, h=20, center=true, $fn=40);
}

module fbs_cover_pin() {
    difference() {
        translate([147, -77.08, -1.2])
        intersection() {
            _orig_fbs_pins_etc();

            translate([-147, 77.08, 21.2])
            cube([45, 8, 40], center=true);
        }

        translate([0, 0, 4.6/2])
        rotate([0, 90, 0])
        cylinder(d=0.3, h=100, center=true, $fn=10);

        translate([15, 0, 0])
        cylinder(d=1.8, h=40, $fn=20);
    }
//    %translate([0, 0, 2.33])
//    rotate([0, 90, 0])
//    cylinder(d=5.6, h=20, center=true, $fn=40);
}

module fbs_spine(support=true) {

    module _support_pole() {
        difference() {
            cylinder(d=16, h=30, $fn=30);
            cylinder(d=15, h=58, center=true, $fn=30);
        }
    }

    module _tall_support_pole() {
        difference() {
            hull() {
                cylinder(d=15, h=0.1, $fn=20);

                translate([0, 0, 100])
                cylinder(d=2, h=0.1, $fn=20);
            }

            hull() {
                cylinder(d=13, h=0.2, center=true, $fn=20);

                translate([0, 0, 99])
                cylinder(d=1.1, h=0.1, $fn=20);
            }
        }
    }

    module _main_spine() {
        difference() {
            translate([0, 120, 120])
            rotate([0, 90, -90])
            _orig_fbs_spine();

            #translate([-8.05, 0, 33])
            rotate([90, 0, 0])
            cylinder(d=1.8, h=32, center=true, $fn=20);

            #translate([-8.05, 0, 205.2])
            rotate([90, 0, 0])
            cylinder(d=1.8, h=32, center=true, $fn=20);

            #translate([8.05, 0, 33])
            rotate([90, 0, 0])
            cylinder(d=1.8, h=32, center=true, $fn=20);

            #translate([8.05, 0, 205.2])
            rotate([90, 0, 0])
            cylinder(d=1.8, h=32, center=true, $fn=20);

            translate([8.5, 9, 0])
            cylinder(d=17, h=20.1, $fn=30);

            translate([-8.5, 9, 0])
            cylinder(d=17, h=20.1, $fn=30);
        }

        if (support) {
            translate([8.5, 9, -10.1])
            _support_pole();

            translate([-8.5, 9, -10.1])
            _support_pole();

            translate([0, -64.5, 20])
            rotate([-30, 0, 0])
            _tall_support_pole();
        }
    }

    intersection() {
        rotate([30, 0, 0])
        _main_spine();

        translate([0, 0, 0.2])
        cylinder(d=300, h=300);
    }
}

module fbs_left_cover() {

    difference() {

        union() {
            intersection() {
                translate([249.25, 252.05, 0])
                rotate([0, 0, 180])
                _fbs_left_cover_simple();
//
//              translate([-50, 0, 0])
//              cube([100, 300, 10], center=true);
            }

            translate([68.7, -32, 2/2 + 0.018])
            rotate([0, 0, 9])
            chamfered_cube(
                2, 50, 2, 0.5, center=true
            );

            translate([52.5, -33, 2/2 + 0.018])
            rotate([0, 0, 21])
            chamfered_cube(
                2, 58, 2, 0.5, center=true
            );

            translate([37.4, -43, 2/2 + 0.018])
            rotate([0, 0, 34.8])
            chamfered_cube(
                2, 58, 2, 0.5, center=true
            );

            translate([22.4, -58, 2/2 + 0.018])
            rotate([0, 0, 50.5])
            chamfered_cube(
                2, 54, 2, 0.5, center=true
            );

            translate([77.2, 104.1, 3.3])
            cube([6, 7, 4], center=true);

            translate([77.2, 107.1, 5.3])
            cube([6, 7, 7], center=true);
        }

        translate([-76.5, 104, 0])
        cylinder(d=1.8, h=40, center=true, $fn=20);

        translate([-76.15, -55, 0])
        cylinder(d=1.8, h=40, center=true, $fn=20);

        translate([0, 103.9, 7.87])
        hull() {
            rotate([0, 90, 0])
            cylinder(d=6.05, h=400, center=true, $fn=40);

            translate([0, 0, 2.8])
            cube([400, 1.5, 1], center=true);
        }

        translate([-89.853, 0, 7.02])
        hull() {
            rotate([90, 0, 0])
            cylinder(d=6.06, h=400, center=true, $fn=40);

            translate([0, 0, 2.8])
            cube([1.5, 400, 1], center=true);
        }

        translate([0, -88.21, 5.77])
        hull() {
            rotate([0, -90, -23.5])
            translate([0, 0, 58])
            cylinder(d=6.08, h=100, center=true, $fn=40);

            translate([0, 0, 2.8])
            rotate([0, 0, -23.5])
            translate([-58, 0, 0])
            cube([100, 1.5, 1], center=true);
        }
    }
}

module fbs_right_cover() {
    mirror([1, 0, 0])
    fbs_left_cover();
}

module fbs_left_leg() {
    difference() {
        translate([-200, 600, -5.5])
        _orig_fbs_left_leg();

        translate([0, 62.63, 6.02])
        hull() {
            rotate([0, -90, -23.5])
            cylinder(d=6.05, h=200, center=true, $fn=40);

            translate([0, 0, 2.8])
            rotate([0, 0, -23.5])
            cube([200, 1.5, 1], center=true);
        }
    }
}

module fbs_right_leg() {
    difference() {
        translate([-390, 600, -0.5])
        _orig_fbs_right_leg();

        translate([0, 62.63, 6.02])
        hull() {
            rotate([0, -90, 23.5])
            cylinder(d=6.05, h=200, center=true, $fn=40);

            translate([0, 0, 2.8])
            rotate([0, 0, 23.5])
            cube([200, 1.5, 1], center=true);
        }
    }
}

module fbs_left_rest() {

    difference() {
        union() {
            rotate([90, 0, 0])
            translate([0, -39.25, -9.5])
            _orig_fbs_left_rest();

            translate([-77.52, -54, 3.29])
            rotate([90, 0, 0])
            tube(4.6, 16.535, 0.9, center=true, $fn=30);
        }

        translate([0, -6.115, 6.01])
        hull() {
            rotate([0, 90, 0])
            cylinder(d=6.05, h=400, center=true, $fn=40);

            translate([0, 0, 2.8])
            cube([400, 1.5, 1], center=true);
        }
    }
}

module fbs_right_rest() {
    mirror([1, 0, 0])
    fbs_left_rest();
}

module fbs_rest_arm_left() {
    difference() {
        translate([80, -56.7, -0.95])
        intersection() {
            _orig_fbs_pins_etc();

            translate([-88, 56.7, 0])
            cube([80, 8, 40], center=true);
        }

        translate([-38.83, 0.6, 3.7])
        cylinder(d1=3, d2=8, h=2.5, $fn=30);
    }
}

module fbs_rest_arm_right() {
    mirror([1, 0, 0])
    fbs_rest_arm_left();
}