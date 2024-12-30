use <cover.scad>;

stl_path = "../_downloaded/Doom Eternal Preator Token/";
stl_path2 = "../_downloaded/DOOM_keychain/";

// scaling factor
sf = 160;

function scaling(depth, height) = 
    depth < height ? (depth - 45) / sf : (height - 45) / sf;


//_orig_token();
//_token_center_form();
//_token_ring_form();
//_doom_token_red();
//_doom_helmet();


//side_cover_left_doom_black(500, 520);
side_cover_left_doom_red(500, 520);

//side_cover_left_p1_doom_black(500, 520);
//side_cover_left_p1_doom_red(500, 520);
//side_cover_left_p2_doom_black(500, 520);
//side_cover_left_p2_doom_red(500, 520);
//side_cover_left_p3_doom_black(500, 520);
//side_cover_left_p3_doom_red(500, 520);
//side_cover_left_p4_doom_black(500, 520);
//side_cover_left_p4_doom_red(500, 520);

//side_cover_right_p1_doom_black(500, 520);
//side_cover_right_p1_doom_red(500, 520);
//side_cover_right_p2_doom_black(500, 520);
//side_cover_right_p2_doom_red(500, 520);
//side_cover_right_p3_doom_black(500, 520);
//side_cover_right_p3_doom_red(500, 520);
//side_cover_right_p4_doom_black(500, 520);
//side_cover_right_p4_doom_red(500, 520);


module _orig_token() {
    //translate([45, -4, 0])
//    import(str(
//        stl_path, "coinnodamage.stl"
//    ), convexity=10);

//    translate([-250/2, -210/2, 0])
//    import(str(
//        stl_path, "coinnodamage_pr.stl"
//    ), convexity=10);

    //translate([-250/2, -210/2, 0])
    import(str(
        stl_path, "coinnodamage_tc_center.stl"
    ), convexity=10);
}

module _token_center_form() {
    linear_extrude(4)
    projection(cut=false)
    intersection() {
        import(str(
            stl_path, "coinnodamage_tc_center.stl"
        ), convexity=10);

        cylinder(d=122, h=13);
    }
}

module _token_ring_form() {
    linear_extrude(4.2)
    projection(cut=false)
    import(str(
        stl_path, "coinnodamage_tc_ring.stl"
    ), convexity=10);
}

module _doom_token_red() {
    translate([0, 0, -0.2])
    mirror([1, 0, 0])
    union() {
        _token_center_form();

        _token_ring_form();

        translate([0, 0, 10/2 + 2])
        cube([1000, 1000, 10], center=true);
    }
}

module _doom_helmet() {
    union() {
        translate([0, 2.5, -0.2])
        mirror([1, 0, 0])
        linear_extrude(4.2)
        projection(cut=false)
        scale([10.15, 10.15, 1])
        import(str(
            stl_path2, "doom_stl.stl"
        ), convexity=10);

        translate([0, 0, 10/2 + 2])
        cube([1000, 1000, 10], center=true);
    }
}

// left side
module side_cover_left_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_left(depth, height);

        scale([_scale, _scale, 1])
        _doom_token_red();
    }
}

module side_cover_left_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left(depth, height);

        scale([scaling, scaling, 1])
        _doom_token_red();
    }
}


module side_cover_left_p1_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_left_p1(depth, height);

        scale([_scale, _scale, 1])
        _doom_token_red();
    }
}

module side_cover_left_p1_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p1(depth, height);

        scale([scaling, scaling, 1])
        _doom_token_red();
    }
}

module side_cover_left_p2_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_left_p2(depth, height);

        scale([_scale, _scale, 1])
        _doom_token_red();
    }
}

module side_cover_left_p2_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p2(depth, height);

        scale([scaling, scaling, 1])
        _doom_token_red();
    }
}

module side_cover_left_p3_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_left_p3(depth, height);

        scale([_scale, _scale, 1])
        _doom_token_red();
    }
}

module side_cover_left_p3_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p3(depth, height);

        scale([scaling, scaling, 1])
        _doom_token_red();
    }
}

module side_cover_left_p4_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_left_p4(depth, height);

        scale([_scale, _scale, 1])
        _doom_token_red();
    }
}

module side_cover_left_p4_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p4(depth, height);

        scale([scaling, scaling, 1])
        _doom_token_red();
    }
}

// right side
module side_cover_right_p1_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_right_p1(depth, height);

        scale([_scale, _scale, 1])
        _doom_helmet();
    }
}

module side_cover_right_p1_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p1(depth, height);

        scale([scaling, scaling, 1])
        _doom_helmet();
    }
}

module side_cover_right_p2_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_right_p2(depth, height);

        scale([_scale, _scale, 1])
        _doom_helmet();
    }
}

module side_cover_right_p2_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p2(depth, height);

        scale([scaling, scaling, 1])
        _doom_helmet();
    }
}

module side_cover_right_p3_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_right_p3(depth, height);

        scale([_scale, _scale, 1])
        _doom_helmet();
    }
}

module side_cover_right_p3_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p3(depth, height);

        scale([scaling, scaling, 1])
        _doom_helmet();
    }
}

module side_cover_right_p4_doom_black(
    depth, height
) {

    _scale = scaling(depth, height);

    difference() {
        side_cover_right_p4(depth, height);

        scale([_scale, _scale, 1])
        _doom_helmet();
    }
}

module side_cover_right_p4_doom_red(
    depth, height
) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p4(depth, height);

        scale([scaling, scaling, 1])
        _doom_helmet();
    }
}