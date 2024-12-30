use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/extention.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
include <../PCParts/common.scad>;
include <variables.scad>;


//debug_bottom();
//debug_side_cover();
//debug_side_cover_parts();
//debug_side_cover_mount();
//debug_side_cover_split_clip();

//debug_front_cover();

//debug_cover_buttons();
//debug_cover_buttons_4_leds();
//debug_cover_lens();


// BOTTOM COVER MODELS
//bottom(200, 400, fan_hole=false);
//bottom(230, 430);
//bottom(230, 500);
//bottom(240, 540);
//bottom_mount_clip();

//test_bottom_clip();


// SIDE COVER MODELS 430x480
//side_cover_left(430, 480);
//side_cover_right(430, 480);

//side_cover_left_p1(430, 480);
//side_cover_left_p2(430, 480);
//side_cover_left_p3(430, 480);
//side_cover_left_p4(430, 480);

//side_cover_right_p1(430, 480);
//side_cover_right_p2(430, 480);
//side_cover_right_p3(430, 480);
//side_cover_right_p4(430, 480);


// SIDE COVER MODELS 540x525
//side_cover_left(540, 525);
//side_cover_right(540, 525);

//side_cover_left_p1(540, 525);
//side_cover_left_p2(540, 525);
//side_cover_left_p3(540, 525);
//side_cover_left_p4(540, 525);

//side_cover_right_p1(540, 525);
//side_cover_right_p2(540, 525);
//side_cover_right_p3(540, 525);
//side_cover_right_p4(540, 525);

// SIDE COVER MODELS 540x550
//side_cover_left(540, 550);
//side_cover_right(540, 550);

//side_cover_left_p1(540, 550);
//side_cover_left_p2(540, 550);
//side_cover_left_p3(540, 550);
//side_cover_left_p4(540, 550);

//side_cover_right_p1(540, 550);
//side_cover_right_p2(540, 550);
//side_cover_right_p3(540, 550);
//side_cover_right_p4(540, 550);


// SIDE COVER MODELS 500x520
//side_cover_left(500, 520);
//side_cover_right(500, 520);

//side_cover_left_p1(500, 520);
//side_cover_left_p2(500, 520);
//side_cover_left_p3(500, 520);
//side_cover_left_p4(500, 520);

//side_cover_right_p1(500, 520);
//side_cover_right_p2(500, 520);
//side_cover_right_p3(500, 520);
//side_cover_right_p4(500, 520);


// GENERIC SIDE COVER MODELS
//side_cover_split_clip();

//side_cover_mount();

//side_cover_mount_split_center_left();
//side_cover_mount_split_center_left(_offset=0.4);
//side_cover_mount_split_center_left(_offset=0.8);
//side_cover_mount_split_ring_left();

//side_cover_mount_split_center_right();
//side_cover_mount_split_center_right(_offset=0.4);
//side_cover_mount_split_center_right(_offset=0.8);
//side_cover_mount_split_ring_right();

//test_side_cover_split_clip();


// FRONT COVER MODELS
//front_cover_end(230, 40);
//front_cover_end(230, 60);
//front_cover_end(230, 60, snap=true);
//front_cover_end(230, 80);
//front_cover_end(230, 80, snap=true);
//front_cover_end(230, 100);
//front_cover_end(230, 100, snap=true);

//front_cover_end(240, 40);
//front_cover_end(240, 80);
//front_cover_end(240, 80, snap=true);
//front_cover_end(240, 130);
//front_cover_end(240, 130, snap=true);

//front_cover_buttons(230, 70);
//front_cover_buttons(230, 80);
//front_cover_buttons(240, 70);
//front_cover_buttons(240, 80);

//front_cover_buttons_4_leds(240, 70);
//front_cover_buttons_4_leds(240, 80);

//front_cover_buttons_mount();
//front_cover_buttons_mount_4_leds();

// 230x480 case
//front_cover_grill(230, 300, 40, 4, supports=true);
//front_cover_grill(230, 300, 40, 4, supports=false);
//front_cover_grill(230, 150, 21, 1.5, supports=true);
//front_cover_grill(230, 150, 21, 1.5, supports=false);

// 230x520 case
//front_cover_grill(230, 170, 24, 0, supports=true);
//front_cover_grill(230, 170, 24, 0, supports=false);

// 240x525 case
//front_cover_grill(240, 172, 24, 1.25, supports=true);
//front_cover_grill(240, 172, 24, 1.25, supports=false);

// 240x550 case
//front_cover_grill(240, 420/2, 29, 4, supports=true);
//front_cover_grill(240, 420/2, 29, 4, supports=false);
//front_cover_grill(240, 420/3, 19, 4, supports=true);
//front_cover_grill(240, 420/3, 19, 4, supports=false);

//front_cover_grill(240, 175, 24, 3, supports=true);
//front_cover_grill(240, 175, 24, 3, supports=false);

//front_cover_snap_clip_left();
//front_cover_snap_clip_right();

//test_front_cover_snap_clip();

//front_cover_plate_240();
//front_cover_plate_240_top();

//front_cover_plate_230_top();

//top_cover_grill_end(240, 150, 15, 0, brim=true);

//cover_button();
cover_lens_5mm_led();


module debug_bottom() {
    bottom(240, 400);

    %translate([-240/2 + 15, 0, 15])
    rotate([90, 0, 0])
    extention(2, support=false);

    translate([-240/2 + 30, 0, 15])
    rotate([90, 0, 0])
    bottom_clip();
}

module debug_side_cover() {
    _side_cover_template(430, 480);

    %translate([430/2 - 30/2, 100, 30/2 + 5])
    rotate([90, 0, 0])
    extention(support=false);

    translate([430/2 - 30/2 + 17, 480/5, 0])
    rotate([0, 0, 180])
    side_cover_mount();

    translate([430/2 - 30/2 + 17, -480/5, 0])
    rotate([0, 0, 180])
    side_cover_mount();

    translate([-430/5, -480/2 + 30/2 - 17, 0])
    rotate([0, 0, 90])
    side_cover_mount();

    translate([430/5, -480/2 + 30/2 - 17, 0])
    rotate([0, 0, 90])
    side_cover_mount();

    translate([-430/2 + 30/2 - 17, 480/5, 0])
    debug_side_cover_mount();

    translate([-430/2 + 30/2 - 17, -480/5, 0])
    debug_side_cover_mount();

    translate([-430/5, 480/2 - 30/2 + 17, 0])
    rotate([0, 0, -90])
    debug_side_cover_mount();

    translate([430/5, 480/2 - 30/2 + 17, 0])
    rotate([0, 0, -90])
    debug_side_cover_mount();
}

module debug_side_cover_mount() {

    side_cover_mount_split_center();

    side_cover_mount_split_ring();
}

module debug_side_cover_parts() {

//    translate([5, 5, 0])
//    side_cover_p1(430, 480);
//
//    translate([5, -5, 0])
//    side_cover_p2(430, 480);
//
//    translate([-5, -5, 0])
//    side_cover_p3(430, 480);
//
//    translate([-5, 5, 0])
//    side_cover_p4(430, 480);

    translate([5, 5, 0])
    side_cover_p1(540, 525);

    translate([5, -5, 0])
    side_cover_p2(540, 525);

    translate([-5, -5, 0])
    side_cover_p3(540, 525);

    translate([-5, 5, 0])
    side_cover_p4(540, 525);
}

module debug_side_cover_split_clip() {
    intersection() {
        union() {
            translate([0, -100, 0])
            side_cover_front_p1(430, 480);

            translate([0, -100, 0])
            side_cover_front_p4(430, 480);
        }
        cube([30, 20, 30], center=true);
    }

    translate([0, 0, 7.8])
    rotate([90, 0, 0])
    side_cover_split_clip();
}

module debug_front_cover() {
    render()

    intersection() {
        front_cover_grill(
            230, 100, 10, 4,
            supports=false
        );

        cube([500, 100, 100], center=true);
    }

    translate([-230/2 + 30/2, 0.3/2, 50-1])
    rotate([0, 0, 180])
    front_cover_snap_clip_left();
}

module debug_cover_buttons() {

    translate([-35, -17 + 5, 30])
    rotate([90, 0, 0])
    cover_button();

    intersection() {
        front_cover_buttons(230, 70);

//        translate([-60/2 - 10, 0, 0])
//        cube([60, 100, 100], center=true);

//        translate([-60/2 + 40, 0, 0])
//        cube([60, 100, 100], center=true);
    }

    translate([40, -6, 30])
    rotate([90, 90, 0])
    debug_cover_lens();

    translate([0, 0.2, 30])
    rotate([90, 0, 0])
    front_cover_buttons_mount();
}

module debug_cover_buttons_4_leds() {

    translate([-35, -17 + 5, 30])
    rotate([90, 0, 0])
    cover_button();

    intersection() {
        front_cover_buttons_4_leds(230, 70);

//        translate([-60/2 - 10, 0, 0])
//        cube([60, 100, 100], center=true);

//        translate([-60/2 + 40, 0, 0])
//        cube([60, 100, 100], center=true);
    }

    translate([40, -6, 30])
    rotate([90, 90, 0])
    debug_cover_lens();

    translate([0, 0.2, 30])
    rotate([90, 0, 0])
    front_cover_buttons_mount_4_leds();
}

module debug_cover_lens() {
    mock_led_5mm();

    intersection() {
        cover_lens_5mm_led();

        translate([-20/2, 0, 0])
        cube([20, 20, 40], center=true);
    }
}

//_side_indents(240, 200);

module _bottom_form(w, d, h=10, fan_hole=true) {

    difference() {
        translate([0, 0, h/2])
        rounded_cube(
            w, d, h, 2, center=true, $fn=20
        );

        // corners
        translate([w/2 + 5, d/2 + 5, 0])
        rotate([0, 0, 45])
        cube([42, 42, 20], center=true);

        translate([-w/2 - 5, d/2 + 5, 0])
        rotate([0, 0, 45])
        cube([42, 42, 20], center=true);

        translate([w/2 + 5, -d/2 - 5, 0])
        rotate([0, 0, 45])
        cube([42, 42, 20], center=true);

        translate([-w/2 - 5, -d/2 - 5, 0])
        rotate([0, 0, 45])
        cube([42, 42, 20], center=true);

        if (fan_hole) {
            // PSU fan hole
            translate([0, -d/2 + 150/2 + 5, 0])
            chamfered_cube(145, 150, 145, 15, center=true);
        }
    }
}

module _bottom_indents(w, d, h, fan_hole=true) {

    module _bottom_indent_frame() {
        linear_extrude(10)
        offset(-3)
        projection(cut=false)
        _bottom_form(w, d, h, fan_hole=fan_hole);
    }

    count_w = ceil(w / 10);
    _w = count_w * 12 - 12;

    count_d = ceil(d / 10);
    _d = count_d * 12 - 12;
    
    intersection() {
        for(i = [0 : count_d - 1]) {
            for(j = [0 : count_w - 1]) {
                translate([
                    -_w/2 + j*12,
                    -_d/2 + i*12,
                    -1/2 + 0.25
                ])
                cube([10, 10, 1], center=true);

            }
        }

        _bottom_indent_frame();
    }

    count_wt = ceil(w / 30);
    _wt = count_wt * 32 - 32;

    count_dt = ceil(d / 30);
    _dt = count_dt * 32 - 32;
    
    intersection() {
        for(i = [0 : count_dt - 1]) {
            for(j = [0 : count_wt - 1]) {
                translate([
                    -_wt/2 + j*32,
                    -_dt/2 + i*32,
                    5/2 + 1
                ])
                cube([30, 30, 5], center=true);

            }
        }

        _bottom_indent_frame();
    }   
}

module bottom(width, depth, fan_hole=true) {
    w = width - 60 - 0.2;
    d = depth - 60 - 0.2;
    h = 10;

    intersection() {
        difference() {
            _bottom_form(w, d, h=10, fan_hole=fan_hole);

            translate([0, 0, h/2 + 4])
            cube([w - 4.4, d - 4.4, h], center=true);

            translate([0, 0, h + h/2 - 2.2])
            chamfered_cube(w, d, h, 2.2, center=true);

            translate([0, 0, h - 3.5])
            hull() {
                cube([w - 2.8, d - 2.8, 1], center=true);

                cube([w - 4.8, d - 4.8, 3], center=true);
            }

            _bottom_indents(w, d, h, fan_hole=fan_hole);

        }

        translate([0, 0, h/2 - 0.8])
        cube([w + 4, d, h], center=true);
    }
}

module bottom_mount_clip() {
    difference() {
        union() {
            rotate([90, 0, 0])
            long_tie_half(15);

            translate([0, -2.5/2, 0])
            cube([0.3, 2.5, 15], center=true);

            hull() {
                translate([2.2/2 + 0.1, -2.5/2, 0])
                cube([2.2, 2.5, 15], center=true);

                translate([2.2 + 0.1, -2/2, 0])
                cylinder(d=2, h=15, center=true, $fn=30);
            }

            hull() {
                translate([2.2 + 2/2 + 0.1, -6, 0])
                cylinder(d=2, h=15, center=true, $fn=30);

                translate([2.2 + 0.1, -2/2, 0])
                cylinder(d=2, h=15, center=true, $fn=30);
            }

            hull() {
                translate([2.2 + 2/2 + 0.1, -6, 0])
                cylinder(d=2, h=15, center=true, $fn=30);

                translate([2.2 + 2/2 + 0.1, -9, 0])
                cylinder(d=2, h=15, center=true, $fn=30);
            }

            hull() {
                translate([2/2 + 1.5, -8.5, 0])
                cube([2, 1, 15], center=true);

                translate([1/2 + 2.5, -8.5, 0])
                cube([1, 3, 15], center=true);
            }
        }
    }
}

// TODO
module bottom_split_1(width, depth) {
    intersection() {
        bottom(width, depth);
    }
}

module test_bottom_clip() {
    translate([0, 0, 15/2])
    bottom_mount_clip();

    translate([50, 0, 8/2])
    intersection() {
        bottom(200, 160, fan_hole=false);

        translate([-70, 0, 0])
        cube([20, 100, 20], center=true);
    }
}

module _side_cover_template(
    depth, height, splits=false
) {

    x_off = depth/5;
    y_off = height/5;

    module _frame_shim() {
        translate([8/2 - 0.2, -8/2 + 0.2, 11/2])
        difference() {
            chamfered_cube_side(
                depth - 68.4, height - 68.4,
                11, 19.5, center=true
            );

            translate([0, height/2, 0])
            cube([depth - 111, 79, 30], center=true);

            translate([0, -height/2, 0])
            cube([depth - 111, 79, 30], center=true);

            translate([depth/2, 0, 0])
            cube([79, height - 111, 30], center=true);

            translate([-depth/2, 0, 0])
            cube([79, height - 111, 30], center=true);

            difference() {
                chamfered_cube_side(
                    depth - 78.4, height - 78.4,
                    20, 16.5, center=true
                );
                if (splits) {
                    translate([-8/2 + 0.2, 8/2 - 0.2, 1])
                    chamfered_cube(
                        9.5, height, 5, 1, center=true
                    );

                    translate([-8/2 + 0.2, 8/2 - 0.2, 1])
                    chamfered_cube(
                        depth, 9.5, 5, 1, center=true
                    );
                }
            }
        }
    }

    module _mount_hole() {
        translate([0, 0, 5/2])
        difference() {
            cylinder(d=53.1, h=6, center=true, $fn=60);

            cube_donut(
                55.1, 4, angle=360, rotation=45, $fn=60
            );
        }
    }

    module _main_form()  {
        difference() {
            hull() {
                translate([0, 0, 1/2])
                chamfered_cube_side(
                    depth - 30, height - 30, 1,
                    25, center=true
                );

                translate([0, 0, 5 - 1/2])
                chamfered_cube_side(
                    depth - 24, height - 24, 1,
                    25, center=true
                );
            }

            // indent
            translate([0, 0, 7/2 + 0.89])
            difference() {
                chamfered_cube_side(
                    depth - 55, height - 55,
                    7, 19.5, center=true
                );

                cube([
                    10, 1000, 14
                ], center=true);

                cube([
                    1000, 10, 14
                ], center=true);            

                translate([
                    (depth - 55)/4, 0, 0
                ])
                cube([2, 1000, 14], center=true);

                translate([
                    -(depth - 55)/4, 0, 0
                ])
                cube([2, 1000, 14], center=true);
                
                translate([
                    0, -(height - 55)/4, 0
                ])
                cube([1000, 2, 14], center=true);

                translate([
                    0, (height - 55)/4, 0
                ])
                cube([1000, 2, 14], center=true);

                // ring mount holes
                translate([-depth/2 + 10, y_off, 0])
                cylinder(d=60, h=40, center=true);

                translate([-depth/2 + 10, -y_off, 0])
                cylinder(d=60, h=40, center=true);

                translate([x_off, height/2 + -10, 0])
                cylinder(d=60, h=40, center=true);

                translate([-x_off, height/2 + -10, 0])
                cylinder(d=60, h=40, center=true);
            }
        }
    }
    
    difference() {
        union() {
            _main_form();

            _frame_shim();

            translate([
                -depth/2 + 60, height/2 - 60,
                1/2 + 0.8
            ])
            hull() {
                cylinder(d=0.1, h=1, center=true);
            
                translate([0, -8, 0])
                cube([10, 0.1, 1], center=true);
            }
        }
 
        
        translate([depth/2 + 2, y_off, 0])
        _mount_hole();

        translate([depth/2 + 2, -y_off, 0])
        _mount_hole();

        translate([x_off, -height/2 - 2, 0])
        _mount_hole();

        translate([-x_off, -height/2 - 2, 0])
        _mount_hole();

        // ring mount holes
        translate([-depth/2 + 10, y_off, 0])
        _mount_hole();

        translate([-depth/2 + 10, -y_off, 0])
        _mount_hole();

        translate([x_off, height/2 + -10, 0])
        _mount_hole();

        translate([-x_off, height/2 + -10, 0])
        _mount_hole();
    }
}

module side_cover_right(depth, height) {
    _side_cover_template(
        depth, height, splits=false
    );
}

module side_cover_left(depth, height) {
    difference() {
        mirror([1, 0, 0])
        _side_cover_template(
            depth, height, splits=false
        );

        translate([depth/2 - 158, 0, 30/2 + 5.01])
        cube([38, 2000, 30], center=true);
    }
}

module _side_cover_pin_holes(depth, height) {

    translate([0, 20, 5/2])
    rotate([0, 90, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([0, height/4, 5/2])
    rotate([0, 90, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([0, height/2 - 20, 5/2])
    rotate([0, 90, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([0, -20, 5/2])
    rotate([0, 90, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([0, -height/4, 5/2])
    rotate([0, 90, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([0, -height/2 + 20, 5/2])
    rotate([0, 90, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([20, 0, 5/2])
    rotate([90, 0, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([depth/4, 0, 5/2])
    rotate([90, 0, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([depth/2 - 20, 0, 5/2])
    rotate([90, 0, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([-20, 0, 5/2])
    rotate([90, 0, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([-depth/4, 0, 5/2])
    rotate([90, 0, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);

    translate([-depth/2 + 20, 0, 5/2])
    rotate([90, 0, 0])
    cylinder(d=1.8, h=8, center=true, $fn=20);
}

module _side_cover_p1(depth, height, left=false) {
    difference() {
        intersection() {
            union() {
                mirror([left ? 1: 0, 0])
                _side_cover_template(
                    depth, height, splits=true
                );

                translate([30, 30, 0])
                linear_extrude(2)
                text("1", size=15);
            }

            union() {
                difference() {
                    translate([1000/2, 1000/2, 50/2])
                    hull() {
                        cube(
                            [1000, 1000, 49],
                            center=true
                        );
                        cube(
                            [999, 999, 50],
                            center=true
                        );
                    }

                    translate([0, 0, 5/2])
                    rotate([0, 45, 0])
                    cube([
                        1.4, height - 33, 1.4
                    ], center=true);
                }

                translate([(depth - 38)/4 + 1, 0, 5/2])
                rotate([45, 0, 0])
                cube([
                    (depth - 38)/2, 1.3, 1.3
                ], center=true);
            }
        }

        translate([5.5, 5.1, 5])
        rotate([-90, 0, 0])
        hull() {
            cylinder(d=2, h=height/2 - 48, $fn=20);

            translate([2, -1, 0])
            cylinder(d=2, h=height/2 - 48, $fn=20);
        }

        if (left) {
            translate([depth/2 - 42.6, 5.5, 5])
            rotate([90, 0, -90])
            hull() {
                cylinder(d=2, h=depth/2 - 48, $fn=20);

                translate([-2, 1, 0])
                cylinder(d=2, h=depth/2 - 48, $fn=20);
            }
        } else {
            translate([depth/2 - 35.6, 5.5, 5])
            rotate([90, 0, -90])
            hull() {
                cylinder(d=2, h=depth/2 - 41, $fn=20);

                translate([-2, 1, 0])
                cylinder(d=2, h=depth/2 - 41, $fn=20);
            }
        }

        if (left) {
            translate([depth/2 - 158, 0, 30/2 + 5.01])
            cube([38, 2000, 30], center=true);
        }

        _side_cover_pin_holes(depth, height);
    }
}

module side_cover_right_p1(depth, height) {
    _side_cover_p1(depth, height, left=false);
}

module side_cover_left_p1(depth, height) {
    _side_cover_p1(depth, height, left=true);
}

module _side_cover_p2(depth, height, left=false) {
    difference() {
        intersection() {
            union() {
                mirror([left ? 1: 0, 0])
                _side_cover_template(
                    depth, height, splits=true
                );

                translate([30, -30, 0])
                linear_extrude(2)
                text("2", size=15);
            }

            union() {
                difference() {
                    translate([1000/2, -1000/2, 50/2])
                    hull() {
                        cube(
                            [1000, 1000, 49],
                            center=true
                        );

                        cube(
                            [999, 999, 50],
                            center=true
                        );
                    }

                    translate([0, 0, 5/2])
                    rotate([45, 0, 0])
                    cube(
                        [depth - 33, 1.4, 1.4],
                        center=true
                    );
                }
                translate([0, -(height - 38)/4 - 1, 5/2])
                rotate([0, 45, 0])
                cube([
                    1.3, (height - 38)/2, 1.3
                ], center=true);
            }
        }
        
        translate([5.5, -5.1, 5])
        rotate([90, 0, 0])
        hull() {
            cylinder(d=2, h=height/2 - 41, $fn=20);

            translate([2, 1, 0])
            cylinder(d=2, h=height/2 - 41, $fn=20);
        }

        if (left) {
            translate([depth/2 - 42.6, -5.5, 5])
            rotate([90, 0, -90])
            hull() {
                cylinder(d=2, h=depth/2 - 48, $fn=20);

                translate([2, 1, 0])
                cylinder(d=2, h=depth/2 - 48, $fn=20);
            }
        } else {
            translate([depth/2 - 35.6, -5.5, 5])
            rotate([90, 0, -90])
            hull() {
                cylinder(d=2, h=depth/2 - 41, $fn=20);

                translate([2, 1, 0])
                cylinder(d=2, h=depth/2 - 41, $fn=20);
            }
        }

        if (left) {
            translate([depth/2 - 158, 0, 30/2 + 5.01])
            cube([38, 2000, 30], center=true);
        }

        _side_cover_pin_holes(depth, height);
    }
}

module side_cover_right_p2(depth, height) {
    _side_cover_p2(depth, height, left=false);
}

module side_cover_left_p2(depth, height) {
    _side_cover_p2(depth, height, left=true);
}

module _side_cover_p3(depth, height, left=false) {
    difference() {
        intersection() {
            union() {
                mirror([left ? 1: 0, 0])
                _side_cover_template(
                    depth, height, splits=true
                );

                translate([-30, -30, 0])
                linear_extrude(2)
                text("3", size=15);
            }

            union() {
                difference() {
                    translate([-1000/2, -1000/2, 50/2])
                    hull() {
                        cube(
                            [1000, 1000, 49],
                            center=true
                        );

                        cube(
                            [999, 999, 50],
                            center=true
                        );
                    }

                    translate([0, 0, 5/2])
                    rotate([0, 45, 0])
                    cube([
                        1.4, height - 33, 1.4
                    ], center=true);
                }
                translate([-(depth - 38)/4 - 1, 0, 5/2])
                rotate([45, 0, 0])
                cube([
                    (depth - 38)/2, 1.3, 1.3
                ], center=true);
            }
        }
        
        translate([-5.5, -5.1, 5])
        rotate([90, 0, 0])
        hull() {
            cylinder(d=2, h=height/2 - 41, $fn=20);

            translate([-2, 1, 0])
            cylinder(d=2, h=height/2 - 41, $fn=20);
        }

        if (left) {
            translate([-depth/2 + 36, -5.5, 5])
            rotate([90, 0, 90])
            hull() {
                cylinder(d=2, h=depth/2 - 41, $fn=20);

                translate([-2, 1, 0])
                cylinder(d=2, h=depth/2 - 41, $fn=20);
            }
        } else {
            translate([-depth/2 + 43, -5.5, 5])
            rotate([90, 0, 90])
            hull() {
                cylinder(d=2, h=depth/2 - 48, $fn=20);

                translate([-2, 1, 0])
                cylinder(d=2, h=depth/2 - 48, $fn=20);
            }
        }

        _side_cover_pin_holes(depth, height);
    }
}

module side_cover_right_p3(depth, height) {
    _side_cover_p3(depth, height, left=false);
}

module side_cover_left_p3(depth, height) {
    _side_cover_p3(depth, height, left=true);
}

module _side_cover_p4(depth, height, left=false) {
    difference() {
        intersection() {
            union(){
                mirror([left ? 1: 0, 0])
                _side_cover_template(
                    depth, height, splits=true
                );
                
                translate([-30, 30, 0])
                linear_extrude(2)
                text("4", size=15);
            }

            union() {
                difference() {
                    translate([-1000/2, 1000/2, 50/2])
                    hull() {
                        cube(
                            [1000, 1000, 49],
                            center=true
                        );

                        cube(
                            [999, 999, 50],
                            center=true
                        );
                    }

                    translate([0, 0, 5/2])
                    rotate([45, 0, 0])
                    cube(
                        [depth - 33, 1.4, 1.4],
                        center=true
                    );
                }

                translate([0, (height - 38)/4 + 1, 5/2])
                rotate([0, 45, 0])
                cube([
                    1.3, (height - 38)/2, 1.3
                ], center=true);
            }
        }
        
        translate([-5.5, 5.1, 5])
        rotate([-90, 0, 0])
        hull() {
            cylinder(d=2, h=height/2 - 48, $fn=20);

            translate([-2, -1, 0])
            cylinder(d=2, h=height/2 - 48, $fn=20);
        }

        if (left) {
            translate([-depth/2 + 36, 5.5, 5])
            rotate([90, 0, 90])
            hull() {
                cylinder(d=2, h=depth/2 - 41, $fn=20);

                translate([2, 1, 0])
                cylinder(d=2, h=depth/2 - 41, $fn=20);
            }
        } else {
            translate([-depth/2 + 43, 5.5, 5])
            rotate([90, 0, 90])
            hull() {
                cylinder(d=2, h=depth/2 - 48, $fn=20);

                translate([2, 1, 0])
                cylinder(d=2, h=depth/2 - 48, $fn=20);
            }
        }

        _side_cover_pin_holes(depth, height);
    }
}

module side_cover_right_p4(depth, height) {
    _side_cover_p4(depth, height, left=false);
}

module side_cover_left_p4(depth, height) {
    _side_cover_p4(depth, height, left=true);
}

module side_cover_mount(_offset=0) {
    intersection() {
        difference() {
            union() {
                translate([_offset, 0, 0])
                cylinder(d=53, h=5, $fn=60);

                translate([17, 0, 0.15])
                long_bow_tie_split(26);
            }

            translate([_offset, 0, 5/2])
            cube_donut(
                55, 4, angle=360, rotation=45, $fn=60
            );
        }

        // chamfer
        union() {
            hull() {
                translate([30/2 + 17, 0, 1/2])
                cube([30, 55, 1], center=true);

                translate([30/2 + 14, 0, 5 + 10/2 - 1])
                cube([30, 55, 10], center=true);
            }
            translate([0, 0, 10/2 + 5.001])
            cube([50, 60, 10], center=true);
        }
    }
}

module side_cover_mount_split_center_right(_offset=0) {
    difference() {
        side_cover_mount(12);

        difference() {
            union() {
                translate([12 + _offset, 0, -1])
                tube(54, 6.2, 6, $fn=60);

                translate([12 + _offset, 0, 5/2])
                cube_donut(
                    43, 2, angle=360, rotation=45, $fn=60
                );
            }

            translate([14.5 + _offset, -18.33])
            rotate([0, 0, 15])
            cube([5, 5.25, 20], center=true);
        }
    }
}

module side_cover_mount_split_ring_right() {
    difference() {
        intersection() {
            side_cover_mount(12);

            translate([12, 0, 0])
            cylinder(d=60, h=5);
        }

        union() {
            difference() {
                translate([12, 0, 0])
                cylinder(
                    d=42.1, h=30, center=true, $fn=60
                );

                translate([12, 0, 5/2])
                cube_donut(
                    43, 1.9, angle=360,
                    rotation=45, $fn=60
                );
            }
            translate([15, -18.33])
            rotate([0, 0, 15])
            cube([4.2, 5.2, 20], center=true);
        }
    }
}

module side_cover_mount_split_center_left(_offset=0) {
    mirror([1, 0, 0])
    side_cover_mount_split_center_right(_offset);
}

module side_cover_mount_split_ring_left() {
    mirror([1, 0, 0])
    side_cover_mount_split_ring_right();
}

module side_cover_split_clip() {
    union() {
        difference() {
            rounded_cube_side(
                14, 6.5, 14, 2, center=true, $fn=20
            );

            translate([0, -2, 0])
            cube([10, 6.5, 15], center=true);
        }

        translate([5.4, -2.8, 0])
        cylinder(d=1.9, h=14, center=true, $fn=20);

        translate([-5.4, -2.8, 0])
        cylinder(d=1.9, h=14, center=true, $fn=20);

    }
}

module test_side_cover_split_clip() {
    intersection() {
        union() {
            translate([2, -100, 0])
            side_cover_left_p1(430, 480);

            translate([-2, -100, 0])
            side_cover_left_p4(430, 480);
        }
        cube([22, 13, 30], center=true);
    }

    translate([0, 12, 10/2])
    side_cover_split_clip();
}

module _front_cover(
    width, height, brim=true, snap=false
) {

    wall = 1.6;

    module _snap_hole() {

        difference() {
            union() {
                translate([-0.4, 5/2 - 0.85, 0])
                cube([6, 5, 15], center=true);

                translate([-3.2, 0, 0])
                cube([5, 7.8, 15], center=true);

                translate([2.2, 0, 0])
                cube([1.8, 8.5, 15], center=true);

                // chamfers
                translate([1.6, -0.3, 0])
                rotate([0, 0, 40])
                cube([2, 2, 15], center=true);

                translate([-1, -0.3, 0])
                rotate([0, 0, -40])
                cube([2, 2, 15], center=true);
                
                // claws
                translate([
                    -1.3,
                    -7.8/2 + 1.1/2 -0.08, 0
                ])
                cube([2, 1.7, 15], center=true);

                translate([
                    1.9,
                    -7.8/2 + 1.1/2 -0.08, 0
                ])
                cube([2, 1.7, 15], center=true);

            }

            translate([4, -3.2, 15])
            rotate([0, 45, -45])
            cube([20, 30, 20], center=true);
        }
    }

    difference() {
        union() {
            if (!snap) {
                translate([
                    width/2 - 30/2, 0.1, height/2
                ])
                rotate([-90, 0, 0])
                long_tie_split(height);

                translate([-width/2 + 30/2, 0, height/2])
                rotate([-90, 0, 0])
                long_tie_split(height);
            }

            translate([width/2 - 30/2, 0.1, height/2])
            cube([5, 0.3, height], center=true);

            translate([-width/2 + 30/2, 0, height/2])
            cube([5, 0.3, height], center=true);

            // side walls
            hull() {
                translate([
                    width/2 - 30/2 + 4, -wall/2, 0
                ])
                cylinder(d=wall, h=height, $fn=40);

                translate([width/2 - 30/2 - 1, -6, 0])
                cylinder(d=wall, h=height, $fn=100);
            }

            hull() {
                translate([width/2 - 30/2 - 20, -17, 0])
                cylinder(d=wall, h=height, $fn=100);

                translate([width/2 - 30/2 - 1, -6, 0])
                cylinder(d=wall, h=height, $fn=100);
            }

            hull() {
                translate([
                    -width/2 + 30/2 - 4, -wall/2, 0
                ])
                cylinder(d=wall, h=height, $fn=40);

                translate([-width/2 + 30/2 + 1, -6, 0])
                cylinder(d=wall, h=height, $fn=100);
            }

            hull() {
                translate([-width/2 + 30/2 + 20, -17, 0])
                cylinder(d=wall, h=height, $fn=100);

                translate([-width/2 + 30/2 + 1, -6, 0])
                cylinder(d=wall, h=height, $fn=100);
            }

            // middle wall
            hull() {
                translate([-width/2 + 30/2 + 20, -17, 0])
                cylinder(d=wall, h=height, $fn=100);

                translate([width/2 - 30/2 - 20, -17, 0])
                cylinder(d=wall, h=height, $fn=100);
            }

            // side beams
            hull() {
                translate([
                    width/2 - 30/2 + 4, -wall/2, 0
                ])
                cylinder(d=wall, h=height, $fn=40);

                translate([
                    width/2 - 30/2 -2.2, -wall/2, 0
                ])
                cylinder(d=wall, h=height, $fn=40);

                translate([
                    width/2 - 30/2 - 2.4, -wall/2 - 6, 0
                ])
                cylinder(d=wall, h=height, $fn=40);
            }

            hull() {
                translate([
                    -width/2 + 30/2 - 4, -wall/2, 0
                ])
                cylinder(d=wall, h=height, $fn=40);

                translate([
                    -width/2 + 30/2 + 2.2, -wall/2, 0
                ])
                cylinder(d=wall, h=height, $fn=40);

                translate([
                    -width/2 + 30/2 + 2.4, -wall/2 - 6, 0
                ])
                cylinder(d=wall, h=height, $fn=40);
            }

            if (brim) {
                translate([width/2 - 30/2, 0, 0])
                cylinder(d=20, h=0.2);

                translate([-width/2 + 30/2, 0, 0])
                cylinder(d=20, h=0.2);

                hull() {
                    translate([
                        -width/2 + 30/2 + 20, -17, 0
                    ])
                    cylinder(d=10, h=0.2, $fn=20);

                    translate([
                        width/2 - 30/2 - 20, -17, 0
                    ])
                    cylinder(d=10, h=0.2, $fn=20);
                }

                hull() {
                    translate([
                        width/2 - 30/2 + 4, -wall/2, 0
                    ])
                    cylinder(d=10, h=0.2, $fn=20);

                    translate([
                        width/2 - 30/2 - 20, -17, 0
                    ])
                    cylinder(d=10, h=0.2, $fn=20);
                }

                hull() {
                    translate([
                        -width/2 + 30/2 - 4, -wall/2, 0
                    ])
                    cylinder(d=10, h=0.2, $fn=20);

                    translate([
                        -width/2 + 30/2 + 20, -17, 0
                    ])
                    cylinder(d=10, h=0.2, $fn=20);
                }
            }
        }

        if (snap) {
            if (height > 20) {
                translate([-width/2 + 30/2 + 2, 0, 20])
                mirror([1, 0, 0])
                _snap_hole();

                translate([width/2 - 30/2 - 2, 0, 20])
                _snap_hole();
            }

            if (height > 200) {
                translate([
                    -width/2 + 30/2 + 2, 0, height/2
                ])
                mirror([1, 0, 0])
                _snap_hole();

                translate([
                    width/2 - 30/2 - 2, 0, height/2
                ])
                _snap_hole();
            }

            if (height > 60) {
                translate([
                    -width/2 + 30/2 + 2, 0, height - 20
                ])
                mirror([1, 0, 0])
                _snap_hole();

                translate([
                    width/2 - 30/2 - 2, 0, height - 20
                ])
                _snap_hole();
            }
        }
    }
}

module front_cover_end(
    width, height, brim=true, snap=false
) {
    wall = 1.6;

    union() {
        difference() {
            _front_cover(
                width, height - 20, brim=brim, snap=snap
            );

            translate([0, -20, height])
            rotate([-30, 0, 0])
            cube([400, 30, 60], center=true);

            translate([-width/2 + 31, 0, height - 10])
            rotate([0, 45, 0])
            translate([-30/2, 0, 0])
            cube([30, 50, 60], center=true);

            translate([width/2 - 31, 0, height - 10])
            rotate([0, -45, 0])
            translate([30/2, 0, 0])
            cube([30, 50, 60], center=true);
            
            hull() {
                translate([
                    -width/2 + 28, 0, height - 13
                ])
                rotate([0, 45, 0])
                translate([-30/2, -30/2 - 1.4, 0])
                cube([30, 30, 60], center=true);

                translate([
                    -width/2 + 48.5, -17,
                    height - 13
                ])
                rotate([0, 45, 0])
                translate([-30/2, -50/2 - 1.4, 0])
                cube([30, 50, 60], center=true);
            }

            hull() {
                translate([width/2 - 28, 0, height - 13])
                rotate([0, -45, 0])
                translate([30/2, -30/2 - 1.4, 0])
                cube([30, 30, 60], center=true);

                translate([
                    width/2 - 48.5, -17,
                    height - 13
                ])
                rotate([0, -45, 0])
                translate([30/2, -50/2 - 1.4, 0])
                cube([30, 50, 60], center=true);
            }

            if (!snap) {
                translate([
                    0, 30/2 + 0.1, (height - 50)/2 + 9
                ])
                chamfered_cube(
                    width * 2, 30, height - 50,
                    6, center=true
                );
            }

            translate([0, 10/2 + 0.1, height])
            cube([width, 10, 56], center=true);
        }

        difference() {
            union() {
                hull() {
                    translate([
                        width/2 - 30/2 - 20, -17.01,
                        height - 25.95
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        -width/2 + 30/2 + 20, -17.01,
                        height - 25.95
                    ])
                    sphere(d=wall, $fn=100);

                    translate([
                        width/2 - 42, -wall/2,
                        height
                    ])
                    sphere(d=wall, $fn=100);

                    translate([
                        -width/2 + 42, -wall/2,
                        height
                    ])
                    sphere(d=wall, $fn=100);
                }

                hull() {
                    translate([
                        width/2 - 30/2 - 20, -17.01,
                        height - 25.95
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        width/2 - 42, - wall/2,
                        height
                    ])
                    sphere(d=wall, $fn=100);

                    translate([
                        width/2 - 30/2 + 4, 0 - wall/2,
                        height - 30.42
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        width/2 - 30/2 - 1, -6,
                        height - 31.75
                    ])
                    sphere(d=wall, $fn=60);
                }

                hull() {
                    translate([
                        width/2 - 30/2 + 4, 0 - wall/2,
                        height - 30.42
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        width/2 - 30/2 + 4, 0 - wall/2,
                        height - 33.5
                    ])
                    sphere(d=wall, $fn=60);
                }

                mirror([1, 0, 0])
                hull() {
                    translate([
                        width/2 - 30/2 - 20, -17.01,
                        height - 25.95
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        width/2 - 42, - wall/2,
                        height
                    ])
                    sphere(d=wall, $fn=100);

                    translate([
                        width/2 - 30/2 + 4, 0 - wall/2,
                        height - 30.42
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        width/2 - 30/2 - 1, -6,
                        height - 31.75
                    ])
                    sphere(d=wall, $fn=60);
                    
                }

                mirror([1, 0, 0])
                hull() {
                    translate([
                        width/2 - 30/2 + 4, 0 - wall/2,
                        height - 30.42
                    ])
                    sphere(d=wall, $fn=60);

                    translate([
                        width/2 - 30/2 + 4, 0 - wall/2,
                        height - 33.5
                    ])
                    sphere(d=wall, $fn=60);
                }
            }

            translate([0, 0, height  + 10/2])
            cube([400, 10, 10], center=true);

            translate([0, 0, - 10/2])
            cube([400, 100, 10], center=true);

        }
    }
}

module front_cover_grill(
    width, height, grills=10, grill_z_pos=0,
    supports=false, brim=true
) {
    grill_d = 10;
    grill_w = width - 90;

    difference() {
        union() {
            _front_cover(
                width, height, brim=brim, snap=true
            );

            intersection() {
                translate([0, 3, 21 + grill_z_pos])
                rotate([135, 0, 0])
                for (i = [0 : grills - 1]) {
                    translate([
                        0, i*(grill_d/2), -i*(grill_d/2)
                    ])
                    hull() {
                        translate([-grill_w/2, 0, 0])
                        cylinder(
                            d=grill_d, h=30, $fn=30
                        );

                        translate([grill_w/2, 0, 0])
                        cylinder(
                            d=grill_d, h=30, $fn=30
                        );
                    }
                }

                translate([0, -17.1 - 20/2, height/2])
                cube([width, 20, height], center=true);
            }
        }

        translate([0, 3, 21 + grill_z_pos])
        difference() {
            rotate([135, 0, 0])
            for (i = [0 : grills - 1]) {
                translate([
                    0, i*(grill_d/2), -i*(grill_d/2)
                ])
                difference() {
                    hull() {
                        translate([-grill_w/2, 0, 0])
                        cylinder(
                            d=grill_d - 3,
                            h=31, $fn=30
                        );

                        translate([grill_w/2, 0, 0])
                        cylinder(
                            d=grill_d - 3,
                            h=31, $fn=30
                        );
                    }
                    translate([0, -grill_d/2, grill_d/2])
                    hull() {
                        translate([-grill_w/2, 0, 0])
                        cylinder(
                            d=grill_d, h=30, $fn=30
                        );

                        translate([grill_w/2, 0, 0])
                        cylinder(
                            d=grill_d, h=30, $fn=30
                        );
                    }
                }
            }
            translate([-30, -17, height/2 - 23])
            cube([1.2, 20, height], center=true);

            translate([30, -17, height/2 - 23])
            cube([1.2, 20, height], center=true);

            translate([0, 0, -21 - grill_z_pos])
            cylinder(d=1000, h=1);
        }
    }

    if (supports) {
        translate([0, -17 - 3.8, (2.3 + grill_z_pos)/2])
        cube([
            grill_w, 0.5, 2.3 + grill_z_pos
        ], center=true);

        translate([0, -17 - 4.33, grill_z_pos + 1])
        rotate([30, 0, 0])
        cube([grill_w, 0.5, 2], center=true);
        
        translate([0, -17 - 5, grill_z_pos + 6.65])
        rotate([135, 0, 0])
        for (i = [0 : grills - 2]) {
            translate([
                0, i*(grill_d/2), -i*(grill_d/2)
            ])
            rotate([19, 0, 0])
            cube([grill_w, 0.5, 5.7], center=true);
        }

        translate([0, -17 - 5.3, grill_z_pos + 2.6])
        rotate([135, 0, 0])
        for (i = [0 : grills - 2]) {
            translate([
                0, i*(grill_d/2), -i*(grill_d/2)
            ])
            rotate([75, 0, 0])
            cube([grill_w, 0.5, 4], center=true);
        }
    }
}

module front_cover_buttons(width, height, brim=true) {

    b_pos = height - 40;

    difference() {
        union() {
            front_cover_end(
                width, height, brim=brim
            );

            // front lip
            intersection() {
                translate([0, -17 + 7, b_pos + 10])
                rotate([40, 0, 0])
                chamfered_cube_side(
                    width - 70, 25, 15, 10, center=true
                );

                translate([0, -16.7 - 20/2, b_pos])
                cube([width, 20, 50], center=true);

            }

            // inside beam
            difference() {
                translate([0, -17, b_pos])
                chamfered_cube(
                    width, 10, 20, 4, center=true
                );

                translate([0, -17 - 10/2 + 0.2, b_pos])
                cube([width, 10, 25], center=true);

                translate([width/2 - 20, -17 - 8, b_pos])
                rotate([0, 0, 35])
                cube([50, 30, 25], center=true);

                translate([
                    -width/2 + 20, -17 - 8, b_pos
                ])
                rotate([0, 0, -35])
                cube([50, 30, 25], center=true);
            }

            // button bodies
            translate([-10, -17, b_pos])
            rotate([90, 0, 0])
            cylinder(d1=15, d2=12, h=3, $fn=30);

            translate([-35, -17, b_pos])
            rotate([90, 0, 0])
            cylinder(d1=15, d2=12, h=3, $fn=30);

            translate([-10, -17 + 5, b_pos])
            rotate([90, 0, 0])
            cylinder(d=14, h=6, $fn=30);

            translate([-35, -17 + 5, b_pos])
            rotate([90, 0, 0])
            cylinder(d=14, h=6, $fn=30);

            // screw bodies
            hull() {
                translate([60, -11, b_pos])
                cube([11, 10, 10], center=true);

                translate([60, -17, b_pos - 15])
                cube([4, 0.1, 1], center=true);
            }

            hull() {
                translate([-60, -11, b_pos])
                cube([11, 10, 10], center=true);

                translate([-60, -17, b_pos - 15])
                cube([4, 0.1, 1], center=true);
            }

            hull() {
                translate([3, -11, b_pos])
                cube([11, 10, 10], center=true);

                translate([3, -17, b_pos - 15])
                cube([4, 0.1, 1], center=true);
            }
        }

        // bottom
        translate([0, 0, -20/2])
        cube([1000, 100, 20], center=true);
        
        // led holes
        translate([20, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=8.3, h=25, $fn=20);

        translate([20, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=10.6, h=16, $fn=20);
        
        translate([40, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=8.3, h=25, $fn=20);

        translate([40, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=10.6, h=16, $fn=20);

        // button holes
        translate([-10, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=10, h=25, $fn=40);

        translate([-35, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=10, h=25, $fn=40);

        translate([-10, -17 + 5, b_pos])
        cube([3, 10, 15], center=true);

        translate([-35, -17 + 5, b_pos])
        cube([3, 10, 15], center=true);

        // button mount grooves
        translate([-20 - 5/2, -17 + 14, b_pos - 2])
        rotate([0, 0, 45])
        cube([2, 2, 25], center=true);

        translate([-20 + 5/2, -17 + 14, b_pos - 2])
        rotate([0, 0, 45])
        cube([2, 2, 25], center=true);

        translate([-45 - 5/2, -17 + 14, b_pos - 2])
        rotate([0, 0, 45])
        cube([2, 2, 25], center=true);

        translate([-45 + 5/2, -17 + 14, b_pos - 2])
        rotate([0, 0, 45])
        cube([2, 2, 25], center=true);

        // led mount grooves
        translate([30 - 5/2, -17 + 8, b_pos + 3])
        rotate([0, 0, 45])
        cube([2, 2, 15], center=true);

        translate([30 + 5/2, -17 + 8, b_pos + 3])
        rotate([0, 0, 45])
        cube([2, 2, 15], center=true);

        // screw & nut holes
        translate([60, -16, b_pos])
        rotate([-90, 0, 0])
        cylinder(d=3.3, h=15, $fn=20);

        translate([-60, -16, b_pos])
        rotate([-90, 0, 0])
        cylinder(d=3.3, h=15, $fn=20);

        translate([3, -16, b_pos])
        rotate([-90, 0, 0])
        cylinder(d=3.3, h=15, $fn=20);

        translate([60, -11, b_pos + 2])
        cube([6, 2, 10], center=true);

        translate([-60, -11, b_pos + 2])
        cube([6, 2, 10], center=true);

        translate([3, -11, b_pos + 2])
        cube([6, 2, 10], center=true);

    }

    %translate([-38, 5, b_pos - 15.5])
    rotate([0, -90, 180]) {
        mechanical_endstop();

        translate([5, 3, 0])
        cylinder(d=2, h=25, center=true, $fn=20);

        translate([15, 3, 0])
        cylinder(d=2, h=25, center=true, $fn=20);
    }
}

module front_cover_buttons_4_leds(
    width, height, brim=true
) {

    b_pos = height - 53;

    difference() {
        union() {
            front_cover_buttons(
                width, height, brim=brim
            );

            // second led row lip
            intersection() {
                translate([30, -17 + 7, b_pos + 10])
                rotate([40, 0, 0])
                chamfered_cube_side(
                    55, 25, 15, 10, center=true
                );

                translate([0, -16.7 - 20/2, b_pos])
                cube([width, 20, 50], center=true);
            }

            // second led row inside beam
            difference() {
                translate([30, -17, b_pos])
                chamfered_cube(
                    40, 10, 20, 4, center=true
                );

                translate([0, -17 - 10/2 + 0.2, b_pos])
                cube([width, 10, 25], center=true);
            }

        }

        // led holes
        translate([20, 0, b_pos + 13])
        rotate([90, 0, 0])
        cylinder(d=8.6, h=25, $fn=20);

        translate([20, 0, b_pos + 13])
        rotate([90, 0, 0])
        cylinder(d=10.6, h=16, $fn=20);
        
        translate([40, 0, b_pos + 13])
        rotate([90, 0, 0])
        cylinder(d=8.6, h=25, $fn=20);

        translate([40, 0, b_pos + 13])
        rotate([90, 0, 0])
        cylinder(d=10.6, h=16, $fn=20);

        translate([20, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=8, h=25, $fn=20);

        translate([20, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=10.3, h=16, $fn=20);
        
        translate([40, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=8, h=25, $fn=20);

        translate([40, 0, b_pos])
        rotate([90, 0, 0])
        cylinder(d=10.3, h=16, $fn=20);

        // led mount grooves
        translate([30 - 5/2, -17 + 8, b_pos + 3])
        rotate([0, 0, 45])
        cube([2, 2, 15], center=true);

        translate([30 + 5/2, -17 + 8, b_pos + 3])
        rotate([0, 0, 45])
        cube([2, 2, 15], center=true);

        // chamfer
        translate([30, 0, 0])
        rotate([45, 0, 0])
        cube([10, 22.9, 22.9], center=true);
    }
}

module front_cover_buttons_mount() {
    difference() {
        union() {
            chamfered_cube_side(
                132, 12, 12.4, 2, center=true
            );

            translate([3, 0, 0])
            chamfered_cube_side(
                22, 15, 12.4, 2, center=true
            );

            translate([-22.5, -4.5, 0])
            chamfered_cube_side(
                42, 25, 12.4, 2, center=true
            );

            translate([30, -2, 3.6/2])
            chamfered_cube_side(
                 38, 16, 16, 4, center=true
            );

            translate([20, 0, 3.6/2])
            cylinder(d=15, h=16, center=true);
            
            translate([40, 0, 3.6/2])
            cylinder(d=15, h=16, center=true);
        }

        // switch holes
        translate([-35, -5.4, 5.4])
        cube([7.1, 20.4, 20], center=true);

        translate([-35, -6, 0])
        cube([7.1, 19.4, 20], center=true);

        translate([-10, -5.4, 5.4])
        cube([7.1, 20.4, 20], center=true);

        translate([-10, -6, 0])
        cube([7.1, 19.4, 20], center=true);

        // switch mount holes
        translate([-47, -10.5, -1.8])
        rotate([0, 90, 0])
        cylinder(d=2.2, h=10, $fn=20);

        translate([-10, -10.5, -1.8])
        rotate([0, 90, 0])
        cylinder(d=2.2, h=10, $fn=20);

        translate([-22.5, -10.5, -1.8])
        rotate([0, 90, 0])
        cylinder(d=1.9, h=20, center=true, $fn=20);

        // led holes
        translate([20, 0, 12.4/2 - 0.2])
        cylinder(d=10.2, h=5, $fn=40);

        translate([40, 0, 12.4/2 - 0.2])
        cylinder(d=10.2, h=5, $fn=40);

        translate([20, 15/2 - 2.5, 0])
        cube([3, 15, 20], center=true);

        translate([40, 15/2 - 2.5, 0])
        cube([3, 15, 20], center=true);

        // mount holes
        translate([3, 0, 10/2 + 2.2])
        cylinder(d=3.3, h=10, center=true, $fn=20);

        translate([3, 0, -10/2 + 2])
        cylinder(d=7, h=10, center=true, $fn=20);
        
        translate([-60, 0, 10/2 + 2.2])
        cylinder(d=3.3, h=10, center=true, $fn=20);

        translate([-60, 0, -10/2 + 2])
        cylinder(d=7, h=10, center=true, $fn=20);

        translate([60, 0, 10/2 + 2.2])
        cylinder(d=3.3, h=10, center=true, $fn=20);

        translate([60, 0, -10/2 + 2])
        cylinder(d=7, h=10, center=true, $fn=20);

    }
}

module front_cover_buttons_mount_4_leds() {
    difference() {
        union() {
            front_cover_buttons_mount();

            translate([30, -12.5, 3.6/2])
            chamfered_cube_side(
                 38, 14, 16, 4, center=true
            );

            translate([20, -13, 3.6/2])
            cylinder(d=15, h=16, center=true);
            
            translate([40, -13, 3.6/2])
            cylinder(d=15, h=16, center=true);            
        }

        // led holes
        translate([20, - 13, 12.4/2 - 0.2])
        cylinder(d=10.2, h=5, $fn=40);

        translate([40, - 13, 12.4/2 - 0.2])
        cylinder(d=10.2, h=5, $fn=40);

        translate([20, -15/2 + 2.5 - 13, 0])
        cube([3, 15, 20], center=true);

        translate([40, -15/2 + 2.5 - 13, 0])
        cube([3, 15, 20], center=true);
    }
}

module cover_button() {
    union() {
        intersection() {
            sphere(d=21, $fn=60);

            translate([0, 0, 3])
            cylinder(d=9.7, h=8, $fn=40);
        }
        cylinder(d=9.7, h=8, $fn=40);

        translate([0, 0, 5/2])
        cube([2.8, 13.8, 5], center=true);
    }
}

module cover_lens_5mm_led() {
    difference() {
        union() {
            cylinder(d=7.9, h=12.4, $fn=30);

            cylinder(d=10, h=10, $fn=30);
        }

        translate([0, 0, -0.2])
        hull() {
            cylinder(d=5.1, h=7.5, $fn=30);

            cylinder(d=1, h=9.8, $fn=30);
        }

        translate([0, 0, -0.2])
        hull() {
            cylinder(d=6, h=1.5, $fn=30);

            cylinder(d=5.1, h=2, $fn=30);
        }
    }
}

module front_cover_plate_240() {
    front_cover_grill(240, 172, 23, 10, supports=true);

    translate([0, 12, 0])
    rotate([0, 0, 180])
    front_cover_grill(240, 173, 23, 1, supports=true);

    translate([-240/2 + 15 - 2.6, 6, 83])
    cube([1, 4, 2], center=true);

    translate([240/2 - 15 + 2.6, 6, 83])
    cube([1, 4, 2], center=true);

    translate([-240/2 + 15 - 2.6, 6, 163])
    cube([1, 4, 2], center=true);

    translate([240/2 - 15 + 2.6, 6, 163])
    cube([1, 4, 2], center=true);
}

module front_cover_plate_240_top() {
    front_cover_grill(240, 175, 24, 5.8, supports=true);

    translate([0, 12, 0])
    rotate([0, 0, 180])
    front_cover_grill(240, 175, 21, 0, supports=true);

    translate([-240/2 + 15 - 2.6, 6, 83])
    cube([1, 4, 2], center=true);

    translate([240/2 - 15 + 2.6, 6, 83])
    cube([1, 4, 2], center=true);

    translate([-240/2 + 15 - 2.6, 6, 165])
    cube([1, 4, 2], center=true);

    translate([240/2 - 15 + 2.6, 6, 165])
    cube([1, 4, 2], center=true);
}

module front_cover_plate_230_top() {
    front_cover_grill(230, 155, 22, 0, supports=true);

    translate([0, 12, 0])
    rotate([0, 0, 180])
    front_cover_grill(230, 155, 17, 0, supports=true);

    translate([-230/2 + 15 - 2.6, 6, 75])
    cube([1, 4, 2], center=true);

    translate([230/2 - 15 + 2.6, 6, 75])
    cube([1, 4, 2], center=true);

    translate([-230/2 + 15 - 2.6, 6, 145])
    cube([1, 4, 2], center=true);

    translate([230/2 - 15 + 2.6, 6, 145])
    cube([1, 4, 2], center=true);
}


module top_cover_grill_end(
    width, height, grills=10, grill_z_pos=0,
    supports=false, brim=true
) {
    union() {
        intersection() {
            front_cover_grill(
                width, height - 27, grills,
                grill_z_pos, supports=supports, brim=brim
            );

            translate([0, 0, (height - 32)/2])
            cube([width, 70, height - 32], center=true);
        }

        translate([0, 0, height - 32.1])
        front_cover_end(
            width, 32.1, brim=false, snap=true
        );
    }
}

module front_cover_snap_clip_left() {
    s_h = 8.4;

    union() {
        translate([0, 0, 15/2])
        rotate([90, 0, 0])
        long_tie_split(15);

        // adhesion extra
        translate([-(2.7 + 1.2/2)/2 + 1.4/2, 0, s_h/2])
        cube([2.5 + 1.2/2, 0.2, s_h], center=true);

        // base block
        translate([-4.6/2 + 0.6, 1/2, s_h/2])
        cube([4.6, 1, s_h], center=true);

        // arms
        translate([0, 4/2, s_h/2])
        chamfered_cube(
            1.2, 4, s_h, 0.4, center=true
        );

        translate([-3.4, 4/2, s_h/2])
        chamfered_cube(
            1.2, 4, s_h, 0.4, center=true
        );

        // claws
        translate([0 - 0.2, 4 - 1/2, s_h/2])
        chamfered_cube(
            1.6, 1.6, s_h, 0.4, center=true
        );

        translate([-3.4 + 0.2, 4 - 1/2, s_h/2])
        chamfered_cube(
            1.6, 1.6, s_h, 0.4, center=true
        );


    }
}

module front_cover_snap_clip_right() {
    mirror([1, 0, 0])
    front_cover_snap_clip_left();
}

module test_front_cover_snap_clip() {
    module _test_piece() {
        intersection() {
            translate([0, 0, -4])
            front_cover_grill(
                200, 100, 10, 4,
                supports=false, brim=false
            );

            translate([-100, 0, 17/2])
            cube([39, 30, 17], center=true);
        }
    }

    translate([80, 0, 0])
    _test_piece();

    mirror([1, 0, 0])
    translate([80, 0, 0])
    _test_piece();

    translate([-5, 7, 0])
    front_cover_snap_clip_right();

    translate([5, 7, 0])
    front_cover_snap_clip_left();
    
}