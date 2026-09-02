use <../../../../Dollo/NEW_long_ties/include.scad>;
use <../../../../lib/bearings.scad>;
use <../../../../lib/fittings.scad>;

use <../../../../Silica_Gel_Spool-Core_Drying_Container_remix/Silica_Gel_Spool-Core_Drying_Container_remix.scad>;


stl_base_path = "../../../../_downloaded/Anycubic/ACE Pro/";
spath = str(
    stl_base_path, "Anycubic Ace PRO mod Spool Holder/"
);


//mock_M8_nylock();

//_orig_cylinder_spool_holder_ace();
//_orig_right_spool_holder_ace();

//mod_spool_holder_assembly();
//mod_spool_holder_v2_assembly();
//mod_spool_holder_ace2_assembly();
//debug_cylinder_silica();


//cylinder_silica_gel_cap();
//cylinder_silica_gel();

//cylinder_silica_gel_cap(d=52.5);
//cylinder_silica_gel(d=52.5);

//M4_rod_axle_nut();
//M4_rod_axle_half();

//ace_pro_spool_holder_left_v2();
//ace_pro_spool_holder_right_v2();

//ace2_pro_spool_holder_left();
ace2_pro_spool_holder_right();



module mock_M8_nylock() {
    difference() {
        union() {
            M8_nut(5.5, cone=false);
            rounded_cylinder(12.5, 8, 2, $fn=30);
        }

        cylinder(d=8, h=30, center=true, $fn=30);
    }
}

module _orig_cylinder_spool_holder_ace() {

    translate([27, 102, -8.25])
    rotate([0, -90, 0])
    import(
        str(spath, "cylinder_spool_holder_ace.stl"),
        convexity=10
    );

    //%cylinder(d=10, h=1, $fn=40);
    //%cylinder(d=52.5, h=72, $fn=120);
}

module _orig_right_spool_holder_ace() {

    import(
        str(spath, "right_spool_holder_ace.stl"),
        convexity=10
    );

    //%cylinder(d=10, h=1, $fn=40);
    //%cylinder(d=52.5, h=2, $fn=120);
}

module _orig_left_spool_holder_ace() {

    import(
        str(spath, "left_spool_holder_ace.stl"),
        convexity=10
    );

    //%cylinder(d=10, h=1, $fn=40);
    //%cylinder(d=52.5, h=2, $fn=120);
}

module mod_spool_holder_assembly() {
    y = -88;
    z = 21;

    color("white")
    _orig_right_spool_holder_ace();

    color("white")
    _orig_left_spool_holder_ace();

    render()
    translate([8.25, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([8.25 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([8.25 + 84.5 + 85.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([8.25 + 84.5 + 85.5 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

//    color("darkgrey")
//    render()
//    translate([84/2 + 4 + 84*2, y, z])
//    rotate([0, 90, 0])
//    cylinder(d=200, h=68, center=true, $fn=80);

    color("darkgrey")
    render()
    translate([84/2 + 4 + 84*2, y, z])
    rotate([0, 90, 0])
    cylinder(d=160, h=68, center=true, $fn=80);
}

module mod_spool_holder_v2_assembly() {
    y = -8;
    z = 32.3;
//    y = 9.8;
//    z = 23;

    translate([0, 0, 38.75])
    rotate([-10, 180, 0])
    ace_pro_spool_holder_left_v2();

    translate([0, 0, 38.75])
    rotate([-10, 180, 0])
    ace_pro_spool_holder_right_v2()

    render()
    translate([-171.625 + 8.75, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5 + 84.5 + 84.625, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    color("darkgrey")
    render()
    translate([-171.5 + 84/2 + 4 + 84*2, y, z])
    rotate([0, 90, 0])
    tube(200, 68, (200 - 52.5)/2, center=true, $fn=80);

//    color("darkgrey")
//    render()
//    translate([-171.5 + 84/2 + 4 + 84*2, y, z])
//    rotate([0, 90, 0])
//    tube(160, 68, (160 - 52.5)/2, center=true, $fn=80);
}

module mod_spool_holder_ace2_assembly() {
    y = -9.6;
    z = 27.8;
//    y = 8.9;
//    z = 18;

    translate([0, 0, 38.75])
    rotate([-10, 180, 0])
    ace2_pro_spool_holder_left();

    translate([0, 0, 38.75])
    rotate([-10, 180, 0])
    ace2_pro_spool_holder_right()

    render()
    translate([-171.625 + 8.75, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5 + 84.5 + 84.625, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    color("darkgrey")
    render()
    translate([-171.5 + 84/2 + 4 + 84*2, y, z])
    rotate([0, 90, 0])
    tube(202, 68, (200 - 52.5)/2, center=true, $fn=80);

//    color("darkgrey")
//    render()
//    translate([-171.5 + 84/2 + 4 + 84*2, y, z])
//    rotate([0, 90, 0])
//    tube(160, 68, (160 - 52.5)/2, center=true, $fn=80);
}

module debug_cylinder_silica() {
    color("lightgrey")
    intersection() {
        cylinder_silica_gel_cap(d=52.5);

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    color("lightgrey")
    intersection() {
        translate([0, 0, 72])
        rotate([0, 180, 0])
        cylinder_silica_gel(d=52.5);

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        union() {
            color("lightgrey")
            translate([0, 0, 6])
            608zz();

            color("lightgrey")
            translate([0, 0, 72 - 13])
            608zz();
        }

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }
//
//    color("grey")
//    translate([0, 0, -5])
//    cylinder(d=8, h=82, $fn=30);
//
//    color("grey")
//    translate([0, 0, 6])
//    rotate([180, 0, 0])
//    mock_M8_nylock();
//
//    color("grey")
//    translate([0, 0, 72 - 6])
//    mock_M8_nylock();

//    color("grey")
//    translate([0, 0, -5.5])
//    cylinder(d=4, h=83, $fn=30);

    color("grey")
    translate([0, 0, -15.5])
    cylinder(d=4, h=103, $fn=30);

    color("lightgrey")
    translate([0, 0, 6])
    rotate([180, 0, 0])
    M4_rod_axle_nut();

    color("lightgrey")
    translate([0, 0, 72 - 6])
    M4_rod_axle_nut();

    color("lightgrey")
    translate([0, 0, 6])
    M4_rod_axle_half();

    color("lightgrey")
    translate([0, 0, 36])
    M4_rod_axle_half();

}

module cylinder_silica_gel_cap(d=48) {
    sd = d - 1;

    difference() {
        intersection() {
            union() {
                cylinder(d=sd, h=2, $fn=60);
                tube(sd, 5, 3, $fn=60);
                tube(28.1, 3, 1.1, $fn=60);
                
                intersection() {
                    union() {
                        v_screw(
                            h=11,
                            screw_d=sd - 2,
                            pitch=2,
                            direction=0,
                            steps=60,
                            depth=0.5,
                            chamfer=true
                        );

                        chamfered_cylinder(
                            sd - 4.4, 11, 0.8, $fn=60
                        );
                    }

                    tube(sd - 3, 200, 2, center=true, $fn=60);
                }

            }

            chamfered_cylinder(sd, 100, 1.8, $fn=60);
        }

        translate([0, 0, -8])
        _bottom_grills(gd=1.2, spacing=9.75);

        cylinder(d=22.1, h=13, $fn=60);

        for(i = [0:25]) {
            rotate([0, 0, i*360/26])
            translate([sd/2 + 0.5, 0, 0])
            cylinder(d=2, h=20, $fn=30);
        }
    }
}

module cylinder_silica_gel(d=48) {
    sd = d - 1;

    difference() {
        union() {
            intersection() {
                translate([0, 0, -0.2])
                new_silica_gel_spool_core(d=sd, h=86);

                translate([0, 0, 0])
                cylinder(d=100, h=67);
            }

            difference() {
                translate([0, 0, 61])
                tube(sd, 6, 2, $fn=60);

                chamfered_cylinder(sd, 63.5, 4, $fn=60);
            }


            hull() {
                cylinder(d=25.6, h=13.5, $fn=60);
                cylinder(d=12, h=18.7, $fn=60);
            }

            hull() {
                translate([0, 0, 70 - 11.5])
                cylinder(d=25.6, h=11.5, $fn=60);

                translate([0, 0, 70 - 16.7])
                cylinder(d=12, h=16.7, $fn=60);
            }

            cylinder(d=12.1, h=53.5, $fn=60);

            translate([0, 0, 58.5])
            cube([1.2, sd - 1, 5], center=true);

            translate([0, 0, 55.5])
            cube([sd - 1, 1.2, 5], center=true);

        }

        hull() {
            cylinder(d=22.2, h=13, $fn=60);
            cylinder(d=9, h=18, $fn=60);
        }

        hull() {
            translate([0, 0, 70 - 11])
            cylinder(d=22.2, h=11, $fn=60);

            translate([0, 0, 70 - 16])
            cylinder(d=9, h=16, $fn=60);
        }
        cylinder(d=9, h=160, center=true, $fn=60);

        translate([0, 0, 61])
        difference() {
            intersection() {
                v_screw(
                    h=10,
                    screw_d=sd - 1.6,
                    pitch=2,
                    direction=0,
                    steps=60,
                    depth=0.5,
                    chamfer=true
                );

                cylinder(d=sd - 2.6, h=200, center=true, $fn=60);
            }

            cylinder(d=40, h=60, center=true);
        }
    }
}

module M4_rod_axle_nut() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 8 - 4.5])
                M8_nut(4, cone=false);

                cylinder(d=10, h=8, $fn=20);
            }
            cylinder(d=8, h=11.5, $fn=40);
        }

        difference() {
            cylinder(d=3.9, h=60, center=true, $fn=20);

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([3.9/2 + 0.2, 0, 0])
                cylinder(d=1, h=60, center=true, $fn=20);
            }
        }
    }
}

module M4_rod_axle_half() {
    difference() {
        tube(8, 30, 1.9, $fn=40);

        translate([0, 0, 30/2])
        chamfered_cylinder(4.4, 21, 1, center=true, $fn=40);
    }
}

module _ace_pro_spool_holder_v2(thread_slop=0.3) {

//    %translate([171.625, 88.8, 55])
//    rotate([-10, 180, 0])
//    union() {
//        _orig_right_spool_holder_ace();
//        _orig_left_spool_holder_ace();
//    }

    module _spool_slot() {
        rotate([10, 0, 0])
        difference() {
            translate([0, 0, 0])
            union() {
                cube([74.5, 224, 200], center=true);

                translate([0, 0, -67])
                rotate([90, 0, 0])
                chamfered_cube_side(
                    76.5, 200, 224, 2, center=true
                );
            }

            translate([0, 100/2 + 224/2 - 20, 100/2 + 27])
            chamfered_cube(
                100, 100, 100, 10, center=true
            );
        }
    }

    module _ptfe_hole() {
        translate([0, 220/2 + 10, 0])
        union() {
            translate([0, 0, -7])
            chamfered_cylinder(8.2, 10, 1.5, $fn=30);

            translate([0, 0, 1])
            fitting_thread_M6(
                fitting_h=8.1, slop=thread_slop, chamfer=false
            );

            translate([0, 0, 8])
            chamfered_cylinder(8, 10, 2, $fn=40);

            %translate([0, 0, 10])
            cylinder(d=4, h=50, $fn=30);
        }
    }

    module _screw_hole() {
        rotate([0, 90, 0])
        union() {
            cylinder(d=3.2, h=20, center=true, $fn=30);

            translate([0, 0, 1.5])
            chamfered_cylinder(6.2, 10, 2, $fn=30);

            translate([0, 0, -1.5])
            rotate([180, 0, 0])
            M3_nut(5, cone=false);
        }
    }

    difference() {
        intersection() {
            hull() {
                translate([0, 260/2 - 118.58, 1/2])
                cube([352, 260, 1], center=true);

                rotate([10, 0, 0])
                translate([0, 260/2 - 116.78, 36.7])
                cube([352, 260, 4], center=true);
            }

            translate([0, 0, 10])
            rotate([0, 90, 0])
            chamfered_cylinder(
                255, 352, 8, center=true, $fn=100
            );
        }

        translate([-84.5/2, 0, 0])
        _spool_slot();

        translate([-84.5/2 - 84.5, -0, 0])
        _spool_slot();

        translate([84.5/2, 0, 0])
        _spool_slot();

        translate([84.5/2 + 84.5, 0, 0])
        _spool_slot();

        // side cuts
        rotate([10, 0, 0])
        translate([-352/2 - 5.5, -72, 0])
        chamfered_cube(20, 100, 100, 5, center=true);

        rotate([10, 0, 0])
        translate([352/2 + 5.5, -72, 0])
        chamfered_cube(20, 100, 100, 5, center=true);

        rotate([10, 0, 0])
        translate([-352/2 - 5.5, 0, -15])
        scale([1, 1, 1.5])
        chamfered_cube(20, 400, 66, 5, center=true);

        rotate([10, 0, 0])
        translate([352/2 + 5.5, 0, -15])
        scale([1, 1, 1.5])
        chamfered_cube(20, 400, 66, 5, center=true);

        // back cuts
        rotate([10, 0, 0])
        translate([200/2 + 90, -128, 43.6])
        chamfered_cube(200, 200, 20, 6, center=true);

        rotate([10, 0, 0])
        translate([-200/2 - 90, -128, 43.6])
        chamfered_cube(200, 200, 20, 6, center=true);

        rotate([10, 0, 0])
        translate([0, -120, 43.6])
        chamfered_cube(400, 32, 20, 6, center=true);

        // core slot
        translate([0, -10, 4.5])
        rotate([-53.5, 0, 0])
        hull() {
            translate([0, 0, -20])
            rotate([0, 90, 0])
            cylinder(d=8.6, h=400, center=true, $fn=40);

            translate([0, 0, 25])
            rotate([0, 90, 0])
            cylinder(d=8.6, h=400, center=true, $fn=40);
        }

        translate([0, -10, 0])
        rotate([10, 0, 0])
        cube([400, 10, 10], center=true);

        // front cuts
        difference() {
            union() {
                translate([0, 127, 60/2 + 10])
                cube([338.2, 60, 60], center=true);

                rotate([10, 0, 0])
                translate([0, 127, 23])
                cube([338.2, 60.2, 60], center=true);
            }

            rotate([10, 0, 0])
            translate([0, 100, 0])
            cube([8, 70, 80], center=true);

            rotate([10, 0, 0])
            translate([-84.5, 100, 0])
            cube([8, 70, 80], center=true);

            rotate([10, 0, 0])
            translate([84.5, 100, 0])
            cube([8, 70, 80], center=true);
        }

        rotate([10, 0, 0])
        translate([0, 127, 47.6])
        rotate([0, 90, 0])
        rounded_cube_side(
            60, 60.2, 337.5, 27, center=true, $fn=80
        );

        // mount screw holes
        rotate([10, 0, 0])
        translate([-344/2, 112, 70])
        cylinder(d=3.3, h=100, center=true, $fn=30);

        rotate([10, 0, 0])
        translate([-344/2, 112, 13])
        chamfered_cylinder(
            6, 25, 2.7, $fn=30
        );

        rotate([10, 0, 0])
        translate([344/2, 112, 70])
        cylinder(d=3.3, h=100, center=true, $fn=30);

        rotate([10, 0, 0])
        translate([344/2, 112, 13])
        chamfered_cylinder(
            6, 25, 2.7, $fn=30
        );

        // ptfe holes
        #render()
        translate([-337/2 + 53, 0, 0])
        _ptfe_hole();

        render()
        translate([-337/2 + 53 + 63, 0, 0])
        _ptfe_hole();

        render()
        translate([337/2 - 53, 0, 0])
        _ptfe_hole();

        render()
        translate([337/2 - 53 - 63, 0, 0])
        _ptfe_hole();

        // joining screw holes
        translate([0, 25, 5])
        _screw_hole();

        translate([0, -22.5, 31.65])
        _screw_hole();

        translate([0, 70, 48])
        _screw_hole();

        translate([0, -100, 18])
        _screw_hole();

        // leg mount holes
        rotate([10, 0, 0]) {
            translate([0, -28, 30])
            hull() {
                cube([6.5, 6.5, 2], center=true);
                cylinder(d=3.2, h=3, $fn=30);
            }

            translate([0, 2, 30])
            hull() {
                cube([6.5, 6.5, 2], center=true);
                cylinder(d=3.2, h=3, $fn=30);
            }

            translate([0, -28, 40])
            cylinder(d=3, h=20, center=true, $fn=30);

            translate([0, 2, 40])
            cylinder(d=3, h=20, center=true, $fn=30);

            #translate([84.5, -28, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

            #translate([84.5, 2, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

            #translate([-84.5, -28, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

            #translate([-84.5, 2, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

        }
    }
}

module ace_pro_spool_holder_right_v2() {
    intersection() {
        _ace_pro_spool_holder_v2();

        translate([400/2, 0, 0])
        cube([400, 400, 400], center=true);
    }
}

module ace_pro_spool_holder_left_v2() {
    intersection() {
        _ace_pro_spool_holder_v2();

        translate([-400/2, 0, 0])
        cube([400, 400, 400], center=true);
    }
}

module _ace2_pro_spool_holder(thread_slop=0.3) {

    module _spool_slot() {
        rotate([10, 0, 0])
        difference() {
            translate([0, 0, 0])
            union() {
                translate([0, -9, 0])
                cube([74.5, 224, 200], center=true);

                translate([0, -9, -67])
                rotate([90, 0, 0])
                chamfered_cube_side(
                    76.5, 200, 224, 2, center=true
                );
            }

            translate([0, 100/2 + 224/2 - 20, 100/2 + 27])
            chamfered_cube(
                100, 100, 100, 10, center=true
            );
        }
    }

    module _ptfe_hole() {
        translate([0, 220/2, 0])
        union() {
            translate([0, 0, -7])
            chamfered_cylinder(8.2, 10, 1.5, $fn=30);

            translate([0, 0, 1])
            fitting_thread_M6(
                fitting_h=8.1, slop=thread_slop, chamfer=false
            );

            translate([0, 0, 8])
            chamfered_cylinder(8, 10, 2, $fn=40);

            translate([0, 0, 10])
            cylinder(d=4, h=50, $fn=30);
        }
    }

    module _back_leg() {
        hull() {
            rotate([10, 0, 0])
            translate([0, -97.5, 30 + 1/2])
            cube([9.5, 25, 1], center=true);

            rotate([10, 0, 0])
            translate([0, -102, 66.2 + 1/2])
            cube([8.5, 12, 1], center=true);
        }
    }

    module _screw_hole() {
        rotate([0, 90, 0])
        union() {
            cylinder(d=3.2, h=20, center=true, $fn=30);

            translate([0, 0, 1.5])
            chamfered_cylinder(6.2, 10, 2, $fn=30);

            translate([0, 0, -1.5])
            rotate([180, 0, 0])
            M3_nut(5, cone=false);
        }
    }

    module _main() {
        difference() {
            union() {
                intersection() {
                    hull() {
                        translate([0, 250/2 - 112, 1/2])
                        cube([352, 250, 1], center=true);

                        rotate([10, 0, 0])
                        translate([0, 250/2 - 110.2, 36.7])
                        cube([352, 250, 4], center=true);
                    }

                    translate([0, -7, 30])
                    rotate([0, 90, 0])
                    chamfered_cylinder(
                        255, 352, 8, center=true, $fn=100
                    );
                }

                _back_leg();

                translate([-84.5, 0, 0])
                _back_leg();

                translate([-84.5*2 + 0.5, 0, 0])
                _back_leg();

                translate([84.5, 0, 0])
                _back_leg();

                translate([84.5*2 - 0.5, 0, 0])
                _back_leg();
            }

            translate([-84.5/2, 0, 0])
            _spool_slot();

            translate([-84.5/2 - 84.5, -0, 0])
            _spool_slot();

            translate([84.5/2, 0, 0])
            _spool_slot();

            translate([84.5/2 + 84.5, 0, 0])
            _spool_slot();

            // side cuts
            rotate([-37, 1, 0])
            translate([-352/2 - 2.5, -97, 0])
            chamfered_cube(20, 100, 300, 6, center=true);

            rotate([-37, -1, 0])
            translate([352/2 + 2.5, -97, 0])
            chamfered_cube(20, 100, 300, 6, center=true);

            rotate([10, 0, 0])
            translate([-352/2 - 5.5, 0, -15])
            scale([1, 1, 1.5])
            chamfered_cube(20, 400, 66, 5, center=true);

            rotate([10, 0, 0])
            translate([352/2 + 5.5, 0, -15])
            scale([1, 1, 1.5])
            chamfered_cube(20, 400, 66, 5, center=true);
        }
    }

    difference() {
        union() {
            _main();

            // back brace
            hull() {
                rotate([10, 0, 0])
                translate([0, -105, 68])
                cube([335.3, 6, 1], center=true);

                rotate([10, 0, 0])
                translate([0, -108, 60])
                cube([335.3, 1, 1], center=true);
            }
        }

        // back leg slots
        rotate([10, 0, 0])
        translate([0, -110, 72.2])
        cube([8.5, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([-84, -110, 72.2])
        cube([8.5, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([-84*2, -110, 72.2])
        cube([8.5, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([84, -110, 72.2])
        cube([8.5, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([84*2, -110, 72.2])
        cube([8.5, 30, 10], center=true);

        // core slot
        translate([0, -17, 4.5])
        rotate([-52.1, 0, 0])
        hull() {
            translate([0, 0, -20])
            rotate([0, 90, 0])
            cylinder(d=8.6, h=400, center=true, $fn=40);

            translate([0, 0, 30])
            rotate([0, 90, 0])
            cylinder(d=8.6, h=400, center=true, $fn=40);
        }

        translate([0, -12, 0])
        rotate([10, 0, 0])
        cube([400, 10, 15], center=true);

        // front cuts
        difference() {
            union() {
                translate([0, 121.77, 60/2 + 10])
                cube([335.2, 60, 60], center=true);

                rotate([10, 0, 0])
                translate([0, 121.7, 23])
                cube([335.2, 60.2, 60], center=true);
            }

            rotate([10, 0, 0])
            translate([0, 100, 0])
            cube([8, 70, 80], center=true);

            rotate([10, 0, 0])
            translate([-84.5, 100, 0])
            cube([8, 70, 80], center=true);

            rotate([10, 0, 0])
            translate([84.5, 100, 0])
            cube([8, 70, 80], center=true);
        }

        rotate([10, 0, 0])
        hull() {
            translate([0, 121.7, 54.6])
            rotate([0, 90, 0])
            rounded_cube_side(
                60, 60.2, 334.8, 24, center=true, $fn=80
            );

            translate([0, 121.7, 80])
            cube([334.8, 63, 1], center=true);
        }

        // ptfe holes
        #render()
        translate([-84/2, 0, 0])
        _ptfe_hole();

        render()
        translate([-84/2 - 84, 0, 0])
        _ptfe_hole();

        render()
        translate([84/2, 0, 0])
        _ptfe_hole();

        render()
        translate([84/2 + 84, 0, 0])
        _ptfe_hole();

        // joining screw holes
        translate([0, 25, 5])
        _screw_hole();

        translate([0, -20.5, 32])
        _screw_hole();

        translate([0, 70, 48])
        _screw_hole();

        translate([0, -100, 18])
        _screw_hole();

        // back leg side cuts
        rotate([10, 0, 0])
        hull() {
            translate([337/2, -93, 67])
            cube([10, 6, 1], center=true);

            translate([337/2 + 6, -93, 47])
            cube([10, 6, 1], center=true);
        }

        rotate([10, 0, 0])
        hull() {
            translate([-337/2, -93, 67])
            cube([10, 6, 1], center=true);

            translate([-337/2 - 6, -93, 47])
            cube([10, 6, 1], center=true);
        }

        // leg mount holes
        rotate([10, 0, 0]) {
            translate([0, -28, 30])
            hull() {
                cube([6.5, 6.5, 2], center=true);
                cylinder(d=3.2, h=3, $fn=30);
            }

            translate([0, 2, 30])
            hull() {
                cube([6.5, 6.5, 2], center=true);
                cylinder(d=3.2, h=3, $fn=30);
            }

            translate([0, -28, 40])
            cylinder(d=3, h=20, center=true, $fn=30);

            translate([0, 2, 40])
            cylinder(d=3, h=20, center=true, $fn=30);

            #translate([84.5, -28, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

            #translate([84.5, 2, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

            #translate([-84.5, -28, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);

            #translate([-84.5, 2, 40])
            cylinder(d=2.7, h=20, center=true, $fn=30);
        }

        // corner cuts
        translate([180, 133, 0])
        rotate([10, 0, 0])
        rotate([0, 0, 45])
        cube([30, 30, 200], center=true);

        translate([-180, 133, 0])
        rotate([10, 0, 0])
        rotate([0, 0, 45])
        cube([30, 30, 200], center=true);
    }
}

module ace2_pro_spool_holder_right() {
    intersection() {
        _ace2_pro_spool_holder();

        translate([400/2, 0, 0])
        cube([400, 400, 400], center=true);
    }
}

module ace2_pro_spool_holder_left() {
    intersection() {
        _ace2_pro_spool_holder();

        translate([-400/2, 0, 0])
        cube([400, 400, 400], center=true);
    }
}