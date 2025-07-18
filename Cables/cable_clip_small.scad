
use <../Dollo/NEW_long_ties/include.scad>;

$fn=60;

//cable_clip_small(10, 8);
//cable_clip_small(12, 10);
cable_clip_small(14, 12);

//cable_screw_collar();

//another_clip(10);

//power_cord_clip();


module clip(clip_d=10, h=8) {
    wall = clip_d/10;

    difference() {
        cylinder(d=clip_d + 2*wall, h=h);
        cylinder(d=clip_d, h=3*h, center=true);

        translate([0, clip_d/2, h/2])
        rotate([0, 45, 0])
        cube([wall, clip_d, h*3], center=true);

        translate([-h/2 + h/10, clip_d/2, 0])
        cube([clip_d/10, 4, 2], center=true);

        translate([h/2 - h/10, clip_d/2, h])
        cube([clip_d/10, 4, 2], center=true);
    }
}

module cable_clip_small(clip_d=10, h=8) {
    union() {
        clip(clip_d, h);

        difference() {
            translate([0, -clip_d/2 - 0.8, (8 + h)/2])
            //cube([10, 3, 8 + h], center=true);
            rotate([90, 0, 0])
            rounded_cube_side(
                10, 8 + h, 2.5, 2, center=true
            );

            translate([0, 0, (8 + h) - 5])
            rotate([90, 0, 0])
            cylinder(d=3.3, h=20);

            translate([0, -clip_d/2 - 1, (8 + h) - 5])
            rotate([-90, 0, 0])
            cylinder(d1=3.3, d2=7.2, h=3);

        }
    }
}

module cable_screw_collar() {
    wall = 1.5;
    d = 12;
    outer_d = d + 2*wall;
    h = 12;
    
    module _arm(rotation) {
        rotate([0, 0, rotation])
        difference() {
            cube([wall, 10, h], center=true);

            translate([0, 1, 0])
            rotate([0, 90, 0])
            cylinder(d=3.8, h=5, center=true, $fn=6);
        }
    }

    union() {
        difference() {
            cylinder(d=outer_d, h=h, $fn=30);
            cylinder(d=d, h=h + 1, $fn=30);

            translate([-7/2, 4, 0])
            cube([7, 4, h + 1]);
        }
        rotate([0, 0, -25])
        translate([0, 12/2 - 0.2, 0])
        translate([0, 10/2, h/2])
        _arm(17);

        rotate([0, 0, 25])
        translate([0, 12/2 - 0.2, 0])
        translate([0, 10/2, h/2])
        _arm(-17);
    }
}

module another_clip(d) {
    union() {
        intersection() {
            difference() {
                cylinder(d=d, h=10, $fn=2*d);
                cylinder(d=d - 3, h=10, $fn=2*(d - 3));
            }
            translate([-d, 0, 0])
            cube([2*d, d, 10]);
        }
        translate([d/2 - 1, 0, 0])
        difference() {
            cube([20, 1.5, 10]);

            translate([15, 0, 10/2])
            rotate([-90, 0, 0])
            cylinder(d=4, h=7, center=true);
        }
    }
}

module power_cord_clip() {
    difference() {
        union() {
            rounded_cube_side(
                12, 10, 10, 2, center=true
            );

            translate([0, -10/2, 7/2])
            rounded_cube_side(
                14, 5, 17, 2, center=true
            );
        }

        translate([0, 2, 0])
        cylinder(d=8, h=15, center=true, $fn=30);

        translate([0, 5, 0])
        cube([7, 5, 15], center=true);

        translate([0, -2, 7])
        rotate([90, 0, 0]) {
            cylinder(
                d=4.5, h=20, center=true, $fn=30
            );

            cylinder(
                d=8.5, h=6, center=true, $fn=30
            );
        }
    }
}
