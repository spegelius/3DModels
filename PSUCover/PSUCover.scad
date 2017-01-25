include <../_downloaded/Dollo/NEW_long_ties/include.scad>;
include <../_downloaded/Dollo/NEW_long_ties/globals.scad>;

switch_height = 12.4;
switch_width = 19.45;

$fn=30;

module switch_hole() {
    hull() {
        translate([0,0,8.48]) cube([ switch_height, switch_width*1.5, 1], center=true);
        translate([0,0,0.48]) cube([switch_height, switch_width, 1], center=true);
    }
}

module box() {
    difference() {
        union() {
            import("PSU_Cover_v2.stl");
            #translate([-59,17,-38.75]) cube([54,35,2]);
            //translate([9,27,-38.75]) cube([38,25,2]);
        }
        translate([33, 18,-39]) cylinder(d=8,h=3);
        translate([23.5, 18,-39]) cylinder(d=3.3,h=3);
        translate([42.5, 18,-39]) cylinder(d=3.3,h=3);
        translate([2,25,-38.75]) #switch_hole();
    }

    module extrusion() {
        hull() {
            sphere(d=2);
            translate([0,5,0]) sphere(d=2);
        }
    }

    translate([-62.6,5,-4]) extrusion();
    translate([-62.6,45,-4]) extrusion();

    translate([-62.6,5,4]) extrusion();
    translate([-62.6,45,4]) extrusion();

    translate([55.1,5,-4]) extrusion();
    translate([55.1,45,-4]) extrusion();

    translate([55.1,5,4]) extrusion();
    translate([55.1,45,4]) extrusion();

    // cord hole body
    translate([33, 18, -38.75]) difference() {
        cylinder(d=11, h=5);
        hull() {
            translate([0,0,5]) cylinder(d=8, h=1);
            cylinder(d=7, h=1);
        }
    }
}

//translate([-63.25,0,0]) cube([119,55,10]);

module cord_holder(nut_holes=true) {
    
    module bolt_hole() {
        hull() {
            translate([1,0,0]) cylinder(d=bolt_hole_dia,h=6);
            translate([-1,0,0]) cylinder(d=bolt_hole_dia,h=6);
        }
    }
    
    module arm() {
        difference() {
            cube([5,9,6]);
            translate([0,4.5,3]) rotate([0,90,0]) cylinder(d=bolt_hole_dia, h=6);
            if (nut_holes) { 
                translate([2,4.5,3]) rotate([0,90,180]) nut();
            }
        }
    }
    
    module main() {

        difference() {
            union() {
                cube([14,13,6]);

            }
            translate([6,6.5,3.6]) elongated_nut(2.5);

            translate([6, 6.5, 0]) bolt_hole();
            translate([15.5, 6.5, 0]) cylinder(d=7,h=8);
        }
        
        translate([9,-9,0]) arm();

        translate([9,13,0]) arm();

    }

    main();
}

translate([0,0,38.75]) box();

translate([0,-25, 0]) cord_holder();
translate([20,-25, 0]) cord_holder(false);