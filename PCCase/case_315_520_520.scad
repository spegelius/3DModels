
use <case_models.scad>;
use <common.scad>;
use <fans.scad>;
use <cover.scad>;
use <watercooling.scad>;
use <motherboard.scad>;
use <../Watercooling/common.scad>;
use <../Watercooling/reservoir.scad>;
use <../Dollo/NEW_long_ties/include.scad>;
use <../lib/electric.scad>;


width = 330;
depth = 520;
height = 520;

e_count_w = 1;
e_count_d = 3;
e_count_h = 3;

// WIP, not ready yet!

// case specific models to print
//front_cover_grill_230_500_520_1();
//front_cover_grill_230_500_520_2();
//front_cover_grills_230_500_520();
//front_cover_buttons_230_500_520_black();
//front_cover_buttons_230_500_520_red();
//front_cover_bottom_230_500_520_black();
//front_cover_bottom_230_500_520_red();

//top_cover_grill_230_500_520_1();
//top_cover_grill_230_500_520_2();
//top_cover_grills_230_500_520();
//top_cover_end_front_230_500_520_black();
//top_cover_end_front_230_500_520_red();
//top_cover_end_back_230_500_520_black();
//top_cover_end_back_230_500_520_red();

//debug_iec_c8_wire_cover();
//motherboard_io_cover_230_28();
//motherboard_card_cover_iec_c8_230_520_28();
//motherboard_card_cover_iec_c8_wire_cover();
//motherboard_card_cover_iec_c8_wire_cover_lid();

// view only
mockup();

// w x 4 : 110 DONE BLACK
// d : 140t + 120 + 120 = 380 BLACK DONE
// d : 140t + 120 + 120 = 380 RED DONE
// d : 130 + 130 + 120 = 380 BLACK DONE
// d : 130 + 130 + 120 = 380 RED DONE
// h : 130 + 130 + 140 = 400 BLACK DONE
// h : 130 + 130 + 140 = 400 BLACK
// h : 130 + 130 + 140 = 400 RED DONE
// h : 130 + 130 + 140 = 400 RED


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

//    _front_beams(
//        width, depth, height, e_count_w,
//        e_count_d, e_count_h
//    );

    _side_beams(
        width, depth, height,  e_count_w,
        e_count_d, e_count_h
    );

//    _hd_mocks(
//        width, depth, height, count=6, top_offset=150
//    );

//    _PSU(width);

    //_feet(width, depth);

    _mobo("ATX", width, depth, height, top_offset=28);

//    translate([width/2 - 30/2, depth - 30/2 - 15, 115])
//    rotate([90, 0, 180])
//    fan_mount_140mm(width);
//
//    translate([width/2 - 30/2, depth - 30/2 - 15, 261.7])
//    rotate([90, 0, 180])
//    fan_mount_dual_140mm(width);
//
//    translate([width/2 - 30/2, depth - 30/2 - 15, 406.3])
//    rotate([90, 180, 180])
//    fan_mount_140mm(width);

    //_bottom_cover(width, depth);

//    render()
//    front_covers();
//
//    render()
//    _top_covers(width, depth, height);

    //_right_cover(width, depth, height);
//    _left_cover(width, depth, height);

    _warercooling();
}

module _top_covers(width, depth, height) {

    translate([width/2 - 15, 35, height - 15])
    rotate([90, 180, 0])
    front_cover_bottom(width, 40, brim=false);

    translate([width/2 - 15, 35.1, height - 15])
    rotate([90, 180, 180])
    top_cover_grill_230_500_520_1(supports=false);

    translate([width/2 - 15, 35.2 + 190, height - 15])
    rotate([90, 180, 180])
    top_cover_grill_230_500_520_2(supports=false);

    translate([width/2 - 15, 35.3 + 380, height - 15])
    rotate([90, 180, 180])
    front_cover_bottom(width, 60);
}

module _warercooling() {

    translate([
        15 + 132/2, depth/2 - 25,
        height - 50
    ])
    mock_radiator_360(fans=false);

    translate([
        15 + 132/2 + 132, depth/2 - 25,
        height - 50
    ])
    mock_radiator_360(fans=false);

    translate([
        width/2 - 15, depth/2 - 228,
        height - 30
    ])
    rotate([-90, 0, 0])
    radiator_mount(width);

    translate([
         width/2 - 100/2 - 15,
         depth - 170, 1.6
    ])
    reservoir();

    render()
    translate([
        width/2 - 15,
        depth - 120 + 105/2 + 7, 0
    ])
    rotate([90, 0, 0])
    reservoir_support_beam(230);

    render()
    translate([
        width/2 - 15,
        depth - 120 - 105/2 - 7, 0
    ])
    rotate([90, 0, 180])
    reservoir_support_beam(230);

    translate([
        width/2 - 15,
        depth - 120, 2.1
    ])
    reservoir_holder();
}

module front_covers() {

    translate([
        width/2 - 30/2, depth - 30/2,
        height - 80 - 25
    ])
    rotate([0, 0, 180])
    front_cover_buttons(width, 80);

    translate([
        width/2 - 30/2, depth - 30/2, 80 - 5
    ])
    rotate([180, 0, 0])
    front_cover_bottom(width, 80);

    h = height - 80 - 80 - 20;
    echo("Front grills height:", h)

    render()
    translate([
        width/2 - 30/2, depth - 30/2, 80 - 5
    ])
    rotate([0, 0, 180]) {
        front_cover_grill_230_500_520_1(
            supports=false
        );

        translate([0, 0, 170.05])
        front_cover_grill_230_500_520_2(
            supports=false
        );
    }
}

// case specific models
module front_cover_grill_230_500_520_1(
    supports=true
) {
    front_cover_grill(
        width, 170, 23, 7.75, supports=supports
    );
}

module front_cover_grill_230_500_520_2(
    supports=true
) {
    front_cover_grill(
        width, 170, 23, 0.4, supports=supports
    );
}

module front_cover_grills_230_500_520() {
    union() {
        front_cover_grill_230_500_520_1();

        translate([0, 3, 0])
        rotate([0, 0, 180])
        front_cover_grill_230_500_520_2();

        translate([-width/2 + 15, 3/2, 70])
        cube([1, 4, 2], center=true);

        translate([-width/2 + 15, 3/2, 140])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 70])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 140])
        cube([1, 4, 2], center=true);
    }
}

module front_cover_buttons_230_500_520_black() {
    difference() {
        front_cover_buttons(width, 80);

        translate([0, 0, -8])
        chamfered_cube(
            width - 30, 200, 80, 35, center=true
        );
    }
}

module front_cover_buttons_230_500_520_red() {
    intersection() {
        front_cover_buttons(width, 80);

        translate([0, 0, -8])
        chamfered_cube(
            width - 30, 200, 80, 35, center=true
        );
    }
}

module front_cover_bottom_230_500_520_black() {
    difference() {
        front_cover_bottom(width, 80);

        translate([0, 0, -8])
        chamfered_cube(
            width - 30, 200, 80, 35, center=true
        );
    }
}

module front_cover_bottom_230_500_520_red() {
    intersection() {
        front_cover_bottom(width, 80);

        translate([0, 0, -8])
        chamfered_cube(
            width - 30, 200, 80, 35, center=true
        );
    }
}

module top_cover_grill_230_500_520_1(
    supports=true
) {
    front_cover_grill(
        width, 190, 26, 6, supports=supports
    );
}

module top_cover_grill_230_500_520_2(
    supports=true
) {
    front_cover_grill(
        width, 190, 26, 0, supports=supports
    );
}

module top_cover_grills_230_500_520() {
    union() {
        top_cover_grill_230_500_520_1();

        translate([0, 3, 0])
        rotate([0, 0, 180])
        top_cover_grill_230_500_520_2();

        translate([-width/2 + 15, 3/2, 75])
        cube([1, 4, 2], center=true);

        translate([-width/2 + 15, 3/2, 150])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 75])
        cube([1, 4, 2], center=true);

        translate([width/2 - 15, 3/2, 150])
        cube([1, 4, 2], center=true);

    }
}

module top_cover_end_front_230_500_520_black() {
    difference() {
        front_cover_bottom(width, 60);

        translate([0, 0, -13])
        chamfered_cube(
            width - 25, 200, 80, 35, center=true
        );
    }
}

module top_cover_end_front_230_500_520_red() {
    intersection() {
        front_cover_bottom(width, 60);

        translate([0, 0, -13])
        chamfered_cube(
            width - 25, 200, 80, 35, center=true
        );
    }
}

module top_cover_end_back_230_500_520_black() {
    difference() {
        front_cover_bottom(width, 40);

        translate([0, 0, -33])
        chamfered_cube(
            width + 15, 200, 80, 35, center=true
        );
    }
}

module top_cover_end_back_230_500_520_red() {
    intersection() {
        front_cover_bottom(width, 40);

        translate([0, 0, -33])
        chamfered_cube(
            width + 15, 200, 80, 35, center=true
        );
    }
}

module motherboard_card_cover_iec_c8_230_520_28() {
    difference() {
        union() {
            motherboard_card_cover(
                230, 520, top_offset=28
            );

            difference() {
                translate([-51, 0, 0]) {
                    translate([0, 0, 4/2 + 1])
                    cube([
                        55, 44, 4
                    ], center=true, $fn=30);

                    translate([0.5, 0, 5/2])
                    cube([
                        54, 43, 5
                    ], center=true, $fn=30);
                }

                translate([-51 + 5.5, -26, 0])
                chamfered_cube(
                    19, 15, 25, 
                    4, center=true
                );

                translate([
                    -51 + 12.5, 0, 20/2 + 3
                ])
                chamfered_cube_side(
                    20, 35, 20, 3
                    , center=true, $fn=30
                );

                translate([
                    -51 - 12.5, 0, 20/2 + 3
                ])
                chamfered_cube_side(
                    20, 35, 20, 3
                    , center=true, $fn=30
                );
            }

            hull() {
                translate([-51 - 12, 0, 5/2])
                cylinder(
                    d=17, h=5,
                    center=true, $fn=30
                );

                translate([-51 + 12, 0, 5/2])
                cylinder(
                    d=17, h=5,
                    center=true, $fn=30
                );
            }
        }

        hull() {
            translate([-51 - 8.5/2, 0, 0])
            cylinder(
                d=12, h=20,
                center=true, $fn=30
            );

            translate([-51 + 8.5/2, 0, 0])
            cylinder(
                d=12, h=20,
                center=true, $fn=30
            );
        }

        translate([-51 - 28/2, 0, 0])
        cylinder(
            d=3.3, h=20,
            center=true, $fn=20
        );

        translate([-51 - 28/2, 0, 2])
        rotate([0, 0, 30])
        M3_nut(5);

        translate([-51 + 28/2, 0, 0])
        cylinder(
            d=3.3, h=20,
            center=true, $fn=20
        );

        translate([-51 + 28/2, 0, 2])
        rotate([0, 0, 30])
        M3_nut(5);
    }

    %translate([-51, 0, -3.5])
    mock_iec_c8_female_connector();

    %translate([-51, 0, 5])
    iec_c8_230_520_28_wire_cover();
}

module motherboard_io_cover_230_28() {
    motherboard_io_cover(230, top_offset=28);
}

module _wire_cover_form() {
    rotate([90, 0, 0])
    intersection() {
        hull() {
            hull() {
                translate([9.5, 0, 5/2])
                cylinder(
                    d=22, h=5,
                    center=true, $fn=30
                );

                translate([-9.5, 0, 5/2])
                cylinder(
                    d=22, h=5,
                    center=true, $fn=30
                );
            }

            hull() {
                translate([6, 0, 5/2 + 28])
                cylinder(
                    d=22, h=5,
                    center=true, $fn=30
                );

                translate([-6, 0, 5/2 + 28])
                cylinder(
                    d=22, h=5,
                    center=true, $fn=30
                );
            }
        }
        cube([41, 17, 100], center=true);
    }
}


module motherboard_card_cover_iec_c8_wire_cover() {
    
    difference() {
        _wire_cover_form();

        // lid holes
        translate([-7, -28, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([-7, -28, -18/2])
        M3_nut(4, cone=false, bridging=true);

        translate([7, -28, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([7, -28, -18/2])
        M3_nut(4, cone=false, bridging=true);

        // connector screw holes
        translate([-28/2, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        translate([28/2, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);

        // cutout
        translate([0, 0, 30/2 - 12.6/2])
        cube([21, 48, 30], center=true);

        translate([0, -20, 30/2])
        cube([21, 48, 30], center=true);

        // nut holes
        hull() {
            translate([-28/2, -5, 0])
            rotate([90, 0, 0])
            cylinder(d1=9, d2=6, h=19, $fn=30);

            translate([28/2, -5, 0])
            rotate([90, 0, 0])
            cylinder(d1=9, d2=6, h=19, $fn=30);

            translate([0, -5, 16])
            rotate([90, 0, 0])
            cylinder(d1=9, d2=6, h=19, $fn=30);
        }

        translate([-28/2, -2, 0])
        rotate([90, 30, 0])
        M3_nut(4);

        translate([28/2, -2, 0])
        rotate([90, 30, 0])
        M3_nut(4);

        // wire hole
        difference() {
            rotate([90, 0, 0])
            cylinder(d=7, h=100, center=true, $fn=30);

            translate([0, -28, -3.5])
            rotate([0, 90, 0])
            cylinder(d=2, h=10, center=true, $fn=10);
        }

        // lid cutout
        hull() {
            translate([0, 0, 17/2 - 2.2/2 + 0.2])
            cube([30, 10, 2.2], center=true);

            translate([0, -33, 17/2 - 2.2/2 + 0.2])
            cube([23, 5, 2.2], center=true);
        }

        // clip groove
        translate([0, -5.5, 4.2])
        rotate([0, 90, 0])
        cylinder(d=2, h=28, center=true, $fn=20);

        translate([0, -5.5, 5.5])
        rotate([-10, 0, 0])
        cube([28.4, 1.1, 5], center=true);
    }
}

module motherboard_card_cover_iec_c8_wire_cover_lid() {
    difference() {
        union() {
            hull() {
                translate([0, -5/2, 2/2])
                cube([29.8, 5, 2], center=true);

                translate([0, -30.5, 2/2])
                cube([23.4, 5, 2], center=true);
            }

            translate([0, -33 + 9/2, 17/4])
            cube([20.8, 9, 17/2], center=true);

            // clips
            translate([11.5, -5 - 1.2/2, 5/2])
            cube([5, 1.2, 5], center=true);

            translate([11.5, -5.6, 4.1])
            rotate([0, 90, 0])
            cylinder(d=1.8, h=5, center=true, $fn=20);

            translate([-11.5, -5 - 1.2/2, 5/2])
            cube([5, 1.2, 5], center=true);

            translate([-11.5, -5.6, 4.1])
            rotate([0, 90, 0])
            cylinder(d=1.8, h=5, center=true, $fn=20);
            
        }

        // mount holes
        translate([7, -28, 3.2])
        cylinder(d=3.3, h=30, $fn=20);

        translate([7, -28, 0])
        cylinder(d=6.3, h=6, center=true, $fn=20);

        translate([-7, -28, 3.2])
        cylinder(d=3.3, h=30, $fn=20);

        translate([-7, -28, 0])
        cylinder(d=6.3, h=6, center=true, $fn=20);

        // wire hole
        difference() {
            translate([0, 0, 17/2])
            rotate([90, 0, 0])
            cylinder(d=7, h=100, center=true, $fn=30);

            translate([0, -30, 17/2 - 3.5])
            rotate([0, 90, 0])
            cylinder(d=2, h=10, center=true, $fn=10);
        }

        // clip chamfer
        translate([0, -4.15, 5.1])
        rotate([23, 0, 0])
        cube([50, 2, 5], center=true);
    }
}

module debug_iec_c8_wire_cover() {
    %translate([0, 3.5 + 5, 0])
    rotate([90, 0, 0])
    mock_iec_c8_female_connector();

    motherboard_card_cover_iec_c8_wire_cover();

    translate([0, 0, 17/2])
    rotate([0, 180, 0])
    motherboard_card_cover_iec_c8_wire_cover_lid();
}