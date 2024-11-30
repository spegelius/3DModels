use <../Dollo/NEW_long_ties/include.scad>;


DGS_1008D_mount();


module DGS_1008D_mount() {
    difference() {
        union() {
            translate([0, 0, 2/2])
            cube([15, 132, 2], center=true);

            translate([0, 0, 6/2])
            cube([2, 132, 6], center=true);

            hull() {
                translate([-18, 132/2, 0])
                cylinder(d=12, h=10, $fn=40);

                translate([18, 132/2, 0])
                cylinder(d=12, h=10, $fn=40);
            }

            hull() {
                translate([-18, -132/2, 0])
                cylinder(d=12, h=10, $fn=40);

                translate([18, -132/2, 0])
                cylinder(d=12, h=10, $fn=40);
            }
        }

        translate([0, 132/2, 0])
        cylinder(d=3.8, h=40, center=true, $fn=30);

        translate([0, -132/2, 0])
        cylinder(d=3.8, h=40, center=true, $fn=30);

        rotate([0, 0, 5])
        translate([0, 132/2, 0])
        cylinder(d=2, h=40, center=true, $fn=30);
    }
}