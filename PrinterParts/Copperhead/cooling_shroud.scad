use <../../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;

//debug();

//copperhead();
//parent_duct();

//new_duct();
duct_frame();
//duct_mount();



module parent_duct() {
    stl_path = 
        "../../_downloaded/Cooling Duct for Prusa MK3 with Slice Hot End/";

    import(str(stl_path, "cooling_duct_r2.STL"), convexity=10);
}

module new_duct() {

    union() {
        difference() {
            union() {
                translate([17, 35, 0])
                rotate([0, 0, 180])
                parent_duct();

                // hole fill
                //translate([-14.9, -5, 9.5])
                //rotate([-50, 0, 0])
                //cylinder(d=4, h=5);

                //translate([-15, -6, 11])
                //rotate([-90, 0, 0])
                //cylinder(d=7, h=4);

                translate([-22/2 + 0.2, -9.5, 7.5])
                rotate([40, 0, 0])
                cube([2, 4, 5], center=true);

                // new fan input hole
                translate([-0.4, -9, 8])
                difference() {
                    rotate([20, 0, 0])
                    translate([0, 0, -1.25])
                    cube([22.8, 18, 7.5], center=true);

                    translate([0, 0, -10])
                    rotate([40, 0, 0])
                    cube([23, 27, 12], center=true);
                }

            }

            // fan input top cut
            translate([13, 0, 15.84])
            rotate([20, 0, 0])
            translate([0, -11.15, 0])
            cube([10, 15.3, 5], center=true);

            // fan input hole
            translate([-0.5, -9, 8])
            difference() {
                rotate([20, 0, 0])
                cube([19.5, 15.3, 9], center=true);
             
                translate([0, 0, -7.5])
                rotate([40, 0, 0])
                cube([23, 27, 6], center=true);   
            }

            // attempt to round the input
            translate([-0.4, -13.7, 2/2 + 1])
            hull() {
                translate([-8.9, 0, 0])
                sphere(d=2, $fn=30);

                translate([8.9, 0, 0])
                sphere(d=2, $fn=30);

                translate([-8.9, 2, 0])
                sphere(d=2, $fn=30);

                translate([8.9, 2, 0])
                sphere(d=2, $fn=30);
            }

            // back slope cut
            translate([0, -18, 0])
            rotate([20, 0, 0])
            cube([40, 5, 20], center=true);

            // fan notch
            translate([-22/2, -10, 11])
            rotate([20, 0, 0])
            cube([3, 3, 5], center=true);

            // more side cuts
//            difference() {
//                translate([-19, -5, 10])
//                cube([10, 10, 10], center=true);
//
//                translate([-11.12, -15, 0.531])
//                rotate([-90, 0, 0])
//                hull() {
//                    rotate([0, -20.1, 0])
//                    cylinder(d=2, h=40, $fn=80);
//
//                    rotate([40, 0, 0])
//                    rotate([0, -15.655, 0])
//                    cylinder(d=2, h=40, $fn=80);
//
//                    rotate([40, 0, 0])
//                    cylinder(d=2, h=40, $fn=80);
//                }
//            }
        }
        
    }
}

module duct_frame(supports=true) {

    module _duct_frame() {

        union() {

            // fan mount studs
            rotate([20, 0, 0])
            translate([-5.5, 1.9, 56.2])
            rotate([-90, 0, 0])
            cylinder(d=10, h=7, $fn=20);

            rotate([20, 0, 0])
            translate([37, 1.9, 18.2])
            rotate([-90, 0, 0])
            cylinder(d=10, h=7, $fn=20);

            // beam between studs
            hull() {
                rotate([20, 0, 0])
                translate([-5.5, 1.9, 56.2])
                rotate([-90, 0, 0])
                cylinder(d=8, h=3, $fn=20);

                rotate([20, 0, 0])
                translate([37, 1.9, 18.2])
                rotate([-90, 0, 0])
                cylinder(d=8, h=3, $fn=20);
            }

            // vertical beam
            hull() {
                rotate([20, 0, 0])
                translate([-6.6, 1.9, 54])
                rotate([-90, 0, 0])
                cylinder(d=8, h=3, $fn=20);

                rotate([20, 0, 0])
                translate([-6.6, 1.9 + 3/2, 13.6])
                cube([8, 3, 1], center=true);
            }

            // bottom beam
            hull() {
                rotate([20, 0, 0])
                translate([37, 1.9, 18.2])
                rotate([-90, 0, 0])
                cylinder(d=8, h=3, $fn=20);

                rotate([20, 0, 0])
                translate([-3, 1.9, 17.1])
                rotate([-90, 0, 0])
                cylinder(d=8, h=3, $fn=20);
            }

            // left mount plate
            difference() {
                hull() {
                    translate([-8.9, 15, 45.8])
                    rotate([0, -90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([-8.9, 27, 45.8])
                    rotate([0, -90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([-8.9, 12, 26])
                    rotate([0, -90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([-8.9, -1, 16.75])
                    rotate([0, -90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([-8.9, -22, 36])
                    rotate([0, -90, 0])
                    cylinder(d=6, h=2.4, $fn=30);
                }

                // fan hole
                translate([-10, 21, 33])
                intersection() {
                    rotate([0, 90, 0])
                    cylinder(d=24.2, h=10, center=true, $fn=50);

                    cube([25, 25, 20], center=true);
                }
            }

            // duct mount ruler
            translate([-11.3, 7/2, 25])
            rotate([0, 0, 45])
            cube([2, 2, 12], center=true);

            // duct mount nut stud
            translate([-10, 7/2, 24])
            rotate([0, 90, 0])
            cylinder(d=9, h=6, $fn=30);

            hull() {
                translate([-7, -4, 2/2 + 20])
                rotate([20, 0, 0])
                cube([4, 1, 2], center=true);

                translate([-6.5, 0, 2/2 + 21])
                rotate([20, 0, 0])
                cube([7, 1, 2], center=true);
            }

            // right mount plate
            difference() {
                // main form
                hull() {
                    translate([11.1, 15, 45.8])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([11.1, 27, 45.8])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([11.1, 15, 20.2])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([11.1, 24, 20.2])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=2.4, $fn=30);


                    translate([11.1, -2, 18])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=2.4, $fn=30);

                    translate([11.1, -22, 36])
                    rotate([0, 90, 0])
                    cylinder(d=6, h=2.4, $fn=30);
                }

                // fan hole
                translate([10, 21, 33])
                rotate([0, 90, 0])
                cylinder(d=23.5, h=10, center=true, $fn=50);
            }

            // fan mount hole body
            difference() {
                translate([9.5, 8.2, 39])
                rotate([0, 90, 0])
                cylinder(d=5.5, h=7, center=true, $fn=20);

                translate([0, 21, 33])
                sphere(d=31, $fn=50);

                translate([12, 21, 33])
                rotate([0, 90, 0])
                cylinder(d=24.2, h=10, center=true, $fn=50);
            }

            // heatsink cover
            translate([0, 21, 33])
            union() {
                difference() {
                    //sphere(d=32, $fn=50);
                    translate([2, 0, 5])
                    rotate([20, 0, 0])
                    cube([22, 62, 22], center=true);

                    sphere(d=29, $fn=50);

                    translate([0, 0, 20/2 + 9])
                    cube([40, 60, 20], center=true);

                    translate([0, 0, -20/2 - 9])
                    cube([40, 40, 20], center=true);

                    translate([0, 20, 0])
                    cube([40, 40, 40], center=true);

                    translate([-10, 0, 0])
                    rotate([0, 90, 0])
                    cylinder(d=24.2, h=20, center=true, $fn=50);

                    translate([10, 0, 0])
                    rotate([0, 90, 0])
                    cylinder(d=23.5, h=20, center=true, $fn=50);
                }

                translate([10.5, 0, 0])
                intersection() {
                    rotate([0,90,0])
                    tube(25.5, 2, 1, center=true, $fn=50);

                    translate([0, -10, 0])
                    cube([10, 20, 18], center=true);
                }
            }
        }
    }

    module _duct_frame_holes() {

        // 
        rotate([20, 0, 0])
        translate([-5.5, 5, 56.2])
        rotate([-90, 0, 0]) {
            cylinder(d=3.3, h=27, center=true, $fn=20);

            rotate([0, 0, 30])
            M3_nut(5);
        }

        rotate([20, 0, 0])
        translate([37, 5, 18.2])
        rotate([-90, 0, 0]) {
            cylinder(d=3.3, h=27, center=true, $fn=20);

            rotate([0, 0, 30])
            M3_nut(5);
        }

        // duct mount hole
        translate([0, 7/2, 24])
        rotate([0, 90, 0]) {
            translate([0, 0, -8])
            cylinder(d=3.3, h=13, center=true, $fn=20);

            translate([0, 0, -7])
            rotate([0, 0, -10])
            M3_nut(6.5, cone=false);
        }

        // duct mount nut opening
        translate([-2.25, 1.55, 20.45])
        cube([3.5, 2, 5], center=true);

        translate([-2.25, 6.55, 23.8])
        rotate([55, 0, 0])
        cube([3.5, 2, 4], center=true);

        // hotend fan holes
        translate([0, 27, 45.8])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=40, center=true, $fn=20);

        translate([0, 15, 20.2])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=40, center=true, $fn=20);

        translate([13.3, 8.2, 39])
        rotate([0, 90, 0])
        cylinder(d=2.2, h=10, center=true, $fn=20);

        // extra hole for cable management
        translate([-10, 6, 39])
        rotate([0, 90, 0])
        cylinder(d=2.8, h=10, center=true, $fn=20);

        // back slope cut
        rotate([20, 0, 0])
        translate([0, -20/2 + 1.9, 80/2])
        cube([80, 20, 80], center=true);

        rotate([20, 0, 0])
        translate([3, 0, 29])
        difference() {
            chamfered_cube(16, 31, 16, 3, center=true);

            translate([0, 31/2, -20/2 - 2])
            rotate([45, 0, 0])
            cube([20, 50, 20], center=true);
        }
    }

    rotate([70, 0, 0])
    difference() {
        _duct_frame();

        _duct_frame_holes();
    }
}

module duct_mount() {

    difference() {
        hull() {
            translate([0, 0, 7/2])
            cube([5.2, 14, 7], center=true);

            translate([-1, 12.5, 0])
            cylinder(d=9, h=7, $fn=20);

            translate([-4, 18, 7/2])
            cube([4, 12, 7], center=true);
        }

        translate([5.2/2 + 2/2, 2.1, 0])
        rotate([-54.6, 0, 0])
        cube([2, 30, 15], center=true);

        translate([0, 10/2 + 15.9, 8/2 - 0.1])
        cube([8, 10, 8], center=true);

        translate([5.2/2, -2.5, 7/2])
        rotate([0, 45, 0])
        cube([2.1, 20, 2.1], center=true);

        translate([-1, 1, 7/2])
        rotate([0, -90, 0]) {
            cylinder(d=3.3, h=20, center=true, $fn=30);

            cylinder(d=6.5, h=5, $fn=30);
        }

        translate([-0.9, 12.5, 3]) {
            cylinder(d=3.3, h= 20, center=true, $fn=20);

            M3_nut(5);
        }
    }
}

module debug() {
    %translate([-10, -23.15, 14.2])
    rotate([110, 0, 0])
    import(
        "../../_downloaded/50mm_Radial_fan/50mm_fan.stl");

    // tronxy front
//    %translate([0, -56 -20/2, 53 - 10])
//    cube([100, 20, 20], center=true);

    rotate([0, 0, 90])
    copperhead(block_rotation=-90);

    rotate([0, 0, 90])
    translate([0, -18.8, 36])
    rotate([90, -20, 0])
    25mm_fan();

    translate([0, -21, 3])
    new_duct();

    translate([0, -21, 3])
    rotate([-70, 0, 0])
    duct_frame(supports=false);

    translate([-14, -21, 28])
    rotate([-90, 0, 0])
    duct_mount();
}