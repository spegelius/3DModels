use <../../../Dollo/NEW_long_ties/include.scad>;

use <common.scad>;
use <Mod_Spool_Holder_remix/Mod_Spool_Holder_remix.scad>;


w1 = 368;
d1 = 255;

w2 = 365;
d2 = 255;

//mockup_ace_pro_back_roller();
//mockup_ace_pro();
//mockup_ace_2_pro();

debug_mod_spool_holder();
//debug_mod_spool_holder_ace2();


module mockup_ace_pro_front_roller() {
    module _front_roller_axle() {
        rotate([0, 90, 0])
        cylinder(d=3, h=82.8, center=true, $fn=30);
    }

    module _front_roller_main() {
        union() {
            rotate([0, 90, 0])
            cylinder(d=5.5, h=72.2, center=true, $fn=40);

            rotate([0, 90, 0])
            cylinder(d=4, h=75, center=true, $fn=40);

            translate([-72.2/2 + 26/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=11, h=26, center=true, $fn=40);

            translate([72.2/2 - 26/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=11, h=26, center=true, $fn=40);
        }
    }

    union() {
        color("darkslategrey")
        _front_roller_main();

        color("silver")
        _front_roller_axle();

        color("silver")
        translate([-82.3/2 + 3/2, 0, 0])
        rotate([0, 90, 0])
        chamfered_cylinder(7, 3, 0.3, center=true, $fn=30);

        color("silver")
        translate([82.3/2 - 3/2, 0, 0])
        rotate([0, 90, 0])
        chamfered_cylinder(7, 3, 0.3, center=true, $fn=30);

    }
}

module mockup_ace_pro_back_roller() {
    module _back_roller_axle() {
        rotate([0, 90, 0])
        cylinder(d=3, h=82.8, center=true, $fn=30);
    }

    module _back_roller_main() {
        difference() {
            union() {
                rotate([0, 90, 0])
                cylinder(d=8.8, h=75.5, center=true, $fn=30);

                rotate([0, 90, 0])
                cylinder(d=12, h=75, center=true, $fn=30);

                translate([-75/2, 0, 0])
                rotate([0, 90, 0])
                cylinder(d=16, h=1.3, $fn=30);

                translate([75/2, 0, 0])
                rotate([0, -90, 0])
                cylinder(d=16, h=1.3, $fn=30);
            }

            rounded_cube_side(33, 8, 20, 4, center=true, $fn=30);

            rotate([0, 90, 0])
            cylinder(d=3.1, h=100, center=true, $fn=30);

            translate([75.5/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=7, h=28, center=true, $fn=30);

            translate([-75.5/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=7, h=28, center=true, $fn=30);
        }
    }

    union() {
        color("darkslategrey")
        _back_roller_main();

        color("silver")
        _back_roller_axle();
    }
}

module mockup_ace_pro(front_rollers=true, back_rollers=true) {
    module _foot() {
        hull() {
            translate([0, 39/2 - 11/2, 0])
            cylinder(d=11, h=2, $fn=30);

            translate([0, -39/2 + 11/2, 0])
            cylinder(d=11, h=2, $fn=30);
        }
    }

    module _front_roller_mount() {
        translate([0, -d1/2 - 15 + 71 - 18/2, 91 + 7.6 - 22])
        difference() {
            union() {
                cube([9, 18, 20], center=true);

                translate([-9/2, 18/2 + 0.5, 0])
                cube([1, 2, 20], center=true);

                translate([9/2, 18/2 + 0.5, 0])
                cube([1, 2, 20], center=true);
            }

            translate([-9/2, 18/2 - 3 - 7/2, 20/2 - 6 + 7/2])
            rotate([0, 90, 0])
            cylinder(d=7, h=8, center=true, $fn=30);

            translate([-9/2, 18/2 - 3 - 7/2, 20/2])
            cube([8, 6, 8], center=true);

            translate([9/2, 18/2 - 3 - 7/2, 20/2 - 6 + 7/2])
            rotate([0, 90, 0])
            cylinder(d=7, h=8, center=true, $fn=30);

            translate([9/2, 18/2 - 3 - 7/2, 20/2])
            cube([8, 6, 8], center=true);
        }
    }

    module _back_roller_mount(side=false) {
        translate([
            0, -d1/2 - 15 + 71 + 172 + 20/2,
            96 + 7.6 - 28 - 20/2
        ])
        difference() {
            if (side) {
                cube([7.5, 20, 34], center=true);
            } else {
                cube([7.5, 20, 20], center=true);
            }

            translate([-7.5/2, -20/2 + 4 + 3/2, 20/2 - 3 + 3/2])
            rotate([0, 90, 0])
            cylinder(d=3, h=6.5, center=true, $fn=30);

            hull() {
                translate([-7.5/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([6.5, 2.5, 20], center=true);

                translate([-7.5/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([6.5, 5.5, 1], center=true);
            }

            translate([7.5/2, -20/2 + 4 + 3/2, 20/2 - 3 + 3/2])
            rotate([0, 90, 0])
            cylinder(d=3, h=6.5, center=true, $fn=30);

            hull() {
                translate([7.5/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([6.5, 2.5, 20], center=true);

                translate([7.5/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([6.5, 5.5, 1], center=true);
            }
        }
    }

    module _filament_hole() {
        translate([
            0, -d1/2 - 15 + 53.5 - 42 + 14.5, 91 + 7.6 + 21
        ])
        union() {
            rounded_cube_side(15, 15, 0.4, 6, center=true);
            cylinder(d=2.5, h=20, center=true, $fn=30);

            translate([0, 0, -3])
            chamfered_cylinder(8, 10, 3, $fn=30);
        }
    }

    module _main_form() {
        union() {
            // main
            translate([0, 0, 7.6])
            intersection() {
                translate([0, 0, 220/2])
                rotate([90, 0, 0])
                rounded_cube_side(
                    w1, 220, d1, 36, center=true, $fn=40
                );

                translate([0, 0, 165/2])
                cube([400, 400, 165], center=true);
            }

            // bottom
            hull() {
                translate([0, 0, 7.6 + 1/2])
                rounded_cube_side(
                    w1 - 56, d1 - 20,
                    1, 26, center=true
                );

                translate([0, 0, 1.6 + 1/2])
                rounded_cube_side(
                    w1 - 78, d1 - 42,
                    1, 26, center=true
                );
            }

            // ptfe
            translate([0, d1/2 - 100/2, 20/2 + 1.6])
            cube([90.5, 100, 20], center=true);

            // feet
            translate([250/2 + 11/2, 117/2 + 39/2, 0])
            _foot();

            translate([250/2 + 11/2, -117/2 - 39/2, 0])
            _foot();

            translate([-250/2 - 11/2, 117/2 + 39/2, 0])
            _foot();

            translate([-250/2 - 11/2, -117/2 - 39/2, 0])
            _foot();

            // front
            hull() {
                translate([0, -d1/2, 100/2 + 30 + 7.6])
                rotate([90, 0, 0])
                rounded_cube_side(
                    338, 100, 30, 26, center=true, $fn=40
                );

                translate([0, -d1/2 + 1/2, 100/2 + 29 + 7.6])
                rotate([90, 0, 0])
                rounded_cube_side(
                    340, 1, 30, 26, center=true, $fn=40
                );

            }
        }
    }

    module _main_cuts() {
        // top cut
        hull() {
            translate([0, d1/2 - 91, 91 + 7.6 + 22/2])
            rotate([0, 90, 0])
            cylinder(d=22, h=400, center=true, $fn=40);

            translate([
                0, -300/2 + d1/2 - 21,
                165 + 7.6 + 1/2
            ])
            cube([400, 300, 1], center=true);

            translate([0, -200, 91 + 7.6 + 100/2])
            cube([400, 1, 100], center=true);
        }

        // back top cut
        translate([0, d1/2 - 2 - 100/2, 96 + 7.6 + 69/2])
        cube([359, 100, 69], center=true);

        // inner cuts
        intersection() {
            union() {
                translate([
                    0, -d1/2 - 15 + 59.5 + 22/2, 91 + 7.6
                ])
                cube([w1 - 28, 22, 44], center=true);
                
                translate([
                    0, -d1/2 - 15 + 59.5 + 22/2,
                    91 + 7.6 - 22 + 17/2
                ])
                cube([w1 - 28, 26, 17], center=true);

                hull() {
                    translate([
                        0, -d1/2 - 15 + 59.5 + 202/2, 96 + 7.6
                    ])
                    cube([w1 - 28, 202, 1], center=true);

                    translate([
                        0, -d1/2 - 15 + 59.5 + 202 - 28/2 - 2,
                        96 + 7.6 - 40 + 28/2
                        
                    ])
                    rotate([0, 90, 0])
                    cylinder(
                        d=28, h=w1 - 28, center=true, $fn=40
                    );

                    translate([
                        0, -d1/2 - 15 + 59.5 + 102 - 28/2 - 2,
                        96 + 7.6 - 40 + 28/2
                        
                    ])
                    rotate([0, 90, 0])
                    cylinder(
                        d=28, h=w1 - 28, center=true, $fn=40
                    );
                }

                intersection() {
                    translate([0, 18, 202/2 + 91 + 7.6 - 75])
                    rotate([0, 90, 0])
                    cylinder(
                        d=202, h=w1 - 28, center=true, $fn=80
                    );

                    translate([
                        0, -d1/2 - 15 + 59.5 + 202/2, 0
                    ])
                    cube([w1 - 28, 202, 200], center=true);
                }
            }

            hull() {
                translate([0, 0, 96 + 7.6])
                cube([w1 - 28, 300, 1], center=true);

                cube([w1 - 33, 300, 1], center=true);
            }
        }
    }

    module _screw_holes() {
        // screw holes
        translate([337/2 + 3.5, -d1/2 + 24, 91 + 7.6])
        cylinder(d=2.5, h=20, center=true, $fn=30);

        translate([-337/2 - 3.5, -d1/2 + 24, 91 + 7.6])
        cylinder(d=2.5, h=20, center=true, $fn=30);        
    }

    module _filament_holes() {
        translate([-337/2 + 53, 0, 0])
        _filament_hole();

        translate([-337/2 + 53 + 63, 0, 0])
        _filament_hole();

        translate([337/2 - 53, 0, 0])
        _filament_hole();

        translate([337/2 - 53 - 63, 0, 0])
        _filament_hole();
    }

    union() {
        difference() {
            _main_form();
            _main_cuts();
            _screw_holes();
        }

        // ptfe panel
        difference() {
            hull() {
                translate([
                    0, -d1/2 - 15 + 53.5 - 28/2,
                    91 + 7.6 + 21 - 28/2
                ])
                rotate([0, 90, 0])
                cylinder(d=28, h=337, center=true, $fn=40);

                translate([
                    0, -d1/2 - 15 + 53.5 - 28/2,
                    91 + 7.6 - 28/2
                ])
                rotate([0, 90, 0])
                cylinder(d=28, h=337, center=true, $fn=40);

                translate([
                    0, -d1/2 - 15 + 53.5 - 28 + 1/2,
                    91 + 7.6 + 21 - 40/2
                ])
                cube([337, 1, 40], center=true);

                translate([
                    0, -d1/2 - 15 + 53.5 - 42 + 1/2,
                    91 + 7.6 + 21 - 40/2
                ])
                cube([317, 1, 40], center=true);
            }

            translate([
                317/2 + 20/2,
                -d1/2 - 15 + 53.5 - 28 - 20/2,
                91 + 7.6
            ])
            rounded_cube_side(
                20, 20, 60, 6, center=true, $fn=40
            );

            translate([
                -317/2 - 20/2,
                -d1/2 - 15 + 53.5 - 28 - 20/2,
                91 + 7.6
            ])
            rounded_cube_side(
                20, 20, 60, 6, center=true, $fn=40
            );

            _filament_holes();
        }

        // back side screw studs
        hull() {
            translate([
                -w1/2, d1/2 - 2 - 47, 96 + 7.6 + 7 - 6.5/2
            ])
            rotate([0, 90, 0])
            cylinder(d=6.5, h=8.5, $fn=30);

            translate([
                -w1/2, d1/2 - 2 - 47, 96 + 7.6 - 6.5/2
            ])
            rotate([0, 90, 0])
            cylinder(d=6.5, h=8.5, $fn=30);
        }

        hull() {
            translate([
                w1/2, d1/2 - 2 - 47, 96 + 7.6 + 7 - 6.5/2
            ])
            rotate([0, -90, 0])
            cylinder(d=6.5, h=8.5, $fn=30);

            translate([
                w1/2, d1/2 - 2 - 47, 96 + 7.6 - 6.5/2
            ])
            rotate([0, -90, 0])
            cylinder(d=6.5, h=8.5, $fn=30);
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
        _back_roller_mount(side=true);

        translate([84*2, 0, 0])
        _back_roller_mount(side=true);

        // fins
        translate([-84, 22, 91 + 7.6 - 75 - 60 + 43])
        hull() {
            translate([0, -58/2 + 14/2, 60 - 14/2])
            rotate([0, 90, 0])
            rounded_cylinder(14, 7.2, 6, center=true, $fn=30);

            translate([0, 58/2 - 14/2, 60 - 14/2])
            rotate([0, 90, 0])
            rounded_cylinder(14, 7.2, 6, center=true, $fn=30);

            translate([0, -64/2 + 14/2, 10])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 6, center=true, $fn=30);

            translate([0, 64/2 - 14/2, 10])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 6, center=true, $fn=30);

        }

        translate([84, 22, 91 + 7.6 - 75 - 60 + 43])
        hull() {
            translate([0, -58/2 + 14/2, 60 - 14/2])
            rotate([0, 90, 0])
            rounded_cylinder(14, 7.2, 6, center=true, $fn=30);

            translate([0, 58/2 - 14/2, 60 - 14/2])
            rotate([0, 90, 0])
            rounded_cylinder(14, 7.2, 6, center=true, $fn=30);

            translate([0, -66/2 + 14/2, 10])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 6, center=true, $fn=30);

            translate([0, 66/2 - 14/2, 10])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 6, center=true, $fn=30);
        }
    }

    if (front_rollers) {
        translate([
            84/2, -d1/2 - 15 + 71 - 6.5,
            91 + 7.6 - 14.7
        ])
        mockup_ace_pro_front_roller();

        translate([
            84/2 + 84, -d1/2 - 15 + 71 - 6.5,
            91 + 7.6 - 14.7
        ])
        mockup_ace_pro_front_roller();

        translate([
            -84/2, -d1/2 - 15 + 71 - 6.5,
            91 + 7.6 - 14.7
        ])
        mockup_ace_pro_front_roller();

        translate([
            -84/2 - 84, -d1/2 - 15 + 71 - 6.5,
            91 + 7.6 - 14.7
        ])
        mockup_ace_pro_front_roller();
    }

    if (back_rollers) {
        translate([
            84/2, -d1/2 - 15 + 71 + 172 + 5.5,
            96 + 7.6 - 28 - 1.5
        ])
        mockup_ace_pro_back_roller();

        translate([
            84/2 + 84, -d1/2 - 15 + 71 + 172 + 5.5,
            96 + 7.6 - 28 - 1.5
        ])
        mockup_ace_pro_back_roller();

        translate([
            -84/2, -d1/2 - 15 + 71 + 172 + 5.5,
            96 + 7.6 - 28 - 1.5
        ])
        mockup_ace_pro_back_roller();

        translate([
            -84/2 - 84, -d1/2 - 15 + 71 + 172 + 5.5,
            96 + 7.6 - 28 - 1.5
        ])
        mockup_ace_pro_back_roller();
    }
}

module mockup_ace_2_pro(front_rollers=true, back_rollers=true) {
    module _foot() {
        hull() {
            translate([0, 39/2 - 10.5/2, 0])
            cylinder(d=10.5, h=2, $fn=30);

            translate([0, -39/2 + 10.5/2, 0])
            cylinder(d=10.5, h=2, $fn=30);
        }

        hull() {
            translate([0, 39/2 - 10.5/2, 0.8])
            chamfered_cylinder(17, 6, 2.5, $fn=30);

            translate([0, -39/2 + 10.5/2, 0.8])
            chamfered_cylinder(17, 6, 2.5, $fn=30);
        }
    }

    module _front_roller_mount() {
        translate([
            0, -d2/2 - 15 + 65 - 20/2, 95 + 11 - 19.2 - 20/2
        ])
        difference() {
            union() {
                cube([8.8, 20, 20], center=true);

                translate([-8.8/2, 20/2, 0])
                cube([1, 2, 20], center=true);

                translate([8.8/2, 20/2, 0])
                cube([1, 2, 20], center=true);

            }

            translate([
                -8.8/2, 20/2 - 3.5 - 7/2, 20/2 - 6 + 7/2
            ])
            rotate([0, 90, 0])
            cylinder(d=7, h=8, center=true, $fn=30);

            translate([
                -8.8/2, 20/2 - 3.5 - 7/2, 20/2
            ])
            cube([8, 6, 8], center=true);

            translate([
                8.8/2, 20/2 - 3.5 - 7/2, 20/2 - 6 + 7/2
            ])
            rotate([0, 90, 0])
            cylinder(d=7, h=8, center=true, $fn=30);

            translate([8.8/2, 20/2 - 3.5 - 7/2, 20/2])
            cube([8, 6, 8], center=true);
        }
    
    }

    module _back_roller_mount() {
        translate([
            0, -d2/2 - 15 + 70.5 + 166 + 20/2,
            150 + 11 - 83.5 - 20/2
        ])
        difference() {
            cube([8.3, 20, 20], center=true);

            translate([-8.3/2, -20/2 + 4 + 3/2, 20/2 - 3.5 + 3/2])
            rotate([0, 90, 0])
            cylinder(d=3, h=7, center=true, $fn=30);

            hull() {
                translate([-8.3/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([7.1, 2.5, 20], center=true);

                translate([-8.3/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([7.1, 5.5, 1], center=true);
            }

            translate([8.3/2, -20/2 + 4 + 3/2, 20/2 - 3.5 + 3/2])
            rotate([0, 90, 0])
            cylinder(d=3, h=7, center=true, $fn=30);

            hull() {
                translate([8.3/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([7.1, 2.5, 20], center=true);

                translate([8.3/2, -20/2 + 4 + 3/2, 20/2 + 8])
                cube([7.1, 5.5, 1], center=true);
            }
        }
    }

    module _main_form() {
        union() {
            // main
            translate([0, 0, 11])
            intersection() {
                translate([0, 0, 220/2])
                rotate([90, 0, 0])
                rounded_cube_side(
                    w2, 220, d2, 36, center=true, $fn=40
                );

                translate([0, 0, 150/2])
                cube([400, 400, 150], center=true);
            }

            // bottom
            hull() {
                translate([0, d2/2 - 229/2 - 6, 11 + 1/2])
                cube([313, 229, 1], center=true);

                translate([0, d2/2 - 229/2 - 6, 3.3 + 1/2])
                cube([307, 229, 1], center=true);
            }

            // ptfe
            translate([0, d1/2 - 100/2, 20/2 + 3.3])
            cube([90.5, 100, 20], center=true);

            // feet
            translate([269/2 + 10.5/2, 125/2 + 39/2, 0])
            _foot();

            translate([269/2 + 10.5/2, -125/2 - 39/2, 0])
            _foot();

            translate([-269/2 - 10.5/2, 125/2 + 39/2, 0])
            _foot();

            translate([-269/2 - 10.5/2, -125/2 - 39/2, 0])
            _foot();

            // front
            hull() {
                translate([0, -d1/2, 100/2 + 30 + 7.6])
                rotate([90, 0, 0])
                rounded_cube_side(
                    337, 100, 30, 26, center=true, $fn=40
                );

                translate([0, -d1/2 + 1/2, 100/2 + 29 + 7.6])
                rotate([90, 0, 0])
                rounded_cube_side(
                    340, 1, 30, 26, center=true, $fn=40
                );

            }
        }
    }

    module _main_cuts() {
        // top cut
        hull() {
            translate([0, d2/2 - 92, 95 + 11 + 22/2])
            rotate([0, 90, 0])
            cylinder(d=22, h=400, center=true, $fn=40);

            translate([
                0, -300/2 + d2/2 - 30,
                150 + 11 + 1/2
            ])
            cube([400, 300, 1], center=true);

            translate([0, -200, 95 + 11 + 100/2])
            cube([400, 1, 100], center=true);
        }

        // inner cuts
        intersection() {
            union() {
                translate([
                    0, d2/2 - 17 - 100/2,
                    150 + 11 + 200/2 - 95.5
                ])
                rotate([0, 90, 0])
                rounded_cube_side(
                    200, 100, 338, 20, center=true, $fn=40
                );

                translate([
                    0, -d2/2 - 15 + 50 + 150/2,
                    95 + 11 + 200/2 - 28.5
                ])
                rotate([0, 90, 0])
                rounded_cube_side(
                    200, 150, 338, 20, center=true, $fn=40
                );

                intersection() {
                    translate([0, 15, 220/2 + 95 + 11 - 79.5])
                    rotate([0, 90, 0])
                    cylinder(
                        d=220, h=w1 - 28, center=true, $fn=80
                    );

                    translate([
                        0, -d1/2 - 15 + 59.5 + 202/2, 0
                    ])
                    cube([w1 - 28, 202, 200], center=true);
                }
            }

            translate([0, d2/2 - 17 - 203/2, 200/2])
            cube([338, 203, 200], center=true);
        }
    }

    module _filament_hole() {
        translate([
            0, -d2/2 - 15 + 53.5 - 42 + 14.5, 95 + 11 + 14
        ])
        union() {
            translate([0, 5/2, 0])
            rounded_cube_side(15, 20, 0.4, 6, center=true);

            cylinder(d=2.5, h=20, center=true, $fn=30);

            translate([0, 0, -3])
            chamfered_cylinder(8, 10, 3, $fn=30);
        }
    }

    module _filament_holes() {
        translate([-84/2, 0, 0])
        _filament_hole();

        translate([-84/2 - 84, 0, 0])
        _filament_hole();

        translate([84/2, 0, 0])
        _filament_hole();

        translate([84/2 + 84, 0, 0])
        _filament_hole();
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
                    0, -d2/2 - 15 + 50.5 - 24/2,
                    95 + 11 + 14 - 24/2
                ])
                rotate([0, 90, 0])
                cylinder(d=24, h=334, center=true, $fn=40);

                translate([
                    0, -d2/2 - 15 + 54.5 - 24/2,
                    95 + 11 - 24/2 - 70
                ])
                rotate([0, 90, 0])
                cylinder(d=24, h=334, center=true, $fn=40);

                translate([
                    0, -d2/2 - 15 + 50.5 - 41.4 + 1/2,
                    95 + 11 + 14 - 40/2
                ])
                cube([334, 1, 40], center=true);
            }

            translate([
                313/2 + 40/2,
                -d2/2 - 15 + 11,
                40
            ])
            cylinder(d=40, h=100, $fn=40);

            translate([
                -313/2 - 40/2,
                -d2/2 - 15 + 11,
                40
            ])
            cylinder(d=40, h=100, $fn=40);

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

        hull() {
            translate([
                338/2, -d2/2 - 15 + 70.5 + 166 + 1.6/2,
                150 + 11 - 83.5 - 1/2
            ])
            cube([10, 1.6, 1], center=true);

            translate([
                338/2, -d2/2 - 15 + 70.5 + 166 + 1.6/2,
                150 + 11 - 83.5 + 15.5
            ])
            cube([0.1, 1.6, 1], center=true);
        }

        hull() {
            translate([
                -338/2, -d2/2 - 15 + 70.5 + 166 + 1.6/2,
                150 + 11 - 83.5 - 1/2
            ])
            cube([10, 1.6, 1], center=true);

            translate([
                -338/2, -d2/2 - 15 + 70.5 + 166 + 1.6/2,
                150 + 11 - 83.5 + 15.5
            ])
            cube([0.1, 1.6, 1], center=true);
        }

        // fins
        translate([-84, 15, 95 + 11 - 79.5 - 60 + 58.8])
        hull() {
            translate([0, -52.5/2 + 12/2, 60 - 12/2])
            rotate([0, 90, 0])
            rounded_cylinder(12, 9.2, 4, center=true, $fn=30);

            translate([0, 52.5/2 - 12/2, 60 - 12/2])
            rotate([0, 90, 0])
            rounded_cylinder(12, 9.2, 4, center=true, $fn=30);

            translate([0, -64/2 + 14/2, 0])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 4, center=true, $fn=30);

            translate([0, 64/2 - 14/2, 0])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 4, center=true, $fn=30);
        }

        translate([84, 15, 95 + 11 - 79.5 - 60 + 58.8])
        hull() {
            translate([0, -52.5/2 + 12/2, 60 - 12/2])
            rotate([0, 90, 0])
            rounded_cylinder(12, 9.2, 4, center=true, $fn=30);

            translate([0, 52.5/2 - 12/2, 60 - 12/2])
            rotate([0, 90, 0])
            rounded_cylinder(12, 9.2, 4, center=true, $fn=30);

            translate([0, -64/2 + 14/2, 0])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 4, center=true, $fn=30);

            translate([0, 64/2 - 14/2, 0])
            rotate([0, 90, 0])
            rounded_cylinder(14, 11, 4, center=true, $fn=30);
        }
    }

    if (front_rollers) {
        translate([
            84/2, -d2/2 - 15 + 65 - 7, 95 + 11 - 21.75
        ])
        mockup_ace_pro_front_roller();

        translate([
            84/2 + 84, -d2/2 - 15 + 65 - 7, 95 + 11 - 21.75
        ])
        mockup_ace_pro_front_roller();

        translate([
            -84/2, -d2/2 - 15 + 65 - 7, 95 + 11 - 21.75
        ])
        mockup_ace_pro_front_roller();

        translate([
            -84/2 - 84, -d2/2 - 15 + 65 - 7, 95 + 11 - 21.75
        ])
        mockup_ace_pro_front_roller();
        
    }

    if (back_rollers) {
        translate([
            84/2, -d2/2 - 15 + 70.5 + 166 + 5.5,
            150 + 11 - 83.5 - 2
        ])
        mockup_ace_pro_back_roller();

        translate([
            84/2 + 84, -d2/2 - 15 + 70.5 + 166 + 5.5,
            150 + 11 - 83.5 - 2
        ])
        mockup_ace_pro_back_roller();

        translate([
            -84/2, -d2/2 - 15 + 70.5 + 166 + 5.5,
            150 + 11 - 83.5 - 2
        ])
        mockup_ace_pro_back_roller();

        translate([
            -84/2 - 84, -d2/2 - 15 + 70.5 + 166 + 5.5,
            150 + 11 - 83.5 - 2
        ])
        mockup_ace_pro_back_roller();
    }
}

module debug_mod_spool_holder() {
    intersection() {
        mockup_ace_pro();

        translate([-1000/2 - 6, 0, 0])
        cube([1000, 1000, 1000], center=true);
    }

//    translate([171.5, -88.8, 98.6])
//    rotate([-1.37, 0, 180])
//    mod_spool_holder_assembly();

    translate([0, 8.5, 98.7])
    rotate([0, 0, 180])
    mod_spool_holder_v2_assembly();
}

module debug_mod_spool_holder_ace2() {
    intersection() {
        mockup_ace_2_pro(back_rollers=true);

        translate([-1000/2 - 6, 0, 0])
        cube([1000, 1000, 1000], center=true);

//        translate([1000/2 + 100, 1000/2 + 50, 0])
//        cube([1000, 1000, 1000], center=true);
    }

    translate([0, 0, 106])
    rotate([0, 0, 180])
    mod_spool_holder_ace2_assembly();
}