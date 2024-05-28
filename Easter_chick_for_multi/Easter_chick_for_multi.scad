include <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Easter_chick_for_multi/"
);


//_orig_legs();
//_orig_body();
//_orig_beak();
//_orig_eyes();
//orig_chick();
//%tk_chick();
//_supports_form();
//debug();

// For Tinkercad processing
//_tk_body();
//%_tk_legs();
//_tk_beak();
//_tk_eyes();
//_tk_solubles_form();

solubles();
//supports1();
//supports2();


module _orig_legs() {
    import(
        str(spath, "legs.stl"),
        convexity=10
    );
}

module _orig_body() {
    import(
        str(spath, "body.stl"),
        convexity=10
    );
}

module _orig_beak() {
    import(
        str(spath, "beak.stl"),
        convexity=10
    );
}

module _orig_eyes() {
    import(
        str(spath, "eyes.stl"),
        convexity=10
    );
}

module orig_chick() {
    union() {
        _orig_legs();

        translate([0, 0, -0.01])
        _orig_body();

        translate([0, 0, -0.01])
        _orig_beak();

        translate([0, 0, -0.01])
        _orig_eyes();
    }
}

module debug() {
    %tk_chick();

    //solubles();
    supports1();

    render()
    supports2();
    
}

//module tk_body() {
//    import(
//        "tk_body.stl",
//        convexity=10
//    );
//}
//
//module tk_beak() {
//    import(
//        "tk_beak.stl",
//        convexity=10
//    );
//}
//
//module tk_legs() {
//    import(
//        "tk_legs.stl",
//        convexity=10
//    );
//}
//
//module tk_eyes() {
//    import(
//        "tk_eyes.stl",
//        convexity=10
//    );
//}

module _tk_solubles() {
    // after Tinkercad processing
    import(
        "tk_solubles.stl",
        convexity=10
    );
}

module tk_chick() {
    _tk_body();
    _tk_legs();
    _tk_beak();
    _tk_eyes();
}

module debug_sobules() {
    intersection() {
        solubles();

        //translate([0, -100/2, 0])
        //cube([100, 100, 100]);
    }
}

module _tk_body() {
    union() {
        translate([0, 0, -0.05])
        _orig_body();

        // centering pins for tinkercad
        translate([-30, 30, 10/2])
        cube([2, 2, 10], center=true);

        translate([30, -30, 10/2])
        cube([2, 2, 10], center=true);
    }
}

module _tk_legs() {
    difference() {
        union() {
            _orig_legs();

            // centering pins for tinkercad
            translate([30, 30, 10/2])
            cube([2, 2, 10], center=true);

            translate([-30, -30, 10/2])
            cube([2, 2, 10], center=true);
        }

        translate([-9.5, 5, 12/2])
        cube([0.05, 3, 14], center=true);

        translate([9.5, 5, 12/2])
        cube([0.05, 3, 14], center=true);
    }
}

module _tk_beak() {
    union() {
        translate([0, 0.1, -0.05])
        _orig_beak();

        translate([0, -27, 52])
        cube([2, 4, 2], center=true);

    }

    // centering pins for tinkercad
    translate([15, -35, 10/2])
    cube([2, 2, 10], center=true);

    translate([-15, -35, 10/2])
    cube([2, 2, 10], center=true);

    translate([0, 35, 10/2])
    cube([2, 2, 10], center=true);
}

module _tk_eyes() {
    translate([0, 0.1, -0.05])
    _orig_eyes();

    // centering pins for tinkercad
    translate([15, -31, 10/2])
    cube([2, 2, 10], center=true);

    translate([-15, -31, 10/2])
    cube([2, 2, 10], center=true);

    translate([0, 31, 10/2])
    cube([2, 2, 10], center=true);
}

module _supports_form() {
    difference() {
        union() {
            translate([0, 3, 0])
            scale([1, 1.5, 1])
            cylinder(d=30, h=24);

            hull() {
                translate([10, 5, 12])
                cylinder(d=12, h=0.6);

                translate([12, 7])
                cylinder(d=14, h=1);
            }

            hull() {
                translate([-10, 5, 12])
                cylinder(d=12, h=0.6);

                translate([-12, 7])
                cylinder(d=14, h=1);
            }
        }

        // leg holes
        translate([9, 3.9, 0])
        rotate([-5, 0, 0])
        cylinder(d=7.1, h=25, $fn=40);

        translate([-9, 4, 0])
        rotate([-5, 0, 0])
        cylinder(d=7.1, h=25, $fn=40);

        translate([8, -1, 0])
        rotate([-35, 0, -8])
        cylinder(d1=9, d2=7, h=10);

        translate([-8, -1, 0])
        rotate([-35, 0, 8])
        cylinder(d1=9, d2=7, h=10);

        // side cuts
        difference() {
            translate([18, 13.5, 0])
            rotate([0, 45, -10])
            cube([20, 60, 21], center=true);

            translate([22.1, 13.5, 0])
            rotate([0, -10, 24])
            cube([20, 60, 30], center=true);
        }

        difference() {
            translate([-18, 13.5, 0])
            rotate([0, -45, 10])
            cube([20, 60, 60], center=true);

            translate([-22.1, 13.5, 0])
            rotate([0, 10, -24])
            cube([20, 60, 30], center=true);
        }

        // back cuts
        hull() {
            translate([0, 29, 10])
            rotate([50, 0, 0])
            cube([50, 30, 22], center=true);

            translate([0, 34, 0])
            cube([50, 30, 22], center=true);
        }

        // center cuts
        translate([10/2 + 1/2, 0, 0])
        rotate([45, 0, 0])
        cube([10, 8, 8], center=true);

        translate([-10/2 - 1/2, 0, 0])
        rotate([45, 0, 0])
        cube([10, 8, 8], center=true);

        // front cut
        translate([0, -29, 14])
        rotate([-50, 0, 0])
        cube([50, 34, 24], center=true);
    }

    // overhang fix
    translate([0, -15/2, 2/2])
    cube([1, 15, 2], center=true);

    // tweaking
    translate([-13.4, 0.8, 11.6])
    cylinder(d=3, h=1, $fn=20);

    translate([13.4, 0.8, 11.6])
    cylinder(d=3, h=1, $fn=20);

    
    // beak support tower
    difference() {
        translate([0, -31, 0])
        cylinder(d=10, h=47);

        hull() {
            translate([0, -31, -1])
            cylinder(d=8, h=42.5);

            translate([0, -31, 0])
            cylinder(d=0.1, h=46);
        }
    }

    // extra bed adhesion
    translate([0, -24, 0])
    scale([1, 1.85, 1])
    cylinder(d=13, h=0.2);

    translate([0, 13, 0])
    cylinder(d=10, h=0.2);

    //%chick();
}

module supports1() {
    intersection() {
        _supports_form();

        difference() {
            cylinder(d=200, h=12.6);

            translate([0, 7.9, 0])
            rotate([14, 0, 0])
            cube([60, 0.5, 24.5], center=true);

            translate([0, 5, 21.5])
            cube([60, 0.4, 20], center=true);
        }
    }
}

module supports2() {
    intersection() {
        _supports_form();

        difference() {
            translate([0, 0, 12.6])
            cylinder(d=200, h=60);

            difference() {
                translate([0, 5, 12.6 + 20/2])
                cube([60, 60, 20], center=true);

                translate([0, -21.3, 11.4])
                rotate([-28, 0, 0])
                cube([70, 40, 20], center=true);

                translate([0, 25.5, 11.8])
                rotate([38, 0, 0])
                cube([70, 40, 20], center=true);
            }
        }

    }
}

module _tk_solubles_form() {
    intersection() {
        _supports_form();

        difference() {
            translate([0, 5, 12.61 + 20/2])
            cube([60, 60, 20], center=true);

            translate([0, -21.3, 11.4])
            rotate([-28, 0, 0])
            cube([70, 40, 20], center=true);

            translate([0, 25.5, 11.8])
            rotate([38, 0, 0])
            cube([70, 40, 20], center=true);
        }
    }

    translate([0, -31, 47])
    cylinder(d=10, h=3.5);

    // centering pins for tinkercad
    translate([15, -40, 10/2])
    cube([2, 2, 10], center=true);

    translate([-15, -40, 10/2])
    cube([2, 2, 10], center=true);

    translate([0, 40, 10/2])
    cube([2, 2, 10], center=true);


}

module solubles() {
//    difference() {
//        union() {
//            translate([0, 4, 0])
//            scale([1, 1.45, 1])
//            cylinder(d=30, h=24);

//            translate([0, -31, 47])
//            cylinder(d=10, h=3.5);
//        }

//        difference() {
//            translate([0, 4, -1])
//            scale([1.01, 1.46, 1])
//            cylinder(d=30, h=29);
//
//            translate([0, 0, -1.5])
//            scale([1, 1.02, 1])
//            _tk_body();
//        }

//        tk_chick();
//    }
    //%tk_chick();

    _tk_solubles();
}


