include <../lib/includes.scad>;
$fn=60;

module preload() {
    rounded_cube_side(25,25,25,7);
}

module destring() {

    translate([-30,0,0]) cylinder(d=10, h=40);
    cylinder(d=10, h=40);
    translate([40,0,0]) cylinder(d=10, h=40);
}

module seam_example() {
    intersection() {
        preload();
        cube([30,30,0.2]);
    }
}

module preload_10mm() {
    intersection() {
        preload();
        cube([30,30,10]);
    }
}
//preload();
//destring();
//seam_example();
//preload_10mm();

module numbered(number) {
    difference() {
        preload_10mm();
        translate([25/2,25/2,10-1]) linear_extrude(1) text(str(number), halign="center", valign="center", size=16, font="Arial", style="Bold");
    }
}

//numbered(1);
//numbered(2);
//numbered(3);
//numbered(4);
//numbered(5);
//numbered(6);
//numbered(7);
//numbered(8);
//numbered(9);
numbered(10);
//numbered(11);
//numbered(12);
//numbered(13);
//numbered(14);
//numbered(15);
//numbered(16);
//numbered(17);
//numbered(18);
//numbered(19);
//numbered(20);
