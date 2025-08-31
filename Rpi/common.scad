use <../Dollo/NEW_long_ties/include.scad>;


_mock_camera_v13();


module _mock_camera_v13() {
    difference() {
        union() {
            color("green")
            translate([0, 0, 1/2])
            cube([25, 24, 1], center=true);

            color("white")
            translate([0, -24/2 + 6.2/2, -3.3/2 + 0.8])
            cube([22, 6.1, 3.3], center=true);

            color("darkslategrey")
            translate([0, -24/2 + 8.7/2 + 6, 4.3/2 + 0.2])
            cube([8.7, 8.7, 4.3], center=true);

            color("darkslategrey")
            translate([0, -24/2 + 8.7/2 + 6, 0.2])
            cylinder(d=7, h=6, $fn=30);

            translate([0, 24/2 - 5/2 - 0.7, 2.3/2 + 0.2])
            cube([8, 5, 2.3], center=true);
        }

        translate([-10.5, 10, 0])
        cylinder(d=2.5, h=10, center=true, $fn=30);

        translate([10.5, 10, 0])
        cylinder(d=2.5, h=10, center=true, $fn=30);

        // some cameras have the lower holes 0.5mm closer together
        translate([-10.5, -2, 0])
        cylinder(d=2.5, h=10, center=true, $fn=30);

        translate([10.5, -2, 0])
        cylinder(d=2.5, h=10, center=true, $fn=30);
    }
}