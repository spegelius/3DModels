include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/mockups.scad>;
use <../../lib/bearings.scad>;
use <../Tronxy/Tronxy_X5S.scad>;
use <mockups.scad>;
use <drag_chain.scad>;

stl_base_path = "../../_downloaded/";
dc_stl_path = str(
    stl_base_path,
    "Bondtech Style Extruder/"
);


//original_extruder_assembly();
//_lid_form();
//_orig_lid_M10();
//debug();
//debug_volcano();
//debug_pcb_mount();
//debug_extruder();

//new_lid_M10(bridging=true);
//new_lid_M10(bridging=false);
//new_lid_M10_soluble_supports();
//new_lid_M10_nonsoluble_supports();

//625zz_lid_part();

//cr_extruder_carriage_mount();
//cr_extruder_carriage_mount_e3d();

//e3d_volcano_mount_1();
//e3d_volcano_mount_2();

//e3d_neck_filler();

//bondtech_neck_filler();

//cable_pcb_mount();
//cable_pcb_clamp();
//cable_pcb_mount_adapter();

//drag_chain_arm();
//drag_chain_mount();
//drag_chain_support();
drag_chain_support_level();


module _orig_lid_M10() {
    fname =
        "Lid__M10_Threaded_Fittings_v3.stl";

    translate([0, 0, 88.56])
    rotate([0, 180, 0])
    translate([319.5, 173.7, 0])
    import(
        str(dc_stl_path, fname), convexity=10
    );
}

module _orig_base() {
    fname2 =
        "Base_v3.stl";

    translate([319.5, 173.7, -59.55])
    rotate([0, 0, 0])
    import(
        str(dc_stl_path, fname2), convexity=10
    );
}

module _v6_duct() {
    fname = "V6.6_Duct.stl";
    stl_path = str(
        stl_base_path,
        "E3D-v6_fan_duct/"
    );

    import(
        str(stl_path, fname), convexity=10
    );
}

module _e3d_volcano_5015_duct() {
    fname = "e3d-5015volcano.stl";
    stl_path = str(
        stl_base_path,
        "E3D_Volcano_5015_fan_shroud/"
    );

    import(
        str(stl_path, fname), convexity=10
    );
}

module _e3d_volcano_5015_duct_remix() {
    fname = "e3d_volcano_fan_duct.stl";
    stl_path = str(
        "../../",
        "E3D_Volcano_fan_duct_remix/"
    );

    import(
        str(stl_path, fname), convexity=10
    );
}

module _orig_latch() {
    fname3 =
        "Latch_v3.stl";

    rotate([0, 0, -2])
    translate([319.5, 174.2, -59.55])
    import(
        str(dc_stl_path, fname3), convexity=10
    );
}

module original_extruder_assembly() {

    translate([0, 0, 29])
    rotate([0, 180, 0])
    _orig_lid_M10();

    _orig_base();

    _orig_latch();
}

module debug() {
    mock_creality_x_carriage();

    translate([16.6, -10.5, -48.2])
    mock_creality_hotend();

    #translate([16.6, -10.5, -26])
    cylinder(d=2, h=60, $fn=30);

    translate([21.1, -27.5, 46])
    rotate([90, 0, 180])
    original_extruder_assembly();

    translate([58 - 20, -12/2 + 9, 11.5])
    rotate([0, -90, 0])
    cr_extruder_carriage_mount();

    translate([-24.3, -3.5, 50.2])
    rotate([0, -52.5, 0])
    debug_pcb_mount();

    translate([13, 9, 61.5])
    rotate([90, 0, 90])
    drag_chain_arm();
}


module debug_volcano() {
//    mock_creality_x_carriage();

    translate([16.6, -15.6, -48.2])
    rotate([0, 0, 0])
    e3d_Volcano();

//    #translate([16.6, -15.6, -26])
//    cylinder(d=2, h=60, $fn=30);
//
//    translate([21.1, -32.6, 46])
//    rotate([90, 0, 180])
//    original_extruder_assembly();
//
//    translate([58 - 20, -14.5/2 + 9, 11.5])
//    rotate([0, -90, 0])
//    cr_extruder_carriage_mount_e3d();
//
//    translate([16.6, -5.6, 17.5])
//    rotate([90, 0, 0])
//    e3d_volcano_mount_1();
//
//    translate([16.6, -25.6, 17.5])
//    rotate([-90, 0, 0])
//    e3d_volcano_mount_2();

    translate([-30, -10, 75])
    //rotate([0, -52.5, 0])
    debug_pcb_mount();

    translate([8, 9, 61.5])
    rotate([90, 0, 90])
    drag_chain_arm();

    translate([-50, 9, 65.5])
    rotate([90, 0, 0])
    cable_pcb_mount_adapter();

    translate([16.6, -15.6, -20.1])
    rotate([90, 0, 90])
    _v6_duct();

//    translate([3.1, -54, 4])
//    rotate([-76.3, 0, 0])
//    _e3d_volcano_5015_duct();

    translate([9.8, -42.5, -44.5])
    rotate([-76.3, 0, 0])
    _e3d_volcano_5015_duct_remix();
}

module debug_pcb_mount() {
    translate([14, -13.5, 0])
    rotate([0, 0, 90])
    hotend_pcb();

    translate([0, 0, 3])
    rotate([0, 180, 0])
    cable_pcb_mount();

    translate([0, -2, -7])
    cable_pcb_clamp();
}

module debug_extruder() {

    intersection() {
        translate([0.05, -0.06])
        union() {
            translate([0, 0, 29.1])
            rotate([0, 180, 0])
            new_lid_M10(bridging=false);

            _orig_base();
            _orig_latch();
        }

        translate([0, 0, 0])
        cube([60, 60, 100], center=true);
    }

    translate([0, 0, 6.1])
    mock_bondtech_gear();

    translate([8.57, 0.21, 6.1])
    mock_bondtech_gear();

//    #translate([8.57, 0.21, 6.1])
//    cylinder(d=3, h=100, $fn=30);

    %translate([0, motor_side_length/2, -20])
    rotate([90, 0, 0])
    mock_stepper_motor(false);
}

module _lid_form() {
    hull()
    _orig_lid_M10();
}

module new_lid_M10(bridging=true, 625zz=false) {

//    %translate([0, 0, 1.4])
//    MR105zz();
    %translate([0, 0, 0.4])
    625zz();

    module _tube_filler() {
        intersection() {
            _orig_lid_M10();

            translate([-4.5, 0.1, 13.8 + 2/2])
            cube([6, 12.4, 2], center=true);
        }
    }

    difference() {
        union() {
            _orig_lid_M10();
            
            translate([0, 0, -1.99])
            _tube_filler();

            translate([0, 0, -3.98])
            _tube_filler();

            if (bridging) {
                translate([-16, -16, 2.817])
                cylinder(d=8, h=0.2);

                translate([-16, -16, 9.083])
                cylinder(d=8, h=0.2);

                translate([16, -16, 2.817])
                cylinder(d=8, h=0.2);

                translate([-16, 16, 2.817])
                cylinder(d=8, h=0.2);

                translate([16, 16, 2.817])
                cylinder(d=8, h=0.2);
            }
        }

        // filament drill path guide
        translate([-4.55, 0, 11.94])
        rotate([90, 0, 0])
        cylinder(d=1, h=50, center=true, $fn=10);

        cylinder(d=16.6, h=10.81, center=true, $fn=50);
    }
}

module 625zz_lid_part() {
    union() {
        // center fill for 625zz
        tube(29, 5.4, 6.2, $fn=80);

        for(i = [0:4]) {
            rotate([0, 0, 360/5*i])
            translate([17/2 + 0.2, 0, 0])
            cylinder(d=1.3, h=5.4, $fn=20);
        }
    }
}

module _new_lid_M10_support_form() {
    //%new_lid_M10();

    // hinge
    render()
    translate([-0.3, 0, 0])
    difference() {
        union() {
            hull() {
                translate([-11, -4, 5.4])
                cylinder(d=3, h=3.7, $fn=20);

                translate([-17, -22, 5.4])
                cylinder(d=3, h=3.7, $fn=20);

                translate([-18, -22, 5.4])
                cylinder(d=3, h=3.7, $fn=20);

                translate([-21, -22, 5.4])
                cylinder(d=3, h=3.7, $fn=20);

                translate([-21, -14, 5.4])
                cylinder(d=3, h=3.7, $fn=20);
            }
            translate([-14, -15.5, 5.4])
            cylinder(d=9.7, h=3.7, $fn=20);

            translate([-14, -23, 8.6/2])
            cube([17, 3, 8.6], center=true);

            translate([-23.5, -19, 8.6/2])
            cube([3, 11, 8.6], center=true);
        }

        new_lid_M10();
    }

    // bolt head indents
    render()
    difference() {
        union() {
            translate([15.5, -15.5, 0])
            cylinder(d=6, h=3, $fn=20);

            translate([15.5, 15.5, 0])
            cylinder(d=6, h=3, $fn=20);

            translate([-15.5, 15.5, 0])
            cylinder(d=6, h=3, $fn=20);

            translate([-15.5, -15.5, 0])
            cylinder(d=6, h=3, $fn=20);
        }
        new_lid_M10();
    }

    // fitting holes
    render()
    difference() {

        union() {
            translate([-4.7, 0, 11.94])
            union() {
                //translate([0, 0, -21])
                //cylinder(d=12, h=9);
                translate([0, 17.3, 0])
                cube([7, 7.8, 10], center=true);

                //translate([0, 0, 12.2])
                //cylinder(d=12, h=9);
                translate([0, -17, 0])
                cube([7, 8, 10], center=true);


                //cylinder(d=4.6, h=42, center=true);
            }
            hull() {
                translate([-2, 23, 0])
                cylinder(d=3, h=9, $fn=30);

                translate([-7, 23, 0])
                cylinder(d=3, h=9, $fn=30);
            }

            translate([-4.5, -22, 8])
            cube([6, 4, 2], center=true);

            hull() {
                translate([-2, -23, 0])
                cylinder(d=3, h=9, $fn=30);

                translate([-7, -23, 0])
                cylinder(d=3, h=9, $fn=30);
            }

            translate([-4.5, 22, 8])
            cube([6, 4, 2], center=true);
        }
        new_lid_M10();

        translate([-4.55, 0.1, 12])
        cube([10, 12.4, 10], center=true);
    }

}

module new_lid_M10_soluble_supports() {
    intersection() {
        _new_lid_M10_support_form();

        union() {
            translate([15.5, -15.5, 2.4])
            cylinder(d=7, h=0.6, $fn=20);

            translate([15.5, -15.5, 2.2])
            cylinder(d=4, h=1, $fn=20);

            translate([15.5, 15.5, 2.4])
            cylinder(d=7, h=0.6, $fn=20);

            translate([15.5, 15.5, 2.2])
            cylinder(d=4, h=1, $fn=20);

            translate([-15.5, 15.5, 2.4])
            cylinder(d=7, h=0.6, $fn=20);

            translate([-15.5, 15.5, 2.2])
            cylinder(d=4, h=1, $fn=20);

            translate([-15.5, -15.5, 2.4])
            cylinder(d=7, h=0.6, $fn=20);

            translate([-15.5, -15.5, 2.2])
            cylinder(d=4, h=1, $fn=20);

            translate([-16, -11.3, 5.4 + 0.2/2])
            cube([13, 20, 0.2], center=true);

            translate([-16, -11.3, 9.1 - 0.5/2])
            cube([13, 20, 0.5], center=true);

            #translate([-4.7, 0.1, 7.9])
            cube([8, 43, 2.2], center=true);

            translate([-4.7, 0.1, 16.1])
            cube([8, 44, 2.2], center=true);
        }
    }
}

module new_lid_M10_nonsoluble_supports() {
    difference() {
        _new_lid_M10_support_form();
        new_lid_M10_soluble_supports();
    }
}

module _cr_extruder_carriage_form(h) {

    module _motor_bolt_hole() {
        cylinder(d=3.6, h=20, center=true, $fn=30);

        translate([0, 0, 2])
        cylinder(d=7, h=10, $fn=30);
    }

    difference() {
        hull() {
            translate([-2, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=12, h=h, center=true, $fn=30);

            translate([49, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=12, h=h, center=true, $fn=30);

            translate([49, 0, 38])
            rotate([90, 0, 0])
            cylinder(d=12, h=h, center=true, $fn=30);

            translate([-2, 0, 64])
            rotate([90, 0, 0])
            cylinder(d=12, h=h, center=true, $fn=30);

            translate([15, 0, 64])
            rotate([90, 0, 0])
            cylinder(d=12, h=h, center=true, $fn=30);
        }

        translate([0, 0, 18])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=22, center=true, $fn=30);

        translate([0, 0, 58])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=22, center=true, $fn=30);

        translate([0, h/2 - 7, 18])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=22, $fn=30);

        translate([0, h/2 - 7, 58])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=22, $fn=30);

        translate([0, h/2 - 10.5, 18])
        rotate([90, 0, 0])
        cylinder(d1=10, d2=13.7, h=4.1, $fn=30);

        translate([0, h/2 - 10.5, 58])
        rotate([90, 0, 0])
        cylinder(d1=10, d2=13.7, h=4.1, $fn=30);

        translate([
            50.3 - motor_bolt_hole_distance/2,
            0, 1.3 + motor_bolt_hole_distance/2
        ])
        rotate([90, 0, 0])
        cylinder(d=24, h=20, center=true, $fn=30);

        translate([0, h/2 - 9 + 2.5/2, 64.5/2 + 5.9])
        cube([24, 2.5, 64.5], center=true);

        translate([29.5, h/2 - 4, 50.5])
        rotate([0, 37.5, 0]) {
            translate([-17, 0, 0])
            _pcb_mount_screw_hole();

            translate([17, 0, 0])
            _pcb_mount_screw_hole();
        }

        translate([50.3, 0, 1.3])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([50.3, 0, 1.3 + motor_bolt_hole_distance])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([
            50.3 - motor_bolt_hole_distance,
            0, 1.3 + motor_bolt_hole_distance
        ])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([
            50.3 - motor_bolt_hole_distance,
            0, 1.3
        ])
        rotate([-90, 0, 0])
        _motor_bolt_hole();

        translate([51.5, 15/2 + h/2 - 7, 20])
        cube([2, 15, 6], center=true);

        translate([52, h/2 - 4, 20])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([18, 0, 20])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([18, h/2 - 2, 20])
        rotate([90, 30, 0])
        M3_nut(h, cone=false);

        translate([18, h/2 - 7.9, 20])
        rotate([90, 30, 0])
        cylinder(d=6.5, h=h, $fn=30);

        translate([42, h/2 + 9, 66])
        rotate([55, 0, 0])
        rotate([0, 18.4, 0])
        cylinder(d=40, h=40, center=true, $fn=50);
    }
}

module cr_extruder_carriage_mount() {

    h = 12;

    difference() {
        _cr_extruder_carriage_form(h=h);

        translate([34.5, -1.5, 16.9])
        rotate([90, 90, 0])
        scale([1.01, 1.01, 1])
        _lid_form();

        translate([34.5, -1.5, 51])
        rotate([90, 90, 0])
        scale([1.01, 1.01, 1])
        _lid_form();

        translate([-5, -h/2 - 10/2 + 7.3, 40])
        hull() {
            rotate([90, 0, 0])
            cylinder(d=15, h=10, center=true, $fn=30);

            translate([-5, 0, 0])
            cube([1, 10, 30], center=true);
        }
    }
}

module _pcb_mount_screw_hole() {
    cylinder(d=3.3, h=16, $fn=30);

    translate([0, 15/2 - 6/2, 3])
    cube([6, 15, 2.2], center=true);
}

module cr_extruder_carriage_mount_e3d() {

    // thickness
    h = 14.5;

    difference() {
        union() {
            _cr_extruder_carriage_form(h=h);

            translate([6, -h/2, 40 + 1.4 - 15/2])
            rotate([0, 0, 45])
            cube([1, 1, 10], center=true);

            translate([6, -h/2, 1.4 + 15/2])
            rotate([0, 0, 45])
            cube([1, 1, 10], center=true);
        }

        translate([34.5, -5.5, 16.9])
        rotate([90, 90, 0])
        scale([1.01, 1.01, 1])
        _lid_form();

        translate([34.5, -5.5, 51])
        rotate([90, 90, 0])
        scale([1.01, 1.01, 1])
        _lid_form();

        translate([-5, h/2 - 6.3, 40])
        hull() {
            rotate([90, 0, 0])
            cylinder(d=15, h=3, center=true, $fn=30);

            translate([-5, 0, 0])
            cube([1, 3, 30], center=true);
        }

        translate([-2.5, 0, 39.5])
        rotate([90, 0, 0])
        cylinder(d=3.6, h=30, center=true, $fn=30);

        translate([6, 0, 8.4])
        rotate([90, 0, 0])
        cylinder(d=3.4, h=20, center=true, $fn=30);

        translate([6, h/2 + 2, 8.4])
        rotate([90, 30, 0])
        M3_nut(h, cone=false);

        translate([6, h/2 + 7.9, 8.4])
        rotate([90, 30, 0])
        cylinder(d=6.5, h=h, $fn=30);

        translate([6, 0, 8.4 + 26])
        rotate([90, 0, 0])
        cylinder(d=3.4, h=20, center=true, $fn=30);

        translate([6, h/2 + 2, 8.4 + 26])
        rotate([90, 30, 0])
        M3_nut(h, cone=false);

        translate([6, h/2 + 7.9, 8.4 + 26])
        rotate([90, 30, 0])
        cylinder(d=6.5, h=h, $fn=30);

        translate([-4, -17.1, 21.4])
        rotate([0, -90, 0])
        cylinder(d=25, h=10, $fn=40);
    }
}

module _e3d_mount_form(h=10) {

    translate([0, 0, h/2])
    hull() {
        rounded_cube_side(
            40, 8.5, h, 3,
            center=true, $fn=30
        );

        rounded_cube_side(
            25, 14.5, h, 3,
            center=true, $fn=30
        );
    }
}

module _e3d_neck_form() {
    rotate([90, 0, 0])
    cylinder(d=4.3, h=20, center=true, $fn=30);

    translate([0, -2, 0])
    rotate([90, 0, 0])
    cylinder(d=12.1, h=8, center=true, $fn=30);

    translate([0, -6.5, 0])
    rotate([90, 0, 0])
    cylinder(d=16.2, h=4, center=true, $fn=30);

    translate([0, 3.5, 0])
    rotate([90, 0, 0])
    cylinder(d=16.2, h=4.4, center=true, $fn=30);
}

module e3d_volcano_mount_1() {
    difference() {
        union() {
            _e3d_mount_form(10);

            hull() {
                translate([-18.1, -8.45, 0])
                cylinder(d=7, h=4, $fn=30);

                translate([-12, 0, 0])
                cylinder(d=12, h=4, $fn=30);
            }
        }

        translate([0, 0, 10])
        _e3d_neck_form();

        translate([-40/2 + 15/2, 0, 0])
        rotate([45, 0, 0])
        cube([15.3, 1.1, 1.1], center=true);

        translate([40/2 - 15/2, 0, 0])
        rotate([45, 0, 0])
        cube([15.3, 1.1, 1.1], center=true);

        translate([-18.1, -8.45, 0])
        cylinder(d=3.5, h=20, center=true, $fn=30);

        translate([-13, 0, 0])
        cylinder(d=3.4, h=30, center=true, $fn=30);

        translate([13, 0, 0])
        cylinder(d=3.4, h=30, center=true, $fn=30);
    }
}

module e3d_volcano_mount_2() {
    difference() {
        _e3d_mount_form(9.4);

        translate([0, 0, 10])
        _e3d_neck_form();

        translate([-13, 0, 0])
        cylinder(d=3.4, h=30, center=true, $fn=30);

        translate([13, 0, 0])
        cylinder(d=3.4, h=30, center=true, $fn=30);
    }
}

module e3d_neck_filler() {
    difference() {
        cylinder(d=8.5, h=11, $fn=40);

        cylinder(d=4.3, h=30, center=true, $fn=40);
    }
}

module bondtech_neck_filler() {
    difference() {
        cylinder(d=8.5, h=8, $fn=40);

        cylinder(d=4.3, h=30, center=true, $fn=40);
    }
}

module cable_pcb_mount() {
    difference() {
        union() {
            translate([0, 1, 3/2])
            rounded_cube_side(42, 36, 3, 6, center=true, $fn=30);

            translate([0, 36/2 + 1 - 6.8/2, 5/2 + 2])
            cube([24, 6.8, 5], center=true);
        }

        translate([0, -2, 3/2])
        cube([26, 21, 4], center=true);

        translate([0, -2, 4/2 + 1.5])
        cube([28, 23, 4], center=true);

        translate([-17, -11, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([17, -11, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-17, 8.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([17, 8.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([0, 10, 30/2 + 3])
        rotate([-90, 0, 0])
        cylinder(d=30, h=20, $fn=50);

        translate([0, 16, 7])
        rotate([90,])
        scale([1, 1.5, 1])
        tube(17, 3, 2, $fn=30);
    }
}

module cable_pcb_clamp() {
    difference() {
        translate([0, -0.5, 7/2])
        rounded_cube_side(42, 29, 7, 6, center=true, $fn=30);

        cube([25, 20, 15], center=true);

        translate([-17, -9, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-17, -9, -1])
        rotate([0, 0, 30])
        M3_nut(4, cone=false, bridging=true);

        translate([17, -9, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([17, -9, -1])
        rotate([0, 0, 30])
        M3_nut(4, cone=false, bridging=true);

        translate([-17, 10.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([17, 10.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([0, 0, 30/2 + 1])
        rotate([-90, 0, 0])
        cylinder(d=30, h=20, $fn=50);
    }
}

module cable_pcb_mount_adapter() {
    difference() {
        hull() {
            cylinder(d=5, h=13, $fn=30);

            translate([0, -9.5, 0])
            cylinder(d=5, h=13, $fn=30);

            translate([43, 0, 0])
            cylinder(d=5, h=13, $fn=30);

            translate([16.25, -35, 0])
            cylinder(d=5, h=13, $fn=30);
        }

        #translate([-22.35, 0, 4])
        rotate([90, 0, 52.5]) {
            cylinder(d=3.3, h=200, center=true, $fn=30);

            cylinder(d=6.8, h=100, center=true, $fn=30);

            translate([34, 0, 0])
            cylinder(d=3.3, h=200, center=true, $fn=30);

            translate([34, 0, 0])
            cylinder(d=6.8, h=100, center=true, $fn=30);
        }

        translate([3, -5, 10])
        rotate([-90, 180, 0])
        _pcb_mount_screw_hole();

        translate([37, -5, 10])
        rotate([-90, 180, 0])
        _pcb_mount_screw_hole();

        hull() {
            translate([10, -6, 0])
            cylinder(d=3, h=50, center=true, $fn=20);

            translate([7, -9, 0])
            cylinder(d=3, h=50, center=true, $fn=20);

            translate([29, -6, 0])
            cylinder(d=3, h=50, center=true, $fn=20);

            translate([34, -30, 0])
            cylinder(d=3, h=50, center=true, $fn=20);

            translate([57, -28, 0])
            cylinder(d=3, h=50, center=true, $fn=20);
        }

        hull() {
            translate([-3, -12.35, 0])
            cylinder(d=3, h=50, center=true, $fn=20);

            translate([14.8, -26, 0])
            cylinder(d=3, h=50, center=true, $fn=20);

            translate([10, -34, 0])
            cylinder(d=3, h=50, center=true, $fn=20);
        }

        translate([20, 17, 0])
        rotate([-35, 0, 0])
        cylinder(d=30, h=30, center=true);
    }
}

module drag_chain_arm() {
    w = 104.7;

    module _zip_tie_groove() {
        difference() {
            cube([3, 18, 14.5], center=true);

            translate([0, 0, 1])
            rotate([0, 90, 0])
            rounded_cube_side(
                10, 15, 12, 4, center=true, $fn=20
            );
        }

//        translate([0, -2, 0])
//        cube([3, 4, 16], center=true);
    }

    difference() {
        union() {
            translate([55/2, -16, 15/2])
            cube([55, 10, 15], center=true);

            translate([55/2 - 5, -19, 15/2])
            chamfered_cube_side(55, 16, 15, 6, center=true);

            translate([w - (w - 60 + 16)/2, -15, 15/2])
            chamfered_cube_side(w - 60 + 16, 16, 15, 4, center=true);

            translate([w - 10/2, -15, 15/2])
            cube([10, 16, 15], center=true);

            translate([w - 11.22, -10, 14])
            rotate([-90, 180, 180])
            drag_chain_bottom_new();

            translate([2, -40/2 + 8, 15/2])
            chamfered_cube_side(15, 40, 15, 5, center=true);

            hull() {
                translate([w - 2.6/2, -18.27, 8.25])
                cube([2.6, 10, 1], center=true);

                translate([w - 2.6/2, -15, 1/2])
                cube([2.6, 10, 1], center=true);
            }

            hull() {
                translate([w - 11.223, -12 + 2/2, 12])
                cube([22.44, 2, 10], center=true);

                translate([w - 11.223, -12 + 2, 9])
                cube([22.44, 6, 1], center=true);
            }
            
            translate([-3, 4, 15/2])
            chamfered_cube_side(25, 10, 15, 4, center=true);

            translate([0, -30.5, 15/2])
            chamfered_cube_side(10, 15, 15, 2, center=true);

        }

        translate([w - 11.223, -15/2 - 12, 4])
        cube([17.47, 15, 15], center=true);

        translate([w - 11.223, -15/2 - 12, 11])
        chamfered_cube(17.47, 15, 15, 2.4, center=true);

        translate([-30/2 + 0.01, -60/2 + 5, 0])
        cube([30, 60, 40], center=true);

        translate([-20/2 - 8, 0, 0])
        cube([20, 20, 40], center=true);

        translate([5, -17, 5])
        hull() {
            translate([20, 0, 0])
            sphere(d=10, $fn=30);

            translate([w - 28, 0, 0])
            sphere(d=10, $fn=30);
        }

        translate([(w - 40)/2 + 25, -17, 0])
        cube([w - 40, 10, 10], center=true);
        
        translate([w - 24, -17, 5])
        rotate([-80, 0, 0])
        translate([0, -24/2, 0])
        rotate([0, 0, 45])
        donut(24, 10, angle=90, $fn=30);

        translate([27, -17, 5])
        rotate([90, 0, 0])
        translate([0, -24/2, 0])
        rotate([0, 0, 180])
        hull()
        donut(24, 10, angle=180, $fn=30);

        translate([-4, 0, 10])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([0, -32, 10])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([20/2 + 4, -32, 10])
        rotate([0, 90, 0])
        cylinder(d=7, h=20, center=true, $fn=30);

        translate([30, -18.4, 15/2 + 1.3])
        _zip_tie_groove();

        translate([56, -15.6, 15/2 + 1.3])
        _zip_tie_groove();

        translate([78, -15.6, 15/2 + 1.3])
        _zip_tie_groove();

        translate([w, -2.5, 0])
        rotate([0, 0, 45])
        cube([10, 20, 40], center=true);
    }
}

module drag_chain_mount() {

    difference() {
        union() {
            intersection() {
                translate([0, 0, 4.5])
                rotate([-90, 0, 0])
                drag_chain_bottom_new();

                cylinder(d=50, h=40);
            }

            difference() {
                translate([0, 3/2 - 0.6, 10/2])
                cube([22.45, 3, 10], center=true);

                translate([0, 7, 10])
                rotate([0, 90, 0])
                cylinder(d=13.5, h=20, center=true, $fn=30);
            }

            translate([-38/2, 38.5, 15/2])
            cube([38, 6, 15], center=true);

            translate([7/2 + 9, 20.6/2 - 0.6, 15/2])
            cube([7, 20.6, 15], center=true);

            hull() {
                translate([-1.6 + 10/2 - 4/2, 38.5, 15/2])
                cube([4, 6, 15], center=true);

                translate([7/2 + 9, 20 - 1/2, 15/2])
                cube([7, 1, 15], center=true);
            }
        }

        translate([-1.6, 38.5, 4])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-1.6, 38.5, 4])
        rotate([90, 30, 0])
        M3_nut(10);

        translate([-1.6 - motor_bolt_hole_distance, 38.5, 4])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-1.6 - motor_bolt_hole_distance, 38.5, 4])
        rotate([90, 30, 0])
        M3_nut(10);

        translate([19, -1, 0])
        rotate([0, 0, 45])
        cube([10, 10, 50], center=true);

        translate([-25, 40, 40/2 + 10])
        chamfered_cube(40, 40, 40, 5, center=true);
    }
}

module drag_chain_support() {
    difference() {
        union() {
            translate([0, 0, 10/2 + 4])
            rotate([0, 90, 0])
            chamfered_cube_side(10, 30, 5, 3, center=true);

            translate([0, 0, 14/2])
            rotate([0, 90, 0])
            chamfered_cube_side(14, 30, 5, 6.9, center=true);

            translate([86/2, 0, 5/2])
            chamfered_cube(86, 7, 5, 1.4, center=true);

            hull() {
                translate([5/2 - 1/2, 0, 10/2 + 4])
                cube([1, 4.2, 10], center=true);

                translate([20, 0, 5/2])
                cube([1, 4.2, 5], center=true);
            }

            // v-slot guides
            translate([-1.8, 0, 10/2 + 4])
            hull() {
                cube([4, 7, 6.2], center=true);
                cube([4 - 2 * 1.9, 7, 6.2 + 2 * 1.7], center=true);
            }
            translate([-2.5, 0, 10/2 + 4])
            cube([4, 7, 6.2], center=true);
        }

        translate([0, 10, 10/2 + 4])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=20, center=true, $fn=30);

        translate([0, -10, 10/2 + 4])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=20, center=true, $fn=30);

        translate([1, 10, 10/2 + 4])
        rotate([0, 90, 0])
        cylinder(d=7, h=20, $fn=30);

        translate([1, -10, 10/2 + 4])
        rotate([0, 90, 0])
        cylinder(d=7, h=20, $fn=30);
    }
}

module drag_chain_support_level() {
    rotate([-30, 0, 0])
    difference() {
        union() {
            translate([0, 2/2, 27/2])
            cube([470, 2, 27], center=true);

            rotate([30, 0, 0])
            translate([0, -9/2 + 2, 0])
            cube([470, 9, 2], center=true);

            translate([0, 0, 27])
            rotate([-30, 0, 0])
            translate([0, -9/2 + 2, 0])
            cube([470, 9, 2], center=true);

            // mount bodies
            translate([460/2 - 25/2, 8/2, 27/2])
            chamfered_cube_side(
                10, 8, 27, 1.4 + 3/4, center=true
            );

            translate([460/2 - 25/2 - 133, 8/2, 27/2])
            chamfered_cube_side(
                10, 8, 27, 1.4 + 3/4, center=true
            );

            translate([
                460/2 - 25/2 - 2*133, 8/2, 27/2
            ])
            chamfered_cube_side(
                10, 8, 27, 1.4 + 3/4, center=true
            );

            translate([
                460/2 - 25/2 - 3*133, 8/2, 27/2
            ])
            chamfered_cube_side(
                10, 8, 27, 1.4 + 3/4, center=true
            );
        }

        // mount holes
        translate([460/2 - 25/2, 8/2, 27/2 + 1.5])
        chamfered_cube_side(
            7.2, 5.2, 27, 1.42, center=true
        );

        translate([
            460/2 - 25/2 - 133, 8/2, 27/2 + 1.5
        ])
        chamfered_cube_side(
            7.2, 5.2, 27, 1.42, center=true
        );

        translate([
            460/2 - 25/2 - 2*133, 8/2, 27/2 + 1.5
        ])
        chamfered_cube_side(
            7.2, 5.2, 27, 1.42, center=true
        );

        translate([
            460/2 - 25/2 - 3*133, 8/2, 27/2 + 1.5
        ])
        chamfered_cube_side(
           7.2, 5.2, 27, 1.42, center=true
        );

        // chamfers
        translate([0, 0, 27 + 5])
        rotate([-30, 0, 0])
        cube([480, 25, 6.7], center=true);

        translate([0, 0, -5])
        rotate([30, 0, 0])
        cube([480, 25, 6.7], center=true);
        
    }
}