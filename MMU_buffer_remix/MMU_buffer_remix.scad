//Remixes models:
//https://www.printables.com/model/40769-mmu-buffer
//https://www.printables.com/model/62798-mmu-buffer-mod-for-prusa-mmu-bearings

use <../Dollo/NEW_long_ties/include.scad>;
use <../lib/bearings.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Prusa/MMU_Buffer/"
);

bpath = str(
    spath, "Mod_for_Prusa_MMU_Bearings/"
);


//_orig_base();
//_orig_wheel();
//_prusa_bearing_spacer();
//_prusa_bearing_axle_a();
//debug();
//debug_wheel();
//debug_prusa_bearings_axles();


//new_MMU_base();
//MMU_filament_catcher();
MMU_filament_catcher_wall();
//new_prusa_bearing_spacer();
//new_prusa_bearing_axle_a();
//new_prusa_bearing_axle_b();
//new_prusa_bearing_spacer();


module _orig_base() {
    translate([-90.93, -26.67, -19])
    import(
        str(spath,
        "base-Original.stl"),
        convexity=10
    );

    // helpers
    //%cube([138, 50, 1], center=true);
}

module _orig_wheel() {
    translate([-50, 12.5, 24.95])
    rotate([90, 0, 0])
    import(
        str(spath,
        "wheel-Original.stl"),
        convexity=10
    );

    // helpers
//    %translate([0, 0, 74.95])
//    rotate([90, 0, 0])
//    cylinder(d=20, h=10, center=true);

//    %translate([0, 0, 74.95])
//    rotate([90, 0, 0])
//    cylinder(d=96, h=25, center=true, $fn=50);

//    %cube([100, 25, 200], center=true);
}

module _prusa_bearing_spacer() {
    translate([-15, -7/2, -15 + 74.95])
    import(
        str(bpath,
        "Prusa Bearing Spacer.stl"),
        convexity=10
    );
}

module _prusa_bearing_axle_a() {
    intersection() {
        translate([-8, -11, 0])
        import(
            str(bpath,
            "axle_a for Prusa Bearing.STL"),
            convexity=10
        );

//        translate([0, 50/2, 0])
//        cube([50, 50, 100], center=true);
    }
}

module _prusa_bearing_axle_b() {
    intersection() {
        translate([-8, -11, 0])
        import(
            str(bpath,
            "axle_b for Prusa Bearings.STL"),
            convexity=10
        );

//        translate([0, 50/2, 0])
//        cube([50, 50, 100], center=true);
    }
}

module debug() {
    %new_MMU_base();
    _orig_wheel();

    translate([0, 0, 75])
    MMU_filament_catcher();

    translate([0, -11.16, 125.1])
    rotate([88, 0, 0])
    MMU_filament_catcher_wall();
}

module debug_wheel() {
    %new_MMU_base();
    %_orig_wheel();

    //translate([0, 1.2, 0])
    //_prusa_bearing_spacer();

    translate([0, 7/2 + 1, 74.95])
    rotate([90, 0, 0])
    new_prusa_bearing_spacer();

    translate([0, 7/2 + 1, 74.95])
    rotate([90, 0, 0])
    prusa_bearing_spacer_extra_washer();
}

module debug_prusa_bearings_axles() {
   _prusa_bearing_axle_a();

//   translate([0, 0, 47])
//   rotate([180, 0, 0])
//   _prusa_bearing_axle_b();

   %translate([0, 0, 20])
   608zz();
}

module new_MMU_base() {
    module _ender() {
        difference() {
            cylinder(d=7, h=1, $fn=25);

            cube([6, 3.2, 5], center=true);
        }
    }

    module _slope() {
        difference() {
            hull() {
                translate([0, 0, 74.95])
                rotate([90, 0, 0])
                cylinder(
                    d=125.3, h=30,
                    center=true, $fn=100
                );

                translate([0, 0, 1/2])
                cube([40, 15, 1], center=true);
            }

            translate([0, 0, 74.95])
            rotate([90, 0, 0])
            chamfered_cylinder(
                121.5, 26, 1,
                center=true, $fn=100
            );

            translate([0, 0, 74.95])
            rotate([90, 0, 0])
            cylinder(d=98, h=40, center=true, $fn=80);

            translate([0, 0, 100/2 + 56])
            cube([200, 35, 100], center=true);
        }
    }

    module _tube_fill() {
        translate([-0.01, 8.665, 14.565])
        rotate([0, -90, 0])
        cylinder(d=6.2, h=62, $fn=50);

        translate([0.01, -8.665, 14.565])
        rotate([0, 90, 0])
        cylinder(d=6.2, h=62, $fn=50);

        translate([0, 4.5, 54 + 14.4])
        rotate([96, 43])
        donut(108, 7.2, 95, $fn=50);

        translate([0, -4.5, 54 + 14.4])
        rotate([96, 137])
        donut(108, 7.2, 95, $fn=50);
    }

    module _tube_cuts() {
        
        translate([-0.01, 8.665, 14.565])
        rotate([0, -90, 0])
        cylinder(d=4.8, h=63, $fn=50);

        translate([0.01, -8.665, 14.565])
        rotate([0, 90, 0])
        cylinder(d=4.8, h=63, $fn=50);

        difference() {
            translate([0, 4.5, 54.5 + 14.4])
            rotate([96, 43])
            donut(109, 4.8, 95, $fn=150);

            translate([54.2, 0.3, 71])
            _ender();
        }

        difference() {
            translate([0, -4.5, 54.5 + 14.4])
            rotate([96, 137])
            donut(109, 4.8, 95, $fn=150);

            translate([-54.2, -0.3, 71])
            _ender();
        }
    }

    difference() {
        union() {
            _orig_base();
            _tube_fill();

            _slope();
        }

        translate([0, 0, 74.95])
        rotate([90, 0, 0])
        cylinder(
            d=101.5, h=26,
            center=true, $fn=100
        );

        translate([0, 0, 100/2 + 71.8])
        cube([200, 29.2, 100], center=true);

        _tube_cuts();


        // axle sizing helper
//        translate([0, 0, 74.95])
//        rotate([90, 0, 0])
//        cylinder(d=10.2, h=46, center=true, $fn=30);
    }

    // tubes helpers
//    %translate([-1, -8.5, 14.5])
//    rotate([0, 90, 0])
//    cylinder(d=10, h=100);
//
//    %translate([1, 8.5, 14.5])
//    rotate([0, -90, 0])
//    cylinder(d=10, h=100);
//
//    %translate([0, 4.5, 56 + 14.5])
//    rotate([96, 45])
//    donut(112, 10, 93);
//
//    %translate([0, -4.5, 56 + 14.5])
//    rotate([96, 135])
//    donut(112, 10, 95);

}

module MMU_filament_catcher() {
    difference() {
        hull() {
            translate([0, 0, 30/2])
            chamfered_cube_side(
                20, 50, 30, 2, center=true
            );

            translate([0, 0, 280 - 9/2])
            rotate([0, 90, 0])
            chamfered_cylinder(
                18, 20, 2, center=true, $fn=50
            );
        }

        // axle
        rotate([90, 0, 0])
        cylinder(d=10.5, h=46, center=true, $fn=30);

        // zip tie holes
        translate([50/2 + 6.65, -50/2 + 8.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([-50/2 - 6.65, -50/2 + 8.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([50/2 + 6.65, 50/2 - 3.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([-50/2 - 6.65, 50/2 - 3.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([0, -50/2 + 5.5, -60/2 + 24])
        rotate([90, 0, 0])
        difference() {
            rounded_cube_side(
                43, 70, 6, 3, center=true
            );

            rounded_cube_side(
                20, 48, 7, 15, center=true, $fn=30
            );

            translate([0, -30/2 + 12, 0])
            cube([50, 30, 20], center=true);
        }

        translate([0, 50/2 - 5.5, -60/2 + 24])
        rotate([90, 0, 0])
        difference() {
            rounded_cube_side(
                43, 70, 6, 3, center=true
            );

            rounded_cube_side(
                20, 48, 7, 15, center=true, $fn=30
            );

            translate([0, -30/2 + 12, 0])
            cube([50, 30, 20], center=true);
        }

        // inner cuts
        rotate([90, 0, 0])
        cylinder(d=100.8, h=28, center=true, $fn=100);

        translate([0, 0, 55])
        cube([40, 21, 20], center=true);

        hull() {
            translate([0, 0, 280 - 9/2])
            rotate([0, 90, 0])
            cylinder(d=9, h=40, center=true, $fn=50);

            translate([0, 0, 58])
            cube([40, 35, 1], center=true);

            translate([0, 0, 47])
            cube([40, 10, 1], center=true);
        }

        // fancy cuts
        hull() {
            translate([0, 50/2 - 5.7, 34])
            rotate([0, 90, 0])
            cylinder(d=5, h=40, center=true, $fn=30);

            translate([0, 50/2 - 6.5, 49])
            rotate([0, 90, 0])
            cylinder(d=4.5, h=40, center=true, $fn=30);
       }

        hull() {
            translate([0, -50/2 + 5.7, 34])
            rotate([0, 90, 0])
            cylinder(d=5, h=40, center=true, $fn=30);

            translate([0, -50/2 + 6.5, 49])
            rotate([0, 90, 0])
            cylinder(d=4.5, h=40, center=true, $fn=30);
       }
    }
}

module MMU_filament_catcher_wall() {
    module _inner() {
        difference() {
            hull() {
                cylinder(
                    d=100, h=20,
                    center=true, $fn=50
                );

                translate([0, 177, 0])
                cylinder(
                    d=100, h=20,
                    center=true, $fn=50
                );
            }

            translate([0, 230, 0])
            cube([40, 11, 20], center=true);

            translate([0, -50, 0])
            cylinder(d=117, h=20, center=true, $fn=50);

            cube([11, 600, 30], center=true);

            translate([0, 10, 0])
            cube([25, 12, 50], center=true);

            translate([0, 160, 0])
            cube([25, 12, 50], center=true);

            for (i = [0:1]) {
                translate([100, -20 + i*21, 0])
                tube(300, 30, 5, center=true, $fn=50);

                translate([-100, -20 + i*21, 0])
                tube(300, 30, 5, center=true, $fn=50);
            }

            translate([50, 0, 0])
            tube(100, 30, 5, center=true, $fn=50);

            translate([-50, 0, 0])
            tube(100, 30, 5, center=true, $fn=50);

            translate([0, 160, 0])
            tube(200, 30, 5, center=true, $fn=50);

            translate([45, 197, 0])
            tube(150, 30, 5, center=true, $fn=50);

            translate([-45, 197, 0])
            tube(150, 30, 5, center=true, $fn=50);

            translate([50, 217, 0])
            tube(150, 30, 5, center=true, $fn=50);

            translate([-50, 217, 0])
            tube(150, 30, 5, center=true, $fn=50);

            translate([0, 258, 0])
            tube(150, 30, 5, center=true, $fn=50);

        }
    }

    difference() {
        union() {
            hull() {
                cylinder(d=110, h=4, $fn=50);

                translate([0, 177, 0])
                cylinder(d=110, h=4, $fn=50);
            }

            translate([-20/2 - 0.8, 10, 12/2])
            cube([2.4, 10, 12], center=true);

            translate([20/2 + 0.8, 10, 12/2])
            cube([2.4, 10, 12], center=true);

            translate([-20/2 - 0.8, 160, 7.6/2])
            cube([2, 7, 7.6], center=true);

            translate([20/2 + 0.8, 160, 7.6/2])
            cube([2, 7, 7.6], center=true);
        }

        translate([0, -50, 0])
        cylinder(d=102, h=20, center=true, $fn=50);

        translate([0, -49.6, -12.9])
        rotate([-88, 0, 0])
        scale([1.01, 1, 1])
        MMU_filament_catcher();

        translate([0, 231.2, 5])
        rotate([-30, 0, 0])
        cube([20.2, 20, 10], center=true);

        translate([0, 200/2, 12.4])
        rotate([-1.9, 0, 0])
        chamfered_cube(
            23, 200, 10, 2.7, center=true
        );

        _inner();
    }
}

module new_prusa_bearing_spacer() {
    union() {
        
        rotate([90, 0, 0])
        translate([0, 7/2 + 1.2, -74.95])
        _prusa_bearing_spacer();

        tube(28, 1.3, 4, $fn=50);
    }
}

module new_prusa_bearing_axle_a() {
    difference() {
        union() {
            _prusa_bearing_axle_a();

           translate([0, 0, 15])
            chamfered_cylinder(
                 8, 8, 0.8, $fn=40
            );

            translate([0, 0, 7])
            cylinder(d=6.05, h=15, $fn=40);
        }
        cylinder(d=3.3, h=100, center=true, $fn=30);

        translate([0, 0, 19.3])
        tube(30, 1, 9, $fn=30);

        chamfered_cylinder(
            6.1, 21, 2, center=true, $fn=40
        );
    }
}

module new_prusa_bearing_axle_b() {
    difference() {
        union() {
            _prusa_bearing_axle_b();

            translate([0, 0, 15])
            chamfered_cylinder(
                 8, 8, 0.8, $fn=40
            );

            translate([0, 0, 14])
            cylinder(d=6.5, h=8.4, $fn=40);
        }
        cylinder(d=3.3, h=100, center=true, $fn=30);

        translate([0, 0, 19.3])
        tube(30, 1, 9, $fn=30);

        chamfered_cylinder(
            5, 32, 2, center=true, $fn=40
        );
    }
}