include <../lib/includes.scad>;

////// VARIABLES //////
width = 120;
length = 120;
height = 80;
//wall = 1.5;
wall = 1.7;

//width = 150;
//length = 150;
//height = 100;
//wall = 1.7;

//width = 180;
//length = 180;
//height = 120;
//wall = 1.7;

//width = 200;
//length = 200;
//height = 150;
//wall = 1.7;

slop = 0.4;

inner_w = width - 2*wall;
inner_l = length - 2*wall;
corner = 10;
inner_corner = 10 - 2*wall;
inner_h = height+10;

lid_outer_w = width+2*wall+slop;
lid_outer_l = length+2*wall+slop;
lid_inner_w = inner_w - 2*wall-slop-0.5;
lid_inner_l = inner_l - 2*wall-slop-0.5;

fastener_hole_x = width/2-5.7;
fastener_hole_l = length*0.7;
fastener_hole_y = -fastener_hole_l/2;

fastener_l = fastener_hole_l-4.8;
fastener_wall = 1.8;

fastener_dia = 7;

slot_w = 100;

plate_w = slot_w - 3;
plate_l = 34;


////// VIEW //////
//view_proper();
//debug_box();

//box();
lid();
//fastener();
//fasteners();
//plate("Crap");


////// MODULES //////
module main_body(crevices=false) {
    
    module form(w, d, l, h) {
        
        module subform() {
            rotate([90,0,0]) {
                hull() {
                    translate([1,0,0])
                    cylinder(d=d,h=l,center=true,$fn=40);

                    translate([-d,d/2-0.5,0])
                    cube([1,2*d,l],center=true);

                    translate([0,-d/2-0.5,0])
                    cube([d,1,l],center=true);
                }
                hull() {
                    translate([1,0,4])
                    sphere(d=d+3,$f=50);

                    translate([1,0,-4])
                    sphere(d=d+3,$f=50);
                }
            }
        }
        
        translate([-w/2,0,0])
        subform();

        translate([w/2,0,0])
        mirror([1,0,0])
        subform();
    }
    
    difference() {
        difference() {
            translate([0,0,height/2])
            rounded_cube_side(width,length,height,corner,center=true);

            form(width,12,fastener_l+2);
        }
        if (crevices == true) {
            difference() {
                translate([0,0,inner_h/2+2.5])
                rounded_cube(inner_w, inner_l, inner_h, inner_corner,center=true);

                form(inner_w,12+2*wall,fastener_l+2+2*wall);
            }
        } else {
            difference() {
                translate([0,0,inner_h/2+wall])
                rounded_cube(inner_w, inner_l, inner_h, inner_corner,center=true);

                form(width,12+2*wall,fastener_l+2+2*wall);
            }
        }
        
        w = width-20;
        l = length-10;
        
        blocks_x = round(w / 15);
        blocks_y = round(l / 15);
        x = (w - (blocks_x * 10)) / (blocks_x-1) + 10;
        y = (l - (blocks_y * 10)) / (blocks_y-1) + 10;
        echo("Blocks X:", blocks_x);
        echo("Blocks Y:", blocks_y);
        echo("X interval:", x);
        echo("Y interval:", y);
        
        x_offset = -w/2 + 10/2;
        y_offset = -l/2 + 10/2;
        
        for(i = [0:blocks_x-1]) {
            for(j = [0:blocks_y-1]) {
                translate([x_offset+i*x,y_offset+j*y,0])
                cube([10,10,0.4],center=true);
            }
        }
        
    }
}

//main_body();

// plate slot
module slot() {

    difference() {
        union() {
            difference() {
                intersection () {
                    translate([0,0,38/2])
                    rounded_cube_side(slot_w, 6.4, 38, 5, center=true);

                    translate([0,10,26.45])
                    rotate([-45,0,0])
                    cube([width,50,50],center=true);
                }
                translate([0,0,40/2])
                rounded_cube_side(slot_w-2.4, 6.4-2.4, 40, 2,center=true);
            }
            translate([0,0,1.94])
            rotate([-45,0,0])
            cube([slot_w-2.3,6.7,1.2],center=true);
        }
        translate([0,6,0])
        cube([width, 10,100], center=true);

        cube([slot_w-14, 20,100], center=true);
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
                    rotate([0,90,0])
                    cylinder(d=w, h=7,$fn=30);

                    cube([7,w/2,w/2]);

                    translate([7/2,0,-4/2-1/2-1])
                    cube([7,w,1],center=true);

                    translate([7/2,w/2-0.1/2,-4/2-1/2-12])
                    cube([7,0.1,0.1],center=true);
                }

                // hole
                hull() {
                    translate([2,1,-1])
                    rotate([0,90,0])
                    cylinder(d=w-1.5,h=7, $fn=30);

                    translate([(7-1.5)/2+2,1,-3/2-13])
                    cube([7-1.5,w-1,1],center=true);
                }
            }
            // stopper
            translate([1.5,-w/2+2.4/2,-2.8])
            rotate([0,90,0])
            cylinder(d=2.4,h=7-1.5,$fn=30);
        }

        // chamfer
        translate([2,-4,-6.5])
        union() {
            rotate([0,45,0])
            cube([4,4,8]);

            translate([0,0,-4])
            cube([2,4,4]);
        }
    }
}

//!fastener_slot();

module box(crevices=false) {

    crevice_count = 12;
    distance = length/crevices;
    start = length/2 - distance/2;
    
    fastener_x_offset = width/2+fastener_dia/2 - 0.01;

    module crevice() {
        rotate([45,0,0])
        cube([width, 2, 2], center=true);
    }
    
    slot_pos = height > 78 ? 30 : height - 48;

    union() {
        if (crevices == true) {
            difference() {
                main_body(crevices=crevices);
                for(i=[0:crevice_count]) {
                    translate([0, start - i*distance, 0])
                    crevice();
                }
            }
        } else {
            main_body(crevices=crevices);
        }
        translate([0,-length/2, slot_pos])
        slot();

        translate([fastener_x_offset, -fastener_hole_l/2+0.1, height-10])
        rotate([0,0,90])
        fastener_slot();

        mirror([0,1,0])
        translate([fastener_x_offset, -fastener_hole_l/2+0.1, height-10])
        rotate([0,0,90])
        fastener_slot();

        mirror([1,0,0])
        translate([fastener_x_offset, -fastener_hole_l/2+0.1, height-10])
        rotate([0,0,90])
        fastener_slot();

        mirror([0,1,0])
        mirror([1,0,0])
        translate([fastener_x_offset, -fastener_hole_l/2+0.1, height-10])
        rotate([0,0,90])
        fastener_slot();
    }
}

module lid() {
    
    
    union() {
        difference() {
            translate([0,0,(wall+2)/2])
            rounded_cube_side(lid_outer_w, lid_outer_l, wall+2, 10+2*wall+0.2, center=true);

            translate([fastener_hole_x, fastener_hole_y, -0.6])
            rotate([-90,0,0])
            cylinder(d=3,h=fastener_hole_l,$fn=30);

            translate([-fastener_hole_x, fastener_hole_y, -0.6])
            rotate([-90,0,0])
            cylinder(d=3,h=fastener_hole_l,$fn=30);

            translate([0,0,wall+10/2])
            difference() {
                rounded_cube_side(width+slop, length+slop, 10,corner+2*slop, center=true);
                rounded_cube_side(inner_w-slop, inner_l-slop, 11,inner_corner+2*slop, center=true);
            }
            
            l = (lid_inner_l-fastener_l)/2;
            y = (lid_inner_l/2 - l);
            
            center_corner = inner_corner+2*slop - 2*wall;
            if (center_corner >= 0.5) {
                translate([0,0,2.1/2+wall])
                rounded_cube_side(lid_inner_w,lid_inner_l,2.1, center_corner, center=true);
            } else {
                translate([0,0,2.1/2+wall])
                cube([lid_inner_w,lid_inner_l,2.1], center=true);
            }
            //translate([0,y,2/2-0.01]) cube([lid_inner_w,l,2], center=true);
            //#translate([0,-y,2/2-0.01]) cube([lid_inner_w,l,2], center=true);
            
        }
        translate([width/2-2*wall-3/2, 0, 1+0.5/2])
        cube([4,length*0.7+2,0.5],center=true);

        translate([-(width/2-2*wall-3/2), 0, 1+0.5/2])
        cube([4,length*0.7+2,0.5],center=true);
    }
}

module fastener(){
    difference() {
        union() {
            cylinder(d=fastener_dia-2, h=fastener_l,$fn=30);

            translate([0,0,10/2])
            cube([fastener_wall,fastener_dia/2+2,fastener_l-10]);

            translate([0,fastener_dia/2+1.7,0])
            cube([fastener_wall,6.8,fastener_l]);

            difference() {
                translate([-3.5,12.5,0])
                cylinder(d=11, h=fastener_l,$fn=40);

                translate([-10,(fastener_dia-1)/2,0])
                cube([10,9,fastener_l+1]);

                translate([-10,(fastener_dia-1)/2,0])
                cube([7,9,fastener_l+1]);
            }
            translate([-8,12.5,0])
            cylinder(d=2, h=fastener_l, $fn=20);

            translate([-8.9,4.5,fastener_l/2])
            difference() {
                rotate([-90,0,60])
                cylinder(d=20,h=6,$fn=50);

                translate([1.7,-1.1,-30/2])
                cube([4,10.1,30]);

                translate([1,-2.1,-30/2])
                cube([4,10.1,30]);

                translate([-7,0.8,-30/2])
                rotate([0,0,-30])
                cube([5,10,30]);

                translate([-13,-10,-30/2])
                cube([15,15,30]);
                
                translate([-6.5,10,20/2-5/2-0.5])
                rotate([0,45,-30])
                cube([5,5,5]);

                translate([-6.5,10,-20/2+5/2+0.5])
                rotate([0,45,-30])
                cube([5,5,5]);
            }
        }
        cylinder(d=0.5, h=fastener_l,$fn=30);

        translate([-7,4,fastener_l/2])
        rotate([-90,0,60])
        cylinder(d=20-2*fastener_wall,h=10,$fn=50);

        translate([-3.5,12.5,0])
        cylinder(d=11-2*fastener_wall, h=fastener_l+1,$fn=40);
    }
}

module fasteners(brim=true) {
    if (brim) {
        union() {
            translate([-5,0,0])
            fastener();

            translate([10,0,0])
            fastener();

            translate([-16,-7,0])
            cube([30,30,0.2]);
        }
    } else {
        translate([-5,0,0])
        fastener();

        translate([10,0,0])
        fastener();
    }
}

module plate(text) {
    union() {
        translate([0,0,1.5/2])
        rounded_cube_side(plate_w,plate_l,1.5,5,center=true);

        translate([0,0,1.5])
        linear_extrude(1)
        text(size=14, text=text, halign="center", valign="center");
    }
}

module view_proper() {
    intersection() {
        union() {
            box();
            translate([0,0,height+wall])
            rotate([180,0,0])
            lid();

            translate([0,0,height+wall])
            box();
        }
        //cube([width,length,height+100]);
    }
    
    translate([width/2+5/2,(fastener_l)/2,height-11])
    rotate([90,0,0])
    fastener();

    color("white")
    translate([0,-length/2,34+plate_l/2])
    rotate([90,0,0])
    plate("Crap");
}

module debug_box() {
    intersection() {
        box();
        cube([100,100,100]);
    }
}
