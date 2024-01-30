use <../Dollo/NEW_long_ties/include.scad>;

include <../Watercooling/common.scad>;


//debug();

lepy7_radiator_mount();


module debug() {
    mock_radiator_420();

    translate([70.5, -207, 9.5])
    rotate([90, 0, 0])
    lepy7_radiator_mount();
}

module lepy7_radiator_mount() {
    difference() {
        intersection() {
            cube([28, 57 + 6, 14], center=true);

            rotate([90, 0, 0])
            cylinder(d=26, h=100, center=true, $fn=60);
        }

        translate([-25 + 14.5, 3, 0])
        cube([25, 57 + 6, 16], center=true);
        
        translate([25 - 5, -3, 0])
        cube([25, 57 + 6, 16], center=true);

        translate([-25/2 + 4, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=3.4, h=100, center=true, $fn=30);

        translate([-25/2 + 4, -57/2 - 3, 0])
        rotate([90, 0, 0])
        cylinder(d1=3.4, d2=6.7, h=2, center=true, $fn=30);

        translate([25/2 - 4, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=3.4, h=100, center=true, $fn=30);

        translate([25/2 - 4, 58/2 - 20/2, 0])
        rotate([90, 0, 0])
        cylinder(d2=4, d1=8.5, h=20, center=true, $fn=30);

        translate([25/2 - 4, -4, 0])
        rotate([90, 0, 0])
        cylinder(d=6, h=58, center=true, $fn=30);
    }
}