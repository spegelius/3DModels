use <../Dollo/NEW_long_ties/include.scad>;


//debug_blocky();
//debug_v4();

//saunakauha();
//saunakauha_blocky();
saunakauha_v4();


module debug_blocky() {
    intersection() {
        saunakauha_blocky();

        translate([100/2, 0, 0])
        cube([100, 200, 200], center=true);
    }
}

module debug_v4() {
    intersection() {
        saunakauha_v4();

        translate([100/2, 0, 0])
        cube([100, 200, 1000], center=true);
    }
}

module saunakauha() {
    translate([-78, -29, 257.243])
    rotate([-90, 0, 0])
    import("kauha2_meshmix.stl", convexity=10);
}

module _saunakauha_cup_form() {
    difference() {
        translate([0, -18, 80/2 + 3])
        sphere(d=80);

        saunakauha();
    }
}

module saunakauha_blocky() {

    module _bucket_added() {
        translate([0, 0, 42.05])
        rotate([-31.8, 0, 0])
        difference() {
            hull() {
                translate([0, -40, 0])
                scale([0.8, 1, 1])
                chamfered_cube(
                    130, 130, 130, 50, center=true
                );

                translate([0, -40 + 130/2 - 1/2, 0])
                cube([50, 1, 68], center=true);
            }

            translate([0, -100/2 - 20, 0])
            cube([200, 100, 200], center=true);
        }
    }

    module _bucket_removed() {
        translate([0, 0, 42.05])
        rotate([-31.8, 0, 0])
        hull() {
            translate([0, -40, 0])
            scale([0.8, 1, 1])
            chamfered_cube(
                123, 123, 123, 50, center=true
            );

            translate([0, -43 + 123/2 - 1/2, 0])
            scale([0.8, 1, 1])
            cube([40, 1, 65], center=true);
        }
    }

    module _handle() {
        difference() {
            translate([0, 31, 60 + 270/2])
            rotate([-5, 0, 0])
            intersection() {
                union() {
                    chamfered_cube_side(
                        21, 27, 270, 7, center=true
                    );

                    translate([0, 6, 100])
                    rotate([-5, 0, 0])
                    chamfered_cube_side(
                        21, 23, 115, 7, center=true
                    );
                }
                intersection() {
                    translate([0, 8, 0])
                    cube([25, 36, 270], center=true);

                    translate([0, 5, 0])
                    scale([1, 1.3, 1])
                    chamfered_cylinder(
                        36, 274, 10,
                        center=true, $fn=30
                    );
                }
            }

            union() {
                translate([0, 44, 305])
                rotate([0, 90, 0])
                cylinder(d=9, h=40, center=true, $fn=6);

                translate([9, 44, 305])
                rotate([0, 90, 0])
                cylinder(d1=9, d2=30, h=10, $fn=6);

                translate([-9, 44, 305])
                rotate([0, -90, 0])
                cylinder(d1=9, d2=30, h=10, $fn=6);
            }

        }
    }

    difference() {
        union() {
            _bucket_added();
            _handle();
        }
        _bucket_removed();
    }
}

module saunakauha_v4() {
    //%saunakauha_blocky();

    module _handle_v4_body() {
        union() {
            difference() {
                translate([0, 511.5, 210])
                rotate([0, 90, 0])
                rounded_cylinder(
                    1000, 22, 16, center=true, $fn=200
                );

                translate([0, 513, 195])
                rotate([0, 90, 0])
                cylinder(d=946, h=40, center=true, $fn=200);

                translate([3 + 10/2, 513, 195])
                rotate([0, 90, 0])
                cylinder(d=946 + 16, h=10, center=true, $fn=200);

                translate([-3 - 10/2, 513, 195])
                rotate([0, 90, 0])
                cylinder(d=946 + 16, h=10, center=true, $fn=200);
            }

            translate([3, 513, 195])
            rotate([0, 90, 0])
            donut(946 + 16, 16, $fn=200);

            translate([-3, 513, 195])
            rotate([0, 90, 0])
            donut(946 + 16, 16, $fn=200);
        }
    }

    module _handle_v4() {
        union() {
            intersection() {
                _handle_v4_body();

                hull() {
                    translate([0, 20, 350])
                    rotate([-17, 0, 0])
                    cube([100, 100, 1], center=true);

                    translate([0, 20, 113.8])
                    rotate([-35, 0, 0])
                    cube([100, 100, 1], center=true);
                }
            }

            intersection() {
                hull() {
                    translate([0, 511.5, 210])
                    rotate([-15.5, 0, 0])
                    translate([22/2 - 16/2, -1000/2 + 16/2, -1])
                    rounded_cylinder(
                        16, 10, 4.9, $fn=80
                    );

                    translate([0, 511.5, 210])
                    rotate([-15.5, 0, 0])
                    translate([-22/2 + 16/2, -1000/2 + 16/2, -1])
                    rounded_cylinder(
                        16, 10, 4.9, $fn=80
                    );

                    translate([0, 513, 195])
                    rotate([-17.17, 0, 0])
                    translate([22/2 - 16/2, -946/2 - 16/2, -1])
                    rounded_cylinder(
                        16, 10, 4.9, $fn=80
                    );

                    translate([0, 513, 195])
                    rotate([-17.17, 0, 0])
                    translate([-22/2 + 16/2, -946/2 - 16/2, -1])
                    rounded_cylinder(
                        16, 10, 4.9, $fn=80
                    );
                }

                translate([0, 20, 353.5])
                rotate([-17, 0, 0])
                cube([100, 100, 6], center=true);

                _handle_v4_body();
            }
        }
    }

    module _bucket() {
        difference() {
            rotate([-32, 0, 0])
            translate([0, -29.2, 46.5])
            scale([1, 1, 1.3])
            sphere(d=105, $fn=80);

            translate([0, 0, -20])
            cylinder(d=100, 20);

            difference() {
                rotate([-32, 0, 0])
                translate([0, -29.2, 46.5])
                scale([1, 1, 1.3])
                sphere(d=95, $fn=80);

                translate([0, 0, -16])
                cylinder(d=100, 20);

                translate([0, 20, 119.5])
                rotate([-39, 0, 0])
                cube([100, 100, 10], center=true);
            }

            translate([0, -108, 0])
            rotate([-32, 0, 0])
            cube([200, 100, 400], center=true);
        }
    }

    difference() {
        union() {
            _handle_v4();
            _bucket();
        }

        translate([0, 43, 330])
        union() {
            rotate([0, 90, 0])
            cylinder(d=9, h=40, center=true, $fn=30);

            translate([9, 0, 0])
            rotate([0, 90, 0])
            cylinder(d1=9, d2=30, h=10, $fn=30);

            translate([-9, 0, 0])
            rotate([0, -90, 0])
            cylinder(d1=9, d2=30, h=10, $fn=30);
        }

        intersection() {
            hull() {
                translate([0, 20, 340])
                rotate([-17, 0, 0])
                cube([100, 100, 1], center=true);

                translate([0, 20, 115])
                rotate([-35, 0, 0])
                cube([100, 100, 1], center=true);
            }

            translate([0, 513, 202])
            rotate([0, 90, 0])
            donut(1000 - 25, 3, $fn=200);
        }

        difference() {
            rotate([-32, 0, 0])
            translate([0, -78, 46.5])
            scale([1, 1, 1.3])
            sphere(d=120, $fn=80);

            translate([0, 28.9, 103])
            rotate([15, 0, 0])
            cube([100, 10, 50], center=true);
        }
    }
}
