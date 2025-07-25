
use <../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;
use <adapters.scad>;


////// VARIABLES //////
slop = 0.15;

nozzle = 0.45;
wall = 2;

// Res 1
width = 100;
length = 100;
height = 130;
screws_x = 2;
screws_y = 2;

// Res 2
//width = 95;
//length = 150;
//height = 130;
//screws_x = 2;
//screws_y = 3;

// Res 3 big
//width = 140;
//length = 200;
//height = 140;
//screws_x = 3;
//screws_y = 3;

// for faster viewing. Turn on for final render
render_thread = true;


gasket_wall = nozzle * 3;

chamfer = 0.3;

passthrough_h1 = height -
    passthrough_thread_dia/2 - 15;
passthrough_h2 = height -
    passthrough_thread_dia/2 - 15;
passthrough_h3 = height -
    passthrough_thread_dia/2 - 15;

passthrough_x1 = 
    passthrough_thread_dia/2 + 10;
passthrough_x2 = width/2 - 1;
passthrough_x3 = 
    width - passthrough_thread_dia/2 - 10;

lid_height = 9;

lid_screw_dia = 4;
lid_screw_length = 15;
lid_screw_hole_dia = lid_screw_dia - 1;
lid_screw_hole_l = 
    lid_screw_length - lid_height + 4;
lid_screw_corner_h = 
    height - lid_screw_hole_l;

screw_corner_d = lid_screw_dia + 5;

corner = 10;

lid_edge = 2 * wall + 5;
lid_width = width + lid_edge;
lid_length = length + lid_edge;

lid_corner = corner + lid_edge;

lid_inner_width = width - 2*wall;
lid_inner_length = length - 2*wall;
lid_inner_corner = corner - 2*wall;

cork_thread_dia = 40;
cork_thread_female_dia = 
    cork_thread_dia + 4*slop;
cork_thread_hole_dia =
    cork_thread_female_dia;

inner_w = width - 2*wall;
inner_l = length - 2*wall;

////// VIEW //////
//debug();
//debug_g1_2();
//debug_ring_gaskets();
//debug_gasket();
//debug_Eheim_1250_790();

// Test models
//test_res();
//test_lid();
//test_gasket();
//test_cork();
//test_cup();
//test_cup_vase();

////// PRINT //////
//reservoir();
//lid();
//gasket();
//cork();
//ring_gasket_passthrough();
//gasket_passthrough();
//ring_gasket_passthrough_g1_2();
//gasket_passthrough_g1_2();
//ring_gasket_wire();
//cork_gasket();
//reservoir_wire_passthrough_adapter();
//reservoir_wire_passthrough_nut();
reservoir_wire_passthrough_nut(brim=true);
//bottomvoir();

//washer_passthrough($fn=40);
//washer_wire_pass($fn=40);

//washer_gasket_passthrough();

// Oldies
//old_gasket();

// fix parts
//reservoir_fix_g1_2();


////// MODULES //////
module debug() {
    intersection() {
        reservoir();

        translate([10, -10, 0])
        cube([width + 20, length + 20, height + 20]);
    }

    translate([50, 50, wall])
    %mock_pump_Eheim_1000_new();
}

module debug_g1_2() {
    intersection() {
        reservoir_g1_2();

        translate([50, -10, 0])
        cube([width + 20, length + 20, height + 20]);
    }

    translate([50, 50, wall])
    %mock_pump_Eheim_1000_new();

    translate([passthrough_x2, -8, passthrough_h2])
    rotate([-90, 0, 0])
    adapter_g1_2_g1_4(threads=false);

    translate([
        passthrough_x2, -0.7 + 3.2 + 1,
        passthrough_h2
    ])
    rotate([90, 0, 0])
    ring_gasket_passthrough_g1_2();

    translate([
        passthrough_x2, -0.7,
        passthrough_h2
    ])
    rotate([90, 0, 0])
    gasket_passthrough_g1_2();
}

module debug_ring_gaskets() {
    intersection() {
        reservoir();

//        translate([49, -10, 0])
//        cube([width + 20, length + 20, height + 20]);

        translate([18.2, -10, 0])
        cube([width + 20, length + 20, height + 20]);
    }

    translate([
        passthrough_x2, -0.7 + 3.2 + 1,
        passthrough_h2
    ])
    rotate([90, 0, 0])
    ring_gasket_passthrough();

    translate([
        passthrough_x1, -0.7 + 3.2 + 1,
        passthrough_h1
    ])
    rotate([90, 0, 0])
    ring_gasket_wire();
}

module debug_gasket() {

    color("blue")
    intersection() {
        translate([0, 0, height + 3/2 + 0.1])
        mirror([0, 0, 1])
        gasket();

        translate([-10, -10, 0])
        cube([width + 20, 21, height + 20]);
    }

    color("green")
    intersection() {
        translate([
            0, 0, height + lid_height + 0.6
        ])
        mirror([0, 0, 1])
        lid();

        translate([-10, -10, 0])
        cube([width + 20, 20, height + 20]);
    }

    render()
    intersection() {
        reservoir();

        translate([-10, -10, 0])
        cube([width +20, 20, height + 20]);
    }
}

module debug_Eheim_1250_790() {
    %translate([45, 10, 46])
    rotate([-90, -90, 0])
    mock_pump_Eheim_1250_790();
    
    intersection() {
        render(convexity=10)
        reservoir();

        translate([-20, -length/2, 0])
        cube([width*2, length, height]);
    }
    
    %translate([
        passthrough_x2, 0, passthrough_h2
    ])
    rotate([-90, 0, 0])
    cylinder(d=12, h=60, $fn=30);
}

module _screw_corner() {

    difference() {
        hull() {
            translate([0, 0, -1])
            chamfered_cylinder(
                screw_corner_d,
                lid_screw_hole_l + 1,
                chamfer, $fn=40
            );

            rotate([0, 0, 45]) {
                translate([
                    -5 - screw_corner_d/2 + 0.1/2,
                    0, -8 - screw_corner_d
                ])
                cylinder(
                    d=1, h=0.1, $fn=40
                );

                translate([
                    -5 - screw_corner_d/2 + 0.1/2,
                    0, lid_screw_hole_l/2
                ])
                cube([
                    0.1, screw_corner_d + 3,
                    lid_screw_hole_l
                ], center=true);
            }
        }
    }
}

module _reservoir_body() {

    difference() {
        union() {
            rounded_cube_side(
                width, length, height,
                corner, $fn=40
            );

            // lid top edge
            translate([
                0, 0, height - lid_edge/1.5 - 2
            ])
            hull() {
                rounded_cube_side(
                    width, length, 1,
                    corner, $fn=40
                );

                translate([
                    -lid_edge/2,
                    -lid_edge/2,
                    lid_edge/1.5
                ])
                rounded_cube_side(
                    lid_width, lid_length,
                    2, lid_corner, $fn=40
                );
            }
        }
    }
}

module _lid_hole_positions() {

    translate([-2, -2, 0])
    rotate([0, 0, 180])
    children();
    
    translate([width + 2, -2, 0])
    rotate([0, 0, 270])
    children();
    
    translate([width + 2, length + 2, 0])
    children();

    translate([-2, length + 2, 0])
    rotate([0, 0, 90])
    children();
    
    if (screws_x > 2) {
        part = width / (screws_x - 1);
        for(i = [1:screws_x-2]) {
            translate([part*i, -5, 0])
            rotate([0, 0, 45 + 180])
            children();

            translate([
                part*i, length + 5, 0
            ])
            rotate([0, 0, 45])
            children();
        }
    }
    if (screws_y > 2) {
        part = length / (screws_y - 1);
        for(i = [1:screws_y - 2]) {
            translate([-5, part*i, 0])
            rotate([0, 0, 135])
            children();

            translate([
                width + 5, part*i, 0
            ])
            rotate([0, 0, -45])
            children();
        }
    }
}

module reservoir(pt_grooves=true) {
    
    difference() {
        union() {
            difference() {
                union() {
                    _reservoir_body();

                    // corner studs
                    _lid_hole_positions()
                    translate([
                        0, 0,
                        lid_screw_corner_h
                    ])
                    _screw_corner();
                }

                // inside removed
                translate([wall, wall, wall])
                rounded_cube(
                    inner_w, inner_l, height + 10,
                    corner - 2*wall, $fn=30
                );

                // bolt holes
                _lid_hole_positions()
                translate([
                    0, 0, lid_screw_corner_h
                ])
                cylinder(
                    d=lid_screw_hole_dia,
                    h=lid_screw_hole_l, $fn=30
                );
            }
            // side hole additions
            hull() {
                translate([
                    passthrough_x1, -0.7,
                    passthrough_h1
                ])
                rotate([-90, 0, 0])
                cylinder(
                    d=wire_pass_thread_dia + 11,
                    h=3.2, $fn=40
                );

                translate([
                    passthrough_x2, -0.7,
                    passthrough_h2
                ])
                rotate([-90, 0, 0])
                cylinder(
                    d=passthrough_thread_dia + 11,
                    h=3.2, $fn=40
                );

                translate([
                    passthrough_x3, -0.7,
                    passthrough_h3
                ])
                rotate([-90, 0, 0])
                cylinder(
                    d=passthrough_thread_dia + 11,
                    h=3.2, $fn=40
                );
            }
        }

        // side holes
        translate([
            passthrough_x1, -0.8,
            passthrough_h1
        ])
        rotate([-90, 0, 0])
        cylinder(
            d=wire_pass_thread_dia + 3,
            h=4.2, $fn=50
        );

        translate([
            passthrough_x2, -0.8, passthrough_h2
        ])
        rotate([-90, 0, 0])
        cylinder(
            d=passthrough_thread_dia + 3,
            h=4.2, $fn=40
        );

        translate([
            passthrough_x3, -0.8, passthrough_h3
        ])
        rotate([-90, 0, 0])
        cylinder(
            d=passthrough_thread_dia + 3,
            h=4.2, $fn=40
        );

        // passthrough gasket grooves
        if (pt_grooves) {
            translate([
                passthrough_x1, -1.4, passthrough_h1
            ])
            rotate([-90, 0, 0])
            donut(
                wire_pass_thread_dia + 6,
                2, $fn=50
            );

            translate([
                passthrough_x1, 3.2,
                passthrough_h1
            ])
            rotate([-90, 0, 0])
            donut(
                wire_pass_thread_dia + 6,
                2, $fn=50
            );
            
            translate([
                passthrough_x2, -1.4,
                passthrough_h2
            ])
            rotate([-90, 0, 0])
            donut(
                passthrough_thread_dia + 6,
                2, $fn=50
            );

            translate([
                passthrough_x2, 3.2,
                passthrough_h2
            ])
            rotate([-90, 0, 0])
            donut(
                passthrough_thread_dia + 6,
                2, $fn=50
            );

            translate([
                passthrough_x3, -1.4, passthrough_h3
            ])
            rotate([-90, 0, 0])
            donut(
                passthrough_thread_dia + 6,
                2, $fn=50
            );

            translate([
                passthrough_x3, 3.2,
                passthrough_h3
            ])
            rotate([-90, 0, 0])
            donut(
                passthrough_thread_dia + 6,
                2, $fn=50
            );
        }

        // gasket groove
        translate([0, 0, height - 3/2])
        _gasket(0.1);
    }
}

module reservoir_g1_2() {
    difference() {
        union() {
            reservoir(pt_grooves=false);
        }

        translate([
            passthrough_x2, -0.8, passthrough_h2
        ])
        rotate([-90, 0, 0])
        cylinder(
            d=21 + 2,
            h=wall + 2, $fn=40
        );

        translate([
            passthrough_x3, -0.8, passthrough_h3
        ])
        rotate([-90, 0, 0])
        cylinder(
            d=21 + 2,
            h=wall + 2, $fn=40
        );
    }
}

module lid() {
    difference() {
        union() {
            translate([
                -lid_edge/2, -lid_edge/2, 0
            ])
            hull() {
                translate([0, 0, lid_height - 2])
                rounded_cube_side(
                    lid_width, lid_length, 2,
                    lid_corner, $fn=30
                );

                translate([
                    (lid_height - 2)/2,
                    (lid_height - 2)/2,
                ])
                rounded_cube_side(
                    lid_width - (lid_height - 2),
                    lid_length - (lid_height - 2),
                    0.1, lid_corner - 2, $fn=30
                );
            }

            _lid_hole_positions()
            intersection() {
                scale([1, 1, 2])
                _screw_corner();

                cylinder(d=100, h=lid_height);
            }
        }

        translate([0, 0, lid_height - 3/2 + 0.4])
        _gasket(0.1);

        // inner block to remove
        difference() {
            translate([wall, wall, wall])
            rounded_cube_side(
                lid_inner_width, lid_inner_length,
                height, lid_inner_corner, $fn=30
            );

            // cork hole body
            translate([width/2, length/2, 0])
            cylinder(
                d=cork_thread_female_dia + 2.2,
                h=lid_height, $fn=50
            );

            // pressure equalization g1/4 thread body
            translate([15, 15, 0])
            cylinder(d=18, h=lid_height, $fn=40);

            // stripes
            for(i = [0:width/5]) {
                translate([i*30, 0, 0])
                rotate([0, 0, 45])
                cube([
                    1.4, 2*height,
                    lid_height + 1
                ]);

                translate([-2*height + i*30, 0, 0])
                rotate([0, 0, -45])
                cube([
                    1.4, 2*height,
                    lid_height + 1
                ]);
            }
        }

        // screw holes
        _lid_hole_positions()
        cylinder(
            d=lid_screw_dia, h=lid_height, $fn=30
        );

        // cork hole
        translate([width/2, length/2, 0]) {
            if(render_thread) {
                v_screw(
                    h=lid_height + 2,
                    screw_d=cork_thread_female_dia,
                    pitch=4,
                    direction=0,
                    steps=100
                );
            } else {
                cylinder(
                    d=cork_thread_female_dia,
                    h=lid_height + 2
                );
            }
        }

        // pressure equalization g1/4 thread
        translate([15, 15, -1])
        g1_4_thread(lid_height + 5, slop=0.25);

        translate([15, 15, -0.1])
        cylinder(d1=13.5, d2=11.5, h=1, $fn=60);
    }
}

module cork() {
    
    h = 15;
    
    indents = 70;
    angle = 360/indents;

    difference() {
        union() {
            difference() {
                rounded_cylinder(50, h, 3, $fn=50);

                for (i = [0:indents]) {
                    rotate([0, 0, i*angle])

                    translate([50/2, 0, h/2])
                    rotate([0, 0, 45])
                    cube([1, 1, h], center=true); 
                }

                hull() {
                    cube([50, 5, 9], center=true);
                    cube([50, 0.2, 14], center=true);
                }

                hull() {
                    cube([5, 50, 9], center=true);
                    cube([0.2, 50, 14], center=true);
                }
                
                #translate([0, 0, h + 1.6])
                rotate([0, 180, 0])
                cork_gasket();
            }

            translate([0, 0, h]) {
                if (render_thread) {
                    v_screw(
                        h=lid_height + 2,
                        screw_d=cork_thread_dia,
                        pitch=4,
                        direction=0,
                        steps=100
                    );
                } else {
                    cylinder(
                        d=cork_thread_dia,
                        h=lid_height + 2, $fn=50
                    );
                }

                cylinder(
                    d=cork_thread_dia - 0.1,
                    h=1.2, $fn=150
                );
            }
        }
        translate([0, 0, h - 4])
        cylinder(d=cork_thread_dia - 8, h=h, $fn=40);
    }
}

module _gasket(extra=0) {
    h = 4;

    e0 = 5.3 + extra;
    e1 = 5 + extra;
    e2 = 4 + extra;

    module _inner_chamfer() {
        hull() {
            translate([extra/2, extra/2, 0])
            rounded_cube_side(
                width - extra, length - extra, h,
                corner - extra, $fn=50
            );

            translate([extra/2 - 1, extra/2 - 1, 1])
            rounded_cube_side(
                width - extra + 2,
                length - extra + 2, 1,
                corner - extra + 2, $fn=50
            );
        }
    }
    
    difference() {
        hull() {
            translate([-e1/2, -e1/2, 1/2])
            rounded_cube_side(
                width + e1, length + e1, h - 1,
                corner + e1, $fn=50
            );

            translate([-e2/2, -e2/2, 0])
            rounded_cube_side(
                width + e2, length + e2, h,
                corner + e2, $fn=50
            );

            translate([-e0/2, -e0/2, h/2 - 1.2/2])
            rounded_cube_side(
                width + e0, length + e0, 1.2,
                corner + e0, $fn=50
            );
        }

        // hole
        translate([extra/2, extra/2, -1])
        rounded_cube_side(
            width - extra, length - extra, h*2,
            corner - extra, $fn=50
        );

        translate([0, 0, h - 1/2])
        _inner_chamfer();

        translate([0, 0, -h + 1/2])
        _inner_chamfer();
    }
}

module gasket() {
    _gasket();
}

module ring_gasket_passthrough() {

    difference() {
        union() {
            intersection() {
                cylinder(d=100, h=2);

                translate([0, 0, 0.35])
                donut(
                    passthrough_thread_dia + 6,
                    2, $fn=50
                );
            }

            cylinder(
                d=passthrough_thread_dia + 8,
                h=1, $fn=50
            );

            cylinder(
                d=passthrough_thread_dia + 3,
                h=2.6, $fn=50
            );
        }

        cylinder(
            d=passthrough_thread_dia - 0.1,
            h=30, center=true, $fn=50
        );
    }
}

module ring_gasket_passthrough_g1_2() {

    difference() {
        union() {

            cylinder(
                d=30,
                h=1, $fn=50
            );

            cylinder(
                d=21 + 1.8,
                h=4.4, $fn=50
            );
        }

        translate([0, 0, -0.1])
        g1_2_thread(
            5, slop=0.4
        );
    }
}

module gasket_passthrough_g1_2() {

    difference() {

        cylinder(
            d=30,
            h=1, $fn=50
        );

        cylinder(
            d=21.2,
            h=5, center=true, $fn=50
        );
    }
}

module ring_gasket_wire() {

    difference() {
        union() {
            intersection() {
                cylinder(d=100, h=2);

                translate([0, 0, 0.35])
                donut(
                    wire_pass_thread_dia + 6,
                    2, $fn=50
                );
            }

            cylinder(
                d=wire_pass_thread_dia + 9,
                h=1, $fn=50
            );

            cylinder(
                d=wire_pass_thread_dia + 3,
                h=2.6, $fn=50
            );
        }

        cylinder(
            d=wire_pass_thread_dia - 0.1,
            h=30, center=true, $fn=50
        );
    }
}

module ring_gasket_passthrough_old() {
    translate([0, 0, 1])
    intersection() {
        translate([0, 0, 0.45/2])
        cube([
            passthrough_thread_dia + 10,
            passthrough_thread_dia + 10, 0.45
        ], center=true);

        translate([0, 0, -0.55])
        donut(passthrough_thread_dia + 5, 2, $fn=50);
    }
    difference() {
        cylinder(d=passthrough_thread_dia + 8, h=1, $fn=50);
        cylinder(d=passthrough_thread_dia-0.5, h=2, $fn=50);
    }
}

module ring_gasket_wire_old() {
    translate([0, 0, 1])
    intersection() {
        translate([0, 0, 0.45/2])
        cube([
            wire_pass_thread_dia + 10,
            passthrough_thread_dia + 10, 0.45
        ], center=true);

        translate([0, 0, -0.55])
        donut(wire_pass_thread_dia + 5, 2, $fn=50);
    }
    difference() {
        cylinder(d=wire_pass_thread_dia + 8, h=1, $fn=50);
        cylinder(d=wire_pass_thread_dia - 0.5, h=1, $fn=50);
    }
}

module cork_gasket() {
    translate([0, 0, 2])
    intersection() {
        translate([0, 0, 0.95/2])
        cube([
            cork_thread_hole_dia + 10,
            cork_thread_hole_dia + 10, 0.95
        ], center=true);

        union() {
            translate([0, 0, -0.55])
            donut(
                cork_thread_hole_dia + 2,
                2, $fn=150
            );

            translate([0, 0, -0.55])
            donut(
                cork_thread_hole_dia + 6,
                2, $fn=150
            );
        }
    }

    difference() {
        cylinder(
            d=cork_thread_dia + 10,
            h=2, $fn=150
        );

        translate([0, 0, -1])
        v_screw(
            h=5,
            screw_d=cork_thread_female_dia,
            pitch=4,
            direction=0,
            steps=100
        );
    }
}

module washer_passthrough() {
    difference() {
        cylinder(
            d=passthrough_thread_dia + 8,
            h=1.8, $fn=50
        );
        cylinder(
            d=passthrough_thread_dia + 0.2,
            h=10, center=true, $fn=50
        );
    }
}

module washer_gasket_passthrough() {
    difference() {
        union() {
            cylinder(
                d=passthrough_thread_dia + 8,
                h=3, $fn=50
            );

            translate([0, 0, 3])
            donut(passthrough_thread_dia + 5, 2, $fn=50);
        }

        cylinder(
            d=passthrough_thread_dia + 0.2,
            h=10, center=true, $fn=50
        );
    }
}

module washer_wire_pass(){
    difference() {
        cylinder(
            d=wire_pass_thread_dia + 8,
            h=1.8, $fn=50
        );
        cylinder(
            d=wire_pass_thread_dia + 0.2,
            h=10, center=true, $fn=50
        );
    }
}

module reservoir_wire_passthrough_adapter() {
    difference() {
        union() {
            cylinder(
                d1=17,
                d2=15,
                h=2, $fn=50
            );

            cylinder(
                d=14.7,
                h=7, $fn=50
            );
        }

        translate([0, 0, -0.1])
        m12_thread_wire_passthrough(
            8, slop=0.3
        );
    }
}

module reservoir_wire_passthrough_nut(brim=false) {
    difference() {
        union() {
            cylinder(d=19.4, h=6, $fn=6);

            hull() {
                translate([0, 0, 4])
                cylinder(d=19.4, h=2, $fn=6);

                translate([0, 0, 6])
                cylinder(d=20.5, h=1, $fn=40);
            }

            translate([0, 0, 7])
            donut(wire_pass_thread_dia + 5, 2, $fn=50);

            if (brim) {
                translate([-0.25, -0.2, 0])
                cylinder(d=22, h=0.2, $fn=40);
            }
        }

        translate([0, 0, -0.1])
        m12_thread_wire_passthrough(
            9, slop=0.3
        );
    }
}

module bottomvoir() {
    b_width = width + 15;
    b_length = length + 15;
    b_height = 15;
    
    difference() {
        rounded_cube_side(
            b_width, b_length, b_height,
            corner, $fn=30
        );

        translate([wall, wall, 1])
        rounded_cube(
            b_width - 2*wall,
            b_length - 2*wall,
            b_height + corner,
            corner - 2*wall, $fn=30
        );
    }
    
    in_width = width + 2*wall + 4*slop;
    in_length = length + 2*wall + 4*slop;
    
    translate([
        15/2 - wall - 2*slop,
        15/2 - wall - 2*slop, 0.4
    ])
    difference() {
        rounded_cube_side(
            in_width, in_length, 3,
            corner + 2*wall, $fn=30
        );
        translate([wall, wall, wall])
        rounded_cube(
            in_width - 2*wall,
            in_length - 2*wall,
            3, corner, $fn=30
        );
    }
}

module old_gasket() {
    width = 100;
    length = 100;

    // the one that went int the oven reservoir values
    //width = 96;
    //length = 96;

    gasket_wall = nozzle*2;

    lid_width = width + 2 * (wall + gasket_wall);
    lid_length = length + 2 * (wall + gasket_wall);
    lid_height = 9;
    lid_corner = corner + 2 * (wall + gasket_wall);

    lid_gap_offset = wall;
    lid_gap_width = width + 2 * gasket_wall;
    lid_gap_length = length + 2 * gasket_wall;
    lid_gap_corner = corner + 2 * gasket_wall;

    lid_inner_offset = lid_gap_offset + wall + 2 * gasket_wall;
    lid_inner_width = lid_gap_width - 2*wall - 4*gasket_wall;
    lid_inner_length = lid_gap_length - 2*wall - 4*gasket_wall;
    lid_inner_corner = lid_gap_corner - 2*wall - 4*gasket_wall;

    lid_center_offset = lid_inner_offset + wall;
    lid_center_width = lid_inner_width - 2*wall;
    lid_center_length = lid_inner_length - 2*wall;
    lid_center_corner = lid_inner_corner - 2*wall;

    lid_screw_dia = 4;
    lid_screw_length = 10;
    lid_screw_hole_dia = lid_screw_dia - 1;

    inner_w = width-2*wall;
    inner_l = length-2*wall;

    difference() {
        translate(
            [lid_gap_offset, lid_gap_offset, 0])
        rounded_cube_side(
            lid_gap_width, lid_gap_length,
            4, lid_gap_corner);

        difference() {
            translate(
                [lid_inner_offset,
                 lid_inner_offset, -1])
            rounded_cube_side(
                lid_inner_width, lid_inner_length,
                lid_height + 1, lid_inner_corner);

            translate(
                [lid_corner/2, lid_corner/2, -1])
            cylinder(
                d=corner + 2*gasket_wall,
                h=lid_height + 1, $fn=30);

            translate(
                [lid_width - lid_corner/2,
                 lid_corner/2, -1])
            cylinder(
                d=corner + 2*gasket_wall,
                h=lid_height + 1, $fn=30);

            translate(
                [lid_width - lid_corner/2,
                 lid_length - lid_corner/2, -1])
            cylinder(
                d=corner + 2*gasket_wall,
                h=lid_height + 1, $fn=30);

            translate(
                [lid_corner/2,
                 lid_length - lid_corner/2, -1]) 
            cylinder(
                d=corner + 2*gasket_wall,
                h=lid_height + 1, $fn=30);
        }
        difference() {
            difference() {
                translate(
                    [wall + gasket_wall,
                     wall + gasket_wall, 2])
                rounded_cube_side(
                    width, length, lid_height,
                    corner, $fn=30);

                translate(
                    [2*wall + gasket_wall,
                     2*wall + gasket_wall, 2])
                rounded_cube_side(
                    inner_w, inner_l,
                    lid_height, corner - 2*wall,
                    $fn=30);
            }
            hull() {
                translate(
                    [2*wall + gasket_wall,
                     2*wall + gasket_wall, 2])
                rounded_cube_side(
                    inner_w, inner_l, 0.5,
                    corner - 2*wall, $fn=30);

                translate(
                    [wall + gasket_wall,
                     wall + gasket_wall, 1])
                rounded_cube_side(
                    width, length, 0.5,
                    corner, $fn=30);
            }
        }
        
        translate(
            [lid_corner/2, lid_corner/2, 2])
        chamfered_cylinder(
            corner, lid_height, 0.5, $fn=30);

        translate(
            [lid_width - lid_corner/2,
             lid_corner/2, 2])
        chamfered_cylinder(
            corner, lid_height, 0.5, $fn=30);

        translate(
            [lid_width - lid_corner/2,
             lid_length - lid_corner/2, 2])    
        chamfered_cylinder(
            corner, lid_height, 0.5, $fn=30);

        translate(
            [lid_corner/2,
             lid_length - lid_corner/2, 2])  
        chamfered_cylinder(
            corner, lid_height, 0.5, $fn=30);

        translate(
            [lid_corner/2, lid_corner/2, 0])
        cylinder(
            d=lid_screw_dia, h=3*lid_height,
            center=true, $fn=30);

        translate(
            [lid_width - lid_corner/2,
             lid_corner/2, 0])
        cylinder(
            d=lid_screw_dia, h=3*lid_height,
            center=true, $fn=30);

        translate(
            [lid_width - lid_corner/2,
             lid_length - lid_corner/2, 0])
        cylinder(
            d=lid_screw_dia, h=3*lid_height,
            center=true, $fn=30);

        translate(
            [lid_corner/2,
             lid_length - lid_corner/2, 0])
        cylinder(
            d=lid_screw_dia, h=3*lid_height,
            center=true, $fn=30);
    }
}

module test_res() {
    translate([0, 0, -height + 10])
    intersection() {
        reservoir();

        translate([-4, -4, height - 10])
        rounded_cube_side(
            22, 22, 15, corner
        );
    }
}

module test_lid() {
    
    intersection() {
        translate([width, 0, 0])
        mirror([1, 0, 0])
        lid();

        translate([-4, -4, 0])
        rounded_cube_side(
            19, 19, 10, corner
        );
    }
}

module test_gasket() {
    intersection() {
        gasket();

        translate([-3, -3, 0])
        cube([20, 20, 10]);
    }
}

module test_cork() {
    translate([0, 0, -10])
    intersection() {
        cork();

        translate([0, 0, 10/2 + 10])
        cube([50, 50, 10], center=true);
    }

    translate([50, 0, 0])
    intersection() {
        cylinder(d=43, h=10);

        translate([
            -width/2, -length/2,0
        ])
        lid();
    }
}

module test_cup() {
    difference() {
        rounded_cube_side(
            40, 40, 40, corner, $fn=50
        );

        translate([wall, wall, wall])
        rounded_cube(
            40 - 2*wall, 40-2*wall, 40+10,
            corner - 2*wall, $fn=50
        );
    }
}

module test_cup_vase() {
    vase_wall = nozzle;
    difference() {
        rounded_cube_side(
            40, 40, 40, corner, $fn=50
        );
    }
}

module reservoir_fix_g1_2() {
    width = 100;
    length = 100;
    height = 130;
    screws_x = 2;
    screws_y = 2;

    intersection() {
        translate([0, 0, -height + 40])
        reservoir_g1_2();

        translate([0, 0, 100/2])
        cube([400, 400, 100], center=true);
    }
}
