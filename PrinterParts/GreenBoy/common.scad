include <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/mockups.scad>;


stl_base_path = "../../_downloaded/";
gb_stl_path = str(
    stl_base_path,
    "GreenBoy/"
);


//mock_greenboy_stepper_motor();
//mock_greenboy_coupler();
//mock_greenboy_feed_screw();
//mock_greenboy_body();
//mock_greenboy_heater_block();

//orig_internal_sliding_pit();


//orig_hopper_2_5kg();
//orig_hopper_2_5kg_cap();
//orig_hopper_2_5kg_base();

//debug_hopper_stand_pole_portion();
//debug_hopper_stand_side_arm_portion();

//body_spacer();
//coupler_drill_jig();
//internal_sliding_pit_tight();
//v10_external_pit_tight();

//new_hopper_2_5kg();
//new_hopper_2_5kg_cap();

//hopper_hose_adapter();

//hopper_stand_pole_portion();
//hopper_stand_pole_portion(130);
//hopper_stand_pole_portion(248);
//hopper_stand_pole_screw_end();
//hopper_stand_pole_end();
//hopper_stand_pole_portion_joint();
//hopper_stand_pole_end_nutcap();
//hopper_base_mount();

//hopper_stand_side_arm_base();
//hopper_stand_side_arm_portion();
//hopper_stand_side_arm_portion_joint();
//hopper_stand_side_arm_end();
//hopper_stand_side_arm_portion(125);
//hopper_stand_side_arm_end(125);

hopper_stand_arm_hopper_attachment();

//clamp_nut_M6();

//rod_spacer_1();
//rod_spacer_2();

// QnD fixes
//hopper_stand_pole_portion_joint_qnd();
//hopper_stand_pole_portion_qnd();



module mock_greenboy_stepper_motor() {
    // 17HS4401S-PG14
    mock_stepper_motor(
        geared=true, center=true, m_h=45.5, mg_h=31, s_h=19
    );
}

module mock_greenboy_coupler() {
    difference() {
        cylinder(d=20, h=20, $fn=40);
        cylinder(d=8, h=100, center=true, $fn=30);

        translate([0, -3, 0])
        cube([1, 20, 100], center=true);

        translate([0, -6.5, 5])
        rotate([0, 90, 0])
        cylinder(d=3, h=40, center=true, $fn=20);

        translate([0, -6.5, 15])
        rotate([0, 90, 0])
        cylinder(d=3, h=40, center=true, $fn=20);
    }
}

module mock_greenboy_feed_screw() {
    h = 71.6;

    difference() {
        union() {
            cylinder(d=8, h=h, $fn=30);

            translate([0, 1.8/2 - 8/2, h - 5/2 - 9.8])
            cube([9, 1.8, 5], center=true);

            translate([0, -1.8/2 + 8/2, h - 5/2 - 9.8])
            cube([9, 1.8, 5], center=true);

            hull() {
                translate([0, 0, h - 14.5 - 1])
                cylinder(d=11.5, h=1, $fn=40);

                translate([0, 0, h - 16.5 - 7])
                cylinder(d=13, h=7, $fn=40);
            }

            chamfered_cylinder(
                12, 52, 2, $fn=40
            );
        }

        translate([0, 0, h])
        cylinder(d=5, h=20, center=true, $fn=30);
    }
}

module mock_greenboy_body() {
    difference() {
        union() {
            chamfered_cylinder(
                16, 25.5, 1, $fn=40
            );

            cylinder(d=13, h=51, $fn=40);

            for(i = [0:11]) {
                translate([0, 0, 28.5 + i*1.8])
                cylinder(d=18, h=0.8, $fn=40);
            }

            translate([0, 0, 50 + 5.5/2])
            cube([21, 17, 5.5], center=true);

            translate([0, 0, 57 - 4])
            cylinder(d=17, h=4, $fn=40);
        }

        cylinder(d=6, h=40, center=true, $fn=30);

        translate([0, 0, 7])
        chamfered_cylinder(
            12.1, 100, 3
        );

        translate([-16.5/2, 0, 50 + 2.5])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=30);

        translate([16.5/2, 0, 50 + 2.5])
        rotate([90, 0, 0])
        cylinder(d=4, h=100, center=true, $fn=30);
    }

    translate([0, 0, -5])
    e3d_v6_nozzle();
}

module mock_greenboy_heater_block() {
    difference() {
        hull() {
            translate([0, 0, 26/2])
            cube([19, 14, 26], center=true);

            translate([0, -5, 26/2])
            cube([9, 14, 26], center=true);

            translate([0, 7, 26/2])
            cube([13.5, 14, 26], center=true);
        }

        translate([0, -14/2 - 5 + 1.5 + 16/2, 0])
        cylinder(d=16, h=100, center=true, $fn=40);

        translate([-3, 14/2 + 7 - 6/2 - 1.5, 0])
        cylinder(d=6, h=100, center=true, $fn=30);

        translate([3, 14/2 + 7 - 3/2 - 4, 0])
        cylinder(d=3, h=100, center=true, $fn=30);

        translate([-3, 14/2 + 7, 19])
        rotate([90, 0, 0])
        cylinder(d=3, h=8, center=true, $fn=20);

        translate([3, 14/2 + 7, 19])
        rotate([90, 0, 0])
        cylinder(d=3, h=8, center=true, $fn=20);

    }
}

module orig_internal_sliding_pit() {
    import (
        str(gb_stl_path, "Internal-Sliding-Pit.stl"),
        convexity=10
    );
}

module orig_v10_external_pit() {
    import (
        str(gb_stl_path, "v10_ExPit.stl"),
        convexity=10
    );
}

module orig_hopper_2_5kg() {
    translate([0, 0, -31.778])
    import (
        str(gb_stl_path, "2.5kg-Pellet-Storage-Hopper.stl"),
        convexity=10
    );
}

module orig_hopper_2_5kg_cap() {
    translate([0, 0, -30.678])
    import (
        str(gb_stl_path, "2.5kg-Pellet-Storage-Hopper-Cap.stl"),
        convexity=10
    );
}

module orig_hopper_2_5kg_base() {
    translate([2, 0.5, 376.96])
    rotate([0, 180, 0])
    import (
        str(gb_stl_path, "2.5kg-Pellet-Storage-Hopper-Base.stl"),
        convexity=10
    );

    //%cube([150, 21, 1], center=true);
}

module _hose_thread_cut(h=20) {
    intersection() {
        union() {
            v_screw(
                h=h,
                screw_d=30,
                pitch=8.25,
                direction=0,
                steps=70,
                depth=3
            );

            cylinder(d=22.7, h=h, $fn=70);
        }

        cylinder(d=25.8, h=h*3, center=true, $fn=70);
    }

    %translate([-25/2 + 3.5/2, 0, 8.25])
    rotate([90, 0, 0])
    cylinder(d=3.5, h=20, center=true, $fn=40);
}


module debug_hopper_stand_pole_portion() {
    intersection() {
        hopper_stand_pole_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    hopper_stand_pole_portion_joint();

    translate([0, 0, 200])
    hopper_stand_pole_portion_joint();
}

module debug_hopper_stand_side_arm_portion() {
    intersection() {
        hopper_stand_side_arm_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    hopper_stand_side_arm_portion_joint();

    translate([0, 0, 200])
    hopper_stand_side_arm_portion_joint();

    intersection() {
        translate([0, -20, -100])
        rotate([90, 0, 180])
        hopper_stand_side_arm_base();

        translate([0, 200/2, 0])
        cube([100, 200, 500], center=true);
    }

    translate([0, 0, 400])
    rotate([0, 180, 0])
    intersection() {
        hopper_stand_side_arm_end();

        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);        
    }
}

module body_spacer() {
    difference() {
        hull() {
            translate([-16.5/2, 0, 0])
            cylinder(d=6, h=6.5, $fn=30);

            translate([16.5/2, 0, 0])
            cylinder(d=6, h=6.5, $fn=30);
        }

        translate([-16.5/2, 0, 0])
        cylinder(d=4.2, h=30, center=true, $fn=30);

        translate([16.5/2, 0, 0])
        cylinder(d=4.2, h=30, center=true, $fn=30);

    }
}

module coupler_drill_jig() {
    %translate([0, 0, 5])
    mock_greenboy_coupler();

    difference() {
        union() {
            cylinder(d=28, h=25, $fn=30);

            translate([-28/2 + 14/2, 0, 5/2])
            cube([14, 28, 5], center=true);

            translate([20, 0, 25/2])
            cube([20, 10, 25], center=true);
        }

        translate([0, 0, 5])
        tube(20.3, 21, (20.3 - 7.8)/2, $fn=30);

        translate([-22, 0, 25/2 + 5])
        rotate([0, 0, 40])
        cube([20, 60, 25], center=true);

        translate([-20/2 - 20/2, 0, 0])
        cube([20, 60, 100], center=true);

        translate([100/2 + 5, 0, 5 + 4.5])
        rotate([0, 90, 0])
        cylinder(d=2, h=100, center=true, $fn=30);

        translate([100/2 + 5, 0, 5 + 20 - 4.5])
        rotate([0, 90, 0])
        cylinder(d=2, h=100, center=true, $fn=30);

        cylinder(d=2, h=100, center=true, $fn=20);
    }
}

module internal_sliding_pit_tight() {
    //%cylinder(d=17, h=1, $fn=50);

    union() {
        translate([0, 0, -9])
        orig_internal_sliding_pit();

        difference() {
            tube(20, 2, 1.4, $fn=40);

            translate([0, 0, 85/2 + 0.1])
            sphere(d=85, $fn=90);

            translate([0, -10/2, 1.94])
            rotate([-45, 0, 0])
            cube([40, 10, 20], center=true);
        }
    }
}

module v10_external_pit_tight() {
//    %cylinder(d=17, h=1, $fn=50);
//    %internal_sliding_pit_tight();

    union() {
        translate([4, -0, 8])
        orig_v10_external_pit();

        difference() {
            tube(20, 2, 1.4, $fn=40);

            translate([0, 0, 85/2 + 0.1])
            sphere(d=85, $fn=90);

            translate([0, 10/2, -2.12])
            rotate([-45, 0, 0])
            cube([40, 10, 20], center=true);
        }
    }
}

module new_hopper_2_5kg() {
    difference() {
        union() {
            orig_hopper_2_5kg();

            translate([3.5/2 + 76.48, 0, 20])
            cube([3.5, 20, 20], center=true);

            translate([-3.5/2 - 76.48, 0, 20])
            cube([3.5, 20, 20], center=true);
        }

        translate([0, 18.5, 177.05])
        rotate([0, 90, 0])
        cylinder(d=3, h=100, center=true, $fn=30);

        translate([83.8, 0, 16.5])
        rotate([90, 0, 0])
        chamfered_cube_side(10, 6.8, 11, 2.2, center=true);

        translate([-83.8, 0, 16.5])
        rotate([90, 0, 0])
        chamfered_cube_side(10, 6.8, 11, 2.2, center=true);

        cube([200, 11, 7], center=true);

        translate([82.8, 0, 1])
        rotate([90, 0, 0])
        chamfered_cube_side(10, 10, 11, 3, center=true);

        translate([-82.8, 0, 1])
        rotate([90, 0, 0])
        chamfered_cube_side(10, 10, 11, 3, center=true);


    }
}

module new_hopper_2_5kg_cap() {
    module _clip() {
        difference() {
            union() {
                translate([75.5, 0, 21/2])
                rotate([90, 0, 0])
                chamfered_cube_side(15, 21, 10, 3, center=true);

                intersection() {
                    translate([83.4, 0, 23])
                    rotate([0, -75, 0])
                    rounded_cube_side(
                        14, 10, 2, 4, center=true, $fn=30
                    );

                    chamfered_cube(178.4, 20, 59, 4, center=true);
                }
            }

            translate([73, 0, 13/2 + 4])
            chamfered_cube(15, 21, 13, 2, center=true);

            cube([146, 20, 40], center=true);

            translate([0, 0, 30])
            cube([158, 20, 40], center=true);

            translate([0, 0, 24.55])
            cube([162.88, 20, 10], center=true);

            translate([0, 0, 28])
            chamfered_cube(163, 20, 20, 3, center=true);

            // forced infill
            translate([81.75, 2, 14])
            cube([0.1, 2, 20], center=true);

            translate([81.75, -2, 14])
            cube([0.1, 2, 20], center=true);

        }

    }

    union() {
        intersection() {
            orig_hopper_2_5kg_cap();

            union() {
                cube([160, 160, 10], center=true);
                cylinder(d=100, h=40);
            }
        }

        difference() {
            union() {
                translate([0, 0, 5/2])
                cube([3, 150, 5], center=true);

                translate([0, 0, 5/2])
                cube([150, 3, 5], center=true);
            }

            translate([0, 0, -50])
            chamfered_cylinder(70, 60, 15, $fn=40);
        }
            
        _clip();

        mirror([1, 0, 0])
        _clip();
    }
}

module hopper_hose_adapter() {
    difference() {
        union() {
            chamfered_cylinder(26, 34, 1.5, $fn=70);

            hull() {
                translate([0, 0, 11])
                chamfered_cylinder(29, 10, 1.5, $fn=70);

                translate([0, 0, 34 - 10])
                chamfered_cylinder(31, 10, 1.8, $fn=70);

            }
        }

        translate([0, 0, 5])
        rotate([0, 90, 0])
        cylinder(d=4.1, h=60, center=true, $fn=40);

        cylinder(d=21.5, h=27, center=true, $fn=70);

        translate([0, 0, 13])
        _hose_thread_cut(21);
    }
}

module hopper_stand_pole_portion(h=200) {
    twist = h/100 * 360;
    difference() {
        cylinder(d=60, h=h, $fn=60);

        cylinder(d=19.5, h=h*3, center=true, $fn=60);

        chamfered_cylinder(23.5, 29, 2, center=true, $fn=60);

        translate([0, 0, h])
        chamfered_cylinder(23.5, 29, 2, center=true, $fn=60);

        rotate([90, 0, 0])
        chamfered_cube_side(26.5, 29, 2, 3.5, center=true);

        rotate([90, 0, 90])
        chamfered_cube_side(26.5, 29, 2, 3.5, center=true);

        translate([0, 0, h])
        rotate([90, 0, 0])
        chamfered_cube_side(26.5, 29, 2, 3.5, center=true);

        translate([0, 0, h])
        rotate([90, 0, 90])
        chamfered_cube_side(26.5, 29, 2, 3.5, center=true);

        difference() {
            cylinder(d=56, h=h*3, center=true, $fn=60);
            cylinder(d=23, h=h*3, center=true, $fn=60);

            chamfered_cylinder(27, 34, 4, center=true, $fn=60);

            translate([0, 0, h])
            chamfered_cylinder(27, 34, 4, center=true, $fn=60);

            rotate([90, 0, 0])
            chamfered_cube_side(30, 34, 5, 5.5, center=true);

            rotate([90, 0, 90])
            chamfered_cube_side(30, 34, 5, 5.5, center=true);

            translate([0, 0, h])
            rotate([90, 0, 0])
            chamfered_cube_side(30, 34, 5, 5.5, center=true);

            translate([0, 0, h])
            rotate([90, 0, 90])
            chamfered_cube_side(30, 34, 5, 5.5, center=true);

            linear_extrude(h, twist=twist)
            square([1.2, 60], center=true);

            linear_extrude(h, twist=twist)
            square([60, 1.2], center=true);

            linear_extrude(h, twist=-twist)
            square([1.2, 60], center=true);

            linear_extrude(h, twist=-twist)
            square([60, 1.2], center=true);
        }
    }
}

module hopper_stand_pole_screw_end(h=200) {
    union() {
        intersection() {
            hopper_stand_pole_portion(h=h);

            translate([0, 0, 33])
            chamfered_cylinder(60, h, 4, $fn=60);
        }

        difference() {
            union() {
                translate([0, 0, 33])
                chamfered_cylinder(60, 8.1, 4, $fn=60);

                chamfered_cylinder(56, 42, 2, $fn=60);

                intersection() {
                    v_screw(
                        h=39,
                        screw_d=64,
                        pitch=6,
                        direction=0,
                        steps=80,
                        depth=3
                    );

                    chamfered_cylinder(
                        60, 42, 4, $fn=60
                    );
                }
            }

            translate([0, 0, 35])
            chamfered_cylinder(56, 8.1, 2.9, $fn=60);

            translate([0, 0, 15])
            tube(19.5, 30, 1.5, $fn=60);

            translate([0, 0, 18])
            cylinder(d=19.5, h=30, $fn=60);

            cylinder(d=26, h=20, center=true, $fn=60);

            intersection() {
                cylinder(d=26, h=21.2, center=true, $fn=60);
                cube([8.5, 26, 20.6], center=true);
            }

            intersection() {
                cylinder(d=26, h=21.2, center=true, $fn=60);
                cube([8.5, 8.5, 21.2], center=true);
            }

            cylinder(d=8.5, h=100, center=true, $fn=40);
        }
    }
}

module hopper_stand_pole_end(h=200) {
    union() {
        intersection() {
            hopper_stand_pole_portion(h=h);

            chamfered_cylinder(60, h + 100, 4, $fn=60);
        }

        difference() {
            union() {
                chamfered_cylinder(60, 15, 4, $fn=60);

                translate([0, 0, 10])
                cylinder(d=60, h=10, $fn=60);
            }

            translate([0, 0, 32])
            chamfered_cylinder(56, 8.1, 2.9, $fn=60);

            translate([0, 0, 15])
            tube(19.5, 30, 1.5, $fn=60);

            translate([0, 0, 18])
            cylinder(d=19.5, h=30, $fn=60);

            cylinder(d=26, h=20, center=true, $fn=60);

            intersection() {
                cylinder(d=26, h=21.2, center=true, $fn=60);
                cube([8.5, 26, 20.6], center=true);
            }

            intersection() {
                cylinder(d=26, h=21.2, center=true, $fn=60);
                cube([8.5, 8.5, 21.2], center=true);
            }

            cylinder(d=8.5, h=100, center=true, $fn=40);
        }
    }
}

module hopper_stand_pole_end_nutcap() {
    difference() {
        union() {
            cylinder(d=23.1, h=8, $fn=60);

            translate([0, 0, 8/2])
            cube([25.5, 1.5, 8], center=true);

            translate([0, 0, 8/2])
            cube([1.5, 25.5, 8], center=true);
        }

        cylinder(d=8.3, h=30, center=true, $fn=30);

        translate([0, 0, 1.4])
        M8_nut(9);
    }
}

module hopper_stand_pole_portion_joint() {
    difference() {
        intersection() {
            union() {
                chamfered_cylinder(23.1, 29, 2, center=true, $fn=60);

                rotate([90, 0, 0])
                chamfered_cube_side(26.1, 29, 1.6, 3.4, center=true);

                rotate([90, 0, 90])
                chamfered_cube_side(26.1, 29, 1.6, 3.4, center=true);
            }
            cylinder(d=40, h=27, center=true);
        }

        cylinder(d=19.5, h=200, center=true, $fn=60);
    }
}

module _mount_screw_hole() {
    rotate([180, 0, 0])
    union() {
        cylinder(d=5, h=25, $fn=30);
        cylinder(d=10.1, h=4, center=true, $fn=30);

        translate([0, 0, 1.99])
        cylinder(d1=10.1, d2=5, h=3.6, $fn=30);
    }
    
}

module hopper_base_mount() {
    difference() {
        union() {
            hull() {
                translate([-65, 0, 0]) {
                    cylinder(d=37, h=7, $fn=60);
                    cylinder(d=19, h=17, $fn=60);
                }

                translate([65, 0, 0]) {
                    cylinder(d=37, h=7, $fn=60);
                    cylinder(d=19, h=17, $fn=60);
                }

                translate([0, 85, 0]) {
                    cylinder(d=37, h=7, $fn=60);
                    cylinder(d=19, h=17, $fn=60);
                }
            }

            translate([0, 27, -20])
            chamfered_cylinder(79, 27, 0.5, $fn=100);

            // ridges
            translate([0, 27, -19])
            for(i = [0:19]) {
                rotate([0, 0, 360/20 * i])
                translate([78/2 - 0.3, 0, 0])
                hull() {
                    translate([0, 0, 3])
                    cylinder(
                        d=2.5, h=17, $fn=20
                    );

                    cylinder(
                        d=1.1, h=20, $fn=20
                    );
                };
            }
        }

        translate([0, 27, -20.2])
        intersection() {
            union() {
                v_screw(
                    h=60,
                    screw_d=65,
                    pitch=6,
                    direction=0,
                    steps=80,
                    depth=3
                );

                cylinder(d=57, h=60, $fn=60);
            }

            chamfered_cylinder(61, 64, 4, $fn=60);
        }

        translate([0, 27, 17 - 4])
        chamfered_cylinder(61, 60, 4, $fn=60);

        translate([-65, 0, 17])
        _mount_screw_hole();

        translate([65, 0, 17])
        _mount_screw_hole();

        translate([0, 85, 17])
        _mount_screw_hole();
    }
}

module hopper_stand_pole_portion_joint_qnd() {
    difference() {
        union() {
            hopper_stand_pole_portion_joint();

            translate([0, 0, -29/4])
            chamfered_cylinder(31.1, 29/2, 2, center=true, $fn=60);

            translate([0, 0, -29/4])
            rotate([90, 0, 0])
            chamfered_cube_side(34.1, 29/2, 1.6, 3.4, center=true);

            translate([0, 0, -29/4])
            rotate([90, 0, 90])
            chamfered_cube_side(34.1, 29/2, 1.6, 3.4, center=true);
        }
        cylinder(d=19.5, h=200, center=true, $fn=60);
    }
}

module hopper_stand_pole_portion_qnd() {
    difference() {
        intersection() {
            union() {
                cylinder(d=22.3, h=200, $fn=60);

                translate([0, 0, 200/2])
                cube([27, 1.5, 200], center=true);

                rotate([0, 0, 90])
                translate([0, 0, 200/2])
                cube([27, 1.5, 200], center=true);

                rotate([0, 0, 135])
                translate([0, 0, 200/2])
                cube([27, 1.5, 200], center=true);

                rotate([0, 0, 45])
                translate([0, 0, 200/2])
                cube([27, 1.5, 200], center=true);

            }
            cylinder(d=27, h=600, center=true, $fn=60);
        }

        cylinder(d=19.5, h=600, center=true, $fn=60);
    }
}

module rod_spacer_1() {
    difference() {
        cylinder(d=16.7, h=15, $fn=40);
        cylinder(d=13, h=30, center=true, $fn=6);
    }

    %cube([3, 11.2, 40], center=true);
}

module rod_spacer_2() {
    difference() {
        cylinder(d=16.7, h=7, $fn=40);

        v_screw(
            h=60,
            screw_d=8.3,
            pitch=1.25,
            direction=0,
            steps=50,
            depth=0.2
        );

        translate([0, 0, 6])
        chamfered_cylinder(9, 10, 1, $fn=40);

        translate([0, 0, -9])
        chamfered_cylinder(9, 10, 1, $fn=40);
    }

    %cylinder(d=8, h=40, center=true);
}

module hopper_stand_side_arm_base() {
    difference() {
        union() {
            chamfered_cylinder(76, 100, 4, $fn=60);

            intersection() {
                translate([0, 20, 50/2 - 5])
                rotate([-90, 0, 0])
                cylinder(d=50, h=80, $fn=60);

                cylinder(d=300, h=100);
            }

            translate([0, 48, 55])
            rotate([-40, 0, 0])
            chamfered_cube(20, 90, 40, 3, center=true);

            hull() {
                translate([0, -76/2, 100/2])
                rotate([0, 90, 0])
                cylinder(d=34, h=22, center=true, $fn=60);

                translate([0, -76/2 + 6, 100/2])
                cube([22, 1, 100], center=true);
            }
        }

        cylinder(d=60.5, h=300, center=true, $fn=60);

        hull() {
            cube([0.1, 0.1, 300], center=true);

            translate([0, -76/2 - 30, 0])
            cube([5, 1, 300], center=true);

        }

        translate([0, -76/2 - 7, 100/2])
        rotate([0, 90, 0])
        cylinder(d=6.5, h=200, center=true, $fn=40);

        translate([11, -76/2 - 7, 100/2])
        rotate([0, 90, 0])
        cylinder(d=20.3, h=100, $fn=40);

        translate([-6, -76/2 - 7, 100/2])
        rotate([0, -90, 0])
        M6_nut(6);

        translate([0, 20, 50/2 - 5])
        rotate([-90, 0, 0])
        hull() {
            cylinder(d=10.3, h=200, $fn=40);

            translate([0, -6.3, 0])
            cylinder(d=0.1, h=200, $fn=6);
        }

        translate([0, 28, 50/2 - 5])
        rotate([-90, 30, 0])
        M10_nut_tapering(h=12, cone=false);

        translate([0, 100, 50/2 - 5])
        rotate([90, 0, 0])
        hull() {
            cylinder(d=10.5, h=30, center=true, $fn=60);

            rotate([0, 0, 45])
            cube([18.5, 18.5, 14], center=true);
        }
    }

    %translate([11, -76/2 - 7, 100/2])
    rotate([0, 90, 0])
    clamp_nut_M6();
}

module hopper_stand_side_arm_portion(h=200) {
    twist = h/100 * 360;
    difference() {
        intersection() {
            cylinder(d=50, h=h, $fn=60);

            translate([0, 5, h/2])
            cube([50, 50, h], center=true);
        }

        cylinder(d=10.5, h=h*3, center=true, $fn=60);

        hull() {
            cylinder(d=10.5, h=30, center=true, $fn=60);

            rotate([0, 0, 45])
            cube([18.5, 18.5, 14], center=true);
        }

        translate([0, 0, h])
        hull() {
            cylinder(d=10.5, h=30, center=true, $fn=60);

            rotate([0, 0, 45])
            cube([18.5, 18.5, 14], center=true);
        }

        difference() {
            intersection() {
                cylinder(d=46.2, h=h*3, center=true, $fn=60);

                translate([0, 5, h*3/2])
                cube([46, 46, h*3], center=true);
            }

            cylinder(d=14, h=h*3, center=true, $fn=60);

            hull() {
                cylinder(d=14, h=31, center=true, $fn=60);

                rotate([0, 0, 45])
                cube([21, 21, 15], center=true);
            }

            translate([0, 0, h])
            hull() {
                cylinder(d=14, h=31, center=true, $fn=60);

                rotate([0, 0, 45])
                cube([21, 21, 15], center=true);
            }

            linear_extrude(h, twist=twist)
            square([1.2, 60], center=true);

            linear_extrude(h, twist=twist)
            square([60, 1.2], center=true);

            linear_extrude(h, twist=-twist)
            square([1.2, 60], center=true);

            linear_extrude(h, twist=-twist)
            square([60, 1.2], center=true);
        }
    }
}

module hopper_stand_side_arm_end(h=200) {
    difference() {
        intersection() {
            union() {
                hopper_stand_side_arm_portion(h=h);
                chamfered_cylinder(50, 15, 4, $fn=60);

                translate([0, 0, 10])
                cylinder(d=50, h=5, $fn=60);
            }

            translate([0, 5, h/2])
            cube([50, 50, h], center=true);

            chamfered_cylinder(50, h + 100, 4, $fn=60);            
        }

        cylinder(d=26, h=22, center=true, $fn=60);

        intersection() {
            cylinder(d=26, h=23.2, center=true, $fn=60);
            cube([10.5, 26, 22.6], center=true);
        }

        intersection() {
            cylinder(d=26, h=23.2, center=true, $fn=60);
            cube([10.5, 10.5, 23.2], center=true);
        }

        cylinder(d=10.5, h=100, center=true, $fn=60);
    }
}

module hopper_stand_side_arm_portion_joint() {
    difference() {
        intersection() {
            hull() {
                cylinder(d=10.1, h=30, center=true, $fn=60);

                rotate([0, 0, 45])
                cube([18.1, 18.1, 14], center=true);
            }

            cylinder(d=40, h=24, center=true);
        }

        cylinder(d=10.5, h=200, center=true, $fn=60);
    }
}

module hopper_stand_arm_hopper_attachment() {

    difference() {
        union() {
            intersection() {
                chamfered_cylinder(65, 100, 3.5, $fn=60);

                translate([0, -5, 0])
                cube([65, 65, 300], center=true);
            }

            hull() {
                translate([0, -65/2, 100/2])
                rotate([0, 90, 0])
                cylinder(d=34, h=22, center=true, $fn=60);

                translate([0, -65/2 + 7, 100/2])
                cube([22, 1, 100], center=true);
            }

            translate([0, -123, 100/2])
            rotate([0, 90, 90])
            intersection() {
                orig_hopper_2_5kg_base();

                translate([0, 0, 159])
                cube([100, 40, 20], center=true);
            }
        }

        difference() {
            cylinder(d=50.5, h=300, center=true, $fn=60);

            translate([0, 50.5/2, 0])
            cube([50, 10, 300], center=true);
        }

        hull() {
            cube([0.1, 0.1, 300], center=true);

            translate([0, -66/2 - 30, 0])
            cube([5, 1, 300], center=true);
        }

        translate([0, -65/2 - 7, 100/2])
        rotate([0, 90, 0])
        cylinder(d=6.5, h=200, center=true, $fn=40);

        translate([11, -65/2 - 7, 100/2])
        rotate([0, 90, 0])
        cylinder(d=20.3, h=100, $fn=40);

        translate([-6, -65/2 - 7, 100/2])
        rotate([0, -90, 0])
        M6_nut(6);

        // zip tie holes
        translate([0, 47, 22])
        difference() {
            rounded_cube_side(28, 50, 6, 18, center=true, $fn=30);
            rounded_cube_side(24, 46, 10, 14, center=true, $fn=30);
        }

        translate([0, 47, 100 - 22])
        difference() {
            rounded_cube_side(28, 50, 6, 18, center=true, $fn=30);
            rounded_cube_side(24, 46, 10, 14, center=true, $fn=30);
        }
        
    }

    %translate([11, -65/2 - 7, 100/2])
    rotate([0, 90, 0])
    clamp_nut_M6();
}

module clamp_nut_M6() {
    difference() {
        chamfered_cylinder(20, 30, 1.8, $fn=60);

        for(i = [0:16]) {
            rotate([0, 0, i*360/17])
            translate([0, 20/2, 0])
            cylinder(d=2, h=200, center=true, $fn=20);
        }

        cylinder(d=6.2, h=100, center=true, $fn=30);

        translate([0, 0, 11])
        cylinder(d=12, h=100, $fn=40);

        translate([0, 0, 5])
        M6_nut(6);
    }
}