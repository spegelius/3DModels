include <../Dollo/NEW_long_ties/globals.scad>;
use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
include <../lib/bearings.scad>;


h = 12.6 * 2;

filament_x_pos = 11/2 + 1.4/2;


//mock_prometheus_motor();
debug();

//bottom();
//cover();
//idler_arm();
//idler_axle();
//idler_arm_lock();


module mock_prometheus_motor() {
    rotate([90, 0, 0])
    mock_stepper_motor(geared=true, center=true);

    color("brown")
    translate([0, 0, 40/2 + 27.5 + 20 - 12 - 3])
    cylinder(d=11, h=12, $fn=30);

    color("black")
    rotate([0, 0, 25])
    translate([-11/2, 0, 40/2 + 27.5 + 20 - 12 + 0.6])
    rotate([0, 90, 0])
    cylinder(d=2.8, h=2, center=true, $fn=20);
}

module debug() {
    %translate([filament_x_pos, 0, 10.6 + 4/2])
    rotate([90, 0, 0])
    cylinder(d=1.7, h=80, center=true, $fn=30);

    %translate([12.4, 0, 10.6])
    U604zz();

    //%translate([0, 0, 18])
    //608zz();

    render()
    translate([0, 0, -47.5])
    rotate([0, 0, 180 - 45])
    mock_prometheus_motor();

    intersection() {
        bottom();

//        translate([0, 100/2, 0])
//        cube([100, 100, 50], center=true);
    }

    render()
    intersection() {
        translate([10/2 + 11.5, 0, 13/2 + 6])
        rotate([0, -90, 0])
        idler_arm();

        translate([0, -100/2 + 15, 0])
        cube([100, 100, 50], center=true);
    }

//    render()
//    translate([0, 0, h + 0.1])
//    rotate([0, 180, 0])
//    cover();

    translate([15, -25, h - 5.2])
    rotate([180, 0, 0])
    idler_arm_lock();
}

module _body_form(mount=false) {

    difference() {
        union() {
            translate([0, 0, h/4])
            rounded_cube_side(
                40, 40, h/2, 4, $fn=30, center=true
            );

            hull() {
                translate([0, 0, 0])
                chamfered_cylinder(5, 5, 1, $fn=40);

                translate([34, -26, 0])
                chamfered_cylinder(10, 5, 1, $fn=40);

                translate([15, -25, 0])
                chamfered_cylinder(10, 5, 1, $fn=40);
            }

            translate([
                11/2 + 1.5/2, -40/2 + 10/2 - 4, h/4
            ])
            chamfered_cube_side(
                13, 10, h/2, 2, center=true
            );

            if (mount) {
                translate([0, 40/2, h/4])
                cube([40, 10, h/2], center=true);

                translate([11/2 + 1.5/2, 40/2 + 5, h/2])
                rotate([90, 0, 0])
                chamfered_cube_side(
                    62, h, 7, 4, center=true
                );
            }
        }
        if (mount) {
            translate([-25 + 11/2 + 1.5/2, 40/2 + 4, h/2])
            rotate([90, 0, 0])
            cylinder(d=4.3, h=10, center=true, $fn=30);

            translate([25 + 11/2 + 1.5/2, 40/2 + 4, h/2])
            rotate([90, 0, 0])
            cylinder(d=4.3, h=10, center=true, $fn=30);

            translate([25 + 11/2 + 1.5/2, 40/2 + 5, h/2])
            rotate([90, 30, 0])
            M4_nut(h=3.6, cone=false);
        }

        translate([-25 + filament_x_pos, 40/2 + 5, h/2])
        rotate([90, 30, 0])
        M4_nut(h=6.5, cone=false);

        // gear hole
        hull() {
            translate([-1, 0, 0])
            cylinder(d=12.7, h=30, center=true, $fn=60);

            cylinder(d=11.7, h=30, center=true, $fn=60);
        }

        translate([10/2, 0, 20/2 + 5])
        cube([10, 5, 20], center=true);

        // idler bearing hole
        difference() {
            translate([12.4, 0, 5])
            cylinder(d=13.2, h=30, $fn=60);

            translate([17.6, 0, h/2])
            donut(23.3, 1.8, $fn=100);
        }

        // filament drill guide
        translate([filament_x_pos, 0, h/2])
        rotate([90, 0, 0])
        cylinder(d=1, h=80, center=true, $fn=30);

        // input filament path
        translate([filament_x_pos, -7, h/2])
        rotate([90, 0, 0])
        cylinder(d=2, h=30, $fn=30);

        translate([filament_x_pos, -14, h/2])
        rotate([90, 0, 0])
        cylinder(d1=2, d2=3, h=5, $fn=30);

        // PTFE tube hole
        translate([filament_x_pos, 7, h/2])
        rotate([-90, 0, 0])
        cylinder(d=4.2, h=30, $fn=30);

        translate([filament_x_pos, 18, h/2])
        rotate([-90, 0, 0])
        cylinder(d=5, h=30, $fn=30);

        translate([filament_x_pos, -18, h/2])
        rotate([90, 0, 0])
        cylinder(d=4.2, h=30, $fn=30);

        // M4 nut holes
        translate([filament_x_pos, 10.5, h/2])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);

        translate([filament_x_pos, -20.5, h/2])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);

        // idler arm cutout
        difference() {
            translate([10/2 + 11.2, -1.5, 20/2 + 5])
            cube([10, 46, 20], center=true);

            translate([10/2 + 11.5, 40/2 - 5, 5])
            hull() {
                cylinder(d=6, h=3, center=true, $fn=30);
                cylinder(d=4, h=5, center=true, $fn=30);
            }
        }
    }
}

module bottom() {

    difference() {
        union() {
            _body_form(mount=true);

            translate([34, -26, 4.99])
            cylinder(d=7.5, h=h - 10, $fn=30);
        }

        // motor hole
        hull() {
            cylinder(d=22.4, h=4.8, center=true, $fn=40);

            cylinder(d=11, h=23.3, center=true, $fn=40);
        }

        // motor mount screw holes
        for (i=[0:3]) {
            rotate([0, 0, i*(360/4) - 45])
            translate([20/2, 20/2, 0])
            cylinder(d=3.3, h*3, center=true, $fn=20);

            rotate([0, 0, i*(360/4) - 45])
            translate([20/2, 20/2, 3])
            cylinder(d=7, 30, $fn=20);
        }

        // idler arm spring screw hole
        translate([4, -15, 9.6])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        // idler arm spring screw nut hole
        translate([-6, -15, 10/2 + 9.6 - 6/2])
        cube([2, 6, 10], center=true);

        // idler arm pivot screw hole
        translate([10/2 + 11.5, 40/2 - 5, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        // idler arm pivot screw nut
        translate([10/2 + 11.5, 40/2 - 5, -0.01])
        M3_nut(cone=false, bridging=true);

        // idler arm lock screw hole
        translate([15, -25, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        // idler arm lock screw nut
        translate([15, -25, 0])
        M3_nut(cone=false, bridging=true);

        // assembly holes
        translate([-15, 40/2 - 5, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        translate([-15, -40/2 + 5, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        translate([34, -26, h - 8])
        cylinder(d1=4.6, d2=5.1, h=3, $fn=30);

        // assembly hole nuts
        translate([-15, 40/2 - 5, -0.01])
        M3_nut(cone=false, bridging=true);

        translate([-15, -40/2 + 5, -0.01])
        M3_nut(cone=false, bridging=true);

        // assembly hole guide holes
        translate([-15, 40/2 - 5, h/2 - 3])
        cylinder(d=6.2, h=4, $fn=30);

        translate([-15, -40/2 + 5, h/2 - 3])
        cylinder(d=6.2, h=4, $fn=30);
    }
}

module cover() {

    mirror([1, 0, 0])
    difference() {
        union() {
            _body_form();

            // assembly hole guides
            translate([-15, 40/2 - 5, h/2 - 0.2])
            cylinder(d1=6, d2=5.5, h=3, $fn=30);

            translate([-15, -40/2 + 5, h/2 - 0.2])
            cylinder(d1=6, d2=5.5, h=3, $fn=30);

            translate([34, -26, 4.99])
            cylinder(d1=5, d2=4.5, h=3, $fn=30);
        }

        // top opening
        hull() {
            cylinder(d=18, h=1, center=true, $fn=40);

            cylinder(d=11, h=11.1, center=true, $fn=40);
        }

        // assembly holes
        translate([-15, 40/2 - 5, 4.2])
        cylinder(d=3.2, h=40, $fn=30);

        translate([-15, -40/2 + 5, 4.2])
        cylinder(d=3.2, h=40, $fn=30);

        translate([10/2 + 11.5, 40/2 - 5, -0.2])
        cylinder(d=7, h=2.2, $fn=30);

        translate([-15, 40/2 - 5, -0.2])
        cylinder(d=7, h=4.2, $fn=30);

        translate([-15, -40/2 + 5, -0.2])
        cylinder(d=7, h=4.2, $fn=30);

        translate([15, -25, 3.2])
        cylinder(d=3.2, h=40, $fn=30);

        translate([15, -25, -0.2])
        cylinder(d=7, h=3.2, $fn=30);

        // idler arm hinge screw hole
        translate([10/2 + 11.5, 40/2 - 5, 2.2])
        cylinder(d=3.2, h=30, $fn=30);

        // idler arm extra hole
        difference() {
            translate([10/2 + 11.5, 40/2 -5, 3 + 6/2])
            chamfered_cube_side(
                10.5, 10.5, 6, 2, center=true
            );

            translate([10/2 + 11.5, 40/2 - 5, 3])
            hull() {
                cylinder(d=6, h=3, center=true, $fn=30);
                cylinder(d=4, h=5, center=true, $fn=30);
            }
        }

        // motor mount screw holes
        for (i=[0:3]) {
            rotate([0, 0, i*(360/4) - 45])
            translate([20/2, 20/2, -1])
            cylinder(d=7, 30, $fn=20);
        }
    }
}

module idler_arm() {
    thicc = 15;

    difference() {
        union() {
            hull() {
                translate([0, 40/2 - 10/2, 0])
                rotate([0, 90, 0])
                cylinder(
                    d=10, h=thicc, center=true, $fn=30
                );

                translate([0, -40/2 + 1/2, 0])
                cube([thicc, 1, 10], center=true);
            }

            // mount extension
            translate([2, 40/2 - 10/2, 0])
            rotate([0, 90, 0])
            cylinder(
                d=10, h=thicc, center=true, $fn=30
            );

            // bearing mount
            translate([0, 0, 4.5])
            rotate([0, 90, 0])
            cylinder(d=11, h=thicc, center=true, $fn=40);

            // handle
            hull() {
                translate([0, 40/2 + -1, -10/2 + 6/2 - 4.5])
                cube([thicc, 1, 6], center=true);

                translate([0, -40/2 - 15, -10/2 + 5/2 - 4.5])
                rotate([0, 90, 0])
                cylinder(d=5, h=thicc, center=true, $fn=40);
            }
        }

        difference() {
            cube([5.4, 14, 30], center=true);

            translate([5.4/2 + 0.35, 0, 4.1])
            rotate([0, -90, 0])
            cylinder(d1=7, d2=5, h=1, $fn=30);

            translate([-5.4/2 - 0.35, 0, 4.1])
            rotate([0, 90, 0])
            cylinder(d1=7, d2=5, h=1, $fn=30);
        }

        // chamfers
        hull() {
            translate([0, -7, 10/2 + 5/2])
            cube([20, 1, 5], center=true);

            translate([0, -40/2 - 1/2, -10/2 + 10/2 + 0.75])
            cube([20, 1, 10], center=true);
        }

        translate([0, 40/2 - 10/2, 0])
        rotate([-35, 0, 0])
        translate([0, 10, 0])
        cube([40, 10, 50], center=true);

        translate([0, 0, 4.5])
        rotate([0, 90, 0])
        cylinder(d=4.1, h=20, center=true, $fn=40);

        // hinge screw hole
        translate([0, 40/2 - 5, 0])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        // hinge indents
        translate([thicc/2 + 2, 40/2 - 5, 0])
        rotate([0, 90, 0])
        hull() {
            cylinder(d=6.2, h=3, center=true, $fn=30);
            cylinder(d=3.2, h=6, center=true, $fn=30);
        }

        translate([-thicc/2, 40/2 - 5, 0])
        rotate([0, 90, 0])
        hull() {
            cylinder(d=6.2, h=3, center=true, $fn=30);
            cylinder(d=3.2, h=6, center=true, $fn=30);
        }

        // spring screw hole
        hull() {
            translate([-2.9, -14, 0])
            cylinder(d=3.3, h=20, center=true, $fn=30);

            translate([-2.9, -16, 0])
            cylinder(d=3.3, h=20, center=true, $fn=30);
        }

        // locking notch
        translate([0, -25, -2])
        rotate([0, 90, 0])
        cylinder(d=6, h=40, center=true, $fn=30);

        // lock arm cutout
        translate([thicc/2 + 10/2 -3, -30, 0])
        chamfered_cube(10, 23, 30, 3, center=true);
    }
}

module idler_axle() {
    intersection() {
        rotate([90, 0, 0])
        cylinder(d=4, h=15, center=true, $fn=30);

        translate([0, 0, 0.3])
        cube([5, 15, 4], center=true);
    }
}

module idler_arm_lock() {
    difference() {
        union() {
            cylinder(d=7.1, h=h - 10.4, $fn=30);

            hull() {
                translate([8, 0, 0])
                cylinder(d=3, h=2.8, $fn=30);

                translate([16, 9, 0])
                cylinder(d=3, h=2.8, $fn=30);
            }

            hull() {
                cylinder(d=3, h=h - 10.4, $fn=30);

                translate([8, 0, 0])
                cylinder(d=3, h=h - 10.4, $fn=30);
            }
        }

        cylinder(d=3.2, h=700, center=true, $fn=30);
    }
}