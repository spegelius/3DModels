
include <../lib/includes.scad>;

$fn = 50;

pellet = 5.92;

slop = 0.15;
r = sqrt(pellet*pellet + pellet*pellet);
echo(r);

steps = 200;
angle_step = 360 / steps;
z_step = r / steps;

thread_d = 24;

thread_length = PI*thread_d;
rise_angle = asin(r/thread_length);
echo(thread_length);
echo(rise_angle);

module slice(d, h, angle=360, rotation=45) {
    translate([-d/2,0,0]) cube_donut(d, h, angle=angle, rotation=rotation);
}

module thread(cube_side=4, resolution=steps) {
    for (i=[0:resolution-1]) {
        rotate([0,0,i*angle_step]) translate([thread_d/2+r/2,0,z_step*i]) rotate([rise_angle/1.9,0,-angle_step/2]) slice(thread_d, cube_side, angle_step*2);
    }
}

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

module star(h) {
    scale([0.95,0.95,1]) {
        _star(h);
        cylinder(d=10,h=h);
    }
}

module shaft(h=10) {
    d = thread_d + r-1;
    height = h*r;
    difference() {
        cylinder(d=d, h=h*r);
        for (i = [0:h]) {
            translate([0,0,i*r-r/2]) thread(pellet+slop);
        }
        //translate([0,0,height/2]) cube([10,10,height],center=true);
        _star(height);
    }
}

module twist_cube(x,y,z, twist) {
    linear_extrude(height=z, convexity=10, twist=twist) square(x,y, center=true);
}

module ballnut(h=10) {
    
    bottom_z = 0;
    top_z = h*r + r/2;
    
    right_x = thread_d/2 + r/2;
    left_x = -right_x;
    
    height = top_z - bottom_z;
    width = right_x - left_x;
    
    bend_d = 12;
        
    module route66(){
        
        size = pellet+slop;
        
        difference() {
            union() {
                for (i = [0:h-1]) {
                    translate([0,0,i*r]) thread(size);
                }
                translate([0,0,h*r]) thread(size, resolution=steps/2);
            }
        }
        translate([right_x,0,0]) rotate([0,45,0]) translate([0,-19/2+0.1,0]) cube([size, 19.4, size],center=true);

        translate([left_x,0,top_z]) rotate([0,45,0]) translate([0,-19/2,0]) cube([size, 19, size],center=true);

        end_angle = asin((h*r+r/2)/(thread_d+r-bend_d))-0.5;
        echo("end angle", end_angle);
        
        end_len = (thread_d+r)/ cos(end_angle) - bend_d*2;
        echo("end len", end_len);
        
        translate([0,-25,height/2]) rotate([0,end_angle,0]) rotate([45,0,0]) cube([end_len, size, size], center=true);

        translate([left_x+bend_d/2,-25,top_z]) rotate([0,-90,-90]) slice(bend_d,size,angle=end_angle,rotation=45);
        
        translate([right_x-bend_d/2,-25,0]) rotate([0,90,90]) slice(bend_d,size,angle=end_angle,rotation=45);
        
        translate([left_x,-25+bend_d/2,top_z]) rotate([0,180,0]) rotate([180,0,0]) slice(bend_d,size,angle=90,rotation=45);
        translate([right_x,-25+bend_d/2,0]) rotate([180,0,0]) slice(bend_d,size,angle=90,rotation=45);

    }
    
    hh = r*h + 1.7*r;
    //hh = r*h + 1*r;
    w = 44;
    difference() {
        hull() {
            cylinder(d=w, h=hh);
            translate([-w/2,-30,0]) rounded_cube_side(w,20,hh,3);
        }
        difference() {
            cylinder(d=thread_d + r+1,h=r*(h+2));
            translate([left_x+0.5,-8.5,top_z+r/2+1]) rotate([0,45,17]) cube([pellet+1,12, pellet+1],center=true);
            translate([right_x-0.5,-8.5,r/2+1]) rotate([-rise_angle,0,0]) rotate([0,45,-17]) cube([pellet+1,13, pellet+1],center=true);
        }
        translate([0,0,r/2+1]) route66();
    }
}

module view_intersection() {
    intersection() {
        union() {
            translate([0,0,1]) shaft(3);
            ballnut(1);
        }
        //cube([30,30,40]);
        translate([0,-30,0]) cube([30,30,40]);
        //translate([-30,-30,0]) cube([30,30,40]);
    }
    %translate([thread_d/2+r/2,0,r/2+1]) sphere(d=pellet);
    %translate([thread_d/2+r/2,0,r+r/2+1]) sphere(d=pellet);
}

//view_intersection();

//ballnut(1);
//shaft(8);

star(40);

//cube_donut(9, pellet);
//slice(20,pellet,25);

//twist_cube(5,5,5,10);
