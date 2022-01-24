use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
t_stl_path = str(
    stl_base_path,
    "CR-10 S5/Y_Axis_Tensioner/"
);



debug();
//debug_backplate();
//new_base();
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

//    translate([0, 20/2, 20/2])
//    rotate([90, 0, 0])
//    new_base();

    translate([0, -45, 22])
    rotate([-90, 90, 0])
    new_puller();

//    translate([0, -54, 26])
//    rotate([-90, -90, 00])
//    new_backplate();
}

module debug_backplate() {
    new_backplate();

    translate([4, 0, 5])
    new_puller();
}


module new_base() {
    fname = "Revised_Base_B.stl";

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
            translate([0, 20, 24.5])
            rotate([0, -90, -90])
            import(
                str(t_stl_path, fname),
                convexity=10
            );

            translate([-35.5, 0, 10])
            rotate([-90, 0, 0])
            cylinder(d=15, h=5);

            translate([35.5, 0, 10])
            rotate([-90, 0, 0])
            cylinder(d=15, h=5);

            hull() {
                translate([-35.5, -20/2, 20 - 10])
                rounded_cylinder(
                    20, 15, 4, $fn=40
                );

                translate([35.5, -20/2, 20 - 10])
                rounded_cylinder(
                    20, 15, 4, $fn=40
                );

            }

            hull() {

                translate([
                    -45.5 + 4/2, -20/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, -20/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, -20/2,
                    20/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, -20/2,
                    18
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, 5 - 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, 5 - 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, 5 - 4/2,
                    10
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, 5 - 4/2,
                    18
                ])
                sphere(d=4, $fn=60);
            }

            mirror([1, 0, 0])
            hull() {

                translate([
                    -45.5 + 4/2, -20/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, -20/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, -20/2,
                    20/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, -20/2,
                    18
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, 5 - 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, 5 - 4/2,
                    25 - 4/2
                ])
                sphere(d=4, $fn=60);

                translate([
                    -45.5 + 4/2, 5 - 4/2,
                    10
                ])
                sphere(d=4, $fn=60);

                translate([
                    -13.75, 5 - 4/2,
                    18
                ])
                sphere(d=4, $fn=60);
            }

            difference() {
                hull() {
                    translate([-23.5, 8, 55])
                    sphere(d=4, $fn=40);

                    translate([-23.5, 7, 26 - 4/2])
                    sphere(d=4, $fn=40);

                    translate([
                        -23.5, -20 + 4/2,
                        25 - 4/2
                    ])
                    sphere(d=4, $fn=40);

                    translate([23.5, 8, 55])
                    sphere(d=4, $fn=40);

                    #translate([23.5, 7, 26 - 4/2])
                    sphere(d=4, $fn=40);

                    translate([
                        23.5, -20 + 4/2,
                        25 - 4/2
                    ])
                    sphere(d=4, $fn=40);
                }
                cube([23.5, 60, 200], center=true);
            }

            translate([-25.5 + 3/2, 16, 40])
            cube([3, 13, 30], center=true);

            translate([25.5 - 3/2, 16, 40])
            cube([3, 13, 30], center=true);
        }

        translate([0, -40/2, 0])
        cube([200, 40.02, 40], center=true);

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

        translate([0, -30/2 + 1, 0])
        cube([23.5, 30, 200], center=true);

        translate([0, 26.7, 23.9])
        rotate([45, 0, 0])
        cube([70, 10, 10], center=true);
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

    difference() {
        union() {
            intersection() {
                translate([4, 0, 0.566])
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                cylinder(d=100, h=2);
            }

            translate([4, 0, 1.99 - 1])
            intersection() {
                translate([0, 0, 0.566])
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                translate([0, 0, 1])
                cylinder(d=100, h=2);
            }

            translate([4, 0, 1.99 + 2 - 3])
            intersection() {
                translate([0, 0, 0.566])
                import(
                    str(t_stl_path, fname),
                    convexity=10
                );

                translate([0, 0, 3])
                cylinder(d=100, h=2);
            }
        }

        translate([0, 0, 10/2 + 3])
        rounded_cube(
            19, 27, 10, 2, center=true, $fn=40
        );
    }
}