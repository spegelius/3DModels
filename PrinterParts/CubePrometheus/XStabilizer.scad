include <../../Dollo/NEW_Long_ties/include.scad>;


//_orig_rail();

//XStabilizer_new();
XStabilizer_Bearing_new();


module _orig_rail() {
    import(
        "XStabilizer.stl", convexity=10
    );
}

module _orig_bearing() {
    import(
        "XStabilizer_Bearing.stl", convexity=10
    );
}

module XStabilizer_new() {
    difference() {
        scale([1.9, 1, 1])
        translate([0, 1 + 50/2])
        intersection() {
            _orig_rail();

            translate([0, -51/2, 0])
            cube([100, 51, 40], center=true);
        }

        difference() {
            translate([-190/2 - 5, 15, 0])
            cube([30, 30, 30], center=true);

            translate([-190/2 + 120/2 - 0.2, -5])
            cylinder(d=120, h=30, center=true, $fn=120);
        }

        translate([-190/2 + 18.6, 50/2 - 17.5, 0])
        cylinder(d=6.3, h=20, center=true, $fn=40);

        translate([-190/2 + 18.6 + 72.2, 50/2 - 15, 0])
        cylinder(d=6.3, h=20, center=true, $fn=40);

        translate([-190/2 + 18.6 + 72.2 + 89.5, 50/2 - 16.8, 0])
        cylinder(d=6.3, h=20, center=true, $fn=40);
    }

//    %translate([-190/2, -50/2 + 2.5, 10])
//    cube([1, 3, 1], center=true);
}

module XStabilizer_Bearing_new() {
    %translate([0, 0, 1.5])
    _orig_bearing();

    difference() {
        union() {
            hull() {
                translate([-17, 1.5, 0])
                cylinder(d=12, h=5, $fn=40);

                translate([-17, -10.5, 0])
                cylinder(d=12, h=5, $fn=40);

                translate([0, -10.5, 0])
                cylinder(d=12, h=5, $fn=40);

                translate([9.5, 8.5/2 - 1, 5/2])
                cube([3, 8.5, 5], center=true);
            }

            translate([2.75, 8.5/2 - 1, 16/2])
            cube([16.5, 8.5, 16], center=true);

            translate([-0.2, -9.9, 0])
            cylinder(d=6.5, h=9.6, $fn=40);

            translate([-0.2 - 16, -9.9, 0])
            cylinder(d=6.5, h=9.6, $fn=40);
        }

        translate([4.1, 4, 9])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([4.1, -1.8, 9])
        rotate([90, 0, 0])
        cylinder(d=6, h=4, center=true, $fn=30);

        hull() {
            translate([4.1, 14, 9])
            rotate([-90, 0, 0])
            cylinder(d=5.3, h=20, center=true, $fn=30);

            translate([4.1, 14, 0])
            cube([5.5, 20, 1], center=true);
        }

        difference() {
            translate([6.6, 3.6, 0])
            cube([20, 2, 40], center=true);

            translate([-5, 0, 17.5])
            rotate([0, 45, 0])
            cube([10, 30, 10], center=true);
        }

        translate([-0.2, -9.9, 0])
        cylinder(d=4.2, h=60, center=true, $fn=40);

        translate([-0.2 - 16, -9.9, 0])
        cylinder(d=4.2, h=60, center=true, $fn=40);

        translate([-0.2, -9.9, 0])
        M4_nut(cone=false, bridging=true);

        translate([-0.2 - 16, -9.9, 0])
        M4_nut(cone=false, bridging=true);

    }
}