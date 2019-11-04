
include <../lib/includes.scad>;

$fn = 50;

pellet = 6;

slop = 0.15;
r = sqrt(pellet*pellet + pellet*pellet);
echo("r:", r);

steps = 200;
angle_step = 360 / steps;
z_step = r / steps;

thread_d = 24;

path_z = 0.6;

thread_length = PI*thread_d;
rise_angle = asin(r/thread_length);
echo("thread length:", thread_length);
echo("rise angle:", rise_angle);


// cylinder cube hybrid
module cycube(d, h, center=false) {
    module _cycube() {
        hull() {
            cylinder(d=d,h=h,$fn=50);
            translate([0,0,h/2]) intersection() {
                rotate([0,0,45]) cube([d,d,h],center=true);
                cube([1,d*2,h],center=true);
            }
        }
    }
    
    if (center) {
        translate([0,0,-h/2]) _cycube();
    } else {
        translate([d/2,d/2,0]) _cycube();
    }
}

// circle square hybrid
module cirsquare(d, center=false) {
    projection() cycube(d,1,center=center);
}
//cirsquare(4);

// cylinder cube hybrid rotate extruded
module cycube_donut(d, h, angle=360, rotation=0) {
    rotate_extrude(angle=angle, convexity=10, $fn=100) translate([d/2,0,0]) rotate([0,0,rotation]) cirsquare(h, center=true);
}

// slice of cycube donut
module slice(d, h, angle=360, rotation=0) {
    translate([-d/2,0,0]) cycube_donut(d, h, angle=angle, rotation=rotation);
}

// cycube thread
module thread(cube_side=4, resolution=steps) {
    for (i=[0:resolution-1]) {
        rotate([0,0,i*angle_step]) translate([thread_d/2+r/2,0,z_step*i]) rotate([rise_angle/1.9,0,-angle_step/2]) slice(thread_d, cube_side, angle_step*2);
    }
}

// star base form
module _star(h) {
    arms = 10;
    d = 10;
    total = PI*d;
    piece = total/arms;
    
    angle = 360/arms;
    
    for (i = [0:arms-1]) {
        rotate([0,0,i*angle]) {
            translate([0,d/2-0.5,0]) {
                linear_extrude(h) {
                    polygon(points=[[-piece/2,0], [0,piece],[piece/2,0]]);
                }
            }
        }
    }
    cylinder(d=d,h=h);
}

// final star object
module star(h) {
    scale([0.97,0.97,1]) {
        _star(h);
        cylinder(d=10,h=h);
    }
}

// shaft base form
module _shaft(h=10) {
    d = thread_d + r;
    height = h*r;
    difference() {
        cylinder(d=d, h=height);
        for (i = [0:h]) {
            translate([0,0,i*r-r/2]) thread(pellet+slop);
        }
    }
}

// final shaft object
module shaft(h=10) {
    height = h*r;
    intersection() {
        difference() {
            _shaft(h=h);
            _star(height);
        }
        cylinder(d=thread_d + r-1, h=h*r);
    }
}


// not used
module twist_cube(x,y,z, twist) {
    linear_extrude(height=z, convexity=10, twist=twist) square(x,y, center=true);
}

// nut for the ballscrew
module ballscrew_nut(h=10) {
    
    // bunch of variables
    bottom_z = 0;
    top_z = h*r + r/2;

    right_x = thread_d/2 + r/2;
    left_x = -right_x;

    height = top_z - bottom_z;
    width = right_x - left_x;

    bend_d = 12;

    joint_len = right_x+1.1;

    // ball path
    module route66(){
        size = pellet+slop;

        difference() {
            union() {
                for (i = [0:h-1]) {
                    translate([0,0,i*r]) thread(size);
                }
                // last half
                translate([0,0,h*r]) thread(size, resolution=steps/2);
            }
        }
        // path to bottom thread start
        translate([right_x,-joint_len/2+0.1,0]) rotate([90,0,0]) cycube(size+slop, joint_len+0.4,center=true);

        // path from top thread end
        translate([left_x,-joint_len/2,top_z]) rotate([90,0,0]) cycube(size+slop, joint_len,center=true);

        // calculate some angles, don't ask how
        end_angle = asin((h*r+r/2)/(thread_d+r-bend_d))-0.5;
        echo("end angle", end_angle);

        end_len = (thread_d+r)/ cos(end_angle) - bend_d*2;
        echo("end len", end_len);

        // joining path, top to bottom
        translate([0,-joint_len-bend_d/2,height/2]) rotate([0,-90+end_angle,0]) rotate([0,0,90]) cycube(size+slop, end_len, center=true);

        // top left bend
        translate([left_x+bend_d/2,-joint_len-bend_d/2,top_z]) rotate([0,-90,-90]) slice(bend_d,size+slop,angle=end_angle,rotation=90);

        // bottom right bend
        translate([right_x-bend_d/2,-joint_len-bend_d/2,0]) rotate([0,90,90]) slice(bend_d,size+slop,angle=end_angle,rotation=90);

        // top left bend 2
        translate([left_x,-joint_len,top_z]) rotate([0,180,0]) rotate([180,0,0]) slice(bend_d,size+slop,angle=90,rotation=0);
        
        // bottom right bend 2
        translate([right_x,-joint_len,0]) rotate([180,0,0]) slice(bend_d,size+slop,angle=90,rotation=0);
    }
    
    hh = r*h + 1.7*r;
    w = thread_d + 2*r;
    difference() {
        // main form
        hull() {
            cylinder(d=w, h=hh);
            translate([-w/2,-w/2-pellet-1,0]) rounded_cube_side(w,20,hh,3);
        }
        difference() {
            cylinder(d=thread_d + r+1,h=r*(h+2));
            // ball catchers
            difference() {
                union() {
                    // top
                    translate([left_x,-8.5,top_z+r/2+path_z])
                    rotate([0,45,17])
                    rotate([-rise_angle,0,0])
                    translate([0,-4.5,0])
                    cube([pellet+3,12,pellet+3],center=true);
                    
                    // bottom
                    translate([right_x,-8.5,r/2+path_z])
                    rotate([0,45,-17])
                    rotate([rise_angle,0,0])
                    translate([0,-4.5,0])
                    cube([pellet+3,13,pellet+3],center=true);
                }
                // remove excess
                translate([0,0,path_z]) scale([1.02,1.02,1]) _shaft(h=h+2);
            }
        }
        // remove ball paths from nut
        translate([0,0,r/2+path_z]) route66();
    }
}

// cap for demo use
module cap() {
    d = 27;
    count = 11;
    module _cap() {
        intersection() {
            union() {
                for(i = [0:count-1]) {
                    rotate([45,0,i*360/count]) translate([d/2,0,0]) cylinder(d=8,h=25,center=true,$fn=50);
                }
                cylinder(d=d,h=8,center=true,$fn=30);
            }
            beweled_cylinder(d+8+1,8,2,center=true,$fn=120);
        }
    }
    
    difference() {
        union() {
            _cap();
            star(20);
        }
        cylinder(d=2,h=50,center=true,$fn=20);
    }
}

// debugging
module view_intersection() {
    intersection() {
        union() {
            translate([0,0,path_z]) shaft(3);
            ballscrew_nut(1);
        }
        //cube([30,30,40]);
        //translate([0,-30,0]) cube([30,30,40]);
        translate([-30,-30,0]) cube([30,30,40]);
    }
    %translate([thread_d/2+r/2,0,r/2+1]) sphere(d=pellet);
    %translate([thread_d/2+r/2,0,r+r/2+1]) sphere(d=pellet);
}

//view_intersection();

ballscrew_nut(1);
//shaft(8);

//star(40);
//cap();
