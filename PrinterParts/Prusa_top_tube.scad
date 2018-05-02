
include <../lib/includes.scad>;

$fn=40;

difference() {
    cube([20, 25, 4]);
    translate([4,3,0]) cylinder(d=3.2, h=5);
    translate([4,25-3,0]) cylinder(d=3.2, h=5);
    translate([20-3.8,25/2,0]) cylinder(d=4, h=5);
    translate([20-3.8,25/2,4-m4_nut_height]) rotate([0,0,360/12]) M4_nut();
}