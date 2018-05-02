
use <../lib/includes.scad>;

slop = 0.15;

$fn=100;

width = 40;

center_width = 20;
center_height = 7;

ball_size = 5.92+0.05;

ball_count = 12;
ball_notch = ball_size - ball_size*0.7;

ball_position = center_width/2+ball_size/2-.5;

outer_position = center_width/2+ball_size;
outer_side = width/2-outer_position;

bewel = 0.5;

center_cube_side = 9;

//roll_height = 160 - 2*14 - 2;
roll_height = 174 - 2*14 - 2;

module ball_path(ball_size) {
    rotate_extrude(convexity=7) {
        translate([ball_position, 0, 0]) rotate([0,0,45]) square(ball_size, center=true);
    }
}

module cone(d1, d2, h) {
    hull() {
        cylinder(d=d1, h=0.01);
        translate([0,0,h-0.01]) cylinder(d=d2, h=0.01);
    }
}

module _center_block(side=5) {
    
    translate([ball_position-4,0,center_height/2]) union() {
        cube([side,side,center_height],center=true);
        translate([-1.5,side/2]) rotate([0,0,45]) cube([1,1,center_height],center=true);
        translate([-1.5,-side/2]) rotate([0,0,45]) cube([1,1,center_height],center=true);
    }

}

module _center() {
    
    difference() {
        union() {
            difference() {
                union() {
                    beweled_cylinder(d=center_width+ball_notch, h=center_height, b=bewel);
                    //translate([0,0,center_height+0.4/2]) cube([12,12,0.4], center=true);
                }
                translate([0,0,center_height/2]) ball_path(ball_size);
            }
        }
    }
}

module center_square_hole() {
    difference() {
        _center();
        _center_block();
        translate([0,0,3]) cube([center_cube_side,center_cube_side,19], center=true);
    }
}

module center_circle_hole(dent=false) {
    difference() {
        _center();
        if (dent) {
            translate([ball_position+0.8,0,0]) cylinder(d=ball_size+1, h=center_height/2);
        } else {
            _center_block();
        }
        cylinder(d=8, h=9);
    }
    %translate([ball_position,0,center_height/2]) sphere(d=ball_size);
}

module center_block() {
    intersection() {
        _center();
        _center_block(side=5-slop);
    }
}

module roll(height, diameter, wall=1.8, edges=true, dent=false) {
    intersection() {
        union() {
            difference() {
                //beweled_cylinder(d=width, h=roll_height, b=bewel, $fn=100);
                union() {
                    cylinder(d=diameter, h=height);
                    if (edges) {
                        hull() {
                            cylinder(d=diameter+4, h=.1);
                            translate([0,0,2]) cylinder(d=diameter, h=.1);
                        }
                        hull() {
                            translate([0,0,height-.1])cylinder(d=diameter+4, h=.1);
                            translate([0,0,height-2.1]) cylinder(d=diameter, h=.1);
                        }
                    }
                }
                //translate([0,0,center_height+1]) cylinder(d=diameter-2*wall, h=height-2*center_height-2);
                cylinder(d=ball_position*2, h=height);
                
                // bewels
                translate([0,0,-2+bewel]) beweled_cylinder(d=ball_position*2+3, h=2, b=bewel);
                translate([0,0,height-bewel]) beweled_cylinder(d=ball_position*2+3, h=2, b=bewel);
                
                big_bewel = (diameter-2*wall - (ball_position*2 + 1))/2;
                
                translate([0,0,center_height]) beweled_cylinder(d=diameter-2*wall, h=height-2*center_height, b=big_bewel);
                //translate([0,0,height-center_height-4+bewel]) beweled_cylinder(d=width-8, h=4, b=bewel*3);

                // ball paths
                translate([0,0,center_height/2]) ball_path(ball_size);
                if (dent) {
                    translate([ball_position-0.8,0,0]) cylinder(d=ball_size+1, h=center_height/2);
                }
                translate([0,0,height-center_height/2]) ball_path(ball_size);
                if (dent) {
                    translate([ball_position-0.8,0,height-center_height/2]) cylinder(d=ball_size+1, h=center_height/2); 
        }
            }
        }
        //cube([30,30,height]);
    }
    %translate([ball_position,0,center_height/2]) sphere(d=ball_size); 
}

module bearing5(height, diameter, dent=false) {
    difference() {
        cylinder(d=diameter, h=height);
        cylinder(d=ball_position*2, h=height+1);
        translate([0,0,height/2]) ball_path(ball_size);
        if (dent) {
            translate([ball_position-0.8,0,0]) cylinder(d=ball_size+1, h=height/2); 
        }
    }
    degree = 360/ball_count;
    for (i = [0:ball_count-1]) {
        rotate([0,0,degree*i]) %translate([ball_position,0,center_height/2]) sphere(d=ball_size);
    }
   
}

module test() {
    center();
    translate([0,25,0]) center_block();
    intersection() {
        outer();
        cube([40,40,14],center=true);
    }
}

intersection() {
    //bearing5();
    //cube([100,100,200]);
}


//roll(roll_height, width, edges=false);
roll(roll_height, width, edges=false, dent=true);
//center_square_hole();
//center_circle_hole(dent=true);
//center_block();

//bearing5(7, 50, dent=true);

module washer() {
    difference() {
        union() {
            cylinder(d=15, h=0.4);
            translate([-9/2,-7/2,0]) cube([9,9,0.8]);
        }
        cube([7,7,7],center=true);
    }
}

//test();

//washer();
