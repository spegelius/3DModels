use <../../Dollo/NEW_long_ties/include.scad>;


//ace_pro_back_roller();
//ace_pro_front_roller();
//kobra_s1_bed_frame();
//kobra_s1_bed();
kobra_s1_back_wall();


module ace_pro_back_roller() {
    difference() {
        union() {
            cylinder(d=9, h=75.6, $fn=30);

            translate([0, 0, 0.5])
            cylinder(d=16, h=1.4, $fn=40);

            translate([0, 0, 75.5 - 1.4])
            cylinder(d=16, h=1.4, $fn=40);

            translate([0, 0, 0.5])
            cylinder(d=11.8, h=75, $fn=40);
        }
        cylinder(d=3, h=200, center=true, $fn=30);

        cylinder(d=7, h=28, center=true, $fn=30);

        translate([0, 0, 75.6])
        cylinder(d=7, h=28, center=true, $fn=30);
    }
}

module ace_pro_front_roller() {
    union() {
        cylinder(d=3, h=82.5, $fn=30);

        translate([0, 0, 82.5/2])
        cylinder(d=5.5, h=40, center=true, $fn=40);

        translate([0, 0, 5])
        cylinder(d=11, h=26, $fn=40);

        translate([0, 0, 82.5 - 5 - 26])
        cylinder(d=11, h=26, $fn=40);

        // bearings
        translate([0, 0, 0.2])
        cylinder(d=7, h=3, $fn=30);

        translate([0, 0, 82.5 - 0.2 - 3])
        cylinder(d=7, h=3, $fn=30);
    }
}

module kobra_s1_bed_frame() {

    module _main_form() {
        union() {
            intersection() {
                translate([0, -265/2 + 28/2, 10/2])
                rounded_cube(
                    310, 28, 10, 4, center=true, $fn=60
                );

                cube([300, 265, 10], center=true);
            }

            intersection() {
                translate([0, -265/2 + 216/2, 10/2])
                rounded_cube(
                    222, 216, 10, 4, center=true, $fn=60
                );

                cube([300, 265, 10], center=true);
            }

            intersection() {
                translate([0, 265/2 - 100/2 + 5, 10/2])
                rounded_cube(
                    28, 100, 10, 4, center=true, $fn=60
                );

                cube([300, 265, 10], center=true);
            }


            translate([
                222/2 + 26/2 - 4/2,
                -265/2 + 28 + 26/2 - 4/2, 4/2
            ])
            rotate([0, 0, 225])
            donut(26, 4, angle=360/4, $fn=60);

            translate([
                -222/2 - 26/2 + 4/2,
                -265/2 + 28 + 26/2 - 4/2, 4/2
            ])
            rotate([0, 0, -45])
            donut(26, 4, angle=360/4, $fn=60);

            translate([
                28/2 + 34/2 - 4/2,
                -265/2 + 216 + 34/2 - 4/2, 4/2
            ])
            rotate([0, 0, 225])
            donut(34, 4, angle=360/4, $fn=60);

            translate([
                -28/2 - 34/2 + 4/2,
                -265/2 + 216 + 34/2 - 4/2, 4/2
            ])
            rotate([0, 0, -45])
            donut(34, 4, angle=360/4, $fn=60);

            difference() {
                translate([222/2, -265/2 + 28, 5/2])
                cube([22, 22, 5], center=true);

                translate([222/2 + 22/2, -265/2 + 28 + 22/2, -1])
                cylinder(d=26, h=4/2 + 1.01, $fn=60);

                translate([222/2 + 22/2, -265/2 + 28 + 22/2, 4/2])
                cylinder(d=22, h=5, $fn=60);
            }

            mirror([1, 0, 0])
            difference() {
                translate([222/2, -265/2 + 28, 5/2])
                cube([22, 22, 5], center=true);

                translate([222/2 + 22/2, -265/2 + 28 + 22/2, -1])
                cylinder(d=26, h=4/2 + 1.01, $fn=60);

                translate([222/2 + 22/2, -265/2 + 28 + 22/2, 4/2])
                cylinder(d=22, h=5, $fn=60);
            }

            difference() {
                translate([28/2, -265/2 + 216, 5/2])
                cube([30, 30, 5], center=true);

                translate([28/2 + 30/2, -265/2 + 216 + 30/2, -1])
                cylinder(d=34, h=4/2 + 1.01, $fn=60);

                translate([28/2 + 30/2, -265/2 + 216 + 30/2, 4/2])
                cylinder(d=30, h=5, $fn=60);
            }

            mirror([1, 0, 0])
            difference() {
                translate([28/2, -265/2 + 216, 5/2])
                cube([30, 30, 5], center=true);

                translate([28/2 + 30/2, -265/2 + 216 + 30/2, -1])
                cylinder(d=34, h=4/2 + 1.01, $fn=60);

                translate([28/2 + 30/2, -265/2 + 216 + 30/2, 4/2])
                cylinder(d=30, h=5, $fn=60);
            }

            translate([300/2 - 65, -265/2 + 32, -1.5])
            cylinder(d=5.5, h=2, $fn=30);

            translate([-300/2 + 65, -265/2 + 32, -1.5])
            cylinder(d=5.5, h=2, $fn=30);

            translate([300/2 - 65, -265/2 + 202, -1.5])
            cylinder(d=5.5, h=2, $fn=30);

            translate([-300/2 + 65, -265/2 + 202, -1.5])
            cylinder(d=5.5, h=2, $fn=30);
        }
    }

    translate([0, 15.5, 0])
    difference() {
        _main_form();

        translate([0, 265/2 - 62 - 7/2, -1])
        hull() {
            translate([-54/2, 0, 0])
            cylinder(d=7, h=2.5, $fn=60);

            translate([54/2, 0, 0])
            cylinder(d=7, h=2.5, $fn=60);
        }

        // inside
        difference() {
            translate([0, 1.5, 10/2 + 1.5])
            cube([310, 265, 10], center=true);

            translate([0, 265/2 - 62 - 7/2, -1])
            hull() {
                translate([-54/2, 0, 0])
                cylinder(d=10, h=4, $fn=60);

                translate([54/2, 0, 0])
                cylinder(d=10, h=4, $fn=60);
            }

            translate([
                100/2 + 222/2 - 1.5,
                -265/2 + 200/2 + 28 - 1.5, 0
            ])
            rounded_cube_side(
                100, 200, 20, 22 + 3, center=true, $fn=60
            );

            mirror([1, 0, 0])
            translate([
                100/2 + 222/2 - 1.5,
                -265/2 + 200/2 + 28 - 1.5, 0
            ])
            rounded_cube_side(
                100, 200, 20, 22 + 3, center=true, $fn=60
            );

            translate([
                200/2 + 28/2 - 1.5,
                -265/2 + 200/2 + 216 - 1.5, 0
            ])
            rounded_cube_side(
                200, 200, 20, 30 + 3, center=true, $fn=60
            );

            mirror([1, 0, 0])
            translate([
                200/2 + 28/2 - 1.5,
                -265/2 + 200/2 + 216 - 1.5, 0
            ])
            rounded_cube_side(
                200, 200, 20, 30 + 3, center=true, $fn=60
            );
        }

        // center hole
        translate([0, -265/2 + 120/2 + 57, 0])
        rounded_cube_side(
            120, 120, 20, 54, center=true
        );

        // bed holes
        translate([300/2 - 65, -265/2 + 32, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([-300/2 + 65, -265/2 + 32, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([300/2 - 65, -265/2 + 202, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([-300/2 + 65, -265/2 + 202, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        // mount holes
        translate([-300/2 + 6, -265/2 + 28/2 - 15/2, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([-300/2 + 6, -265/2 + 28/2 + 15/2, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([-300/2 + 6, -265/2 + 28/2, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([300/2 - 6, -265/2 + 28/2 - 15/2, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([300/2 - 6, -265/2 + 28/2 + 15/2, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([300/2 - 6, -265/2 + 28/2, 0])
        cylinder(d=4, h=10, center=true, $fn=30);
        
        translate([-17/2, 265/2 - 6, 0])
        hull() {
            translate([0, 1, 0])
            cylinder(d=3, h=10, center=true, $fn=30);

            translate([0, -1, 0])
            cylinder(d=3, h=10, center=true, $fn=30);
        }

        translate([17/2, 265/2 - 6, 0])
        hull() {
            translate([0, 1, 0])
            cylinder(d=3, h=10, center=true, $fn=30);

            translate([0, -1, 0])
            cylinder(d=3, h=10, center=true, $fn=30);
        }

        translate([0, 265/2 - 6, 0])
        hull() {
            translate([0, 1, 0])
            cylinder(d=4, h=10, center=true, $fn=30);

            translate([0, -1, 0])
            cylinder(d=4, h=10, center=true, $fn=30);
        }

        translate([0, 265/2 - 30, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([-17/2, 265/2 - 49.5, 0])
        cylinder(d=3, h=10, center=true, $fn=30);

        translate([17/2, 265/2 - 49.5, 0])
        cylinder(d=3, h=10, center=true, $fn=30);
    }
}

module kobra_s1_bed() {
    difference() {
        union() {
            translate([0, 0, 15/2])
            rounded_cube_side(
                264, 264, 15, 14, center=true, $fn=40
            );

            translate([-110/2, 265/2, 15 - 2.8])
            cylinder(d=4, h=4, $fn=40);

            translate([110/2, 265/2, 15 - 2.8])
            cylinder(d=4, h=4, $fn=40);
        }

        // mount holes
        translate([-170/2, 170/2, 0])
        cylinder(d=4, h=40, center=true, $fn=30);

        translate([-170/2, -170/2, 0])
        cylinder(d=4, h=40, center=true, $fn=30);

        translate([170/2, 170/2, 0])
        cylinder(d=4, h=40, center=true, $fn=30);

        translate([170/2, -170/2, 0])
        cylinder(d=4, h=40, center=true, $fn=30);

        translate([-170/2, 170/2, 15 - 2])
        cylinder(d=10, h=40, $fn=30);

        translate([-170/2, -170/2, 15 - 2])
        cylinder(d=10, h=40, $fn=30);

        translate([170/2, 170/2, 15 - 2])
        cylinder(d=10, h=40, $fn=30);

        translate([170/2, -170/2, 15 - 2])
        cylinder(d=10, h=40, $fn=30);

        // bottom cut
        difference() {
            rounded_cube_side(
                264 - 2.8, 264 - 2.8, 16,
                14 - 2.8, center=true, $fn=40
            );

            translate([-170/2, 170/2, 1])
            tube(11.9, 20, 1.5, $fn=30);

            translate([-170/2, -170/2, 1])
            tube(11.9, 20, 1.5, $fn=30);

            translate([170/2, 170/2, 1])
            tube(11.9, 20, 1.5, $fn=30);

            translate([170/2, -170/2, 1])
            tube(11.9, 20, 1.5, $fn=30);

            translate([0, 264/2 - 14, 2])
            tube(6, 20, 1.9, $fn=30);

            translate([-17/2, 264/2 - 33.5, 2])
            tube(6, 20, 1.9, $fn=30);

            translate([17/2, 264/2 - 33.5, 2])
            tube(6, 20, 1.9, $fn=30);

            translate([0, 264/2 - 60, 2])
            tube(6, 20, 1.9, $fn=30);

            
            translate([0, -264/2 + 92/2 + 72, 20/2 + 2.6])
            rounded_cube_side(
                24, 92, 20, 8, center=true
            );
        }

        // frame cuts
        translate([264/2, -264/2 + 15 + 2.6/2, 0])
        cube([10, 2.6, 10], center=true);

        translate([-264/2, -264/2 + 15 + 2.6/2, 0])
        cube([10, 2.6, 10], center=true);

        translate([264/2, -264/2 + 40.5 + 2.6/2, 0])
        cube([10, 2.6, 10], center=true);

        translate([-264/2, -264/2 + 40.5 + 2.6/2, 0])
        cube([10, 2.6, 10], center=true);

        translate([264/2, -264/2 + 15 + 28/2, 0])
        cube([10, 28, 2], center=true);

        translate([-264/2, -264/2 + 15 + 28/2, 0])
        cube([10, 28, 2], center=true);

        translate([-28/2 + 2.6/2, 264/2, 0])
        cube([2.6, 10, 10], center=true);

        translate([28/2 - 2.6/2, 264/2, 0])
        cube([2.6, 10, 10], center=true);

        translate([0, 264/2, 0])
        cube([28, 10, 2], center=true);

        translate([-1, 264/2, 0])
        cube([13.6, 10, 14], center=true);
    }
}

module kobra_s1_back_wall() {
    difference() {
        union() {
            rounded_cube_side(
                393, 459, 1.5, 30, center=true, $fn=50 
            );

            translate([0, 3, 0])
            cube([333, 459, 1.5], center=true);
        }

        // side mount holes
        translate([-393/2 + 16.4, 459/2 - 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 16.4, 459/2 - 56.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 16.4, 459/2 - 119, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 16.4, 0, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 16.4, -459/2 + 56, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 16.4, -459/2 + 119, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 16.4, -459/2 + 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, 459/2 - 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, 459/2 - 56.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, 459/2 - 119, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, 0, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, -459/2 + 56, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, -459/2 + 119, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 16.4, -459/2 + 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        // top mount holes
        translate([-393/2 + 111.5, 459/2 - 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 188.5, 459/2 - 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 79, 459/2 - 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        // middle mount holes
        translate([393/2 - 136.5, -459/2 + 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 136.5, -459/2 + 14.5, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        // bottom mount holes
        translate([393/2 - 178.5, 459/2 - 142, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 178.5, 459/2 - 142, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        // ptfe hole
        hull() {
            translate([-393/2 + 125.5 + 12.7/2, 459/2 - 5.5 - 12.7/2, 0])
            cylinder(d=12.7, h=10, center=true, $fn=30);

            translate([
                -393/2 + 125.5 + 49 - 12.7/2, 459/2 - 5.5 - 12.7/2, 0
            ])
            cylinder(d=12.7, h=10, center=true, $fn=30);
        }

        // poop schute hole
        translate([393/2 - 98 - 37/2, 459/2 - 209 - 61.5/2, 0])
        rounded_cube_side(
            37, 61.5, 10, 12, center=true, $fn=30
        );

        translate([393/2 - 92.5, 459/2 - 239, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([393/2 - 141, 459/2 - 239, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        // power socket hole
        translate([-393/2 + 35.5 + 50/2, -459/2 + 29 + 28/2, 0])
        rounded_cube_side(
            50, 28, 10, 8, center=true, $fn=30
        );

        translate([-393/2 + 32.5, -459/2 + 43, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        translate([-393/2 + 88.5, -459/2 + 43, 0])
        cylinder(d=3.5, h=10, center=true, $fn=20);

        // chamber fan output
        translate([393/2 - 35.5 - 78/2, -459/2 + 102 + 78/2, 0])
        rounded_cube_side(
            78, 78, 10, 20, center=true
        );

        // board fan grill
        translate([-393/2 + 65 + 88.5/2, 459/2 - 160 - 88.5/2, 0])
        rounded_cube_side(
            88.5, 88.5, 10, 20, center=true
        );
    }
}