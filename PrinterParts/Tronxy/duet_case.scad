use <../../Dollo/New_long_ties/include.scad>;

h = 45;
wall = 2;


//_mock_duet();
//_mock_duet_x5();

//debug_case();

//duet_case();
//duet_case_lid();
//duet_case_lid_dc_white();
//duet_case_lid_dc_blue();
//duet_case_mount_adapter();
fan_shroud_80mm();


module _mock_duet_x5() {
    difference() {

        union() {
            translate([0, 0, 1.6/2])
            cube([123, 100, 1.6], center=true);

            color("green")
            translate([123/2 - 8/2, 100/2 - 36/2 - 12, 10/2])
            cube([8, 36, 10], center=true);

            color("green")
            translate([123/2 - 12/2, 100/2 - 56, 16/2])
            cube([12, 14, 16], center=true);

            color("black")
            translate([123/2 - 71/2 - 7.5, 100/2 - 8.5/2, 11/2])
            cube([71, 8.5, 11], center=true);

            for (i = [0:4]) {
                color("black")
                translate([
                    -123/2 + 12 + i*24.5, -100/2 + 19.5, 2
                ])
                cube([10, 10, 1], center=true);
            }
        }

        _duet_screw_holes()
        cylinder(d=3, h=10, center=true, $fn=20);
    }
}

module _mock_duet() {
    difference() {

        union() {
            translate([0, 0, 1.6/2])
            cube([123, 100, 1.6], center=true);

            translate([-123/2 + 3, -100/2 + 18.5, 2])
            cube([20, 16, 1], center=true);

            translate([-123/2 + 1, 100/2 - 47, 2.2])
            cube([6, 7, 2], center=true);

            color("green")
            translate([-123/2 + 30, 100/2 - 8/2, 10/2])
            cube([15, 8, 10], center=true);

            color("green")
            translate([123/2 - 12/2, 100/2 - 43.5, 16/2])
            cube([12, 14, 16], center=true);

            color("green")
            translate([123/2 - 12/2, -100/2 + 25, 16/2])
            cube([12, 14, 16], center=true);

            color("black")
            translate([
                123/2 - 71/2 - 7.5, -100/2 + 8.5/2, 11/2
            ])
            cube([71, 8.5, 11], center=true);

            for (i = [0:3]) {
                color("black")
                translate([
                    -123/2 + 34 + i*18.5, 100/2 - 19.5, 2
                ])
                cube([10, 10, 1], center=true);
            }

            color("black")
            translate([
                123/2 - 12, 100/2 - 22, 2
            ])
            cube([10, 10, 1], center=true);

        }

        _duet_screw_holes()
        cylinder(d=3, h=10, center=true, $fn=20);
    }
}

module _duet3d_logo() {
    difference() {
        hull() {
            cylinder(d=20, h=1, $fn=30);

            translate([0, 14, 0])
            cylinder(d=1, h=1, $fn=30);
        }

        translate([0, 0, -1])
        intersection() {
            union() {
                tube(18, 4, 1.45, $fn=40);
                tube(13.4, 4, 1.45, $fn=40);
                tube(8.8, 4, 1.45, $fn=40);
                cylinder(d=4, h=4, $fn=40);
            }

            hull() {
                cylinder(d=1, h=15, center=true, $fn=10);

                translate([0, 14, 0])
                cylinder(d=20, h=15, center=true, $fn=30);
            }
        }
    }

    translate([11, -8, 0])
    linear_extrude(1)
    text("Duet  D", font="Corbel:style=Bold", size=16);

    translate([58.3, -3.7, 0])
    linear_extrude(1)
    text("3", font="Corbel:style=Bold", size=16);
}

module _duet_screw_holes() {
    translate([-115/2, -92/2, 0])
    children();

    translate([115/2, -92/2, 0])
    children();

    translate([-115/2, 92/2, 0])
    children();

    translate([115/2, 92/2, 0])
    children();
}

module _lid_screw_holes() {
    translate([-250/2 + 7, -160/2 + 7, 0])
    children();

    translate([-250/2 + 7, 160/2 - 7, 0])
    rotate([0, 0, -90])
    children();

    translate([250/2 - 7, -160/2 + 7, 0])
    rotate([0, 0, 90])
    children();

    translate([250/2 - 7, 160/2 - 7, 0])
    rotate([0, 0, 180])
    children();

}

module debug_case() {
    translate([-61, -12, 6])
    rotate([0, 0, 90])
    _mock_duet();

    translate([67, -12, 6])
    rotate([0, 0, 90])
    _mock_duet_x5();

    render()
    intersection() {
        duet_case();

//        translate([133, 0, 0])
//        cube([300, 200, 100], center=true);
    }

//    translate([0, 0, 45 + 2.1])
//    rotate([180, 0, 0])
//    duet_case_lid();
}

module _lid_stud() {
    hull() {
        translate([0, 0, 10])
        cylinder(d=10, h=7, $fn=40);

        translate([-4, -4, 0])
        cylinder(d=0.5, h=0.5);
    }
}

module duet_case() {

    module _case_main() {
        translate([0, 0, h/2])
        difference() {
            rounded_cube_side(
                250, 160, h, 15, center=true, $fn=30
            );

            translate([0, 0, wall])
            rounded_cube_side(
                250 - 2*wall, 160 - 2*wall,
                h, 15 - 2*wall, center=true, $fn=30
            );

            // wifi/usb/sd hole
            translate([-45, -80, -h/2 + 8])
            cube([55, 10, 8], center=true);

            // led holes
            for (i = [0:5]) {
                translate([-104 + i*4, -80, -h/2 + 9])
                rotate([90, 0, 0])
                cylinder(d=3, h=10, center=true, $fn=20);
            }


            // air vents
            for (i = [0:4]) {
                translate([0, 24, -12 + i*6])
                rotate([0, 90, 0])
                hull() {
                    translate([0, 15, 0])
                    cylinder(d=4, h=400, center=true, $fn=20);

                    translate([0, -15, 0])
                    cylinder(d=4, h=400, center=true, $fn=20);
                }
            }

            for (i = [0:4]) {
                translate([0, -13, -12 + i*6])
                rotate([0, 90, 0])
                hull() {
                    translate([0, 15, 0])
                    cylinder(d=4, h=400, center=true, $fn=20);

                    translate([0, -15, 0])
                    cylinder(d=4, h=400, center=true, $fn=20);
                }
            }

            for (i = [0:4]) {
                translate([0, -50, -12 + i*6])
                rotate([0, 90, 0])
                hull() {
                    translate([0, 15, 0])
                    cylinder(d=4, h=400, center=true, $fn=20);

                    translate([0, -15, 0])
                    cylinder(d=4, h=400, center=true, $fn=20);
                }
            }
        }
    }

    module _cable_arc() {
        intersection() {
            difference() {
                rounded_cube(
                    20, 34, 50, 8, center=true, $fn=30
                );

                translate([0, 4, -4])
                rounded_cube(
                    30, 34, 50, 4, center=true, $fn=30
                );
            }

            translate([0, -13.3, 12])
            cube([4, 50, 60], center=true);
        }
    }
    
    difference() {
        union() {
            _case_main();

            // reinforcements
            translate([0, 46, 3/2])
            cube([248, 12, 3], center=true);

            translate([0, 46 - 115, 3/2])
            cube([248, 12, 3], center=true);

            // board mount studs
            translate([-61, -12, 0])
            rotate([0, 0, 90])
            _duet_screw_holes()
            cylinder(d1=11, d2=8.5, h=6, $fn=20);

            translate([67, -12, 0])
            rotate([0, 0, 90])
            _duet_screw_holes()
            cylinder(d1=11, d2=8.5, h=6, $fn=20);

            // cable arcs
            translate([-20, 68, 18])
            _cable_arc();
 
            translate([-53, 68, 18])
            _cable_arc();

            translate([-86, 68, 18])
            _cable_arc();

            translate([23, 68, 18])
            _cable_arc();

            translate([84, 68, 18])
            _cable_arc();

            // lid studs
            translate([0, 0, h - 18])
            _lid_screw_holes()
            _lid_stud();

            // cable foundations
            translate([-250/2 + 20/2 + 1, 160/2 - 16, 12/2])
            rounded_cube_side(
                20, 25, 12, 2, center=true, $fn=20
            );

            translate([250/2 - 20/2 - 1, 160/2 - 16, 12/2])
            rounded_cube_side(
                20, 25, 12, 2, center=true, $fn=20
            );

            // mount reinforcements
            translate([0, 160/2 - 3.6/2, 10])
            chamfered_cube(
                239.6, 3.5, 14, 1.2, center=true
            );

            translate([0, 160/2 - 3.6/2, h - 10])
            chamfered_cube(
                239.6, 3.5, 14, 1.2, center=true
            );
        }

        // mount screw holes
        translate([-61, -12, -0.1])
        rotate([0, 0, 90])
        _duet_screw_holes()
        cylinder(d=3.2, h=15, $fn=20);

        translate([67, -12, -0.1])
        rotate([0, 0, 90])
        _duet_screw_holes()
        cylinder(d=3.2, h=15, $fn=20);

        translate([-61, -12, -0.1])
        rotate([0, 0, 90])
        _duet_screw_holes()
        M3_nut(2.7, cone=false, bridging=true);

        translate([67, -12, -0.1])
        rotate([0, 0, 90])
        _duet_screw_holes()
        M3_nut(2.7, cone=false, bridging=true);

        // cable holes
        translate([0, 160/2 - 16, 16])
        rotate([0, 90, 0])
        cylinder(d=18, h=400, center=true, $fn=30);

        // zip tie hole
        translate([-250/2 + 12, 160/2 - 16, 16])
        rotate([0, 90, 0])
        tube(23.6, 3.4, 1.6, $fn=30);

        translate([250/2 - 12 - 3.4, 160/2 - 16, 16])
        rotate([0, 90, 0])
        tube(23.6, 3.4, 1.6, $fn=30);

        // lid screw holes
        translate([0, 0, h - 10])
        _lid_screw_holes()
        cylinder(d=2.8, h=20, $fn=10);

        // mount holes
        translate([-94, 160/2, 10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=10, center=true, $fn=30);

        translate([94, 160/2, 10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=10, center=true, $fn=30);

        translate([0, 160/2, 10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=10, center=true, $fn=30);

        translate([-94, 160/2, h - 10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=10, center=true, $fn=30);

        translate([94, 160/2, h - 10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=10, center=true, $fn=30);

        translate([0, 160/2, h - 10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=10, center=true, $fn=30);
    }
}

module duet_case_lid() {
    union() {
        difference() {
            union() {
                translate([0, 0, 2/2])
                rounded_cube_side(
                    250, 160, 2, 15, center=true, $fn=30
                );

                translate([0, 0, 3/2])
                rounded_cube_side(
                    250 - 2.2* wall,
                    160 - 2.2* wall,
                    3, 15 - 2.2* wall, center=true, $fn=30
                );
            }

            translate([0, 0, 3/2 + 2])
            chamfered_cube_side(
                250 - 5.1* wall,
                160 - 5.1* wall,
                3, 13, center=true
            );

            // fan holes, 80mm fan
            cylinder(d=80, h=10, center=true, $fn=50);

            for (i = [0:3]) {
                rotate([0, 0, i*360/4])
                translate([72/2, 72/2, 0])
                cylinder(d=4.4, h=10, center=true, $fn=30);
            }

            // lid screw holes
            translate([0, 0, -1])
            _lid_screw_holes()
            cylinder(d=3.2, h=20, $fn=20);

            translate([0, 0, -1])
            _lid_screw_holes()
            cylinder(d1=7.2, d2=3.2, h=2.8, $fn=20);
        }

        // fan shroud
        cylinder(d=16, h=2, $fn=30);

        translate([0, 0, 2/2])
        cube([2, 90, 2], center=true);

        rotate([0, 0, 45])
        translate([0, 0, 2/2])
        cube([2, 90, 2], center=true);

        rotate([0, 0, 90])
        translate([0, 0, 2/2])
        cube([2, 90, 2], center=true);

        rotate([0, 0, 135])
        translate([0, 0, 2/2])
        cube([2, 90, 2], center=true);

        tube(66, 2, 2, $fn=70);
        tube(50, 2, 2, $fn=55);
        tube(35, 2, 2, $fn=40);

        // reinforcements
        translate([0, -160/2 + 20, 4/2])
        cube([220, 3, 4], center=true);

        translate([0, 160/2 - 20, 6/2])
        cube([220, 3, 6], center=true);
    }
}

module duet_case_lid_dc_white() {
    difference() {
        duet_case_lid();

        _duet_case_lid_dc_blue();
    }
}

module _duet_case_lid_dc_blue() {
    translate([85, 35, 0.4])
    rotate([0, 180, 90])
    _duet3d_logo();

    translate([-85, -35, 0.4])
    rotate([0, 180, -90])
    _duet3d_logo();

    translate([25, 50, 0.4])
    rotate([0, 180, 0])
    linear_extrude(1)
    text("Duet", font="Corbel:style=Bold", size=16);

    translate([-26, 50, 0.4])
    rotate([0, 180, 0])
    linear_extrude(1)
    text("2", font="Corbel:style=Bold", size=20);

    translate([27, -61, 0.4])
    rotate([0, 180, 0])
    linear_extrude(1)
    text("DueX", font="Corbel:style=Bold", size=16);

    translate([-26, -57, 0.4])
    rotate([0, 180, 0])
    linear_extrude(1)
    text("5", font="Corbel:style=Bold", size=16);

}

module duet_case_lid_dc_blue() {
    intersection() {
        _duet_case_lid_dc_blue();

        translate([0, 0, 0.4/2])
        cube([300, 200, 0.4], center=true);
    }
}

module duet_case_mount_adapter() {
    difference() {
        chamfered_cube(
            37, 45, 20, 4, center=true
        );

        // cuts
        translate([-37/2 + 27 + 20/2, 0, 0])
        cube([20, 70, 30], center=true);

        translate([
            -37/2 + 20 - 70/2,
            45/2 - 50 - 20/2, 0
        ])
        cube([70, 20, 30], center=true);

        difference() {
            translate([
                -37/2 + 20 - 70/2,
                45/2 - 20 + 70/2, 0
            ])
            cube([70, 70, 30], center=true);

            translate([-37/2 + 9.9, 45/2 - 20, 0])
            cube([6, 5, 40], center=true);
        }

        translate([
            -37/2 + 20 - 70/2,
            45/2 - 25 - 70/2, 0
        ])
        cube([70, 70, 30], center=true);

        // mount hole and chamfer
        translate([-37/2 + 9.9, 0])
        rotate([90, 0, 0])
        cylinder(d=4.4, h=70, center=true, $fn=30);

        translate([-37/2 + 9.9, 45/2 - 20 + 6/2, 0])
        chamfered_cube(19, 6, 16, 2.5, center=true);

        // case mount holes
        translate([0, 45/2 - 10, 0])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=70, center=true, $fn=30);

        translate([-37/2 + 19.9, 45/2 - 10, 0])
        rotate([0, 90, 0])
        M4_nut(5, cone=false);

        translate([0, 45/2 - 35, 0])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=70, center=true, $fn=30);

        translate([-37/2 + 19.9, 45/2 - 35, 0])
        rotate([0, 90, 0])
        M4_nut(5, cone=false);
    }
}

module fan_shroud_80mm() {
    
    fins = 12;
    h = 2;
    
    union() {
        difference() {
            union() {
                translate([0, 0, h/2])
                rounded_cube_side(
                    82, 82, h, 4, center=true
                );

                cylinder(d=86, h=h, $fn=50);
            }
            tube(
                d=80, h=h*3, center=true,
                wall=30, $fn=50
            );

            for (i = [0:3]) {
                rotate([0, 0, i*360/4])
                translate([72/2, 72/2, 0]) {
                    cylinder(
                        d=4.4, h=10,
                        center=true, $fn=30
                    );

                    translate([0, 0, h - 0.99])
                    cylinder(d2=6, d1=4.5, h=1, $fn=30);
                }
            }
        }

        tube(55, h, 1, $fn=80);

        intersection() {
            for(j=[0:fins - 1]) {
                translate([0, 0, 2/2])
                rotate([0, 45, j*360/fins])
                translate([0, 41/2, 0])
                cube([1.2, 41, 6], center=true);
            }

            translate([0, 0, 2/2])
            cube([100, 100, 2], center=true);
        }
    }
}