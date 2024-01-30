use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
wc_stl_path = str(
    stl_base_path, "Wonkey Chest of Drawers/"
);


//debug_drawer_1_support_form();
//debug_drawer_1_soluble_support();
//debug_drawer_1_nonsoluble_support();

//debug_drawer_2_support_form();
//debug_drawer_2_soluble_support();
//debug_drawer_2_nonsoluble_support();

//debug_drawer_3_support_form();
//debug_drawer_3_soluble_support();
//debug_drawer_3_nonsoluble_support();

//debug_drawer_4_support_form();
//debug_drawer_4_soluble_support();
//debug_drawer_4_nonsoluble_support();

//orig_chest();
//orig_chest_1();
//orig_drawers_v2();
//orig_drawers_2_v2();

//new_drawer_1();
//new_drawer_2();
//new_drawer_3();
//new_drawer_4();

//drawer_1_soluble_supports();
//drawer_1_nonsoluble_supports();

//drawer_2_soluble_supports();
//drawer_2_nonsoluble_supports();

//drawer_3_soluble_supports();
//drawer_3_nonsoluble_supports();

//drawer_4_soluble_supports();
drawer_4_nonsoluble_supports();


module debug_drawer_1_support_form() {
    intersection() {
        new_drawer_1();

        translate([0, 0, 54])
        cube([100, 100, 5], center=true);
    }

    color("lightblue")
    _drawer_1_support_form();
}

module debug_drawer_2_support_form() {
    intersection() {
        new_drawer_2();

        translate([0, 0, 54])
        cube([100, 100, 5], center=true);
    }

    color("lightblue")
    _drawer_2_support_form();
}

module debug_drawer_3_support_form() {
    intersection() {
        new_drawer_3();

        translate([0, 0, 54])
        cube([100, 100, 5], center=true);
    }

    color("lightblue")
    _drawer_3_support_form();
}

module debug_drawer_4_support_form() {
    intersection() {
        new_drawer_4();

        translate([0, 0, 54])
        cube([100, 100, 5], center=true);
    }

    color("lightblue")
    _drawer_4_support_form();
}

module debug_drawer_1_soluble_support() {
    new_drawer_1();

    color("lightblue")
    drawer_1_soluble_supports();
}

module debug_drawer_2_soluble_support() {
    new_drawer_2();

    color("lightblue")
    drawer_2_soluble_supports();
}

module debug_drawer_3_soluble_support() {
    new_drawer_3();

    color("lightblue")
    drawer_3_soluble_supports();
}

module debug_drawer_4_soluble_support() {
    new_drawer_4();

    color("lightblue")
    drawer_4_soluble_supports();
}

module debug_drawer_1_nonsoluble_support() {
    new_drawer_1();

    color("blue")
    intersection() {
        drawer_1_nonsoluble_supports();

//        translate([0, 50/2, 0])
//        cube([100, 50, 200], center=true);
    }
}

module debug_drawer_2_nonsoluble_support() {
    new_drawer_2();

    color("blue")
    intersection() {
        drawer_2_nonsoluble_supports();

//        translate([0, 50/2, 0])
//        cube([100, 50, 200], center=true);
    }
}

module debug_drawer_3_nonsoluble_support() {
    new_drawer_3();

    color("blue")
    intersection() {
        drawer_3_nonsoluble_supports();

//        translate([0, 50/2, 0])
//        cube([100, 50, 200], center=true);
    }
}

module debug_drawer_4_nonsoluble_support() {
    new_drawer_4();

    color("blue")
    intersection() {
        drawer_4_nonsoluble_supports();

//        translate([0, 50/2, 0])
//        cube([100, 50, 200], center=true);
    }
}

module orig_chest() {
    translate([0, 0, 68.65])
    import(
        str(wc_stl_path, "Wonky_chest.stl"),
        convexity=10
    );
}

module orig_chest_1() {
    translate([0, 0, 68.65])
    import(str(wc_stl_path, "Wonky_drawer_1.stl"));
}

module orig_drawers_v2() {
    translate([0, 0, 68.65])
    import(
        str(wc_stl_path, "Wonky_drawers_v2.stl"),
        convexity=10
    );
}

module orig_drawers_2_v2() {
    translate([0, 0, 68.65])
    import(
        str(wc_stl_path, "Wonky_drawers_2_v2.stl"),
        convexity=10
    );
}

module new_drawers() {
    scale([1.01, 1.01, 1])
    orig_drawers_v2();
}

module new_drawer_1() {
//    intersection() {
//        new_drawers();
//
//        translate([5, 52, 0])
//        rotate([0, 0, -10])
//        cube([80, 40, 200], center=true);
//    }

    translate([-250/2 - 5, -210/2 - 44, 0])
    import(
        str(wc_stl_path, "Wonky_drawer_1_v2.stl"),
        convexity=10
    );

}

module new_drawer_2() {
//    intersection() {
//        new_drawers();
//
//        translate([5, 13, 0])
//        rotate([0, 0, -14])
//        cube([80, 35, 200], center=true);
//    }
    translate([-250/2 + 2.58, -210/2 + 0.59, 0])
    import(
        str(wc_stl_path, "Wonky_drawer_2_v2.stl"),
        convexity=10
    );
}

module new_drawer_3() {
//    intersection() {
//        new_drawers();
//
//        translate([-7, -20, 0])
//        rotate([0, 0, -10])
//        cube([62, 32, 200], center=true);
//    }

    translate([-250/2 + 9, -210/2 + 20, 0])
    import(
        str(wc_stl_path, "Wonky_drawer_3_v2.stl"),
        convexity=10
    );
}

module new_drawer_4() {
//    intersection() {
//        new_drawers();
//
//        translate([0, -55, 0])
//        rotate([0, 0, -1])
//        cube([72, 32, 200], center=true);
//    }

    translate([-250/2 + 2.58, -210/2 + 57, 0])
    import(
        str(wc_stl_path, "Wonky_drawer_4_v2.stl"),
        convexity=10
    );
}

module _drawer_1_support_form(du=4, dl=5) {

    bottom_z = 3.87;
    z = 52.6;

    union() {
        hull() {
            translate([1 + 42/2, 1.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-5, 2.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([1 + 42/2, 12.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-22.5, 2.3, z])
            sphere(d=du, $fn=15);

            translate([-17, -0.7, z])
            sphere(d=du, $fn=15);
            
            translate([-12, -2.4, z])
            sphere(d=du, $fn=15);

            translate([0, -5, z])
            sphere(d=du, $fn=15);

            translate([13, -6.6, z])
            sphere(d=du, $fn=15);

            translate([24.8, -7, z])
            sphere(d=du, $fn=15);

            translate([0, -5, z])
            sphere(d=du, $fn=15);

            translate([13, -6.6, z])
            sphere(d=du, $fn=15);

            translate([26.1, 0, z])
            sphere(d=du, $fn=15);

            translate([26.3, 7, z])
            sphere(d=du, $fn=15);

            translate([25.7, 14, z])
            sphere(d=du, $fn=15);

            translate([25.25, 16, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-19, 7.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-5, 2.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([22, 12.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);
        
            translate([-22.5, 2.3, z])
            sphere(d=du, $fn=15);

            translate([-22.7, 2.6, z])
            sphere(d=du, $fn=15);

            translate([-23, 7.3, z])
            sphere(d=du, $fn=15);

            translate([12, 11.3, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-19, 7.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-5, 2.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([22, 12.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-19, 17.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-23, 7.3, z])
            sphere(d=du, $fn=15);

            translate([-24, 13.3, z])
            sphere(d=du, $fn=15);

            translate([7, 11, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-19, 17.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([5, 12.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-19, 20.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-24, 13.3, z])
            sphere(d=du, $fn=15);

            translate([-25.3, 19.3, z])
            sphere(d=du, $fn=15);

            translate([6, 10, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-19, 18.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-19, 20.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);
            
            translate([-5, 13.2, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-25.3, 19.3, z])
            sphere(d=du, $fn=15);

            translate([-27.5, 26.8, z])
            sphere(d=du, $fn=15);

            translate([1, 10, z])
            sphere(d=du, $fn=15);

        }
    }
}

module _drawer_2_support_form(du=4, dl=5) {

    bottom_z = 3.87;
    z = 52.6;

    union() {
        hull() {

            translate([-16, 16.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([17.25, 9, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-20.3, 16, z])
            sphere(d=du, $fn=15);

            translate([-20.8, 13.8, z])
            sphere(d=du, $fn=15);

            translate([-20.8, 12.8, z])
            sphere(d=du, $fn=15);
           
            translate([-20, 11.7, z])
            sphere(d=du, $fn=15);

            translate([-17, 10.5, z])
            sphere(d=du, $fn=15);
            
            translate([-12, 9.1, z])
            sphere(d=du, $fn=15);

            translate([-4, 7.1, z])
            sphere(d=du, $fn=15);

            translate([0, 6.2, z])
            sphere(d=du, $fn=15);

            translate([6, 4.9, z])
            sphere(d=du, $fn=15);

            translate([12, 3.7, z])
            sphere(d=du, $fn=15);

            translate([19, 2.3, z])
            sphere(d=du, $fn=15);

            translate([20.2, 6, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-16, 16.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([17.25, 9, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-15, 20.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([18.5, 13, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);
        
            translate([-20.3, 16, z])
            sphere(d=du, $fn=15);

            translate([20.2, 6, z])
            sphere(d=du, $fn=15);

            translate([-19, 21, z])
            sphere(d=du, $fn=15);

            translate([21.3, 9, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-15, 20.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([18.5, 13, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-14, 24.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([19.75, 17, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-19, 21, z])
            sphere(d=du, $fn=15);

            translate([21.3, 9, z])
            sphere(d=du, $fn=15);

            translate([-18, 25, z])
            sphere(d=du, $fn=15);

            translate([23.15, 14, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-14, 24.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([19.75, 17, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-13, 28.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-18, 25, z])
            sphere(d=du, $fn=15);

            translate([23.15, 14, z])
            sphere(d=du, $fn=15);

            translate([-16.7, 31, z])
            sphere(d=du, $fn=15);

            translate([0, 25, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([19.75, 17, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([20.7, 20.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-4, 24.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([0, 25, z])
            sphere(d=du, $fn=15);

            translate([23.15, 14, z])
            sphere(d=du, $fn=15);

            translate([25.15, 19, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([20.7, 20.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-4, 24.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([6, 23.5, z])
            sphere(d=du, $fn=15);

            translate([25.15, 19, z])
            sphere(d=du, $fn=15);

            translate([26, 21, z])
            sphere(d=du, $fn=15);
        }
    }
}

module _drawer_3_support_form(du=4, dl=5) {

    bottom_z = 3.87;
    z = 52.6;

    union() {
        hull() {

            translate([-17, 0, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([16, -3, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-16, 15, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([16, 1, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([-19.55, 16, z])
            sphere(d=du, $fn=15);

            translate([-21, -5.6, z])
            sphere(d=du, $fn=15);

            translate([19.9, -8.5, z])
            sphere(d=du, $fn=15);

            translate([19.95, -1, z])
            sphere(d=du, $fn=15);

            // modifiers
            translate([-20, 14, z])
            sphere(d=du, $fn=15);

            translate([-20.7, 10, z])
            sphere(d=du, $fn=15);

            translate([-21.2, 6, z])
            sphere(d=du, $fn=15);

            translate([-21.5, 2, z])
            sphere(d=du, $fn=15);

            translate([-21.6, -2, z])
            sphere(d=du, $fn=15);

            translate([-21.4, -5.3, z])
            sphere(d=du, $fn=15);

            translate([-16, -7, z])
            sphere(d=du, $fn=15);

            translate([-11, -8.05, z])
            sphere(d=du, $fn=15);
            
            translate([-6, -8.9, z])
            sphere(d=du, $fn=15);

            translate([-1, -9.45, z])
            sphere(d=du, $fn=15);

            translate([4, -9.75, z])
            sphere(d=du, $fn=15);

            translate([9, -9.75, z])
            sphere(d=du, $fn=15);

            translate([14, -9.4, z])
            sphere(d=du, $fn=15);

        }

        hull() {
            translate([-16, 15, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([16, 1, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([16, 6, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([19.95, -1, z])
            sphere(d=du, $fn=15);

            translate([-15, 14, z])
            sphere(d=du, $fn=15);

            translate([20.05, 3, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([16, 6, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([16, 7, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([0, 10.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([20.15, 6, z])
            sphere(d=du, $fn=15);

            translate([20.05, 3, z])
            sphere(d=du, $fn=15);

            translate([-11, 12, z])
            sphere(d=du, $fn=15);
        }
    }
}

module _drawer_4_support_form(du=4, dl=5) {

    bottom_z = 3.87;
    z = 52.6;

    union() {
        hull() {

            translate([-14, 0, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([17, -1, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-15.6, 4, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([13, 12.4, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([-16.8, -1, z])
            sphere(d=du, $fn=15);

            translate([-15, -6.5, z])
            sphere(d=du, $fn=15);

            translate([22.5, -6.6, z])
            sphere(d=du, $fn=15);

            translate([15.8, 13, z])
            sphere(d=du, $fn=15);

            // modifiers
            translate([-11, -7.2, z])
            sphere(d=du, $fn=15);

            translate([-6, -7.85, z])
            sphere(d=du, $fn=15);

            translate([-1, -8.3, z])
            sphere(d=du, $fn=15);

            translate([4, -8.55, z])
            sphere(d=du, $fn=15);

            translate([9, -8.5, z])
            sphere(d=du, $fn=15);

            translate([14, -8.1, z])
            sphere(d=du, $fn=15);

            translate([18, -7.55, z])
            sphere(d=du, $fn=15);

            translate([20.8, -1, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-15.6, 4, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([13, 12.4, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-17, 8, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([-16.8, -1, z])
            sphere(d=du, $fn=15);

            translate([-18.8, 4, z])
            sphere(d=du, $fn=15);

            translate([15.8, 13, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([13, 12.4, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-17, 8, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-18, 11, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([-18.8, 4, z])
            sphere(d=du, $fn=15);

            translate([-20.5, 8, z])
            sphere(d=du, $fn=15);

            translate([15.8, 13, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-18, 11, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([-18, 12.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([2, 11, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([-20.5, 8, z])
            sphere(d=du, $fn=15);

            translate([-22.9, 13.5, z])
            sphere(d=du, $fn=15);

            translate([-5, 9.2, z])
            sphere(d=du, $fn=15);
        }

        hull() {
            translate([-18, 12.5, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            translate([8, 12, bottom_z])
            cylinder(d=dl, h=0.2, $fn=15);

            // corners
            translate([-19, 11.5, z])
            sphere(d=du, $fn=15);

            translate([4, 11, z])
            sphere(d=du, $fn=15);

            translate([-5, 3, z])
            sphere(d=du, $fn=15);
        }
    }
}

module _drawer_1_front_curve_form() {
    hull() {
        translate([9.3, 40, 5/2])
        cylinder(d=58, h=5, center=true);

        translate([-9.3, 51, 5/2])
        cylinder(d=58, h=5, center=true);
    }
}

module _drawer_2_front_curve_form() {
    translate([30.5, 141.4, 0])
    cylinder(
        d=239.8, h=5, $fn=180
    );
}

module _drawer_3_front_curve_form() {
    hull() {
        translate([22, 35, 5/2])
        cylinder(d=58, h=5, center=true);

        translate([11, 90, 5/2])
        cylinder(d=160, h=5, center=true, $fn=100);
    }
}

module _drawer_4_front_curve_form() {
    hull() {
        translate([8, 62.2, 5/2])
        cylinder(d=100, h=5, center=true, $fn=100);

        translate([0, 61.5, 5/2])
        cylinder(d=100, h=5, center=true, $fn=100);

        translate([-7.5, 76.4, 5/2])
        cylinder(d=130, h=5, center=true, $fn=100);
    }
}

module drawer_1_soluble_supports() {

    intersection() {
        _drawer_1_support_form();

        translate([0, 0, 4.2 + 50])
        cylinder(d=100, h=5);
    }

    difference() {
        intersection() {
            _drawer_1_support_form();

            cylinder(d=100, h=4.2);
        }

        _drawer_1_front_curve_form();
    }
}

module drawer_2_soluble_supports() {

    intersection() {
        _drawer_2_support_form();

        translate([0, 0, 4.2 + 50])
        cylinder(d=100, h=5);
    }

    difference() {
        intersection() {
            _drawer_2_support_form();

            cylinder(d=100, h=4.2);
        }

        _drawer_2_front_curve_form();
    }
}

module drawer_3_soluble_supports() {

    intersection() {
        _drawer_3_support_form();

        translate([0, 0, 4.2 + 50])
        cylinder(d=100, h=5);
    }

    difference() {
        intersection() {
            _drawer_3_support_form();

            cylinder(d=100, h=4.2);
        }

        _drawer_3_front_curve_form();
    }
}

module drawer_4_soluble_supports() {

    intersection() {
        _drawer_4_support_form();

        translate([0, 0, 4.2 + 50])
        cylinder(d=100, h=5);
    }

    difference() {
        intersection() {
            _drawer_4_support_form();

            cylinder(d=100, h=4.2);
        }

        _drawer_4_front_curve_form();
    }
}

module drawer_1_nonsoluble_supports() {

    difference() {
        union() {
            intersection() {
                _drawer_1_support_form();

                translate([0, 0, 4.2])
                cylinder(d=100, h=50);
            }

            difference() {
                _drawer_1_front_curve_form();

                translate([0, 59.8, 5/2])
                rotate([0, 0, -11])
                cube([100, 80, 6.2], center=true);
            }
        }

        difference() {

            union() {
                intersection() {
                    _drawer_1_support_form(3, 4);

                    translate([0, 0, 4.4])
                    cylinder(d=100, h=48.8);
                }

                translate([0, 0, 45.3/2 + 5.2])
                cube([40, 20, 45.3], center=true);
            }

            cube([0.5, 80, 200], center=true);

            translate([13, 0, 0])
            cube([0.5, 80, 200], center=true);

            translate([-13, 0, 0])
            cube([0.5, 80, 200], center=true);

            for (i = [0:20]) {
                translate([0, 30 - i*4, 53])
                cube([80, 0.5, 2], center=true);
            }
        }
    }
}

module drawer_2_nonsoluble_supports() {

    difference() {
        union() {
            intersection() {
                _drawer_2_support_form();

                translate([0, 0, 4.2])
                cylinder(d=100, h=50);
            }

            intersection() {
                _drawer_2_front_curve_form();

                translate([3, 22.3, 5/2])
                rotate([0, 0, -13.5])
                cube([38, 10, 6.2], center=true);
            }
        }

        difference() {

            union() {
                intersection() {
                    _drawer_2_support_form(3, 4);

                    translate([0, 0, 4.4])
                    cylinder(d=100, h=48.8);
                }

                translate([-1, 4, 46.3/2 + 5.2])
                rotate([0, 0, -10])
                cube([35, 20, 46.3], center=true);
            }

            cube([0.5, 100, 200], center=true);

            translate([13, 0, 0])
            cube([0.5, 100, 200], center=true);

            translate([-13, 0, 0])
            cube([0.5, 100, 200], center=true);

            for (i = [0:20]) {
                translate([0, 30 - i*4, 53])
                cube([80, 0.5, 2], center=true);
            }
        }
    }
}

module drawer_3_nonsoluble_supports() {

    difference() {
        union() {
            intersection() {
                _drawer_3_support_form();

                translate([0, 0, 4.2])
                cylinder(d=100, h=50);
            }

            intersection() {
                _drawer_3_front_curve_form();

                translate([0, 10, 5/2])
                rotate([0, 0, -13.5])
                cube([38, 7, 6.2], center=true);
            }
        }

        difference() {

            union() {
                intersection() {
                    _drawer_3_support_form(3, 4);

                    translate([0, 0, 4.4])
                    cylinder(d=100, h=48.8);
                }

                translate([-1, -4, 46.3/2 + 5.2])
                rotate([0, 0, -4])
                cube([35, 20, 46.3], center=true);
            }

            cube([0.5, 100, 200], center=true);

            translate([13, 0, 0])
            cube([0.5, 100, 200], center=true);

            translate([-13, 0, 0])
            cube([0.5, 100, 200], center=true);

            for (i = [0:20]) {
                translate([0, 30 - i*4, 53])
                cube([80, 0.5, 2], center=true);
            }
        }
    }
}

module drawer_4_nonsoluble_supports() {

    difference() {
        union() {
            intersection() {
                _drawer_4_support_form();

                translate([0, 0, 4.2])
                cylinder(d=100, h=50);
            }

            intersection() {
                _drawer_4_front_curve_form();

                translate([-2.5, 11.7, 5/2])
                rotate([0, 0, 0])
                cube([36, 7, 6.2], center=true);
            }
        }

        difference() {

            union() {
                intersection() {
                    _drawer_4_support_form(3, 4);

                    translate([0, 0, 4.4])
                    cylinder(d=100, h=48.8);
                }

                translate([2, -4, 46.3/2 + 5.2])
                rotate([0, 0, 8])
                cube([32, 20, 46.3], center=true);
            }

            translate([1, 0, 0])
            rotate([0, 0, 3])
            cube([0.5, 100, 200], center=true);

            translate([14, 0, 0])
            rotate([0, 0, 3])
            cube([0.5, 100, 200], center=true);

            translate([-12, 0, 0])
            rotate([0, 0, 3])
            cube([0.5, 100, 200], center=true);

            for (i = [0:20]) {
                translate([0, 30 - i*4, 53])
                cube([80, 0.5, 2], center=true);
            }
        }
    }
}