
use <../lib/includes.scad>;
include <common.scad>;

slop = 0.15;

nozzle = 0.45;
wall = 4*nozzle;

width = 100;
height = 130;
length = 100;

corner = 10;

gasket_wall = nozzle*2;

lid_width = width + 2 * (wall + gasket_wall);
lid_length = length + 2 * (wall + gasket_wall);
lid_height = 7;
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
cork_thread_hole_dia = 40+5*slop;

module screw_corner() {
    difference() {
        hull() {
            cylinder(d=corner, h=lid_screw_length, $fn=40);
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
                        translate([wall,wall,wall]) rounded_cube(width-2*wall, length-2*wall, height+10, corner-2*wall);
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
            translate([lid_gap_offset,lid_gap_offset,3]) rounded_cube_side(lid_gap_width, lid_gap_length,lid_height, lid_gap_corner);
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
        
        translate([lid_width/2, lid_length/2,0]) threads(d=cork_thread_hole_dia, h=10, z_step=2.5, depth=0.7, direction=0);
    }
}

module cork() {
    indents = 70;
    angle = 360/indents;
    difference() {
        rounded_cylinder(50, 10, 3);
        for (i=[0:indents]) {
            rotate([0,0,i*angle]) translate([50/2,0,10/2]) rotate([0,0,45]) cube([1,1,10], center=true); 
        }
    }
    translate([0,0,10]) difference() {
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
            translate([wall+gasket_wall,wall+gasket_wall,1]) rounded_cube_side(width, length,lid_height, corner);
            translate([2*wall+gasket_wall,2*wall+gasket_wall,1]) rounded_cube_side(width-2*wall, length-2*wall,lid_height, corner-2*wall);
        }
        
        translate([lid_corner/2, lid_corner/2, 1]) cylinder(d=corner, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_corner/2, 1]) cylinder(d=corner, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 1]) cylinder(d=corner, h=lid_height, $fn=30);
        translate([lid_corner/2, lid_length-lid_corner/2, 1]) cylinder(d=corner, h=lid_height, $fn=30);

        translate([lid_corner/2, lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_width-lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
        translate([lid_corner/2, lid_length-lid_corner/2, 0]) cylinder(d=lid_screw_dia, h=lid_height, $fn=30);
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

//test_res();
//test_lid();
//test_gasket();
//test_cork();
//test_cup();

translate([-70,0,0]) %mock_pump();
//reservoir();
//lid();
//cork();
gasket();

//translate([-lid_gap_offset-gasket_wall,-lid_gap_offset-gasket_wall, height+1]) mirror([0,0,1]) color("blue") gasket();

//translate([-lid_gap_offset-gasket_wall,-lid_gap_offset-gasket_wall, height+4]) mirror([0,0,1]) color("green") lid();