use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Toy Roller Compactor/"
);


//_orig_cylinders();
//_orig_cylinder();
//_orig_roller_axle_holders();
//_orig_roller_axle_holder_front();
//_orig_roller_axle_holder_back();
//_orig_roller_regular_print();
//_orig_roller_body_front();
//_orig_roller_body_back();
//_orig_roller_rolbar();
//_orig_roller_axle_holder();

//_new_roller_cylinder();

//orig_assembly();
//new_assembly();


//new_roller_cylinder();
//new_roller_cylinder_dc_yellow();
//new_roller_cylinder_dc_black();

//new_roller_axle_holder_front();
//new_roller_axle_holder_front_dc_black();
//new_roller_axle_holder_front_dc_yellow();

//new_roller_axle_holder_back();
//new_roller_axle_holder_back_dc_black();
//new_roller_axle_holder_back_dc_yellow();

new_roller_body_front();
//new_roller_body_front_black();
//new_roller_body_front_grey();
//new_roller_body_front_yellow();

//new_roller_body_back();
//new_roller_body_back_black();
//new_roller_body_back_grey();
//new_roller_body_back_yellow();


module _orig_cylinders() {
    translate([-20, 55, 40.8])
    import(
        str(spath, "cylinders.stl"),
        convexity=10
    );
}

module _orig_cylinder() {
    intersection() {
        _orig_cylinders();

        cylinder(d=40, h=200, center=true);
    }
}

module _orig_roller_axle_holders() {
    translate([0, 0, 46.84])
    import(
        str(spath, "roller_axle_holders.stl"),
        convexity=10
    );
}

module _orig_roller_axle_holder_front() {
    translate([5, 0, 0])
    intersection() {
        _orig_roller_axle_holders();

        translate([-5, 15, 0])
        cube([20, 50, 30], center=true);
    }
}

module _orig_roller_axle_holder_back() {
    translate([-24.8, 0, 0])
    intersection() {
        _orig_roller_axle_holders();

        translate([24, 15, 0])
        cube([20, 50, 30], center=true);
    }
}

module _orig_roller_regular_print() {
    translate([-17, 27.5, 40.8])
    import(
        str(spath, "roller_regular_print.stl"),
        convexity=10
    );
}

module _orig_roller_body_front() {
    intersection() {
        _orig_roller_regular_print();

        difference() {
            translate([-100/2 + 6, 0, 0])
            cube([100, 100, 200], center=true);

            translate([1, 0, 20.5])
            cube([12, 20, 10], center=true);

            translate([1, 0, 7.7])
            cube([12, 20, 5.4], center=true);

            translate([-70, 0, 11])
            cube([12, 80, 5.4], center=true);
        }
    }
}

module _orig_roller_body_back() {
    intersection() {
        _orig_roller_regular_print();

        difference() {
            translate([100/2 - 6, 0, 0])
            cube([100, 100, 200], center=true);

            translate([-1, 0, 12.95])
            cube([12, 20, 5.4], center=true);

            translate([-1, 0, 5.4/2 - 0.25])
            cube([12, 20, 5.4], center=true);
        }
    }
}

module _orig_roller_rolbar() {
    import(
        str(spath, "roller_rolbar.stl"),
        convexity=10
    );
}

module new_roller_body_back_stl() {
    import(
        "new_roller_body_back.stl",
        convexity=10
    );
}


module orig_assembly() {
    _orig_roller_regular_print();

    translate([-52, 33.5, 0])
    rotate([90, 0, 0])
    _orig_roller_axle_holder_front();

    translate([-52, -33.5, 0])
    rotate([90, 0, 180])
    _orig_roller_axle_holder_front();

    translate([47.8, 33.5, 0])
    rotate([90, 0, 0])
    _orig_roller_axle_holder_back();

    translate([47.8, -33.5, 0])
    rotate([90, 0, 180])
    _orig_roller_axle_holder_back();

    translate([-52, 27.5, 0])
    rotate([90, 0, 0])
    _orig_cylinder();

    translate([48, 27.5, 0])
    rotate([90, 0, 0])
    _orig_cylinder();
}

module new_assembly() {

    //intersection() {
        //new_roller_body_front();


//        translate([0, 0, -200/2 + 30])
//        cube([200, 100, 200], center=true);
//    }

    color("black")
    render()
    new_roller_body_front_black();

    color("darkgrey")
    render()
    new_roller_body_front_grey();

    !color("yellow")
    render()
    new_roller_body_front_yellow();

    new_roller_body_back();

    translate([-52, 33.5, 0])
    rotate([90, 0, 0]) {
        color("yellow")
        render()
        new_roller_axle_holder_front_dc_yellow();

        color("black")
        render()
        new_roller_axle_holder_front_dc_black();
    }

    translate([-52, -33.5, 0])
    rotate([90, 0, 180]) {
        color("yellow")
        render()
        new_roller_axle_holder_front_dc_yellow();

        color("black")
        render()
        new_roller_axle_holder_front_dc_black();
    }

    translate([47.8, 33.5, 0])
    rotate([90, 0, 0]) {
        color("yellow")
        render()
        new_roller_axle_holder_back_dc_yellow();

        color("black")
        render()
        new_roller_axle_holder_back_dc_black();
    }

    translate([47.8, -33.5, 0])
    rotate([90, 0, 180]) {
        color("yellow")
        render()
        new_roller_axle_holder_back_dc_yellow();

        color("black")
        render()
        new_roller_axle_holder_back_dc_black();
    }

    translate([-52, 27.5, 0])
    rotate([90, 0, 0]) {
        color("yellow")
        render()
        new_roller_cylinder_dc_yellow();

        color("darkgrey")
        render()
        new_roller_cylinder_dc_black();
    }

    translate([47.8, 27.5, 0])
    rotate([90, 0, 0]) {
        color("yellow")
        render()
        new_roller_cylinder_dc_yellow();

        color("darkgrey")
        render()
        new_roller_cylinder_dc_black();
    }

}

module new_roller_cylinder() {
    difference() {
        union() {
            _orig_cylinder();
            tube(4.7, 54.96, 1, $fn=30);
        }

        difference() {
            union() {
                translate([0, 0, 55 - 3])
                chamfered_cylinder(31, 20, 3, $fn=40);

                translate([0, 0, -20 + 3])
                chamfered_cylinder(31, 20, 3, $fn=40);
            }

            chamfered_cylinder(22, 54.96, 3, $fn=40);
        }
    }
}

module new_roller_cylinder_dc_yellow() {
    intersection() {
        new_roller_cylinder();

        union() {
            cylinder(d=32, h=6.8, center=true, $fn=60);

            translate([0, 0, 55])
            cylinder(d=32, h=6.8, center=true, $fn=60);
        }
    }
}

module new_roller_cylinder_dc_black() {
    difference() {
        new_roller_cylinder();

        union() {
            cylinder(d=32, h=6.8, center=true, $fn=60);

            translate([0, 0, 55])
            cylinder(d=32, h=6.8, center=true, $fn=60);
        }
    }
}

module new_roller_axle_holder_front() {
    difference() {
        intersection() {
            _orig_roller_axle_holder_front();
        }

        translate([0, 37.4, 10.95])
        cube([30, 10, 10], center=true);

        translate([0, 27.5, 0])
        cylinder(d=3.3, h=100, center=true, $fn=30);

        translate([0, 27.5, -6])
        chamfered_cylinder(7, 10, 3.1, $fn=30);

        translate([0, 0, -4])
        chamfered_cylinder(6, 10, 2.5, $fn=30);

        translate([-11.2, 35.7, 0])
        chamfered_cube(
            10, 10, 11, 2, center=true
        );

        translate([11.2, 35.7, 0])
        chamfered_cube(
            10, 10, 11, 2, center=true
        );
    }
}

module new_roller_axle_holder_front_dc_black() {
    intersection() {
        new_roller_axle_holder_front();

        union() {
            cylinder(d=9, h=4, center=true, $fn=6);

            translate([-1.5, 12, 0])
            cube([1, 22, 0.8], center=true);

            translate([0, 12, 0])
            cube([1, 22, 0.8], center=true);

            translate([1.5, 12, 0])
            cube([1, 22, 0.8], center=true);
        }
    }
}

module new_roller_axle_holder_front_dc_yellow() {
    difference() {
        new_roller_axle_holder_front();

        cylinder(d=9, h=4, center=true, $fn=6);

        translate([-1.5, 12, 0])
        cube([1, 22, 0.8], center=true);

        translate([0, 12, 0])
        cube([1, 22, 0.8], center=true);

        translate([1.5, 12, 0])
        cube([1, 22, 0.8], center=true);
    }
}


module new_roller_axle_holder_back() {
    difference() {
        intersection() {
            _orig_roller_axle_holder_back();
        }

        translate([0, 39.9, 10.95])
        cube([30, 10, 10], center=true);

        translate([0, 30, 0])
        cylinder(d=3.3, h=100, center=true, $fn=30);

        translate([0, 30, -6])
        chamfered_cylinder(7, 10, 3.1, $fn=30);

        translate([0, 0, -4])
        chamfered_cylinder(6, 10, 2.5, $fn=30);

        translate([-11.2, 38.2, 0])
        chamfered_cube(
            10, 10, 11, 2, center=true
        );

        translate([11.2, 38.2, 0])
        chamfered_cube(
            10, 10, 11, 2, center=true
        );
    }
}

module new_roller_axle_holder_back_dc_black() {
    intersection() {
        new_roller_axle_holder_back();

        union() {
            cylinder(d=9, h=4, center=true, $fn=6);

            translate([-1.5, 13, 0])
            cube([1, 25, 0.8], center=true);

            translate([0, 13, 0])
            cube([1, 25, 0.8], center=true);

            translate([1.5, 13, 0])
            cube([1, 25, 0.8], center=true);
        }
    }
}

module new_roller_axle_holder_back_dc_yellow() {
    difference() {
        new_roller_axle_holder_back();

        cylinder(d=9, h=4, center=true, $fn=6);

        translate([-1.5, 13, 0])
        cube([1, 25, 0.8], center=true);

        translate([0, 13, 0])
        cube([1, 25, 0.8], center=true);

        translate([1.5, 13, 0])
        cube([1, 25, 0.8], center=true);
    }
}

module new_roller_body_front() {
    difference() {
        union() {
            _orig_roller_body_front();

            translate([0, 0, 10.5])
            intersection() {
                _orig_roller_body_front();

                translate([-1, 0, 13])
                cube([15, 20, 5.2], center=true);
            }

            translate([-52, 0, 28.4])
            cube([17, 45, 9], center=true);

            translate([-67.3, 10, 24])
            rotate([0, 90, 0])
            rounded_cube_side(
                5, 10, 3, 2, center=true, $fn=30
            );

            translate([-67.3, -10, 24])
            rotate([0, 90, 0])
            rounded_cube_side(
                5, 10, 3, 2, center=true, $fn=30
            );

            hull() {
                translate([-64, -24, 1/2])
                cube([10, 1, 1], center=true);

                translate([-66.9, -24, 15])
                cube([4, 1, 1], center=true);
            }

            hull() {
                translate([-64, 24, 1/2])
                cube([10, 1, 1], center=true);

                translate([-66.9, 24, 15])
                cube([4, 1, 1], center=true);
            }
            
        }

        translate([0, 0, 23])
        cylinder(d=6, h=10, $fn=30);

        translate([0, 0, -0.1])
        M3_nut(3, cone=false, bridging=true);

        translate([-52, 0, 27.5])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=100, center=true, $fn=30);

        hull() {
            translate([-16, 30, 32])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([-14, 30, 26])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([-34, 30, 28])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([-36, 30, 30])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);
        }

        hull() {
            translate([-16, -30, 32])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([-14, -30, 26])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([-34, -30, 28])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([-36, -30, 30])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);
        }
    }
}

module new_roller_body_front_black() {
    intersection() {
        new_roller_body_front();

        difference() {
            union() {
                translate([-74, 0, 42])
                cube([60, 100, 30], center=true);

                translate([-24, 0, 39.8])
                rotate([0, 6, 0])
                cube([60, 100, 30], center=true);
            }

            translate([0, 0, 24])
            cube([20, 30, 10], center=true);
        }
    }
}

module new_roller_body_front_grey() {
    intersection() {
        new_roller_body_front();

        union() {
            translate([-67.3, 10, 24])
            rotate([0, 90, 0])
            rounded_cube_side(
                5, 10, 3, 2, center=true, $fn=30
            );

            translate([-67.3, -10, 24])
            rotate([0, 90, 0])
            rounded_cube_side(
                5, 10, 3, 2, center=true, $fn=30
            );

            translate([0, 0, 23.5])
            cube([22, 17, 5.2], center=true);

            translate([0, 0, 13])
            cube([22, 17, 5.2], center=true);

            translate([0, 0, 5/2])
            cube([22, 17, 5.2], center=true);

        }
    }
}

module new_roller_body_front_yellow() {
    difference() {
        new_roller_body_front();

        difference() {
            union() {
                translate([-74, 0, 42])
                cube([60, 100, 30], center=true);

                translate([-24, 0, 39.8])
                rotate([0, 6, 0])
                cube([60, 100, 30], center=true);
            }

            translate([0, 0, 24])
            cube([20, 30, 10], center=true);
        }

        union() {
            translate([-67.3, 10, 24])
            rotate([0, 90, 0])
            rounded_cube_side(
                5, 10, 3, 2, center=true, $fn=30
            );

            translate([-67.3, -10, 24])
            rotate([0, 90, 0])
            rounded_cube_side(
                5, 10, 3, 2, center=true, $fn=30
            );

            translate([0, 0, 23.5])
            cube([22, 17, 5.2], center=true);

            translate([0, 0, 13])
            cube([22, 17, 5.2], center=true);

            translate([0, 0, 5/2])
            cube([22, 17, 5.2], center=true);

        }
    }
}

module new_roller_body_back() {
    difference() {
        union() {
            _orig_roller_body_back();

            translate([47.8, 0, 30.9])
            cube([17, 45, 9], center=true);
        }

        hull() {
            translate([23, 30, 13])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([21, 30, 6])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([18, 30, 6])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([16, 30, 13])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);
        }

        hull() {
            translate([23, -30, 13])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([21, -30, 6])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([18, -30, 6])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);

            translate([16, -30, 13])
            rotate([90, 0, 0])
            chamfered_cylinder(4, 6, 1, center=true, $fn=30);
        }

        translate([47.8, 0, 30])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=100, center=true, $fn=30);
    }
}

module _steering_wheel() {
    union() {
        tube(18, 4, 1.9, $fn=40);
        cylinder(d=3.2, h=4, $fn=30);

        translate([-8/2, 0, 4/2])
        cube([8, 1.5, 4], center=true);

        rotate([0, 0, 120])
        translate([-8/2, 0, 4/2])
        cube([8, 1.5, 4], center=true);

        rotate([0, 0, 240])
        translate([-8/2, 0, 4/2])
        cube([8, 1.5, 4], center=true);
    }
}

module new_roller_body_back_black() {
    intersection() {
        new_roller_body_back();

        difference() {
            union() {
                translate([15, 0, 56.95])
                rotate([0, 45, 0])
                _steering_wheel();

                translate([60/2 + 23, 0, 44])
                cube([60, 100, 30], center=true);

                hull() {
                    translate([2/2 + 23, 0, 35])
                    cube([2, 100, 30], center=true);

                    translate([2/2 + 36, 0, 44])
                    cube([2, 100, 30], center=true);
                }
            }
            translate([60/2 + 23, 0, 45])
            cube([60, 35, 12], center=true);

            translate([15.99, 0, 25])
            cube([16, 25.5, 40], center=true);
        }
    }
}

module new_roller_body_back_grey() {
    intersection() {
        new_roller_body_back();
        //new_roller_body_back_stl();

        union() {
            translate([60/2 + 23.02, 0, 45])
            cube([60, 35, 12], center=true);

            difference() {
                translate([15.99, 0, 45])
                cube([16, 25.5, 80], center=true);

                translate([15, 0, 56.95])
                rotate([0, 45, 0])
                _steering_wheel();
            }

            translate([2, 0, 18.2])
            cube([22, 20, 5.2], center=true);

            translate([2, 0, 5.2 + 5/2])
            cube([22, 22.6, 5.2], center=true);
        }
    }
}

module new_roller_body_back_yellow() {
    difference() {
        new_roller_body_back();

        translate([60/2 + 23, 0, 44])
        cube([60, 100, 30], center=true);

        hull() {
            translate([2/2 + 23, 0, 35])
            cube([2, 100, 30], center=true);

            translate([2/2 + 36, 0, 44])
            cube([2, 100, 30], center=true);
        }

        translate([05.99, 0, 45])
        cube([36, 25.5, 80], center=true);

    }
}