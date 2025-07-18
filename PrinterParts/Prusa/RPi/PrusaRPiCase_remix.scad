include <../../../Dollo/NEW_long_ties/include.scad>;

use <../../../Original-Prusa-i3/AluParts/alu-frame.scad>;
use <../../../Buck_converter_box/Buck_converter_box.scad>;


stl_base_path = "../../../_downloaded/";
p_stl_path = str(
    stl_base_path,
    "Prusa/"
);
r_stl_path = str(
    stl_base_path,
    "Raspberry Pi 4/"
);


//_orig_rpi3_base();
//_orig_rpi3_case_lid();
//_rpi_4();

//debug_RPI4_case();
//debug_RPI4_case_buck_converter();

//RPI4_base();
RPI4_case_lid();

//RPI4_case_buck_converter_adapter();


module _orig_rpi3_base() {
    translate([-45.5, 35.2, 0])
    import(
        str(p_stl_path, "RPI3_base.stl"),
        convexity=10
    );
}

module _orig_rpi3_case_lid() {
//    translate([-45.5, -37, 0])
//    import(
//        str(p_stl_path, "RPI3_case_lid.stl"),
//        convexity=10
//    );

    translate([-0.5, -1, 0])
    import(
        "RPI3_case_lid_tk.stl",
        convexity=10
    );
}

module _rpi_4() {
    rotate([90, 0, -0])
    import(
        str(r_stl_path, "Raspberry Pi 4 Model B.stl"),
        convexity=10
    );
}


module debug_RPI4_case() {
    translate([21.2, 33, 317.5])
    rotate([180, 90, 0])
    union() {
        RPI4_base();

        translate([0, 0, 23.1])
        rotate([180, 0, 0])
        RPI4_case_lid();
    }

    rotate([90, 0, 0])
    orig_frame();
}

module debug_RPI4_case_buck_converter() {
    translate([21.2, 32.5, 317.5])
    rotate([180, 90, 0])
    union() {
        RPI4_base();

        translate([0, 0, 23.1])
        rotate([180, 0, 0])
        RPI4_case_lid();
    }

//    rotate([90, 0, 0])
//    orig_frame();

    translate([39, 7.1, 315])
    rotate([90, 0, 180])
    debug_box2();

    translate([39, 4, 315])
    rotate([-90, 0, 0])
    RPI4_case_buck_converter_adapter();
}

module RPI4_base() {
//    %translate([0, 0, 6.8])
//    _rpi_4();

    difference() {
        union() {
            _orig_rpi3_base();

            translate([-21, -29.525, 7.02])
            cube([40, 2, 6], center=true);

            // usb nubs
            translate([43.5, 8, 8])
            cube([2, 3, 4], center=true);

            translate([43.5, -10.05, 8])
            cube([2, 3, 4], center=true);

            // arm hole fill
            translate([11, 29.973, 2/2 + 0.02])
            cube([22, 5, 2], center=true);

            translate([11, 30.473, 10/2 + 0.02])
            cube([22, 4, 10], center=true);
            
        }

        translate([45, -7.05, 12.4211])
        cube([10, 3, 10], center=true);

        translate([45, 11, 12.4211])
        cube([10, 3, 10], center=true);

        translate([11.5, -30, 10.6])
        rotate([90, 0, 0])
        cylinder(d=7, h=10, center=true, $fn=40);

        translate([-31.28, -30, 12])
        cube([10, 10, 10], center=true);

        translate([-31.28, -34.5, 12])
        cube([12, 10, 12], center=true);

        translate([-16.5, -30, 12])
        cube([7, 10, 10], center=true);

        translate([-16.5, -34.5, 12])
        cube([9, 10, 12], center=true);

        translate([-3, -30, 12])
        cube([7, 10, 10], center=true);

        translate([-3, -34.5, 12])
        cube([9, 10, 12], center=true);

        // arm holes
        hull() {
            translate([44, 30.473, 0])
            cube([22, 4.5, 1], center=true);

            translate([44, 30.473, 20])
            cube([49, 4.5, 1], center=true);
        }

        hull() {
            translate([-44, 30.473, 0])
            cube([21, 4.5, 1], center=true);

            translate([-44, 30.473, 20])
            cube([38, 4.5, 1], center=true);
        }

    }
}

module RPI4_case_lid() {
    %translate([0, 0, 16])
    rotate([180, 0, 0])
    _rpi_4();

//    %translate([37, 0, 0])
//    _orig_rpi3_case_lid();

    module _case_lid_p1() {
        difference() {
            union() {
                intersection() {
                    _orig_rpi3_case_lid();

                    difference() {
                        cube([100, 100, 200], center=true);

                        translate([41, -0.93, 20/2 + 2])
                        cube([30, 21.15, 20], center=true);
                    }
                }

                // arms
                hull() {
                    //translate([38, -30.5, 1/2])
                    //cube([40, 4, 1], center=true);

                    translate([28, -30.5, 1/2])
                    cube([20, 4, 1], center=true);

                    translate([54, -30.5, 8/2])
                    rotate([90, 0, 0])
                    cylinder(d=8, h=4, center=true, $fn=40);

                    translate([48, -30.5, 30])
                    cube([20, 4, 1], center=true);
                }

                hull() {
                    translate([48, -30.5, 30])
                    cube([20, 4, 1], center=true);

                    translate([54, -30.5, 53])
                    rotate([90, 0, 0])
                    cylinder(d=8, h=4, center=true, $fn=40);

                    translate([42, -30.5, 53])
                    rotate([90, 0, 0])
                    cylinder(d=8, h=4, center=true, $fn=40);
                }

                hull() {
                    translate([-42.5, -30.5, 32])
                    rotate([90, 0, 0])
                    cylinder(d=10, h=4, center=true, $fn=40);

                    translate([-36, -30.5, 6 + 1/2])
                    cube([18, 4, 1], center=true);
                }

                translate([11, -30.5, 8/2 + 3])
                cube([10, 4, 8], center=true);

                // fills
                translate([-21, 29.5, 10])
                cube([40, 2, 6], center=true);

                translate([34.5, -19, 1.4/2])
                cube([20, 16, 1.4], center=true);

                translate([34.5, -8, 2/2])
                cube([20, 4, 2], center=true);

                translate([33.25, 18.5, 2/2])
                cube([22.5, 18, 2], center=true);

                // screw hole fills
                translate([19, 24.5, 0])
                cylinder(d=8, h=5.2, $fn=30);

                translate([19, -24.5, 0])
                cylinder(d=8, h=5.2, $fn=30);

                translate([-39, 24.5, 0])
                cylinder(d=8, h=5.2, $fn=30);

                translate([-39, -24.5, 0])
                cylinder(d=8, h=5.2, $fn=30);
            }
            // arm delete
            translate([11, -31.2, 50/2 + 13])
            cube([21, 6, 50], center=true);

            // arm holes
            translate([48, -25, 49.9])
            rotate([90, 0, 0])
            cylinder(d=3.3, h=20, $fn=30);

            translate([48, -25, 49.9])
            rotate([90, 0, 0])
            cylinder(d=6.6, h=5.2, $fn=30);

            translate([48, -25, 7.4])
            rotate([90, 0, 0])
            cylinder(d=3.3, h=20, $fn=30);

            translate([48, -25, 7.4])
            rotate([90, 0, 0])
            cylinder(d=6.6, h=5.2, $fn=30);

            translate([-42.5, -25, 32])
            rotate([90, 0, 0])
            cylinder(d=2.7, h=20, $fn=30);

            // audio jack hole
            translate([11.5, 30, 12.2])
            rotate([90, 0, 0])
            cylinder(d=7, h=10, center=true, $fn=40);

            // power and hdmi connectors
            translate([-31.28, 30, 16.5])
            cube([10, 20, 10], center=true);

            translate([-31.28, 34.5, 16.5])
            cube([12, 10, 12], center=true);

            translate([-16.5, 30, 16.5])
            cube([7, 10, 10], center=true);

            translate([-16.5, 34.5, 16.5])
            cube([9, 10, 12], center=true);

            translate([-3, 30, 16.5])
            cube([7, 10, 10], center=true);

            translate([-3, 34.5, 16.5])
            cube([9, 10, 12], center=true);

            // usb cuts
            translate([35, -18, 1.4 + 1/2])
            cube([23, 16.9, 1], center=true);

            translate([36.5, 1, 0])
            cube([20, 14, 5], center=true);

            translate([36.5, 19, 0])
            cube([20, 14, 30], center=true);

            // lid screw holes
            translate([19, 24.5, 0])
            cylinder(d=6.6, h=10, center=true, $fn=30);

            translate([19, -24.5, 0])
            cylinder(d=6.6, h=10, center=true, $fn=30);

            translate([-39, 24.5, 0])
            cylinder(d=6.6, h=10, center=true, $fn=30);

            translate([-39, -24.5, 0])
            cylinder(d=6.6, h=10, center=true, $fn=30);
        }
    }

    union() {
        _case_lid_p1();

        translate([0, 2, 0])
        intersection() {
            _orig_rpi3_case_lid();

            union() {
                translate([41, -9.99, 20/2 + 1])
                cube([30, 3, 20], center=true);

                translate([41, 8.07, 20/2 + 1])
                cube([30, 3, 20], center=true);
            }
        }
    }
}

module RPI4_case_buck_converter_adapter() {
    difference() {
        union() {
            linear_extrude(3)
            projection(cut=true)
            box2_top();

            hull() {
                translate([9, 45.5, 0])
                cylinder(d=10, h=3, $fn=30);

                translate([9, 32, 3/2])
                cube([11, 1, 3], center=true);
            }

            hull() {
                translate([-8.9, -45, 0])
                cylinder(d=10, h=3, $fn=30);

                translate([-8.9, -32, 3/2])
                cube([11, 1, 3], center=true);
            }
        }
        // center delete
        cube([21, 45, 20], center=true);
        
        // buck screw holes
        translate([26.2/2 - 2.6, 61.7/2 - 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        translate([-26.2/2 + 2.5, 61.7/2 - 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        translate([26.2/2 - 2.6, -61.7/2 + 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        translate([-26.2/2 + 2.5, -61.7/2 + 2.8, -0.1]) {
            cylinder(d=3.2, h=15, center=true, $fn=20);
            cylinder(d1=7.3, d2=3.2, h=2.1, $fn=20);
        }
        
        
        // mount screw holes
        translate([9, 45.5, 6.5]) {
            cylinder(d=3.3, h=20, center=true, $fn=20);
            cylinder(d=6.6, h=10, center=true, $fn=30);
        }

        translate([-8.9, -45, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

    }
}