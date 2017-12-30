$fn=40;

include <common.scad>;

use <ssd_rack.scad>;

%mock_mobo_card();

module leg() {
    difference() {
        union() {
            cylinder(d1=24, d2=12, h=15);
            translate([0,0,15]) cylinder(d=12, h=5);
            translate([-10/2,-13,0]) cube([10,12,8]);
        }
        cylinder(d=3, h=22);
        translate([0,0,4]) rotate([90,0,0]) cylinder(d=3, h=22);
    }
}

module card_plate() {
    rotate([-90,0,0]) difference() {
        union() {
            cube([150,2,128.8]);
            translate([0,-10,128.8-4]) cube([150,10,4]);
            for (i=[0:7]) {
                translate([4.4+i*card_spacing,-3,10]) cube([2,3,115]);
            }
        }
        for (i=[0:6]) {
            translate([8+i*card_spacing,-3,20]) cube([13.5,5,110]);
            translate([4.5+i*card_spacing,-3,128-6]) cylinder(d=3,h=7);
        }
        
        translate([9,0,4]) rotate([-90,0,0]) cylinder(d=4,h=3);
        translate([141-16.5+9,0,4]) rotate([-90,0,0]) cylinder(d=4,h=3);
        translate([21,-3,0]) cube([100,7,10]);
    }
}

module ssd_attachment() {
    difference() {
        union() {
            cube([122.5,10,3]);
            translate([(122.5-72)/2-2.2, -45]) cube([2, 110,13]);
            translate([(122.5-72)/2+71.2, -45]) cube([2, 110,13]);
        }
        rotate([0,0,45]) cube([16,16,10], center=true);
        translate([122.5,0,0]) rotate([0,0,45]) cube([16,16,10], center=true);
        translate([(122.5-72)/2, -45+19.2, 6+3.4]) rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2, 65-13.6, 6+3.4])  rotate([0,-90,0]) cylinder(d=3.5,h=5);
        #translate([(122.5-72)/2+72+3, -45+19.2, 6+3.4]) rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+72+3, 65-13.6, 6+3.4])  rotate([0,-90,0]) cylinder(d=3.5,h=5);

    }
    translate([-6, 7]) difference() {
        cube([20,3,10]);
        #translate([5,0,3.5]) rotate([-90,0,0]) cylinder(d=4,h=5);
    }
    translate([128.5-20, 7]) difference() {
        cube([20,3,10]);
        #translate([15,0,3.5]) rotate([-90,0,0]) cylinder(d=4,h=5);
    }
    //%translate([24,0,0]) ssd_rack();
}


module view_proper() {
    translate([350-16.5, 10, -20]) leg();
    translate([350-141, 10, -20]) leg();

    translate([350-16.5,193-27.7,-20]) leg();
    translate([350-141,193-27.7, -20]) leg();

    translate([6.3,33.2, -20]) leg();
    translate([6.3,193-27.7, -20]) leg();


    translate([350-150,-4.2,-20]) rotate([90,0,0]) card_plate();
    
    translate([307.2,207,-16.5]) rotate([0,0,180]) ssd_rack();
    
    translate([210,142,-19.5]) ssd_attachment();
}


//leg();
//card_plate();
//view_proper();
ssd_attachment();