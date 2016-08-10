ribs = 12;
rib_angle = 360/ribs;
rib_size = 2.5;
size=10;
height = 5;

rib_pos = size/2 - rib_size/4;

$fn=30;

module nut() {
    hull() {
        cylinder(d = 6.5, h=2.4, $fn=6);
        translate([0,0,2.4]) cylinder(d = 3.2, h=1.2, $fn=20);
    }
}

module rib() {
    translate([rib_pos,0,0]) cylinder(d=rib_size, h=height, $fn=30);
}


difference() {
    union() {
        cylinder(d=size, h=height, $fn=30);
        for(pos=[0:ribs-1]) {
            rotate([0,0,pos*rib_angle]) rib();
        }
    }
    cylinder(d=3.2, h=5);
    translate([0,0,height-2.4]) nut();
}