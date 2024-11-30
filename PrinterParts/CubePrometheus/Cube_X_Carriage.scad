
include <../../Dollo/NEW_Long_ties/mockups.scad>;
include <../../Dollo/NEW_Long_ties/globals.scad>;
include <../../Dollo/NEW_Long_ties/include.scad>;

use 
    <../../Prometheus_V2_hotend/Prometheus_hotend_40mm_fan.scad>;

// use MK3 branch for these
use
    <../Original-Prusa-i3/Printed-Parts/scad/nozzle-fan.scad>;
use 
    <../Original-Prusa-i3/Printed-Parts/scad/nozzle-fan-holder.scad>;


////// VARIABLES //////
slop = 0.15;
nozzle = 0.4;

hotend = "e3dv6";
//hotend = "prometheus";

stl_path = "../../_downloaded/";

pcb_mount_w = 44;
pcb_mount_l = 40;


////// VIEW //////
//debug_mount_assembly();
//debug_mount_fan_shroud_assembly();
//debug_mount_fan_assembly();
//debug_mount_prusa_fan_MK3_assembly();
//debug_mount_prusa_fan_MK3_45deg_assembly();
//debug_mount_prusa_fan_MK3Sish_assembly();
//debug_mount_prusa_fan_MK3Sish();
//debug_mount_delta_p_assembly();
//debug_e3d_hotend_fan_40mm();
//debug_pcb_mount();

//delta_p_assembly();


//translate([-30, 0, 30/2])
//rotate([180, 0, 0])
//x_carriage_slide_mount();

//rotate([0, 180, 0])
//x_carriage();

//x_carriage_supports_soluble();
//x_carriage_supports_nonsoluble();

//hotend_neck(hotend);
//hotend_clamp(hotend);

//prox_sensor_clamp();

//fan_tunnel();
//fan_tunnel_arm();
//rotate([-90, 0, 0])
//fan_tunnel_arm2();

//cable_mount();
//pcb_mount();
pcb_mount_fastener();

//prusa_nozzle_fan_MK3();
//prusa_nozzle_fan_MK3_45deg();
//prusa_nozzle_fan_MK3_45deg_adapter();
//prusa_nozzle_fan_MK3_45deg_holder();
//rotate([90, 0, 0])
//mount_clamp_prusafan(hotend=hotend);

//hotend_clamp_prusafan_clip();
//prusa_nozzle_fan_MK3ish();
//mount_clamp_prusa_MK3ish(hotend=hotend);

//delta_p_fan_mount();
//delta_p_duct_prometheus_connector();

//prometheus_hotend_fan_adapter();

//e3d_hotend_fan_40mm();


////// MODULES //////
module mock_slide() {
    difference() {
        cube([28.7, 8, 20], center=true);

        translate([5, -8/2 - 0.1, 7.5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=3.6, $fn=20);

        translate([5, -8/2 - 0.1, -7.5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=3.6, $fn=20);

        translate([-5, -8/2 - 0.1, 7.5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=3.6, $fn=20);

        translate([-5, -8/2 - 0.1, -7.5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=3.6, $fn=20);
    }
}

module prometheus_hotend() {
    p_path = str(stl_path, "Prometheus_Hot_End/");
    scale([10, 10, 10])
    import(
        str(p_path, "Aluminium_Heat_Sink_V2_4mm.stl")
    );

    translate([0, 0, -10])
    scale([10, 10, 10])
    rotate([0, 0, 90])
    import(str(
        p_path, "Aluminium_Heater_Block_V2_4mm.stl"
    ));

    translate([0, 0, -15])
    scale([10, 10, 10])
    import(str(
        p_path,
        "Stainless_Steel_Nozzle_V2_2mm_0.4mm.stl"
    ));
}

module belt_teeth(){
    difference() {
        union() {
            cube([14, 19, 4], center=true);

            translate([0, 1, 2])
            cube([14, 2, 4], center=true);

            for (i=[0:6]) {
                translate([-6 + i*2, 0, 4/2])
                cube([1, 15, 0.8], center=true);
            }
        }
        translate([-12, 0, -3.7])
        rotate([90, 0, 0])
        cylinder(d=15, h=19, $fn=40);

        translate([12, 0, -3.7])
        rotate([90, 0, 0])
        cylinder(d=15, h=19, $fn=40);

        translate([-7.55, -9.5, 0])
        cube([14, 4, 7], center=true);

        translate([4.5, -12.75, 0])
        rotate([0, 0, -30])
        cube([14, 4, 7], center=true);
    }
}

module debug_mount_assembly() {

    %translate([0, -8/2, 20/2])
    mock_slide();

    translate([0, -20/2 - 8, 30/2])
    x_carriage_slide_mount();

    translate([0, -38.1, 40/2 - 5])
    x_carriage();

    intersection() {
        translate([0, -58.1, 38])
        rotate([90, 0, 0])
        hotend_neck(hotend=hotend);

        translate([50/2, 0, 0])
        cube([50, 200, 100], center=true);

//        translate([0, 0, 0])
//        cube([50, 120, 100], center=true);

    }

    %translate([28, -70, 7])
    rotate([0, 0, -109])
    prox_sensor_clamp();

    translate([33, -70.5, -19])
    proximity_sensor();

    if (hotend == "e3dv6") {
        translate([0, -72.1, -23.4])
        e3dv6();

        translate([-31, -72.1, -3.8])
        rotate([0, 0, -90])
        e3d_hotend_fan_40mm();
    } else {
        translate([0, -72.1, -3.7])
        rotate([0, 0, 90])
        prometheus_hotend();

        translate([-31, -72.1, -3.5])
        rotate([0, 0, -90])
        fan_shroud_40mm_cube_mount();
    }

//    translate([0, -86.2, 38])
//    rotate([90, 0, 180])
//    hotend_clamp(hotend=hotend);

    translate([-23.1, -39.4, 11])
    rotate([90, 0, -90 + 19])
    prometheus_hotend_fan_adapter();

    translate([0, -38.1, 38])
    cable_mount();

    translate([0, -12.7, 89 + 1.5])
    rotate([0, 180, 0])
    pcb_mount();
}

module delta_p_assembly(hotend) {
//    %translate([-151, -223, -43])
//    import(str(
//        stl_path,
//        "X2 Delta P Duct V2R2.2/",
//        "V2R2.2-duct X2.stl"
//    ));

    translate([0.4, -86.55, -21.725])
    delta_p_duct_mockup();

//    translate([-119.2, -93.23, 143.36])
//    rotate([-90, 0, 0])
//    import(str(
//        stl_path,
//        "X2 Delta P Duct V2R2.2/",
//        "V2R2.2 Cover.stl"
//    ));

    translate([20.9, -93.43, -6.5])
    rotate([-90, 0, 0])
    delta_p_fan_mount();

    %translate([3.4, -93.3, 24.3])
    rotate([90, 48.6, 0])
    import(str(
        stl_path,
        "50mm_Radial_fan/50mm_fan.stl"
    ));
}

module debug_mount_fan_shroud_assembly() {

    debug_mount_assembly();

    translate([0, -78.2, 40 - 5 - 5.4/2])
    hotend_clamp(hotend=hotend);

    translate([-31, -72.1, -3.7])
    rotate([0, 0, -90])
    color("green")
    fan_shroud();
}

module debug_mount_fan_assembly() {

    debug_mount_assembly();

    translate([0, -78.2, 40 - 5 - 5.4/2])
    hotend_clamp(hotend=hotend);

    translate([0, -115, 20])
    rotate([-42, 180, 0])
    fan_tunnel();

    translate([-13, -95.2, 37.5])
    rotate([90, 0, 90])
    fan_tunnel_arm();

}

module debug_mount_prusa_fan_MK3_assembly() {
    debug_mount_assembly();

    translate([0, -76, -17])
    rotate([0, 0, 180])
    prusa_nozzle_fan_MK3();

    // what is this?
    hotend_clamp_prusafan_clip();

    translate([0, -78.2, 32.4])
    mount_clamp_prusafan();
}

module debug_mount_prusa_fan_MK3_45deg_assembly() {
    debug_mount_assembly();

    translate([0, -78.2, 32.4])
    mount_clamp_prusafan();

    translate([0, -78, -17])
    rotate([0, 0, 180])
    prusa_nozzle_fan_MK3_45deg();

    translate([42.5, -91.2 , -6.6])
    rotate([0, 0, 180])
    prusa_nozzle_fan_MK3_45deg_adapter();

    translate([0.5, -54.5, 35])
    rotate([0, 0, 180])
    prusa_nozzle_fan_MK3_45deg_holder();
}

module debug_mount_prusa_fan_MK3Sish_assembly() {
    debug_mount_assembly();

    translate([-31, -72.1, -3.7])
    rotate([0, 0, -90])
    color("green")
    fan_shroud();

    translate([0, -78.1, 40 - 5 - 5.4/2])
    mount_clamp_prusa_MK3ish(hotend=hotend);

    translate([0, -89, -9])
    rotate([0, 0, 180])
    prusa_nozzle_fan_MK3ish();
}

module debug_mount_delta_p_assembly() {
    debug_mount_assembly();

    if (hotend == "e3dv6") {
        delta_p_assembly(hotend=hotend);
    } else {
        translate([0, 0, 5.5])
        delta_p_assembly(hotend=hotend);
    }
}

module debug_mount_prusa_fan_MK3Sish() {

    intersection() {
        prusa_nozzle_fan_MK3ish();

        translate([0, -50/2, -10])
        cube([50, 50, 50]);
    }
}

module debug_e3d_hotend_fan_40mm() {
    e3d_hotend_fan_40mm();

    translate([0, 31, -19.6])
    e3dv6();
}

module debug_pcb_mount() {
    pcb_mount();

    translate([0, 5.5, 3.1])
    pcb_mount_fastener();
}

module x_carriage_slide_mount() {
    depth = 20;
    screw_head_depth = depth - (12 - 3.5);

    difference() {
        cube([50, depth, 30], center=true);
        
        // screw holes
        translate([5, -depth/2 - 0.1, 7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=30, $fn=20);

        translate([5, -depth/2 - 0.1, -7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=30, $fn=20);

        translate([-5, -depth/2 - 0.1, 7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=30, $fn=20);

        translate([-5, -depth/2 - 0.1, -7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=3, h=30, $fn=20);

        // screw head holes
        translate([5, -depth/2 - 0.2, 7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=6.2, h=screw_head_depth, $fn=30);

        translate([5, -depth/2 - 0.2, -7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=6.2, h=screw_head_depth, $fn=30);

        translate([-5, -depth/2 - 0.2, 7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=6.2, h=screw_head_depth, $fn=30);

        translate([-5, -depth/2 - 0.2, -7.5 - 5])
        rotate([-90, 0, 0])
        cylinder(d=6.2, h=screw_head_depth, $fn=30);

        // bewels
        translate([-35, 4, 0])
        rotate([0, 0, -45])
        cube([20, 40, 60], center=true);

        translate([35, 4, 0])
        rotate([0, 0, 45])
        cube([20, 40, 60], center=true);

        translate([0, 4.5, 24.5])
        rotate([-45, 0, 0])
        cube([60, 40, 20], center=true);

        translate([-50/2  +12, -depth/2, 0])
        rotate([0, 0, 45])
        cube([5, 5, 40], center=true);

        translate([50/2 - 12, -depth/2, 0])
        rotate([0, 0, 45])
        cube([5, 5, 40], center=true);

        translate([-50/2 + 5, -depth/2 + 5, -20])
        cylinder(d=bolt_hole_dia, h=40, $fn=30);

        translate([50/2 - 5, -depth/2 + 5, -20])
        cylinder(d=bolt_hole_dia, h=40, $fn=30);
    }

    translate([0, 10, 5 + 4/2 + 1.5])
    rotate([180, 0, 0])
    belt_teeth();
}

module x_carriage() {
    difference() {
        union() {
            translate([0, 0, 3/2])
            cube([50, 40, 43], center=true);

            translate([0, -18, 20 - 5.4/2])
            rotate([45, 0, 0])
            cube([4, 6, 6], center=true);
        }

        translate([0, 20, 0])
        cube([55, 20, 30 + slop*2], center=true);

        // bolt holes
        translate([-50/2 + 5, 10 + 5, -30])
        cylinder(d=bolt_hole_dia, h=60, $fn=30);

        translate([50/2 - 5, 10 + 5, -30])
        cylinder(d=bolt_hole_dia, h=60, $fn=30);

        translate([-50/2 + 5, 10 + 5, 40/2 - 2.5])
        cylinder(d=bolt_head_hole_dia, h=60, $fn=30);

        translate([50/2 - 5, 10 + 5, 40/2  -2.5])
        cylinder(d=bolt_head_hole_dia, h=60, $fn=30);

        // nuts
        translate([-50/2 + 5, 10 + 5, -40/2 - 0.01])
        M3_nut();

        translate([50/2 - 5, 10 + 5, -40/2 - 0.01])
        M3_nut();

        // sides
        translate([-50/2  -7, 0, 0])
        rotate([0, 0, 19])
        cube([20, 49.2,50], center=true);

        translate([50/2 + 7, 0, 0])
        rotate([0, 0, -19])
        cube([20, 49.2, 50], center=true);

        translate([0, -20.5, -10.3])
        rotate([35, 0, 0])
        cube([60, 20, 50], center=true);

        translate([-10.5, -25.5, -10.3])
        rotate([20, 0, -30])
        cube([60, 20, 50], center=true);

        translate([10.5, -25.5, -10.3])
        rotate([20, 0, 30])
        cube([60, 20, 50], center=true);

        // center hollow
        translate([0, -60/2 + 5, -60/2 + 12])
        cube([20, 60, 60], center=true);
        
        // hot end clamp bolt holes
        translate([-50/2 + 15, -30, 20 - 5.4/2])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia, h=30, $fn=30);

        translate([50/2 - 15, -30, 20 - 5.4/2])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia, h=30, $fn=30);

        // hot end clamp nut holes
        translate([
            -50/2 + 15, -15,
            20 - 5.4/2 + 10/2 - 6/2])
        cube([6, 2, 10.4], center=true);

        translate([
            50/2 - 15, -15,
            20 - 5.4/2 + 10/2 - 6/2])
        cube([6, 2, 10.4], center=true);

        // utility holes side
        translate([14.5, 9, 15])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([14.5, 9, 0])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([14.5, 9, -15])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([7.5, -10, 15])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([7.5, -10, 0])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([11, 0, 15])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([11, 0, 0])
        rotate([0, 90, -19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-14.5, 9, 15])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-14.5, 9, 0])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-14.5, 9, -15])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-7.5, -10, 15])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-7.5, -10, 0])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-11, 0, 15])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-11, 0, 0])
        rotate([0, -90, 19])
        cylinder(d=2.5, h=10, $fn=30);

        // utility holes top
        translate([-13, 3, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([13, 3, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-9, -7, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([9, -7, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-5, -17, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([5, -17, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([0, 3, 15])
        cylinder(d=2.5, h=10, $fn=30);

        translate([0, -7, 15])
        cylinder(d=2.5, h=10, $fn=30);
    }

    // guide blocks
    translate([-50/2 + 12, 10, 0])
    rotate([0, 0, 45])
    cube([5, 5, 40], center=true);

    translate([50/2 - 12, 10, 0])
    rotate([0, 0, 45])
    cube([5, 5, 40], center=true);
}

module _x_carriage_support_form() {
//    %rotate([0, 180, 0])
//    x_carriage();

    difference() {
        union() {
            translate([-20, 15, -23])
            cylinder(d=5.5, h=5.5, $fn=30);

            translate([20, 15, -23])
            cylinder(d=5.5, h=5.5, $fn=30);

            difference() {
                intersection() {
                    translate([0, 21.6, -3])
                    rotate([18, 0, 0])
                    cube([52, 10, 47], center=true);

                    translate([0, 0, 38.15/2 - 23])
                    cube([60, 80, 38.15], center=true);
                }

                translate([-13, 10, 0])
                rotate([0, 0, 45])
                cube([5.6, 5.6, 100], center=true);

                translate([13, 10, 0])
                rotate([0, 0, 45])
                cube([5.6, 5.6, 100], center=true);
            }
        }

        rotate([0, 180, 0])
        x_carriage();
    }

}

module x_carriage_supports_soluble() {
    intersection() {
        _x_carriage_support_form();

        union() {
            translate([0, 10, -23 + 5.5 - 0.5/2])
            cube([50, 20, 0.5], center=true);

            translate([0, 14, 15.25 - 0.75/2])
            cube([53, 20, 0.75], center=true);
        }
    }
}

module x_carriage_supports_nonsoluble() {
    slot = 5.2;

    difference() {
        _x_carriage_support_form();

        intersection() {
            union() {
                for(i=[0:8]) {
                    translate([
                        -25.4 + slot/2 + i*(slot + 0.5),
                        22.2, -3
                    ])
                    rotate([18, 0, 0])
                    cube([slot, 10, 47], center=true);
                }
            }

            translate([0, 0, 36.25/2 - 22.75])
            cube([60, 80, 36.25], center=true);
        }

        x_carriage_supports_soluble();
    }
}

module _hotend_neck_form(hotend) {
    difference() {
        translate([0, 0, 14/2])
        chamfered_cube_side(
            29, 30, 14, 3, center=true
        );

        // hot end neck
        translate([0, -15, 14.1])
        rotate([-90, 0, 0])
        cylinder(d=12.1, h=12, $fn=40);

        if (hotend == "e3dv6") {
            translate([0, -12.25, 14])
            rotate([-90, 0, 0])
            cylinder(d=16.2, h=3.8, $fn=40);

            translate([0, -16, 14])
            rotate([-90, 0, 0])
            cylinder(d1=26, d2=20, h=3.8, $fn=40);

        } else {
            translate([0, -11.25, 14])
            rotate([-90, 0, 0])
            cylinder(d=16.2, h=3.8, $fn=40);
        }

        translate([0, -7, 14])
        cube([40, 17.8, 0.8], center=true);

        translate([0, -3.1, 14])
        rotate([-90, 0, 0])
        cylinder(d=16.2, h=5, $fn=40);

        // PTFE tube
        translate([0, 0, 14])
        rotate([-90, 0, 0])
        cylinder(d=4.3, h=70,center=true, $fn=40);

        // M4
        translate([0, 5, 14])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);

        translate([0, 10.5, 14])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);
        
        // mount holes
        translate([50/2 - 15, -5.7, 0])
        cylinder(
            d=bolt_hole_dia, h=30,
            center=true, $fn=30
        );

        translate([-50/2 + 15, -5.7, 0])
        cylinder(
            d=bolt_hole_dia, h=30,
            center=true, $fn=30
        );

        translate([50/2 - 15, 8.5, 0])
        cylinder(
            d=bolt_hole_dia, h=30,
            center=true, $fn=30
        );

        translate([-50/2 + 15, 8.5, 0])
        cylinder(
            d=bolt_hole_dia, h=30,
            center=true, $fn=30
        );
    }
}

module hotend_neck(hotend) {
    difference() {
        _hotend_neck_form(hotend);

        // nuts
        translate([50/2 - 15, 8.5, -1])
        M3_nut(6);

        translate([-50/2 + 15, 8.5, -1])
        M3_nut(6);

        // notch
        translate([0, -5.7, -2])
        rotate([45, 0, 0])
        cube([4.3, 6.2, 6.2], center=true);
    }
}

module hotend_clamp(hotend="e3dv6"){
    difference() {

        union() {
            _hotend_neck_form(hotend);

            // bridges
            translate([50/2 - 15, 8.5, 4])
            cylinder(d=6.7, h=0.2, $fn=30);

            translate([-50/2 + 15, 8.5, 4])
            cylinder(d=6.7, h=0.2, $fn=30);

            translate([50/2 - 15, -5.7, 4])
            cylinder(d=6.7, h=0.2, $fn=30);

            translate([-50/2 + 15, -5.7, 4])
            cylinder(d=6.7, h=0.2, $fn=30);

        }

        // bolt head holes
        translate([50/2 - 15, 8.5, -1])
        cylinder(d=6.5, h=5, $fn=30);

        translate([-50/2 + 15, 8.5, -1])
        cylinder(d=6.5, h=5, $fn=30);

        translate([50/2 - 15, -5.7, -1])
        cylinder(d=6.5, h=5, $fn=30);

        translate([-50/2 + 15, -5.7, -1])
        cylinder(d=6.5, h=5, $fn=30);

        // fan mount holes
        translate([-10, 1.5, 5.2])
        cylinder(d=3.3, h=15, $fn=30);

        translate([10, 1.5, 5.2])
        cylinder(d=3.3, h=15, $fn=30);

        translate([-10, 1.5, -1])
        cylinder(d=3.3, h=4, $fn=30);

        translate([10, 1.5, -1])
        cylinder(d=3.3, h=4, $fn=30);

        // nut holes
        translate([-10 - 10/2 + 6/2, 1.5, 5 - 2.2/2])
        cube([10, 6, 2.2], center=true);

        translate([10 + 10/2 - 6/2, 1.5, 5 - 2.2/2])
        cube([10, 6, 2.2], center=true);

        // groove
        rotate([0, 45, 0])
        cube([3, 60, 3], center=true);
    }
}

module prox_sensor_clamp() {
    height = 25;
    
    module halfround(d=30, h=5) {
        hull() {
            cylinder(d=d, h=h, $fn=50);

            translate([-d/2, -d/2, 0])
            cube([1, 1, h]);
        }
    }
    
    module main() {
        translate([-1, 5, 0])
        halfround();

        translate([-37, -16.5, 0])
        cube([35, 3, 28]);

        translate([-37, -13.5, 0])
        cube([44, 25, 28]);

        translate([-1, 5, 23])
        halfround();
    }

    difference() {
        main();

        translate([-1, 5, 0])
        cylinder(d=prox_sensor_dia, h=36, $fn=50);

        translate([-1, 5, 5])
        cylinder(
            d=prox_sensor_washer_dia + 3,
            h=19, $fn=50
        );

        translate([-25, -1, 5 + 20/2])
        cube([25, 25, 20], center=true);

        translate([-30, 8.9, 5 + 20/2])
        rotate([0, 0, 49])
        cube([55, 20, 31], center=true);

        translate([2, -16.4, 5 + 20/2])
        rotate([0, 0, 35])
        cube([40, 10, 31], center=true);

        translate([-14, -12.5, 23])
        rotate([0, -90, 90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);

        translate([-14, 21.5, 23])
        rotate([0, -90, 90])
        cylinder(d=bolt_head_hole_dia, h=35, $fn=20);

        translate([-14, -12.5, 8])
        rotate([0, -90, 90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);

        translate([-14, -3.5, 8])
        rotate([0, -90, 90])
        cylinder(d=bolt_head_hole_dia, h=10, $fn=20);

        translate([-34.3, -12.5, 23])
        rotate([0, -90, 90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);

        translate([-34.3, -12.5, 8])
        rotate([0, -90, 90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);
    }
}

module fan_tunnel(wall=2*nozzle) {
    
    module capsule(d=12, x=20) {
        hull() {
            translate([0, x/2, 0])
            circle(d=d, $fn=30);

            translate([0, -x/2, 0])
            circle(d=d, $fn=30);
        }
    }
    
    module capsule_3d(d=12, x=20, h=1) {
        hull() {
            translate([0, x/2, 0])
            cylinder(d=d, h=h, $fn=30);

            translate([0, -x/2, 0])
            cylinder(d=d, h=h, $fn=30);
        }
    }
    
    module curve(d=12, x=20) {
        difference() {
            rotate_extrude(convexity=10, $fn=80) {
                translate([20, 0, 0])
                capsule(d=d, x=x);
            }
            translate([-10, 24, -50/2])
            rotate([0, 0, -66])
            cube([50, 50, 50]);

            translate([-50, -25, -50/2])
            cube([50, 50, 50]);
        }
    }
    
    module fan_piece() {
        difference () {
            union() {
                translate([0, 0, 3])
                cube([42, 42, 6], center=true);

                hull() {
                    translate([-11, 25, 3])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=22, $fn=30);

                    translate([0, 23, 3])
                    cube([22, 4, 6], center=true);
                }
            }
            translate([-13, 25, 3])
            rotate([0, 90, 0])
            cylinder(d=bolt_hole_dia, h=26, $fn=30);

            cylinder(d=41 - 2*wall, h=7, $fn=40);

            translate([32/2, 32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);

            translate([-32/2, 32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);

            translate([32/2, -32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);

            translate([-32/2, -32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);
        }
    }

    fan_piece();
    
    difference() {
        hull() {
            translate([0, 0, 5])
            cylinder(d=41, h=1, $fn=40);

            translate([0, -7, 31])
            rotate([0, 0, 90])
            capsule_3d(d=8, x=25, h=1);
        }
        hull() {
            translate([0, 0, 5])
            cylinder(d=41 - 2*wall, h=1, $fn=40);

            translate([0, -7, 31])
            rotate([0, 0, 90])
            capsule_3d(d=8 - 2*wall, x=25, h=1);
        }
    }

    translate([0, 13, 32])
    rotate([0, -90, 0])
    difference() {
        curve(d=8, x=25);
        curve(d=8 - 2*wall, x=25);
    }

    module fan_nozzle_half(d1=8, d2=3, x=25) {
        intersection() {
            hull() {
                rotate([0, 0, 90])
                capsule_3d(d=d1, x=x, h=1);

                rotate([0, 0, 90])
                translate([(d1/2 - d2/2), -2, 10])
                capsule_3d(d=d2, x=x, h=1);
            }
            translate([0, -20, 0])
            cube([40, 40, 40]);
        }
    }

    module hollow_circle(d, x) {
        difference() {
            rotate([90, 0, 0])
            rotate_extrude(convexity=10, $fn=80) {
                translate([12, 0, 0])
                rotate([0, 0, 90])
                capsule(d=d, x=x);
            }
            hull() {
                translate([0, 2, 5])
                rotate([90, 0, 0])
                cylinder(d=13, h=5);

                translate([0, 2, 21])
                rotate([90, 0, 0])
                cylinder(d=13, h=5);
            }
            //translate([0, -10, 11])
            //rotate([0, 45, 0])
            //cube([20, 20, 20], center=true);

            translate([0, -10, 11])
            cube([12, 20, 20], center=true);
        }
    }

    translate([0, -5.1, 40.5])
    rotate([-21, 0, 0])
    difference() {
        union() {
            fan_nozzle_half(d2=3);

            mirror([1, 0, 0])
            fan_nozzle_half(d2=3);

            rotate([-26.5, 0, 0])
            translate([0, -2.51, 17])
            hollow_circle(3, 8);

            translate([0, 2.5, 11.2])
            rotate([-20, 0, 0])
            cube([11, 2.8, 1], center=true);            
        }
        union() {
            fan_nozzle_half(d1=8 - 4*nozzle, d2=1.4);

            mirror([1, 0, 0])
            fan_nozzle_half(d1=8 - 4*nozzle, d2=1.4);

            rotate([-26.5, 0, 0])
            translate([0, -2.91, 17])
            hollow_circle(3, 5);

            translate([0, 0, 10.2])
            rotate([-20, 0, 0])
            cube([11, 5, 3],center=true);
        }
    }
}

module fan_tunnel_arm() {
    length = 11;

    difference() {
        hull() {
            cylinder(d=6, h=26, $fn=30);

            translate([length, 0, 0])
            cylinder(d=6, h=26, $fn=30);

            translate([0, 6/2, 0])
            cube([length, 2, 26]);
        }
        translate([-3.5, 0, 2])
        hull() {
            cylinder(d=9, h=22, $fn=30);

            translate([3, 0, 0])
            cylinder(d=9, h=22, $fn=30);
        }

        translate([length - 0.5, 0, 2])
        hull() {
            cylinder(d=9, h=22, $fn=30);

            translate([3, 0, 0])
            cylinder(d=9, h=22, $fn=30);
        }
        cylinder(d=bolt_hole_dia, h=27, $fn=30);

        translate([length, 0, 0])
        cylinder(d=bolt_hole_dia, h=27, $fn=30);

        translate([length, -1, 2 + 22/2])
        rotate([0, 0, -35])
        cube([9, 15, 22], center=true);
    }
}

module fan_tunnel_arm2() {
    length = 8;
    gap = 22 + 2*slop;
    offset = (28 - gap)/2;
    difference() {
        hull() {
            cylinder(d=6, h=28, $fn=30);

            translate([length, 0, 0])
            cylinder(d=6, h=28, $fn=30);

            translate([0, 6/2, 0])
            cube([length, 3, 28]);
        }
        translate([-3.5, 0, offset])
        hull() {
            cylinder(d=9, h=gap, $fn=30);

            translate([3, 0, 0])
            cylinder(d=9, h=gap, $fn=30);
        }

        translate([length - 0.5, 0, offset])
        hull() {
            cylinder(d=9, h=gap, $fn=30);

            translate([3, 0, 0])
            cylinder(d=9, h=gap, $fn=30);
        }

        cylinder(d=bolt_hole_dia, h=28, $fn=30);

        translate([length, 0, 0])
        cylinder(d=bolt_hole_dia, h=28, $fn=30);

        translate([length, -1, offset + gap/2])
        rotate([0, 0, -35])
        cube([9, 15, gap], center=true);
    }
}

module cable_mount() {
    difference() {
        union () {
            translate([0, -4, 2])
            cube([50, 32, 4], center=true);

            translate([0, 9.5, 1/2])
            hull() {
                cube([45, 5, 1], center=true);

                translate([0, 0, 50])
                cube([15, 5, 1], center=true);
            }

            translate([5/2, 10, 4])
            rotate([90, 0, -90])
            linear_extrude(height=5)
            polygon(points=[
                [0,0], [15,0], [0,15]
            ]);
        }
        
        translate([-50/2 - 7, 0, 0])
        rotate([0, 0, 19])
        cube([20, 49.2, 50], center=true);

        translate([50/2 + 7, 0, 0])
        rotate([0, 0, -19])
        cube([20, 49.2, 50], center=true);

        translate([0, -24.5, -10.3])
        rotate([45, 0, 0])
        cube([60, 20, 50], center=true);

        translate([-13, 3, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([13, 3, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-9, -7, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([9, -7, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-5, -17, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([5, -17, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([0, -7, -1])
        cylinder(d=2.5, h=10, $fn=30);

        translate([-12, 6, 10])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([12, 6, 10])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([0, 6, 19])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([-10, 6, 19])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([10, 6, 19])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([0, 6, 28])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([-8, 6, 28])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([8, 6, 28])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([0, 6, 37])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([-6, 6, 37])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([6, 6, 37])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([-4, 6, 46])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);

        translate([4, 6, 46])
        rotate([-90, 0, 0])
        cylinder(d=4, h=7, $fn=30);
    }
}

module pcb_mount() {

    difference() {
        union() {
            // base
            hull() {
                translate([0, 0, 3/2])
                rounded_cube_side(
                    pcb_mount_w,
                    pcb_mount_l,
                    3, 9, center=true, $fn=60
                );

                translate([0, pcb_mount_l/2, 3/2])
                cube([22, 16, 3], center=true);
            }

            translate([0, -pcb_mount_l/2 + 11/2, 20/2])
            cube([30, 11, 20], center=true);

            // zip tie mount
            translate([0, pcb_mount_l/2 + 8/2, 8/2])
            cube([22, 8, 8], center=true);
        }

        // PCB cuts
        translate([0, 5.5, 3/2])
        cube([26, 21, 4], center=true);

        translate([0, 5.5, 3/2 + 1.5])
        cube([28, 23, 4], center=true);

        translate([-pcb_mount_w/2 + 4, 5.5, -0.1])
        cylinder(d=3.3, h=6, $fn=20);

        translate([pcb_mount_w/2 - 4, 5.5, -0.1])
        cylinder(d=3.3, h=6, $fn=20);

        // mount cut
        hull() {
            translate([0, -pcb_mount_l/2 + 5.2/2 + 1.5, 2])
            cube([15.2, 5.2, 1], center=true);

            translate([0, -pcb_mount_l/2 + 5.2/2 + 1.5, 52])
            cube([45.2, 5.2, 1], center=true);

        }

        translate([-6, -pcb_mount_l/2, 15.5])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([6, -pcb_mount_l/2, 15.5])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-6, -pcb_mount_l/2 + 7.5, 15.5])
        rotate([-90, 30, 0])
        M3_nut(4);

        translate([6, -pcb_mount_l/2 + 7.5, 15.5])
        rotate([-90, 30, 0])
        M3_nut(4);

        // cable rest groove
        translate([0, pcb_mount_l/2, 10/2 + 6])
        rotate([90, 0, 0])
        cylinder(d=10, h=20, center=true, $fn=40);

        translate([0, pcb_mount_l/2 + 4, -4.9])
        rotate([90, 0, 0])
        difference() {
            cube([
                17, 30, 3
            ], center=true);

            rounded_cube_side(
                13, 26, 4, 6,
                center=true, $fn=40
            );
        }
    }
}

module pcb_mount_fastener() {
    difference() {
        union() {
            hull() {
                translate([-pcb_mount_w/2 + 4, 0, 0])
                cylinder(d=7, h=2.6, $fn=20);

                translate([0, 0, 2.6/2])
                cube([30, pcb_mount_l - 12, 2.6], center=true);

                translate([pcb_mount_w/2 - 4, 0, 0])
                cylinder(d=7, h=2.6, $fn=20);
            }
            translate([-pcb_mount_w/2 + 4, 0, 0])
            cylinder(d=8, h=5, $fn=20);

            translate([pcb_mount_w/2 - 4, 0, 0])
            cylinder(d=8, h=5, $fn=20);
        }

        cube([25, 20, 14], center=true);

        translate([-pcb_mount_w/2 + 4, 0, -1])
        cylinder(d=3.3, h=6, $fn=20);

        translate([pcb_mount_w/2 - 4, 0, -1])
        cylinder(d=3.3, h=6, $fn=20);

        translate([-pcb_mount_w/2 + 4, 0, 3])
        M3_nut();

        translate([pcb_mount_w/2 - 4, 0, 3])
        M3_nut();
    }
}

module prusa_nozzle_fan_MK3() {
    %translate([9.5, 15.6, 7.5])
    rotate([90, 0, 180])
    import(str(
        stl_path,
        "50mm_Radial_fan/50mm_fan.stl"
    ));
    
    // fuck OpenSCAD, fuck it to hell. Cannot render the imported file. So redoing the whole thing
    //%translate([0, -20, 75]) import("../_downloaded/Prusa/mk25_upgrade_stl/extruder/nozzle-fan2.stl", convexity=10);
    
    module base_form() {
        
        union() {
            difference() {
                union() {
                    difference() {
                        translate([0, -5, 0])
                        cylinder(d=48, h=9, $fn=60);

                        translate([-60, -60, -0.01])
                        cube([120, 57, 20]);
                    }
                    translate([15.89, -3, 0])
                    hull() {
                        translate([-2, 0, 0])
                        cylinder(d=12, h=9, $fn=30);

                        translate([2, 0, 0])
                        cylinder(d=12, h=9, $fn=30);
                    }
                    translate([-15.89, -3, 0])
                    hull() {
                        translate([-2, 0, 0])
                        cylinder(d=12, h=9, $fn=30);

                        translate([2, 0, 0])
                        cylinder(d=12, h=9, $fn=30);
                    }
                    translate([0, 20, 9/2])
                    cube([36, 24, 9], center=true);
                }
                translate([0, -5, -0.01])
                cylinder(d=28, h=10, $fn=60);

                translate([13.2, -10, -0.01])
                rotate([0, 0, 20])
                cube([5, 10, 20], center=true);

                translate([-13.2, -10, -0.01])
                rotate([0, 0, -20])
                cube([5, 10, 20], center=true);

                translate([18.7, 27, -0.01])
                rotate([0, 0, 30])
                cube([8, 20, 20], center=true);

                translate([-18.7, 27, -0.01])
                rotate([0, 0, -30])
                cube([8, 20, 20], center=true);

                translate([0, -4.5, 10/2 + 6.7])
                rotate([9, 0, 0])
                cube([60, 30, 10], center=true);
            }
        }
    }

    module inner_form() {
        intersection() {
            union() {
                difference() {
                    linear_extrude(7, convexity=10)
                    offset(r=-1)
                    projection(cut=true)
                    base_form();

                    translate([0, -4, 10/2 + 4.7])
                    rotate([9, 0, 0])
                    cube([60, 30, 10], center=true);
                }
                translate([0, 23.2, 10/2 + 1])
                cube([20.2, 15.3, 10], center=true);

                translate([2.2, 22.5, 10/2 + 1])
                cube([20, 2.9, 10], center=true);
            }
            translate([0, 0, 10/2])
            hull() {
                translate([30, 25.8, 0])
                rotate([0, -90, 0])
                cylinder(d=10, h=60, $fn=40);

                translate([0, -30, 0])
                cube([60, 10, 10], center=true);

                translate([0, 25.9, 20])
                cube([60, 10, 10], center=true);
            }
        }
    }

    module final_form() {
        union() {
            difference() {
                union() {
                    base_form();

                    translate([13, 11.2, 8.99])
                    difference() {
                        cube([5, 6, 3]);

                        translate([-0.01, 1.8, 0])
                        cube([3, 2.4, 2.2]);
                    }
                    translate([-42, 27, 0])
                    cube([31, 5, 9]);

                    translate([-42, 30.5, 0])
                    cube([9, 2.5, 18]);
                }
                translate([0, 0, 1])
                inner_form();

                translate([0, -5, -0.01])
                cylinder(d=34, h=4.2, $fn=60);

                translate([-37.5, 35, 14.5])
                rotate([90, 0, 0])
                cylinder(d=3.8, h=10, $fn=30);
            }
            translate([-15.6, -4.3, 6/2])
            rotate([0, 0, 80])
            cube([1, 3, 6], center=true);

            translate([15.6, -4.3, 6/2])
            rotate([0, 0, -80])
            cube([1, 3, 6], center=true);

            translate([-12.9, 4.5, 5/2])
            rotate([0, 0, 55])
            cube([1, 4, 5], center=true);

            translate([12.9, 4.5, 5/2])
            rotate([0, 0, -55])
            cube([1, 4, 5], center=true);

            translate([-5.7, 10, 5/2])
            rotate([0, 0, 15])
            cube([1, 4, 5], center=true);

            translate([5.7, 10, 5/2])
            rotate([0, 0, -15])
            cube([1, 4, 5], center=true);

            translate([0, 12, 8/2])
            cube([0.8, 6, 8], center=true);

            translate([-9, 12.5, 9/2])
            rotate([0, 0, -50])
            cube([0.8, 8, 9], center=true);

            translate([9, 12.5, 9/2])
            rotate([0, 0, 50])
            cube([0.8, 8, 9], center=true);

            translate([-12, 18.5, 9/2])
            rotate([0, 0, -33])
            cube([0.8, 5, 9], center=true);

            translate([12, 18.5, 9/2])
            rotate([0, 0, 33])
            cube([0.8, 5, 9], center=true);

            translate([10, 31.9, 2])
            rotate([90, 0, 180])
            linear_extrude(1)
            text("Hot tamale!", size=5);
        }
    }
    //inner_form();
    final_form();
}


module prusa_nozzle_fan_MK3_45deg() {
    %translate([9.5, 15.6, 10.5])
    rotate([130, 0, 180])
    import(str(
        stl_path,
        "50mm_Radial_fan/50mm_fan.stl"
    ));
    
    difference() {
        union() {
            difference() {
                translate([0, -21.7, 53])
                nozzle_fan(mount=false);

                translate([11.3, 10, 9])
                cube([20, 20, 20]);
            }
            translate([13, 9.2, 8.99])
            difference() {
                cube([5, 6, 3]);

                translate([-0.01, 1.8, 0])
                cube([3, 2.4, 2.2]);
            }
            translate([-46, 12, 0])
            intersection() {
                cube([36, 19, 5]);

                translate([0, 11, 0])
                rotate([0, 0, -20])
                cube([31, 17, 5]);
            }

            translate([-45, 26.40, 0])
            rotate([-40, 0, 0])
            cube([15, 4, 14]);
        }
        translate([-50, 16.6, 11.65])
        rotate([-40, 0, 0])
        cube([50, 15, 5]);

        translate([-46, 16.6, -5])
        cube([20, 20, 5]);

        translate([-37.5, 35, 3.4])
        rotate([50, 0, 0])
        cylinder(d=3.8, h=10, $fn=30);
    }
}

module prusa_nozzle_fan_MK3_45deg_adapter() {
    difference() {
        intersection() {
            union() {
                cube([10, 5, 10]);

                translate([0, 0, 5])
                rotate([-40, 0, 0])
                cube([10, 5, 10]);
            }
            translate([0, 0, 0])
            cube([10, 10, 10]);
        }
        translate([10/2, 0, 4.15])
        rotate([-90, 0, 0])
        cylinder(d=2.8, h=10, $fn=20);

        translate([10/2, 0, 11.2])
        rotate([-130, 0, 0])
        cylinder(d=2.8, h=15, $fn=20);
    }
}

module prusa_nozzle_fan_MK3_45deg_holder() {
    difference() {
        union()
        {
            translate([-4, 36.5, -25])
            cube([6, 45, 30]);

            translate([-4, 36.5, -25])
            cube([15, 10, 30]);

            translate([-4, 68, -12])
            rotate([50, 0, 0])
            cube([10, 15, 11.1]);

            translate([5.5, 67.15, -6.65])
            rotate([50, 0, 0])
            cylinder(r=6.1, h=7, $fn=6);
        }

        translate([5.5, 42, 1])
        rotate([90, 0, 0])
        cylinder(r=1.6, h=10, $fn=30);

        translate([5.5, 46.9, 1])
        rotate([90, 0, 0])
        cylinder(r=3.1, h=5, $fn=30);

        //#translate([5.5, 70, -7])
        //rotate([50, 0, 0])
        //cylinder(r=1.6, h=15, $fn=60);

        translate([5.5, 70, -8.5])
        rotate([50, 0, 0])
        cylinder(r=1.6, h=15, $fn=60);

        translate([5.5, 65, -4.2])
        rotate([50, 0, 0])
        cylinder(r=3.1, h=17, $fn=6);

        translate([-25, 46.1, -55])
        rotate([50, 0, 0])
        cube([50, 150, 15]);

        translate([-25, 46.5, -66])
        rotate([50, 0, 0])
        cube([50, 150, 15]);

        translate([-25, 86, 4])
        rotate([50 + 90, 0, 0])
        cube([50, 150, 15]);

        translate([-25, 86, 13.5])
        rotate([170, 0, 0])
        cube([50, 150, 15]);

        translate([-25, 86, -12])
        rotate([175, 0, 0])
        cube([50, 150, 15]);

        translate([-5, 35, -25])
        cube([20, 45, 16]);
    }
}

module mount_clamp_prusafan(hotend="e3dv6"){
    difference() {
        union() {
            translate([-29/2, -11, -2.7])
            cube([29, 40, 10.4]);

            translate([-29/2, -13, -40.3])
            cube([29, 2, 48]);

            translate([-12, -13, -40.3])
            cube([52, 2, 10]);

            translate([-20 + 57.5, -13, -34.8])
            rotate([-90, 0, 0])
            cylinder(d=7, h=5, $fn=30);
        }
        translate([-30/2, 5, -2.71])
        cube([30, 30, 5.4]);

        translate([-29/2 - 1, -14, -38.3])
        cube([2.5, 4, 40]);

        // hot end neck
        translate([0, 6, -10])
        cylinder(d=12, h=20, $fn=40);

        if (hotend == "prometheus") {
            translate([0, 6, -3.9])
            cylinder(d=16.2, h=2, $fn=40);
        }
        hull() {
            translate([0, 6, 5.4/2 - 0.02])
            cylinder(d=18, h=20, $fn=40);

            translate([0, 46, 5.4/2 - 0.02])
            cylinder(d=18, h=20, $fn=40);
        }
        // hot end clamp bolt holes
        translate([-50/2 + 15, -10, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia, h=30, $fn=30);

        translate([-50/2 + 12, -10, 0])
        cube([7, 14, 5.4], center=true);

        translate([-50/2 + 15, -20, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_head_hole_dia, h=17, $fn=30);

        translate([50/2 - 15, -10, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia, h=30, $fn=30);

        translate([50/2 - 12, -10, 0])
        cube([7, 14, 5.4], center=true);

        translate([50/2 - 15, -20, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_head_hole_dia, h=17, $fn=30);

        // fan holes
        translate([-50/2 + 20, -14, 3.2])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia - 0.4, h=10, $fn=30);

        translate([-20 + 57.5, -14, -34.8])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia - 0.4, h=10, $fn=30);
    }
}

module hotend_clamp_prusafan_clip() {
    difference() {
        union() {
            translate([0, 0, 3/2])
            cube([29, 10, 3], center=true);

            translate([0, 0, 5/2 + 2.99])
            cube([17.5, 10, 5], center=true);
        }
        translate([5, 0, -0.1]) {
            cylinder(d1=4.5, d2=3.3, h=1.5, $fn=20);
            cylinder(d=3.3, h=10, $fn=20);
        }
        translate([-5, 0, -0.1]) {
            cylinder(d1=4.5, d2=3.3, h=1.5, $fn=20);
            cylinder(d=3.3, h=10, $fn=20);
        }
    }
}

module prusa_nozzle_fan_MK3ish() {
    %translate([9.5, 4.1, 4.7])
    rotate([130, 0, 180])
    import(str(
        stl_path,
        "50mm_Radial_fan/50mm_fan.stl"
    ));

    %translate([2.6, 0, 0])
    import(str(
        "../Original-Prusa-i3/Printed-Parts/STL/",
        "fan-shroud.stl"
    ));

    module _outer() {
        difference() {
            union() {
                // main form
                hull() {
                    translate([-4, -6, -8.1])
                    cylinder(d=27.5, h=12, $fn=60);

                    translate([4, -6, -8.1])
                    cylinder(d=27.5, h=12, $fn=60);

                    translate([-4, -8.9, -8.1])
                    cylinder(d=26, h=12, $fn=60);

                    translate([4, -8.9, -8.1])
                    cylinder(d=26, h=12, $fn=60);

                    translate([0, 15, -8])
                    rotate([-40, 0, 0])
                    translate([0, -12/2, 5/2])
                    cube([23, 12, 5], center=true);
                }
                // fan throat
                translate([0, 15, -8])
                rotate([-40, 0, 0])
                translate([0, -18/2, 5/2])
                union() {
                    cube([22, 18, 5], center=true);

                    translate([22/2, 0, 0])
                    cube([5, 5, 5], center=true);
                }

                // fan mount
                hull() {
                    translate([-9, 3, 1/2 - 8.1])
                    cube([40, 3, 1], center=true);

                    translate([-19.4, 3, 8/2 + 10.6])
                    cube([45, 3, 3], center=true);

                    translate([-7, 3, -1/2 + 47.6])
                    cube([35, 3, 1], center=true);
                }

                rotate([50, 0, 0])
                translate([-37.5, 13.1, 0])
                hull() {
                    cylinder(d=10, h=11, $fn=20);

                    translate([1, -6, 0])
                    cylinder(d=2, h=1, $fn=10);
                }

                rotate([50, 0, 0])
                translate([5, 51.1, 0])
                cylinder(d=10, h=11, $fn=20);

                rotate([50, 0, 0])
                hull() {
                    translate([5, 51.1, 0])
                    cylinder(d=10, h=3, $fn=20);

                    translate([5, 8, 3/2])
                    cube([10, 1, 3], center=true);
                }

                rotate([50, 0, 0])
                hull() {
                    translate([5, 51.1, 0])
                    cylinder(d=10, h=3, $fn=20);

                    translate([-37.5, 13.1, 0])
                    cylinder(d=10, h=3, $fn=20);
                }

                rotate([-40, 0, 0])
                translate([5, -22/2, 31])
                cube([10, 22, 3], center=true);

                rotate([-40, 0, 0])
                translate([-18, -22/2, 31])
                cube([10, 22, 3], center=true);
            }

            translate([0, -10, 12.65])
            rotate([30.4, 0, 0])
            translate([0, -10, 0])
            cube([50, 25, 20], center=true);

            hull() {
                translate([-7.9, -10.1,0])
                cylinder(
                    d=7.1, h=40, center=true, $fn=40
                );

                translate([ 7.9, -10.1, 0])
                cylinder(
                    d=7.1, h=40, center=true, $fn=40
                );

                translate([0, -30, 0])
                cube(
                    [2*7.9 + 7.1, 1, 40], center=true
                );
            }

            translate([-10.68, -19, 0])
            rotate([0, 0, -38])
            cube([5, 5, 40], center=true);

            translate([10.68, -19, 0])
            rotate([0, 0, 38])
            cube([5, 5, 40], center=true);
        }
    }

   module _inner() {
        difference() {
            union() {
                hull() {
                    translate([-4, -6, -7.1])
                    cylinder(d=25.5, h=10, $fn=60);

                    translate([4, -6, -7.1])
                    cylinder(d=25.5, h=10, $fn=60);

                    translate([-4, -8.9, -7.1])
                    cylinder(d=24, h=10, $fn=60);

                    translate([4, -8.9, -7.1])
                    cylinder(d=24, h=10, $fn=60);

                    translate([0, 14, -7])
                    rotate([-40, 0, 0])
                    translate([0, -9/2, 5/2])
                    cube([19.3, 9, 5], center=true);
                }
                translate([0, 14, -7])
                rotate([-40, 0, 0])
                translate([0, -15.3/2, 5.1/2])
                union() {
                    cube([19.3, 15.3, 5.1], center=true);

                    translate([19.3/2, 0, 0])
                    cube([4, 2.5, 5], center=true);
                }

                rotate([50, 0, 0])
                translate([-37.5, 13.1, 0]) {
                    cylinder(
                        d=3.3, h=25,
                        center=true, $fn=20
                    );

                    translate([0, 0, 7])
                    rotate([0, 0, 30])
                    M3_nut(6);
                }

                rotate([50, 0, 0])
                translate([5, 51.1, 0]) {
                    cylinder(
                        d=3.3, h=25,
                        center=true, $fn=20
                    );

                    translate([0, 0, 7])
                    rotate([0, 0, 30])
                    M3_nut(6);
                }

                translate([1, 0, 43])
                rotate([90, 0, 0])
                cylinder(
                    d=3.3, h=20, center=true, $fn=30
                );

                translate([-20, 0, 43])
                rotate([90, 0, 0])
                cylinder(
                    d=3.3, h=20, center=true, $fn=30
                );

                translate([0, -9, -10/2 - 4])
                cube([19, 20, 10], center=true);

                translate([0, -17, -10/2 - 4])
                cube([25.5, 20, 10], center=true);
            }

            translate([0, -10, 11.35])
            rotate([30.4, 0, 0])
            cube([50, 50, 20], center=true);

            translate([0, 0, 40/2 - 4.1])
            hull() {
                translate([-7.9, -10.1, 0])
                cylinder(
                    d=9.1, h=40, center=true, $fn=40
                );

                translate([7.9, -10.1, 0])
                cylinder(
                    d=9.1, h=40, center=true, $fn=40
                );

                translate([0, -30, 0])
                cube(
                    [2*7.9 + 9.1, 1, 40], center=true
                );
            }

            translate([0, 14, -7])
            rotate([-40, 0, 0])
            translate([0, 0, 2])
            cube([20, 2, 1], center=true);

            translate([0, 14, -7])
            rotate([-40, 0, 0])
            translate([0, -15.5, 2])
            cube([20, 2, 1], center=true);
        }
    }
    
    module _supports() {
        translate([11.7, -12.1, 3.8/2 - 8.1])
        cube([1.6, 10, 3.8], center=true);

        translate([-11.7, -12.1, 3.8/2 - 8.1])
        cube([1.6, 10, 3.8], center=true);

        translate([0, -6, -8.1])
        hull() {
            translate([0, 0, -1/2 + 3.8])
            cube([22, 2, 1], center=true);

            translate([0, 0, 1/2])
            cube([17, 2, 1], center=true);
        }
    }

    difference() {
        _outer();
        _inner();
    }
    _supports();
}

module mount_clamp_prusa_MK3ish(hotend="e3dv6"){
    difference() {
        hull() {
            translate([0, -7.4/2, 3.6/2])
            cube([29, 17.4, 9], center=true);

            translate([
                10/2, -17.4/2 + 6/2 - 7.4/2,
                3.6/2
            ])
            cube([39, 6, 9], center=true);
        }
        // hot end neck
        translate([0, 6, -10])
        cylinder(d=12, h=20, $fn=40);

        if (hotend == "prometheus") {
            translate([0, 6, -3.9])
            cylinder(d=16.2, h=2, $fn=40);
        }
        translate([0, 6, 5.4/2])
        cylinder(d=18, h=20, $fn=40);

        // hot end clamp bolt holes
        translate([-50/2 + 15, -14, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia, h=30, $fn=30);

        //translate([-50/2 + 12, -14, 0])
        //cube([7, 14, 5.4], center=true);

        translate([-50/2 + 15, -14, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_head_hole_dia + 1,h=7, $fn=30);

        translate([50/2 - 15, -14, 0])
        rotate([-90, 0, 0])
        cylinder(d=bolt_hole_dia, h=30, $fn=30);

        //translate([50/2 - 12, -14, 0])
        //cube([5, 14, 5.4], center=true);

        translate([50/2 - 15, -14, 0])
        rotate([-90, 0, 0])
        cylinder(
            d=bolt_head_hole_dia + 1, h=7, $fn=30
        );

        translate([50/2 - 5, -17, 1.7])
        rotate([-90, 0, 0])
        cylinder(d=2.9, h=20, $fn=30);

        translate([50/2 - 5, -10, 1.7])
        rotate([-90, 0, 0])
        hull() {
            rotate([0, 0, 30])
            M3_nut(2.6, cone=false);

            translate([0, -5, 0])
            rotate([0, 0, 30])
            M3_nut(2.6, cone=false);
        }

        #translate([50/2 - 26, -17, 1.7])
        rotate([-90, 0, 0])
        cylinder(d=2.9, h=13, $fn=30);

        translate([50/2 - 26, -10, 1.7])
        rotate([-90, 0, 0])
        hull() {
            rotate([0, 0, 30])
            M3_nut(2.6, cone=false);

            translate([0, -5, 0])
            rotate([0, 0, 30])
            M3_nut(2.6, cone=false);
        }
    }
}

module _delta_p_fan_mount_form() {
    union() {
        hull() {
            translate([18.65, 0, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );

            translate([2, -5, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );

            translate([-2, -7, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );

            translate([14, -30, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );
        }

        hull() {
            translate([-2, -6, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );

            translate([-36, -4, 0])
            chamfered_cylinder(
                5, 4, 0.5, $fn=30
            );

            translate([-36, -7, 0])
            chamfered_cylinder(
                5, 4, 0.5, $fn=30
            );
        }

        hull() {
            translate([19.1, -57.5, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );

            translate([14, -27.5, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );

            translate([-9, -17.5, 0])
            chamfered_cylinder(
                9, 4, 0.5, $fn=30
            );
        }

        translate([-15.4, -22, 4/2])
        chamfered_cube(40, 34, 4, 0.5, center=true);

        // mount
        translate([-20.9, -41.5, 7.2/2])
        intersection() {
            chamfered_cube(29, 28, 7.2, 0.5, center=true);

            chamfered_cube_side(
                29, 28, 7.2, 4, center=true
            );
        }

        // groove
        translate([-20.9, -41.5, 7.2])
        rotate([0, 45, 0])
        cube([2.9, 27, 2.9], center=true);
    }
}

module delta_p_fan_mount() {
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

                translate([-34, -5.1, 0])
                cylinder(
                    d=10, h=20,
                    center=true, $fn=30
                );

                translate([-30.9, -40.3, 0])
                hull() {
                    cylinder(
                        d=8, h=30,
                        center=true, $fn=30
                    );

                    translate([0, -6, 0])
                    cylinder(
                        d=8, h=30,
                        center=true, $fn=30
                    );
                }

                translate([-30.9 + 20, -40.3, 0])
                hull() {
                    cylinder(
                        d=8, h=30,
                        center=true, $fn=30
                    );

                    translate([0, -6, 0])
                    cylinder(
                        d=8, h=30,
                        center=true, $fn=30
                    );
                }
            }
        }
    }

    difference() {
        _delta_p_fan_mount_form();

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

        translate([-30.9, -40.3, 0])
        hull() {
            cylinder(d=3.3, h=30, center=true, $fn=30);

            translate([0, -6, 0])
            cylinder(d=3.3, h=30, center=true, $fn=30);
        }

        translate([-30.9 + 20, -40.3, 0])
        hull() {
            cylinder(d=3.3, h=30, center=true, $fn=30);

            translate([0, -6, 0])
            cylinder(d=3.3, h=30, center=true, $fn=30);
        }

        _infill();
    }
}

module delta_p_duct_mockup() {
    // cannot render so only a mockup
//    difference() {
//        translate([0, 0, 24.14])
//        rotate([0, 0, -90])
//        translate([-120, -104, 0])
//        import(str(
//            stl_path,
//            "X2 Delta P Duct V2R2.2/",
//            "V2R2.2-duct_mod2-no LED_ps_fixed.stl"
//        ), convexity=10);

//        translate([-21.4, 0, 23.2])
//        rotate([90, 0, 0])
//        cylinder(d=24, h=50, center=true, $fn=40);
//
//        translate([-10, 20/2, 21.3])
//        cube([30, 20, 20], center=true);
//    }

    //delta_p_duct_prometheus_connector();

    rotate([0, 0, -90])
    translate([-120, -104, 0])
    import(
        "Cube_X_Carriage_delta_p_V2R2.2-duct_X2-no_LEDs.stl",
        convexity=10
    );
}

//!delta_p_duct_mockup();

module delta_p_duct_prometheus_connector() {
    rotate([0, 0, 90])
    intersection() {
        hull() {
            translate([-14.3, -1.95, 20.3])
            rotate([90, 0, 0])
            chamfered_cylinder(7.1, 4, 0.5, $fn=30);

            translate([-8.3, -1.95, 10.3])
            rotate([90, 0, 0])
            chamfered_cylinder(12.1, 4, 0.5, $fn=30);

        }

        difference() {
            translate([-18, 0, 21.3])
            rotate([90, 0, -20])
            cylinder(d=18, h=50, center=true, $fn=40);

            translate([-14.3, -1.95, 20.3])
            rotate([90, 0, 0])
            cylinder(d=3.7, h=100, center=true, $fn=40);
        }
    }
}

module prometheus_hotend_fan_adapter() {
    difference() {
        intersection() {
            union() {
                chamfered_cube_side(
                    22, 15, 4, 2, center=true
                );

                translate([-22/2 + 8/2, -7, 0])
                chamfered_cube_side(
                    8, 15, 4, 2, center=true
                );

                translate([4.2, -0.3, 5])
                rotate([-12, -19, 0])
                cube([13, 12, 14], center=true);
            }

            translate([0, 0, 40/2 - 4/2])
            union() {
                chamfered_cube_side(
                    22, 15, 40, 2, center=true
                );

                translate([-22/2 + 8/2, -7, 0])
                chamfered_cube_side(
                    8, 15, 40, 2, center=true
                );
            }

        }
        translate([6.4, 1.22, 11.8])
        rotate([-12, -19, 0])
        cube([10, 5.1, 14], center=true);

        translate([-6.7, 0, 20/2 + 4/2 + 0.01])
        cube([10, 20, 20], center=true);

        translate([-7, 4])
        cylinder(d=3.2, h=10, center=true, $fn=20);

        translate([-7, -11])
        cylinder(d=3.2, h=10, center=true, $fn=20);

        translate([6.3, 0, 8.2])
        rotate([90 - 12, -19, 0])
        cylinder(d=3.2, h=20, center=true, $fn=20);

        translate([6.3, 0, 8.2])
        rotate([90 - 12, -19, 0])
        translate([0, 0, 3.5])
        rotate([0, 0, 11])
        M3_nut(3, cone=false);
    }
}

module e3d_hotend_fan_40mm() {
    module _body() {
        hull() {
            translate([0, 19, 26/2])
            cube([25, 0.1, 26], center=true);

            translate([0, 0, 41/2 - 3])
            rotate([78, 0, 0])
            chamfered_cube_side(
                41, 41, 4,
                2.5, center=true
            );
        }
    }

    difference() {
        union() {
            _body();

            hull() {
                translate([0, 31, 0])
                cylinder(d=25, h=26, $fn=60);

                translate([0, 19, 26/2])
                cube([25, 0.1, 26], center=true);
            }

            difference() {
                translate([-40/2 - 2.5, 2.1, 15.325])
                rotate([-12, 0, 0])
                chamfered_cube_side(
                    10, 9, 5, 1.5, center=true
                );

                translate([-40/2 + 3, 2, 15])
                rotate([-12, 0, -7])
                cube([5, 10, 10], center=true);

                translate([-24, 2.3, 15])
                rotate([-12, 0, 0])
                cylinder(
                    d=3.4, h=10, center=true, $fn=20
                );
            }
        }

        translate([0, 20/2 + 34, 0])
        cube([30, 20, 100], center=true);

        difference() {
            union() {
                translate([0, 31, 0])
                cylinder(d=22.2, h=100, center=true, $fn=60);

                translate([0, 19 + 12/2, 24/2 + 1])
                rotate([90, 0, 0])
                rounded_cube_side(
                    22.2, 24, 12, 3, center=true, $fn=30
                );
            }

            translate([-22.2/2 - 2, 33, 24.25])
            chamfered_cube_side(
                6, 6, 1.2, 2, center=true
            );

            translate([22.2/2 + 2, 33, 24.25])
            chamfered_cube_side(
                6, 6, 1.2, 2, center=true
            );

            translate([-22.2/2 - 2, 33, 1.75])
            chamfered_cube_side(
                6, 6, 1.2, 2, center=true
            );

            translate([22.2/2 + 2, 33, 1.75])
            chamfered_cube_side(
                6, 6, 1.2, 2, center=true
            );
        }

        _screw_holes();

        hull() {
            translate([0, 19, 24/2 + 1])
            //cube([22.2, 0.1, 24], center=true);
            rotate([90, 0, 0])
            rounded_cube_side(
                22.2, 24, 0.1, 3, center=true, $fn=30
            );

            translate([0, -0.6, (40 - 1.5)/2 + 1/2 - 2])
            rotate([78, 0, 0])
            cylinder(d=40 - 1.5, h=2, $fn=70);
        }
    }
}
