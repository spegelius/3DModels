
use <case_models.scad>;
use <common.scad>;
use <fans.scad>;

width = 230;
depth = 430;
height = 480;

e_count_w = 1;
e_count_d = 2;
e_count_h = 2;


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

    _hd_mocks(width, depth);

    _PSU(width);

    _feet(width, depth);

    _mobo("ATX", width, depth, height);

    translate([width/2 - 30/2, depth - 30/2 - 15, 100])
    rotate([90, 0, 180])
    fan_mount_140mm(width);
}