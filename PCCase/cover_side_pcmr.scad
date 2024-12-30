use <cover.scad>;

stl_path = "../_downloaded/PCMR Guy Magnet/";

// scaling factor
sf = 160;

//_pcmr_black();
//_pcmr_white();
//_pcmr_gold();
//_pcmr_form();


//debug();

//side_cover_left_pcmr_black(540, 550);
//side_cover_left_pcmr_gold(540, 550);
//side_cover_left_pcmr_rest(540, 550);
//side_cover_left_pcmr_white(540, 550);

//side_cover_right_pcmr_black(540, 550);
//side_cover_right_pcmr_gold(540, 550);
//side_cover_right_pcmr_rest(540, 550);
side_cover_right_pcmr_white(540, 550);


//side_cover_left_p1_pcmr_black(540, 550);
//side_cover_left_p1_pcmr_gold(540, 550);
//side_cover_left_p1_pcmr_rest(540, 550);
//side_cover_left_p1_pcmr_white(540, 550);

//side_cover_left_p2_pcmr_black(540, 550);
//side_cover_left_p2_pcmr_gold(540, 550);
//side_cover_left_p2_pcmr_rest(540, 550);
//side_cover_left_p2_pcmr_white(540, 550);

//side_cover_left_p3_pcmr_black(540, 550);
//side_cover_left_p3_pcmr_rest(540, 550);
//side_cover_left_p3_pcmr_white(540, 550);

//side_cover_left_p4_pcmr_black(540, 550);
//side_cover_left_p4_pcmr_gold(540, 550);
//side_cover_left_p4_pcmr_rest(540, 550);
//side_cover_left_p4_pcmr_white(540, 550);


//side_cover_right_p1_pcmr_black(540, 550);
//side_cover_right_p1_pcmr_gold(540, 550);
//side_cover_right_p1_pcmr_rest(540, 550);
//side_cover_right_p1_pcmr_white(540, 550);

//side_cover_right_p2_pcmr_black(540, 550);
//side_cover_right_p2_pcmr_gold(540, 550);
//side_cover_right_p2_pcmr_rest(540, 550);
//side_cover_right_p2_pcmr_white(540, 550);

//side_cover_right_p3_pcmr_black(540, 550);
//side_cover_right_p3_pcmr_rest(540, 550);
//side_cover_right_p3_pcmr_white(540, 550);

//side_cover_right_p4_pcmr_black(540, 550);
//side_cover_right_p4_pcmr_gold(540, 550);
//side_cover_right_p4_pcmr_rest(540, 550);
//side_cover_right_p4_pcmr_white(540, 550);


function scaling(depth, height) = 
    depth < height ? (depth - 45) / sf : (height - 45) / sf;


module _pcmr_text() {
    translate([0, 0, -1.01/2])
    linear_extrude(1.01)
    text(
        "PCMR", halign="center", valign="center",
        font="Gill Sans MT:style=Bold"
    );
}

module _pcmr_black() {

    mirror([1, 0, 0])
    union() {
        translate([0, 0, -10])
        intersection() {
            translate([45, -4, 0])
            import(str(
                stl_path, "pcmr-black-small.stl"
            ), convexity=10);

            translate([0, 0, 10])
            cube([1000, 1000, 1], center=true);
        }

        scale([1, 1, 5])
        translate([0, 0, -10])
        intersection() {
            translate([45, 102.92, 0])
            import(str(
                stl_path, "pcmr-pgold-black-small.stl"
            ), convexity=10);

            translate([0, 0, 10])
            cube([1000, 1000, 0.2], center=true);
        }

        // text box
        translate([44, 50, 0])
        difference() {
            cube([47, 17, 1], center=true);

            _pcmr_text();
        }
    }
}

module _pcmr_white_template(h=1) {

    mirror([1, 0, 0])
    translate([0, 0, -h/2])
    linear_extrude(h)
    offset(0.3)
    projection()
    translate([45, 78.49, 0])
    import(str(
        stl_path, "pcmr-white-small.stl"
    ), convexity=10);
}

module _pcmr_white() {

    scale([1, 1, 2])
    difference() {

        _pcmr_white_template(0.5);

        _pcmr_black();
    }
}

module _pcmr_gold_template(h=1) {
    union() {
        mirror([1, 0, 0])
        translate([0, 0, -h/2])
        linear_extrude(h)
        offset(0.3)
        projection()
        translate([45, 102.92, 0])
        import(str(
            stl_path, "pcmr-pgold-black-small.stl"
        ), convexity=10);

        translate([-44, 50, 0])
        cube([50, 20, h], center=true);
    }
}

module _pcmr_gold() {

    scale([1, 1, 2])
    difference() {
        _pcmr_gold_template(0.5);

        _pcmr_black();
    }
}

module _pcmr_form() {

    union() {
        _pcmr_black();
        _pcmr_white_template();
        _pcmr_gold_template();
    }
}

module debug() {
    sc = scaling(540, 550);

    color("black")
    scale([sc, sc, 1])
    _pcmr_black();

    color("white")
    scale([sc, sc, 1])
    _pcmr_white();

    color("yellow")
    scale([sc, sc, 1])
    _pcmr_gold();

    side_cover_front(540, 550);
}

// left side
module side_cover_left_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_left_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_left_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_left_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_left(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_left_p1_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_left_p1_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_left_p1_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_left_p1_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_left_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_left_p2_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_left_p2_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_left_p2_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_left_p2_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_left_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_left_p3_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p3(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_left_p3_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p3(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_left_p3_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_left_p3(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_left_p4_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_left_p4_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_left_p4_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_left_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_left_p4_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_left_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

// right side
module side_cover_right_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_right_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_right_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_right_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_right(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_right_p1_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_right_p1_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_right_p1_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_right_p1_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_right_p1(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_right_p2_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_right_p2_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_right_p2_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_right_p2_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_right_p2(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_right_p3_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p3(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_right_p3_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p3(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_right_p3_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_right_p3(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}

module side_cover_right_p4_pcmr_black(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_black();
    }
}

module side_cover_right_p4_pcmr_white(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_white();
    }
}

module side_cover_right_p4_pcmr_gold(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    intersection() {
        side_cover_right_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_gold();
    }
}

module side_cover_right_p4_pcmr_rest(depth, height) {

    scaling = depth < height ? (depth - 45) / sf : (height - 45) / sf;

    difference() {
        side_cover_right_p4(depth, height);

        scale([scaling, scaling, 1])
        _pcmr_form();
    }
}