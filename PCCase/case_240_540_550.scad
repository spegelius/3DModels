
use <case_models.scad>;
use <common.scad>;
use <fans.scad>;
use <cover.scad>;

width = 240;
depth = 540;
height = 550;

e_count_w = 1;
e_count_d = 3;
e_count_h = 3;


mockup();


module mockup() {

    print_parts(
        width, depth, height, e_count_w,
        e_count_d, e_count_h
    );

    // corners
    _back_corners(width, height);
    _front_corners(width, depth, height);

    // beams
    _back_beams(
        width, height, e_count_w, e_count_d, e_count_h
    );

    _front_beams(
        width, depth, height, e_count_w,
        e_count_d, e_count_h
    );

    _side_beams(
        width, depth, height,  e_count_w,
        e_count_d, e_count_h
    );

    _hd_mocks(width, depth, height, count=14);

    _PSU(width);

    _feet(width, depth);

    _mobo("EE_ATX", width, depth, height);

    _fans_front(width, depth);

    _bottom_cover(width, depth);

    _front_covers(
        width, depth, height, 58, leds=4,
        top_h=70, bottom_h=40
    );

    _top_covers(width, depth, height);

    _right_cover(width, depth, height);
    _left_cover(width, depth, height);
}

module _fans_front(width, depth) {
    render()
    translate([width/2 - 30/2, depth - 30/2 - 15, 35])
    rotate([90, 0, 180])
    fan_mount_140mm(width);

    render()
    translate([width/2 - 30/2, depth - 30/2 - 15, 181.7])
    rotate([90, 0, 180])
    fan_mount_dual_140mm(width);

    render()
    translate([width/2 - 30/2, depth - 30/2 - 15, 326.3])
    rotate([90, 0, 180])
    fan_mount_dual_120_140mm(width);

    render()
    translate([width/2 - 30/2, depth - 30/2 - 15, 452.9])
    rotate([-90, 0, 0])
    fan_mount_120mm(width);
}

module _top_covers(width, depth, height) {

    render()
    translate([width/2 - 15, 35, height - 15])
    rotate([90, 180, 0])
    front_cover_bottom(width, 40, brim=false);

    render()
    translate([width/2 - 15, 35.1, height - 15])
    rotate([90, 180, 180])
    front_cover_grill(
        width, 175, 24, 6, brim=false, supports=false
    );

    render()
    translate([width/2 - 15, 35.2 + 175, height - 15])
    rotate([90, 180, 180])
    front_cover_grill(
        width, 175, 21, 0, brim=false, supports=false
    );

    render()
    translate([width/2 - 15, 35.3 + 350, height - 15])
    rotate([90, 180, 180])
    front_cover_bottom(width, 130, brim=false);
}