
include <../Dollo/NEW_Long_ties/globals.scad>;
include <../Dollo/NEW_Long_ties/include.scad>;

$fn=30;

tube_hole = 4.5;
height = 20;


//clamp();

extruder_clamp();


module clamp() {
    difference() {
        union() {
            cylinder(d=10, h=height);

            translate([0, 3.25, height/2])
            cube([10, 6.5, height], center=true);
        }
        translate([0, -1, 0])
        cylinder(d=tube_hole, h=height);

        translate([0, 3, height/2])
        cube([1, 7, height], center=true);
        
        translate([-5, 3, 5])
        rotate([0, 90, 0])
        cylinder(d=bolt_hole_dia, h=10);

        translate([3, 3, 5])
        rotate([0, 90, 0])
        cylinder(d=bolt_head_hole_dia, h=3);

        translate([-5.1, 3, 5])
        rotate([0, 90, 0])
        M3_nut(cone=false);

        translate([-5, 3, height - 5])
        rotate([0, 90, 0])
        cylinder(d=bolt_hole_dia, h=10);

        translate([3, 3, height - 5])
        rotate([0, 90, 0])
        cylinder(d=bolt_head_hole_dia, h=3);

        translate([-5.1, 3, height - 5])
        rotate([0, 90, 0])
        M3_nut(cone=false);
    }
    
    module ring() {
        difference() {
            cylinder(d=tube_hole,h=0.4);
            cylinder(d=tube_hole - 0.4, h=0.4);

            translate([0, 4, height/2])
            cube([3, 7, 25], center=true);
        }
    }

    translate([0, -1, 2])
    ring();

    translate([0, -1, height/2])
    ring();

    translate([0, -1, height - 2])
    ring();
}

module extruder_clamp() {
    difference() {
        union() {
            cube([66, 32.8, 5], center=true);

            translate([0, 1, 2])
            clamp();
        }
        
        translate([0, 0, -5/2])
        cylinder(d=tube_hole, h=10);

        translate([0, 0, -5/2])
        cylinder(d=11, h=2.8);

        translate([0, 5, 0])
        cube([1, 6, 5], center=true);

        translate([0, 7.75, 1])
        cube([11, 0.5, 4], center=true);

        translate([5.25, 5, 1])
        cube([0.5, 5, 4], center=true);

        translate([-5.25, 5, 1])
        cube([0.5, 5, 4], center=true);

        translate([50/2, 0, -5])
        cylinder(d=4.2, h=10);

        translate([-50/2, 0, -5])
        cylinder(d=4.2, h=10);

        translate([34/2, 0, -5])
        rotate([0, 0, 90])
        M3_nut(10);

        translate([-34/2, 0, -5])
        rotate([0, 0, 90])
        M3_nut(10);
    }
}
