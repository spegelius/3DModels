include <../lib/includes.scad>;

$fn=60;

module ver1() {
    intersection() {
        rotate([0,-90,0]) difference() {
            rounded_cube(25,34,10,3);
            translate([11,21,0]) {
                cylinder(d=11.5,h=15);
                translate([60/2,0,0]) cube([60,10.5,30], center=true);
                translate([0,0,(10-5)/2]) hull() {
                    cylinder(d=13,h=5);
                    translate([20,-5,0]) cylinder(d=34,h=5);
                }
            }
        }
        //translate([0,0,60/2]) cube([30,60,60], center=true);
    }
}

module ver2() {
    w = 25;
    l = 29;
    module clip() {
        difference() {
            hull() {
                cylinder(d=w-3,h=2);
                translate([-w/2, l-1,0]) cube([w,1,2]);
            }
            cylinder(d=12,h=3);
            translate([0,l/2,0]) cube([10.5,30,6], center=true);
            translate([-w/2+3.8,l-4,0]) cylinder(d=3.2,h=3);
            translate([w/2-3.8,l-4,0]) cylinder(d=3.2,h=3);
        }
    }
    
    //clip();
    //translate([-30,0,0]) clip();
    
    rotate([-90,0,0]) translate([30,-l,0]) {
        difference() {
            union() {
                translate([0,l/2,9/2]) cube([10.5,l,9], center=true);
                translate([0,l/2+1,9/2]) cube([w,l-2,4.5], center=true);
            }
            cylinder(d=12,h=9);
            translate([0,0,(9-4.5)/2]) cylinder(d=17,h=4.5);
            translate([-w/2+3.8,l-4,0]) cylinder(d=3.2,h=9);
            translate([w/2-3.8,l-4,0]) cylinder(d=3.2,h=9);
        }
    }
}


ver2();