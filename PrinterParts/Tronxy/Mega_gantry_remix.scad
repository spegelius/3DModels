use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;

module _long_nut() {
    hull() {
        rotate([0,0,360/6/2]) M4_nut(h=3.4, cone=false);
        translate([0,6,0]) rotate([0,0,360/6/2]) M4_nut(h=3.4, cone=false);
    }
}

module _long_hole() {
    d = 5.3;
    hull() {
        translate([0,-0.1,0]) cylinder(d=d,h=40,center=true,$fn=60);
        translate([0,0.1,0]) cylinder(d=d,h=40,center=true,$fn=60);
    }
}

module tronxy_mega_gantry_left() {

    
    difference() {
        translate([0,0,-88.6]) import("../../_downloaded/Tronxy_X5S_Mega_gantry_plates/x5s_y_l_plate_r1.STL", convexity=3);
        translate([-23,56,6]) _long_hole();
        translate([-23,70,6]) rotate([90,0,0]) cylinder(d=4.2,h=13,$fn=40);
        translate([-23,65,6]) rotate([90,0,0]) _long_nut();
        
        translate([67,56,6]) _long_hole();
        translate([67,70,6]) rotate([90,0,0]) cylinder(d=4.2,h=13,$fn=40);
        translate([67,65,6]) rotate([90,0,0]) _long_nut();
    }
}

module tronxy_mega_gantry_right() {
    
    difference() {
        translate([0,0,113.2]) import("../../_downloaded/Tronxy_X5S_Mega_gantry_plates/x5s_y_r_plate_r1.STL", convexity=3);
        translate([-23,-51.515,6]) _long_hole();
        translate([-23,-52.5,6]) rotate([90,0,0]) cylinder(d=4.2,h=13,$fn=40);
        translate([-23,-57,6]) rotate([90,0,0]) _long_nut();
        
        translate([67,-51.515,6]) _long_hole();
        translate([67,-52.5,6]) rotate([90,0,0]) cylinder(d=4.2,h=13,$fn=40);
        translate([67,-57,6]) rotate([90,0,0]) _long_nut();
    }
}

//tronxy_mega_gantry_left();
tronxy_mega_gantry_right();