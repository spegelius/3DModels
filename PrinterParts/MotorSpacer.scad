
side = 41;
corner_d = 10;
corner = side - corner_d;
h = 1.4;

$fn=50;

difference() {
    hull() {
        translate([corner/2, corner/2,0])
        cylinder(d=corner_d,h=h);

        translate([-corner/2, corner/2,0])
        cylinder(d=corner_d,h=h);

        translate([corner/2, -corner/2,0])
        cylinder(d=corner_d,h=h);

        translate([-corner/2, -corner/2,0])
        cylinder(d=corner_d,h=h);
    }
    
    translate([-31/2, 31/2,-0.1])
    cylinder(d=3.3,h=h+1);

    translate([-31/2, -31/2,-0.1])
    cylinder(d=3.3,h=h+1);

    translate([31/2, -31/2,-0.1])
    cylinder(d=3.3,h=h+1);

    translate([31/2, 31/2,-0.1])
    cylinder(d=3.3,h=h+1);
    
    translate([0,0,-0.1])
    cylinder(d=30, h=h+1);
}