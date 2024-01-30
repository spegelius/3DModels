use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
t_stl_path = str(
    stl_base_path,
    "CR-10 S5/Y_Axis_Tensioner/"
);



//debug();
//debug_backplate();
//_new_base_support_form();

//new_base();
//new_base_soluble_supports();
new_base_nonsoluble_supports();

//new_puller();
//new_backplate();


module debug() {

    // 2020 beam
    %cube([200, 20, 20], center=true);

    // idler
    %translate([0, -28, 26])
    rotate([0, 90, 0])
    difference() {
        cylinder(d=16, h=14, center=true, $fn=30);

        cylinder(d=4, h=24, center=true, $fn=30);
    }

    translate([0, 20/2, 20/2])
    rotate([90, 0, 0])
    new_base();

    translate([0, -45, 22])
    rotate([-90, 90, 0])
    new_puller();

//    translate([0, -54, 26])
//    rotate([-90, -90, 00])
//    new_backplate();
}

module debug_backplate() {
    new_backplate();

    translate([4, 0, 6])
    new_puller();
}

module _support_form(w, l, h, top=1, bottom=0.25) {

    slot_w = w - 0.5;
    slot_l = l - 0.5;
    slot_h = h - top - bottom;

    slots = floor(slot_l/6);
    echo(slots);
    slot = (slot_l - slots*0.5 - 0.5)/slots;
    echo(slot);
    
    difference() {
        translate([0, 0, h/2])
        cube([slot_w, slot_l, h], center=true);

        translate([0, -l/2 + 0.5 + slot/2, slot_h/2 + bottom])
        for(i = [0: slots -1]) {
            translate([
                i%2 ? 0.5 : -0.5, i*(slot + 0.5), 0
            ])
            cube([slot_w, slot, slot_h], center=true);
        }
    }

    translate([0, 0, h - top/2])
    cube([w, l, top], center=true);
}

module new_base() {
    fname = "Revised_Base_B.stl";

//    %translate([0, -20/2, 20/2])
//    cube([200, 20, 20], center=true);
    
    module _mount_hole() {
        cylinder(
            d=5.3, h=20,
            center=true, $fn=30
        );

        translate([0, 0, 3])
        cylinder(d1=11, d2=15, h=3, $fn=30);
    }

    difference() {
        union() {

            difference() {
                translate([0, 20, 24.5])
                rotate([0, -90, -90])
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                translate([0, 30/2 + 4.9, 25/2 - 0.95])
                cube([62, 30, 25], center=true);

                translate([0, 30/2, 0])
                cube([62, 30, 25], center=true);
            }

            translate([-18.625, 10/2 + 4, 13.5])
            cube([13.75, 18, 23], center=true);

            translate([18.625, 10/2 + 4, 13.5])
            cube([13.75, 18, 23], center=true);

            hull() {
                translate([-35.5, 5, 20 - 10])
                rotate([90, 0, 0])
                rounded_cylinder(
                    20, 30, 4, $fn=40
                );

                translate([35.5, 5, 20 - 10])
                rotate([90, 0, 0])
                rounded_cylinder(
                    20, 30, 4, $fn=40
                );
            }

            // 2020 cody
            hull() {

                translate([
                    -45.5 + 4/2, -25 + 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    45.5 - 4/2, -25 + 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, -25 + 4/2,
                    20/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    45.5 - 4/2, -25 + 4/2,
                    20/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, 5 - 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    45.5 - 4/2, 5 - 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, 5 - 4/2,
                    20/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    45.5 - 4/2, 5 - 4/2,
                    20/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, 5 - 4/2,
                    18
                ])
                sphere(d=4, $fn=60);
            }

            // arms
            difference() {
                hull() {
                    translate([-23.5, 8, 58])
                    sphere(d=4, $fn=40);

                    translate([-23.5, 7, 26 - 4/2])
                    sphere(d=4, $fn=40);

                    translate([
                        -23.5, -25 + 4/2,
                        25 - 4/2
                    ])
                    sphere(d=4, $fn=40);

                    translate([23.5, 8, 58])
                    sphere(d=4, $fn=40);

                    translate([23.5, 7, 26 - 4/2])
                    sphere(d=4, $fn=40);

                    translate([
                        23.5, -25 + 4/2,
                        25 - 4/2
                    ])
                    sphere(d=4, $fn=40);
                }
                cube([23.5, 60, 200], center=true);
            }

            translate([-25.5 + 8/2, 16, 40])
            cube([8, 13, 30], center=true);

            translate([25.5 - 8/2, 16, 40])
            cube([8, 13, 30], center=true);
        }

        // beam cutout
        translate([0, -20/2, 0])
        cube([200, 20.1, 40], center=true);

        translate([-35.5, -20/2, 20])
        _mount_hole();

        translate([35.5, -20/2, 20])
        _mount_hole();

        translate([-35.5, 0, 20/2])
        rotate([-90, 0, 0])
        _mount_hole();

        translate([35.5, 0, 20/2])
        rotate([-90, 0, 0])
        _mount_hole();

        translate([-25.5, -20, 20/2])
        rotate([90, 0, 0])
        _mount_hole();

        translate([25.5, -20, 20/2])
        rotate([90, 0, 0])
        _mount_hole();

        // chamfer for bed clearance
        translate([0, 26.7, 23.9])
        rotate([45, 0, 0])
        cube([70, 15, 15], center=true);

        hull() {
            translate([0, 19.2, 20])
            rotate([0, 90, 0])
            cylinder(d=10, h=65, center=true, $fn=50);

            translate([0, 22, 20])
            rotate([0, 90, 0])
            cylinder(d=10, h=65, center=true, $fn=50);

            translate([0, 9.72, 0])
            rotate([0, 90, 0])
            cylinder(d=10, h=65, center=true, $fn=50);

            translate([0, 20, 4])
            rotate([0, 90, 0])
            cylinder(d=10, h=65, center=true, $fn=50);
        }
    }
}

module _new_base_support_form() {

    //%new_base();

    translate([0, -10, 0])
    rotate([0, 0, 90])
    _support_form(19.6, 92, 20, top=1, bottom=0.25);

}

module new_base_soluble_supports() {
    intersection() {
        _new_base_support_form();

        translate([0, 0, 20 - 0.5/2])
        cube([100, 100, 0.5], center=true);
    }
}

module new_base_nonsoluble_supports() {
    difference() {
        _new_base_support_form();

        new_base_soluble_supports();
    }
}


module new_puller() {
    fname = "Puller.stl";

    difference() {
        union() {
            intersection() {
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                cylinder(d=70, h=2);
            }

            translate([0, 0, 1.99])
            intersection() {
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                cylinder(d=70, h=8);
            }

            translate([0, 0, 1.99 + 8 - 10.02])
            intersection() {
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                translate([0, 0, 10])
                cylinder(d=70, h=20);
            }
        }

        translate([-4, 0, 2.6])
        M5_nut();

        translate([0, 19, 0])
        rotate([45, 0,0])
        cube([30, 10, 10], center=true);

        translate([0, -19, 0])
        rotate([45, 0,0])
        cube([30, 10, 10], center=true);

        translate([11, 0, 0])
        rotate([0, 45, 0])
        cube([10, 30, 10], center=true);

        translate([-19, 0, 0])
        rotate([0, 45, 0])
        cube([10, 30, 10], center=true);

    }
}

module new_backplate() {
    fname = "Backplate.stl";

    module _orig_plate() {
        translate([4, 0, 0.566])
        import(
            str(t_stl_path, fname),
            convexity=10
        );
    }
    
    difference() {
        union() {
            intersection() {
                _orig_plate();

                translate([-0.8, 0, 2/2])
                rounded_cube_side(
                    22.4, 55, 2, 4, center=true, $fn=30
                );
            }

            translate([0, 0, 1.99 - 1])
            intersection() {
                _orig_plate();

                translate([-0.8, 0, 1 + 2/2])
                rounded_cube_side(
                    22.4, 55, 2, 4, center=true, $fn=30
                );
            }


            translate([0, 0, 1.99 + 1])
            intersection() {
                _orig_plate();

                translate([-0.8, 0, 1 + 1/2])
                rounded_cube_side(
                    22.4, 55, 1, 4, center=true, $fn=30
                );
            }

            translate([0, 0, 1.99 + 3 - 3])
            intersection() {
                _orig_plate();

                translate([-0.8, 0, 3 + 2/2])
                rounded_cube_side(
                    22.4, 55, 2, 4, center=true, $fn=30
                );
            }
        }

        translate([0, 0, 10/2 + 4])
        rounded_cube(
            19, 27, 10, 2, center=true, $fn=40
        );
    }
}