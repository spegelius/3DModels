include<../../lib/bearings.scad>;
include<../../Dollo/NEW_long_ties/mockups.scad>;
include <common.scad>;
use<../../Dollo/NEW_long_ties/extention.scad>;
use<../../Dollo/NEW_long_ties/corner.scad>;
use<../../PSUCover/PSUCover.scad>;
use <Single_z_remix.scad>;
use <z_support_remix.scad>;
use <Mega_gantry_remix.scad>;
use <Tronxy_X5S.scad>;
use <Motor_mount_remix.scad>;
use <Top_frame.scad>;
use <Purge_bucket.scad>;
use <E3D_mount_remix.scad>;
use <X5S_legs.scad>;
use <duet_case.scad>;
use <Bed_carriage.scad>;


stl_base_path = "../../_downloaded/";

z_pos = 420;


////// VIEW //////
X5S_frame_mockup();
X5S_x_carriage_mockup();
X5S_bed_mockup();

debug_z_support();
//debug_PSUs();
//debug_single_z();
//debug_gantry_plates();
//debug_corner_bearing_mounts();
//debug_motor_mount_remix();
//debug_top_frame();
//debug_purge_bucket();
//debug_tronxy_cable_pcb_mount();
//debug_E3D_mount();
debug_duet_case();
//debug_legs();
//debug_bed_carriage();


////// MODULES //////
module X5S_frame_mockup() {

    color("darkgrey")
    render()
    translate([0, 0, frame_z/2])
    difference() {
        cube([frame_x, frame_y, frame_z], center=true);

        cube(
            [frame_x - 40, 600, frame_z - 40],
            center=true
        );

        cube(
            [600, frame_y - 80, frame_z - 40],
            center=true
        );

        cube(
            [frame_x - 40, frame_y - 40, 600],
            center=true
        );
    }

    // x-beam
    color("darkgrey")
    render()
    translate([0, 0, frame_z - 20/2 + 4])
    cube([450, 20, 20], center=true);

    // z rods
    color("silver")
    render()
    translate([-frame_x/2 + 10, 65, 21])
    cylinder(d=8, h=528, $fn=30);

    color("silver")
    render()
    translate([-frame_x/2 + 10, -65, 21])
    cylinder(d=8, h=528, $fn=30);
}

module X5S_bed_mockup() {

    _pos = 330/2 - 5;

    module _bed() {

        difference() {
            cube([330, 330, 3], center=true);

            translate([-_pos, -_pos, 0])
            cylinder(d=3, h=20, center=true, $fn=20);

            translate([0, -_pos, 0])
            cylinder(d=3, h=20, center=true, $fn=20);

            translate([_pos, -_pos, 0])
            cylinder(d=3, h=20, center=true, $fn=20);

            translate([-_pos, _pos, 0])
            cylinder(d=3, h=20, center=true, $fn=20);

            translate([0, _pos, 0])
            cylinder(d=3, h=20, center=true, $fn=20);

            translate([_pos, _pos, 0])
            cylinder(d=3, h=20, center=true, $fn=20);

        }
    }

    module _bed_beam() {
        difference() {
            cube([542, 10, 10], center=true);

            // mount holes
            translate([-545/2 + 7.5, 0, 0])
            cylinder(d=4, h=30, center=true, $fn=20);

            translate([-545/2 + 27.5, 0, 0])
            cylinder(d=4, h=30, center=true, $fn=20);

            translate([545/2 - 7.5, 0, 0])
            cylinder(d=4, h=30, center=true, $fn=20);

            translate([545/2 - 27.5, 0, 0])
            cylinder(d=4, h=30, center=true, $fn=20);

            // bed mount holes
            cylinder(d=3.5, h=30, center=true, $fn=20);

            translate([bed_x/2 - 5, 0, 0])
            cylinder(d=3.5, h=30, center=true, $fn=20);

            translate([-bed_x/2 + 5, 0, 0])
            cylinder(d=3.5, h=30, center=true, $fn=20);

            // extra M3 thread mount holes
            translate([-542/2 + 55, 0, 0])
            cylinder(d=3, h=30, center=true, $fn=20);

            translate([-542/2 + 65, 0, 0])
            cylinder(d=3, h=30, center=true, $fn=20);
        }
    }

    // bed
    color("lightgrey")
    translate([0, 0, z_pos + 5/2])
    _bed();

    color("lightgrey")
    translate([0, z_plate_len/2 - 10/2, z_pos - 10/2 - 7])
    _bed_beam();

    color("lightgrey")
    translate([0, -z_plate_len/2 + 10/2, z_pos - 10/2 - 7])
    _bed_beam();
}

module X5S_x_carriage_mockup() {
    _d = 3;

    module _plate() {
        union() {
            hull() {
                translate([70/2 - _d/2, 62/2 - _d/2, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([-70/2 + _d/2, 62/2 - _d/2, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([70/2 - _d/2, 62/2 - _d/2 - 46, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([-70/2 + _d/2, 62/2 - _d/2 - 46, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([44/2, -62/2 + _d/2, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([-44/2, -62/2 + _d/2, 0])
                cylinder(d=_d, h=2, $fn=30);
            }

            hull() {
                translate([18/2 - _d/2, 62/2 + 22 -_d/2, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([-18/2 + _d/2, 62/2 + 22 -_d/2, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([18/2 - _d/2, 62/2, 0])
                cylinder(d=_d, h=2, $fn=30);

                translate([-18/2 + _d/2, 62/2, 0])
                cylinder(d=_d, h=2, $fn=30);

            }
        }
    }

    module _holes() {
        // top cable holder holes
        translate([-18/2 + 5, 62/2 + 22 - 9, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);

        translate([18/2 - 5, 62/2 + 22 - 9, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);


        // belt holes
        translate([-70/2 + 3 + 3/2, 62/2 - 5 - 15/2, 0])
        cube([3, 15, 6], center=true);

        translate([70/2 - 3 - 3/2, 62/2 - 5 - 15/2, 0])
        cube([3, 15, 6], center=true);


        // roller holes
        translate([-70/2 + 15, 62/2 - 17, 0])
        cylinder(d=4.5, h=6, center=true, $fn=20);

        translate([70/2 - 15, 62/2 - 17, 0])
        cylinder(d=4.5, h=6, center=true, $fn=20);

        translate([-70/2 + 15, 62/2 - 57, 0])
        cylinder(d=4.5, h=6, center=true, $fn=20);

        translate([70/2 - 15, 62/2 - 57, 0])
        cylinder(d=4.5, h=6, center=true, $fn=20);



        translate([-70/2 + 5, 62/2 - 37, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);

        translate([-70/2 + 5, 62/2 - 47, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);

        translate([70/2 - 2, 62/2 - 27, 0])
        cylinder(d=1.8, h=6, center=true, $fn=20);

        translate([70/2 - 2, 62/2 - 36.5, 0])
        cylinder(d=1.8, h=6, center=true, $fn=20);

        translate([-70/2 + 30.5, -62/2 + 20, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([70/2 - 30.5, -62/2 + 20, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([-70/2 + 26, -62/2 + 11, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([70/2 - 26, -62/2 + 11, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([-70/2 + 26, -62/2 + 3, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([70/2 - 26, -62/2 + 3, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([0, -62/2 + 10, 0])
        cylinder(d=3.1, h=6, center=true, $fn=20);

        translate([-70/2 + 28, 62/2 - 37, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);

        translate([70/2 - 28, 62/2 - 37, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);
    }



    module _spacer() {
        color("LightGrey")
        tube(8, 8.5, 1.5, $fn=20);
    }

    translate([0, -16.25, 570])
    rotate([90, 0, 180])
    group() {
        difference() {
            _plate();
            _holes();
        }

        translate([-70/2 + 15, 62/2 - 17, 10.5 + 11/2])
        roller();

        translate([-70/2 + 15, 62/2 - 17, 2])
        _spacer();

        translate([70/2 - 15, 62/2 - 17, 10.5 + 11/2])
        roller();

        translate([70/2 - 15, 62/2 - 17, 2])
        _spacer();

        translate([-70/2 + 15, 62/2 - 57, 10.5 + 11/2])
        roller();

        translate([-70/2 + 15, 62/2 - 57, 2])
        _spacer();

        translate([70/2 - 15, 62/2 - 57, 10.5 + 11/2])
        roller();

        translate([70/2 - 15, 62/2 - 57, 2])
        _spacer();

        color("Grey")
        translate([70/2 - 15, 62/2 - 17, -15])
        cylinder(d=4.5, h=40, $fn=30);

        color("Grey")
        translate([-70/2 + 15, 62/2 - 17, -15])
        cylinder(d=4.5, h=40, $fn=30);

        color("Grey")
        translate([70/2 - 15, 62/2 - 57, -15])
        cylinder(d=4.5, h=40, $fn=30);

        color("Grey")
        translate([-70/2 + 15, 62/2 - 57, -15])
        cylinder(d=4.5, h=40, $fn=30);
    }
}

module debug_z_support() {
    render()
    translate([-frame_x/2 + 10, 0, z_pos])
    rotate([180, 0, -90])
    new_z_support(final_render=false);
}

module debug_PSUs() {
    // PSU1
    translate([205, 255, 129]) {
        rotate([0, 90, 90])
        mock_PSU_240W();

        translate([59, -2.25, -55.5])
        rotate([0, -90, 0])
        cover_240W_with_2020_ear();

        translate([-187, -5, -55.5])
        rotate([0, 90, 90])
        bottom_bracket2();
    }

    // PSU2
    translate([-50, 255, 132]) {
        rotate([0, 90, 90])
        mock_PSU_600W();

        translate([35, -2, -53.5])
        rotate([0, -90, 0])
        cover2_360W_with_2020_ear();

        translate([-182.5, -5, -57])
        rotate([0, 90, 90])
        bottom_bracket1();
    }
}

module debug_single_z() {

    translate([-530/2 + 10, 0, 570 - 20 - 25.5 - 453])
    cylinder(d=8, h=453, $fn=20);

    render()
    translate([-530/2 + 10, 0, 20])
    intersection() {
        z_bottom();
        //translate([-100, -0, 0])
        //cube([200, 200, 35]);
    }

    translate([-530/2 + 10, 0, 570 - 20])
    rotate([180, 0, 180])
    z_top(screw_bearing=true);

    color("white")
    translate([-530/2 + 10, 65, 570 - 25])
    rotate([180, 0, 180])
    rod_clip();

//    color("white")
//    translate([-530/2 + 10, 0, 570 - 25])
//    rotate([180, 0, 180])
//    z_screw_clip();

    %translate([-530/2 + 10, 0, 30])
    color("white")
    625zz();

    //translate([-530/2 + 10, 0, 36])
    //import("../../_downloaded/Parametric_pulley/GT2_40teeth.stl");
    
    // axle
    translate([-530/2 + 10, 0, 30])
    cylinder(d=5, h=45, $fn=20);

    translate([-530/2 + 10, 0, 51.5])
    rotate([180, 0, 0])
    z_pulley_40t();

    translate([-530/2 + 10, 0, 43.5])
    rotate([180, 0, 0])
    z_pulley_40t_retainer();

    translate([0, 160, 0])
    rotate([0, 0, 90])
    z_motor_mount();

    // belt
    %translate([0, -12.5, 47])
    cube([510, 1, 6], center=true);

    %translate([-262, 10.5, 44])
    rotate([0, 0, 23])
    cube([278, 1, 6]);

    %translate([-8, 120, 44])
    rotate([0, 0, -2.6])
    cube([1, 41, 6]);

    // belt length:
    // - 510: across
    // - 278: from pulley to motor idler
    // - 41: from idler to motor pulley
    // - 16: motor pulley
    // - 0.90*80: pulley
    echo(510 + 278*2 + 41*2 + 0.90*80 + 16);

    // center beam, 10mm threaded rod
    translate([0, 0, 10])
    rotate([0, 90, 0])
    cylinder(d=10, h=475, center=true, $fn=40);

    // center beam mounts
    translate([-490/2, 0, 10])
    rotate([90, 0, 90])
    center_rod_mount();

    translate([490/2, 0, 10])
    rotate([90, 0, -90])
    center_rod_mount();

    // z rod support
    translate([-490/2 + 15, 0, 57])
    rotate([90, 0, 0])
    z_rod_support();
}

module debug_gantry_plates() {
    translate([-530/2 + 45.9, 0, 579])
    rotate([0, 180, 90]) {
        tronxy_mega_gantry_left();

        translate([0, -4.65, -29.6])
        top_bearing_support_left();
    }

    translate([530/2 - 41.45, 0, 579])
    rotate([0, 180, 90])
    tronxy_mega_gantry_right();

    %translate([-530/2 + 30, -23, 580])
    mock_idler();

    %translate([-530/2 + 30, -23, 592])
    mock_idler();

    %translate([530/2 - 30, -23, 580])
    mock_idler();

    %translate([530/2 - 30, -23, 592])
    mock_idler();
}

module debug_corner_bearing_mounts() {
    translate([-530/2, -460/2 -20, 570])
    tronxy_corner_bearing_mount_left();

    translate([530/2, -460/2 - 20, 570])
    tronxy_corner_bearing_mount_right();

    // idlers
    %translate([-530/2 + 30, -460/2 + 6, 580])
    mock_idler_24();

    %translate([-530/2 + 30, -460/2 + 6, 592])
    mock_idler();

    %translate([530/2 - 30, -460/2 + 6, 580])
    mock_idler();

    %translate([530/2 - 30, -460/2 + 6, 592])
    mock_idler_24();

    // belts
    color("DarkSlateGray")
    translate([-530/2 + 13, 0, 585.5])
    rotate([0, 0, 1.2])
    cube([2, 600, 6], center=true);

    color("DarkSlateGray")
    translate([530/2 - 20, -120, 585.5])
    cube([2, 250, 6], center=true);

    color("DarkSlateGray")
    translate([138, -13, 585.5])
    cube([210, 2, 6], center=true);

    color("DarkSlateGray")
    translate([530/2 - 20, 120, 597])
    cube([2, 300, 6], center=true);

    color("DarkSlateGray")
    translate([138, -33, 597])
    cube([210, 2, 6], center=true);

    color("DarkSlateGray")
    translate([-138, -33, 585.5])
    cube([210, 2, 6], center=true);

    color("DarkSlateGray")
    translate([-138, -13, 597])
    cube([210, 2, 6], center=true);
}

module debug_motor_mount_remix() {
    stl_path = "../../_downloaded/Tronxy_X5S_nema_mounting/";

    //translate([-530/2 + 45, 500/2 - 20, 530])
    //rotate([0, 0, 90])
    //import(str(stl_path, "equerre_moteur_X.STL"));

    //translate([530/2 - 45, 500/2 - 20, 575])
    //rotate([0, 180, -90])
    //import(str(stl_path, "Sym_equerre_moteur_X.STL"));

    translate([-530/2 + 13, 500/2 + 34, 575])
    rotate([0, 180, 90])
    new_mount_Y();

    translate([530/2 - 13, 500/2 + 34, 575])
    rotate([0, 180, -90])
    new_mount_X();

    %translate([-530/2 + 13, 500/2 + 26, 575])
    cylinder(d=12, h=10, $fn=30);

    %translate([530/2 - 13, 500/2 + 26, 591])
    cylinder(d=12, h=10, $fn=30);
}

module debug_top_frame() {
    render()
    translate([0, 0, 570 - 20 - 7])
    top_frame_assembly();
}

module debug_purge_bucket() {
    translate([0, -500/2 + 57, 570 - 100/2 - 20 - 35])
    bucket();

    translate([0, -500/2 + 20/2, 570 - 20 - 5/2])
    rotate([180, 0, 0])
    bucket_mount();

    translate([0, -500/2 + 20/2 + 3.5, 570 - 28.5 - 10/2])
    rotate([0, 90, 0])
    bucket_arm();

    //39, 43
    translate([70, -500/2 + 20])
    cube([10, 39 + 24, 600]);
}

module debug_tronxy_cable_pcb_mount() {
    translate([-11.2, -14.1, 654.2])
    rotate([180, 0, 90])
    intersection() {
        tronxy_cable_pcb_mount();

        translate([100/2 + 1, 0, 0])
        cube([100, 100, 200], center=true);
    }
}

module debug_E3D_mount() {
    translate([-33.5, -14.25, 575.5])
    rotate([90, 0, 0])
    tronxy_E3D_mount();
}

module debug_duet_case_old() {
    case_path = str(
        stl_base_path,
        "Duet_Wifi_2020_case/Bottom_V1_v3_rmx.stl"
    );

    translate([-120, -150, -41.5])
    rotate([0, 0, 90])
    import(case_path, convexity=10);

    translate([510/2, 0, -7/2])
    rotate([0, 0, 90])
    duet_case_frame_adapter();
}

module debug_duet_case() {

    translate([158, 230, 280])
    rotate([0, -90, -90])
    debug_case();

    translate([246.5, 252.5, 280])
    rotate([0, 0, 180])
    duet_case_mount_adapter();
}

module debug_legs() {
    translate([-530/2 + 19, -500/2 + 19, 0])
    rotate([180, 0, 0])
    render()
    leg(130);

    translate([530/2 - 19, -500/2 + 19, 0])
    rotate([180, 0, 90])
    render()
    leg(130);

    translate([530/2 - 19, 500/2 - 19, 0])
    rotate([180, 0, 180])
    render()
    leg(130);

    translate([-530/2 + 19, 500/2 - 19, 0])
    rotate([180, 0, -90])
    render()
    leg(130);
}

module debug_bed_carriage() {
    translate([0, 0, z_pos - 21])
    debug_X5S_bed_carriage();
}