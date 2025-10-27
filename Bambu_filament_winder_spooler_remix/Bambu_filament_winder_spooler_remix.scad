use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/snappy-reprap/publicDomainGearV1.1.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Bambu_filament_winder_spooler/"
);

spath2 = str(
    stl_base_path, "Bambu_filament_winder_spooler/remix/"
);

//%_orig_spooler_centering_disk_55mm();
//_orig_5mm_stretch_winder_right_hand_spool_axle_with_gear_25_teeth();
//_orig_Donor_Spool_Holder_Axle_without_Gear();
//_orig_Donor_Spool_Holder_Frame();
//_orig_Winder_and_Donor_Right_Hand_Spool_Axle_Nut();
//_orig_filament_guide();



//debug_axle();
//debug_axle_donor();
//debug_donor_spool_holder_frame_leg();


//spooler_centering_disk_50mm();
//spooler_centering_disk_51mm();
//spooler_centering_disk_52mm();
//spooler_centering_disk_53mm();
//spooler_centering_disk_54mm();
//spooler_centering_disk_55mm();
spooler_centering_disk_universal();

//new_winder_right_hand_spool_axle_with_gear_25_teeth_5mm_stretch();
//new_donor_spool_holder_axle_without_gear();
//new_winder_and_donor_right_hand_spool_axle_nut();
//new_winder_axle_6mm_spacer();
//new_filament_guide();
//donor_spool_holder_frame_leg();


module _orig_spooler_centering_disk_55mm() {
    translate([-0.03, 82.68, 1])
    import(
        str(
            spath,
            "Spooler Centering Disc for Bambu Lab Spools 55 mm.stl"
        ),
        convexity=10
    );

//    #cylinder(d=32, h=1, $fn=50);
//    #cylinder(d=55, h=9.4, $fn=30);
//    #cylinder(d1=55 + 2*3.5, d2=55, h=3.5, $fn=30);
//    #cylinder(d=88, h=2, $fn=40);

//      #translate([0, 0, 2])
//      chamfered_cylinder(
//          55 - 4, 20, 3, $fn=30
//      );
}


module _orig_Winder_and_Donor_Right_Hand_Spool_Axle_Nut() {
    translate([0, -76.5, -28.15])
    import(
        str(
            spath,
            "Winder and Donor Right Hand Spool Axle Nut.stl"
        ),
        convexity=10
    );

//    %cylinder(d=16.2, h=150, $fn=70);
//    %cylinder(d=29.55, h=40, $fn=70);
//    %cylinder(d=33, h=10, $fn=70);
}

module _orig_5mm_stretch_winder_right_hand_spool_axle_with_gear_25_teeth() {
    translate([-130, -130, 5])
    import(
        str(
            spath2,
            "5mm-stretch-winder-right-hand-spool-axle-with-gear-25-teeth.stl"
        ),
        convexity=10
    );

//    %cylinder(d=16.2, h=150, $fn=70);
//    %cylinder(d=29.6, h=40, $fn=70);
//    %cylinder(d=33, h=10, $fn=70);
}

module _orig_Donor_Spool_Holder_Axle_without_Gear() {
    translate([-130, -130, 0])
    import(
        str(
            spath,
            "Donor Spool Holder Axle without Gear.stl"
        ),
        convexity=10
    );

//    %cylinder(d=16.2, h=150, $fn=70);
//    %cylinder(d=29.6, h=40, $fn=70);
//    %cylinder(d=33, h=10, $fn=70);
}

module _orig_Donor_Spool_Holder_Frame() {
    import(
        str(
            spath,
            "Donor Spool Holder Frame.stl"
        ),
        convexity=10
    );
}

module _orig_filament_guide() {
    translate([-40, -15.775, -46.875])
    import(
        str(
            spath2,
            "filament_guide.stl"
        ),
        convexity=10
    );
}

module debug_axle() {
    render()
    translate([0, 0, -71.2])
    new_winder_right_hand_spool_axle_with_gear_25_teeth_5mm_stretch();

//    color("black")
//    intersection() {
//        _orig_Winder_and_Donor_Right_Hand_Spool_Axle_Nut();
//
//        translate([0, 100/2 - 0.1, 0])
//        cube([100, 100, 300], center=true);
//    }

    intersection() {
        translate([0, 0, 83.5])
        rotate([180, 0, 0])
        new_winder_and_donor_right_hand_spool_axle_nut();

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        translate([0, 0, -40 + 2.4])
        spooler_centering_disk_universal();

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        translate([0, 0, 27])
        rotate([180, 0, 0])
        spooler_centering_disk_universal();

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }
}

module debug_axle_donor() {
    render()
    translate([0, 0, 0])
    new_donor_spool_holder_axle_without_gear();

//    color("black")
//    intersection() {
//        _orig_Winder_and_Donor_Right_Hand_Spool_Axle_Nut();
//
//        translate([0, 100/2 - 0.1, 0])
//        cube([100, 100, 300], center=true);
//    }

    intersection() {
        translate([0, 0, 143.5])
        rotate([180, 0, 0])
        new_winder_and_donor_right_hand_spool_axle_nut();

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        translate([0, 0, 26.5])
        spooler_centering_disk_universal();
        //spooler_centering_disk_50mm();

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        translate([0, 0, 87])
        rotate([180, 0, 0])
        spooler_centering_disk_universal();

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }
}

module debug_donor_spool_holder_frame_leg() {
    intersection() {
        _orig_Donor_Spool_Holder_Frame();

        translate([-23, 0, 0])
        cube([200, 200, 500], center=true);
    }

    color("grey")
    translate([77, 15, -6])
    donor_spool_holder_frame_leg();
}

module _spooler_centering_disk(d=54) {
    difference() {
        union() {
            cylinder(d=d, h=9.4, $fn=30);
            cylinder(d1=d + 2*3.5, d2=d, h=3.5, $fn=30);
            cylinder(d=88, h=2, $fn=40);
        }

        translate([0, 0, 2])
        chamfered_cylinder(
          d - 3.7, 20, 1.5, $fn=30
        );

        cylinder(d=32.2, h=10, center=true, $fn=40);
    }
}

module spooler_centering_disk_54mm() {
    difference() {
        _spooler_centering_disk(d=54);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="54", size=14);
    }
}

module spooler_centering_disk_55mm() {
    difference() {
        _spooler_centering_disk(d=55);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="55", size=14);
    }
}

module spooler_centering_disk_50mm() {
    difference() {
        _spooler_centering_disk(d=50);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="50", size=14);
    }
}

module spooler_centering_disk_51mm() {
    difference() {
        _spooler_centering_disk(d=51);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="51", size=14);
    }
}

module spooler_centering_disk_52mm() {
    difference() {
        _spooler_centering_disk(d=52);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="52", size=14);
    }
}

module spooler_centering_disk_53mm() {
    difference() {
        _spooler_centering_disk(d=53);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="53", size=14);
    }
}

module spooler_centering_disk_universal() {
    h = 20;

    module _wing() {
        d = 40;
        wall = 1.5;

        union() {
            // lower wing
            difference() {
                union() {
                    intersection() {
                        union() {
                            cylinder(d=d, h=h, $fn=80);

                            translate([0, d/2 - wall, 0])
                            cylinder(d=2*wall, h=h, $fn=20);
                        }

                        translate([-wall, 8.5, 0])
                        hull() {
                            rounded_cube_side(
                                d/2 + wall*2 - 0.6, d/2 - 8.5,
                                h, 2*wall, $fn=80
                            );

                            translate([-0.8, d/2 - 12, 0])
                            cube([1, 1, h]);
                        }
                    }
                    translate([d/2 - 2.15, 8.9, 0])
                    intersection() {
                        cylinder(d=2*wall, h=h, $fn=40);

                        translate([0, -wall/2, h/2])
                        cube([2*wall, wall, h], center=true);
                    }
                }

                difference() {
                    cylinder(d=d - 2*wall, h=3*h, center=true, $fn=80);

                    translate([-wall, d/2 - 3/2, 0])
                    cube([2*wall, 3, 3*h], center=true);
                }
            }

            // upper wing
            difference() {
                union() {
                    intersection() {
                        translate([-6.3/2 + wall, 9, 0])
                        cylinder(d=d + 2, h=h, $fn=80);

                        translate([1.3, 8.9, 0])
                        cube([d/2 + wall*2 - 0.6, d/2 + 6, h]);

                        rotate([0, 0, -7])
                        cube([d, d, h]);
                    }

                    rotate([0, 0, -7])
                    translate([0, (d + 2 - 2*wall)/2 + 9 + 3/3, 0])
                    union() {
                        intersection() {
                            cylinder(d=3, h=h, $fn=30);

                            translate([-1.5/2, 10/2 - 1.5, h/2])
                            cube([1.5, 10, h], center=true);
                        }

                        hull() {
                            rotate([0, 0, -4])
                            translate([-1.5/2, 1/2, h/2])
                            cube([1.5, 1, h], center=true);

                            rotate([0, 0, -4])
                            translate([-1.5/2, 5 - wall/2, 0])
                            cylinder(d=1.5, h=h, $fn=20);
                        }
                    }

                }
                translate([-6.3/2 + wall, 9, 0])
                cylinder(
                    d=d + 2 - 2*wall, h=3*h, center=true, $fn=80
                );
            }
        }
    }

    module _wings() {
        for(i = [0 : 3]) {
            rotate([0, 0, 360/4*i])
            translate([1.5/2, -5.5, 0])
            _wing();
        }
    }

    difference() {
        union() {
            cylinder(d=88, h=2, $fn=80);
            cylinder(d=25.2, h=22.2, $fn=80);

            intersection() {
                translate([0, 0, 2.4])
                _wings();

                scale([1, 1, 1.5])
                chamfered_cylinder(
                    59, 29.6, 5, center=true, $fn=80
                );
            }

            translate([0, 0, 2.2])
            linear_extrude(0.2)
            offset(r=-0.25)
            projection(cut=false)
            _wings();
        }
        
        cylinder(d=21.4, h=50, center=true, $fn=60);

        translate([0, 0, -10])
        chamfered_cylinder(
            22.8, 11, 1, $fn=60
        );
    }
}

// not used
module 5mm_stretch_axle_with_gear_25_teeth_tk_removal() {
    tube(50, 1, 1);

    difference() {
        _orig_5mm_stretch_winder_right_hand_spool_axle_with_gear_25_teeth();

        translate([0, 0, 10.2])
        //cylinder(d=29.55, h=26, $fn=150);
        tube(50, 50, (50 - 29.45)/2, $fn=120);

        translate([0, 0, 35])
        //cylinder(d=16.33, h=160, $fn=80);
        tube(40, 120, (40 - 16.3)/2, $fn=80);
    }
}

module _axle_base() {
    h = 25;

    union() {
        hull() {
            translate([0, 0, h + 6.54])
            cylinder(d=39.3, h=2, $fn=6);

            translate([0, 0, h])
            cylinder(d=29.55, h=1, $fn=70);
        }

        translate([0, 0, h + 6])
        chamfered_cylinder(21, 5, 1, $fn=60);
    }
}

module _axle_screw() {
//    %intersection() {
//            _orig_5mm_stretch_winder_right_hand_spool_axle_with_gear_25_teeth();
//
//        translate([0, 0, 35])
//        cylinder(d=16.33, h=160, $fn=80);
//    }

    union() {
        chamfered_cylinder(16.33, 69, 2, $fn=70);

        translate([0, 0, 66.9])
        intersection() {
            rotate([0, 0, 152])
            v_screw(
                h=81.7,
                screw_d=17.8,
                pitch=3.9,
                direction=1,
                steps=60,
                depth=1.1,
                chamfer=true
            );

            chamfered_cylinder(16.4, 155, 2, $fn=70);
        }

        chamfered_cylinder(13.65, 152, 3, $fn=70);
    }
}

module new_winder_right_hand_spool_axle_with_gear_25_teeth_5mm_stretch() {

    //%_orig_5mm_stretch_winder_right_hand_spool_axle_with_gear_25_teeth();
    //%cylinder(d=34, h=10, $fn=70);
    
    module _axle_gear_25_teeth() {
//        %translate([0, -0.225, 0])
//        intersection() {
//            _orig_5mm_stretch_winder_right_hand_spool_axle_with_gear_25_teeth();
//            cylinder(d=40, h=10);
//        }
        // gear
        s_twist = 15.55;
        twist_constant = 10/2/s_twist;
        
        num_teeth = 25;

        mm_per_tooth = 3.86;
        pressure_angle = 9;

        rotate([0, 0, -3.78])
        union() {
            // body
            translate([0, 0, 10])
            hull() {
                translate([0, 0, 1/2])
                cylinder(d=29.55, h=20, $fn=80);

                cylinder(d=28.55, h=21, $fn=80);
            }

            // upper gear half
            translate([0, 0, 5 + 5/2])
            gear (
                mm_per_tooth    = mm_per_tooth,
                number_of_teeth = num_teeth,
                thickness       = 5,
                hole_diameter   = 1,
                twist           = -s_twist,
                teeth_to_hide   = 0,
                pressure_angle  = pressure_angle,
                backlash        = 0,
                clearance       = -0.3
            );

            // lower gear half
            translate([0, 0, 5/2])
            mirror([0, 0, 1])
            gear (
                mm_per_tooth    = mm_per_tooth,
                number_of_teeth = num_teeth,
                thickness       = 5,
                hole_diameter   = 1,
                twist           = -s_twist,
                teeth_to_hide   = 0,
                pressure_angle  = pressure_angle,
                backlash        = 0,
                clearance       = -0.3
            );
        }
    }

    difference() {
        union() {
            _axle_gear_25_teeth();
            _axle_screw();
            _axle_base();
        }
        cylinder(d=1, h=500, center=true, $fn=30);
    }
}

module new_donor_spool_holder_axle_without_gear() {
    //%_orig_Donor_Spool_Holder_Axle_without_Gear();

    difference() {
        union() {
            // body
            hull() {
                cylinder(d=31.04, h=2.5, $fn=80);
                cylinder(d=28.55, h=4.21, $fn=80);
            }
            cylinder(d=29.55, h=20, $fn=80);

            translate([0, 0, -7])
            _axle_base();

            intersection() {
                translate([0, 0, -13])
                _axle_screw();

                cylinder(d=50, h=150, $fn=4);
            }
        }
        cylinder(d=1, h=500, center=true, $fn=30);
    }
}

module new_winder_and_donor_right_hand_spool_axle_nut() {
    //%_orig_Winder_and_Donor_Right_Hand_Spool_Axle_Nut();

    difference() {
        union() {
            hull() {
                cylinder(d=31, h=4, $fn=80);
                cylinder(d=29.55, h=5, $fn=80);
            }
            cylinder(d=29.55, h=50, $fn=80);

            translate([0, 0, 22.9])
            _axle_base();
        }

        translate([0, 0, 62.4])
        cylinder(d=50, h=20);

        union() {
            translate([0, 0, -10])
            intersection() {
                rotate([0, 0, 70])
                v_screw(
                    h=91.7,
                    screw_d=18.8,
                    pitch=3.9,
                    direction=1,
                    steps=60,
                    depth=1.1,
                    chamfer=false
                );

                chamfered_cylinder(17.4, 155, 2, $fn=70);
            }

            chamfered_cylinder(14.65, 152, 3, $fn=70);
        }

        chamfered_cylinder(17, 20, 4, center=true, $fn=70);

        translate([0, 0, 60])
        chamfered_cylinder(21, 10, 4, $fn=70);
    }
}

module new_filament_guide() {
    difference() {
        _orig_filament_guide();

        hull() {
            translate([-5, 28, 0])
            cylinder(d=4.2, h=20, center=true, $fn=30);

            translate([9, 28, 0])
            cylinder(d=4.2, h=20, center=true, $fn=30);
        }

        hull() {
            translate([-5, -28, 0])
            cylinder(d=4.2, h=20, center=true, $fn=30);

            translate([9, -28, 0])
            cylinder(d=4.2, h=20, center=true, $fn=30);

        }
    }
}

module donor_spool_holder_frame_leg() {
    difference() {
        union() {
            translate([0, 0, 6/2])
            rounded_cube_side(
                30, 151, 6, 6, center=true, $fn=40
            );

            translate([0, -59.5, 0])
            hull() {
                cylinder(d=10.5, h=9, $fn=30);
                cylinder(d=6, h=10.6, $fn=30);
            }

            translate([0, 29.5, 0])
            hull() {
                cylinder(d=10.5, h=9, $fn=30);
                cylinder(d=6, h=10.6, $fn=30);
            }
        }

        translate([0, -59.5, 0])
        cylinder(d=4.3, h=30, center=true, $fn=30);

        translate([0, -59.5, -1])
        M4_nut(5);

        translate([0, 29.5, 0])
        cylinder(d=4.3, h=30, center=true, $fn=30);

        translate([0, 29.5, -1])
        M4_nut(5);

        translate([0, -15, 0])
        difference() {
            rounded_cube_side(
                17, 70, 20, 5, center=true, $fn=30
            );

            translate([0, -30, 0])
            rotate([0, 0, 30])
            cube([5, 100, 20], center=true);

            translate([0, -10, 0])
            rotate([0, 0, 30])
            cube([5, 100, 20], center=true);

            translate([0, 10, 0])
            rotate([0, 0, 30])
            cube([5, 100, 20], center=true);

            translate([0, 30, 0])
            rotate([0, 0, 30])
            cube([5, 100, 20], center=true);
        }

        translate([-8.5, 48, -10/2 + 4])
        chamfered_cube(
            5, 50, 10, 2.3, center=true
        );

        translate([0, 54, -10/2 + 4])
        chamfered_cube(
            5, 39, 10, 2.3, center=true
        );

        translate([8.5, 48, -10/2 + 4])
        chamfered_cube(
            5, 50, 10, 2.3, center=true
        );

    }
}