
use <../lib/includes.scad>;
include <common.scad>;

slop = 0.15;

nozzle = 0.45;
wall = 4*nozzle;

width = 100;
length = 100;

// the one that went int the oven reservoir values
//width = 96;
//length = 96;

height = 130;

corner = 10;

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

cork_thread_dia = 40;
cork_thread_female_dia = 40+5*slop;
cork_thread_hole_dia = cork_thread_female_dia;

inner_w = width-2*wall;
inner_l = length-2*wall;

module screw_corner() {
    difference() {
        hull() {
            beweled_cylinder(d=corner, h=lid_screw_length, b=0.5, $fn=40);
            rotate([0,0,45]) translate([-corner/2+0.1, 0, -corner-lid_screw_length]) cylinder(d=0.1, h=0.1, $fn=40);
        }
        translate([0,0,-3]) cylinder(d=lid_screw_hole_dia, h=lid_screw_length+3, $fn=30);
    }
}

module reservoir() {
    
    difference() {
        union() {
            difference() {
                union() {
                    difference() {
                        rounded_cube_side(width, length, height, corner);
                        translate([wall,wall,wall]) rounded_cube(inner_w, inner_l, height+10, corner-2*wall);
                        hull() {
                            translate([wall,wall,height-0.5]) {
                                rounded_cube_side(inner_w, inner_l, height+10, corner-2*wall);
                            }
                            translate([0,0,height+0.5]) {
                                rounded_cube_side(width, length, height, corner);
                            }
                        }
                    }
                    translate([corner/2, corner/2,height-10]) screw_corner();
                    translate([width-corner/2, corner/2,height-10]) rotate([0,0,90]) screw_corner();
                    translate([width-corner/2, length-corner/2,height-10]) rotate([0,0,180]) screw_corner();
                    translate([corner/2, length-corner/2,height-10]) rotate([0,0,270]) screw_corner();
                }
            }
            // side hole additions
            translate([passthrough_thread_dia/2+10,-1/2,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) cylinder(d=wire_pass_thread_dia+8, h=wall+1, $fn=40);
            translate([width/2-5,-1/2,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) cylinder(d=passthrough_thread_dia+8, h=wall+1, $fn=40);
            translate([width-passthrough_thread_dia/2-15,-1/2,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) cylinder(d=passthrough_thread_dia+8, h=wall+1, $fn=40);
        }
        // side holes
        translate([passthrough_thread_dia/2+10,-1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) cylinder(d=wire_pass_thread_dia, h=wall+2, $fn=40);
        translate([width/2-5,-1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) cylinder(d=passthrough_thread_dia, h=wall+2, $fn=40);
        translate([width-passthrough_thread_dia/2-15,-1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) cylinder(d=passthrough_thread_dia, h=wall+2, $fn=40);
        
        translate([passthrough_thread_dia/2+10,-1.1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) donut(wire_pass_thread_dia+3,2);
        translate([passthrough_thread_dia/2+10,wall+1.1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) donut(wire_pass_thread_dia+3,2);
        
        translate([width/2-5,-1.1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) donut(passthrough_thread_dia+3,2);
        translate([width/2-5,wall+1.1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) donut(passthrough_thread_dia+3,2);
        
        translate([width-passthrough_thread_dia/2-15,-1.1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) donut(passthrough_thread_dia+3,2);
        translate([width-passthrough_thread_dia/2-15,wall+1.1,height-passthrough_thread_dia/2-10]) rotate([-90,0,0]) donut(passthrough_thread_dia+3,2);
    }
}

module lid() {
    difference() {
        rounded_cube_side(lid_width, lid_length, lid_height, lid_corner);
        difference() {
            translate([lid_gap_offset,lid_gap_offset,5]) rounded_cube_side(lid_gap_width, lid_gap_length,lid_height, lid_gap_corner);
            difference() {
                translate([lid_inner_offset,lid_inner_offset,0]) rounded_cube_side(lid_inner_width, lid_inner_length,lid_height, lid_inner_corner);
                translate([lid_corner/2, lid_corner/2, 2]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
                translate([lid_width-lid_corner/2, lid_corner/2, 2]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
                translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 2]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
                translate([lid_corner/2, lid_length-lid_corner/2, 2]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
            }
        }
        difference() {
            translate([lid_center_offset,lid_center_offset,2]) rounded_cube_side(lid_center_width, lid_center_length,lid_height, lid_center_corner);
            translate([lid_corner/2, lid_corner/2, 2]) cylinder(d=lid_corner, h=lid_height, $fn=30);
            translate([lid_width-lid_corner/2, lid_corner/2, 2]) cylinder(d=lid_corner, h=lid_height, $fn=30);
            translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 2]) cylinder(d=lid_corner, h=lid_height, $fn=30);
            translate([lid_corner/2, lid_length-lid_corner/2, 2]) cylinder(d=lid_corner, h=lid_height, $fn=30);
            translate([lid_width/2, lid_length/2,0]) cylinder(d=48, h=lid_height, $fn=50);
        }
        
        translate([lid_corner/2, lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        
        translate([lid_width/2, lid_length/2,0]) threads(d=cork_thread_female_dia, h=10, z_step=2.5, depth=0.7, direction=0);
    }
}

module cork() {
    
    h = 15;
    
    indents = 70;
    angle = 360/indents;
    
    difference() {
        rounded_cylinder(50, h, 3);
        for (i=[0:indents]) {
            rotate([0,0,i*angle]) translate([50/2,0,h/2]) rotate([0,0,45]) cube([1,1,h], center=true); 
        }
        cube([50, 5, 10], center=true);
        cube([5, 50, 10], center=true);
    }
    translate([0,0,h]) difference() {
        threads(d=cork_thread_dia, h=lid_height+2, z_step=2.5, depth=0.7, direction=0);
        cylinder(d=cork_thread_dia-10,h=lid_height+2, $fn=40);
    }
        
}

module gasket() {
    
    difference() {
        translate([lid_gap_offset,lid_gap_offset,0]) rounded_cube_side(lid_gap_width, lid_gap_length,4, lid_gap_corner);
        difference() {
            translate([lid_inner_offset,lid_inner_offset,0]) rounded_cube_side(lid_inner_width, lid_inner_length,lid_height, lid_inner_corner);
            translate([lid_corner/2, lid_corner/2, 0]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
            translate([lid_width-lid_corner/2, lid_corner/2, 0]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
            translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
            translate([lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=corner+2*gasket_wall, h=lid_height, $fn=30);
        }
        difference() {
            difference() {
                translate([wall+gasket_wall,wall+gasket_wall,1]) rounded_cube_side(width, length,lid_height, corner);
                translate([2*wall+gasket_wall,2*wall+gasket_wall,1]) rounded_cube_side(inner_w, inner_l,lid_height, corner-2*wall);
            }
            hull() {
                translate([2*wall+gasket_wall,2*wall+gasket_wall,1]) {
                    rounded_cube_side(inner_w, inner_l, 0.5, corner-2*wall);
                }
                translate([wall+gasket_wall,wall+gasket_wall,0]) {
                    rounded_cube_side(width, length, 0.5, corner);
                }
            }
        }
        
        translate([lid_corner/2, lid_corner/2, 1]) beweled_cylinder(d=corner, h=lid_height, b=0.5, $fn=30);
        translate([lid_width-lid_corner/2, lid_corner/2, 1]) beweled_cylinder(d=corner, h=lid_height, b=0.5, $fn=30);
        translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 1]) beweled_cylinder(d=corner, h=lid_height, b=0.5, $fn=30);
        translate([lid_corner/2, lid_length-lid_corner/2, 1]) beweled_cylinder(d=corner, h=lid_height, b=0.5, $fn=30);

        translate([lid_corner/2, lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
    }
}

module ring_gasket_passthrough() {
    translate([0,0,1]) intersection() {
        translate([0,0,0.45/2]) cube([passthrough_thread_dia+10,passthrough_thread_dia+10,0.45], center=true);
        translate([0,0,-0.55]) donut(passthrough_thread_dia+3,2);
    }
    difference() {
        cylinder(d=passthrough_thread_dia+8, h=1, $fn=50);
        cylinder(d=passthrough_thread_dia-0.5, h=2, $fn=50);
    }
    
}

module ring_gasket_wire() {
    translate([0,0,1]) intersection() {
        translate([0,0,0.45/2]) cube([wire_pass_thread_dia+10,passthrough_thread_dia+10,0.45], center=true);
        translate([0,0,-0.55]) donut(wire_pass_thread_dia+3,2);
    }
    difference() {
        cylinder(d=wire_pass_thread_dia+8, h=1, $fn=50);
        cylinder(d=wire_pass_thread_dia-0.5, h=1, $fn=50);
    }
    
}

module cork_gasket() {
    translate([0,0,1]) intersection() {
        translate([0,0,0.45/2]) cube([cork_thread_hole_dia+10,cork_thread_hole_dia+10,0.45], center=true);
        union() {
            translate([0,0,-0.55]) donut(cork_thread_hole_dia+1.5,2);
            translate([0,0,-0.55]) donut(cork_thread_hole_dia+5.5,2);
        }
    }
    difference() {
        cylinder(d=cork_thread_dia+10, h=1, $fn=50);
        cylinder(d=cork_thread_dia-1, h=1, $fn=50);
    }
    
}

module washer_passthrough(){
    difference() {
        cylinder(d=passthrough_thread_dia+8, h=2);
        cylinder(d=passthrough_thread_dia, h=2);
    }
}

module washer_wire_pass(){
    difference() {
        cylinder(d=wire_pass_thread_dia+8, h=2);
        cylinder(d=wire_pass_thread_dia, h=2);
    }
}

module bottomvoir() {
    b_width = width + 15;
    b_length = length + 15;
    b_height = 15;
    
    difference() {
        rounded_cube_side(b_width, b_length, b_height, corner);
        translate([wall,wall,1]) rounded_cube(b_width-2*wall, b_length-2*wall, b_height+corner, corner-2*wall);
    }
    
    in_width = width + 2*wall+4*slop;
    in_length = length + 2*wall+4*slop;
    
    translate([15/2-wall-2*slop,15/2-wall-2*slop,0.4]) difference() {
        rounded_cube_side(in_width, in_length, 3, corner+2*wall);
        translate([wall,wall,wall]) rounded_cube(in_width-2*wall, in_length-2*wall, 3, corner);
    }

}

module test_res() {
    translate([0,0,-height+10]) intersection() {
        reservoir();
        translate([0,0,height-10]) cube([20,20,10]);
    }
}

module test_lid() {
    
    intersection() {
        lid();
        cube([20,20,10]);
    }
}

module test_gasket() {
    intersection() {
        translate([-wall, -wall, 0]) gasket();
        cube([20,20,10]);
    }
}

module test_cork() {
    translate([0,0,-10]) intersection() {
        cork();
        translate([0,0,50/2+10]) cube([50,50,50], center=true);
    }
    translate([50,0,0]) intersection() {
        cylinder(d=45,h=10);
        translate([-lid_width/2, -lid_length/2,0]) lid();
    }
}

module test_cup() {
    difference() {
        rounded_cube_side(40, 40, 40, corner);
        translate([wall,wall,wall]) rounded_cube(40-2*wall, 40-2*wall, 40+10, corner-2*wall);
    }
}

module test_cup_vase() {
    vase_wall = nozzle;
    difference() {
        rounded_cube_side(40, 40, 40, corner);
        //translate([vase_wall,vase_wall,vase_wall]) rounded_cube(40-2*wall, 40-2*wall, 40+10, corner-2*wall);
    }
}

//test_res();
//test_lid();
//test_gasket();
//test_cork();
//test_cup();
//test_cup_vase();

translate([-70,0,0]) %mock_pump();
//reservoir();
//lid();
//cork();
//gasket();
//ring_gasket_passthrough();
//ring_gasket_wire();
cork_gasket();
//bottomvoir();

//washer_passthrough($fn=40);
//washer_wire_pass($fn=40);

//translate([-lid_gap_offset-gasket_wall,-lid_gap_offset-gasket_wall, height+1]) mirror([0,0,1]) color("blue") gasket();

//translate([-lid_gap_offset-gasket_wall,-lid_gap_offset-gasket_wall, height+4]) mirror([0,0,1]) color("green") lid();

// QND fixes for the box that went to the oven
//difference() {
//    scale([0.93,1,1]) ring_gasket_passthrough();
//    cylinder(d=passthrough_thread_dia, h=1);
//}
//difference() {
//    scale([0.93,1,1]) ring_gasket_wire();
//    cylinder(d=wire_pass_thread_dia, h=1);
//}
//difference() {
//    scale([0.93,1,1]) washer_passthrough();
//    cylinder(d=passthrough_thread_dia, h=3);
//}
//difference() {
//   scale([0.93,1,1]) washer_wire_pass();
//    cylinder(d=wire_pass_thread_dia, h=3);
//}