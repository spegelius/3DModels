
include <../Dollo/NEW_long_ties/include.scad>;

module prusa_shroud_hanger_hook() {
    difference() {
        hull() {
            cube([11,1,8], center=true);
            translate([0,14,0]) rotate([0,90,0]) cylinder(d=8,h=11,center=true,$fn=30);
        }
        translate([0,6.3+18/2,0]) cube([7,18,8],center=true);
        translate([0,4,0]) rotate([-90,0,0]) nut();
        rotate([-90,30,0]) cylinder(d=3.7, h=8, center=true, $fn=6);
        translate([0,14,0]) rotate([0,90,0]) cylinder(d=3.7, h=18, center=true, $fn=6);
    }
}

module prusa_shroud_hanger_beam() {
    l = 110;
    difference() {
        hull() {
            translate([-l/2,0,0]) cylinder(d=8,h=2,$fn=40);
            translate([l/2,0,0]) cylinder(d=8,h=2,$fn=40);
        }
        translate([-l/2,0,0]) cylinder(d=3.3,h=2,$fn=40);
        translate([l/2,0,0]) cylinder(d=3.3,h=2,$fn=40);
    }
}

//prusa_shroud_hanger_hook();
prusa_shroud_hanger_beam();