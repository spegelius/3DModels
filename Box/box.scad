//include <../lib/includes.scad>;
use <../Dollo/NEW_long_ties/include.scad>;

////// VARIABLES //////
//width = 120;
//length = 120;
//height = 80;
//wall = 1.7;

//width = 130;
//length = 130;
//height = 100;
//wall = 1.7;

width = 150;
length = 150;
height = 100;
wall = 1.8;

//width = 150;
//length = 150;
//height = 130;
//wall = 1.8;

//width = 180;
//length = 180;
//height = 120;
//wall = 1.9;

//width = 180;
//length = 180;
//height = 150;
//wall = 1.9;

//width = 200;
//length = 200;
//height = 150;
//wall = 2;

//width = 200;
//length = 200;
//height = 120;
//wall = 2;

slop = 0.3;

inner_w = width - 2*wall;
inner_l = length - 2*wall;
corner = 10;
inner_corner = 10 - 2*wall;
inner_h = height+10;

lid_outer_w = width + 2*wall + slop;
lid_outer_l = length + 2*wall + slop;
lid_inner_w = inner_w - 2*wall - slop - 0.5;
lid_inner_l = inner_l - 2*wall - slop - 0.5;
echo(lid_outer_w);

fastener_hole_x = width/2 - 5.7;
fastener_hole_l = length*0.7;
fastener_hole_y = -fastener_hole_l/2;

fastener_l = fastener_hole_l - 5.2;
fastener_wall = 1.8;

fastener_dia = 7;

slot_w = 100;

plate_w = slot_w - 3;
plate_l = 34;


////// VIEW //////
//view_proper();
//debug_box();

box();
//lid();
//fastener();
//fasteners();
//plate("Crap");


////// MODULES //////
module _bottom_pattern(h) {
    step = h*2 + 1;
    size = sqrt(h*h*2);

    intersection() {
        for(i = [0:99]) {
            translate([0, step/2 + i*step, 0])
            rotate([45, 0, 0])
            cube([500, size, size], center=true);

            translate([0, -step/2 - i*step, 0])
            rotate([45, 0, 0])
            cube([500, size, size], center=true);
        }

        difference() {
            rounded_cube_side(
                lid_inner_w, lid_inner_l, h*2,
                inner_corner, center=true, $fn=40
            );

            translate([-width/2, 0, 0])
            cube(
                [22, fastener_hole_l + 4, h*2],
                center=true
            );

            translate([width/2, 0, 0])
            cube(
                [22, fastener_hole_l + 4, h*2],
                center=true
            );
        }
    }
}

module main_body() {
    
    module form(w, d, l, h) {
        
        module subform() {
            rotate([90, 0, 0]) {
                hull() {
                    translate([1, 0, 0])
                    cylinder(
                        d=d, h=l, center=true, $fn=40
                    );

                    translate([-d, d/2 - 0.5, 0])
                    cube([1, 2*d, l], center=true);

                    translate([0, -d/2 - 0.5, 0])
                    cube([d, 1, l], center=true);
                }
                hull() {
                    translate([1, 0, 4])
                    sphere(d=d + 3, $f=50);

                    translate([1, 0, -4])
                    sphere(d=d + 3, $f=50);
                }
            }
        }
        
        translate([-w/2, 0, 0])
        subform();

        translate([w/2, 0, 0])
        mirror([1, 0, 0])
        subform();
    }
    
    difference() {
        // outer
        difference() {
            intersection() {
                translate([0, 0, height/2])
                rounded_cube_side(
                    width, length, height,
                    corner, center=true, $fn=60
                );

                // chamfers
                hull() {
                    for(i = [0:3]) {
                        rotate([0, 0, i*90])
                        translate([
                            width/2 - corner/2,
                            length/2 - corner/2,
                            0
                        ])
                        chamfered_cylinder(
                            corner, height + 0.8, 1.2, $fn=60
                        );
                    }
                }
            }

            // fastener cuts
            form(width, 12, fastener_l + 2);
        }

        // inner cut
        difference() {
            translate([0, 0, 1.6 + inner_h/2])
            rounded_cube(
                inner_w, inner_l, inner_h,
                inner_corner, center=true, $fn=60
            );

            form(
                inner_w, 12 + 2*wall,
                fastener_l + 2 + 2*wall
            );
        }

        // inner chamfer
        hull() {
            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([
                    inner_w/2 - inner_corner/2,
                    inner_l/2 - inner_corner/2,
                    height - 0.4
                ])
                chamfered_cylinder(
                    inner_corner + 2.4, 10, 1.2, $fn=60
                );
            }
        }
        
        w = width - 20;
        l = length - 10;
        
        _bottom_pattern(0.8);
    }
}

//main_body();

// plate slot
module slot() {

    difference() {
        union() {
            difference() {
                intersection () {
                    translate([0, 0, 38/2])
                    rounded_cube_side(
                        slot_w, 6.4, 38,
                        5, center=true, $fn=30
                    );

                    translate([0, 10, 26.45])
                    rotate([-45, 0, 0])
                    cube([width, 50, 50], center=true);
                }
                translate([0, 0, 40/2])
                rounded_cube_side(
                    slot_w - 2.4, 6.4 - 2.4,
                    40, 5 - 2.4, center=true, $fn=30
                );
            }
            translate([0, 0, 1.94])
            rotate([-45, 0, 0])
            cube([
                slot_w - 2.3, 6.7, 1.2
            ], center=true);
        }
        translate([0, 6, 0])
        cube([width, 10, 100], center=true);

        cube([slot_w - 14, 20, 100], center=true);
    }
}

//slot();

module fastener_slot() {
    w = fastener_dia;

    difference() {
        union() {
            difference() {
                // main form
                hull() {
                    rotate([0, 90, 0])
                    cylinder(d=w, h=7.4, $fn=30);

                    cube([7.4, w/2, w/2]);

                    translate([7.4/2, 0, -4/2 - 1/2 - 1])
                    cube([7.4, w, 1], center=true);

                    translate([
                        7.4/2, w/2 - 0.1/2,
                        -4/2 - 1/2 - 12
                    ])
                    cube([7.4, 0.1, 0.1], center=true);
                }

                // hole
                hull() {
                    translate([2.4, 1, -1])
                    rotate([0, 90, 0])
                    cylinder(d=w - 1.5, h=7.4, $fn=30);

                    translate([
                        (7.4 - 1.5)/2 + 2.4, 1, -3/2 - 13
                    ])
                    cube([
                        7.4 - 1.5, w - 1, 1
                    ], center=true);
                }
            }
            // stopper
            translate([1.5, -w/2 + 2.4/2, -2.8])
            rotate([0, 90, 0])
            cylinder(d=2.4, h=7.4 - 1.5, $fn=30);
        }

        // chamfer
        translate([2.4, -4, -6.5])
        union() {
            rotate([0, 45, 0])
            cube([4, 4, 8]);

            translate([0, 0, -4])
            cube([2, 4, 4]);
        }
    }
}

//!fastener_slot();

module _pattern_cube(chamfer) {
    hull() {
        cube([11.3, 11.3, 11.3 - 2*chamfer], center=true);
        cube(
            [11.3 - 2*chamfer, 11.3 - 2*chamfer, 11.3],
            center=true
        );
    }
}

module _side_pattern() {
    count = 20;
    step = 22;
    echo(step);

    translate([-step*10, -220, 0])
    for(i = [0:count - 1]) {
        for(j = [0:2*count - 1]) {
            translate([
                i * step + j%2 * step/2,
                j*11,
                -11.3/2 + wall/2 - 1
            ])
            _pattern_cube(wall - 1);

            translate([
                i * step - step/2 + j%2 * step/2,
                j*11,
                11.3/2 - wall/2 + 1
            ])
            _pattern_cube(wall - 1);
        }
    }
}

module _side_pattern_cut() {
    rotate([90, 0, 0])
    intersection() {
        rotate([0, 0, 45])
        _side_pattern();

        union() {
            translate([0, 0, 20/2])
            chamfered_cube(
                width - width/11,
                height - height/12, 20, 6, center=true
            );

            translate([0, 0, -20/2])
            chamfered_cube(
                width - width/11,
                height - height/12, 20, 6, center=true
            );

//            chamfered_cube_side(
//                width - width/11 - 10,
//                height - height/12 - 10,
//                20, 3, center=true
//            );
        }
    }
}

module box() {
    
    fastener_x_offset = 
        width/2 + fastener_dia/2 - 0.01;
    
    slot_pos = height > 78 ? 30 : height - 48;

    render()
    union() {
        difference() {
            main_body();

            difference() {
                for(i = [0:1]) {
                    rotate([0, 0, i*180 + 90])
                    translate([
                        0, -length/2 + wall/2, height/2
                    ])
                    _side_pattern_cut();
                }

//                translate([
//                    0, -fastener_hole_l/2 + 3,
//                    height - 15.5
//                ])
//                chamfered_cube(
//                    width, 18, 27, 3, center=true
//                );

                translate([
                    width/2 - wall/2,
                    -fastener_hole_l/2 + 3,
                    height - 15.5
                ])
                chamfered_cube(
                    wall, 18, 27, wall/2.01, center=true
                );

                translate([
                    width/2 - wall/2,
                    fastener_hole_l/2 - 3,
                    height - 15.5
                ])
                chamfered_cube(
                    wall, 18, 27, wall/2.01, center=true
                );

                translate([
                    -width/2 + wall/2,
                    -fastener_hole_l/2 + 3,
                    height - 15.5
                ])
                chamfered_cube(
                    wall, 18, 27, wall/2.01, center=true
                );

                translate([
                    -width/2 + wall/2,
                    fastener_hole_l/2 - 3,
                    height - 15.5
                ])
                chamfered_cube(
                    wall, 18, 27, wall/2.01, center=true
                );
 
                chamfered_cube(
                    width, fastener_hole_l + 7,
                    27, 3, center=true
                );
            }

            difference() {
                for(i = [0:1]) {
                    rotate([0, 0, i*180])
                    translate([
                        0, -length/2 + wall/2, height/2
                    ])
                    _side_pattern_cut();
                }

                translate([
                    -46.5, -length/2 + wall/2,
                    slot_pos + 43/2 - 2.5
                ])
                chamfered_cube(
                    13, wall, 43, wall/2.01, center=true
                );

                translate([
                    46.5, -length/2 + wall/2,
                    slot_pos + 43/2 - 2.5
                ])
                chamfered_cube(
                    13, wall, 43, wall/2.01, center=true
                );
            }
        }

        translate([0, -length/2, slot_pos])
        slot();

        translate([
            fastener_x_offset,
            -fastener_hole_l/2 - 0.3, height - 10
        ])
        rotate([0, 0, 90])
        fastener_slot();

        mirror([0, 1, 0])
        translate([
            fastener_x_offset,
            -fastener_hole_l/2 - 0.3, height - 10
        ])
        rotate([0, 0, 90])
        fastener_slot();

        mirror([1, 0, 0])
        translate([
            fastener_x_offset,
            -fastener_hole_l/2 - 0.3, height - 10
        ])
        rotate([0, 0, 90])
        fastener_slot();

        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([
            fastener_x_offset,
            -fastener_hole_l/2 - 0.3, height - 10
        ])
        rotate([0, 0, 90])
        fastener_slot();
    }
}

module lid() {
    od = 10 + 2*wall + 0.2;

    union() {
        difference() {
            intersection() {
                translate([0, 0, 6/2])
                rounded_cube_side(
                    lid_outer_w, lid_outer_l, 6,
                    10 + 2*wall + 0.2, center=true,
                    $fn=40
                );

                hull() {
                    for(i = [0:3]) {
                        rotate([0, 0, i*90])
                        translate([
                            lid_outer_w/2 - od/2,
                            lid_outer_l/2 - od/2,
                            0
                        ])
                        chamfered_cylinder(
                            od, 20, 1.2, $fn=40
                        );
                    }
                }
            }

            translate([0, 0, 3 + 5/2])
            rounded_cube_side(
                width, length, 5,
                10, center=true, $fn=40
            );

            // fastener slots
            translate([
                fastener_hole_x,
                0, -0.6
            ])
            rotate([-90, 0, 0])
            cylinder(
                d=3, h=fastener_hole_l - 1.4,
                center=true, $fn=30
            );

            translate([
                -fastener_hole_x,
                0, -0.6
            ])
            rotate([-90, 0, 0])
            cylinder(
                d=3, h=fastener_hole_l - 1.4,
                center=true,  $fn=30
            );

            // box groove
            difference() {
                translate([0, 0, 2 + 10/2])
                hull() {
                    rounded_cube_side(
                        width + 2*slop, length + slop, 10,
                        corner + 2*slop, center=true, $fn=40
                    );

                    translate([0, 0, 5])
                    rounded_cube_side(
                        width + 2 + 2*slop,
                        length + 2 + 2*slop, 10,
                        corner + 1 + 2*slop,
                        center=true, $fn=40
                    );
                }

                hull() {
                    translate([0, 0, 0.1/2 + 1])
                    rounded_cube_side(
                        inner_w - slop,
                        inner_l - slop, 0.1,
                        inner_corner - slop,
                        center=true, $fn=40
                    );

                    translate([0, 0, 6])
                    rounded_cube_side(
                        inner_w - 2 - slop,
                        inner_l - 2 - slop, 11,
                        inner_corner - 1 - slop,
                        center=true, $fn=40
                    );
                }
            }
            
            l = (lid_inner_l - fastener_l)/2;
            y = (lid_inner_l/2 - l);

            center_corner =
                inner_corner - 2*wall;

            // center cut
            intersection() {
                if (center_corner >= 0.5) {
                    translate([0, 0, 3/2 + 1.2])
                    rounded_cube_side(
                        lid_inner_w - 1, lid_inner_l - 1,
                        3, center_corner, center=true,
                        $fn=40
                    );
                } else {
                    translate([0, 0, 3/2 + 1.2])
                    cube([
                        lid_inner_w - 1, lid_inner_l - 1, 3
                    ], center=true);
                }

                translate([
                    -(50*11)/2 + 5, -(41*12)/1.3 + 0.4, 0
                ])
                for(j = [0:40]) {
                    translate([0, j*12, 0])
                    rotate([0, 0, -60])
                    for (i = [0:49]) {
                        translate([0, i*12, 0])
                        cylinder(
                            d=12, h=60,
                            center=true, $fn=6
                        );
                    }
                }
            }

            //translate([0, y, 2/2 - 0.01]) 
            //cube([lid_inner_w, l, 2], center=true);
            //#translate([0, -y, 2/2 - 0.01])
            //cube([lid_inner_w, l, 2], center=true);

            _bottom_pattern(0.7);
            
        }
        translate([
            width/2 - 2*wall - 4/2, 0, 0.8 + 1/2
        ])
        cube([4, length*0.7 + 2, 1], center=true);

        translate([
            -(width/2 - 2*wall - 4/2), 0, 0.8 + 1/2
        ])
        cube([4, length*0.7 + 2, 1], center=true);
    }
}

module fastener(){
    difference() {
        union() {
            cylinder(
                d=fastener_dia - 2,
                h=fastener_l, $fn=30
            );

            translate([0, 0, 10/2])
            cube([
                fastener_wall, fastener_dia/2 + 2,
                fastener_l - 10
            ]);

//            translate([0, fastener_dia/2 + 1.9, 0])
//            cube([fastener_wall, 6.8, fastener_l]);

            hull() {
                translate([0, fastener_dia/2 + 4.8, 0])
                cube([fastener_wall, 3, fastener_l]);

                translate([0, fastener_dia/2 + 1.6, 10/2])
                cube([fastener_wall, 1, fastener_l - 10]);
            }


            difference() {
                translate([-3.5, 12.5, 0])
                cylinder(d=11, h=fastener_l, $fn=40);

                translate([
                    -10, (fastener_dia - 1)/2, -1
                ])
                cube([10, 9.4, fastener_l + 2]);

                translate([-10, (fastener_dia - 1)/2, 0])
                cube([7, 9,fastener_l + 1]);
            }

            translate([-8, 12.7, 0])
            cylinder(d=2.1, h=fastener_l, $fn=20);

            translate([-8.9, 4.5, fastener_l/2])
            difference() {
                rotate([-90, 0, 60])
                cylinder(d=20, h=6, $fn=50);

                translate([1.7, -1.1, -30/2])
                cube([4, 10.1, 30]);

                translate([1, -2.1, -30/2])
                cube([4, 10.1, 30]);

                translate([-7, 0.8, -30/2])
                rotate([0, 0, -30])
                cube([5, 10, 30]);

                translate([-13, -10, -30/2])
                cube([15, 15, 30]);
                
                translate([-6.5, 10, 20/2 - 5/2 - 0.5])
                rotate([0, 45, -30])
                cube([5, 5, 5]);

                translate([-6.5, 10, -20/2 + 5/2 + 0.5])
                rotate([0, 45, -30])
                cube([5, 5, 5]);
            }
        }

        translate([0, 0, -1])
        cylinder(d=0.5, h=fastener_l + 2, $fn=30);

        translate([-7, 4, fastener_l/2])
        rotate([-90, 0, 60])
        cylinder(d=20 - 2*fastener_wall, h=10, $fn=50);

        translate([-3.5, 12.5, -1])
        cylinder(
            d=11 - 2*fastener_wall,
            h=fastener_l + 2, $fn=40
        );
    }
}

module fasteners(brim=true) {
    module _fasteners() {
        union() {
            translate([7, 0, 0])
            fastener();

            translate([-7, 14, 0])
            rotate([0, 0, 180])
            fastener();

            if (fastener_l > 100) {
                translate([4, -1.4, fastener_l/2])
                cube([4, 1, 1], center=true);
            }
        }
    }

    if (brim) {
        union() {
            _fasteners();

            translate([-16, -7, 0])
            rounded_cube_side(
                30, 30, 0.2, 10, $fn=30
            );
        }
    } else {
        _fasteners();
    }
}

module plate(text) {
    union() {
        translate([0, 0, 1.5/2])
        rounded_cube_side(
            plate_w, plate_l, 1.5, 5,center=true
        );

        translate([0, 0, 1.5])
        linear_extrude(1)
        text(
            size=14, text=text, halign="center",
            valign="center"
        );
    }
}

module view_proper() {
    intersection() {
        union() {
            box();
            translate([0, 0, height + wall])
            rotate([180, 0, 0])
            lid();

            translate([0, 0, height + wall])
            box();
        }
        //cube([width, length, height + 100]);
    }
    
    translate([
        width/2 + 5/2, (fastener_l)/2, height - 11
    ])
    rotate([90, 0, 0])
    fastener();

    color("white")
    translate([0, -length/2, 34 + plate_l/2])
    rotate([90, 0, 0])
    plate("Crap");
}

module debug_box() {
    render()
    intersection() {
        box();

//        translate([0, 0, 0])
//        cube([500, 500, 1000]);

        translate([0, 0, 100/2 - 60])
        cube([500, 500, 100]);
    }

//    intersection() {
//        translate([0, 0, height + 2])
//        rotate([0, 180, 0])
//        lid();
//
//        cube([500, 500, 200]);
//    }

    translate([
        width/2 + 5/2, (fastener_l)/2, height - 10.8
    ])
    rotate([90, 0, 0])
    fastener();
}
