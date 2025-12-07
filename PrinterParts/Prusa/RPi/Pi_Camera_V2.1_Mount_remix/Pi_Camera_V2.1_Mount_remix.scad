use <../../../../Dollo/NEW_long_ties/include.scad>;
use <../../../../Rpi/common.scad>;


stl_base_path = "../../../../_downloaded/";
p_stl_path = str(
    stl_base_path,
    "Prusa/"
);
r_stl_path = str(
    p_stl_path,
    "Pi Camera V2.1 Mount/"
);


//%_orig_x_axis_bracket_pi_camera_mount_bridge_x_axis();
//_orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed();
//_orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed_tk();
//_orig_x_axis_camer_bracket_camera_cover_v4();

//debug_mount();
//debug_extended_mount();
//debug_camera_cover();

// Use TinkerCad if stl fixing doesn't work
// TinkerCad stuff for regular size mount
//tk_x_axis_bracket_pi_camera_mount_bridge_x_axis();
//tk_fixes();
//tk_deletions();

// TinkerCad stuff for extended mount
//tk_x_axis_bracket_pi_camera_mount_bridge_x_axis_extended();
//tk_fixes_extended();
//tk_deletions();

//camera_mount();
//camera_mount_bridge();
//camera_mount_extended();
//camera_mount_bridge_extended();
//camera_cover_m2_screws();
//camera_cover_base_m2_screws();
//camera_cover_spacer_m2_screws();


module _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis() {
    translate([20, 10, 39.9292])
    rotate([0, 180, 0])
    import(
        str(r_stl_path, "mk3s_x-axis_bracket_pi_camera_mount_bridge_x-axis.stl"),
        convexity=10
    );
}

module _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed() {
    translate([145, -95, 54.3])
    rotate([0, 180, 0])
    import(
        str(r_stl_path, "mk3s_x-axis_bracket_pi_camera_mount_bridge_x-axis_fixed.stl"),
        convexity=10
    );
}

module _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed_tk() {
    translate([-13.02, 15.7, 28.72])
    rotate([0, 180, 0])
    import(
        str(r_stl_path, "mk3s_x-axis_bracket_pi_camera_mount_bridge_x-axis_fixed_tk.stl"),
        convexity=10
    );
}

module _orig_x_axis_camer_bracket_camera_cover_v4() {
    translate([-38.9, 27.5, 64])
    rotate([0, 90 - 15, 0])
    import(
        str(r_stl_path, "mk3s_x-axis_camer_bracket_camera_cover-v4.stl"),
        convexity=10
    );
}

module debug_mount() {
    difference() {
        union() {
            tk_x_axis_bracket_pi_camera_mount_bridge_x_axis();
            tk_fixes();
        }
        tk_deletions();
    }

    translate([-44, -21.7, 8.7])
    rotate([0, 0, -2])
    debug_camera_cover();
}

module debug_extended_mount() {
    difference() {
        union() {
            tk_x_axis_bracket_pi_camera_mount_bridge_x_axis_extended();
            tk_fixes_extended();
        }
        tk_deletions_extended();
    }

    translate([-44, -21.7, 8.7])
    rotate([0, 0, -3])
    debug_camera_cover();
}

module debug_camera_cover() {
    rotate([0, 90, 0])
    intersection() {
        camera_cover_base_m2_screws();

//        translate([0, 100/2, 0])
//        cube([100, 100, 100], center=true);
    }

    translate([-9.3, 0, 0])
    rotate([0, 90, 0])
    intersection() {
        camera_cover_m2_screws();

//        translate([0, 100/2, 0])
//        cube([100, 100, 100], center=true);
    }

    translate([-2.8, 0, -2])
    rotate([-90, 0, 90])
    intersection() {
        _mock_camera_v13();

//        translate([100/2 + 5, 0, 0])
//        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 0])
    rotate([0, 90, 180])
    camera_cover_spacer_m2_screws();
}

module _positioning_parts() {
    // positioning aids for tinkercad
    translate([0, 100, 5/2])
    cube([5, 5, 5], center=true);

    translate([100, -100, 5/2])
    cube([5, 5, 5], center=true);

    translate([-100, -100 , 5/2])
    cube([5, 5, 5], center=true);
}

module tk_x_axis_bracket_pi_camera_mount_bridge_x_axis() {
    union() {
        _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed();
        _positioning_parts();
    }
}

module tk_x_axis_bracket_pi_camera_mount_bridge_x_axis_extended() {
    // export to tinkercad
    union() {
        intersection() {
            _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed_tk();

            translate([0, -100/2 + 3.8, 0])
            cube([200, 100, 100], center=true);
        }

        translate([0, 11, 0])
        intersection() {
            _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed_tk();

            translate([0, 100/2, 0])
            cube([200, 100, 100], center=true);
        }

        translate([0, 14, 0])
        intersection() {
            _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed_tk();

            translate([0, -4, 0])
            cube([50, 5, 100], center=true);
        }

        scale([1, 5, 1])
        intersection() {
            _orig_x_axis_bracket_pi_camera_mount_bridge_x_axis_fixed_tk();

            translate([0, 3/2, 0])
            cube([200, 3, 100], center=true);
        }

        _positioning_parts();
    }
}

module tk_fixes() {
    // export to tinkercad
    // fix bridge
//    hull() {
//        translate([-0.0025, 26.6, 5.2884/2])
//        cube([10.85, 1, 5.2884], center=true);
//
//        translate([-0.0025, 29, 5.2884/2])
//        cube([6, 1, 5.2884], center=true);
//    }

    intersection() {
        translate([-38, -22.25, 5.2884/2])
        rotate([90, 0, -2])
        cylinder(d=8, h=10, center=true, $fn=40);

        translate([0, 0, 5.2884/2])
        cube([200, 200, 5.2884], center=true);
    }

    _positioning_parts();
}

module tk_fixes_extended() {
    // export to tinkercad
    // fix bridge
//    hull() {
//        translate([-0.0025, 41.6, 5.2884/2])
//        cube([10.85, 1, 5.2884], center=true);
//
//        translate([-0.0025, 44, 5.2884/2])
//        cube([6, 1, 5.2884], center=true);
//    }

//    // hinge body
    intersection() {
        translate([-38, -22.25, 5.2884/2])
        rotate([90, 0, -3])
        cylinder(d=8, h=10, center=true, $fn=40);

        translate([0, 0, 5.2884/2])
        cube([200, 200, 5.2884], center=true);
    }

    _positioning_parts();
}

module tk_deletions() {
    // export to tinkercad and use as hole
    // positioning aid deletion
    translate([0, 100, 10/2])
    cube([10, 10, 10], center=true);

    translate([100, -100, 10/2])
    cube([10, 10, 10], center=true);

    translate([-100, -100, 10/2])
    cube([10, 10, 10], center=true);

    // hinge cuts
    difference() {
        translate([-43.73, -17.5, 10.2])
        rotate([0, 15, 0])
        cube([8.1, 30.5, 60], center=true);

        intersection() {
            translate([-38, -22.25, 5.2884/2])
            rotate([90, 0, -2])
            cylinder(d=8, h=10, center=true, $fn=40);

            translate([0, 0, 5.2884/2])
            cube([200, 200, 5.2884], center=true);
        }
    }

    difference() {
        translate([-38, -22.25, 5.2884/2])
        rotate([0, 0, -2])
        hull() {
            rotate([90, 0, 0])
            cylinder(d=8.3, h=50, center=true, $fn=40);

            translate([-10, 0, 0])
            cube([10, 50, 7], center=true);
        }

        translate([-38, -22.25, 5.2884/2])
        rotate([90, 0, -2])
        hull() {
            cylinder(d=8, h=10, center=true, $fn=40);

            translate([20, 0, 0])
            cube([10, 50, 7], center=true);
        }
    }

    translate([-38, -22.25, 5.2884/2])
    rotate([90, 0, -2])
    cylinder(d=3.2, h=20, center=true, $fn=40);
}

module tk_deletions_extended() {
    // export to tinkercad and use as hole
    // positioning aid deletion
    translate([0, 100, 10/2])
    cube([10, 10, 10], center=true);

    translate([100, -100, 10/2])
    cube([10, 10, 10], center=true);

    translate([-100, -100, 10/2])
    cube([10, 10, 10], center=true);

    // hinge cuts
    difference() {
        translate([-43.73, -17.5, 10.2])
        rotate([0, 15, 0])
        cube([8.1, 30.5, 60], center=true);

        intersection() {
            translate([-38, -22.25, 5.2884/2])
            rotate([90, 0, -3])
            cylinder(d=8, h=10, center=true, $fn=40);

            translate([0, 0, 5.2884/2])
            cube([200, 200, 5.2884], center=true);
        }
    }

    difference() {
        translate([-38, -22.25, 5.2884/2])
        rotate([0, 0, -3])
        hull() {
            rotate([90, 0, 0])
            cylinder(d=8.3, h=50, center=true, $fn=40);

            translate([-10, 0, 0])
            cube([10, 50, 7], center=true);
        }

        translate([-38, -22.25, 5.2884/2])
        rotate([90, 0, -3])
        hull() {
            cylinder(d=8, h=10, center=true, $fn=40);

            translate([20, 0, 0])
            cube([10, 50, 7], center=true);
        }
    }

    translate([-38, -22.25, 5.2884/2])
    rotate([90, 0, -3])
    cylinder(d=3.2, h=20, center=true, $fn=40);
}

module camera_mount() {
    intersection() {
        camera_mount_bridge();

        translate([0, -23, 0])
        cube([200, 100, 200], center=true);
    }
}

module camera_mount_bridge() {
    difference() {
        union() {
            tk_x_axis_bracket_pi_camera_mount_bridge_x_axis();
            tk_fixes();
        }
        tk_deletions();
    }
}

module camera_mount_extended() {
    intersection() {
        camera_mount_bridge_extended();

        translate([0, -12, 0])
        cube([200, 100, 200], center=true);
    }
}

module camera_mount_bridge_extended() {
    difference() {
        union() {
            tk_x_axis_bracket_pi_camera_mount_bridge_x_axis_extended();
            tk_fixes_extended();
        }
        tk_deletions_extended();
    }
}

module camera_cover_m2_screws() {
    difference() {
        union() {
            _orig_x_axis_camer_bracket_camera_cover_v4();

            translate([-0.03, 10.5, 1])
            cylinder(d=6.5, h=3, $fn=30);

            translate([-0.03 + 12, 10.5, 1])
            cylinder(d=6.5, h=3, $fn=30);

            translate([-0.03, -10.5, 1])
            cylinder(d=6.5, h=3, $fn=30);

            translate([-0.03 + 12, -10.5, 1])
            cylinder(d=6.5, h=3, $fn=30);
        }

        // nub delete
        translate([6, 0, 10/2 + 5.5])
        chamfered_cube_side(
            17, 25.95, 10, 1, center=true
        );

        // screw holes
        translate([-0.03, 10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        translate([-0.03 + 12, 10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        translate([-0.03, -10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        translate([-0.03 + 12, -10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        // screw head holes
        translate([-0.03, 10.5, -1.4])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        translate([-0.03 + 12, 10.5, -1.4])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        translate([-0.03, -10.5, -1.4])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        translate([-0.03 + 12, -10.5, -1.4])
        chamfered_cylinder(
            4, 4, 1, $fn=20
        );

        // camera hole
        hull() {
            translate([0, 0, 0])
            cylinder(d1=12.1, d2=6.1, h=3, $fn=60);

            translate([1, 0, 0])
            cylinder(d1=12.1, d2=6.1, h=3, $fn=60);
        }
    }
}

module camera_cover_base_m2_screws() {
    //%camera_cover_m2_screws();

    difference() {
        union() {
            hull() {
                translate([4.55, 0, 2/2])
                cube([25.1, 30.15, 2], center=true);

                translate([0, 0, 2/2])
                cube([25.25, 21, 2], center=true);
            }

            hull() {
                translate([6, 0, 8/2 + 2])
                rotate([90, 0, 0])
                cylinder(d=8, h=20, center=true, $fn=40);

                translate([6, 0, 1])
                cube([16, 20, 1], center=true);
            }

            translate([-0.03, 10.5, 1])
            cylinder(d=5, h=4, $fn=30);

            translate([-0.03 + 12, 10.5, 1])
            cylinder(d=5, h=4, $fn=30);

            translate([-0.03, -10.5, 1])
            cylinder(d=5, h=4, $fn=30);

            translate([-0.03 + 12, -10.5, 1])
            cylinder(d=5, h=4, $fn=30);
        }
        // hinge cut
        hull() {
            translate([6, 0, 8/2 + 2])
            rotate([90, 0, 0])
            cylinder(d=8.4, h=10.2, center=true, $fn=40);

            translate([6, 0, 10])
            cube([18, 10.2, 1], center=true);
        }

        translate([6, 0, 8/2 + 2])
        rotate([90, 0, 0])
        cylinder(d=3.2, h=60, center=true, $fn=40);

        translate([6, -10 + 3, 8/2 + 2])
        rotate([90, 0, 0])
        cylinder(d=6, h=10, $fn=40);

        translate([6, 10 - 3, 8/2 + 2])
        rotate([-90, 30, 0])
        M3_nut(3.2, cone=false);

        // screw holes
        translate([-0.03, 10.5, 0])
        cylinder(d=1.9, h=20, center=true, $fn=30);

        translate([-0.03 + 12, 10.5, 0])
        cylinder(d=1.9, h=20, center=true, $fn=30);

        translate([-0.03, -10.5, 0])
        cylinder(d=1.9, h=20, center=true, $fn=30);

        translate([-0.03 + 12, -10.5, 0])
        cylinder(d=1.9, h=20, center=true, $fn=30);
    }
}

module camera_cover_spacer_m2_screws() {
    difference() {
        union() {
            translate([-0.03, 10.5, 0])
            cylinder(d=4.2, h=2.8, $fn=30);

            translate([-0.03 + 12, 10.5, 0])
            cylinder(d=4.2, h=2.8, $fn=30);

            translate([-0.03, -10.5, 0])
            cylinder(d=4.2, h=2.8, $fn=30);

            translate([-0.03 + 12, -10.5, 0])
            cylinder(d=4.2, h=2.8, $fn=30);

            translate([0, 0, 1/2])
            cube([1.5, 20, 1], center=true);

            translate([12, 0, 1/2])
            cube([1.5, 20, 1], center=true);

            translate([12/2, 10.5, 1/2])
            cube([10, 1.5, 1], center=true);

            translate([12/2, -10.5, 1/2])
            cube([10, 1.5, 1], center=true);
        }

        translate([-0.03, 10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        translate([-0.03 + 12, 10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        translate([-0.03, -10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);

        translate([-0.03 + 12, -10.5, 0])
        cylinder(d=2.3, h=20, center=true, $fn=30);
    }
}