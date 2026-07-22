use <../../PCParts/common.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/mockups.scad>;

use <../Copperhead/cooling_shroud.scad>;
use <../Copperhead/common.scad>;

use <../CR10_S5/Bondtech_Style_Extruder.scad>;
use <../CubePrometheus/Cube_X_Carriage.scad>;


stl_base_path = "../../_downloaded/";
stl_path = str(
    stl_base_path,
    "Tronxy/Tronxy X5s e3d v6 Mount With Belt Aligner/"
);

bd_stl_path = str(
    stl_base_path,
    "Bondtech Style Extruder/"
);

bambu_stl_path = str(
    stl_base_path,
    "Bambu Lab X1C - P1P - P1S Original Hotend 3D model/"
);

bambuv6_stl_path = str(
    stl_base_path,
    "Bambu Lab Clone V6 Adapter with M3 Nut Inserts/"
);


//_orig_bambu_v6_adapter();

//debug_copperhead_cooling_shroud();
//debug_tronxy_E3D_mount_M4();
//debug_bondtech_style_extruder_mount();
//debug_bondtech_style_extruder();


//tronxy_belt_clip_left_top();
//tronxy_belt_clip_right_top();
//tronxy_belt_clip_left_bottom();
//tronxy_belt_clip_right_bottom();
//tronxy_E3D_mount();
//tronxy_E3D_mount_M4();
//tronxy_E3D_mount_cap();
//tronxy_E3D_M4_mount_cap();
//tronxy_E3D_mount_bondtech_style_extruder();

//new_bambu_v6_adapter();

//tronxy_bondtech_style_extruder_base();
//tronxy_bondtech_style_extruder_lid_M10();

tronxy_delta_p_fan_mount();


module _orig_bambulab_hotend() {
    fname = "Bambulab-Hotend.stl";

    import(
        str(bambu_stl_path, fname), convexity=10
    );
}

module _orig_bambu_v6_adapter() {
    fname = "Bambulab V6 Adaptor.stl";

    translate([-31, -0.1, -9.35])
    import(
        str(bambuv6_stl_path, fname), convexity=10
    );

//    %cylinder(d=4.6, h=20, $fn=30);
}

module debug_copperhead_cooling_shroud() {
    rotate([90, 0, 0])
    tronxy_E3D_mount();

    %translate([33.5, -20, -59.25])
    rotate([0, 0, -90])
    copperhead(block_rotation=90);

    translate([33.5, -41, -56.25])
    new_duct(supports=false);

    translate([26.65, -53, 10.5])
    rotate([-90,0,0])
    tronxy_E3D_mount_cap();
}

module debug_tronxy_E3D_mount_M4() {
    %rotate([-90, 0, 0])
    translate([33.5, -20, -59.25])
    rotate([0, 0, -90])
    copperhead(block_rotation=90);

//    translate([33.5, -57.05, 20])
//    rotate([-90, 0, 0])
//    e3dv6();

    translate([26.65, 10.5, 52.6])
    rotate([180, 0, 0])
    tronxy_E3D_mount_cap();

    translate([33.5, 16, 29.1])
    rotate([180, 0, 0])
    tronxy_E3D_M4_mount_cap();

    intersection() {
        tronxy_E3D_mount_M4();

        translate([100/2 + 33.5, 0, 0])
        cube([100, 100, 100], center=true);
    }
}

module debug_bondtech_style_extruder_mount() {
    // filament path
    color("lightgrey")
    translate([33.5, -20, 0])
    cylinder(d=1.5, h=200, center=true, $fn=20);

    render()
    rotate([90, 0, 0])
    tronxy_E3D_mount_bondtech_style_extruder();

//    render()
//    translate([33.5, -20, -59.25])
//    rotate([0, 0, -90])
//    copperhead(block_rotation=90);

    render()
    translate([38.05, -36.85, 45])
    rotate([90, 0, 180])
    union() {
        translate([0, 0, 28.8])
        rotate([0, 180, 0])
        tronxy_bondtech_style_extruder_lid_M10(bridging=false);

        tronxy_bondtech_style_extruder_base();

        translate([0, 0, 3])
        new_bondtech_latch();
    }

    render()
    translate([33.5, -20, -49.75])
    intersection() {
        union() {
//            %translate([0, 0, 32.65])
//            rotate([0, 0, -90])
//            _orig_bambu_v6_adapter();

            translate([0, 0, 32.65])
            rotate([0, 0, 90])
            new_bambu_v6_adapter();

            rotate([90, 0, -90])
            _orig_bambulab_hotend();

            %cylinder(d=0.3, h=20, $fn=30);
        }

//        translate([0, 100/2, 0])
//        cube([100, 100, 200], center=true);
    }

//    translate([26.65, -53, 10.5])
//    rotate([-90,0,0])
//    tronxy_E3D_mount_cap();

    translate([33.5, -33, -54.8])
    union() {
        translate([20.6, -6.7, 15.2])
        rotate([-90, 0, 0])
        tronxy_delta_p_fan_mount();

        delta_p_duct_mockup();
    }

    color("grey")
    translate([36.5, -40, -5.6])
    rotate([90, 49, 0])
    import(str(
        stl_base_path, "50mm_Radial_fan/50mm_Fan.stl"
    ));
}

module debug_bondtech_style_extruder() {
    tronxy_bondtech_style_extruder_base();

    translate([0, 0, 29])
    rotate([0, 180, 0])
    !tronxy_bondtech_style_extruder_lid_M10(bridging=false);
}

module round_tooth(height) {
    hull() {
        cube([0.95, 0.95, height]);

        translate([0.5, 1, 0])
        cylinder(d=0.95, h=height, $fn=10);
    }
}
    
module tooth(height) {
    cube([1.05, 1.55, height]);
}

module gt2_belt(length=10, height=6) {

    teeth = round(length/2);
    
    cube([length, 0.9, height]);

    for(i = [0:teeth - 1]) {
        translate([i*2, 0, 0])
        tooth(height);
    }
}

module rounded_gt2_belt(
    length, dia, height=6, teeth_inside=true) {
    
    total_len = PI * dia;
    step = 2/(total_len/360);
    steps = round(length/2);
    
    function tooth_pos() = 
        teeth_inside ? dia/2 - 1.57 + 0.9/2 : dia/2 - 0.9/2;

    function start_angle() = -steps/2 * step;
        
    translate([length/2, -dia/2, 0])
    union() {
        difference() {
            cylinder(d=dia + 0.9, h=height, $fn=60);

            translate([0, 0, -0.1])
            cylinder(d=dia - 0.9, h=height + 1, $fn=60);

            rotate([0, 0, start_angle()])
            translate([0, -(dia + 1)/2, -0.1])
            cube([dia + 1, dia + 1, height + 1]);

            rotate([0, 0, -start_angle()])
            translate([-(dia + 1), -(dia + 1)/2, -0.1])
            cube([dia + 1, dia + 1, height + 1]);
        }
        for (i = [0:steps - 1]) {
            rotate([0, 0, step*i + start_angle()])
            translate([0, tooth_pos(), 0])
            translate([-1/2, 0, 0])
            tooth(height);
        }
    }
}


module tronxy_belt_clip_left_top() {
    difference() {
        cube([20, 9, 20]);

        translate([0, 3.3, 12.6])
        rotate([0, 0, 14])
        mirror([0, 1, 0])
        rounded_gt2_belt(18, 60, 9, teeth_inside=false);

        translate([13.5, -0.1, -0.1])
        cube([3.5, 3.5, 20.1]);

        translate([13.5, 1.35, -0.1])
        cube([4.5, 2.05, 20.1]);

        translate([15, -0.1, 14.5])
        cube([6, 3.5, 10]);

        translate([13, -0.1, 13])
        cube([2, 3.5, 10]);

        translate([11, -0.1, 13])
        cube([4, 1.6, 10]);

        rotate([0, 45, 0])
        cube([10, 20, 10], center=true);

        translate([24.5, 20, -0.1])
        cylinder(d=31, h=30, $fn=70);

        rotate([45, 0, 0])
        cube([29, 3, 10], center=true);
    }
}

module tronxy_belt_clip_right_top() {
    difference() {
        hull() {
            cylinder(d=11, h=20, $fn=30);

            translate([4, -11/2 - 9, 0])
            cube([14, 15, 20]);
        }
        cylinder(d=4.3, h=50, center=true, $fn=30);

        translate([15.5, -36, -0.1])
        cylinder(d=50, h=25, $fn=80);

        translate([20, 10.5, -0.1])
        cylinder(d=30, h=25, $fn=80);

        translate([-12 + 5.1, -8.7, 15.5])
        cube([12, 18, 10]);

        translate([0, -9, 20 - 7.8])
        rotate([0, 0, 8])
        mirror([0, 0, 0])
        rounded_gt2_belt(28, 80, 9);

        translate([16, 0, 0])
        rotate([0, 35, 0])
        cube([10, 30, 30], center=true);
    }
}

module tronxy_belt_clip_left_bottom() {
    difference() {
        union() {
            hull() {
                cylinder(d=11, h=11, $fn=30);

                translate([4.64, -6, 0])
                cube([13, 20, 11]);
            }
            cylinder(d=11, h=15.5, $fn=30);

            translate([5, -6, 0])
            cube([8, 11, 19]);
        }
        cylinder(d=4.3, h=49, center=true, $fn=30);

        translate([13.5, 55, -0.1])
        cylinder(d=88, h=25, $fn=150);

        translate([22, -10, -0.1])
        cylinder(d=30, h=25, $fn=50);

        translate([0, 8, -0.8])
        rotate([0, 0, -6])
        mirror([0, 1, 0])
        rounded_gt2_belt(18, 120, 8);
    }
}

module tronxy_belt_clip_right_bottom() {
    difference() {
        union() {
            cube([20, 9, 14]);

            //translate([10.5, -2, 0])
            //cube([9.5, 10, 14]);
        }

        translate([0, 8.1, -0.8])
        rotate([0, 0, -10])
        mirror([0, 1, 0])
        rounded_gt2_belt(30, 60, 8, teeth_inside=false);

        translate([3, -0.1, -0.1])
        cube([3.5, 3.5, 20]);

        translate([2, 1.35, -0.1])
        cube([4.5, 2.05, 20]);

        translate([4, -1, -0.1])
        cube([6.5, 2.4, 20]);
        
        translate([19, 25, -0.1])
        cylinder(d=33.5, h=30, $fn=70);

        translate([20, 0, 14])
        rotate([0, 45, 0])
        cube([7, 20, 7], center=true);
    }
}

module tronxy_E3D_mount() {

    union() {
        difference() {
        
            import(str(
                stl_path,
                "tronxy_x5s_e3d_v6_mtg_+_belt_aligner_r1.STL"
            ), convexity=10);

            translate([-23.5, 3, 0])
            cube([20, 50, 25]);

            translate([70.5, 4, 0])
            cube([20, 50, 25]);

            translate([72.5, -4, 0])
            cube([20, 50, 25]);

            translate([14, -17.2, 9.10])
            cube([40, 10, 25]);

            translate([14, -11.3, 5])
            rotate([45, 0, 0])
            cube([40, 5.8, 25]);

            translate([0, 30, 0])
            rotate([45, 0, 0])
            cube([200, 9, 9], center=true);

        }

        translate([1.5, 2.61, 11.5])
        rotate([90, 0, 0])
        tube(12, 0.6, 3.8, $fn=100);

        hull() {
            translate([8, 15, 12.95])
            cube([0.8, 20, 0.1], center=true);

            translate([1.61, 15, 19.95])
            cube([0.1, 20, 0.1], center=true);

            translate([8.35, 15, 19.95])
            cube([0.1, 20, 0.1], center=true);
        }

        hull() {
            translate([8, 15, 12.95])
            cube([0.8, 20, 0.1], center=true);

            translate([8, 15, 2.95])
            cube([0.8, 20, 0.1], center=true);
        }

        hull() {
            translate([67, 15, 2.5])
            cube([1, 22.1, 1], center=true);

            translate([65, 15, 5])
            cube([1, 22.1, 1], center=true);

            translate([72.45, 15, 7.28])
            cube([0.1, 22.1, 1], center=true);

            translate([72.45, 15, 2.5])
            cube([0.1, 22.1, 1], center=true);
        }
    }

    // debug
    %translate([1.5, 6, 11.5])
    rotate([-90, 180, 0])
    tronxy_belt_clip_left_bottom();

    %translate([65.5, 6, 11.5])
    rotate([-90, 0, 0])
    tronxy_belt_clip_right_top();

    %translate([-16.4, 5.5, 3.3])
    rotate([-90, 0, 0])
    tronxy_belt_clip_left_top();

    %translate([63.4, 6, 3.3])
    rotate([-90, 0, 0])
    tronxy_belt_clip_right_bottom();

    // hole pos debug
    %translate([13.5, 8.5, 0])
    cylinder(d=4.5, h=20, center=true, $fn=30);

    %translate([53.5, 8.5, 0])
    cylinder(d=4.5, h=20, center=true, $fn=30);

    %translate([26.5, -11.5, 0])
    cylinder(d=3, h=20, center=true, $fn=30);

    %translate([40.5, -11.5, 0])
    cylinder(d=3, h=20, center=true, $fn=30);

}

module tronxy_E3D_mount_M4() {
    difference() {
        union() {
            tronxy_E3D_mount();

            difference() {
                translate([33.5, 14.4, 15/2 + 5])
                cube([33, 18, 15], center=true);

                translate([33.5, 2, 20])
                rotate([-90, 0, 0])
                cylinder(d=16.1, h=5, $fn=200);

                translate([33.5 + 20, 8.5])
                cylinder(d=12, h=30);

                translate([33.5 - 20, 8.5])
                cylinder(d=12, h=30);

            }
        }

        translate([33.5, 14.4 + 9, 20])
        rotate([-90, 0, 0])
        cylinder(d1=24, d2=54, h=20, $fn=100);

        translate([33.5, 1, 20])
        rotate([-90, 0, 0])
        cylinder(d=4.3, h=27, $fn=60);

        translate([33.5, 10.7, 20])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, $fn=60);

        translate([33.5, 18, 20])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, $fn=60);

        translate([33.5 + 8, 16, 0]) {
            cylinder(d=3.4, h=60, $fn=30);

            M3_nut_tapering(
                h=10.4, cone=true,
                bridging=false
            );
        }

        translate([33.5 + -8, 16, 0]) {
            cylinder(d=3.4, h=60, $fn=30);

            M3_nut_tapering(
                h=10.4, cone=true,
                bridging=false
            );
        }
    }
}

module tronxy_E3D_mount_cap() {
    difference() {
        import(str(stl_path,
                "tronxy_x5s_e3d_v6_mtg_cap_r1.STL"),
            convexity=10);

        translate([10, 27.7, 25])
        cube([50, 20, 20], center=true);
    }
}

module tronxy_E3D_M4_mount_cap() {
    difference() {
        translate([0, 0, 9])
        rotate([180, 0, 0])
        intersection() {
            chamfered_cube(
                24, 15, 20, 3, center=true
            );

            cylinder(d=60, h=9);
        }

        translate([8, 0, 0])
        cylinder(d=3.4, h=60, center=true, $fn=30);

        translate([-8, 0, 0])
        cylinder(d=3.4, h=60, center=true, $fn=30);

        translate([0, 0, 9])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=60, center=true, $fn=30);

        translate([0, 3.65, 9])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);
        
        translate([0, -3.65, 9])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);
    }
}

module tronxy_E3D_mount_bondtech_style_extruder() {
    difference() {
        union() {
            tronxy_E3D_mount();

//            translate([35, 30 - 8/2, 25/2 + 7])
//            rotate([90, 0, 0])
//            chamfered_cube_side(
//                60, 25, 8, 4, center=true
//            );
//
//            translate([33, 30 - 14/2, 25/2 + 7])
//            rotate([90, 0, 0])
//            chamfered_cube_side(
//                36, 25, 14, 2, center=true
//            );
//
//            translate([33, 20 - 14/2, 15/2 + 7])
//            rotate([90, 0, 0])
//            chamfered_cube_side(
//                30, 15, 14, 3, center=true
//            );

            translate([45, 22, 24.7/2 + 4.1])
            chamfered_cube_side(9, 10, 24.7, 2, center=true);

            translate([33.5, 6.5, 19/2 + 4])
            rotate([90, 0, 0])
            chamfered_cube_side(25, 19, 2, 8, center=true);

            translate([33.5, 9.5, 19/2 + 4])
            rotate([90, 0, 0])
            chamfered_cube_side(25, 19, 2, 8, center=true);

            translate([33.5, 8.5 + 20/2, 19/2 + 4])
            chamfered_cube(9, 20, 19, 2, center=true);
        }

        // extruder cut
        translate([37.5, 40/2 + 23.9, 40/2 + 7.9])
        chamfered_cube_side(
            42.5, 40, 40, 3, center=true
        );

        // latch cuts
        translate([16, 31, 15.4])
        rotate([0, 0, 45])
        cube([5, 10, 4], center=true);

        translate([16, 31, 29.4])
        rotate([0, 0, 45])
        cube([5, 10, 11], center=true);

        // top mount holes
        translate([13.05, 30, 10.8])
        rotate([90, 0, 0])
        cylinder(d=3.1, h=30, center=true, $fn=30);

        translate([60.05, 30, 16.8])
        rotate([90, 0, 0])
        cylinder(d=3.1, h=30, center=true, $fn=30);

        translate([13.05, 23.5, 10.8 + 20/2 - 6/2])
        cube([6, 2.2, 20], center=true);

        translate([13.05, 23.5, 0])
        cube([2.2, 2.2, 40], center=true);

        translate([60.05, 23.5, 16.8 + 20/2 - 6/2])
        cube([6, 2.2, 20], center=true);

        translate([60.05, 23.5, 0])
        cube([2.2, 2.2, 40], center=true);

        // front mount hole
        translate([45, 21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=30);

        translate([45, 21, -1])
        M3_nut_tapering(7);

        // filament path
        translate([33.5, 0, 20])
        rotate([90, 0, 0])
        cylinder(d=2, h=200, center=true, $fn=30);

        hull() {
            translate([33.5, 6.5, 20])
            rotate([90, 0, 0])
            cylinder(d=4.3, h=4, $fn=30);

            translate([33.5, 6.5, 30])
            rotate([90, 0, 0])
            cylinder(d=4.3, h=4, $fn=30);
        }

        translate([33.5, 9.5, 20])
        rotate([-90, 0, 0])
        cylinder(d=4.3, h=100, $fn=30);

    }
}

module new_bambu_v6_adapter() {
    difference() {
        union() {
            intersection() {
                _orig_bambu_v6_adapter();

                translate([0, 0, 60/2 + 1.2])
                chamfered_cube_side(
                    17, 16, 60, 1, center=true
                );
            }

            tube(7, 22.3, (7 - 4.4)/2, $fn=60);

            translate([0, 0, 8.4/2 + 1.2])
            chamfered_cube_side(
                17, 16, 8.4, 0.8, center=true
            );
        }

        translate([0, -3.95])
        rotate([0, 90, 0])
        chamfered_cube_side(15.6, 20, 7.7, 1, center=true);

        translate([0, 0, 8])
        cylinder(d=4.4, h=100, $fn=60);

        translate([0, -3.3, 4.15])
        rotate([0, 90, 0])
        cylinder(d=3, h=30, center=true, $fn=30);

        translate([0, 4, 4.15])
        rotate([0, 90, 0])
        cylinder(d=3, h=30, center=true, $fn=30);

        translate([16, -3.3, 4.15])
        rotate([0, 90, 0])
        cylinder(d=6.2, h=20, center=true, $fn=30);

        translate([16, 4, 4.15])
        rotate([0, 90, 0])
        cylinder(d=6.2, h=20, center=true, $fn=30);

        translate([-6, -3.3, 4.15])
        rotate([0, -90, 0])
        M3_nut(5);

        translate([-6, 4, 4.15])
        rotate([0, -90, 0])
        M3_nut(5);
    }
}

module tronxy_bondtech_style_extruder_base() {
    difference() {
        union() {
            new_bondtech_base();

            translate([-7, -23, 8/2])
            chamfered_cube_side(9, 10, 8, 2, center=true);
        }

        translate([-7, -24, 0])
        cylinder(d=3.2, h=100, center=true, $fn=30);

        translate([-7, -24, 0])
        chamfered_cylinder(6.2, 8, 1.5, center=true, $fn=30);
    }
}

module tronxy_bondtech_style_extruder_lid_M10(bridging=true) {
    module _lid() {
        union () {
            difference() {
                new_bondtech_lid_M10(bridging=bridging);

                hull() {
                    translate([-23, -13.3, 5.6/2])
                    cube([3, 4, 5.6], center=true);

                    translate([-23, -11, 8.6/2])
                    cube([3, 1, 8.6], center=true);
                }
            }

            625zz_lid_part();
        }
    }

    difference() {
        union () {
            _lid();

            // extra mount points
            translate([-23.4, -10, 5.4/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                10, 5.4, 10, 1, center=true
            );

            difference() {
                hull() {
                    translate([20, -12.5, 6/2 + 6.5])
                    rotate([90, 0, 0])
                    chamfered_cube_side(
                        10, 6, 5, 1, center=true
                    );

                    translate([19, -12.5, 2.5])
                    cube([1, 5, 1], center=true);
                }

                translate([17, 0, 1.2])
                rotate([90, 0, 0])
                cylinder(d=7, h=50, center=true, $fn=30);

                translate([15.4, -15.4, 0])
                cylinder(d=4, h=40, center=true, $fn=30);
            }
        }

        translate([-25, 0, 5.4/2])
        rotate([90, 0, 0])
        cylinder(d=3.1, h=40, center=true, $fn=30);

        translate([22, -12, 5.4/2 + 6])
        rotate([90, 0, 0])
        cylinder(d=3.1, h=20, center=true, $fn=30);
    }
}

module _delta_p_fan_mount_form() {
    union() {
        hull() {
            translate([18.65, 0, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );

            translate([2, -5, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );

            translate([-2, -7, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );

            translate([14, -30, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );
        }

        hull() {
            translate([-2, -6, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );

            translate([-36, -4, 0])
            chamfered_cylinder(
                6, 4, 0.5, $fn=30
            );

            translate([-36, -6.5, 0])
            chamfered_cylinder(
                6, 4, 0.5, $fn=30
            );
        }

        hull() {
            translate([19.1, -57.5, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );

            translate([14, -27.5, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );

            translate([-9, -17.5, 0])
            chamfered_cylinder(
                10, 4, 0.5, $fn=30
            );
        }

        translate([-15.4, -22, 4/2])
        chamfered_cube(40, 34, 4, 0.5, center=true);
    }
}

module tronxy_delta_p_fan_mount() {
    //translate([-119.2, -93.23, 143.36])
    //rotate([-90, 0, 0])
//    !translate([-140, -150])
//    import(str(
//        stl_path,
//        "X2 Delta P Duct V2R2.2/",
//        "V2R2.2 Cover.stl"
//    ), convexity=10);

    module _infill() {
        intersection() {
            translate([-90, -60, 0])
            for(i=[0:20]) {
                for(j=[0:20]) {
                    translate([
                        i*8 + (j%2 ? 0 : 4),
                        j*7,
                        1
                    ])
                    rotate([0, 0, 30])
                    hull() {
                        cylinder(
                            d=7, h=7,
                            center=true, $fn=6
                        );

                        cylinder(
                            d=1, h=11,
                            center=true
                        );
                    }
                }
            }

            difference() {
                translate([0, 0, -11/2 + 1])
                linear_extrude(11)
                offset(-3)
                projection(cut=true)
                _delta_p_fan_mount_form();

                translate([18.65, 0, 0])
                cylinder(d=10, h=20, center=true, $fn=30);

                translate([2, -5, 0])
                cylinder(d=10, h=20, center=true, $fn=30);

                translate([19.1, -57.5, 0])
                cylinder(d=10, h=20, center=true, $fn=30);

                translate([-31.15, -38.15, 0])
                cylinder(d=9, h=30, center=true, $fn=30);

                translate([-9.15, -38.15, 0])
                cylinder(d=9, h=30, center=true, $fn=30);

                translate([-34, -5.1, 0])
                cylinder(
                    d=10, h=20,
                    center=true, $fn=30
                );
            }
        }
    }

    difference() {
        union() {
            _delta_p_fan_mount_form();

            translate([-27, -50.1, -13])
            intersection() {
                tronxy_E3D_mount_cap();

                translate([7, 12, 28])
                chamfered_cube(
                    32, 15, 19, 5, center=true
                );
            }

            translate([-31.15, -38.15, 0])
            chamfered_cylinder(9, 10, 0.5, $fn=50);

            translate([-9.15, -38.15, 0])
            chamfered_cylinder(9, 10, 0.5, $fn=50);

            translate([-20.15, -38.15, 10/2])
            cube([22, 7, 10], center=true);
        }

        translate([-34, -5.1, 0])
        cylinder(d=3.5, h=20, center=true, $fn=20);

        translate([-34, -5.1, 2])
        M3_nut();

        translate([19.1, -57.5, 0])
        cylinder(d=3.7, h=10, center=true, $fn=20);

        translate([19.1, -57.5, 2])
        M3_nut();

        #translate([1.7, -5.2, 0])
        cylinder(d=3.7, h=10, center=true, $fn=20);

        translate([1.7, -5.2, 2])
        M3_nut();

        translate([18.65, 0, 0])
        cylinder(d=3.7, h=10, center=true, $fn=20);

        translate([18.65, 0, 2])
        M3_nut();

        translate([-31.15, -38.15, 0])
        cylinder(d=3, h=30, center=true, $fn=30);

        translate([-9.15, -38.15, 0])
        cylinder(d=3, h=30, center=true, $fn=30);

        translate([-31.15, -38.15, -8])
        chamfered_cylinder(6.2, 10, 1.6, $fn=30);

        translate([-9.15, -38.15, -8])
        chamfered_cylinder(6.2, 10, 1.6, $fn=30);

        _infill();
    }
}