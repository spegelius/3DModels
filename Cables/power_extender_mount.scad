
use <../Dollo/NEW_long_ties/include.scad>;

module _form(h=15) {
    hull() {
        cube([53.2,13.5,h],center=true);
        cube([47,40,h],center=true);
    }
}

difference() {
    rounded_cube_side(62,47,15,5,center=true,$fn=80);

    translate([0,7/2+0.1,0])
    difference() {
        _form(16);

        translate([-47/2-1,40/2-2,0])
        cylinder(d=3,h=17,center=true,$fn=20);

        translate([47/2+1,40/2-2,0])
        cylinder(d=3,h=17,center=true,$fn=20);
    }

    rotate([90,0,0])
    cylinder(d=4.5,h=60,center=true);

    rotate([90,0,0])
    cylinder(d=9,h=39.5,center=true);

}