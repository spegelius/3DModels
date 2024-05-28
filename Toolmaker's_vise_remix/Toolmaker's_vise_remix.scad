
include <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Toolmaker's vise/"
);


//_orig_body();
//_orig_jaw();
//_body_interface1();
//_body_interface2();
//_body_interface3();
//_body_interface4();
//_body_interface5();
//_body_supports1_form();
//_body_supports2_form();
//_body_supports3_form();

//_jaw_supports_form();

//new_body();
//body_supports();
//body_supports_soluble();

new_jaw();
//jaw_supports();
//jaw_supports_soluble();


module _orig_body() {
    translate([-75, -30, 61.9])
    import(
        str(spath, "body.stl"),
        convexity=10
    );
}

module _orig_jaw() {
    //translate([0, 0, 0])
    rotate([0, -90, 0])
    import(
        str(spath, "jaw.stl"),
        convexity=10
    );
}

module _body_interface1() {

    difference() {
        translate([0, 0, 28.25])
        linear_extrude(0.5)
        offset(-0.3)
        projection()
        difference() {
            translate([4, 9.7, 34.5 + 0.725/2])
            cube([121, 13, 0.725], center=true);

            _orig_body();

        }

        translate([-55.9, 16.8])
        cylinder(d=16.3, h=40, $fn=30);

        translate([-36.9, 16.8])
        cylinder(d=16.3, h=40, $fn=30);

        translate([-17.9, 16.8])
        cylinder(d=16.3, h=40, $fn=30);

        translate([1.2, 16.8])
        cylinder(d=16.3, h=40, $fn=30);

        translate([20.25, 16.8])
        cylinder(d=16.3, h=40, $fn=30);

        translate([39.3, 16.8])
        cylinder(d=16.3, h=40, $fn=30);

        translate([58.35, 16.8])
        cylinder(d=16.3, h=40, $fn=30);
    }

    //%_orig_body();
}

module _body_interface2() {

    difference() {
        translate([0, 0, 34.5])
        linear_extrude(0.725)
        offset(-0.1)
        projection()
        difference() {
            translate([4, 9.8, 34.5 + 0.725/2])
            cube([121, 13.5, 0.725], center=true);

            _orig_body();

        }

        translate([-55.9, 16.8])
        cylinder(d=15.3, h=40, $fn=30);

        translate([-36.9, 16.8])
        cylinder(d=15.3, h=40, $fn=30);

        translate([-17.9, 16.8])
        cylinder(d=15.3, h=40, $fn=30);

        translate([1.2, 16.8])
        cylinder(d=15.3, h=40, $fn=30);

        translate([20.25, 16.8])
        cylinder(d=15.3, h=40, $fn=30);

        translate([39.3, 16.8])
        cylinder(d=15.3, h=40, $fn=30);

        translate([58.35, 16.8])
        cylinder(d=15.3, h=40, $fn=30);
    }

    %_orig_body();
}

module _body_interface3() {
    difference() {
        union() {
//            translate([1.2, 29.75, 19 + 0.5/2])
//            cube([152.3, 4.5, 0.5], center=true);

            translate([1.2, 25.75, 19 + 0.5/2])
            cube([129.8, 12.5, 0.5], center=true);
        }
        _orig_body();
    }
    %_orig_body();
}

module _body_interface4() {
    translate([0, 0, 43.5])
    linear_extrude(0.937)
    offset(-0.1)
    projection()
    difference() {
        translate([1.2, 20.8, 43.5 + 0.937/2])
        cube([152.3, 24, 0.937], center=true);

        _orig_body();
    }

    %_orig_body();
}

module _body_interface5() {

    translate([14.35, 4.3, 2.5 + 0.66/2])
    cube([127.5, 3, 0.66], center=true);

    %_orig_body();
}

module _body_supports1_form() {
    color("green")
    difference() {
        translate([0, 0, 28.75])
        linear_extrude(34.5 - 28.75)
        projection()
        _body_interface1();

        difference() {
            union() {
                translate([0, 0, 29.25])
                linear_extrude(34 - 29.25)
                offset(-0.8)
                projection()
                _body_interface1();

                translate([
                    6.8, 0, 29.25 + (34 - 29.25)/2
                ])
                cube(
                    [113, 10, 34 - 29.25],
                    center=true
                );
            }
            for(i = [0:20]) {
                translate([-60 + i*7, 0, 0])
                cube([0.8, 20, 100], center=true);
            }
        }
    }

    %_orig_body();
}

module _body_supports2_form() {
    module _support_column() {
        hull() {
            translate([0, 16.8, 43.5 - 0.1/2])
            cylinder(d=15.3, h=0.1, $fn=40);

            translate([0, 24.2, 19.5 + 0.1/2])
            cylinder(d=10, h=0.1, $fn=30);

            translate([0, 31, 43.5 - 0.1/2])
            cube([15.3, 0.1, 0.1], center=true);

            translate([0, 31, 19.5 + 0.1/2])
            cube([10, 0.1, 0.1], center=true);
        }
    }

    module _support_column_inner() {
        hull() {
            translate([0, 16.8, 41.5 - 0.1/2])
            cylinder(d=13.2, h=0.1, $fn=40);

            translate([0, 16.8, 42.75 - 0.1/2])
            cylinder(d=12, h=0.1, $fn=40);

            translate([0, 24.2, 20 + 0.1/2])
            cylinder(d=8.4, h=0.1, $fn=30);

            translate([0, 31, 41.5 - 0.1/2])
            cube([13.2, 0.1, 0.1], center=true);

            translate([0, 31, 42.75 - 0.1/2])
            cube([12, 0.1, 0.1], center=true);

            translate([0, 31, 20 + 0.1/2])
            cube([8.4, 0.1, 0.1], center=true);
        }
    }

    color("green")
    difference() {
        union() {
            translate([-55.9, 0, 0])
            _support_column();

            translate([-36.9, 0, 0])
            _support_column();

            translate([-17.9, 0, 0])
            _support_column();

            translate([1.2, 0, 0])
            _support_column();

            translate([20.25, 0, 0])
            _support_column();

            translate([39.3, 0, 0])
            _support_column();

            translate([58.35, 0, 0])
            _support_column();

            hull() {
                translate([1.2, 29.9, 19.5 + 0.1/2])
                cube([129, 4.2, 0.1], center=true);

                translate([1.2, 29.9, 43.5 - 0.1/2])
                cube([152.3, 4.2, 0.1], center=true);
            }
        }

        difference() {
            union() {
                hull() {
                    translate([1.2, 30.6, 20 + 0.1/2])
                    cube([128, 4.2, 0.1], center=true);

                    translate([1.2, 30.6, 42.75 - 0.1/2])
                    cube([148.2, 4.2, 0.1], center=true);

                    translate([1.2, 30.6, 41 - 0.1/2])
                    cube([148.2, 4.2, 0.1], center=true);
                }

                translate([-55.9, 0, 0])
                _support_column_inner();

                translate([-36.9, 0, 0])
                _support_column_inner();

                translate([-17.9, 0, 0])
                _support_column_inner();

                translate([1.2, 0, 0])
                _support_column_inner();

                translate([20.25, 0, 0])
                _support_column_inner();

                translate([39.3, 0, 0])
                _support_column_inner();

                translate([58.35, 0, 0])
                _support_column_inner();
            }

            for(i = [0:30]) {
                translate([-70 + i*5.1, 0, 0])
                cube([0.8, 100, 100], center=true);
            }
        }
    }
    %_orig_body();
}

module _body_supports3_form() {
    color("green")
    translate([14.35, 4.2, 0 + 2.5/2])
    difference() {
        cube([127.2, 3, 2.5], center=true);

        hull() {
            translate([0, 0, -2.5/2 + 1/2 + 0.25])
            cube([128, 1.8, 1], center=true);

            translate([0, 0, 2.5/2 - 0.6])
            cube([128, 0.1, 0.1], center=true);
        }
    }
}

module new_body() {
    _orig_body();
}

module body_supports_soluble() {
    union() {
        _body_interface1();
        _body_interface2();
        _body_interface3();
        _body_interface4();
        _body_interface5();
    }
}

module body_supports() {
    _body_supports1_form();
    _body_supports2_form();
    _body_supports3_form();
}

module new_jaw() {
    _orig_jaw();
}

module _jaw_supports_form() {
    module _form_part() {
        scale([6.35, 1, 1])
        translate([20, 0, 0])
        intersection() {
            difference() {
                translate([0, 0, 3.174/2])
                cube([63, 5, 3.174], center=true);

                _orig_jaw();
            }
            translate([-50/2 + 5, 0, 0])
            cube([10, 10, 10], center=true);
        }
    }

    difference() {
        _form_part();

        hull() {
            translate([0, 4, 0])
            cube([5, 1, 10], center=true);

            translate([0, -4, 0])
            cube([7, 1, 10], center=true);
        }
    }

    %_orig_jaw();
}

module jaw_supports() {
    intersection() {
        _jaw_supports_form();

        cube([70, 10, 3.5], center=true);
    }
}

module jaw_supports_soluble() {
    difference() {
        _jaw_supports_form();

        cube([70, 10, 3.5], center=true);
    }
}