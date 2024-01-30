use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../Dollo/NEW_long_ties/extention.scad>;
use <../Dollo/NEW_long_ties/corner.scad>;
//use <../PCCase/case_models.scad>;
use <../PCCase/case_218_400_400.scad>;
use <../PCCase/cover.scad>;
use <../PCCase/psu.scad>;
use <../PCCase/fans.scad>;
include <../PCParts/common.scad>;
use <../PCParts/case_profile.scad>;
use <../PCParts/hdrack.scad>;
use <ChiaPi.scad>;
use <../PSUCover/PSUCover.scad>;


width = 218;
depth = 400;
height = 400;


//debug();
//debug_PSU_backplate();
//debug_hdd_carriage();
//debug_hdd_adapters();
//debug_chiapi2_PSU_connector_base();

//mock_mains_switch_big();

//chiapi2_mount_beam();
//chiapi2_beam_extention_adapter();
//chiapi2_PSU_backplate();
//chiapi2_PSU_240W_cover();
//chiapi2_PSU_connector_base();
//chiapi2_PSU_support();
//chiapi2_extention_t();
//chiapi2_extention_125mm();
//chiapi2_extention_68mm();
//chiapi2_corner_75mm();
//chiapi2_hdd_carriage();
//chiapi2_hdd_carriage_clip1();
//chiapi2_hdd_carriage_clip2();
//chiapi2_bottom_cover();
//chiapi2_front_grills();
//chiapi2_front_cover_bottom();
//chia2_top_covers();
//chiapi2_back_cover();
//chiapi2_cover_snap_clips();

//chiapi2_adapter_seagate_top();
//chiapi2_adapter_other_usb_top();
//chiapi2_adapter_wd_top();
//chiapi2_adapter_wd_bottom();
//chiapi2_adapter_ssd_usb_1_bottom();
chiapi2_adapter_ssd_usb_2_bottom();
//chiapi2_adapter_ssd_usb_3_bottom();
//chiapi2_adapter_ssd_usb_4_bottom();

//chiapi2_fan_mount_140mm();
//chiapi2_fan_mount_120mm();
//chiapi2_fan_end_mount_120mm();
//chiapi2_side_cover_mount();
//chiapi2_side_cover_mount_split_centers();
//chiapi2_side_cover_mount_split_rings();
//chiapi2_side_cover_back();
//chiapi2_side_cover_front();

//chiapi2_side_cover_front_p1();
//chiapi2_side_cover_front_p2();
//chiapi2_side_cover_front_p3();
//chiapi2_side_cover_front_p4();

//chiapi2_side_cover_front_p1_green();
//chiapi2_side_cover_front_p1_white();
//chiapi2_side_cover_front_p1_red();
//chiapi2_side_cover_front_p1_other();

//chiapi2_side_cover_front_p2_green();
//chiapi2_side_cover_front_p2_white();
//chiapi2_side_cover_front_p2_other();

//chiapi2_side_cover_front_p3_green();
//chiapi2_side_cover_front_p3_white();
//chiapi2_side_cover_front_p3_black();
//chiapi2_side_cover_front_p3_other();

//chiapi2_side_cover_front_p4_green();
//chiapi2_side_cover_front_p4_orange();
//chiapi2_side_cover_front_p4_black();
//chiapi2_side_cover_front_p4_other();

//chiapi2_side_cover_back_p1_green();
//chiapi2_side_cover_back_p1_white();
//chiapi2_side_cover_back_p1_red();
//chiapi2_side_cover_back_p1_other();

//chiapi2_side_cover_back_p2_green();
//chiapi2_side_cover_back_p2_white();
//chiapi2_side_cover_back_p2_other();

//chiapi2_side_cover_back_p3_green();
//chiapi2_side_cover_back_p3_white();
//chiapi2_side_cover_back_p3_black();
//chiapi2_side_cover_back_p3_other();

//chiapi2_side_cover_back_p4_green();
//chiapi2_side_cover_back_p4_orange();
//chiapi2_side_cover_back_p4_black();
//chiapi2_side_cover_back_p4_other();

//chiapi2_side_cover_split_clip();
//chiapi2_fan_mount_m3_adapter();

//mains_switch_big_clamp();



module debug() {

    translate([188, 370, 0])
    rotate([0, 0, 180])
    case_mockup();

    translate([149, 301, 17.2])
    rotate([0, 0, 180])
    mock_PSU_240W();

    translate([94, 114, 0])
    rotate([90, 0, 180])
    chiapi2_PSU_support();

    render()
    translate([94, 16, 220])
    rotate([-90, 0, 0])
    chiapi2_hdd_carriage();

    translate([175, 300, 280])
    rotate([0, 0, 180])
    debug_raspberry_pi_clips();

//    translate([162, 300.8, 180])
//    rotate([0, 0, -90])
//    debug_D_link_clips();

//    translate([162, 300.8, 95])
//    rotate([0, 0, -90])
//    debug_D_link_clips();

//    translate([185, 300, 185])
//    rotate([0, 90, 0])
//    chiapi2_mount_beam();

//    translate([188, 300, 350])
//    rotate([0, 0, 90])
//    chiapi2_beam_extention_adapter();

//    render()
//    translate([158/2 + 15, 363.5, 17])
//    rotate([90, 0, 180])
//    chiapi2_PSU_backplate();

    render()
    translate([158/2 + 15, 363, 58])
    rotate([-90, 0, 180])
    chiapi2_PSU_240W_cover();

//    translate([94, 244.9, 73])
//    rotate([180, 0, 0])
//    chiapi2_PSU_connector_base();

    translate([94, 244.9, 73])
    rotate([0, 0, 180])
    debug_chiapi2_PSU_connector_base();

//    render()
//    translate([94, 360, 231])
//    rotate([90, 0, 180])
//    chiapi2_back_cover();

    translate([width/2 - 30/2, 30/2 - 15, 45])
    rotate([90, 0, 0])
    fan_mount_140mm(width);

    //translate([width/2 - 30/2, depth - 30/2 - 15, 191.7])
    //rotate([90, 0, 180])
    //fan_mount_dual_140mm(width);
    //fan_mount_dual_120_140mm(width);

    translate([width/2 - 30/2, 30/2 - 15, 228])
    rotate([90, 0, 0])
    fan_mount_120mm(width);
}

module debug_PSU_backplate() {
    translate([0, 0, 2])
    rotate([90, 0, 0])
    chiapi2_PSU_backplate();

    translate([0, 1, atx_psu_height/2])
    rotate([-90, 0, 0])
    chiapi2_PSU_240W_cover();

//    translate([-69.75, -6.5, 0])
//    PSU_plate_mount_1();
}

module debug_hdd_carriage() {
    chiapi2_hdd_carriage();

    translate([94.1, -67, 0])
    rotate([0, 90, 180])
    chiapi2_hdd_carriage_clip1();

    translate([-94.1, -67, 0])
    rotate([0, 90, 0])
    chiapi2_hdd_carriage_clip1();


    translate([80, -67, 125])
    chiapi2_hdd_carriage_clip2();
}

module debug_hdd_adapters() {
    intersection() {
        chiapi2_hdd_carriage();

        translate([0, 0, 170])
        cube([300, 400, 50], center=true);
    }

    translate([7, 130.5, 96])
    rotate([90, 0, 0])
    chiapi2_adapter_seagate_top();
}

module debug_chiapi2_PSU_connector_base() {

    translate([19, -50, 3])
    rotate([0, 0, 90])
    mock_stepdown_converter_2();

    translate([43, -33.5, 3])
    rotate([0, 0, -90])
    mock_stepdown_converter_3();

    rotate([0, 180, 0])
    chiapi2_PSU_connector_base();

    translate([9.3, -12, 6])
    rotate([29, 0, 90])
    mock_liitinrima_small();

    translate([9.3, 17, 6])
    rotate([29, 0, 90])
    mock_liitinrima_small(4);

    translate([-33.7, -14, 5.5])
    rotate([-22.8, 0, 90])
    mock_liitinrima_big(6);
}

module mock_mains_switch_big() {
    translate([0, 0, 2/2])
    cube([32, 25.3, 2], center=true);

    hull() {
       translate([0, 0, 2 + 12/2])
       cube([30, 21.5, 12], center=true);

       translate([0, 0, 6])
       cube([32.8, 21.5, 0.1], center=true);

    }
}

module _seagate_usb() {
    union() {
        cube([35.4, 176, 121], center=true);

        translate([-35/2 + 9, -176/2, -121/2 + 23])
        rotate([90, 0, 0])
        cylinder(d=10, h=40, center=true);

        translate([-35/2 + 6.5, -176/2, -121/2 + 42])
        cube([4.5, 40, 16], center=true);
    }
}

module _other_usb() {
    // other usb box
    cube([31.7, 182, 117], center=true);
}

module _wd_usb() {
    // WD 8T
    union() {
        cube([49, 139.7, 171], center=true);

        translate([49/2 - 10, 139.7/2, -171/2 + 30])
        rotate([90, 0, 0])
        cylinder(d=10, h=40, center=true);
    }
}

module _ssd_usb_1() {
    cube([12.5, 123, 77], center=true);
}

module _ssd_usb_2() {
    cube([13, 126, 75.5], center=true);
}

module _ssd_usb_3() {
    cube([13, 130, 78], center=true);
}

module _ssd_usb_4() {
    cube([9, 102, 32], center=true);
}

module _hdds() {

    translate([-49, 21.5, 171/2 + 55])
    _wd_usb();

    // Seagates
    translate([0, 3, 121/2 + 55])
    rotate([0, 0, 180])
    _seagate_usb();

    translate([42, 3, 121/2 + 55])
    rotate([0, 0, 180])
    _seagate_usb();

    translate([0, 3, 121 * 1.5 + 60])
    rotate([0, 0, 180])
    _seagate_usb();

    translate([42, 0, 117/2 + 121 + 60])
    _other_usb();

    // usb ssds
    translate([-67, 30, 77/2 + 55 + 177])
    _ssd_usb_1();

    translate([-49, 30, 77/2 + 55 + 177])
    _ssd_usb_1();

    translate([-30.5, 28.5, 75.5/2 + 55 + 177])
    _ssd_usb_2();

    translate([19.5, 26.5, 13/2 + 55 + 252.5])
    rotate([0, 90, 0])
    _ssd_usb_3();

    translate([-50, 40.5, 9/2 + 55 + 259.5])
    rotate([0, 90, 0])
    _ssd_usb_4();
}

module mock_cord_socket() {
    translate([0, 0, 3.2/2])
    cube([30.6, 22.8, 3.2], center=true);

    hull() {
       translate([0, 0, 3.2 + 10/2])
       cube([26.8, 20, 10], center=true);

       translate([0, 0, 7.2])
       cube([26.8, 24.3, 0.1], center=true);
    }
}

module chiapi2_mount_beam() {
    rotate([0, 90, 0])
    _profile_v2(340);
}

module chiapi2_beam_extention_adapter() {
    difference() {
        chamfered_cube_side(
            60, 30, 10, 9, center=true
        );

        // dovetails
        translate([-12, 0, 5.01])
        rotate([-90, 0, 90])
        male_dovetail();

        translate([12, 0, 5.01])
        rotate([-90, 0, -90])
        male_dovetail();

        // profile hole
        translate([0, 3, -7])
        linear_extrude(20)
        offset(0.15)
        projection()    
        _profile_v2(30);

        translate([0, 3, 0])
        cube([10, 10, 40], center=true);

        // chamfers
        translate([0, 20, -9.7])
        rotate([45, 0, 0])
        cube([80, 15, 15], center=true);

        translate([0, -20, -5])
        rotate([45, 0, 0])
        cube([80, 15, 15], center=true);
    }
}

module _PSU_screw_holes(d=3.2, h=10) {
    translate([-57, 73/2, 0])
    cylinder(d=d, h=h);

    translate([57, 73/2, 0])
    cylinder(d=d, h=h);

    translate([-57, -73/2, 0])
    cylinder(d=d, h=h);

    translate([57, -73/2, 0])
    cylinder(d=d, h=h);
}

module chiapi2_PSU_backplate() {
    difference() {
        _PSU_backplate_base(218);

        translate([0, 73/2 + 7, -1])
        _PSU_screw_holes(d=4, h=10, $fn=30);

        translate([0, 73/2 + 7, 2])
        _PSU_screw_holes(d=8, h=10, $fn=30);

        translate([0, 43.5, 0])
        chamfered_cube(
            120, 80, 80, 13, center=true
        );
    }
}

module chiapi2_backplate() {
    // not used
    difference() {
        union() {
            translate([0, 0, 7/2])
            cube([139.6, 70, 7], center=true);

            translate([140/2, 25/2 - 70/2, 0])
            long_bow_tie_half(25);

            translate([140/2, -25/2 + 70/2, 0])
            long_bow_tie_half(25);

            translate([-140/2, 25/2 - 70/2, 0])
            long_bow_tie_half(25);

            translate([-140/2, -25/2 + 70/2, 0])
            long_bow_tie_half(25);

            translate([0, 70/2, 0])
            rotate([0, 0, 90])
            long_bow_tie_half(30);
        }

        // cord socket hole
        translate([30, 0, 0])
        hull() {
            cube([22.8, 30.6, 1], center=true);

            translate([0, 0, 8])
            cube([24, 33, 1], center=true);
        }

        translate([30, 0, 10/2 + 4])
        rounded_cube_side(
            38, 45, 10, 6, center=true, $fn=30
        );

        translate([30 + 20/2 + 5, 18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([30 + 20/2 + 5, -18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([30 - 20/2 - 5, 18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([30 - 20/2 - 5, -18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([30 - 20/2 - 5, -18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

        translate([30 - 20/2 - 5, 18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

        translate([30 + 20/2 + 5, -18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

        translate([30 + 20/2 + 5, 18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);


        // mains switch hole, big
        translate([-30, 0, 0])
        hull() {
            cube([32, 25.3, 1], center=true);

            translate([0, 0, 8])
            cube([44, 33, 1], center=true);
        }

        translate([-30, 0, 10/2 + 4])
        rounded_cube_side(
            48, 45, 10, 6, center=true, $fn=30
        );

        translate([-30 - 30/2 - 5, 18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-30 - 30/2 - 5, 18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

        translate([-30 - 30/2 - 5, -18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-30 - 30/2 - 5, -18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

        translate([-30 + 30/2 + 5, 18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-30 + 30/2 + 5, 18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

        translate([-30 + 30/2 + 5, -18.5, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-30 + 30/2 + 5, -18.5, 1])
        cylinder(d1=3.3, d2=7.2, h=3.2, $fn=30);

    }
}

module mains_switch_big_clamp() {
    difference() {
        translate([0, 0, 5/2])
        cube([45, 10, 5], center=true);

        translate([0, 5, 0])
        rotate([25, 0, 0])
        translate([0, 10/2, 0])
        cube([22, 10, 20], center=true);

        translate([20, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        translate([-20, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);
    }
}

module cord_socket_clamp() {
    difference() {
        translate([0, 0, 5/2])
        cube([44, 10, 5], center=true);

        translate([0, 5, 0])
        rotate([35, 0, 0])
        translate([0, 10/2, 0])
        cube([27, 10, 20], center=true);

        translate([19, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        translate([-19, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);
    }
}

module chiapi2_extention_t() {
    extention_t(
        units1=125/30, units2=1.5,
        _offset=-17.5, supports=true
    );
}

module chiapi2_extention_125mm() {
    extention(125/30);
}

module chiapi2_extention_68mm() {
    extention(68/30);
}

module chiapi2_corner_75mm() {
    full_corner(
        w=45, support=true, extra_stiff=true,
        side_support=true
    );
}

module chiapi2_PSU_support() {

    module _main_form() {
        difference() {
            translate([0, 17/2, 0])
            cube([163, 17, 15], center=true);

            translate([0, -60/2 + 12, 0])
            chamfered_cube(
                148, 60, 30, 5, center=true
            );

            translate([158/2 + 20/2, 0, 0])
            cube([22, 30, 20], center=true);

            translate([-158/2 - 20/2, 0, 0])
            cube([22, 30, 20], center=true);
        }
    }

    difference() {
        intersection() {
            union() {
                _main_form();

                translate([-158/2, 0, 0])
                rotate([-90, 0, 0])
                long_bow_tie_half(15);

                translate([158/2, 0, 0])
                rotate([-90, 0, 0])
                long_bow_tie_half(15);
            }

            rotate([90, 0, 0])
            cylinder(d=167.6, h=100, center=true, $fn=200);
        }

        // mount screw holes
        translate([-45, 20, 0])
        rotate([90, 0, 0])
        cylinder(d=3.7, h=40, center=true, $fn=30);

        translate([41, 20, 0])
        rotate([90, 0, 0])
        cylinder(d=3.7, h=40, center=true, $fn=30);

        //chamfers
        translate([168/2 + 2.5, 17, 0])
        rotate([0, 0, 45])
        cube([12, 12, 20], center=true);

        translate([-168/2 - 2.5, 17, 0])
        rotate([0, 0, 45])
        cube([12, 12, 20], center=true);

        translate([168/2 - 5.9, -16, 0])
        rotate([0, 0, 45])
        cube([12, 12, 20], center=true);

        translate([-168/2 + 5.9, -16, 0])
        rotate([0, 0, 45])
        cube([12, 12, 20], center=true);

    }

//    %translate([-110/2, -14, 61])
//    rotate([-90, 0, 0])
//    mock_PSU_240W();
}

module chiapi2_hdd_carriage() {
    module _stoppers() {
//        translate([7, 189, 93])
//        rotate([90, 0, 0])
//        _hdds();

        translate([66, -125, 52])
        cube([2, 16.8, 1], center=true);

        translate([-13.5, -125, 52])
        cube([2, 16.8, 1], center=true);

        translate([66, -125, 52])
        cube([2, 16.8, 1], center=true);

        translate([-26.3, -129, 80.5])
        cube([2, 14.8, 1], center=true);

        translate([-59.6, -129, 80.5])
        cube([2, 14.8, 1], center=true);

        translate([-51, -121, 59])
        cube([34, 3, 1], center=true);

        translate([-51, -42, 59])
        cube([34, 3, 1], center=true);

        translate([-23.5, -119.2, 56.5])
        cube([17, 3, 1], center=true);

        translate([-23.5, -42, 56.5])
        cube([17, 3, 1], center=true);

        translate([-42, -38, 43])
        cube([52, 3, 1], center=true);

        translate([-42, 134.5, 43])
        cube([52, 3, 1], center=true);

        translate([6, 134.5, 6])
        cube([41, 3, 1], center=true);

        translate([6, 12.5, 6])
        cube([41, 3, 1], center=true);

        translate([6, 8.5, 6])
        cube([41, 3, 1], center=true);

        translate([6, -113.5, 6])
        cube([41, 3, 1], center=true);

        translate([49, 134.5, 6])
        cube([41, 3, 1], center=true);

        translate([49, 12.5, 6])
        cube([41, 3, 1], center=true);

        translate([49, 8.5, 1/2])
        cube([41, 3, 1], center=true);

        translate([49, -110, 1/2])
        cube([41, 3, 1], center=true);
    }

    difference() {
        union() {
            translate([0, 0, 180/2])
            cube([142, 279, 180], center=true);

            translate([0, 3, 13/2])
            chamfered_cube_side(
                162, 250, 13, 10, center=true
            );

            // bottom ties
            translate([162/2 - 0.01, -80, 13/2])
            rotate([90, 0, 90])
            long_tie(13);

            translate([162/2 - 0.01, -67, 13/2])
            rotate([90, 0, 90])
            long_tie(13);

            translate([162/2 - 0.01, -54, 13/2])
            rotate([90, 0, 90])
            long_tie(13);

            translate([162/2 - 0.01, 80, 13/2])
            rotate([90, 0, 90])
            long_tie(13);

            translate([162/2 - 0.01, 67, 13/2])
            rotate([90, 0, 90])
            long_tie(13);

            translate([162/2 - 0.01, 54, 13/2])
            rotate([90, 0, 90])
            long_tie(13);

            translate([-162/2 + 0.01, -80, 13/2])
            rotate([90, 0, -90])
            long_tie(13);

            translate([-162/2 + 0.01, -67, 13/2])
            rotate([90, 0, -90])
            long_tie(13);

            translate([-162/2 + 0.01, -54, 13/2])
            rotate([90, 0, -90])
            long_tie(13);

            translate([-162/2 + 0.01, 80, 13/2])
            rotate([90, 0, -90])
            long_tie(13);

            translate([-162/2 + 0.01, 67, 13/2])
            rotate([90, 0, -90])
            long_tie(13);

            translate([-162/2 + 0.01, 54, 13/2])
            rotate([90, 0, -90])
            long_tie(13);

            translate([-162/2 + 5, -67, 1.5/2])
            chamfered_cube_side(
                20, 40, 1.5, 2, center=true
            );

            translate([-162/2 + 5, 67, 1.5/2])
            chamfered_cube_side(
                20, 40, 1.5, 2, center=true
            );

            translate([162/2 - 5, -67, 1.5/2])
            chamfered_cube_side(
                20, 40, 1.5, 2, center=true
            );

            translate([162/2 - 5, 67, 1.5/2])
            chamfered_cube_side(
                20, 40, 1.5, 2, center=true
            );

            // upper ties
            translate([142/2 - 0.01, 54, 123 + 15/2])
            rotate([90, 0, 90])
            long_tie(15);

            translate([142/2 - 0.01, 67, 123 + 15/2])
            rotate([90, 0, 90])
            long_tie(15);

            translate([142/2 - 0.01, 80, 123 + 15/2])
            rotate([90, 0, 90])
            long_tie(15);

            translate([142/2 - 0.01, -54, 123 + 15/2])
            rotate([90, 0, 90])
            long_tie(15);

            translate([142/2 - 0.01, -67, 123 + 15/2])
            rotate([90, 0, 90])
            long_tie(15);

            translate([142/2 - 0.01, -80, 123 + 15/2])
            rotate([90, 0, 90])
            long_tie(15);

            hull() {
                translate([142/2 + 4.5, 0, 125 - 1.5/2])
                cube([1, 273, 1.5], center=true);

                translate([142/2, 0, 125 - 6.5/2])
                cube([0.1, 279, 6.5], center=true);
            }

            hull() {
                translate([-142/2 - 4.5, 7.8, 125 - 1.5/2])
                cube([1, 255, 1.5], center=true);

                translate([-142/2, 7.8, 125 - 1.5/2])
                cube([0.1, 262, 13], center=true);
            }
        }

        difference() {
            translate([0, 0, -1])
            linear_extrude(500)
            offset(delta=1.6)
            projection()
            translate([7, 189, 93])
            rotate([90, 0, 0])
            _hdds();

            // hdd stoppers
            _stoppers();

        }

        // hdd hole forming
        translate([-20, 50, 0])
        cube([10, 140, 500], center=true);

        translate([22, 72, 0])
        cube([10, 100, 500], center=true);

        translate([34, 72, 0])
        cube([10, 100, 500], center=true);

        translate([22, -50, 0])
        cube([10, 100, 500], center=true);

        translate([35, -50, 0])
        cube([10, 90, 500], center=true);

        translate([63, -50, 0])
        cube([10, 90, 500], center=true);

        translate([49, -69, 0])
        cube([27, 91, 500], center=true);

        translate([27, -132, 0])
        cube([70, 8, 500], center=true);

        translate([-19.7, -132.5, 0])
        cube([6, 20, 500], center=true);

        translate([-68.4, -134, 0])
        cube([10, 20, 500], center=true);

        translate([30.9, -146.9, -4])
        rotate([0, 90, 0])
        chamfered_cube_side(
            120, 60, 90, 25, center=true
        );

        translate([-50.9, -153.9, -4])
        rotate([0, 90, 0])
        chamfered_cube_side(
            134, 60, 90, 25, center=true
        );

        translate([-62, -153.9, -3])
        rotate([0, 90, 0])
        chamfered_cube_side(
            185, 60, 90, 25, center=true
        );

        translate([-32, -80.75, 0])
        rotate([90, 0, 90])
        chamfered_cube_side(
            78.7, 136, 10, 33, center=true
        );

        translate([-49, -81.5, 0])
        rotate([90, 0, 90])
        chamfered_cube_side(
            80.2, 136, 10, 34, center=true
        );

        translate([26.5, -136, 0])
        rotate([90, 0, 0])
        chamfered_cube_side(
            81.2, 168, 10, 35, center=true
        );

        translate([-43, -136, 7])
        rotate([90, 0, 0])
        chamfered_cube_side(
            35.2, 170, 10, 15, center=true
        );

        // cuts
        for (i = [0:4]) {
            translate([0, -75 + i*45, 36])
            _side_cut();

            translate([0, -75 + i*45, 85])
            _side_cut();

            translate([0, -75 + i*45, 155])
            _side_cut();
        }

        translate([-42, 0, 35])
        _end_cut();

        translate([-42, 0, 130])
        _end_cut();

        translate([4, 116, 35])
        _end_cut();

        translate([4, 0, 130])
        _end_cut();

        translate([44, 116, 35])
        _end_cut();

        translate([44, 0, 130])
        _end_cut();
    }

    %translate([7, 189, 93])
    rotate([90, 0, 0])
    _hdds();

    %translate([94, 0, -15])
    rotate([90, 0, 0])
    extention(7);

    %translate([-94, 0, -15])
    rotate([90, 0, 0])
    extention(7);

    %translate([94, 0, -15 + 140])
    rotate([90, 0, 0])
    extention(7);
}

module chiapi2_hdd_carriage_clip1() {
    difference() {
        union() {
            long_bow_tie_half(40);

            translate([-11.4/2 - 1.6, 0, 13/2])
            cube([11.4, 40, 13], center=true);
        }

        // chamfer
        translate([-14, 0, 0])
        rotate([0, 55, 0])
        cube([13, 50, 10], center=true);

        // dove cuts
        translate([5, 13, 13.1])
        rotate([-90, 0, 90])
        male_dovetail();

        translate([-15, 13, 11.5])
        rotate([90, 0, 90])
        male_dovetail();

        translate([5, 0, 13.1])
        rotate([-90, 0, 90])
        male_dovetail();

        translate([-15, 0, 11.5])
        rotate([90, 0, 90])
        male_dovetail();

        translate([5, -13, 13.1])
        rotate([-90, 0, 90])
        male_dovetail();

        translate([-15, -13, 11.5])
        rotate([90, 0, 90])
        male_dovetail();

    }
}

module chiapi2_hdd_carriage_clip2() {
        difference() {
            union() {
                long_bow_tie_half(40);

                translate([-8/2, 0, 13/2])
                cube([8, 40, 13], center=true);
            }

        // dove cuts
        translate([-8.01, 13, -1])
        rotate([0, 0, -90])
        male_dovetail();

        translate([-8.01, 0, -1])
        rotate([0, 0, -90])
        male_dovetail();

        translate([-8.01, -13, -1])
        rotate([0, 0, -90])
        male_dovetail();
    }
}

module chiapi2_bottom_cover() {
    bottom(218, 400, fan_hole=false);
}

module chiapi2_PSU_240W_cover() {
    w = 123;

    difference() {
        union() {
            translate([0, 15.75, 3])
            cover_240W(grills=false, socket_hole=false);

            translate([0, 0, 7/2])
            cube([
                w, atx_psu_height, 7
            ], center=true);

            difference() {
                translate([-20, -16, 50/2])
                rounded_cube_side(
                    25, 16, 50, 7, center=true, $fn=30
                );

                translate([-20, -9.4, 50/2])
                rounded_cube_side(
                    21.8, 26, 60, 5.4, center=true, $fn=30
                );

                translate([0, -10/2, 0])
                cube([100, 10, 200], center=true);
            }
            
        }

        // hex grill
        difference() {
            intersection() {
                hexagon_form(
                    -83, -300, 50, 8, 0, h=15
                );

                chamfered_cube(
                    w - 10, atx_psu_height - 7, 60, 9
                , center=true);
            }

            translate([25, 14, 0])
            cube([54, 34, 30], center=true);

            translate([24, 15, 0])
            cube([12, 52, 30], center=true);

            translate([0, -10, 0])
            cube([w, 3, 20], center=true);
        }

        // cable cuts
        translate([-20, -10, 20/2 + 8])
        cube([21.8, 20, 20], center=true);

        translate([-14, -10, 55])
        cube([2, 10, 3], center=true);

        translate([-26, -10, 55])
        cube([2, 10, 3], center=true);

        // mount screw holes
        translate([0, -2.5, -1])
        _PSU_screw_holes(d=2.8, h=7, $fn=30);

        // AC socket hole
        translate([25, 14, 0])
        cord_socket_hole_AC_14_F1(nuts=true, $fn=30);

        // chamfers
        translate([w/2, atx_psu_height/2, 0])
        rotate([0, 0, 45])
        cube([5, 10, 20], center=true);

        translate([-w/2, atx_psu_height/2, 0])
        rotate([0, 0, -45])
        cube([5, 10, 20], center=true);

        translate([-w/2, -atx_psu_height/2, 0])
        rotate([0, 0, 45])
        cube([4, 10, 20], center=true);

        translate([w/2, -atx_psu_height/2, 0])
        rotate([0, 0, -45])
        cube([4, 10, 20], center=true);
    }

//    %translate([0, atx_psu_height/2, 0])
//    rotate([90, 0, 0])
//    mock_atx_psu();
}

module chiapi2_front_grills() {
    front_cover_grills_218_400_400();
}

module chiapi2_front_cover_bottom() {
    front_cover_bottom(width, 35);
}

module chia2_top_covers() {
    top_covers_218_400_400();
}

module chiapi2_back_cover() {
    w = 218 - 60 - 0.5;
    l = 400 - 60 - 92 - 0.5;

    module _inner() {
        difference() {
            difference() {
                translate([0, 0, 12/2 + 3])
                cube([w - 12, l - 12, 12], center=true);

                translate([w/2, l/2, 0])
                rotate([0, 0, 45])
                cube([23, 23, 40], center=true);

                translate([-w/2, l/2, 0])
                rotate([0, 0, 45])
                cube([23, 23, 40], center=true);

            }

            translate([0, l/2 - 1, 0])
            cube([14, 14, 40], center=true);

            translate([w/2 - 1, 0, 0])
            cube([14, 14, 40], center=true);

            translate([-w/2 + 1, 0, 0])
            cube([14, 14, 40], center=true);

            translate([w/2 - 1, l/3, 0])
            cube([14, 14, 40], center=true);

            translate([-w/2 + 1, l/3, 0])
            cube([14, 14, 40], center=true);

            translate([w/2 - 1, -l/2 + 20, 0])
            cube([14, 14, 40], center=true);

            translate([-w/2 + 1, -l/2 + 20, 0])
            cube([14, 14, 40], center=true);
        }
    }

    difference() {
        translate([0, 0, 12/2])
        cube([w, l, 12], center=true);

        // chamfers
        translate([w/2, l/2, 0])
        rotate([0, 0, 45])
        cube([10, 60, 30], center=true);

        translate([-w/2, l/2, 0])
        rotate([0, 0, -45])
        cube([10, 60, 30], center=true);

        // dove cuts
        #translate([0, l/2 + 0.2, 4])
        rotate([0, 0, 180])
        male_dovetail(20);

        #translate([w/2 + 0.2, 0, 4])
        rotate([0, 0, 90])
        male_dovetail(20);

        #translate([-w/2 - 0.2, 0, 4])
        rotate([0, 0, -90])
        male_dovetail(20);

        #translate([w/2 + 0.2, l/3, 4])
        rotate([0, 0, 90])
        male_dovetail(20);

        #translate([-w/2 - 0.2, l/3, 4])
        rotate([0, 0, -90])
        male_dovetail(20);

        #translate([w/2 + 0.2, -l/2 + 20, 4])
        rotate([0, 0, 90])
        male_dovetail(20);

        #translate([-w/2 - 0.2, -l/2 + 20, 4])
        rotate([0, 0, -90])
        male_dovetail(20);

        // inner cut
        _inner();

        // hex grill
        intersection() {
            hexagon_form(
                -194.4, -311, 50, 10, 0.4, h=15
            );

            translate([0, 0, -5])
            _inner();
        }
    }
}

module chiapi2_PSU_connector_base() {
    l = 90;

    module _mount_nub() {
        cylinder(d1=6, d2=9, h=4, $fn=20);
    }

    difference() {
        union() {
            translate([0, 0, 36/2])
            rotate([90, 0, 0])
            rounded_cube_side(
                116, 36, 90, 2, center=true, $fn=30
            );

            // side mount
            hull() {
                translate([
                    -116/2 - 4/2 + 1.1, -l/2 - 4, 28/2
                ])
                rotate([0, 90, 0])
                rounded_cube_side(
                    28, 12, 4, 4, center=true, $fn=30
                );

                translate([
                    -116/2 - 3/2 + 0.1, -l/2 - 1, 10/2])
                rotate([0, 90, 0])
                rounded_cube_side(
                    10, 6, 3, 4, center=true, $fn=30
                );

                translate([-116/2 + 2/2, -34, 2/2])
                rotate([90, 0, 0])
                cylinder(d=2, h=6, $fn=30);

                translate([-116/2 + 2/2, -34, 27 - 2/2])
                rotate([90, 0, 0])
                cylinder(d=2, h=6, $fn=30);
            }

            // pcb extension
            translate([-31, -53, 3/2])
            cube([52, 40, 3], center=true);

            // stepdown 3 mount nubs
            translate([-34.15, -l/2 - 23.5, -3])
            _mount_nub();

            translate([-34.15, -l/2 + 46.5, -3])
            _mount_nub();
        
            translate([-51.85, -l/2 - 23.5, -3])
            _mount_nub();

            translate([-51.85, -l/2 + 46.5, -3])
            _mount_nub();

            // stepdown 2 mount nubs
            translate([-10.9, -65, -3])
            _mount_nub();
            
            translate([-27.1, -34.9, -3])
            _mount_nub();

            // big liitinrima base
            hull() {
                translate([47, -13.5, 0.1/2])
                cube([0.1, 63, 0.1], center=true);

                translate([23, -13.5, -10])
                cube([0.1, 63, 0.1], center=true);

                translate([20, -8.5, 0.1/2])
                cube([0.1, 73, 0.1], center=true);

            }

            // small liitinrima base
            hull() {
                translate([-20, 6.5, 0.1/2])
                cube([0.1, 52, 0.1], center=true);

                translate([-2, 6.5, -10])
                cube([0.1, 52, 0.1], center=true);

                translate([0, 11.5, 0.1/2])
                cube([0.1, 62, 0.1], center=true);
            }

            // stability supports
            hull() {
                translate([-2 - 1/2, l/2 - 1/2, -10/2 - 4])
                cube([1, 1, 10], center=true);

                translate([-2 - 1/2, l/2 - 12, -10 + 1/2])
                cube([1, 1, 1], center=true);
            }

            hull() {
                translate([23 + 1/2, l/2 - 1/2, -15/2 - 1])
                cube([1, 1, 15], center=true);

                translate([23 + 1/2, l/2 - 27, -10 + 1/2])
                cube([1, 1, 1], center=true);
            }

            translate([-2.5 + 26/2, l/2 - 10/2, -9])
            cube([26, 10, 1], center=true);
        }
        // cuts
        translate([0, 0, 40/2 + 3])
        cube([100.5, 200, 40], center=true);

        translate([0, 0, 40/2 + 5.6])
        cube([110.5, 200, 40], center=true);

        translate([10, 0, 40/2 + 8])
        cube([110.5, 200, 40], center=true);

        translate([0, -l/2 - 20/2, 80/2 + 3])
        cube([116, 20, 80], center=true);

        // screw holes
        translate([-116/2, -l/2 + 8.4, 30.8])
        rotate([0, 90, 0])
        cylinder(d=4.4, h=20, center=true, $fn=40);

        translate([-116/2, -l/2 - 5.1, 22.2])
        rotate([0, 90, 0])
        cylinder(d=4.4, h=20, center=true, $fn=40);

        translate([-116/2, -l/2 - 5.1, 12.2])
        rotate([0, 90, 0])
        cylinder(d=4.4, h=20, center=true, $fn=40);

        // zip tie mount holes
        translate([-116/2 + 10, l/2 - 4.5, 0])
        cylinder(d=5, h=20, center=true, $fn=30);

        translate([116/2 - 10, l/2 - 4.5, 0])
        cylinder(d=5, h=20, center=true, $fn=30);

        translate([116/2 - 7, -l/2  + 15, 0])
        cylinder(d=5, h=20, center=true, $fn=30);

        // chamfers
        translate([0, -l/2 - 2, 43])
        chamfered_cube(
            200, 30, 30, 14, center=true
        );

        translate([0, l/2 + 18, 100/2 + 10])
        chamfered_cube(
            200, 200, 100, 30, center=true
        );

        // stepdown 3 mount holes
        translate([-34.15, -l/2 - 23.5, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);

        translate([-34.15, -l/2 + 46.5, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);
        
        translate([-51.85, -l/2 - 23.5, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);

        translate([-51.85, -l/2 + 46.5, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);

        // stepdown 2 mount holes
        translate([-10.9, -65, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);
        
        translate([-27.1, -34.9, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);

        // big liitinrima mount holes
        translate([35.6, 8.9, -10])
        rotate([0, -22.8, 0])
        cylinder(d=2.7, h=40, center=true, $fn=20);

        translate([35.6, -14, -10])
        rotate([0, -22.8, 0])
        cylinder(d=2.7, h=40, center=true, $fn=20);

        translate([35.6, -36.8, -10])
        rotate([0, -22.8, 0])
        cylinder(d=2.7, h=40, center=true, $fn=20);

        // small liitinrima mount holes
        translate([-11.6, 8.9, -10])
        rotate([0, 29, 0])
        cylinder(d=1.9, h=40, center=true, $fn=20);

        translate([-11.6, 25.2, -10])
        rotate([0, 29, 0])
        cylinder(d=1.9, h=40, center=true, $fn=20);

        translate([-11.6, -12, -10])
        rotate([0, 29, 0])
        cylinder(d=1.9, h=40, center=true, $fn=20);
   }
}

module chiapi2_adapter_seagate_top() {
    difference() {
        cube([38, 179, 10], center=true);

        translate([0, 0, 1.6])
        cube([35.6, 176.6, 10], center=true);

        cube([29, 160, 30], center=true);

        translate([0, 10, -10/2])
        cube([25, 176, 3.3], center=true);
    }
//    %translate([0, 0, 121/2])
//    _seagate_usb();
}

module chiapi2_adapter_other_usb_top() {
    //31.7, 182, 117
    difference() {
        cube([34.7, 185, 15], center=true);

        translate([0, 0, 1.6])
        cube([31.9, 182, 15], center=true);

        cube([20, 150, 30], center=true);

        translate([0, 0, 13])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 117/2 - 15/2 + 1.6])
    _other_usb();
}

module chiapi2_adapter_wd_top() {
    //49, 139.7, 171
    difference() {
        cube([52, 142.7, 10], center=true);

        translate([0, 0, 1.6])
        cube([49.5, 139.9, 10], center=true);

        cube([40, 131, 30], center=true);

        translate([0, 0, 13])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 171/2 - 10/2 + 1.6])
    _wd_usb();
}

module chiapi2_adapter_wd_bottom() {
    //49, 139.7, 171
    difference() {
        cube([52, 142.7, 10], center=true);

        translate([0, 0, 1])
        cube([49.4, 139.4, 10], center=true);

        cube([40, 131, 30], center=true);

        translate([0, 0, 13])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 171/2 - 10/2 + 1])
    _wd_usb();
}

module chiapi2_adapter_ssd_usb_1_bottom() {
    //12.5, 123, 77
    difference() {
        cube([15.5, 126, 8], center=true);

        translate([0, 0, 1])
        cube([12.8, 123.5, 8], center=true);

        cube([5, 110, 30], center=true);

        translate([0, 0, 13])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 77/2 - 8/2 + 1])
    _ssd_usb_1();
}

module chiapi2_adapter_ssd_usb_2_bottom() {
    //13, 126, 75.5
    difference() {
        cube([16, 129, 8], center=true);

        translate([0, 0, 1])
        cube([13.3, 126.5, 8], center=true);

        cube([5, 110, 30], center=true);

        translate([0, 0, 13])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 75.5/2 - 8/2 + 1])
    _ssd_usb_2();
}

module chiapi2_adapter_ssd_usb_3_bottom() {
    //13, 130.3, 78
    difference() {
        cube([16, 133, 8], center=true);

        translate([0, 0, 1])
        cube([13.3, 130.6, 8], center=true);

        cube([5, 110, 30], center=true);

        translate([0, 0, 13])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 78/2 - 8/2 + 1])
    _ssd_usb_3();
}

module chiapi2_adapter_ssd_usb_4_bottom() {
    //9, 102, 32
    difference() {
        cube([12, 105, 5], center=true);

        translate([0, 0, 1])
        cube([9.3, 102.3, 5], center=true);

        cube([3, 90, 30], center=true);

        translate([0, 0, 14])
        rotate([0, 45, 0])
        cube([20, 300, 20], center=true);
    }
    %translate([0, 0, 32/2 - 5/2 + 1])
    _ssd_usb_4();
}

module chiapi2_fan_mount_140mm() {
    fan_mount_140mm(width);
}

module chiapi2_fan_mount_120mm() {
    fan_mount_120mm(width);
}

module chiapi2_fan_end_mount_120mm() {
    fan_end_mount_120mm(width);
}

module chiapi2_cover_snap_clips() {
    translate([5, 0, 0])
    front_cover_snap_clip_left();

    translate([-5, 0, 0])
    front_cover_snap_clip_right();
}

//side_cover_mount();
//side_cover_mount_split_center_back();
//side_cover_mount_split_center_back(_offset=0.4);
//side_cover_mount_split_center_back(_offset=0.8);
//side_cover_mount_split_ring_back();

module chiapi2_side_cover_mount() {
    side_cover_mount();
}

module chiapi2_side_cover_mount_split_centers() {
    translate([-11, 0, 0])
    side_cover_mount_split_center_back();

    translate([11, 0, 0])
    side_cover_mount_split_center_front();
}

module chiapi2_side_cover_mount_split_rings() {
    translate([-11, 0, 0])
    side_cover_mount_split_ring_back();

    translate([11, 0, 0])
    side_cover_mount_split_ring_front();
}

module chiapi2_side_cover_back() {
    side_cover_back(depth, height);
}

module chiapi2_side_cover_front() {
    side_cover_front(depth, height);
}

module chiapi2_side_cover_front_p1() {
    side_cover_front_p1(depth, height);
}

module chiapi2_side_cover_front_p2() {
    side_cover_front_p2(depth, height);
}

module chiapi2_side_cover_front_p3() {
    side_cover_front_p3(depth, height);
}

module chiapi2_side_cover_front_p4() {
    side_cover_front_p4(depth, height);
}

module chiapi2_side_cover_front_p1_green() {
    difference() {
        side_cover_front_p1(depth, height);

        difference() {
            translate([84, 82])
            cylinder(d=150, h=1, center=true, $fn=50);

            translate([84, 76, -1])
            scale([2.3, 2.3, 4])
            _raspi_logo_1();
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p1_white() {
    difference() {
        translate([84, 82, 0])
        cylinder(d=150, h=0.5, $fn=50);

        translate([84, 76, -1])
        scale([2.3, 2.3, 4])
        _raspi_logo_1();

        translate([84, 76, -1])
        scale([2.3, 2.3, 4])
        _raspi_logo_2();
    }
}

module chiapi2_side_cover_front_p1_red() {
    intersection() {
        translate([84, 82])
        cylinder(d=150, h=0.5, $fn=50);

        translate([84, 76, -1])
        scale([2.3, 2.3, 4])
        _raspi_logo_2();
    }
}

module chiapi2_side_cover_front_p1_other() {
    intersection() {
        side_cover_front_p1(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p2_green() {
    difference() {
        side_cover_front_p2(depth, height);

        difference() {
            translate([83, -82])
            rounded_cube_side(
                155, 64, 1, 10, center=true
            );

            translate([86, -84, -1])
            scale([1.85, 1.85, 4])
            mirror([1, 0, 0])
            _chia_logo();
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p2_white() {
    difference() {
        translate([83, -82, 0.5/2])
        rounded_cube_side(
            155, 64, 0.5, 10, center=true
        );

        translate([86, -84, -1])
        scale([1.85, 1.85, 4])
        mirror([1, 0, 0])
        _chia_logo();
    }
}

module chiapi2_side_cover_front_p2_other() {
    intersection() {
        side_cover_front_p2(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p3_green() {
    difference() {
        side_cover_front_p3(depth, height);

        intersection() {
            translate([-90, -86, -1])
            scale([1.8, 1.8, 4])
            hull()
            _hdd_logo();

            cube([400, 400, 1], center=true);
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p3_black() {
    intersection() {
        translate([-90, -86, -1])
        scale([1.6, 1.6, 4])
        _hdd_logo();

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);
    }
}

module chiapi2_side_cover_front_p3_white() {
    intersection() {
        difference() {
            translate([-90, -86, -1])
            scale([1.8, 1.8, 4])
            hull()
            _hdd_logo();

            translate([-90, -86, -1])
            scale([1.6, 1.6, 4])
            _hdd_logo();
        }

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);
    }
}

module chiapi2_side_cover_front_p3_other() {
    intersection() {
        side_cover_front_p3(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p4_green() {
    difference() {
        side_cover_front_p4(depth, height);

        intersection() {
            translate([-82, 82, -1])
            scale([1.8, 1.8, 4])
            hull()
            mirror([1, 0, 0])
            _bitcoin_logo_1();

            cube([400, 400, 1], center=true);            
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_front_p4_orange() {
    intersection() {
        translate([-82, 82, -1])
        scale([1.8, 1.8, 4])
        mirror([1, 0, 0])
        _bitcoin_logo_1();

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);            
    }
}

module chiapi2_side_cover_front_p4_black() {
    intersection() {
        translate([-82, 82, -1])
        scale([1.8, 1.8, 4])
        mirror([1, 0, 0])
        _bitcoin_logo_2();

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);            
    }
}

module chiapi2_side_cover_front_p4_other() {
    intersection() {
        side_cover_front_p4(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);            
    }
}

/////////////////

module chiapi2_side_cover_back_p1_green() {
    difference() {
        side_cover_back_p1(depth, height);

        difference() {
            translate([84, 82])
            cylinder(d=150, h=1, center=true, $fn=50);

            translate([84, 76, -1])
            scale([2.3, 2.3, 4])
            _raspi_logo_1();
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p1_white() {
    difference() {
        translate([84, 82, 0])
        cylinder(d=150, h=0.5, $fn=50);

        translate([84, 76, -1])
        scale([2.3, 2.3, 4])
        _raspi_logo_1();

        translate([84, 76, -1])
        scale([2.3, 2.3, 4])
        _raspi_logo_2();
    }
}

module chiapi2_side_cover_back_p1_red() {
    intersection() {
        translate([84, 82])
        cylinder(d=150, h=0.5, $fn=50);

        translate([84, 76, -1])
        scale([2.3, 2.3, 4])
        _raspi_logo_2();
    }
}

module chiapi2_side_cover_back_p1_other() {
    intersection() {
        side_cover_back_p1(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p2_green() {
    difference() {
        side_cover_back_p2(depth, height);

        difference() {
            translate([83, -82])
            rounded_cube_side(
                155, 64, 1, 10, center=true
            );

            translate([86, -84, -1])
            scale([1.85, 1.85, 4])
            mirror([1, 0, 0])
            _chia_logo();
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p2_white() {
    difference() {
        translate([83, -82, 0.5/2])
        rounded_cube_side(
            155, 64, 0.5, 10, center=true
        );

        translate([86, -84, -1])
        scale([1.85, 1.85, 4])
        mirror([1, 0, 0])
        _chia_logo();
    }
}

module chiapi2_side_cover_back_p2_other() {
    intersection() {
        side_cover_back_p2(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p3_green() {
    difference() {
        side_cover_back_p3(depth, height);

        intersection() {
            translate([-90, -86, -1])
            scale([1.8, 1.8, 4])
            hull()
            _hdd_logo();

            cube([400, 400, 1], center=true);
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p3_black() {
    intersection() {
        translate([-90, -86, -1])
        scale([1.6, 1.6, 4])
        _hdd_logo();

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);
    }
}

module chiapi2_side_cover_back_p3_white() {
    intersection() {
        difference() {
            translate([-90, -86, -1])
            scale([1.8, 1.8, 4])
            hull()
            _hdd_logo();

            translate([-90, -86, -1])
            scale([1.6, 1.6, 4])
            _hdd_logo();
        }

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);
    }
}

module chiapi2_side_cover_back_p3_other() {
    intersection() {
        side_cover_back_p3(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p4_green() {
    difference() {
        side_cover_back_p4(depth, height);

        intersection() {
            translate([-82, 82, -1])
            scale([1.8, 1.8, 4])
            hull()
            mirror([1, 0, 0])
            _bitcoin_logo_1();

            cube([400, 400, 1], center=true);            
        }

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);
    }
}

module chiapi2_side_cover_back_p4_orange() {
    intersection() {
        translate([-82, 82, -1])
        scale([1.8, 1.8, 4])
        mirror([1, 0, 0])
        _bitcoin_logo_1();

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);            
    }
}

module chiapi2_side_cover_back_p4_black() {
    intersection() {
        translate([-82, 82, -1])
        scale([1.8, 1.8, 4])
        mirror([1, 0, 0])
        _bitcoin_logo_2();

        translate([0, 0, 0.5/2])
        cube([400, 400, 0.5], center=true);            
    }
}

module chiapi2_side_cover_back_p4_other() {
    intersection() {
        side_cover_back_p4(depth, height);

        translate([0, 0, 15/2 + 1])
        cube([400, 400, 15], center=true);            
    }
}

module chiapi2_side_cover_split_clip() {
    side_cover_split_clip();
}

module chiapi2_fan_mount_m3_adapter() {
    fan_mount_m3_adapter();
}