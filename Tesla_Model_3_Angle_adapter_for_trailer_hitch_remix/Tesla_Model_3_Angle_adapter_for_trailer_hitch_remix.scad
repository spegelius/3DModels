use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Tesla/Tesla Model 3 Angle adapter for trailer hitch (Europe)/"
);


//_orig_angle_adapter();
//_thread_part(1.01);
//_thread_part_2();

//angle_adapter();
angle_adapter(1.01);
//angle_adapter_180();
//angle_adapter_180(1.01);
//angle_adapter_thread2();

//adapter_seal();

//qnd_fix();
//test_threads(scaling=1);
//test_threads(scaling=1.01);
//test_threads(threads=2);


module _orig_angle_adapter() {
    import(str(
        spath, 
        "Tesla_Model_3_Winkeladapter_V2.2.stl"
    ), convexity=10);
}

module _adapters_sans_threads() {
    difference() {
        _orig_angle_adapter();

        translate([0, 53, 54.51])
        cylinder(d=43, h=35);
    }
}

module angle_adapter(scaling=1) {

    union() {
        _thread_part(scaling=scaling);

        _adapters_sans_threads();
    }

    //%_orig_angle_adapter();
}

module angle_adapter_180(scaling=1) {

    union() {
        translate([0, 53 * 2, 0])
        rotate([0, 0, 180])
        _thread_part(scaling=scaling);

        _adapters_sans_threads();
    }

    //%_orig_angle_adapter();
}

module angle_adapter_thread2() {
    union() {
        _thread_part_2();

        _adapters_sans_threads();
    }
}

module adapter_seal() {

    module _seal_form(d, h, wall) {
        d1 = d;
        d2 = d - 2 * wall;

        difference() {
            intersection() {
                cylinder(d=d1, h=h, $fn=50);

                cube(
                    [d * 2, d1 * 0.87, 100],
                    center=true
                );
            }

            intersection() {
                cylinder(
                    d=d2, h=h*3,
                    center=true, $fn=50
                );

                cube([
                    d * 2, d * 0.87 - 2*wall,
                    100
                ], center=true);
            }
        }
    }
    
    union() {
        rotate([90, 0, 0])
        intersection() {
            _orig_angle_adapter();

            cube([200, 2, 200], center=true);
        }

        translate([0, -33, 0])
        _seal_form(70, 1.2, 0.5, $fn=150);

        translate([0, -33, 0])
        tube(49, 1.2, 0.5, $fn=150);

        difference() {
            translate([0, -33, 0])
            _seal_form(61, 1.2, 0.5, $fn=150);

            translate([-14, -8.5, 0])
            cylinder(d=6, h=10, center=true, $fn=150);

            translate([29, -33, 0])
            cylinder(d=6, h=10, center=true, $fn=150);

            translate([-14, -57.5, 0])
            cylinder(d=6, h=10, center=true, $fn=150);
        }

        translate([-14, -8.5, 0])
        tube(7, 1.2, 0.9, $fn=150);

        translate([29, -33, 0])
        tube(7, 1.2, 0.9, $fn=150);

        translate([-14, -57.5, 0])
        tube(7, 1.2, 0.9, $fn=150);
    }
}

module _thread_part(scaling=1) {

    module _just_threads() {
        intersection() {
            union() {
                _orig_angle_adapter();

                translate([
                    0, 53, 80 - 23.8 - 10
                ])
                tube(41.6, 10, 3, $fn=60);
            }

            intersection() {
                translate([0, 53, 53])
                cylinder(d=43, h=35);

                translate([0, 53, 49])
                cylinder(
                    d1=30, d2=30 + 62,
                    h=36, $fn=60
                );
            }
        }
    }

    module _seal_neck() {
        translate([0, 53, 80 - 23.8])
        difference() {
            cylinder(
                d=42, h=2 + 2.5/2, $fn=60
            );

            cylinder(
                d=36.5, h=11,
                center=true, $fn=60
            );

            translate([
                0, 0, 2 + 2.5/2 - 2.5/2
            ])
            hull() {
                cylinder(d=36.5, h=1, $fn=60);

                translate([0, 0, 2.5/2])
                cylinder(d=39, h=1, $fn=60);
                
            }
        }
    }

    translate([0, 53, 0])
    scale([scaling, scaling, 1])
    translate([0, -53, 0])
    difference() {
        _just_threads();

        _seal_neck();
    }

    //#translate([0, 53, 0])
    //cylinder(d=32, h=1);
}

module _thread_part_2() {
    module _seal_neck() {
        translate([0, 53, 80 - 23.8])
        difference() {
            cylinder(
                d=42, h=3 + 2.5/2, $fn=60
            );

            cylinder(
                d=36.5, h=11,
                center=true, $fn=60
            );

            translate([
                0, 0, 3 + 2.5/2 - 2.5/2
            ])
            hull() {
                cylinder(d=36.5, h=1, $fn=60);

                translate([0, 0, 2.5/2])
                cylinder(d=39, h=1, $fn=60);
                
            }
        }
    }

    difference() {
        intersection() {
            union() {
                translate([0, 53, 80 - 17 - 4.2])
                rotate([0, 0, -35])
                v_screw(
                    h=17, screw_d=38.8,
                    pitch=1.722222, direction=0,
                    steps=100, depth=0.2,
                    chamfer=false
                );

                translate([0, 53, 80 - 27])
                cylinder(d=36.5, h=27, $fn=60);

                translate([
                    0, 53, 80 - 23.8 - 10
                ])
                tube(41.6, 10, 3, $fn=60);
            }

            intersection() {
                translate([0, 53, 53])
                cylinder(d=43, h=35);

                translate([0, 53, 49])
                cylinder(
                    d1=30, d2=30 + 62,
                    h=36, $fn=60
                );
            }
        }

        _seal_neck();

        translate([0, 53, 0])
        cylinder(d=32, h=100, $fn=60);
    }
}

module test_threads(scaling=1, threads=1) {
    step = 360/10;
    echo (step);

    difference() {
        union() {
            if (threads == 1) {
                translate([0, -53, -40.51])
                _thread_part(scaling=scaling);
            } else {
                translate([0, -53, -40.51])
                _thread_part_2();
            }

            scale([scaling, scaling, 1]) {
                tube(38.8, 14, 3.4, $fn=70);

                translate([0, 38.8/2, 3/2])
                cube([2, 4, 3], center=true);


                translate([0, 38.8/2, 7/2])
                cube([1, 1.5, 7], center=true);
                
                for (i = [0:3]) {
                    rotate([0, 0, i * 360/4])
                    translate([0, 38.8/2, 4/2])
                    cube([1, 1.5, 4], center=true);
                }
                
                for (i = [0:step]) {
                    rotate([0, 0, i * 360/step])
                    translate([0, 38.8/2, 3/2])
                    cube([1, 1.5, 3], center=true);
                }
            }
        }
    }
}

module qnd_fix() {
    difference() {
        cylinder(d=35.5, h=1, $fn=40);

        cylinder(d=31.9, h=30, center=true, $fn=40);
    }
}