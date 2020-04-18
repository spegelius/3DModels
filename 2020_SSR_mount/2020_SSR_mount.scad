include <../Dollo/New_long_ties/globals.scad>;
use <../Dollo/New_long_ties/include.scad>;
use <../Dollo/New_long_ties/mockups.scad>;

module SSR_mount() {
    %translate([0,0,26]) rotate([0,180,0]) mock_SSR_75_DD();
    //translate([60,0,0]) rotate([0,180,0]) import("../_downloaded/SSR_cover/SSR-H-Cover_2020-FotekOriginal.stl");

    difference() {
        union() {
            difference() {
                // main form
                hull() {
                    translate([0,-8,1/2]) cube([50,80,1],center=true);
                    translate([0,-16,26-1/2]) cube([50,96,1],center=true);
                }
                translate([0,0,25/2+2]) cube([46,60,25],center=true);
                translate([0,0,4/2+23]) cube([46,63.3,4],center=true);

                translate([0,3.3/2+1,25/2+5]) cube([51,62,25],center=true);

                translate([0,-63.3/2+2/2,-4.7/2+26]) cube([10.2,2,4.7],center=true);
            }
            // bolt guides
            translate([0,60/2-6,21.3/2]) hull() {
                cylinder(d=9.5,h=21.5,center=true,$fn=40);
                translate([0,7,0]) cube([9.5,2,21.3],center=true);
            }

            translate([0,-60/2+6,21.3/2]) hull() {
                cylinder(d=9.5,h=21.3,center=true,$fn=40);
                translate([0,-8,0]) cube([9.5,2,21.3],center=true);
            }

            // top 2020 groove guide
            translate([0,-49,25+3/2]) cube([6,30,3],center=true);

        }

        // guide cutouts
        translate([0,60/2-6,22.5/2]) hull() {
            cylinder(d=7,h=22.5,center=true,$fn=40);
            translate([0,10,0]) cube([7,3,22.5],center=true);
        }

        translate([0,-60/2+6.5,21.5/2]) cylinder(d=3.5,h=25,$fn=25);
        translate([0,-60/2+6.5,0]) {
            M3_nut(12);
            cylinder(d1=9,d2=4,h=3,$fn=40);
        }

        // 2020 mount hole
        translate([0,-55,0]) {
            translate([0,0,21]) cylinder(d=4.3,h=9,$fn=40);
            cylinder(d=8.3,h=20.8,$fn=40);
            translate([0,0,26.001]) cylinder(d=12,h=9,$fn=40);
        }
        // connector screw holes
        translate([45.5/2-2.4-12.5/2,60/2-13/2,0]) cylinder(d=9,h=10,center=true,$fn=40);
        translate([-45.5/2+2.4+12.5/2,60/2-13/2,0]) cylinder(d=9,h=10,center=true,$fn=40);
        // led hole
        translate([45.5/2-11.3,60/2-21,0]) cylinder(d=10,h=10,center=true,$fn=40);

        // cable holes
        translate([45.5/2-2.4-12.5/2,-80/2,10]) rotate([90,0,0]) cylinder(d=8,h=40,center=true,$fn=40);
        translate([-45.5/2+2.4+12.5/2,-80/2,10]) rotate([90,0,0]) cylinder(d=8,h=40,center=true,$fn=40);

        // zip tie holes
        translate([45.5/2-2.4-12.5/2,-85/2,10/2]) cube([10,5,10],center=true);
        translate([-45.5/2+2.4+12.5/2,-85/2,10/2]) cube([10,5,10],center=true);
    }
    
    translate([45.5/2-2.4-12.5/2,-85/2,6/2]) rotate([90,0,0]) cylinder(d=6,h=8,center=true,$fn=40);
    translate([-45.5/2+2.4+12.5/2,-85/2,6/2]) rotate([90,0,0]) cylinder(d=6,h=8,center=true,$fn=40);
}

module debug() {
    intersection() {
        SSR_mount();
        translate([0,-50,0]) cube([100,100,100]);
    }
}

//debug();

SSR_mount();
