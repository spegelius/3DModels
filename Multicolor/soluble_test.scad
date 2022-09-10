
//soluble_test_1();
//soluble_test_1_support();
//soluble_test_1_soluble_support();

//soluble_test_2_p1();
//soluble_test_2_p2();
//soluble_test_2_supports();
soluble_test_2_soluble_supports();

module soluble_test_1() {

    difference() {
        union() {
            cylinder(d=60, h=4, $fn=80);

            cylinder(d=15, h=10, $fn=40);

            translate([0, 0, 9])
            cylinder(d=60, h=4, $fn=80);
        }
        cylinder(d=4, h=15, $fn=20);
    }
}

module soluble_test_1_support() {
    difference() {
        translate([0, 0, 4.2])
        cylinder(d=60, h=4.4, $fn=80);

        cylinder(d=15.4, h=20, $fn=40);

        cube([0.4, 100, 100], center=true);
    }
}

module soluble_test_1_soluble_support() {
    color("silver")
    difference() {
        translate([0, 0, 4])
        cylinder(d=60, h=0.2, $fn=80);

        cylinder(d=15, h=20, $fn=40);
    }

    color("silver")
    difference() {
        translate([0, 0, 9 - 0.4])
        cylinder(d=60, h=0.4, $fn=80);

        cylinder(d=15, h=20, $fn=40);
    }
}


s2_h = 35;

module soluble_test_2_p1() {

    difference() {
        union() {
            translate([30/2 + 3, 0, s2_h/2])
            cube([10, 10, s2_h], center=true);

            translate([-30/2 - 3, 0, s2_h/2])
            cube([10, 10, s2_h], center=true);

            translate([30/2 + 3, 0, s2_h/2])
            cube([10, s2_h, 10], center=true);

            translate([-30/2 - 3, 0, s2_h/2])
            cube([10, s2_h, 10], center=true);
        }

        soluble_test_2_p2();
    }
}

module soluble_test_2_p2() {
    translate([0, 0, s2_h/2])
    sphere(d=30, $fn=40);
}

module soluble_test_2_supports() {
    c_h = (s2_h  - 10)/2 - 0.4;

    // cross supports
    module _cross_support() {
        union() {
            difference() {
                translate([-30/2 - 3, 0, c_h/2])
                cube([10, s2_h, c_h], center=true);

                translate([-30/2 - 3, 0, 0])
                cube([11, 10.6, 25], center=true);

                translate([-30/2 - 3, 0, 0])
                cube(
                    [9.2, s2_h - 0.8, s2_h - 10 - 2],
                    center=true
                );
            }
            translate([
                -30/2 - 3 - 10/2 + 1/2,
                10/2 + 1/2 + 0.3, 0
            ])
            cylinder(d=1, h=c_h, $fn=20);

            translate([
                -30/2 - 3 + 10/2 - 1/2,
                10/2 + 1/2 + 0.3, 0
            ])
            cylinder(d=1, h=c_h, $fn=20);

            translate([
                -30/2 - 3 - 10/2 + 1/2,
                -10/2 - 1/2 - 0.3, 0
            ])
            cylinder(d=1, h=c_h, $fn=20);

            translate([
                -30/2 - 3 + 10/2 - 1/2,
                -10/2 - 1/2 - 0.3, 0
            ])
            cylinder(d=1, h=c_h, $fn=20);
        }
    }

    module _sphere_support() {
        intersection() {
            difference() {
                cylinder(d=28, h=10, $fn=30);

                translate([0, 0, 2])
                cylinder(d=10, h=20, $fn=30);

                translate([0, 0, 3])
                cylinder(d=15, h=20, $fn=30);

                translate([0, 0, 4])
                cylinder(d=18, h=20, $fn=30);

                translate([0, 0, 5])
                cylinder(d=20.3, h=20, $fn=30);

                translate([0, 0, 6])
                cylinder(d=22.2, h=20, $fn=30);

                translate([0, 0, 7])
                cylinder(d=24, h=20, $fn=30);

                translate([0, 0, 8])
                cylinder(d=26, h=20, $fn=30);

                translate([0, 0, 9])
                cylinder(d=29, h=20, $fn=30);
            }

            translate([0, 0, 0])
            cube([25.4, 40, 50], center=true);
        }
    }
    
     _cross_support();

     mirror([1, 0, 0])
     _cross_support();

     _sphere_support();
}

module soluble_test_2_soluble_supports() {
    module _cross_soluble_support() {
        color("silver")
        difference() {
            translate([-30/2 - 3, 0, s2_h/2 - 10/2 - 0.4/2])
            cube([10, s2_h, 0.4], center=true);

            translate([-30/2 - 3, 0, 0])
            cube([11, 10, 40], center=true);
        }
    }

    module _sphere_soluble_support() {
        color("silver")
        intersection() {
            difference() {
                translate([0, 0, 1])
                cylinder(d=27.8, h=7.8, $fn=30);

                soluble_test_2_p2();

                soluble_test_2_supports();
            }

            translate([0, 0, 0])
            cube([25.3, 40, 50], center=true);
        }
    }
    
    _cross_soluble_support();

    mirror([1, 0, 0])
    _cross_soluble_support();

    _sphere_soluble_support();
}