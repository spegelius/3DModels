use <../Dollo/NEW_long_ties/include.scad>;

w = 60;

spacer();

module spacer() {
    difference() {
        hull() {
            translate([-w/2 + 1/2, 15/2, 11/2])
            cube([1, 15, 11], center=true);

            translate([w/2 - 1/2 + 8, 18/2, 11/2])
            cube([1, 18, 11], center=true);
        }

        // frame bolt holes
        translate([-(w - 20)/2, 15/2, 10 - 5.3]) {
            cylinder(d=6.3, h=30, center=true, $fn=40);

            rotate([0, 0, 30])
            M6_nut(6);
        }

        translate([(w - 20)/2, 15/2, 11 - 5.7]) {
            cylinder(d=6.3, h=30, center=true, $fn=40);

            rotate([0, 0, 30])
            M6_nut(6);
        }

        // stand bolt holes

        translate([-(w - 20)/2 + 11, 15/2, -1]) {
            cylinder(d=6.3, h=30, center=true, $fn=40);

            rotate([0, 0, 30])
            M6_nut(6.5, cone=false, bridging=true);
        }

        translate([-((w - 20)/2 - 11), 15/2, 0])
        rotate([0, 0, 3])
        translate([(w - 20)/2 - 11, -15/2, 0])
        translate([(w - 20)/2 + 11, 15/2, -1]) {
            cylinder(d=6.3, h=30, center=true, $fn=40);

            rotate([0, 0, 30])
            M6_nut(6.5, cone=false, bridging=true);
        }
    }
}