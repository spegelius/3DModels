include <../../Dollo/NEW_long_ties/include.scad>;
include <../../Dollo/NEW_long_ties/motor_mount_small.scad>;

use <common.scad>;
use <dollo3d.scad>;

use <../../Greenboy_Extruder_Printhead_V3/scad/GreenBoy3D_extruder_V3_remix.scad>;


stl_base_path = "../../_downloaded/";
gb_stl_path = str(
    stl_base_path,
    "GreenBoy/"
);


//_cr10_mount();
//_fan_duct();
//_hopper();
//_hopper_cap();
//_internal_sliding_pit();
//_external_sliding_pit();

//_v10_mount();
//_v10_mount_fixed();
//_v10_mount_fixed_tk();
//_v10_hopper();
//_v10_hopper_cap();
//_v10_external_pit();

//_dollo3_mount();

//greenboy_mockup_cr10();
//greenboy_mockup_v10();
//greenboy_mockup_dollo3d();
//greenboy_mockup_v3_dollo3d();

//hopper_2_5kg_mockup();

hopper_stand_mockup();


module _cr10_mount() {
    import (
        str(gb_stl_path, "Creality-CR10.stl"),
        convexity=10
    );
}

module _fan_duct() {
    import (
        str(gb_stl_path, "Pellet-Extruder-Fan-Duct.stl"),
        convexity=10
    );
}

module _hopper() {
    import (
        str(gb_stl_path, "Pellet-Extruder-Hopper.stl"),
        convexity=10
    );
}

module _hopper_cap() {
    import (
        str(gb_stl_path, "Pellet-Extruder-Hopper-Cap.stl"),
        convexity=10
    );
}

module _internal_sliding_pit() {
    orig_internal_sliding_pit();
}

module _external_sliding_pit() {
    import (
        str(gb_stl_path, "External-Sliding-Pit.stl"),
        convexity=10
    );
}

module _v10_mount() {
    import (
        str(gb_stl_path, "v10_Main.stl"),
        convexity=10
    );
}

module _v10_mount_fixed() {
    translate([-152.5, -152.5, -41.32])
    import (
        str(gb_stl_path, "v10_Main_fixed.stl"),
        convexity=10
    );
}

module _v10_mount_fixed_tk() {
    import (
        str(gb_stl_path, "v10_Main_fixed_tk.stl"),
        convexity=10
    );
}

module _v10_hopper() {
    import (
        str(gb_stl_path, "v10_Hopper.stl"),
        convexity=10
    );
}

module _v10_hopper_cap() {
    import (
        str(gb_stl_path, "v10_HopperCap.stl"),
        convexity=10
    );
}

module _v10_external_pit() {
    orig_v10_external_pit();
}

module _v10_fan_duct() {
    import (
        str(gb_stl_path, "v10_FanDuct.stl"),
        convexity=10
    );
}

module _dollo3d_mount() {
    import (
        "dollo3d_mount.stl",
        convexity=10
    );
}

module greenboy_mockup_cr10() {
    color("lightgreen")
    intersection() {
        _cr10_mount();

//        translate([100/2 - 10, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    translate([-18, 0, 108.6])
    rotate([-90, 0, 180])
    mock_greenboy_stepper_motor();

    translate([-18, 0, 26.1])
    intersection() {
        mock_greenboy_coupler();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    translate([-18, 0, -35.8])
    mock_greenboy_feed_screw();

    translate([-18, 0, -44.8])
    rotate([0, 0, 90])
    mock_greenboy_body();

//    translate([-18, 0, 2.1])
//    _fan_duct();
}

module greenboy_mockup_v10() {
    color("lightgreen")
    intersection() {
        _v10_mount();

//        translate([100/2 - 10, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    color("grey")
    translate([-3.8, 0.4, 89.8])
    intersection() {
        rotate([-90, 0, 180])
        mock_greenboy_stepper_motor();

//        translate([0, 0, -100/2 - 52])
//        cube([100, 100, 100], center=true);
    }

    color("lightgrey")
    translate([-3.8, 0.4, 7.9])
    intersection() {
        mock_greenboy_coupler();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    color("lightgrey")
    translate([-3.8, 0.4, -54.6])
    mock_greenboy_feed_screw();

    color("lightgrey")
    translate([-3.8, 0.4, -63.6])
    rotate([0, 0, 90])
    mock_greenboy_body();

//    color("lightgreen")
//    _v10_hopper();
//
//    color("lightgreen")
//    _v10_hopper_cap();

//    color("lightgreen")
//    translate([-3.8, 0.4, -16.3])
//    _internal_sliding_pit();
//
//    color("lightgreen")
//    _v10_external_pit();

    _v10_fan_duct();

}

module greenboy_mockup_dollo3d() {
    color("lightgreen")
    intersection() {
        translate([10.68 - 3.8, -5.2 + 0.4, -15.7])
        _dollo3d_mount();
//
//        translate([100/2 - 10, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    color("lightgreen")
    translate([-3.8, 30.2 - 4.8, 51.6 - 15.7])
    dollo3d_mount_clip_top();

    color("lightgreen")
    translate([-3.8, 30.2 - 4.8, 32.8 - 15.7])
    rotate([-90, 0, 0])
    dollo3d_mount_clip_back();

    color("grey")
    translate([-3.8, 0.4, 89.8])
    intersection() {
        rotate([-90, 0, 180])
        mock_greenboy_stepper_motor();

//        translate([0, 0, -100/2 - 52])
//        cube([100, 100, 100], center=true);
    }

    color("lightgrey")
    translate([-3.8, 0.4, 7.9])
    intersection() {
        mock_greenboy_coupler();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    color("lightgrey")
    translate([-3.8, 0.4, -54.6])
    mock_greenboy_feed_screw();

    color("lightgrey")
    translate([-3.8, 0.4, -63.8])
    rotate([0, 0, 90])
    mock_greenboy_body();

    translate([-3.8 + 8.5, 0.4, -11.2])
    rotate([90, 0, 90])
    body_spacer();

    translate([-3.8 - 8.5, 0.4, -11.2])
    rotate([90, 0, -90])
    body_spacer();


//    color("lightgreen")
//    _v10_hopper();
//
//    color("lightgreen")
//    _v10_hopper_cap();

    color("lightgreen")
    translate([-3.8, 0.4, -8])
    internal_sliding_pit_tight();

//    color("lightgreen")
//    translate([-3.8, 0.4, -8])
//    v10_external_pit_tight();

//    _v10_fan_duct();

}

module greenboy_mockup_v3_dollo3d() {
    color("lightgreen")
    intersection() {
        translate([0, 0, 32.3])
        v3_dollo3d_motor_plate();

//        translate([100/2, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    color("lightgreen")
    intersection() {
        translate([0, 0, -6.3])
        rotate([180, 0, 0])
        _v3_hotend_fixture();

//        translate([100/2, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    color("lightgreen")
    intersection() {
        translate([0, 0, -6.3])
        v3_pellet_reservoir_steep();

//        translate([100/2, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    color("lightgreen")
    intersection() {
        translate([0, 0, -6])
        v3_bottom_front_steep();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    color("lightgreen")
    intersection() {
        translate([0, 0, 32])
        rotate([0, 180, 180])
        _v3_bucket_front();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    color("lightgreen")
    intersection() {
        translate([22.9, -7, 29.1])
        rotate([0, 90, 0])
        _v3_hose_connector_body();

//        translate([100/2, 0, 0])
//        cube([100, 100, 200], center=true);
    }

//    translate([0, 33, 36])
//    v3_mounting_plate_dollo3d();

    intersection() {
        translate([0, 51, 16])
        assembly_motor_mount();

        translate([200/2 - 10, 0, 0])
        cube([200, 200, 200], center=true);
    }

    translate([0, 30.2 - 3.4, 51.6 - 11.3])
    v3_dollo3d_mount_clip_top();

    translate([0, 30.2 - 3.4, 32.8 - 15.7])
    rotate([-90, 0, 0])
    v3_dollo3d_mount_clip_back();

    color("grey")
    translate([0, 0, 89.8])
    intersection() {
        rotate([-90, 0, 180])
        mock_greenboy_stepper_motor();

//        translate([0, 0, -100/2 - 52])
//        cube([100, 100, 100], center=true);
    }

    color("lightgrey")
    translate([0, 0, 7.9])
    intersection() {
        mock_greenboy_coupler();

//        translate([100/2, 0, 0])
//        cube([100, 100, 200], center=true);
    }

    color("lightgrey")
    translate([0, 0, -54.6])
    mock_greenboy_feed_screw();

    color("lightgrey")
    translate([0, 0, -63.8])
    rotate([0, 0, 90])
    mock_greenboy_body();
}

module hopper_2_5kg_mockup() {
    intersection() {
        translate([0, 0, 1])
        new_hopper_2_5kg();

        translate([10, 500/2, 0])
        cube([500, 500, 1000], center=true);
    }

    intersection() {
        new_hopper_2_5kg_cap();

        translate([10, 500/2, 0])
        cube([500, 500, 1000], center=true);
    }

    translate([0, 15, 174.55])
    rotate([-45, 0, 0])
    intersection() {
        hopper_hose_adapter();

        translate([100/2, 0, 0])
        cube([100, 100, 100], center=true);
    }
}

module hopper_stand_mockup() {
    // base
    color("lightgrey")
    translate([0, 0, 20/2])
    difference() {
        rounded_cube_side(
            320, 500, 20, 30, center=true, $fn=30
        );

        translate([0, -120, 0])
        cylinder(d=71, h=100, center=true, $fn=60);
    }

    // metal pipe
//    color("lightgrey")
//    translate([0, -120, 15])
//    tube(19, 1500, 1, $fn=30);

    // base mount
    translate([0, -120 - 27, 20])
    intersection() {
        hopper_base_mount();

//        translate([0, 100/2 + 27, 0])
//        cube([100, 100, 500], center=true);
    }
    
    // screw end
    translate([0, -120, 0])
    intersection() {
        rotate([0, 0, 10])
        hopper_stand_pole_screw_end();        

        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    // portion 1
    translate([0, -120, 200])
    intersection() {
        hopper_stand_pole_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    translate([0, -120, 200])
    hopper_stand_pole_portion_joint();

    translate([0, -120, 400])
    hopper_stand_pole_portion_joint();

    // portion 2
    translate([0, -120, 400])
    intersection() {
        hopper_stand_pole_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    translate([0, -120, 400])
    hopper_stand_pole_portion_joint();

    translate([0, -120, 600])
    hopper_stand_pole_portion_joint();

    // portion 3
    translate([0, -120, 600])
    intersection() {
        hopper_stand_pole_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    translate([0, -120, 600])
    hopper_stand_pole_portion_joint();

    translate([0, -120, 800])
    hopper_stand_pole_portion_joint();

    // portion 4
    translate([0, -120, 800])
    intersection() {
        hopper_stand_pole_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    translate([0, -120, 800])
    hopper_stand_pole_portion_joint();

    translate([0, -120, 1000])
    hopper_stand_pole_portion_joint();

    // portion 5
    translate([0, -120, 1000])
    intersection() {
        hopper_stand_pole_portion();
        
        translate([0, 100/2, 0])
        cube([100, 100, 500], center=true);
    }

    translate([0, -120, 1000])
    hopper_stand_pole_portion_joint();

    translate([0, -120, 1200])
    hopper_stand_pole_portion_joint();

    // portion 6
//    translate([0, -120, 1200])
//    intersection() {
//        hopper_stand_pole_portion();
//        
////        translate([0, 100/2, 0])
////        cube([100, 100, 500], center=true);
//    }

//    translate([0, -120, 1200])
//    hopper_stand_pole_portion_joint();
//
//    translate([0, -120, 1400])
//    hopper_stand_pole_portion_joint();

    // end
//    translate([0, -120, 1400 + 130])
//    rotate([180, 0, 0])
//    intersection() {
//        hopper_stand_pole_end(130);
//
//        translate([0, -100/2, 0])
//        cube([100, 100, 500], center=true);
//    }

    // side arm
    color("lightgrey")
    translate([0, -120 + 31, 1400 - 20])
    rotate([-90, 0, 0])
    cylinder(d=10, h=518, $fn=20);

    translate([0, -120, 1400])
    intersection() {
        rotate([0, 180, 0])
        hopper_stand_side_arm_base();

        translate([-100/2, 0, 0])
        cube([100, 200, 200], center=true);
    }

    translate([0, -120 + 100, 1400 - 20])
    rotate([-90, 0, 0])
    hopper_stand_side_arm_portion();

    translate([0, -120 + 300, 1400 - 20])
    rotate([-90, 0, 0])
    hopper_stand_side_arm_portion(150);

    translate([0, -120 + 550, 1400 - 20])
    intersection() {
        rotate([90, 180, 0])
        hopper_stand_side_arm_end(100);

        translate([-100/2, 0, 0])
        cube([100, 500, 100], center=true);
    }

    translate([0, 300, 1400 - 20])
    rotate([90, 0, 0])
    hopper_stand_arm_hopper_attachment();

    translate([0.5, 250, 1602.6])
    rotate([180, 0, 90])
    new_hopper_2_5kg();
}