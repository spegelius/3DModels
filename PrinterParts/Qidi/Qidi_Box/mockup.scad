use <../../../Dollo/NEW_long_ties/include.scad>;

use <Mod_Spool_Holder/Mod_Spool_Holder.scad>;

w1 = 358;
d1 = 299.2;


//mockup_qidi_box_back_roller();
//mockup_qidi_box_front_roller();
//mockup_qidi_box();

debug_mod_spool_holder();


module mockup_qidi_box_back_roller() {
    module _back_roller_axle() {
        rotate([0, 90, 0])
        cylinder(d=3, h=81, center=true, $fn=30);
    }

    module _back_roller_main() {
        difference() {
            union() {
                rotate([0, 90, 0])
                tube(16, 72.2, 2, center=true, $fn=30);

                for(i = [0:2]) {
                    rotate([i*120, 0, 0])
                    translate([0, 0, 7/2])
                    cube([72.2, 1, 7], center=true);
                }

            }

        }
    }

    union() {
        color("darkslategrey")
        _back_roller_main();

        color("silver")
        _back_roller_axle();

        color("silver")
        translate([81/2 - 4, 0, 0])
        rotate([0, 90, 0])
        chamfered_cylinder(8, 4, 0.3, $fn=30);

        color("silver")
        translate([-81/2, 0, 0])
        rotate([0, 90, 0])
        chamfered_cylinder(8, 4, 0.3, $fn=30);

    }
}

module mockup_qidi_box_front_roller() {
    module _front_roller_axle() {
        rotate([0, 90, 0])
        cylinder(d=3, h=82, center=true, $fn=30);
    }

    module _front_roller_main() {
        union() {
            translate([-82/2 + 25/2 + 5, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=16, h=25, center=true, $fn=40);

            translate([-82/2 + 45/2 + 5, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=8, h=45, center=true, $fn=40);

            translate([-82/2 + 5 + 25, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=25, h=6, $fn=40);

            translate([-82/2 + 5 + 30, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=28, h=8, $fn=40);

            translate([82/2 - 25.5/2 - 5, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=16, h=25.5, center=true, $fn=40);

            translate([82/2 - 1/2 - 5, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=18, h=1, center=true, $fn=40);

        }
    }

    union() {
        color("darkslategrey")
        _front_roller_main();

        color("silver")
        _front_roller_axle();

        color("silver")
        translate([-82/2 + 4/2, 0, 0])
        rotate([0, 90, 0])
        chamfered_cylinder(8, 4, 0.3, center=true, $fn=30);

        color("silver")
        translate([82/2 - 4/2, 0, 0])
        rotate([0, 90, 0])
        chamfered_cylinder(8, 4, 0.3, center=true, $fn=30);

    }
}

module mockup_qidi_box(front_rollers=true, back_rollers=true) {
    module _foot() {
        union() {
            cylinder(d=20, h=4.4, $fn=30);

            translate([0, 0, 3.2])
            tube(23, 1.2, 1.3, $fn=30);
        }
    }

    module _front_roller_mount() {
        translate([0, -d1/2 + 12 + 62 + 20/2, 86 - 10 - 30/2])
        difference() {
            union() {
                cube([10, 20, 30], center=true);

                translate([0, 20/2 - 1/2, 0])
                cube([12, 1, 30], center=true);

                translate([3/2, 0, 0])
                cube([13, 20, 6], center=true);
            }

            translate([-10/2, 0, 30/2 - 6 + 8/2])
            rotate([0, 90, 0])
            cylinder(d=8, h=9, center=true, $fn=30);

            translate([10/2, 0, 30/2 - 6 + 8/2])
            rotate([0, 90, 0])
            cylinder(d=8, h=9, center=true, $fn=30);
        }
    }

    module _back_roller_mount() {
        translate([
            0, d1/2 - 5/2 - 24/2 - 10,
            60.5
        ])
        difference() {
            union() {
                cube([10, 24, 24.2], center=true);

                translate([0, -24/2 + 1/2, 0])
                cube([12, 1, 24.2], center=true);
            }

            translate([-10/2, -24/2 + 8/2 + 6, 24.2/2 - 6 + 8/2])
            rotate([0, 90, 0])
            cylinder(d=8, h=9, center=true, $fn=30);

            translate([10/2, -24/2 + 8/2 + 6, 24.2/2 - 6 + 8/2])
            rotate([0, 90, 0])
            cylinder(d=8, h=9, center=true, $fn=30);
        }
    }

    module _filament_hole() {
        translate([
            0, -d1/2 + 12 + 62 - 21, 113.5
        ])
        cylinder(d=4, h=10, center=true, $fn=30);
    }

    module _main_form() {
        union() {
            // main
            hull() {
                translate([0, 0, 4.4 + 68.5/2])
                cube([w1, d1, 68.5], center=true);

                translate([0, d1/2 - 287.2/2, 4.4 + 81.5/2])
                cube([w1, 287.2, 81.5], center=true);
            }

            difference() {
                translate([0, d1/2 - 287.2/2, 4.4 + 194/2])
                cube([w1, 287.2, 194], center=true);

                hull() {
                    translate([0, d1/2 - 287.2 - 1/2, 200/2 + 93])
                    cube([500, 1, 200], center=true);

                    translate([0, d1/2 - 12 - 1/2, 200/2 + 194])
                    cube([500, 1.01, 200], center=true);
                }

                hull() {
                    translate([0, d1/2 - 12 + 1/2, 200/2 + 194])
                    cube([500, 1.01, 200], center=true);

                    translate([0, d1/2 + 1/2, 200/2 + 190])
                    cube([500, 1, 200], center=true);

                }
            }

            // feet
            translate([267/2 + 23/2, d1/2 - 34.2 - 23/2, 0])
            _foot();

            translate([267/2 + 23/2, d1/2 - 34.2 - 193.5 - 23/2, 0])
            _foot();

            translate([-267/2 - 23/2, d1/2 - 34.2 - 23/2, 0])
            _foot();

            translate([-267/2 - 23/2, d1/2 - 34.2 - 193.5 - 23/2, 0])
            _foot();
        }
    }

    module _main_cuts() {
        difference() {
            translate([0, d1/2 - 282.2/2 - 5/2, 200/2 + 86])
            cube([353, 282.2, 200], center=true);

            hull() {
                translate([0, d1/2 - 287.2 - 1/2, 200/2 + 84])
                cube([500, 1, 200], center=true);

                translate([0, d1/2 - 12 - 1/2, 200/2 + 185])
                cube([500, 1.01, 200], center=true);
            }

            translate([0, d1/2, 50/2 + 182])
            cube([500, 50, 50], center=true);
        }

        translate([0, 0, 145])
        rotate([20, 0, 0])
        cube([338.5, 270, 26], center=true);
        
        // inner cuts
        intersection() {
            union() {
                translate([
                    0, d1/2 - 200/2 - 5/2 - 10, 50/2 + 60.5
                ])
                cube([353 - 17, 200, 50], center=true);

                translate([
                    0, -d1/2 + 200/2 + 23, 50/2 + 57.5
                ])
                cube([353 - 17, 200, 50], center=true);
 
                intersection() {
                    translate([0, 27, 212/2 + 86 - 62])
                    rotate([0, 90, 0])
                    cylinder(
                        d=212, h=353 - 17, center=true, $fn=80
                    );

                    translate([
                        0, -d1/2 - 4 + 59.5 + 202/2, 0
                    ])
                    cube([353 - 17, 202, 200], center=true);
                }
            }
        }
    }

    module _filament_holes() {
        translate([-323/2 + 41, 0, 0])
        _filament_hole();

        translate([-323/2 + 124, 0, 0])
        _filament_hole();

        translate([323/2 - 31, 0, 0])
        _filament_hole();

        translate([323/2 - 114, 0, 0])
        _filament_hole();
    }

    module _fin() {
        hull() {
            translate([
                0, -d1/2 + 12 + 62 + 124 - 61/2, 86 - 63 + 74 - 4/2
            ])
            rotate([1, 0, 0])
            rounded_cube(
                8.5, 61, 4, 1, center=true, $fn=10
            );

            translate([0, -d1/2 + 12 + 62 + 124 - 61/2, 86 - 63])
            rounded_cube(
                11.5, 61, 4, 1, center=true, $fn=10
            );

            translate([0, -d1/2 + 12 + 62 + 20 - 1/2, 86 - 10 - 30/2])
            cube([10, 1, 30], center=true);
        }
    }

    union() {
        difference() {
            _main_form();
            _main_cuts();
        }

        // ptfe panel
        difference() {
            hull() {
                translate([
                    0, -d1/2 + 12 + 62 - 44/2,
                    -1/2 + 113.5
                ])
                cube([323, 44, 1], center=true);

                translate([
                    0, -d1/2 + 12 + 62 - 50/2,
                    30/2 + 50.5
                ])
                cube([340, 50, 30], center=true);
            }

            _filament_holes();
        }


        // front roller mounts
        translate([0, 0, 0])
        _front_roller_mount();

        translate([-84, 0, 0])
        _front_roller_mount();

        translate([84, 0, 0])
        _front_roller_mount();

        translate([-84*2, 0, 0])
        _front_roller_mount();

        translate([84*2, 0, 0])
        _front_roller_mount();

        // back roller mounts
        translate([0, 0, 0])
        _back_roller_mount();

        translate([-84, 0, 0])
        _back_roller_mount();

        translate([84, 0, 0])
        _back_roller_mount();

        translate([-84*2, 0, 0])
        _back_roller_mount();

        translate([84*2, 0, 0])
        _back_roller_mount();

        // fins
        _fin();

        translate([-84, 0, 0])
        _fin();

        translate([84, 0, 0])
        _fin();
    }

    if (front_rollers) {
        translate([
            84/2, -d1/2 + 12 + 62 + 20/2,
            86 - 10 -6 + 8/2
        ])
        //translate([0, -d1/2 + 12 + 62 + 20/2, 86 - 10 - 30/2])
        mockup_qidi_box_front_roller();

        translate([
            84/2 + 84, -d1/2 + 12 + 62 + 20/2,
            86 - 10 -6 + 8/2
        ])
        mockup_qidi_box_front_roller();

        translate([
            -84/2, -d1/2 + 12 + 62 + 20/2,
            86 - 10 -6 + 8/2
        ])
        mockup_qidi_box_front_roller();

        translate([
            -84/2 - 84, -d1/2 + 12 + 62 + 20/2,
            86 - 10 -6 + 8/2
        ])
        mockup_qidi_box_front_roller();
    }

    if (back_rollers) {
        translate([
            84/2, d1/2 - 5/2 - 34 + 6 + 8/2,
            60.5 + 24.2/2 - 6 + 8/2
        ])
        mockup_qidi_box_back_roller();

        translate([
            84/2 + 84, d1/2 - 5/2 - 34 + 6 + 8/2,
            60.5 + 24.2/2 - 6 + 8/2
        ])
        mockup_qidi_box_back_roller();

        translate([
            -84/2, d1/2 - 5/2 - 34 + 6 + 8/2,
            60.5 + 24.2/2 - 6 + 8/2
        ])
        mockup_qidi_box_back_roller();

        translate([
            -84/2 - 84, d1/2 - 5/2 - 34 + 6 + 8/2,
            60.5 + 24.2/2 - 6 + 8/2
        ])
        mockup_qidi_box_back_roller();
    }
}

module debug_mod_spool_holder() {
    intersection() {
        mockup_qidi_box(back_rollers=true);

        translate([-1000/2 - 2.5, 0, 0])
        cube([1000, 1000, 1000], center=true);

        translate([-1000/2, -370, 0])
        cube([1000, 1000, 1000], center=true);
    }

    translate([0, 25, 98.7])
    rotate([0, 0, 180])
    mod_spool_holder_qidi_box_assembly();
}