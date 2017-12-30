
include <common.scad>;

//%translate([1,0,3.2]) mock_ssd();

side_w = 1.2;
gap = 1;

module ssd_rack() {
    difference() {
        cube([70 + 2*side_w + gap,110,10]);
        translate([side_w, 0, 3]) {
            cube([70+gap,110,10]);
            translate([2.5,15,-3]) cube([65.2,80,10]);
            translate([2,13.6,3.2]) rotate([0,-90,0]) cylinder(d=3.5, h=5, $fn=30);
            translate([2,100-9.2,3.2]) rotate([0,-90,0]) cylinder(d=3.5, h=5, $fn=30);

            translate([70+2,13.6,3.2]) rotate([0,-90,0]) cylinder(d=3.5, h=5, $fn=30);
            translate([70+2,100-9.2,3.2]) rotate([0,-90,0]) cylinder(d=3.5, h=5, $fn=30);
        }
        translate([10, 15/2, 0]) cylinder(d=2.5, h=5, $fn=30);
        translate([72-10, 15/2, 0]) cylinder(d=2.5, h=5, $fn=30);
        
        translate([10, 110-15/2, 0]) cylinder(d=2.5, h=5, $fn=30);
        translate([72-10, 110-15/2, 0]) cylinder(d=2.5, h=5, $fn=30);

    }
}

ssd_rack();