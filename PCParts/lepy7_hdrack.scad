
include <common.scad>;
use <hdrack.scad>;

module rack(disks) {
    height = disks*hd_height + disks*3 + 2;

    module main () {
        intersection () {
            difference() {
                translate([(hd_width+4)/2,87,0]) rotate([0,0,45]) cube([200,200,height]);
                translate([(hd_width+4)/2,90.5,0]) rotate([0,0,45]) cube([196,196,height]);
            }
            translate([-(124-(hd_width+4))/2,140,0])  cube([124,22,height]);
        }
        
        
        difference() {
            translate([-(124-(hd_width+4))/2,149,0]) cube([124,12,height]);
            translate([-(120.1-(hd_width+4))/2,148,0]) cube([120.1,16,height]);
        }
        difference() {
            translate([-(140-(hd_width+4))/2,160,0]) cube([140,2,height]);
            translate([-(120.1-(hd_width+4))/2,160,0]) cube([120.1,2,height]);
        }
    }
    
    hd_rack(disks, spacing=3, closed=false);
    difference() {
        
        main();
        translate([1.9,0,1]) cube([hd_width+0.2, 160, height]);

        translate([-(132-(hd_width+4))/2,160,10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        translate([-(132-(hd_width+4))/2,160,height-10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        translate([132-(132-(hd_width+4))/2,160,10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        translate([132-(132-(hd_width+4))/2,160,height-10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        
        translate([-(132-(hd_width+4))/2,145,10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
        translate([-(132-(hd_width+4))/2,145,height-10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
        translate([132-(132-(hd_width+4))/2,145,10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
        translate([132-(132-(hd_width+4))/2,145,height-10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
    }
}

module fix_it() {
    $fn=40;
    difference() {
        cube([80,15,9]);
        translate([0,0,7]) cube([80,10,3]);
        translate([8,15/2,0]) cylinder(d=4, h=12);
        translate([80-8,15/2,0]) cylinder(d=4, h=12);
        translate([80/2,15/2,0]) cylinder(d=4, h=12);
    }
}

//translate([hd_width + 1.9,-10,29]) rotate([0,180,0]) %mock_hd();

rack(6);

// fix model for design mistake
//fix_it();