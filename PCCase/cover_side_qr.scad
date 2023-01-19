use <cover.scad>;


//debug_qr_code();

//qr_code_to_stl();


//side_cover_back_p1_qr_black(430, 480);
//side_cover_back_p1_qr_white(430, 480);
//side_cover_back_p2_qr_black(430, 480);
//side_cover_back_p2_qr_white(430, 480);
//side_cover_back_p3_qr_black(430, 480);
//side_cover_back_p3_qr_white(430, 480);
//side_cover_back_p4_qr_black(430, 480);
side_cover_back_p4_qr_white(430, 480);

//side_cover_front_p1_qr_black(430, 480);
//side_cover_front_p1_qr_white(430, 480);
//side_cover_front_p2_qr_black(430, 480);
//side_cover_front_p2_qr_white(430, 480);
//side_cover_front_p3_qr_black(430, 480);
//side_cover_front_p3_qr_white(430, 480);
//side_cover_front_p4_qr_black(430, 480);
//side_cover_front_p4_qr_white(430, 480);


module debug_qr_code() {
    side_cover_front(430, 480);

    translate([0, 0, -1])
    color("black")
    mirror([1, 0, 0])
    _qr_code(430, 480);
}

module qr_code_to_stl() {
    // THIS IS SLOW!
    //difference() {
        linear_extrude(1)
        projection(cut=true)
        translate([0, 0, 2])
        surface(
            "PCCase.png", center=true,
            convexity=10, invert=true
        );

//        translate([0, 0, 200/2 + 1])
//        cube([2000, 2000, 200], center=true);
//
//        translate([0, 0, -200/2])
//        cube([2000, 2000, 200], center=true);

    //}
}

module _qr_code(depth, height, thickness=1) {

    scaling = depth < height ? (depth - 45) / 1000 : (height - 45) / 1000;

    scale([scaling, scaling, thickness])
    //qr_code_to_stl();
    import("qr_code.stl", convexity=10);
}

module side_cover_front_p1_qr_black(depth, height) {
    intersection() {
        side_cover_front_p1(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_front_p1_qr_white(depth, height) {
    difference() {
        side_cover_front_p1(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_front_p2_qr_black(depth, height) {
    intersection() {
        side_cover_front_p2(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_front_p2_qr_white(depth, height) {
    difference() {
        side_cover_front_p2(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_front_p3_qr_black(depth, height) {
    intersection() {
        side_cover_front_p3(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_front_p3_qr_white(depth, height) {
    difference() {
        side_cover_front_p3(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_front_p4_qr_black(depth, height) {
    intersection() {
        side_cover_front_p4(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_front_p4_qr_white(depth, height) {
    difference() {
        side_cover_front_p4(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_back_p1_qr_black(depth, height) {
    intersection() {
        side_cover_back_p1(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_back_p1_qr_white(depth, height) {
    difference() {
        side_cover_back_p1(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_back_p2_qr_black(depth, height) {
    intersection() {
        side_cover_back_p2(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_back_p2_qr_white(depth, height) {
    difference() {
        side_cover_back_p2(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_back_p3_qr_black(depth, height) {
    intersection() {
        side_cover_back_p3(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_back_p3_qr_white(depth, height) {
    difference() {
        side_cover_back_p3(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}

module side_cover_back_p4_qr_black(depth, height) {
    intersection() {
        side_cover_back_p4(depth, height);

        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=0.6);
    }
}

module side_cover_back_p4_qr_white(depth, height) {
    difference() {
        side_cover_back_p4(depth, height);

        translate([0, 0, -0.6])
        mirror([1, 0, 0])
        _qr_code(depth, height, thickness=1.2);
    }
}