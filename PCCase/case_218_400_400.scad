
use <case_models.scad>;
use <common.scad>;
use <fans.scad>;
use <cover.scad>;

width = 218;
depth = 400;
height = 400;

e_count_w = 1;
e_count_d = 2;
e_count_h = 2;


// Special 'case' for Raspberry PI use

//debug_front_grills();
case_mockup();


// case specific models to print
//front_cover_grill_218_400_400_1();
//front_cover_grill_218_400_400_2();
//front_cover_grills_218_400_400();

//top_cover_218_400_400();
//top_covers_218_400_400();


module debug_front_grills() {
    front_cover_grill_218_400_400_1(
        supports=false, brim=false
    );

    translate([0, 0, 157])
    front_cover_grill_218_400_400_2(
        supports=false, brim=false
    );
}

module case_mockup() {

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

    //_bottom_cover(width, depth, fan_hole=false);

    _front_covers(
        width, depth, height, 58, leds=0,
        top_h=35, bottom_h=35
    );

    _top_covers(width, depth, height);

    _right_cover(width, depth, height);
    _left_cover(width, depth, height);
}

module _top_covers(width, depth, height) {

    render()
    translate([width/2 - 15, 185, height - 15])
    rotate([90, 180, 0])
    front_cover_end(width, 190, brim=false);

    render()
    translate([width/2 - 15, 185.3, height - 15])
    rotate([90, 180, 180])
    front_cover_end(width, 190, brim=false);
}


// case specific models
module front_cover_grill_218_400_400_1(
    supports=true, brim=true
) {
    front_cover_grill(
        width, 157, 22, 1.75,
        supports=supports, brim=brim
    );
}

module front_cover_grill_218_400_400_2(
    supports=true, brim=true
) {
    top_cover_grill_end(
        width, 188, 22, 0.4,
        supports=supports, brim=brim
    );
}

module front_cover_grills_218_400_400() {
    union() {
        front_cover_grill_218_400_400_1();

        translate([0, 3, 0])
        rotate([0, 0, 180])
        front_cover_grill_218_400_400_2();

        translate([-width/2 + 15, 3/2, 68])
        cube([1, 4, 2], center=true);

        translate([-width/2 + 15, 3/2, 133])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 68])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 133])
        cube([1, 4, 2], center=true);
    }
}

module top_cover_218_400_400() {
    front_cover_bottom(width, 190, snap=true);
}

module top_covers_218_400_400() {
    union() {
        top_cover_218_400_400();

        translate([0, 3, 0])
        rotate([0, 0, 180])
        top_cover_218_400_400();

        translate([-width/2 + 15, 3/2, 68])
        cube([1, 4, 2], center=true);

        translate([-width/2 + 15, 3/2, 133])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 68])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 133])
        cube([1, 4, 2], center=true);
    }
}