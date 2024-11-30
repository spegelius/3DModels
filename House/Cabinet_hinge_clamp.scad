use <../Dollo/NEW_long_ties/include.scad>;


//_mock_hinge();


//hinge_clamp_1();
hinge_clamp_2();


module _mock_hinge() {
    difference() {
        union() {
            intersection() {
                hull() {
                    translate([0, 68/2 - 1/2, 0])
                    cylinder(d=1, h=20, $fn=20);

                    translate([0, -68/2 + 1/2, 0])
                    cylinder(d=1, h=20, $fn=20);

                    translate([28, 0, 0])
                    cylinder(d=1, h=20, $fn=20);

                    translate([
                        20.5 - 4/2, -65.5/2 + 4/2, 0
                    ])
                    cylinder(d=4, h=20, $fn=20);

                    translate([
                         20.5 - 4/2, 65.5/2 - 4/2, 0
                    ])
                    cylinder(d=4, h=20, $fn=20);

                    translate([
                        18.5 - 6/2, -67/2 + 6/2, 0
                    ])
                    cylinder(d=6, h=20, $fn=20);

                    translate([
                        18.5 - 6/2, 67/2 - 6/2, 0
                    ])
                    cylinder(d=6, h=20, $fn=20);
                }

                translate([-220/2 + 25, 0, 0])
                cylinder(d=220, h=30, $fn=120);

                hull() {
                    translate([0.1/2, 0, 0.1/2])
                    rotate([90, 0, 0])
                    cylinder(
                        d=0.1, h=70, center=true, $fn=10
                    );

                    translate([2/2 + 0.9, 0, 8 - 2/2])
                    rotate([90, 0, 0])
                    cylinder(
                        d=2, h=70, center=true, $fn=20
                    );

                    translate([
                        25 - 0.1/2, 0, 2.7 - 0.1/2
                    ])
                    rotate([90, 0, 0])
                    cylinder(
                        d=0.1, h=70, center=true, $fn=10
                    );

                    translate([25 - 0.1/2, 0, 0.1/2])
                    rotate([90, 0, 0])
                    cylinder(
                        d=0.1, h=70, center=true, $fn=10
                    );
                }
            }
            translate([25 - 35/2 - 6, 0, -10])
            cylinder(d=35, h=10, $fn=30);
        }

        intersection() {
            translate([25 - 45/2 - 6.5, 0, 0])
            cylinder(d=45, h=20, $fn=50);

            cube([60, 24, 40], center=true);
        }

        intersection() {
            translate([25 - 45/2 - 6, 0, 0])
            cylinder(d=45, h=20, $fn=50);

            cube([60, 24, 40], center=true);
        }
    }
}

module screw_hole() {
    cylinder(d=3, h=30, center=true, $fn=20);

    hull() {
        translate([0, 0, -30])
        cylinder(d=3, h=35, $fn=30);

        translate([0, 0, -30])
        cylinder(d=6.1, h=33.4, $fn=30);
    }
}

module hinge_clamp() {

    intersection() {
        difference() {
            hull() {
                translate([-14, 0, 0])
                rotate([0, -12.88, 0])
                cylinder(d=35, h=10, $fn=50);

                translate([2, 0, 5/2])
                rotate([90, 0, 0])
                cylinder(d=5, h=72, center=true, $fn=40);

                translate([8, 0, 12.5])
                cube([0.1, 72, 4], center=true);

                translate([-16, 30])
                rotate([0, -12.88, 0])
                cylinder(d=10, h=10, $fn=30);

                translate([-16, -30])
                rotate([0, -12.88, 0])
                cylinder(d=10, h=10, $fn=30);
            }

            translate([0, 0, 10.25])
            rotate([0, -12.88, 0])
            cylinder(d=200, h=30);

            translate([0, 0, 8.26 + 2])
            rotate([0, 167.12, 0])
            scale([1.01, 1.01, 1])
            _mock_hinge();

            translate([0, 0, 8.63 + 2])
            rotate([0, 167.12, 0])
            intersection() {
                translate([25 - 45/2 - 6, 0, 0])
                cylinder(
                    d=46.6, h=60, center=true, $fn=50
                );

                cube([60, 24.4, 60], center=true);
            }

            translate([-27, 0, -3])
            rotate([0, -12.88, 0])
            screw_hole();

            translate([5.5, 25, 5.3])
            rotate([0, -12.88, 0])
            screw_hole();

            translate([5.5, -25, 5.3])
            rotate([0, -12.88, 0])
            screw_hole();
        }

        cylinder(d=300, h=40);
    }

    %translate([-0.1, 0, 8.26 + 2])
    rotate([0, 167.12, 0])
    _mock_hinge();
}

module hinge_clamp_2() {

    intersection() {
        difference() {
            hull() {
                translate([-14, 0, 0])
                rotate([0, -12.88, 0])
                intersection() {
                    cylinder(d=35, h=10, $fn=50);

                    translate([-20, 0, 0])
                    cube([40, 40, 20], center=true);
                }

                translate([-0.5, 0, 2/2])
                rotate([90, 0, 0])
                cylinder(d=2, h=72, center=true, $fn=40);

                translate([-1, 0, 12.5])
                cube([0.1, 72, 4], center=true);

                translate([-16, 30])
                rotate([0, -12.88, 0])
                cylinder(d=10, h=10, $fn=30);

                translate([-16, -30])
                rotate([0, -12.88, 0])
                cylinder(d=10, h=10, $fn=30);

                translate([-4, 37])
                rotate([0, -12.88, 0])
                cylinder(d=10, h=10, $fn=30);

                translate([-4, -37])
                rotate([0, -12.88, 0])
                cylinder(d=10, h=10, $fn=30);
            }

            translate([0, 0, 9.25])
            rotate([0, -12.88, 0])
            cylinder(d=200, h=30);

            translate([0, 0, 8.26 + 1])
            rotate([0, 167.12, 0])
            scale([1.01, 1.01, 1])
            _mock_hinge();

            translate([0, 0, 8.63 + 1])
            rotate([0, 167.12, 0])
            intersection() {
                translate([25 - 45/2 - 6, 0, 0])
                cylinder(
                    d=46.6, h=60, center=true, $fn=50
                );

                cube([60, 24.4, 60], center=true);
            }

            translate([-27, 0, -3])
            rotate([0, -12.88, 0])
            screw_hole();

            translate([-4, 37.5, 1])
            rotate([0, -12.88, 0])
            screw_hole();

            translate([-4, -37.5, 1])
            rotate([0, -12.88, 0])
            screw_hole();
        }

        cylinder(d=300, h=40);
    }

    %translate([-0.1, 0, 8.26 + 1])
    rotate([0, 167.12, 0])
    _mock_hinge();
}