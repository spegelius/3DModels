
include <../lib/includes.scad>;

width = 65;
depth = 15;
height = 13;

m4_hole = 4.3;

module block() {
    rotate([90,0,0])
    difference() {
        translate([-width/2,-depth/2,0])
        rounded_cube_side(width, depth, height, 6);

        translate([-54/2,0,height-6.4])
        cylinder(d=6.2, h=height, $fn=30);

        translate([54/2,0,height-6.4])
        cylinder(d=6.2, h=height, $fn=30);
        
        translate([-54/2,0,0])
        cylinder(d=10, h=height-8, $fn=30);

        translate([54/2,0,0]) 
        cylinder(d=10, h=height-8, $fn=30);
        
        translate([-54/2,0,0])
        cylinder(d=m4_hole, h=height-6, $fn=30);

        translate([54/2,0,0])
        cylinder(d=m4_hole, h=height-6, $fn=30);

        translate([0,-0.5,0])
        cylinder(d=m4_hole, h=height, $fn=30);
        
        translate([0,-0.5,0])
        rotate([0,0,90])
        M4_nut(3, false);
        
        translate([0,-0.5,height-2.3-2.8])
        cylinder(d=7,h=3, $fn=30);
        
        translate([0,0,height])
        cube([44,depth,2.3*2], center=true);
    }
}

module view_proper() {
    translate([0,90/2,0]) block();
    translate([0,-90/2,0]) rotate([0,0,180]) block();
}

//view_proper();
block();
