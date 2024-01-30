use <../Dollo/NEW_long_ties/include.scad>;

w = 60;

spacer();


module spacer() {
    difference() {
        hull() {
            translate([-w/2 + 6/2, 17 - 6/2, 0])
            cylinder(d=6, h=11, $fn=20);

            translate([-w/2 + 6/2, 6/2, 0])
            cylinder(d=6, h=11, $fn=20);

            translate([w/2 - 8/2 + 9, 20 - 8/2, 0])
            cylinder(d=8, h=11, $fn=20);

            translate([w/2 - 6/2 + 9, 6/2, 0])
            cylinder(d=6, h=11, $fn=20);
        }

        // frame bolt holes
        translate([
            -(w - 20)/2, 17/2, 10 - 5.3
        ]) {

            cylinder(
                d=6.3, h=30,
                center=true, $fn=40
            );

            rotate([0, 0, 30])
            M6_nut(7);
        }

        translate([
            (w - 20)/2, 17/2, 11 - 5.7
        ]) {
            cylinder(
                d=6.3, h=30,
                center=true, $fn=40
            );

            rotate([0, 0, 30])
            M6_nut(7);
        }

        // stand bolt holes

        translate([
            -(w - 20)/2 + 11, 17/2, -1
        ]) {
            cylinder(
                d=6.3, h=30,
                center=true, $fn=40
            );

            rotate([0, 0, 30])
            M6_nut(
                6.6, cone=false, bridging=true
            );
        }

        translate([
            -((w - 20)/2 - 11), 17/2, 0
        ])
        rotate([0, 0, 3])
        translate([(w - 20)/2 - 11, -17/2, 0])
        translate([
            (w - 20)/2 + 11, 17/2, -1
        ]) {
            cylinder(
                d=6.3, h=30,
                center=true, $fn=40
            );

            rotate([0, 0, 27])
            M6_nut(
                6.6, cone=false, bridging=true
            );
        }
    }
}