use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Caracol/"
);


//_orig_babosa();
//_orig_concha();
//_orig_estrellas();
//_orig_pupila_boca_pins();
//_new_concha_base();

//new_babosa();
new_ojos();
//new_concha();
//new_estrellas();
//new_pupilas();
//new_boca();


module _orig_babosa() {
    // body
    import(
        str(spath,
        "caracol_babosa.stl"),
        convexity=10
    );
}

module _orig_concha() {
    // back
    import(
        str(spath,
        "caracol_concha.stl"),
        convexity=10
    );
}

module _orig_estrellas() {
    // stars
    import(
        str(spath,
        "caracol_estrellas.stl"),
        convexity=10
    );
}

module _orig_pupila_boca_pins() {
    // stars
    import(
        str(spath,
        "pupila_boca_pins.stl"),
        convexity=10
    );
}

module new_babosa() {
    difference() {
        translate([-120, -105, 0])
        _orig_babosa();

        translate([38.54, -12.5, 30.44])
        sphere(d=10.2, $fn=50);

        translate([38.57, 12.47, 30.45])
        sphere(d=10.2, $fn=50);
    }
}

module new_ojos() {
    intersection() {
        translate([-120, -105, 0])
        _orig_babosa();

        union() {
            translate([38.54, -12.5, 30.44])
            sphere(d=10.2, $fn=50);

            translate([38.57, 12.47, 30.45])
            sphere(d=10.2, $fn=50);
        }
    }
}

module _new_concha_base() {
    translate([-8.05, 0, 35.5])
    union() {
    
        rotate([-90, 0, 0])
        translate([-95, -100, 0])
        intersection() {
            _orig_concha();

            translate([95, 100, 0])
            cube([60, 80, 100], center=true);
        }

        rotate([90, 0, 0])
        translate([-149.125, -110, -0.01])
        intersection() {
            _orig_concha();

            translate([155, 100, 0])
            cube([60, 80, 100], center=true);
        }

        // fill
        translate([-5, 0, -29])
        cylinder(d=8, h=15);

        translate([11, 0, -29])
        cylinder(d=8, h=15);

        translate([-10.5, 0, -0.5])
        rotate([90, 0, 0])
        cylinder(d=8, h=15, center=true);

        translate([17.5, 0, -0.5])
        rotate([90, 0, 0])
        cylinder(d=8, h=15, center=true);        
    }
}

module new_concha() {
    difference() {
        union() {
            hull() {
                intersection() {
                    _new_concha_base();

                    translate([-5.5, 0, 37])
                    rotate([90, 0, 0])
                    cylinder(d=42, h=40, center=true);
                }
            }
            _new_concha_base();
        }
        new_babosa();
        new_estrellas();
    }
}

module new_estrellas() {
    module _star1() {
        translate([-108.6, -135, 0])
        intersection() {
            _orig_estrellas();

            translate([100, 135, 0])
            cylinder(d=50, h=50, center=true);
        }
    }

    module _star1_grown() {
        union() {
            translate([0, 0, 3])
            _star1();

            linear_extrude(3.1)
            projection()
            _star1();
        }
    }

    module _star2() {
        translate([-146, -75, 0])
        intersection() {
            _orig_estrellas();

            translate([146, 75, 0])
            cylinder(d=50, h=50, center=true);
        }
    }

    module _star2_grown() {
        union() {
            translate([0, 0, 3])
            _star2();

            linear_extrude(3.1)
            projection()
            _star2();
        }
    }


    difference() {
        union() {
            translate([0, 6, 38.5])
            rotate([-90, 0, 0])
            scale([1.02, 1.02, 1.05])
            _star1_grown();

            translate([-6.9, -6, 38.5])
            rotate([90, 0, 0])
            scale([1.02, 1.02, 1.05])
            _star2_grown();
        }
    }
}

module new_pupilas() {
    module _pupil() {
        scale([1.14, 1.14, 1])
        translate([-78.5, -105.5, 0])
        intersection() {
            _orig_pupila_boca_pins();

            translate([79, 105, 0])
            cylinder(d=10, h=50, center=true);
        }

    }

    module _pupils() {
        translate([39.5, -12.38, 30.38])
        rotate([0, 90, 0])
        _pupil();

        translate([39.5, 12.64, 30.38])
        rotate([0, 90, 0])
        _pupil();
    }

    difference() {
        _pupils();
        new_babosa();
    }
}

module new_boca() {
    module _mouth() {

        translate([-165, -125, 0])
        intersection() {
            _orig_pupila_boca_pins();

            translate([165, 125, 0])
            cylinder(d=20, h=50, center=true);
        }
    }

    difference() {
        translate([39.49, 0.39, 5.37])
        rotate([0, 90, 0])
        scale([1.11, 1.03, 1.05])
        _mouth();

        new_babosa();
    }
}