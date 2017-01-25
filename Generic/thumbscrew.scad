ribs = 8;
rib_angle = 360/ribs;
rib_size = 5;
size=12;
//height = 5;
height = 4;

rib_pos = size/2 - rib_size/4;

nut_height = 2.4;
bolt_dia = 3.5;

nut_indent = true;
top_cone = true;

$fn=30;

module nut() {
    hull() {
        cylinder(d = 6.5, h=nut_height, $fn=6);
        translate([0, 0, nut_height]) cylinder(d = bolt_dia, h=1.2, $fn=20);
    }
}

module rib() {
    if (top_cone) {
        hull() {
            translate([rib_pos,0,0]) cylinder(d=rib_size, h=height/2, $fn=30);
            translate([rib_pos,0,height/2]) cylinder(d=rib_size/2, h=height/2, $fn=30);
        }
    } else {
        translate([rib_pos,0,0]) cylinder(d=rib_size, h=height, $fn=30);
    }
}

module body() {
    difference() {
        union() {
            if (top_cone) {
                hull() {
                    cylinder(d=size, h=height-height/3, $fn=30);
                    translate([0,0,height-height/5]) cylinder(d=size-size/8, h=height/5, $fn=60);
                }
            } else {
                cylinder(d=size, h=height, $fn=30);
            }
            for(pos=[0:ribs-1]) {
                rotate([0,0,pos*rib_angle]) rib();
            }
        }
        cylinder(d=bolt_dia, h=height);
        if (nut_indent) {
            translate([0,0,height-nut_height]) nut();
        }
    }
}

body();