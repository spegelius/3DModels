use <cover.scad>;


//debug_pattern1();

//_pattern1(540, 525);


//side_cover_back_p1_pattern1_black(540, 525);
//side_cover_back_p1_pattern1_white(540, 525);
//side_cover_back_p1_pattern1_top(540, 525);

//side_cover_back_p2_pattern1_black(540, 525);
//side_cover_back_p2_pattern1_white(540, 525);
//side_cover_back_p2_pattern1_top(540, 525);

//side_cover_back_p3_pattern1_black(540, 525);
//side_cover_back_p3_pattern1_white(540, 525);
//side_cover_back_p3_pattern1_top(540, 525);

//side_cover_back_p4_pattern1_black(540, 525);
//side_cover_back_p4_pattern1_white(540, 525);
side_cover_back_p4_pattern1_top(540, 525);


//side_cover_front_p1_pattern1_black(540, 525);
//side_cover_front_p1_pattern1_white(540, 525);
//side_cover_front_p1_pattern1_top(540, 525);

//side_cover_front_p2_pattern1_black(540, 525);
//side_cover_front_p2_pattern1_white(540, 525);
//side_cover_front_p2_pattern1_top(540, 525);

//side_cover_front_p3_pattern1_black(540, 525);
//side_cover_front_p3_pattern1_white(540, 525);
//side_cover_front_p3_pattern1_top(540, 525);

//side_cover_front_p4_pattern1_black(540, 525);
//side_cover_front_p4_pattern1_white(540, 525);
//side_cover_front_p4_pattern1_top(540, 525);


module debug_pattern1() {
    //side_cover_front(540, 525);

    _pattern1(540, 525);
}

module _pattern1(depth, height) {

    scaling = depth < height ? depth / 540 : height / 525;

    first = 90;
    second = 80;
    third = 70;
    fourth = 60;

    scale([scaling, scaling, 1])
    union() {
        color("black")
        cube([first, first, 1.2], center=true);

        color("grey")
        translate([0, 0, 0.6/2 + 0.3])
        cube([first + 10, first + 10, 0.6], center=true);

        for (i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([first/2, first/2, 0])
            translate([second/3, second/3, 0]) {
                color("black")
                cube([second, second, 1.2], center=true);

                color("grey")
                translate([0, 0, 0.6/2 + 0.3])
                cube([
                    second + 10, second + 10, 0.6
                ], center=true);
            }
        }

        for (i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([first/2, first/2, 0])
            translate([second/2, second/2, 0])
            translate([third/2, third/2, 0]) {
                color("black")
                cube([third, third, 1.2], center=true);

                color("grey")
                translate([0, 0, 0.6/2 + 0.3])
                cube([
                    third + 10, third + 10, 0.6
                ], center=true);
            }
        }

        for (i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([first/2, first/2, 0])
            translate([second/2, second/2, 0])
            translate([third/2, third/2, 0])
            translate([fourth/1.5, fourth/1.5, 0]) {
                color("black")
                cube([fourth, fourth, 1.2], center=true);

                color("grey")
                translate([0, 0, 0.6/2 + 0.3])
                cube([
                    fourth + 10, fourth + 10, 0.6
                ], center=true);
            }
        }

        for (i = [0:3]) {
            rotate([0, 0, i * 90]) {
                color("black")
                translate([0, -height/2 + 60, -1.2/2])
                linear_extrude(1.2)
                polygon(points = [
                    [0, 24],
                    [-70, 0],
                    [-70, 0.6],
                    [0, 45],
                    [70, 0.6],
                    [70, 0]
                ]);

                color("grey")
                translate([0, -height/2 + 60, 0.3])
                linear_extrude(0.6)
                polygon(points = [
                    [0, 24],
                    [-70, 0.6],
                    [-70, 0],
                    [0, 8],
                    [70, 0],
                    [70, 0.6],
                ]);
            }
        }
    }
}

module side_cover_front_p1_pattern1_black(depth, height) {
    intersection() {
        side_cover_front_p1(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_front_p1_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_front_p1(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_front_p1_pattern1_top(depth, height) {
    intersection() {
        side_cover_front_p1(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_front_p2_pattern1_black(depth, height) {
    intersection() {
        side_cover_front_p2(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_front_p2_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_front_p2(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_front_p2_pattern1_top(depth, height) {
    intersection() {
        side_cover_front_p2(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_front_p3_pattern1_black(depth, height) {
    intersection() {
        side_cover_front_p3(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_front_p3_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_front_p3(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_front_p3_pattern1_top(depth, height) {
    intersection() {
        side_cover_front_p3(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_front_p4_pattern1_black(depth, height) {
    intersection() {
        side_cover_front_p4(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_front_p4_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_front_p4(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_front_p4_pattern1_top(depth, height) {
    intersection() {
        side_cover_front_p4(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_back_p1_pattern1_black(depth, height) {
    intersection() {
        side_cover_back_p1(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_back_p1_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_back_p1(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_back_p1_pattern1_top(depth, height) {
    intersection() {
        side_cover_back_p1(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_back_p2_pattern1_black(depth, height) {
    intersection() {
        side_cover_back_p2(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_back_p2_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_back_p2(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_back_p2_pattern1_top(depth, height) {
    intersection() {
        side_cover_back_p2(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_back_p3_pattern1_black(depth, height) {
    intersection() {
        side_cover_back_p3(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_back_p3_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_back_p3(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_back_p3_pattern1_top(depth, height) {
    intersection() {
        side_cover_back_p3(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}

module side_cover_back_p4_pattern1_black(depth, height) {
    intersection() {
        side_cover_back_p4(depth, height);

        _pattern1(depth, height);

        translate([0, 0, 0.9/2])
        cube([5000, 5000, 0.9], center=true);
    }
}

module side_cover_back_p4_pattern1_white(depth, height) {
    difference() {
        intersection() {
            side_cover_back_p4(depth, height);

            translate([0, 0, 0.9/2])
            cube([5000, 5000, 0.9], center=true);
        }

        _pattern1(depth, height);
    }
}

module side_cover_back_p4_pattern1_top(depth, height) {
    intersection() {
        side_cover_back_p4(depth, height);

        translate([0, 0, 0.9 + 10/2])
        cube([5000, 5000, 10], center=true);
    }
}