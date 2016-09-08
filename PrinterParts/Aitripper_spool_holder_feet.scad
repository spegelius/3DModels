
$fn=30;

difference() {
    cube([10, 100, 4]);
    hull() {
        translate([5, 7, 0]) cylinder(d=3.5, h=4);
        translate([5, 35, 0]) cylinder(d=3.5, h=4);
    }
    hull() {
        translate([5, 65, 0]) cylinder(d=3.5, h=4);
        translate([5, 93, 0]) cylinder(d=3.5, h=4);
    }
    hull() {
        translate([5, 7, 2]) cylinder(d=5.8, h=4);
        translate([5, 35, 2]) cylinder(d=5.8, h=4);
    }
    hull() {
        translate([5, 65, 2]) cylinder(d=5.8, h=4);
        translate([5, 93, 2]) cylinder(d=5.8, h=4);
    }

}