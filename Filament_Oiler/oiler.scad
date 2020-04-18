use <../Dollo/NEW_long_ties/include.scad>;
include <../Dollo/NEW_long_ties/globals.scad>;
use <../lib/includes.scad>;

d = 22;

module _form() {
    union() {
        cylinder(d=d,h=10,$fn=40);
        translate([0,0,10]) cylinder(d1=d,d2=9,h=(d-9)/2,$fn=50);
    }
}

module _half() {
    ratio = (d-4)/d;
    union() {
        difference() {
            _form();
            scale([ratio,ratio,0.9]) _form();
        }
        translate([0,0,15.5]) cylinder(d=9,h=5,$fn=50);
    }
}

module top() {
    difference() {
        _half();
        translate([0,0,14.8]) cylinder(d1=9,d2=2.4,h=2.4,$fn=40);
        translate([0,0,14.8]) cylinder(d=2.4,h=10,$fn=30);
        translate([0,0,18]) cylinder(d=4.2,h=10,$fn=40);
        
        translate([0,0,-1]) intersection() {
            cylinder(d1=d-5+2*8,d2=d-5,h=8,$fn=50);
            v_screw(h=8, screw_d=d-2, pitch=2, direction=0, steps=50);
        }
    }
}

module bottom() {
    rotate([0,180,0]) union() {
        difference() {
            _half();
            translate([0,0,14.8]) cylinder(d1=3.4,d2=2.4,h=1.2,$fn=40);
            translate([0,0,14.8]) cylinder(d=2.4,h=10,$fn=30);
            translate([0,0,16.4]) cylinder(d2=4.2,d1=2.4,h=1.8,$fn=40);
            translate([0,0,18.2]) cylinder(d=4.2,h=10,$fn=40);
            
            translate([d/2-3,0,12]) rotate([0,45,0]) cylinder(d1=3,d2=10,h=5,$fn=50,center=true);
        }
        translate([0,0,-6]) intersection() {
            difference() {
                v_screw(h=8, screw_d=(d-2)-3*slop, pitch=2, direction=0, steps=50);
                cylinder(d=d-7,h=20,$fn=40,center=true);
                translate([0,0,7]) cylinder(d1=d-7,d2=d-5,h=1.01,$fn=50);
            }
            union() {
                translate([0,0,1]) cylinder(d=(d-2)-3*slop,h=7,$fn=50);
                cylinder(d2=(d-2)-3*slop,d1=(d-2)-3*slop-2,h=1,$fn=50);
            }
        }
    }
}


//top();
bottom();