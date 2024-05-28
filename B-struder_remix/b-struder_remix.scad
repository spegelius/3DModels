include <../Dollo/New_long_ties/include.scad>;
include <../lib/includes.scad>;
include <../lib/bearings.scad>;
include <../lib/fittings.scad>;


////// VARIABLES //////
$fn=60;

stl_base_path = "../_downloaded/";
bstruder_path = str(
    stl_base_path, "B-struder_Bowden_extruder/"
);

////// VIEW //////
//translate([50, 0, 0])
//orig_arm();
//orig_motor_mount();
//orig_lock_lever();
//orig_MR105ZZ_support();
//orig_spring_cap();

//debug_orig_arm();

//debug_arm_E3D_HobGoblin_U604zz();

//debug_arm_E3D_HobGoblin_2x623zz();

//debug_arm_Bondtech();
//debug_bondtech_gear();
//debug_bondtech_arm_supports();

//arm_E3D_HobGoblin_U604zz();
//arm_E3D_HobGoblin_U604zz(supports=true);
//arm_E3D_HobGoblin_U604zz(
//    threads=false, m4=true, supports=true
//);
//arm_E3D_HobGoblin_U604zz(threads=false);

//arm_E3D_HobGoblin_2x623zz();

//arm_Bondtech();
//arm_Bondtech(supports=true);
//arm_Bondtech(threads=false);
//arm_Bondtech(threads=false, m4=true);
//arm_Bondtech(threads=false, m4=true, supports=true);
//support_soluble_bondtech();
//support_nonsoluble_bondtech();

//hinge_support();

//motor_mount();
//motor_mount_extra_mount();
//motor_mount_extra_mount2();
//motor_mount_extra_mount3();

//lock_lever();

//MR105zz_support_Hobbgoblin();
MR105zz_support_Bondtech();

//spring_cap_8mm_spring();

//bondtech_position_tool();


////// MODULES //////
module orig_arm() {
    translate([0, 0, -55])
    import(str(
        bstruder_path,
        "2017-04-12_B-struder_arm_40Tgear+U604_M6ends.stl"
    ), convexity=10);
}

module orig_motor_mount() {
    translate([0, 0, -55])
    import(str(
        bstruder_path,
        "2017-04-12_B-studer_Motor_mount.stl"
    ), convexity=10);
}

module orig_lock_lever() {
    translate([15.5, 15.5, -53])
    import(str(
        bstruder_path,
        "2017-04-12_B-struder_lock_lever.stl"
    ));
}

module orig_MR105ZZ_support() {
    translate([0,0,-71])
    import(str(
        bstruder_path,
        "2017-05-06_B-Struder-B-struder_MR105ZZ_support.stl"
    ), convexity=10);
}

module orig_spring_cap() {
    translate([-32,9,-60.5])
    import(str(
        bstruder_path,
        "2017-04-12_B-struder_spring_cap.stl"
    ));
}

module arm_body(height=15) {
    difference() {
        union() {
            hull() {
                translate([-4, -18, 0])
                cube([22, 1, height]);

                translate([15.5, 15.5, 0])
                cylinder(d=18, h=height, $fn=40);

                translate([0, 28, 0])
                cube([12, 1, height]);
            }
            hull() {
                translate([0, 9, 0])
                cube([1, 19, height]);

                translate([-10, 34, 0])
                cylinder(d=5, h=height, $fn=30);
            }
            hull() {
                translate([-10, 34, 0])
                cylinder(d=5,h=height, $fn=30);

                translate([-12, 40, 0])
                cylinder(d=5, h=height, $fn=30);
            }
        }
        translate([0, 29, 0])
        rotate([0, 0, -13])
        cube([40, 10, height + 1]);

        translate([-10, -25, 0])
        rotate([0, 0, -13])
        cube([40, 10, height + 1]);

        translate([-16, -17, 0])
        rotate([0, 0, -40])
        cube([5, 20, height + 1]);
    }
}

module E3D_HobGoblin() {
    difference() {
        // E3D HobGoblin
        cylinder(d=8,h=11, $fn=30);
        cylinder(d=5,h=12, $fn=30);

        translate([0, 0, 7.5])
        donut(12.2, 5);

        translate([0, 0, 2.9])
        rotate([90, 0, 0])
        cylinder(d=3, h=5, $fn=20);
    }
    translate([0, -2, 2.9])
    rotate([90, 0, 0])
    cylinder(d=3, h=4, $fn=20);
}

module Bondtech_gear() {
    difference() {
        union() {
            cylinder(d=8, h=14, $fn=40);
            for (i=[0:16]) {
                rotate([0, 0, 360/17*i])
                translate([9.5/2 - 2/2, 0, 4.8/2])
                cube([2, 0.8, 4.8], center=true);
            }
        }
        cylinder(d=5, h=30, center=true, $fn=40);

        translate([0, 0, 11])
        donut(11.5, 4);
    }
}

module _hinge_bearing() {
    hull() {
        cylinder(d=6.2, h=3, center=true, $fn=40);
        cylinder(d=3.2, h=6, center=true, $fn=40);
    }
}

module hinge(height=15) {

    // hinge
    translate([15.5, 15.5, 0]) {
        difference() {
            union () {
                cylinder(d=3.2, h=height + 1, $fn=40);
                _hinge_bearing();

                translate([0, 0, height])
                _hinge_bearing();
            }
        }
    }
}

module hinge_support(height=15) {
    difference() {
        hull() {
            translate([0, 0, 3/2])
            cylinder(d=6.6, h=height - 8 - 3);

            cylinder(d=5.3, h=height - 8, $fn=40);
        }
        cylinder(d=3.3, h=height - 7, $fn=40);
    }
}

module fitting_hole_M5() {
    dist = 2.4;
    union() {
        difference() {
            cylinder(d=4.7,h=5, $fn=40);

            translate([dist,dist,0])
            cube([2,2,40], center=true);

            translate([-dist,dist,0])
            cube([2,2,40], center=true);

            translate([dist,-dist,0])
            cube([2,2,40], center=true);

            translate([-dist,-dist,0])
            cube([2,2,40], center=true);
        }
        translate([0, 0, 4])
        cylinder(d1=3.7, d2=5.5, h=2, $fn=40);
    }
}

module fitting_hole_M6() {
    dist = 2.7;
    union() {
        difference() {
            cylinder(d=5.7, h=5, $fn=40);

            translate([dist, dist, 0])
            cube([2, 2, 40], center=true);

            translate([-dist, dist, 0])
            cube([2, 2, 40], center=true);

            translate([dist, -dist, 0])
            cube([2, 2, 40], center=true);

            translate([-dist, -dist, 0])
            cube([2, 2, 40], center=true);
        }
        translate([0, 0, 4.01])
        cylinder(d1=4.7, d2=6.5, h=2, $fn=40);
    }
}

module spring_notch() {
    // spring notch
    translate([13, -14.5, 15/2 + 1])
    rotate([-90, 0, -75])
    difference() {
        hull() {
            cylinder(d=8, h=9, $fn=40);

            translate([8, 0, 0])
            cylinder(d=18, h=9, $fn=40);
        }
        cylinder(d1=4.5, d2=2.5, h=2, $fn=40);
    }
}

module E3D_HobGoblin_hole(height=15) {
    // gear indent
    difference() {
        hull() {
            cylinder(d=8.5, h=height + 1, $fn=40);

            translate([-15, -35/2, 0])
            cube([1, 54, height + 1]);
        }
        translate([0, 0, height/2])
        donut(12.8, 5, 93, -90/2 - 20);

        rotate([0, 0, 26])
        translate([12.8/2, 0, height/2])
        rotate([-90, 0, 0])
        cylinder(d=5, h=5);
    }
    translate([0, 0, 7.6 + 3.2])
    cylinder(d=8 + 5, h=6);
}

module filament_holes(
    x_offset, height=15, offset=5,
    threads=true, m4=false
) {
    // filament tube and fitting holes
    rotate([0, 0, -13])
    union() {
        translate([x_offset, offset, height/2])
        rotate([-90, 0, 0])
        cylinder(d=2, h=30, $fn=30);

        if (m4) {
            translate([x_offset, 13.5, height/2])
            rotate([-90, 0, 0])
            cylinder(d1=2, d2=3.7, h=4, $fn=30);
        } else {
            translate([x_offset, 20, height/2])
            rotate([-90, 0, 0])
            cylinder(d1=2, d2=3.5, h=4, $fn=30);
        }

        translate([x_offset, -offset, height/2])
        rotate([90, 0, 0])
        cylinder(d=2, h=60, $fn=30);

        translate([x_offset, 30, height/2])
        rotate([90, 0, 0])
        cylinder(d=0.8, h=60, $fn=30);

        if (threads) {
            translate([x_offset, 29 - 5.79, height/2])
            rotate([-90, 0, 0])
            fitting_thread_M6(6);

            translate([x_offset, -18 + 6.19, height/2])
            rotate([90, 0, 0])
            fitting_thread_M6(6);
        } else if (!m4){
            translate([x_offset, 29 - 5.79, height/2])
            rotate([-90, 0, 0])
            cylinder(d=6, h=6, $fn=30);

            translate([x_offset, -18 + 6.19, height/2])
            rotate([90, 0, 0])
            cylinder(d=6, h=6, $fn=30);
        }

        if (m4) {
            translate([x_offset, 29 - 11.79, height/2])
            rotate([-90, 0, 0])
            cylinder(d=4.3, h=12, $fn=30);

            translate([x_offset, -18 + 9.19, height/2])
            rotate([90, 0, 0])
            cylinder(d=4.3, h=12, $fn=30);

            translate([x_offset, 29 - 4, height/2])
            rotate([90, -90, 0])
            hull() {
                M4_nut(h=3.35, cone=false);

                translate([10, 0, 0])
                M4_nut(h=3.35, cone=false);
            }

            translate([x_offset, -18 + 7, height/2])
            rotate([90, -90, 0])
            hull() {
                M4_nut(h=3.35, cone=false);

                translate([10, 0, 0])
                M4_nut(h=3.35, cone=false);
            }
        }
    }
}

module idler_hole_E3D_HobGoblin_U604zz(supports) {
    // idler hole
    rotate([0, 0, -13])
    translate([10.7, 0, 0]) {
        cylinder(d=3.6, h=11, center=true, $fn=30);

        translate([0, 0, 5])
        cylinder(d=4.2, h=15, $fn=30);

        translate([0, 0, 15 - 2.5])
        cylinder(d=9, h=3, $fn=30);

        translate([0, 0, 4.6])
        difference() {
            // main hole form
            difference() {
                hull() {
                    cylinder(d=13.3, h=5.8, $fn=60);

                    translate([20, -18/2 + 8, 0])
                    cube([1, 18, 5.8]);
                }
                translate([0, 0, 5.8/2])
                donut(13.5, 2, 110, 125);
            }

            // support pillar
            difference() {
                cylinder(d=5.2, h=6, $fn=30);

                if (supports) {
                    translate([0, 0, 0.9 + 4/2])
                    rotate([0, 0, 45])
                    cube([2, 8, 4], center=true);

                    translate([0, 0, 0.9 + 4/2])
                    rotate([0, 0, -45])
                    cube([2, 8, 4], center=true);
                } else {
                    translate([0, 0, 0.9])
                    cylinder(d=6, h=4);
                }
            }
            if (supports) {
                translate([5, -3, 5.4/2 + 0.2])
                rotate([0, 0, 14])
                cube([15, 0.45, 5.4], center=true);

                translate([11, 3.4, 5.4/2 + 0.2])
                rotate([0, 0, 16])
                cube([15, 0.45, 5.4], center=true);

                translate([5, 6, 5.4/2 + 0.2])
                rotate([0, 0, 18])
                cube([15, 0.45, 5.4], center=true);
            }
        }
    }
}

module arm_E3D_HobGoblin_U604zz(
    threads=true, m4=false, supports=false
) {

    difference() {
        arm_body();
        hinge();
        spring_notch();
        
        E3D_HobGoblin_hole();
        
        filament_holes(
            4.2, offset=5, threads=threads, m4=m4
        );
        
        idler_hole_E3D_HobGoblin_U604zz(supports);
    }
}

module idler_hole_E3D_HobGoblin_2x623zz(h, idler_z) {
    // idler hole
    rotate([0,0,-13]) translate([9.9,0,0]) {
        cylinder(d=2.5, h=idler_z, $fn=30);

        translate([0,0,idler_z])
        cylinder(d=3.1, h=15, $fn=30);

        translate([0,0,h-1])
        cylinder(d=6, h=3, $fn=30);

        translate([0,0,idler_z])
        difference() {
            hull() {
                cylinder(d=10.4,h=9,$fn=60);

                translate([25,-18/2+6,0])
                cube([1,18,9]);
            }
            difference() {
                cylinder(d=5.2,h=9,$fn=30);

                translate([0,0,0.5+8/2])
                rotate([0,0,45])
                cube([1.5,10,8], center=true);

                translate([0,0,0.5+8/2])
                rotate([0,0,-45])
                cube([1.5,10,8], center=true);
            }
        }
        
    }
    translate([0,0,12.5])
    cylinder(d=12, h=10, $fn=40);
}

module arm_E3D_HobGoblin_2x623zz(threads=true) {
    h = 15;
    idler_z = (h - 9)/2;
    
    difference() {
        arm_body(h);
        hinge(h);
        spring_notch();
        
        E3D_HobGoblin_hole(h);
        
        filament_holes(4.2, height=h, offset=5, threads=threads);
        
        idler_hole_E3D_HobGoblin_2x623zz(h, idler_z);
    }
}

module hole_bondtech() {
    height = 22;
    // gear indent
    difference() {
        hull() {
            translate([0, -0.2, -1])
            cylinder(d=9, h=height + 1, $fn=40);

            translate([-15, -35/2, -1])
            cube([1, 54, height + 1]);
        }
        translate([0, -0.2, 2 + 3])
        donut(11.9, 4, 93, -90/2 - 20);

        rotate([0, 0, 26])
        translate([11.9/2, 0, 2 + 3])
        rotate([-90, 0, 0])
        cylinder(d=4, h=5);
    }

    hull() {
        translate([0, 0, 1.8 + 14 - 5])
        cylinder(d=12.2, h=15, $fn=50);

        translate([-15, -30/2, 2 + 14 - 5])
        cube([1, 40, 15]);
    }

    hull() {
        translate([0, 0, 2 + 14/2 - 3/2])
        cylinder(d=10, h=4, $fn=50);

        translate([-15, -30/2, 2 + 14/2 - 3/2])
        cube([1, 42, 4]);
    }
}

module idler_hole_Bondtech(supports) {
    // idler hole
    rotate([0, 0, -13])
    translate([8.9, 0, 0]) {
        cylinder(d=3.15, h=3, $fn=30);

        if (supports) {
            translate([0, 0, 20 - 4])
            cylinder(d=3.15, h=5, $fn=30);
        } else {
            translate([0, 0, 20 - 3.4])
            cylinder(d=3.15, h=5, $fn=30);
        }

        translate([0, 0, 1.8])
        difference() {
            difference() {
                union() {
                    hull() {
                        cylinder(d=8.6, h=14.4, $fn=60);

                        translate([15, -11/2 + 5, 0])
                        cube([1, 11, 14.4]);
                    }
                    translate([0, 0, 14 - 5])
                    hull() {
                        cylinder(d=10, h=5.4, $fn=60);

                        translate([15, -11/2 + 5, 0])
                        cube([1, 11, 5.4]);
                    }
                }
                translate([0, 0, 3.2])
                donut(11.9, 4, 110, 125);
            }
        }
    }
}

module support_soluble_bondtech() {
    difference() {
        idler_hole_Bondtech();

        cylinder(d=30, h=3.6, center=true);

        translate([0, 0, 20])
        cylinder(d=30, h=7, center=true);

        translate([0, 0, 1.8 + 14.4/2 - 0.3])
        cylinder(d=80, h=13.4, center=true);

        cube([22, 20, 20], center=true);

        translate([26.7, 0, 0])
        rotate([0, 0, -11.3])
        cube([10, 20, 40], center=true);
        
    }
}

module support_nonsoluble_bondtech() {
    difference() {
        union() {
            hull() {
                #translate([11.3, -1.8, 2 + 1/2])
                cube([1, 8, 1], center=true);

                translate([22.2, -0.9, 2 + 1/2])
                rotate([0, 0, -11.3])
                cube([1, 10, 1], center=true);

                #translate([7.3, -2, 12 + 1/2])
                cube([1, 8, 1], center=true);

                translate([21.2, -0.9, 12 + 1/2])
                rotate([0, 0, -11.3])
                cube([1, 10, 1], center=true);
            }
            hull() {
                hull() {
                    translate([7.3, -2, 12 + 1/2])
                    cube([1, 8, 1], center=true);

                    translate([21.2, -0.9, 12 + 1/2])
                    rotate([0, 0, -11.3])
                    cube([1, 10, 1], center=true);
                }

                translate([0, 0, 14.4])
                difference() {
                    linear_extrude(1)
                    offset(-0.3)
                    projection()
                    idler_hole_Bondtech();

                    translate([26.8, 0, 0])
                    rotate([0, 0, -11.3])
                    cube([10, 20, 40], center=true);
                }
            }
            translate([22.2, -0.9, 2/2])
            rotate([0, 0, -11.3])
            cube([1, 10, 2], center=true);

        }
        
        translate([10, -4/2 - 1.5, 12/2 + 2.6])
        rotate([0, 0, 1.5])
        cube([30, 4, 12], center=true);

        translate([10, 3/2 - 1.1, 12/2 + 2.6])
        rotate([0, 0, 4])
        cube([30, 3, 12], center=true);
    }
}

module arm_Bondtech(
    threads=true, m4=false, supports=false
) {

    difference() {
        difference() {
            union() {
                arm_body(height=19.2);

                rotate([0, 0, -13])
                translate([8.9, 0, 19])
                cylinder(d1=7, d2=5, h=1);
            }
            translate([-22, 6, 15])
            chamfered_cube(52, 42, 10, 4.2);

            translate([-10, -38, 15])
            chamfered_cube(50, 30, 10, 4.2);

            translate([-9, -15, 15])
            rotate([0, 0, -13])
            cube([10.6, 30, 10]);
            
            // extra infill
            translate([9, 5.7, 10])
            cylinder(d=0.1, h=10);

            translate([13, 5.7, 10])
            cylinder(d=0.1, h=10);

            translate([17, 5.7, 10])
            cylinder(d=0.1, h=10);

            translate([21, 6, 10])
            cylinder(d=0.1, h=10);
            
            translate([6, -7.4, 10])
            cylinder(d=0.1, h=10);

            translate([10, -7.6, 10])
            cylinder(d=0.1, h=10);

            translate([14, -7.8, 10])
            cylinder(d=0.1, h=10);

            translate([18, -8, 10])
            cylinder(d=0.1, h=10);

        }
        hinge(height=15);
        spring_notch();

        hole_bondtech();

        filament_holes(
            4.4, height=(2 + 3)*2, offset=5,
            threads=threads, m4=m4
        );

        idler_hole_Bondtech(supports=supports);

        translate([10, 14, 15 + 10/2])
        rotate([0, 0, 17.3])
        cube([20, 10, 10], center=true);
    }
}

module _motor_mount_base() {
    union() {
        translate([0,0,6])
        orig_motor_mount();

        cylinder(d=30,h=4);

        linear_extrude(1.5)
        projection(cut=true)
        translate([0,0,4.9])
        orig_motor_mount();
    }
}

module _motor_mount_infill() {
    // arm spring mount infill
    translate([32, 3, 0])
    cylinder(d=0.1, h=30);

    translate([33.15, -1, 0])
    cylinder(d=0.1, h=30);

    translate([34.3, -5, 0])
    cylinder(d=0.1, h=30);

    translate([35.45, -9, 0])
    cylinder(d=0.1, h=30);

    translate([36.6, -13, 0])
    cylinder(d=0.1, h=30);

    translate([33.6, -16.3, 0])
    cylinder(d=0.1, h=30);

    translate([29, -17.4, 0])
    cylinder(d=0.1,h=30);

    translate([25, -18.5, 0])
    cylinder(d=0.1, h=30);

    // main body infill
    translate([0, 10, 1])
    cube([55, 0.1, 2]);

    translate([0, 6, 1])
    cube([55, 0.1, 2]);

    translate([0, 2, 1])
    cube([55, 0.1, 2]);

    translate([0, -2, 1])
    cube([55, 0.1, 2]);

    translate([0, -6, 1])
    cube([55, 0.1, 2]);

    translate([0, -10, 1])
    cube([55, 0.1, 2]);

    translate([0, -14, 1])
    cube([55, 0.1, 2]);
}

module motor_mount() {
    difference() {
        union() {
            intersection() {
                _motor_mount_base();

                difference() {
                    union() {
                        translate([0, 0, 4/2])
                        cube(
                            [160, 160, 4],
                            center=true
                        );

                        translate([30, 0, 0])
                        cube(
                            [30, 70, 100],
                            center=true
                        );
                    }

                    // middle motor hole
                    cylinder(
                        d=22.4, h=15,
                        $fn=70, center=true
                    );
                }
            }

            // arm mount nub
            translate([31/2, 31/2, 0]) {
                cylinder(d=9, h=5, $fn=30);

                hull() {
                    cylinder(d=6, h=5 + 1.5, $fn=40);
                    cylinder(d=3, h=5 + 3, $fn=40);
                }
            }

            // arm supports
            hull() {
                translate([-0.5, -13.7, 2])
                cylinder(d=1.8, h=3, $fn=20);

                translate([11.5, -13.7, 2])
                cylinder(d=1.8, h=3, $fn=20);
            }

            hull() {
                translate([24, -7, 2])
                cylinder(d=1.8, h=3, $fn=20);

                translate([10.1, -7, 2])
                cylinder(d=1.8, h=3, $fn=20);
            }
        }
        translate([31/2, -31/2, 2.51])
        cylinder(d1=3, d2=6, h=1.5, $fn=30);

        translate([31/2, 31/2, -0.1])
        cylinder(d=3.2, h=8.5, $fn=30);

        _motor_mount_infill();
    }
}

module motor_mount_extra_mount() {
    difference() {
        union() {
            motor_mount();

            translate([-31, -20, 0])
            cube([12.5, 40, 4]);
        }
        translate([-26, 15, -0.1])
        cylinder(d=4.2, h=5, $fn=30);

        translate([-26, -14, -0.1])
        cylinder(d=4.2, h=5, $fn=30);

        _motor_mount_infill();
    }
}

module motor_mount_extra_mount2() {
    difference() {
        union() {
            motor_mount();

            translate([18.5, -21.15, 0])
            chamfered_cube_side(35.5, 42.3, 4,4);

            translate([17, 16.15, 0])
            cube([6, 5, 4]);
            
            translate([17, -21.15, 0])
            cube([6, 1, 4]);
        }
        translate([49.5, 15, -0.1])
        cylinder(d=4.2, h=5, $fn=30);

        translate([49.5, -14, -0.1])
        cylinder(d=4.2, h=5, $fn=30);

        _motor_mount_infill();
    }
}

module motor_mount_extra_mount3() {
    difference() {
        union() {
            motor_mount();

            difference() {
                translate([-21.15, -13 - 28.3, 0])
                chamfered_cube_side(42.2, 28.3, 4,4);

                translate([-31/2, -31/2, -0.1])
                cylinder(d=5, h=5, $fn=8);

                translate([31/2, -31/2, -0.1])
                cylinder(d=7, h=5, $fn=8);
            }
        }
        translate([-15, -37,-0.1])
        cylinder(d=4.2, h=5, $fn=30);

        translate([-15 + 9, -37, -0.1])
        cylinder(d=4.2, h=5, $fn=30);

        translate([-15 + 29, -37, -0.1])
        cylinder(d=4.2, h=5, $fn=30);

        _motor_mount_infill();

        // more infill
        translate([-12, -70, 1])
        cube([0.1, 55, 2]);
        
        translate([-8, -70, 1])
        cube([0.1, 55, 2]);

        translate([-4, -70, 1])
        cube([0.1, 55, 2]);

        translate([0, -70, 1])
        cube([0.1, 55, 2]);

        translate([4, -70, 1])
        cube([0.1, 55, 2]);

        translate([8, -70, 1])
        cube([0.1, 55, 2]);

        translate([12, -70, 1])
        cube([0.1, 55, 2]);
    }
}

module lock_lever() {
    difference() {
        union() {
            rotate([0,0,55])
            orig_lock_lever();

            mirror([0,1,0])
            orig_lock_lever();

            cylinder(d=9.6,h=12+3.4,$fn=40);
        }
        cylinder(d=3.3,h=17+5,$fn=20);

        translate([0,-30/2-13.5,7])
        rotate([0,90,0])
        cylinder(d=30,h=10,center=true,$fn=30);
    }
}

module _MR105zz_support(h) {
    
    difference() {
        union() {
            orig_MR105ZZ_support();

            translate([31/2, 31/2, 0])
            cylinder(d=9.5, h=h, $fn=40);

            // arm extension
            translate([-31/2, 31/2, 0])
            cylinder(d=9.5, h=h - 16.4, $fn=40);

            hull() {
                translate([-31/2, 31/2, 0])
                cylinder(d=9.5, h=5, $fn=40);

                translate([10, 12, 5/2])
                rotate([0, 0, -45])
                cube([2, 19, 5], center=true);
            }

            // lock lever part

            hull() {
                translate([31/2, -31/2, 0])
                cylinder(d=9.5, h=h, $fn=40);

                translate([31/2, -10, 0])
                cylinder(d=9.5, h=h, $fn=40);
            }

            hull() {
                translate([31/2, -31/2, 0])
                cylinder(d=9.5, h=5, $fn=40);

                translate([31/2, 31/2, 0])
                cylinder(d=9.5, h=5, $fn=40);

                translate([10, 12, 0])
                cylinder(d=9.5, h=5, $fn=40);
            }

            // arm nub
            translate([-31/2, 31/2, 0]) {
                //cylinder(d=9.5, h=4 + 1.2, $fn=40);

                hull() {
                    cylinder(
                        d=6, h=h - 16.4 + 1.7 + 0.2, $fn=40
                    );

                    cylinder(
                        d=3, h=h - 16.4 + 3.2 + 0.2, $fn=40
                    );
                }
            }
        }

        translate([31/2, -31/2, h - 15.6])
        cylinder(d=10.5, h=h, $fn=40);

        // screw holes
        translate([31/2, 31/2, 0])
        cylinder(d=3.3, h=h + 1, $fn=20);

        translate([-31/2, 31/2, 0])
        cylinder(d=3.3, h=22, $fn=40, center=true);

        translate([31/2, -31/2, 0])
        cylinder(d=3.3, h=22, $fn=40, center=true);
    }
    //%translate([0, 0, 1])
    //MR105zz();
}

module MR105zz_support_Hobbgoblin() {
    _MR105zz_support(h = 18 + 3.4);
}


module MR105zz_support_Bondtech() {
    _MR105zz_support(h = 19 + 3.4);
}

module spring_cap_8mm_spring() {
    //orig_spring_cap();
    difference() {
        union() {
            difference() {
                cylinder(d=10.2,h=6, $fn=30);

                translate([0,0,2])
                cylinder(d=8.2,h=7, $fn=25);
            }
            translate([0,0,2])
            cylinder(d1=4.5,d2=3.3,h=2, $fn=20);
        }
        cylinder(d=2.5,h=2.5, $fn=25);
    }
}

module qnd_fix() {
    // don't use
    difference() {
        union() {
            hull() {
                cylinder(d=9.8,h=4);
                cylinder(d=6.5,h=4+3.3/2);
            }
            cylinder(d=6.5,h=7);
        }
        cylinder(d=3.2,h=8);
        _hinge_bearing();
    }
}

module bondtech_position_tool() {
    difference() {
        translate([0,0,3/2])
        cube([12,40,3], center=true);

        translate([12/2-4,0,0])
        hull() {
            cylinder(d=5.5,h=12,center=true,$fn=40);

            translate([4,0,0])
            cylinder(d=5.5,h=12,center=true,$fn=40);
        }
    }
}

module debug_orig_arm() {
    %translate([0, 0, -5])
    //motor_mount();
    //motor_mount_extra_mount2();
    motor_mount_extra_mount3();

    %translate([-31/2, -31/2, -1])
    lock_lever();

    intersection() {
        orig_arm();

        translate([-100/2, -100/2, 0])
        cube([100, 100, 15/2]);
    }
    %cylinder(d=11, h=11, $fn=40);
    %translate([12.9, 0, 5.5])
    U604zz();
    
}


module debug_arm_E3D_HobGoblin_U604zz() {
    %translate([0, 0, -5])
    //motor_mount();
    //motor_mount_extra_mount2();
    motor_mount_extra_mount3();

    %translate([-31/2, -31/2, -1])
    lock_lever();

    intersection() {
        arm_E3D_HobGoblin_U604zz(threads=false, m4=true, supports=true);

        translate([-100/2, -100/2, 0])
        cube([100, 100, 15/2]);

        //translate([-100/2, -40, 0])
        //cube([100, 55, 40]);
    }
    %translate([0, 0, 11 + 4])
    rotate([180, 0, 0])
    E3D_HobGoblin();

    %translate([0, 0, 15.2])
    MR105zz();

    %rotate([0, 0, -13])
    translate([10.5, 0, 5.5])
    U604zz();

    %translate([0, 0, 20.4])
    rotate([0, 180, 0])
    MR105zz_support_Hobbgoblin();
}

module debug_arm_E3D_HobGoblin_2x623zz() {
    %translate([0, 0, -5])
    //motor_mount();
    //motor_mount_extra_mount2();
    motor_mount_extra_mount3();

    %translate([-31/2, -31/2, -1])
    lock_lever();

    intersection() {
        arm_E3D_HobGoblin_2x623zz();

        translate([-100/2, -100/2, 0])
        cube([100, 100, 15/2]);

//        translate([-100/2, -40, 0])
//        cube([100, 55, 40]);
    }

    %translate([0, 0, 15])
    rotate([0, 180, 0])
    E3D_HobGoblin();

    %translate([0, 0, 15.2])
    MR105zz();

    x_offset = 9.8;
    %rotate([0, 0, -13])
    translate([x_offset, 0, 3.5])
    623zz();

    %rotate([0, 0, -13])
    translate([x_offset, 0, 7.5])
    623zz();

    %translate([0, 0, 20.4])
    rotate([0, 180, 0])
    MR105zz_support_Hobbgoblin();
}

module debug_arm_Bondtech() {
    %translate([0, 0, -5])
    //motor_mount();
    //motor_mount_extra_mount2();
    motor_mount_extra_mount3();

    %translate([-31/2, -31/2, -1])
    lock_lever();

    intersection() {
        arm_Bondtech(threads=false, m4=true);

        translate([-100/2, -100/2, 0])
        cube([100, 100, 2 + 3]);

//      translate([-100/2, -40, 0])
//      cube([100, 55, 40]);
    }

    %translate([0, 0, 14 + 2])
    rotate([0, 180, 0])
    Bondtech_gear();

    %translate([0, 0, 14 + 2.2])
    MR105zz();

    x_offset = 8.9;
    %rotate([0, 0, -13])
    translate([x_offset, 0, 14 + 2])
    rotate([0, 180, 0])
    Bondtech_gear();

    %translate([0, 0, 21.4])
    rotate([0, 180, 0])
    MR105zz_support_Bondtech();
}

module debug_bondtech_gear() {

    %translate([0, 0, -5])
    //motor_mount();
    //motor_mount_extra_mount2();
    motor_mount_extra_mount3();

    %translate([0, 0, 14 + 2])
    rotate([0, 180, 0])
    Bondtech_gear();

    rotate([0, 0, -140])
    translate([-2, 0, -1])
    bondtech_position_tool();
}

module debug_bondtech_arm_supports() {
    arm_Bondtech(threads=false, m4=true, supports=true);

    support_soluble_bondtech();

    support_nonsoluble_bondtech();
}