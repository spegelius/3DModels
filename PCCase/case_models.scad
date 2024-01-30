
use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/extention.scad>;
use <../Dollo/NEW_long_ties/corner.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../PCParts/Antec.scad>;
include <../PCParts/common.scad>;
include <variables.scad>;


use <common.scad>;
use <cover.scad>;
use <fans.scad>;
use <foot.scad>;
use <frame_parts.scad>;
use <hdd.scad>;
use <motherboard.scad>;
use <psu.scad>;


module _mobo(
    type, width, depth, height, top_offset=0
) {

    if (type == "ATX") {
        %translate([26, 18, height - 60 - top_offset])
        rotate([0, 90, 0])
        mock_mobo_card();

        translate([15, 18, height - 60 - top_offset])
        rotate([0, 90, 0])
        motherboard_tray_atx(
            depth, render_threads=debug_threads,
            _render=true
        );

        translate([0, 15, height - 304 - top_offset])
        rotate([0, -90, -90])
        motherboard_tray_mount_2();

        translate([
            0, depth - 185, height - 304 - top_offset
        ])
        rotate([0, 90, -90])
        motherboard_tray_mount_1();

        translate([15.2, 15.4, height - 45.2])
        rotate([90, 90, 0])
        motherboard_back_plate(
            width, height, top_offset=top_offset
        );

//        %translate([15, 0, 127.3])
//        rotate([-90, 0, 0])
//        motherboard_back_plate_clip();

    } else if (type == "EE_ATX") {
        %translate([26, 18, height - 60 - top_offset])
        rotate([0, 90, 0])
        mock_mobo_ee_atx();

        translate([15, 18, height - 60 - top_offset])
        rotate([0, 90, 0])
        motherboard_tray_ee_atx(
            depth, render_threads=debug_threads,
            _render=true
        );

        translate([0, 15, height - 346 - top_offset])
        rotate([0, -90, -90])
        motherboard_tray_mount_2();

        translate([
            0, depth - 185, height - 346 - top_offset
        ])
        rotate([0, 90, -90])
        motherboard_tray_mount_1();

//        translate([15.2, 15.4, height - 45.2])
//        rotate([90, 90, 0])
//        motherboard_back_plate_ee_atx(
//            width, height, top_offset=top_offset
//        );

    }

    translate([0, 15, height - 89 - top_offset])
    rotate([0, -90, -90])
    motherboard_tray_mount_top_2(top_offset=top_offset);

    translate([0, depth - 185, height - 89 - top_offset])
    rotate([0, 90, -90])
    motherboard_tray_mount_top_1(top_offset=top_offset);
}


module _back_corners(width, height) {
    render() {
        rotate([-45, 0, 0])
        rotate([0, 35.2644, 0])
        render()
        full_corner(support=false, extra_stiff=true);

        translate([0, 0, height - 30])
        rotate([-135, 0, 0])
        rotate([0, 35.2644, 0])
        render()
        full_corner(support=false, extra_stiff=true);

        translate([width - 30, 0, height - 30])
        rotate([0, 0, 135])
        rotate([0, 35.2644 + 90, 0])
        render()
        full_corner(support=false, extra_stiff=true);

        translate([width - 30, 0, 0])
        rotate([0, 0, -45])
        rotate([0, 35.2644 - 90, 0])
        render()
        full_corner(support=false, extra_stiff=true);
    }
}

module _front_corners(width, depth, height) {
    render() {
        translate([0, depth  -30, 0])
        rotate([45, 0, 0])
        rotate([0, 35.2644, 0])
        render()
        full_corner(support=false, extra_stiff=true);

        translate([width - 30, depth - 30, 0])
        rotate([0, 0, 45])
        rotate([0, 35.2644 - 90, 0])
        render()
        full_corner(support=false, extra_stiff=true);

        translate([0, depth - 30, height - 30])
        rotate([135, 0, 0])
        rotate([0, 35.2644, 0])
        render()
        full_corner(support=false, extra_stiff=true);

        translate([width - 30, depth - 30, height - 30])
        rotate([0, 0, -135])
        rotate([0, 35.2644 + 90, 0])
        render()
        full_corner(support=false, extra_stiff=true);
    }
}

module _back_beams(
    width, height, e_count_w, e_count_d, e_count_h
) {

    e_units_w = e_units(width);
    e_units_h = e_units(height);

    e_length_w = e_length(e_units_w, e_count_w);
    e_length_h = e_length(e_units_h, e_count_h);
    

    // w beams
    translate([45, 0, 0])
    rotate([0, 90, 0])
    render()
    for(i=[0:e_count_w - 1]) {
        translate([0, 0, e_length_w/2 + i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false
        );
    }

    translate([45, 0, 0 + height - 30])
    rotate([0, 90, 0])
    render()
    for(i=[0:e_count_w - 1]) {
        translate([0, 0, e_length_w/2 + i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false);
    }

    // h beams
    translate([0, 0, 45])
    render()
    for(i=[0:e_count_h - 1]) {
        translate([0, 0, e_length_h/2 + i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false
        );
    }

    translate([width - 30, 0, 45])
    render()
    for(i=[0:e_count_h - 1]) {
        translate([0, 0, e_length_h/2 + i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false
        );
    }
}

module _front_beams(
    width, depth, height, e_count_w,
    e_count_d, e_count_h
) {

    e_units_w = e_units(width);
    e_units_d = e_units(depth);
    e_units_h = e_units(height);

    e_length_w = e_length(e_units_w, e_count_w);
    e_length_d = e_length(e_units_d, e_count_d);
    e_length_h = e_length(e_units_h, e_count_h);

    // w beams
    translate([45, depth - 30, 0])
    rotate([0, 90, 0])
    render()
    for(i=[0:e_count_w - 1]) {
        translate([0, 0, e_length_w/2 + i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false
        );
    }

    translate([45, depth - 30, height - 30])
    rotate([0, 90, 0])
    render()
    for(i=[0:e_count_w - 1]) {
        translate([0, 0, e_length_w/2 + i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false
        );
    }

    // h beams
    translate([0, depth - 30, 45])
    render()
    for(i=[0:e_count_h - 1]) {
        translate([0, 0, e_length_h/2 + i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false
        );
    }

    translate([width - 30, depth - 30, 45])
    render()
    for(i=[0:e_count_h - 1]) {
        translate([0, 0, e_length_h/2 + i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false
        );
    }
}

module _side_beams(
    width, depth, height, e_count_w,
    e_count_d, e_count_h
) {

    e_units_w = e_units(width);
    e_units_d = e_units(depth);
    e_units_h = e_units(height);
    
    e_length_w = e_length(e_units_w, e_count_w);
    e_length_d = e_length(e_units_d, e_count_d);
    e_length_h = e_length(e_units_h, e_count_h);

    // t extention and left side
    e_length_t = t_length(e_length_d);
    units_t = e_length_t/30;
    
    e_units_dt = e_units(depth - e_length_t);
    e_count_dt = max(1, e_count_d - 1);
    e_length_dt = e_length(e_units_dt, e_count_dt);
    

    // d beams left bottom
    translate([
        0, depth - e_length_t/2 - 30/2 - 60, -15
    ])
    _extention_t_case(depth, e_count_d, supports=false);

    translate([0, 45, 0])
    rotate([-90, 0, 0])
    render()
    for(i=[0:e_count_dt - 1]) {
        translate([0, 0, e_length_dt/2 + i*e_length_dt])
        extention(
            units=e_units_dt/e_count_dt,
            support=false
        );
    }

    // d beams left top
    translate([
        0, depth - e_length_t/2 - 30/2 - 60,
        height - 15
    ])
    rotate([0, 180, 0])
    _extention_t_case(depth, e_count_d, supports=false);

    translate([0, 45, height - 30])
    rotate([-90, 0, 0])
    render()
    for(i=[0:e_count_dt - 1]) {
        translate([0, 0, e_length_dt/2 + i*e_length_dt])
        extention(
            units=e_units_dt/e_count_dt,
            support=false
        );
    }

    // d beams right
    translate([width - 30, 45, 0])
    rotate([-90, 0, 0])
    render()
    for(i=[0:e_count_d - 1]) {
        translate([0, 0, e_length_d/2 + i*e_length_d])
        extention(
            units=e_units_d/e_count_d,
            support=false
        );
    }

    translate([width - 30, 45, height - 30])
    rotate([-90, 0, 0])
    render()
    for(i=[0:e_count_d-1]) {
        translate([
            0, 0, e_length_d/2 + i*e_length_d
        ])
        extention(
            units=e_units_d/e_count_d,
            support=false
        );
    }

    // middle h beam
    translate([0, depth - 170, 45])
    render()
    for(i=[0:e_count_h - 1]) {
        translate([0, 0, e_length_h/2 + i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false
        );
    }
}

module _hd_mocks(
    width, depth, height, count=8, top_offset=110
) {

    for(i = [0:count - 1]) {
        translate([
            50, depth - 50,
            height - top_offset - i*30
        ])
        rotate([0, 0, -90])
        mock_hd();

        render()
        translate([
            width - 107, depth - 101,
            height - top_offset - i*30 + 30/2 - 2
        ])
        rotate([0, 0, 90])
        hdd_mount_rails(width);
    }
}

module _PSU(width) {
    %translate([width/2 - 30/2, 5/2 + 3, 17])
    mock_atx_psu(holes=true, slop=0);

    render()
    translate([width/2 - 30/2, 5/2 + 3, 17])
    rotate([90, 0, 0])
    PSU_backplate(width);

    render()
    translate([(width - 30)/2, 144, 6])
    rotate([-90, 0, 180])
    PSU_bottom_support(width);

    render()
    translate([15, 0, (atx_psu_height + 6)/2 + 15])
    mirror([0, 0, 1])
    PSU_plate_mount_1();
}

module _feet(width, depth) {
    render()
    translate([-6, 60 - 15, -30/2 - 10])
    rotate([0, 0, 0]) {
        foot();

        translate([0, 0, -0.05])
        foot_dampener();
    }

    render()
    translate([-6, depth - 60 - 15, -30/2 - 10])
    rotate([0, 0, 0]) {
        foot();

        translate([0, 0, -0.05])
        foot_dampener();
    }

    render()
    translate([width - 24, 60 - 15, -30/2 - 10])
    rotate([0, 0, 180]) {
        foot();

        translate([0, 0, -0.05])
        foot_dampener();
    }

    render()
    translate([width - 24, depth - 60 - 15, -30/2 - 10])
    rotate([0, 0, 180]) {
        foot();

        translate([0, 0, -0.05])
        foot_dampener();
    }
}

module _bottom_cover(width, depth, fan_hole=true) {
    translate([width/2 - 15, depth/2 - 15, -15])
    render()
    bottom(width, depth, fan_hole=fan_hole);
}

module _right_cover(width, depth, height) {

    render()
    translate([width - 15 + 5, depth/2 - 15, height/2 - 15])
    rotate([90, 0, -90])
    side_cover_front(depth, height);
}

module _left_cover(width, depth, height) {

    render()
    translate([-15 - 5, depth/2 - 15, height/2 - 15])
    rotate([90, 0, 90])
    side_cover_back(depth, height);
}

module _front_covers(
    width, depth, height, grills=40, leds=2,
    top_h=80, bottom_h=80
) {
    if (leds == 4) {
        translate([
            width/2 - 30/2, depth - 30/2,
            height - top_h - 25
        ])
        rotate([0, 0, 180])
        front_cover_buttons_4_leds(width, top_h);
    } else if (leds == 2) {
        translate([
            width/2 - 30/2, depth - 30/2,
            height - top_h - 25
        ])
        rotate([0, 0, 180])
        front_cover_buttons(width, top_h);
    } else {
        translate([
            width/2 - 30/2, depth - 30/2,
            height - top_h - 25
        ])
        rotate([0, 0, 180])
        front_cover_bottom(width, top_h);
    }

    translate([
        width/2 - 30/2, depth - 30/2, bottom_h - 5
    ])
    rotate([180, 0, 0])
    front_cover_bottom(width, bottom_h);

    h = height - top_h - bottom_h - 20;
    echo("Front grills height:", h)
    translate([
        width/2 - 30/2, depth - 30/2, bottom_h - 5
    ])
    rotate([0, 0, 180])
    front_cover_grill(width, h, grills, 4);
}