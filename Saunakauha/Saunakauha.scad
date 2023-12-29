use <../Dollo/NEW_long_ties/include.scad>;


//debug_blocky();

//%saunakauha();
saunakauha_blocky();


module debug_blocky() {
    intersection() {
        saunakauha_blocky();

        translate([100/2, 0, 0])
        cube([100, 200, 200], center=true);
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