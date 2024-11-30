//cube([5, 10, 0.3]);

intersection() {
    translate([0, 0, 7.5/2 - 0.7])
    rotate([90, 0, 0])
    cylinder(d=7.5, h=70, center=true, $fn=40);

    cylinder(d=100, h=20);
}