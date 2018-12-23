height = 12;
diameter = 6.7;
hole_diameter = 3.5;

$fn=100;

difference() {
    cylinder(d=diameter, h=height);
    cylinder(d=hole_diameter, h=height);
}