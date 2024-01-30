use <../Dollo/NEW_long_ties/include.scad>;


speaker_mount();


module speaker_mount() {
    difference() {
        union() {
            translate([0, 3/2, 13/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                38, 13, 3, 2, center=true
            );

            translate([0, 30, 0])
            cylinder(d=26, h=11, $fn=30);

            translate([0, 20/2, 11/2])
            cube([13, 20, 11], center=true);
        }

        translate([0, 30, 0])
        cylinder(d=22, h=70, center=true, $fn=30);

        translate([0, 40, 0])
        cube([2, 10, 70], center=true);

        translate([-15, 0, 13/2])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        translate([-15, 2.2, 13/2])
        rotate([90, 0, 0])
        cylinder(d1=6.6, d2=3.3, h=1.9, center=true, $fn=30);

        translate([15, 0, 13/2])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        translate([15, 2.2, 13/2])
        rotate([90, 0, 0])
        cylinder(d1=6.6, d2=3.3, h=1.9, center=true, $fn=30);
    }
}