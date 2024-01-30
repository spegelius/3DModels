
include <../Dollo/NEW_long_ties/include.scad>;

width = 68;
depth = 15;
height = 13;

m4_hole = 4.3;

//debug_tuniq_tower_mount();
block();


module block() {
    rotate([90, 0, 0])
    difference() {
        translate([-width/2, -depth/2, 0])
        rounded_cube_side(
            width, depth, height, 8, $fn=40
        );

        translate([-54/2, 0, height - 6.4])
        cylinder(
            d=6.2, h=height, $fn=30
        );

        translate([54/2, 0, height - 6.4])
        cylinder(
            d=6.2, h=height, $fn=30
        );
        
        translate([-54/2, 0, 0])
        cylinder(
            d=10, h=(height - 8)*2,
            center=true, $fn=30
        );

        translate([54/2, 0, 0]) 
        cylinder(
            d=10, h=(height - 8)*2,
            center=true, $fn=30
        );
        
        translate([-54/2, 0, 0])
        cylinder(
            d=m4_hole, h=(height - 6)*2,
            center=true, $fn=30
        );

        translate([54/2, 0, 0])
        cylinder(
            d=m4_hole, h=(height - 6)*2,
            center=true, $fn=30
        );

        translate([0, -0.5, 0])
        cylinder(
            d=m4_hole, h=height*3,
            center=true, $fn=30
        );
        
        translate([0, -0.5, -0.2])
        rotate([0, 0, 90])
        M4_nut(3.4, false);
        
        translate([0, -0.5, height - 2.3 - 2.8])
        cylinder(d=8.3, h=3, $fn=30);
        
        translate([0, 0, height])
        cube([44, depth, 2.3*2], center=true);
    }
}

module debug_tuniq_tower_mount() {
    translate([0, 90/2, 0])
    rotate([90, 0, 0])
    block();

    translate([0, -90/2, 0])
    rotate([90, 0, 180])
    block();
}
