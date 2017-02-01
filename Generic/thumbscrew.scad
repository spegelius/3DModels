
nut_height = 2.4;
bolt_dia = 3.5;

nut_indent = true;

$fn=30;

module nut() {
    hull() {
        cylinder(d = 6.5, h=nut_height, $fn=6);
        translate([0, 0, nut_height]) cylinder(d = bolt_dia, h=1.2, $fn=20);
    }
}

module rib(rib_size, rib_pos, height, top_cone) {
    if (top_cone) {
        hull() {
            translate([rib_pos,0,0]) cylinder(d=rib_size, h=height/2, $fn=30);
            translate([rib_pos,0,height/2]) cylinder(d=rib_size/2, h=height/2, $fn=30);
        }
    } else {
        translate([rib_pos,0,0]) cylinder(d=rib_size, h=height, $fn=30);
    }
}

module body(ribs=8, rib_size=5, size=15, height=4, top_cone=true) {

    rib_angle = 360/ribs;
    rib_pos = size/2 - rib_size/4;
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
                rotate([0,0,pos*rib_angle]) rib(rib_size, rib_pos, height, top_cone);
            }
        }
        translate(0,0,-0.5) cylinder(d=bolt_dia, h=height+1);
        if (nut_indent) {
            translate([0,0,height-nut_height]) nut();
        }
    }
}

module thunbscrew_with_body() {
    body();
    translate([0,0,-16]) difference() {
        cylinder(d=6, h=16);
        translate([0,0,-0.5]) cylinder(d=bolt_dia, h=17);
    }
}

//body();
body(ribs=9, rib_size=3, size=10, height=11, top_cone=false);
    