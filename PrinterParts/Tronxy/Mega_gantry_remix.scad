use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;

use <common.scad>;
use <../../Generic/washers.scad>;

module _long_nut() {
    hull() {
        rotate([0,0,360/6/2]) M4_nut(h=3.4, cone=false);
        translate([0,6,0]) rotate([0,0,360/6/2]) M4_nut(h=3.4, cone=false);
    }
}

module _long_hole() {
    d = 5.3;
    hull() {
        translate([0,-0.5,32.1]) cylinder(d=d,h=1,$fn=60);
        translate([0,0.5,32.1]) cylinder(d=d,h=1,$fn=60);
        cylinder(d=d,h=1,$fn=60);
    }
}

module tronxy_mega_gantry_left() {

    difference() {
        intersection() {
            translate([0,-4.5,-88.55]) import("../../_downloaded/Tronxy_X5S_Mega_gantry_plates/x5s_y_l_plate_r1.STL", convexity=5);
            translate([24,0,0]) cube([113,131,50],center=true);
        }

        translate([-34,-68,0]) rotate([0,0,45]) cube([10,10,100],center=true);
        translate([-8.5,-68,0]) rotate([0,0,45]) cube([10,10,100],center=true);

        translate([-37,0,0]) rotate([0,45,0]) cube([10,200,10],center=true);
        translate([82,0,0]) rotate([0,45,0]) cube([10,200,10],center=true);
        translate([78,0,0]) rotate([0,45,0]) cube([10,80,10],center=true);
        translate([0,68,0]) rotate([45,0,0]) cube([200,10,10],center=true);

        translate([-31.8,-13,14.55]) rotate([0,90,0]) cylinder(d=8,h=2,$fn=40,center=true);
        translate([-31.8,-58,14.55]) rotate([0,90,0]) cylinder(d=8,h=2,$fn=40,center=true);

        translate([-23,51.5,-21]) _long_hole();
        translate([-23,51.5,0]) cylinder(d1=10,d2=5,h=2.5,$fn=60);
        translate([-23,65.5,6]) rotate([90,0,0]) cylinder(d=4.2,h=13,$fn=40);
        translate([-23,60.5,6]) rotate([90,0,0]) _long_nut();

        translate([67,51.5,-21]) _long_hole();
        translate([67,51.5,0]) cylinder(d1=10,d2=5,h=2.5,$fn=60);
        translate([67,65.5,6]) rotate([90,0,0]) cylinder(d=4.2,h=13,$fn=40);
        translate([67,60.5,6]) rotate([90,0,0]) _long_nut();

        translate([-23,11.35,0]) cylinder(d1=10,d2=5,h=2.5,$fn=60);
        translate([65,11.35,0]) cylinder(d1=10,d2=5,h=2.5,$fn=60);

        // infill
        translate([-18,0,3.5]) cube([0.1,200,0.25],center=true);
        translate([17,0,3.5]) cube([0.1,200,0.25],center=true);
        translate([53,0,3.5]) cube([0.1,200,0.25],center=true);
    }
}

module tronxy_mega_gantry_right() {
    mirror([0,1,0]) tronxy_mega_gantry_left();
}

module bridge_cylinder() {
    h = 3;
    intersection() {
        union() {
            cylinder(d=9.1,h=h,$fn=60);
            translate([0,0,(h+0.2)/2]) cube([5.3,9.1,h+0.2],center=true);
            translate([0,0,(h+0.4)/2]) cube([5.3,5.3,h+0.4],center=true);
        }
        cylinder(d=9.1,h=h+0.4,$fn=60);
    }
}

module _top_bearing_support() {
    $fn=40;
    d = 11.5;

    module pylon() {
        union() {
            cylinder(d=d,h=29.5);
            translate([0,0,29.5-0.1]) cylinder(d1=10,d2=5,h=2.5,$fn=60);
        }
    }

    difference() {
        union() {
            hull() {
                translate([67,56,0]) cylinder(d=d,h=5);
                translate([-23,56,0]) cylinder(d=d,h=5);
            }
            hull() {
                translate([-23,16,0]) cylinder(d=d,h=5);
                translate([65,16,0]) cylinder(d=d,h=5);
            }
            hull() {
                translate([67,56,0]) cylinder(d=d,h=5);
                translate([65,16,0]) cylinder(d=d,h=5);
            }
            hull() {
                translate([-23,56,0]) cylinder(d=d,h=5);
                translate([-23,16,0]) cylinder(d=d,h=5);
            }

            translate([67,56,0]) pylon();
            translate([-23,56,0]) pylon();
            translate([65,16,0]) pylon();
            translate([-23,16,0]) pylon();

            translate([23,16,0]) cylinder(d=7,h=5.5,$fn=40);

            translate([23,16+40/2,5/2]) cube([d,40,5],center=true);
        }
        translate([67,56,0]) {
            _long_hole();
            bridge_cylinder();
        }
        translate([-23,56,0]) {
            _long_hole();
            bridge_cylinder();
        }
        translate([23,16,0]) {
            cylinder(d=5.2,h=45,$fn=40);
            bridge_cylinder();
        }
        translate([-23,16,0]) {
            cylinder(d=5.2,h=45,$fn=40);
            bridge_cylinder();
        }
        translate([65,16,0]) {
            cylinder(d=5.2,h=45,$fn=40);
            bridge_cylinder();
        }

        // custom infill
        translate([63,56,-1]) cylinder(d=0.1,h=45,$fn=10);
        translate([-19,56,-1]) cylinder(d=0.1,h=45,$fn=40);
        translate([65,20,-1]) cylinder(d=0.1,h=45,$fn=40);
        translate([-23,20,-1]) cylinder(d=0.1,h=45,$fn=40);
        
        translate([23,0,2]) cube([0.1,100,0.2]);
    }
}

module top_bearing_support_left() {
    _top_bearing_support();
}

module top_bearing_support_right() {
    rotate([0,0,180])
    mirror([1,0,0])
    _top_bearing_support();
}

module debug() {
    tronxy_mega_gantry_left();
    translate([0,-4.65,-29.5]) top_bearing_support_left();
    %translate([23,16-4.65,-12]) mock_bearing();
    %translate([23,16-4.65,-24]) mock_bearing();
    translate([23,16-4.65,-13]) washer_8_5_1();
    translate([23,16-4.65,-1]) washer_8_5_1();
}

debug();

//tronxy_mega_gantry_left();
//translate([0,-130,0]) tronxy_mega_gantry_right();
//tronxy_mega_gantry_right();

//top_bearing_support_right();
//top_bearing_support_left();
//washer_8_5_1();