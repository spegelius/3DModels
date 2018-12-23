$fn=40;

include <common.scad>;

use <ssd_rack.scad>;

module leg() {
    difference() {
        union() {
            cylinder(d1=24, d2=12, h=20);
            translate([0,0,19.99]) cylinder(d=12.01, h=5);
            translate([-10/2,-13,0]) cube([10,26,8]);
            translate([-13,-10/2,0]) cube([26,10,8]);
        }
        cylinder(d=3, h=32);
        translate([0,0,4]) rotate([90,0,0]) cylinder(d=3, h=32,center=true);
        translate([0,0,4]) rotate([0,90,0]) cylinder(d=3, h=32,center=true);
    }
}

module card_plate() {
    rotate([-90,0,0]) difference() {
        union() {
            cube([150,2,133.8]);
            translate([0,-10,133.8-4]) cube([150,10,4]);
            for (i=[0:7]) {
                translate([4.4+i*card_spacing,-3,10]) cube([2,3,120]);
            }
        }
        for (i=[0:6]) {
            translate([8+i*card_spacing,-3,25]) cube([13.5,5,110]);
            translate([4.5+i*card_spacing,-3,133-6]) cylinder(d=3,h=7);
        }
        
        translate([9,0,4]) rotate([-90,0,0]) cylinder(d=4,h=3);
        translate([141-16.5+9,0,4]) rotate([-90,0,0]) cylinder(d=4,h=3);
        translate([21,-3,0]) cube([100,7,15]);
    }
}

module ssd_attachment(slot=1) {
    difference() {
        union() {
            if (slot == 1) {
                cube([122.5,10,3]);
            } else {
                translate([-20,0,0]) cube([162.5,10,3]);
            }
            translate([(122.5-72)/2-1.7,-40]) cube([74,10,2]);
            translate([(122.5-72)/2-1.7,-40.99]) cube([74.4,1,10]);

            translate([(122.5-72)/2-1.7,100-40-10]) cube([74,10,2]);

            translate([(122.5-72)/2-1.7, -40]) cube([2, 100,21]);
            translate([(122.5-72)/2+70.7, -40]) cube([2, 100,21]);
        }
        if (slot == 1) {
            rotate([0,0,45]) cube([16,16,10], center=true);
            translate([122.5,0,0]) rotate([0,0,45]) cube([16,16,10], center=true);
        } else {
            translate([-17,0,0]) rotate([0,0,45]) cube([16,16,10], center=true);
            translate([139.5,0,0]) rotate([0,0,45]) cube([16,16,10], center=true);
        }
        translate([(122.5-72)/2+1, -45+19.2, 6+1.4]) rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+1, 65-13.6, 6+1.4])  rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+72+3, -45+19.2, 6+1.4]) rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+72+3, 65-13.6, 6+1.4])  rotate([0,-90,0]) cylinder(d=3.5,h=5);

        translate([(122.5-72)/2+1, -45+19.2, 6+11]) rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+1, 65-13.6, 6+11])  rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+72+3, -45+19.2, 6+11]) rotate([0,-90,0]) cylinder(d=3.5,h=5);
        translate([(122.5-72)/2+72+3, 65-13.6, 6+11])  rotate([0,-90,0]) cylinder(d=3.5,h=5);
    }
    
    if (slot == 1) {
        translate([-6, 7]) difference() {
            cube([30,3,10]);
            translate([5,0,3.5]) rotate([-90,0,0]) cylinder(d=4,h=5);
        }
        translate([128.5-31, 7]) difference() {
            cube([30,3,10]);
            translate([26,0,3.5]) rotate([-90,0,0]) cylinder(d=4,h=5);
        }
    } else {
        translate([-22.5, 7]) difference() {
            cube([46.5,3,10]);
            translate([5,0,3.5]) rotate([-90,0,0]) cylinder(d=4,h=5);
        }
        translate([128-31, 7]) difference() {
            cube([46.5,3,10]);
            translate([43,0,3.5]) rotate([-90,0,0]) cylinder(d=4,h=5);
        }
    }
    //%translate([24,0,0]) ssd_rack();
    %translate([25.7,-39.5,14]) mock_ssd();
    %translate([25.7,-39.5,4.4]) mock_ssd();
}

module fixit() {
    difference() {
        cylinder(d=24,h=5,$fn=40);
        cylinder(d=4,h=6,$fn=40);
        translate([0,0,1.8]) cylinder(d=7.2,h=6,$fn=40);
    }
}

module view_proper() {
    %mock_mobo_card();
    
    translate([6.35+281.94,10.16,-25]) leg();
    translate([6.35+281.94,10.16+154.94,-25]) leg();
    translate([6.35+281.94,10.16+227.33,-25]) leg();

    translate([6.35+157.48+45.72,10,-25]) leg();

    translate([6.35+157.48,10.16,-25]) leg();
    translate([6.35+157.48,10.16+154.94,-25]) leg();
    translate([6.35+157.48,10.16+227.33,-25]) leg();

    translate([6.35,22.86,-25]) leg();
    translate([6.35,10.16+154.94,-25]) leg();
    translate([6.35,10.16+227.33,-25]) leg();

    translate([305-150,-4.2,-25]) rotate([90,0,0]) card_plate();
    
    translate([165,142,-25]) ssd_attachment();
    translate([23.75,139,-25]) ssd_attachment(slot=2);
}


//leg();
//card_plate();
//view_proper();
//ssd_attachment();
//ssd_attachment(slot=2);
fixit();
