use <../Dollo/NEW_long_ties/include.scad>;

use <Saunakauha.scad>;

_support_form();
//debug();

//supports_soluble();
//supports_nonsoluble();


module debug() {
    intersection() {
        saunakauha();

        translate([100/2, 0, 500/2])
        cube([100, 100, 500], center=true);
    }

    %_support_form();
    supports_soluble();
}



module _support_form() {

    module _cup_support_form() {
        intersection() {
            translate([0, -6, 43])
            rotate([90, 0, 0])
            cylinder(d=79, h=30, center=true, $fn=50);

            translate([0, -19, 63])
            cylinder(d=64, h=50, $fn=50);
        }
    }

    difference() {
        union() {
            difference() {
                translate([0, 2, 10/2])
                cube([88, 44, 10], center=true);

                translate([0, -5, 10/2 + 2])
                cube([50, 31, 10], center=true);
            }

            //translate([0, -13, 1.8/2])
            //cube([88, 46, 1.8], center=true);

            translate([0, -20, 1.8/2])
            cube([88, 6, 1.8], center=true);

            translate([0, -27, 0.5/2])
            cube([44, 19, 0.5], center=true);

            _cup_support_form();

            hull() {
                translate([0, 0, 63])
                linear_extrude(1)
                projection()
                _cup_support_form();

                translate([0, -8, 58.5])
                cube([25, 26, 1], center=true);

                translate([0, -9, 58.5])
                cube([40, 24, 1], center=true);

                translate([0, -16, 58.5])
                cube([55, 10, 1], center=true);
            }

            hull() {
                translate([-55/2 + 0.6/2, -16, 58])
                cube([0.6, 10, 0.1], center=true);

                translate([-20, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([55/2 - 0.6/2, -16, 58])
                cube([0.6, 10, 0.1], center=true);

                translate([20, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([-40/2 + 0.6/2, -9, 58])
                cube([0.6, 24, 0.1], center=true);

                translate([-15, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([40/2 - 0.6/2, -9, 58])
                cube([0.6, 24, 0.1], center=true);

                translate([15, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([-25/2 + 0.6/2, -8, 58])
                cube([0.6, 26, 0.1], center=true);

                translate([-10, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([25/2 - 0.6/2, -8, 58])
                cube([0.6, 26, 0.1], center=true);

                translate([10, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([-4 + 0.6/2, -8, 58])
                cube([0.6, 26, 0.1], center=true);

                translate([-3.5, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([4 + 0.6/2, -8, 58])
                cube([0.6, 26, 0.1], center=true);

                translate([3.5, -30, 0.1/2])
                cube([0.6, 10, 0.1], center=true);
            }

            hull() {
                translate([0, -35, 1/2])
                cube([41, 0.6, 1], center=true);

                translate([0, -20.5, 58.5])
                cube([55, 0.6, 1], center=true);
            }

            translate([0, -20, 30])
            cube([47.3, 0.6, 3], center=true);

            translate([0, -6, 50])
            cube([38.2, 0.6, 3], center=true);
        }

        saunakauha();

        intersection() {
            hull() {
                translate([0, -19, 63.5])
                cylinder(d=53, h=4, center=true, $fn=30);

                translate([0, -19, 63])
                cylinder(d=48, h=8, center=true, $fn=30);

                translate([0, -19, 73.3])
                cylinder(
                    d=34, h=0.1, center=true, $fn=30
                );

                translate([0, -19, 77])
                cylinder(
                    d=14, h=0.1, center=true, $fn=30
                );

                translate([0, -19, 78])
                cylinder(
                    d=3, h=0.1, center=true, $fn=30
                );
            }

            difference() {
                translate([0, -8, 0])
                cube([100, 30, 200], center=true);

                cube([0.6, 200, 300], center=true);

                translate([-5, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([5, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([-11, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([11, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([-17, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([17, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([-23, 0, 0])
                cube([0.6, 200, 300], center=true);

                translate([23, 0, 0])
                cube([0.6, 200, 300], center=true);
            }
        }
    }
}

module supports_soluble() {
    intersection() {
        _support_form();

        union() {
            difference() {
                translate([0, 1, 12/2 - 0.1])
                rounded_cube(
                    85, 44, 12, 2, center=true, $fn=30
                );

                translate([0, -20, 10])
                cube([45, 20, 10], center=true);
            }

            difference() {
                translate([0, -19, 63.5])
                cylinder(d=65, h=40);

                intersection() {
                    hull() {
                        translate([0, -19, 63.5])
                        cylinder(
                            d=57, h=4, center=true, $fn=30
                        );

                        translate([0, -19, 73.5])
                        cylinder(
                            d=38, h=0.1, center=true, $fn=30
                        );

                        translate([0, -19, 78.5])
                        cylinder(
                            d=18, h=0.1, center=true, $fn=30
                        );

                        translate([0, -19, 79.5])
                        cylinder(
                            d=7, h=0.1, center=true, $fn=30
                        );
                    }
                    translate([0, -7, 0])
                    cube([100, 30, 200], center=true);
                }
            }
        }
    }
}

module supports_nonsoluble() {
    render()
    difference() {
        _support_form();

        supports_soluble();
    }
}