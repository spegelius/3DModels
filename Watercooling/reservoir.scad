
use <../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;

////// VARIABLES //////
slop = 0.15;

nozzle = 0.45;
wall = 4*nozzle;

width = 95;
length = 150;
height = 130;

// for faster viewing. Turn on for final render
render_thread = true;

screws_x = 2;
screws_y = 3;

gasket_wall = nozzle * 3;

chamfer = 0.3;

passthrough_h1 = height - passthrough_thread_dia/2 - 15;
passthrough_h2 = height - passthrough_thread_dia/2 - 15;
passthrough_h3 = height - passthrough_thread_dia/2 - 15;

passthrough_x1 = passthrough_thread_dia/2+10;
passthrough_x2 = width/2-1;
passthrough_x3 = width-passthrough_thread_dia/2-10;

lid_height = 9;

lid_screw_dia = 4;
lid_screw_length = 15;
lid_screw_hole_dia = lid_screw_dia - 1;
lid_screw_hole_l = lid_screw_length - lid_height + 1;
lid_screw_corner_h = height - lid_screw_hole_l;

screw_corner_d = lid_screw_dia + 3.5;

corner = 10;

lid_edge = 2 * wall + 4;
lid_width = width + lid_edge;
lid_length = length + lid_edge;

lid_corner = corner + lid_edge;

lid_inner_width = width - 2*wall;
lid_inner_length = length - 2*wall;
lid_inner_corner = corner - 2*wall;

cork_thread_dia = 40;
cork_thread_female_dia = cork_thread_dia + 4*slop;
cork_thread_hole_dia = cork_thread_female_dia;

inner_w = width-2*wall;
inner_l = length-2*wall;

////// VIEW //////
//translate([-70,0,0]) %mock_pump();
//debug();
//debug_Eheim_1250_790();

// test models
//test_res();
//test_lid();
//test_gasket();
//test_cork();
//test_cup();
//test_cup_vase();

//reservoir();
//lid();
//cork();
//gasket();
//ring_gasket_passthrough();
//ring_gasket_wire();
//cork_gasket();
//bottomvoir();

//washer_passthrough($fn=40);
//washer_wire_pass($fn=40);

////// MODULES //////
module screw_corner() {

    difference() {
        hull() {
            translate([0,0,-1])
            chamfered_cylinder(screw_corner_d, lid_screw_hole_l+1,
                               chamfer,$fn=40);

            rotate([0,0,45]) {
                translate([-5-screw_corner_d/2+0.1/2,0,
                           -5-screw_corner_d])
                cylinder(d=0.1, h=0.1,$fn=40);

                translate([-5-screw_corner_d/2+0.1/2,0,lid_screw_hole_l/2])
                cube([0.1,screw_corner_d+3,lid_screw_hole_l],center=true);
            }
        }
    }
}

module _reservoir_body() {

    difference() {
        union() {
            rounded_cube_side(width,length,height,corner,$fn=30);

            translate([0,0,height-lid_edge/2-2])
            hull() {
                rounded_cube_side(width,length,1,corner,$fn=30);

                translate([-lid_edge/2,-lid_edge/2,lid_edge/2])
                rounded_cube_side(lid_width,lid_length,2,lid_corner,$fn=30);
            }
        }
    }
}

module _lid_hole_positions() {

    translate([-2,-2,0])
    rotate([0,0,180])
    children();
    
    translate([width+2,-2,0])
    rotate([0,0,270])
    children();
    
    translate([width+2,length+2,0])
    children();

    translate([-2,length+2,0])
    rotate([0,0,90])
    children();
    
    if (screws_x > 2) {
        part = width / (screws_x - 1);
        for(i = [1:screws_x-2]) {
            translate([part*i,-5,0])
            rotate([0,0,45+180])
            children();

            translate([part*i,length+5,0])
            rotate([0,0,45])
            children();
        }
    }
    if (screws_y > 2) {
        part = length / (screws_y - 1);
        for(i = [1:screws_y-2]) {
            translate([-5,part*i,0])
            rotate([0,0,135])
            children();

            translate([width+5,part*i,0])
            rotate([0,0,-45])
            children();
        }
    }
}

module reservoir() {
    
    difference() {
        union() {
            difference() {
                union() {
                    _reservoir_body();

                    // corner studs
                    _lid_hole_positions()
                    translate([0,0,lid_screw_corner_h])
                    screw_corner();
                }

                // inside removed
                translate([wall,wall,wall])
                rounded_cube(inner_w,inner_l,height+10,corner-2*wall,$fn=30);

                // bolt holes
                _lid_hole_positions()
                translate([0,0,lid_screw_corner_h])
                cylinder(d=lid_screw_hole_dia, h=lid_screw_hole_l,$fn=30);
                
            }
            // side hole additions
            translate([passthrough_x1,-1.4/2,passthrough_h1])
            rotate([-90,0,0])
            cylinder(d=wire_pass_thread_dia+10,h=wall+1.4,$fn=40);

            translate([passthrough_x2,-1.4/2,passthrough_h2])
            rotate([-90,0,0])
            cylinder(d=passthrough_thread_dia+10, h=wall+1.4, $fn=40);

            translate([passthrough_x3,-1.4/2,passthrough_h3])
            rotate([-90,0,0])
            cylinder(d=passthrough_thread_dia+10, h=wall+1.4, $fn=40);
        }

        // side holes
        translate([passthrough_x1,-1,passthrough_h1])
        rotate([-90,0,0])
        cylinder(d=wire_pass_thread_dia, h=wall+2, $fn=40);

        translate([passthrough_x2,-1,passthrough_h2])
        rotate([-90,0,0])
        cylinder(d=passthrough_thread_dia, h=wall+2, $fn=40);

        translate([passthrough_x3,-1,passthrough_h3])
        rotate([-90,0,0])
        cylinder(d=passthrough_thread_dia, h=wall+2, $fn=40);
        
        translate([passthrough_x1,-1.4,passthrough_h1])
        rotate([-90,0,0])
        donut(wire_pass_thread_dia+5,2,$fn=50);

        translate([passthrough_x1,wall+1.4,passthrough_h1])
        rotate([-90,0,0])
        donut(wire_pass_thread_dia+5,2,$fn=50);
        
        translate([passthrough_x2,-1.4,passthrough_h2])
        rotate([-90,0,0])
        donut(passthrough_thread_dia+5,2,$fn=50);

        translate([passthrough_x2,wall+1.4,passthrough_h2])
        rotate([-90,0,0])
        donut(passthrough_thread_dia+5,2,$fn=50);

        translate([passthrough_x3,-1.4,passthrough_h3])
        rotate([-90,0,0])
        donut(passthrough_thread_dia+5,2,$fn=50);

        translate([passthrough_x3,wall+1.4,passthrough_h3])
        rotate([-90,0,0])
        donut(passthrough_thread_dia+5,2,$fn=50);

        // gasket groove
        translate([0,0,height-3/2])
        gasket();
    }
}

module lid() {
    difference() {
        union() {
            translate([-lid_edge/2,-lid_edge/2,0])
            hull() {
                translate([0,0,lid_height-2])
                rounded_cube_side(lid_width, lid_length, 2,
                                  lid_corner, $fn=30);

                translate([(lid_height-2)/2,(lid_height-2)/2,])
                rounded_cube_side(lid_width-(lid_height-2),
                                  lid_length-(lid_height-2), 0.1,
                                  lid_corner-2, $fn=30);

            }

            _lid_hole_positions()
            intersection() {
                scale([1,1,2])
                screw_corner();
                cylinder(d=100,h=lid_height);
            }
        }
        translate([0,0,lid_height-3/2+0.4])
        gasket();
        
        // inner block to remove
        difference() {
            translate([wall,wall,wall])
            rounded_cube_side(lid_inner_width, lid_inner_length,
                              height, lid_inner_corner, $fn=30);

            // cork hole body
            translate([width/2, length/2,0])
            cylinder(d=cork_thread_female_dia+2.2,h=lid_height, $fn=50);
            
            // stripes
            for(i=[0:width/5]) {
                translate([i*30,0,0])
                rotate([0,0,45])
                cube([2*nozzle,2*height,lid_height+1]);

                translate([-2*height+i*30,0,0])
                rotate([0,0,-45])
                cube([2*nozzle,2*height,lid_height+1]);
            }
        }

        // screw holes
        _lid_hole_positions()
        cylinder(d=lid_screw_dia,h=lid_height,$fn=30);

        // cork hole
        translate([width/2,length/2,0]) {
            if(render_thread) {
                v_screw(h=lid_height+2,
                        screw_d=cork_thread_female_dia,
                        pitch=4,
                        direction=0,
                        steps=100);
            } else {
                cylinder(d=cork_thread_female_dia,h=lid_height+2);
            }
        }
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
                for (i=[0:indents]) {
                    rotate([0,0,i*angle])

                    translate([50/2,0,h/2])
                    rotate([0,0,45])
                    cube([1,1,h],center=true); 
                }
                cube([50, 5, 10],center=true);
                cube([5, 50, 10],center=true);
                
                translate([0,0,h+1.6])
                rotate([0,180,0])
                cork_gasket();
            }

            translate([0,0,h]) {
                if (render_thread) {
                    v_screw(h=lid_height+2,
                            screw_d=cork_thread_dia,
                            pitch=4,
                            direction=0,
                            steps=100);
                } else {
                    cylinder(d=cork_thread_dia, h=lid_height+2,$fn=50);
                }
                cylinder(d=cork_thread_dia, h=1,$fn=50);
            }
        }
        translate([0,0,h-4])
        cylinder(d=cork_thread_dia-8,h=h, $fn=40);
    }
}

module gasket() {
    
    difference() {
        translate([-4/2,-4/2,0])
        rounded_cube_side(width+4, length+4,3, corner+4, $fn=30);

        rounded_cube_side(width, length,4, corner, $fn=30);
    }
}

module ring_gasket_passthrough() {
    translate([0,0,1])
    intersection() {
        translate([0,0,0.45/2])
        cube([passthrough_thread_dia+10,passthrough_thread_dia+10,0.45], center=true);
        translate([0,0,-0.55])
        donut(passthrough_thread_dia+5,2,$fn=50);
    }
    difference() {
        cylinder(d=passthrough_thread_dia+8, h=1, $fn=50);
        cylinder(d=passthrough_thread_dia-0.5, h=2, $fn=50);
    }
}

module ring_gasket_wire() {
    translate([0,0,1])
    intersection() {
        translate([0,0,0.45/2])
        cube([wire_pass_thread_dia+10,passthrough_thread_dia+10,0.45], center=true);
        translate([0,0,-0.55])
        donut(wire_pass_thread_dia+5,2,$fn=50);
    }
    difference() {
        cylinder(d=wire_pass_thread_dia+8, h=1, $fn=50);
        cylinder(d=wire_pass_thread_dia-0.5, h=1, $fn=50);
    }
}

module cork_gasket() {
    translate([0,0,1.6])
    intersection() {
        translate([0,0,0.95/2])
        cube([cork_thread_hole_dia+10,cork_thread_hole_dia+10,0.95],center=true);
        union() {
            translate([0,0,-0.55])
            donut(cork_thread_hole_dia+1.5,2,$fn=50);

            translate([0,0,-0.55])
            donut(cork_thread_hole_dia+5.5,2,$fn=50);
        }
    }
    difference() {
        cylinder(d=cork_thread_dia+10, h=1.6, $fn=50);
        cylinder(d=cork_thread_dia-1, h=1.8, $fn=50);
    }
}

module washer_passthrough(){
    difference() {
        cylinder(d=passthrough_thread_dia+8, h=1.8);
        cylinder(d=passthrough_thread_dia, h=1.8);
    }
}

module washer_wire_pass(){
    difference() {
        cylinder(d=wire_pass_thread_dia+8, h=1.8);
        cylinder(d=wire_pass_thread_dia, h=1.8);
    }
}

module bottomvoir() {
    b_width = width + 15;
    b_length = length + 15;
    b_height = 15;
    
    difference() {
        rounded_cube_side(b_width, b_length, b_height, corner, $fn=30);
        translate([wall,wall,1])
        rounded_cube(b_width-2*wall, b_length-2*wall,
                     b_height+corner, corner-2*wall, $fn=30);
    }
    
    in_width = width + 2*wall+4*slop;
    in_length = length + 2*wall+4*slop;
    
    translate([15/2-wall-2*slop,15/2-wall-2*slop,0.4])
    difference() {
        rounded_cube_side(in_width, in_length, 3, corner+2*wall, $fn=30);
        translate([wall,wall,wall])
        rounded_cube(in_width-2*wall, in_length-2*wall, 3, corner, $fn=30);
    }

}

module test_res() {
    translate([0,0,-height+15]) intersection() {
        reservoir();
        translate([0,0,height-15])
        cube([20,20,15]);
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

module debug() {

    intersection() {
        translate([0,0,height+1])
        mirror([0,0,1])
        color("blue") gasket();

        translate([-10,-10,0])
        cube([width+20,21,height+20]);
    }

    intersection() {
        translate([0,0,height+lid_height+0.5])
        mirror([0,0,1])
        color("green")
        lid();

        translate([-10,-10,0])
        cube([width+20,20,height+20]);
    }

    intersection() {
        reservoir();

        translate([-10,-10,0])
        cube([width+20,20,height+20]);
    }
}

module debug_Eheim_1250_790() {
    %translate([45,10,46])
    rotate([-90,-90,0])
    mock_pump_Eheim_1250_790();
    
    intersection() {
        render(convexity=10)
        reservoir();

        translate([-20,-length/2,0])
        cube([width*2,length,height]);
    }
    
    %translate([passthrough_x2,0,passthrough_h2])
    rotate([-90,0,0])
    cylinder(d=12,h=60,$fn=30);
}
