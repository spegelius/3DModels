use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Trash Bin/"
);


//_orig_main_body_large();
//_orig_top_lid();


//debug_large_main_body();
//debug_new_trash_bin_top_lid();

//new_trash_bin_large_main_body();
new_trash_bin_top_lid();


//test_bin();
//test_bin_2();


module _orig_main_body_large() {
    //scale([1.4, 1.4, 1.4])
    translate([-240, 0, 558])
    import(
        str(spath, "trash-bin-large-main-body.stl"),
        convexity=10
    );

//    %difference() {
//        intersection() {
//            translate([0, 0, -2])
//            rounded_cylinder(300, 320, 10, $fn=80);
//
//            cylinder(d=310, h=315);
//        }
//
//        translate([0, 0, 5])
//        rounded_cylinder(285, 320, 2, $fn=80);
//    }
}

module _orig_top_lid() {
    translate([0, 0, -119])
    rotate([180, 0, 0])
    import(
        str(spath, "top-lid.stl"),
        convexity=10
    );
}

module debug_large_main_body() {

    render()
    intersection() {
        new_trash_bin_large_main_body();

//        translate([0, 1000/2, 100/2 + 100])
//        cube([1000, 1000, 100], center=true);

        translate([0, 1000/2, 0])
        cube([1000, 1000, 2000], center=true);
    }

    translate([0, 0, 337])
    rotate([180, 0, 0])
    new_trash_bin_top_lid();
}

module debug_new_trash_bin_top_lid() {
    render()
    intersection() {
        //rotate([0, 0, 30])
        new_trash_bin_top_lid();

        translate([0, 1000/2, 0])
        cube([1000, 1000, 2000], center=true);
    }
}

module new_trash_bin_large_main_body() {
    bh = 4;
    bstep = bh*2 + 1.2;
    bsize = sqrt(bh*bh*2);

    ssteps = 12;
    //%cylinder(d=277.2, h=50, $fn=100);

    difference() {
        intersection() {
            translate([0, 0, -1.8])
            scale([1.4, 1.4, 1.4])
            _orig_main_body_large();

            cylinder(d=300, h=350);
        }

        // bottom pattern
        intersection() {
            rotate([0, 0, 90])
            for(i = [0:99]) {
                translate([0, bstep/2 + i*bstep, 0])
                rotate([45, 0, 0])
                cube([500, bsize, bsize], center=true);

                translate([0, -bstep/2 - i*bstep, 0])
                rotate([45, 0, 0])
                cube([500, bsize, bsize], center=true);
            }

            cylinder(d=260, h=7, center=true, $fn=80);
        }

        // side cuts
        difference() {
            translate([0, 0, 20])
            tube(300, 270, 11.4 - 1.8, $fn=100);

            chamfered_cylinder(
                292, 60, 10, center=true, $fn=200
            );

            translate([0, 0, 310])
            chamfered_cylinder(
                292, 60, 10, center=true, $fn=200
            );

            for(i = [1:ssteps])
            rotate([0, 0, 360/ssteps * i])
            hull() {
                translate([0, 138, 0])
                cube([15.5, 0.1, 1000], center=true);

                translate([-5.5, 143, 0])
                cylinder(
                    d=2, h=1000, center=true, $fn=20
                );

                translate([5.5, 143, 0])
                cylinder(
                    d=2, h=1000, center=true, $fn=20
                );
            }
        }

        for(i = [1:ssteps]) {
            rotate([0, 0, 360/ssteps * i])
            hull() {
                translate([0, 142.2, 17.5 + 275/2])
                cube([9.6, 0.1, 265], center=true);

                translate([0, 138, 17.5 + 275/2])
                cube([11.9, 0.1, 275], center=true);

//                translate([-5.5, 143, 0])
//                cylinder(
//                    d=2, h=1000, center=true, $fn=20
//                );
//
//                translate([5.5, 143, 0])
//                cylinder(
//                    d=2, h=1000, center=true, $fn=20
//                );
            }
//            intersection() {
//                tube(
//                    289.2, 1000, 5,
//                    center=true, $fn=200
//                );
//
//                union() {
//                    translate([0, 200/2, 20 + 260/2])
//                    cube([10, 200, 260], center=true);
//
//                    hull() {
//                        translate([
//                            0, 289.2/2 - 5.05,
//                            20 + 260/2
//                        ])
//                        cube(
//                            [10.6, 0.1, 260],
//                            center=true
//                        );
//
//                        translate([
//                            0, 289.2/2 - 4.55,
//                            20 + 260/2
//                        ])
//                        cube(
//                            [10, 0.1, 260],
//                            center=true
//                        );
//
//                    }
//                }
//            }
//
//            rotate([0, 0, 360/ssteps * i])
//            translate([0, 284/2, 0])
//            cylinder(d=0.1, h=500, center=true);
        }
    }
}

module new_trash_bin_top_lid() {
    module _lid_filled() {
        union() {
            scale([1.4, 1.4, 1.4])
            _orig_top_lid();

            translate([-149, 0, 10/2])
            cube([5, 24, 10], center=true);

            translate([149, 0, 10/2])
            cube([5, 24, 10], center=true);
        }

    }

    %_lid_filled();

    difference() {
        hull() {
            cylinder(d=307, h=22, $fn=200);
            cylinder(d=298, h=57, $fn=200);
        }

        difference() {
            cylinder(
                d=293.5, h=200,
                center=true, $fn=200
            );

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                hull() {
                    translate([0, 296/2, 22 - 5/2])
                    cube([9, 10, 5], center=true);

                    translate([0, 296/2 + 1, 22 - 12/2])
                    cube([20, 1, 12], center=true);

                }
            }

            translate([-149, 0, 11/2])
            cube([5.6, 24, 11], center=true);

            translate([149, 0, 11/2])
            cube([5.6, 24, 11], center=true);
        }

        difference() {
            translate([0, 0, 9.8/2])
            rotate([0, 90, 0])
            chamfered_cylinder(
                11, 301.2, 5, center=true, $fn=60
            );

            cube([280, 12, 24], center=true);
        }

        translate([0, 0, 57])
        tube(310, 30, 15);
    }

    difference() {
        union() {
            rounded_cylinder(
                273, 9.8, 2, $fn=200
            );

            translate([0, 0, 9.8/2])
            rotate([0, 90, 0])
            intersection() {
                chamfered_cylinder(
                    11, 300.5, 5, center=true, $fn=60
                );

                cube([9.8, 12, 1000], center=true);
            }

            hull() {
                cylinder(d=47, h=10, $fn=50);

                translate([-0, 0, 15])
                cylinder(d=37, h=10, $fn=50);
            }

            hull() {
                cylinder(d=29, h=10, $fn=50);

                translate([0, 0, 0])
                cylinder(d=20, h=90, $fn=50);

                translate([0, 0, 70])
                donut(60, 20, $fn=50);
            }
        }

        // bottom cuts
        difference() {
            for(i = [0:9]) {
                cube_donut(60 + i*20, 4, $fn=80);
            }

            difference() {
                union() {
                    cube([10, 300, 20], center=true);
                    cube([300, 10, 20], center=true);
                }

                for(i = [0:3])
                rotate([0, 0, i*90])
                for(i = [0:9]) {
                    rotate([
                        0, 0, 5.2/(2*PI*(30 + i*10))*360
                    ])
                    translate([0, 30 + i*10, 0])
                    cylinder(
                        d=6, h=20, center=true, $fn=20
                    );

                    rotate([
                        0, 0, -5.2/(2*PI*(30 + i*10))*360
                    ])
                    translate([0, 30 + i*10, 0])
                    cylinder(
                        d=6, h=20, center=true, $fn=20
                    );
                }
            }
        }

        // top cut
        difference() {
            translate([0, 0, 4])
            chamfered_cylinder(260, 50, 6, $fn=200);

            translate([0, 0, 4 - 20])
            chamfered_cylinder(70, 26, 6, $fn=200);

            translate([0, 0, 9.8])
            chamfered_cylinder(90, 100, 16, $fn=200);

            for(i = [0:7]) {
                rotate([0, 0, i*360/8])
                cube([2, 300, 30], center=true);
            }
        }
    }
}

module test_bin() {
    union() {
        translate([0, -130, -30])
        intersection() {
            new_trash_bin_large_main_body();

            translate([100/2 - 20, 140, 40])
            cube([110, 50, 20], center=true);
        }

        translate([-20, -40/2 + 10, 0.45/2])
        cube([10, 40, 0.45], center=true);

        translate([-20, -39/2 + 10, 0.65/2])
        cube([10, 39, 0.65], center=true);

        translate([-20, -38/2 + 10, 0.85/2])
        cube([10, 38, 0.85], center=true);

        translate([-20, -37/2 + 10, 1.05/2])
        cube([10, 37, 1.05], center=true);

        translate([-20, -36/2 + 10, 1.25/2])
        cube([10, 36, 1.25], center=true);

        translate([-20, -35/2 + 10, 1.45/2])
        cube([10, 35, 1.45], center=true);

        translate([-20, -34/2 + 10, 1.65/2])
        cube([10, 34, 1.65], center=true);

        translate([-20, -33/2 + 10, 1.85/2])
        cube([10, 33, 1.85], center=true);


        translate([-20, -30/2 + 10, 2.15/2])
        cube([9, 30, 2.15], center=true);

        translate([-20, -29/2 + 10, 2.45/2])
        cube([9, 29, 2.45], center=true);

        translate([-20, -28/2 + 10, 2.75/2])
        cube([9, 28, 2.75], center=true);

        translate([-20, -27/2 + 10, 3.05/2])
        cube([9, 27, 3.05], center=true);

        translate([-20, -26/2 + 10, 3.35/2])
        cube([9, 26, 3.35], center=true);

        translate([-20, -25/2 + 10, 3.65/2])
        cube([9, 25, 3.65], center=true);
    }
}

module test_bin_2() {

    translate([0, -130, -30])
    intersection() {
        new_trash_bin_large_main_body();

        translate([0, 0, 30])
        cylinder(d=400, h=10);
    }
}