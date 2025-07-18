use <../Dollo/NEW_long_ties/include.scad>;

use <../Micro_Plastic_Shredder_remix/common.scad>;



//debug_table();
//debug_large();
//debug_medium();
//debug_jar_adapter();


//_M5_bolt();
//_M5_bolt_head_hole();
//_M3_screw_hole();

//_shredder_body_large();
//_shredder_body_medium();


//micro_shredder_large_body_1();
//micro_shredder_large_body_1_1();
//micro_shredder_large_body_1_2();
//micro_shredder_large_body_2();

//micro_shredder_large_spacer();

//micro_shredder_medium_body_1();
//micro_shredder_medium_body_1_1();
//micro_shredder_medium_body_1_2();
//micro_shredder_medium_body_2();

//micro_shredder_medium_spacer();

//attachment_nut_holder_large();
//attachment_nut_holder_medium();

//neck_large();
//neck_medium();

//neck_nut_holder_large();
//neck_nut_holder_medium();

//hopper_large();
//hopper_medium();

//jar_adapter_large();
//jar_adapter_medium();

//jar_extender();

//plunger_large();
//plunger_large_thin();
//pelletizer_large();

//plunger_medium();
//plunger_medium_thin();
//pelletizer_medium();


//table_mount_large();
//table_mount_medium();

//table_mount_flex_spacer();
//table_reinforcement_top();
//table_reinforcement_bottom();

table_reinforcement_jig();


module debug_table() {
    // table
    %translate([0, 200/2 + 45.5, 50/2 - 10])
    cube([500, 200, 50], center=true);

    // 8mm rod
    translate([31, 40 + 13/2 + 18.5, 0])
    cylinder(d=8, h=200, center=true, $fn=30);

    // table parts
    translate([0, 35.5, 50])
    rotate([0, 180, 0])
    table_reinforcement_top();

    translate([0, 35.5, -10])
    rotate([0, 180, 0])
    table_reinforcement_bottom();

//    translate([0, 45.5, 42])
//    rotate([0, 180, 0])
//    table_reinforcement_jig();
}

module debug_large() {

    debug_table();

    rotate([-12, 0, 0]) {
        %translate([47.35, 0, 100])
        rotate([0, -90, 0])
        _router_bit_large();

        %translate([0, -3/2 + 19/2, 151.2])
        rotate([90, 0, 0])
        mock_steel_plate();

        render()
        translate([0, 0, 90/2 + 55])
        rotate([90, 0, 0])
        intersection() {
            union() {
                micro_shredder_large_body_1();
                micro_shredder_large_body_1_1();
                micro_shredder_large_body_1_2();

                translate([20.5, -36, 0])
                rotate([90, 0, 25])
                translate([0, 0, 2])
                attachment_nut_holder_large();
            }

//            translate([-15, 0, 0])
//            cube([20, 200, 200], center=true);
        }

//        render()
//        translate([0, 0, 90/2 + 55])
//        rotate([90, 0, 180])
//        micro_shredder_large_body_2();

        intersection() {
            translate([0, 0, 90 + 55])
            neck_large();

            translate([100/2, 0, 0])
            cube([100, 200, 500], center=true);
        }

        %translate([20, -20, 85])
        rotate([-90, 0, 0])
        _M5_bolt();

        translate([0, 0, 55])
        rotate([180, 0, 0])
        jar_adapter_large();

        translate([0, 6.5, -29])
        rotate([12, 0, 0])
        jar_extender();

        intersection() {
            translate([0, 20, 100])
            rotate([-90, 0, 0])
            table_mount_large();

            translate([-200/2, 0, 0])
            cube([200, 200, 400], center=true);
        }

//        translate([11, -2.5, 210.7])
//        rotate([12, 0, 0])
//        rotate([90, 0, -90])
//        plunger_large();

//        translate([11, -2.5, 210.7])
//        rotate([12, 0, 0])
//        rotate([90, 0, -90])
//        plunger_large_thin();

        translate([0, -1.5, 155.25])
        rotate([90, 0, 180])
        pelletizer_large();

    }

//    translate([0, 40.6, 185.85])
//    intersection() {
//        hopper_large();
//
//        translate([200/2, 0, 0])
//        cube([200, 200, 200], center=true);
//    }
}

module debug_medium() {

    debug_table();

    rotate([-12, 0, 0]) {
//        %translate([47.35, 0, 100])
//        rotate([0, -90, 0])
//        _router_bit();

//        %translate([0, -3/2 + 19/2, 151.2])
//        rotate([90, 0, 0])
//        mock_steel_plate();

        render()
        translate([0, 2.5, 90/2 + 55])
        rotate([90, 0, 0])
        intersection() {
            union() {
                micro_shredder_medium_body_1();
//                micro_shredder_medium_body_1_1();
//                micro_shredder_medium_body_1_2();

                translate([22.5, -36, 0])
                rotate([90, 0, 25])
                translate([0, 0, 2])
                attachment_nut_holder_medium();
            }

//            translate([-15, 0, 0])
//            cube([20, 200, 200], center=true);
        }

//        render()
//        translate([0, 2.5, 90/2 + 55])
//        rotate([90, 0, 180])
//        micro_shredder_medium_body_2();

        intersection() {
            translate([0, 2.5, 90 + 55])
            neck_medium();

            translate([100/2, 0, 0])
            cube([100, 200, 500], center=true);
        }

        %translate([23, -17.5, 85])
        rotate([-90, 0, 0])
        _M5_bolt();

        translate([0, 2.5, 55])
        rotate([180, 0, 0])
        jar_adapter_medium();

        translate([0, 6.5, -29])
        rotate([12, 0, 0])
        jar_extender();

        intersection() {
            translate([0, 20, 100])
            rotate([-90, 0, 0])
            table_mount_medium();

            translate([-200/2, 0, 0])
            cube([200, 200, 400], center=true);
        }

//        translate([14.5, -0.5, 212.8])
//        rotate([12, 0, 0])
//        rotate([90, 0, -90])
//        plunger_medium();

//        translate([14.5, -0.5, 212.8])
//        rotate([12, 0, 0])
//        rotate([90, 0, -90])
//        plunger_medium_thin();

        translate([0, 0.75, 153.8])
        rotate([90, 0, 180])
        pelletizer_medium();

    }

//    translate([0, 43, 185.25])
//    intersection() {
//        hopper_medium();
//
//        translate([200/2, 0, 0])
//        cube([200, 200, 200], center=true);
//    }
}

module debug_jar_adapter() {
    intersection() {
        translate([0, 11.12, 83.2])
        rotate([168, 0, 0])
        jar_adapter();

        translate([100/2, 0, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        jar_extender();

        translate([100/2, 0, 0])
        cube([100, 100, 300], center=true);

    }
}


module _M5_bolt() {
    union() {
        cylinder(d=5, h=55, $fn=30);
        cylinder(d=8.5, h=5, $fn=30);
    }
}

module _M5_bolt_head_hole() {
    intersection() {
        union() {
            cylinder(d=9.6, h=10, $fn=30);

            translate([0, 0, 10.2/2])
            cube([5.3, 10, 10.2], center=true);

            translate([0, 0, 10.4/2])
            cube([5.3, 5.2, 10.4], center=true);
        }

        cylinder(d=9.5, h=20, $fn=30);
    }
}

module _M3_screw_hole(l=16) {
    union() {
        cylinder(d=3.3, h=l, $fn=30);
        cylinder(d=5.9, h=0.2, $fn=30);

        translate([0, 0, 0.2])
        cylinder(d1=5.9, d2=3, h=1.6, $fn=30);
    }
}

module mock_steel_plate() {
    l = 100;

    difference() {
        cube([22.8, l, 3], center=true);

        translate([-6, -l/2 + 15.3, 0])
        cylinder(d=4, h=12, center=true, $fn=30);

        translate([6, -l/2 + 15.3, 0])
        cylinder(d=4, h=12, center=true, $fn=30);

        translate([0, l/2 - 22.7, 0])
        cylinder(d=4, h=12, center=true, $fn=30);

        translate([0, -l/2 - 3, 0])
        rotate([-50, 0, 0])
        cube([40, 6, 20], center=true);

        translate([0, l/2 + 3, 0])
        rotate([50, 0, 0])
        cube([40, 6, 20], center=true);
    }
}

module _shredder_body_large() {
    difference() {
        cube([60, 90, 40], center=true);

        // schute
        cube([23, 120, 19], center=true);

        translate([0, -100/2, 0])
        cube([24, 100, 19], center=true);

        translate([0, -15, 0])
        hull() {
            cube([24, 1, 19], center=true);

            translate([0, -90/2 + 15, 0])
            cube([32, 1, 25], center=true);
        }

        // router bit cuts
        rotate([0, 90, 0])
        cylinder(d=11, h=100, center=true, $fn=60);

        translate([-4.7, 0, 0])
        rotate([0, 90, 0])
        cylinder(d=19.1, h=36, center=true, $fn=60);

        translate([16.9, 0, 0])
        rotate([0, -90, 0])
        cylinder(d=22.1, h=7.5, center=true, $fn=60);

        translate([20, 0, 0])
        rotate([0, 90, 0])
        cylinder(d=18, h=20, $fn=60);

        translate([22, 0, 0])
        rotate([0, 90, 0])
        cylinder(d1=18, d2=47, h=20, $fn=60);

        // screw holes
        translate([-20, 15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([-20, -15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([20, 15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([20, -15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([-20, 32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([-20, -32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([20, 32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([20, -32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        // attachment mount holes
        #translate([20.5, -36, -12])
        rotate([90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([20.5, 36, -12])
        rotate([-90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-20.5, 36, -12])
        rotate([-90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-20.5, -36, -12])
        rotate([90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([20.5, -36, 12])
        rotate([90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([20.5, 36, 12])
        rotate([-90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-20.5, 36, 12])
        rotate([-90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-20.5, -36, 12])
        rotate([90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        // attachment nut holder holes
        translate([20.5, -36, 0])
        rotate([0, 0, 25])
        translate([0, -4, 0])
        cube([9.2, 4.4, 34], center=true);

        translate([-20.5, -36, 0])
        rotate([0, 0, -25])
        translate([0, -4, 0])
        cube([9.2, 4.4, 34], center=true);

        translate([20.5, 36, 0])
        rotate([0, 0, -25])
        translate([0, 4, 0])
        cube([9.2, 4.4, 34], center=true);

        translate([-20.5, 36, 0])
        rotate([0, 0, 25])
        translate([0, 4, 0])
        cube([9.2, 4.4, 34], center=true);
    }

    %translate([47.4, 0, 0])
    rotate([0, -90, 0])
    _router_bit_large();
}

module _shredder_body_medium() {
    difference() {
        cube([62, 90, 35], center=true);

        // schute
        cube([30, 120, 12.7], center=true);

        translate([0, -100/2, 0])
        cube([30.3, 100, 12.7], center=true);

        translate([0, -15, 0])
        hull() {
            cube([30.3, 1, 12.7], center=true);

            translate([0, -90/2 + 15, 0])
            cube([36, 1, 23], center=true);
        }

        // router bit cuts
        rotate([0, 90, 0])
        cylinder(d=10, h=100, center=true, $fn=60);

        translate([-3.5, 0, 0])
        rotate([0, 90, 0])
        cylinder(d=12.8, h=50.5, center=true, $fn=60);

        translate([25.3, 0, 0])
        rotate([0, -90, 0])
        cylinder(d=19.1, h=7.5, center=true, $fn=60);

        translate([27, 0, 0])
        rotate([0, 90, 0])
        cylinder(d=16, h=20, $fn=60);

        // screw holes
        translate([-23, 15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([-23, -15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([23, 15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([23, -15, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([-23, 32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([-23, -32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([23, 32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        translate([23, -32, 0])
        cylinder(d=5.3, h=100, center=true, $fn=40);

        // attachment mount holes
        #translate([22.5, -36, -10])
        rotate([90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([22.5, 36, -10])
        rotate([-90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-22.5, 36, -10])
        rotate([-90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-22.5, -36, -10])
        rotate([90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([22.5, -36, 10])
        rotate([90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([22.5, 36, 10])
        rotate([-90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-22.5, 36, 10])
        rotate([-90, 0, 25])
        cylinder(d=3.2, h=30, $fn=30);

        translate([-22.5, -36, 10])
        rotate([90, 0, -25])
        cylinder(d=3.2, h=30, $fn=30);

        // attachment nut holder holes
        translate([22.5, -36, 0])
        rotate([0, 0, 25])
        translate([0, -4, 0])
        cube([9.2, 4.4, 30], center=true);

        translate([-22.5, -36, 0])
        rotate([0, 0, -25])
        translate([0, -4, 0])
        cube([9.2, 4.4, 30], center=true);

        translate([22.5, 36, 0])
        rotate([0, 0, -25])
        translate([0, 4, 0])
        cube([9.2, 4.4, 30], center=true);

        translate([-22.5, 36, 0])
        rotate([0, 0, 25])
        translate([0, 4, 0])
        cube([9.2, 4.4, 30], center=true);
    }

    %translate([61, 0, 0])
    rotate([0, -90, 0])
    _router_bit();
}

module micro_shredder_large_spacer() {
    translate([12, 0, 0])
    intersection() {
        _shredder_body_large();

        translate([-50/2, 0, 0])        
        cube([50, 200, 0.2], center=true);
    }

    translate([-12, 0, 0])
    intersection() {
        _shredder_body_medium();

        translate([50/2, 0, 0])        
        cube([50, 200, 0.2], center=true);
    }
}

module micro_shredder_large_body_1() {

    render()
    difference() {
        intersection() {
            _shredder_body_large();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);
        }

        // side cuts
        difference() {
            cube([60, 59, 19], center=true);

            translate([-20, 32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);

            translate([-20, -32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);

            translate([20, 32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);

            translate([20, -32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);
        }

        // metal plate cut
        translate([0, 0, -19/2 - 1.2/2])
        difference() {
            cube([34, 25.7, 1.21], center=true);

            translate([34/2, 0, 0])
            cube([8, 18, 5], center=true);

            translate([-34/2, 0, 0])
            cube([4, 18, 5], center=true);
        }

        translate([-60/2 + 26.5/2, 0, -19/2 + 10/2])
        cube([60, 10, 10], center=true);

        // side part screw holes
        translate([-24, 21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

        translate([-24, -21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

        translate([24, 21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

        translate([24, -21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);
//
//        // M5 nut holes
//        translate([-20, 15, -21])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([-20, -15, -21])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([-20, 32, -21])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([-20, -32, -21])
//        M5_nut(6, cone=false, bridging=true); 
//
//        translate([20, 15, -21])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([20, -15, -21])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([20, 32, -21])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([20, -32, -21])
//        M5_nut(6, cone=false, bridging=true);

        // metal plate adjustment screw holes
        translate([9, 0, 0])
        cylinder(d=4.3, h=100, center=true, $fn=30);

        translate([0, 0, 0])
        cylinder(d=4.3, h=100, center=true, $fn=30);

        translate([-9, 0, 0])
        cylinder(d=4.3, h=100, center=true, $fn=30);

        translate([9, 0, -19/2 - 4.4])
        rotate([0, 0, 30])
        M4_nut(5);

        translate([0, 0, -19/2 - 4.4])
        rotate([0, 0, 30])
        M4_nut(5);

        translate([-9, 0, -19/2 - 4.4])
        rotate([0, 0, 30])
        M4_nut(5);

        // adjustment holes
        hull() {
            translate([-6, 16, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);

            translate([-6, 17, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);
        }

        hull() {
            translate([6, 16, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);

            translate([6, 17, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);
        }

    }
}

module micro_shredder_large_body_1_1() {
    rotate([0, 0, 0])
    difference() {
        intersection() {
            _shredder_body_large();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);

            difference() {
                translate([-60/2, 0, 0])
                cube([60, 58.8, 19], center=true);

                translate([-20, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([-20, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([20, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([20, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );
            }
        }

        translate([-24, 21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([-24, -21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([-24, 21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

        translate([-24, -21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

    }
}

module micro_shredder_large_body_1_2() {
    rotate([0, 0, 0])
    difference() {
        intersection() {
            _shredder_body_large();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);

            difference() {
                translate([60/2, 0, 0])
                cube([60, 58.8, 19], center=true);

                translate([-20, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([-20, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([20, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([20, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );
            }
        }

        translate([24, 21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([24, -21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([24, 21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

        translate([24, -21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

    }
}

module micro_shredder_large_body_2() {
    difference() {
        intersection() {
            rotate([0, 180, 0])
            _shredder_body_large();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);
        }

        translate([-20, 15, -40/2 - 6])
        _M5_bolt_head_hole();

        translate([-20, -15, -40/2 - 6])
        _M5_bolt_head_hole();

        translate([-20, 32, -40/2 - 6])
        _M5_bolt_head_hole();

        translate([-20, -32, -40/2 - 6])
        _M5_bolt_head_hole(); 

        translate([20, 15, -40/2 - 6])
        _M5_bolt_head_hole();

        translate([20, -15, -40/2 - 6])
        _M5_bolt_head_hole();

        translate([20, 32, -40/2 - 6])
        _M5_bolt_head_hole();

        translate([20, -32, -40/2 - 6])
        _M5_bolt_head_hole();
    }
}

module micro_shredder_medium_spacer() {
    translate([13, 0, 0])
    intersection() {
        _shredder_body_medium();

        translate([-50/2, 0, 0])        
        cube([50, 200, 0.2], center=true);
    }

    translate([-13, 0, 0])
    intersection() {
        _shredder_body_medium();

        translate([50/2, 0, 0])        
        cube([50, 200, 0.2], center=true);
    }
}

module micro_shredder_medium_body_1() {

    render()
    difference() {
        intersection() {
            _shredder_body_medium();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);
        }

        // side cuts
        difference() {
            cube([65, 59, 12.7], center=true);

            translate([-23, 32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);

            translate([-23, -32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);

            translate([23, 32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);

            translate([23, -32, 0])
            cylinder(d=11, h=100, center=true, $fn=40);
        }

        // metal plate cut
        translate([0, 0, -12.7/2 - 1.2/2])
        difference() {
            cube([39, 25.7, 1.21], center=true);

//            translate([40/2, 0, 0])
//            cube([8, 18, 5], center=true);
//
//            translate([-40/2, 0, 0])
//            cube([4, 18, 5], center=true);
        }

        // side part screw holes
        translate([-26, 21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

        translate([-26, -21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

        translate([26, 21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

        translate([26, -21, 0])
        cylinder(d=2.8, h=48, center=true, $fn=20);

//        // M5 nut holes
//        translate([-23, 15, -18.5])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([-23, -15, -18.5])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([-23, 32, -18.5])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([-23, -32, -18.5])
//        M5_nut(6, cone=false, bridging=true); 
//
//        translate([23, 15, -18.5])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([23, -15, -18.5])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([23, 32, -18.5])
//        M5_nut(6, cone=false, bridging=true);
//
//        translate([23, -32, -18.5])
//        M5_nut(6, cone=false, bridging=true);

        // metal plate adjustment screw holes
        translate([11, 0, 0])
        cylinder(d=4.3, h=100, center=true, $fn=30);

        translate([0, 0, 0])
        cylinder(d=4.3, h=100, center=true, $fn=30);

        translate([-11, 0, 0])
        cylinder(d=4.3, h=100, center=true, $fn=30);

        translate([11, 0, -12.7/2 - 4.4])
        rotate([0, 0, 30])
        M4_nut(5);

        translate([0, 0, -12.7/2 - 4.4])
        rotate([0, 0, 30])
        M4_nut(5);

        translate([-11, 0, -12.7/2 - 4.4])
        rotate([0, 0, 30])
        M4_nut(5);

        // adjustment holes
        hull() {
            translate([-6, 16, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);

            translate([-6, 17, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);
        }

        hull() {
            translate([6, 16, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);

            translate([6, 17, 0])
            cylinder(d=4.3, h=100, center=true, $fn=30);
        }

    }
}

module micro_shredder_medium_body_1_1() {
    rotate([0, 0, 0])
    difference() {
        intersection() {
            _shredder_body_medium();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);

            difference() {
                translate([-64/2, 0, 0])
                cube([64, 58.8, 12.7], center=true);

                translate([-23, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([-23, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([23, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([23, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );
            }
        }

        translate([-26, 21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([-26, -21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([-26, 21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

        translate([-26, -21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

    }
}

module micro_shredder_medium_body_1_2() {
    rotate([0, 0, 0])
    difference() {
        intersection() {
            _shredder_body_medium();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);

            difference() {
                translate([64/2, 0, 0])
                cube([64, 58.8, 12.7], center=true);

                translate([-23, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([-23, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([23, 32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );

                translate([23, -32, 0])
                cylinder(
                    d=11.2, h=100, center=true, $fn=40
                );
            }
        }

        translate([26, 21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([26, -21, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([26, 21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }

        translate([26, -21, 6])
        hull() {
            cylinder(
                d=3.3, h=20,
                center=true, $fn=20
            );

            cylinder(
                d=8.2, h=20 - 5,
                center=true, $fn=20
            );
        }
    }
}

module micro_shredder_medium_body_2() {
    bh_z = -35/2 - 6;

    difference() {
        intersection() {
            rotate([0, 180, 0])
            _shredder_body_medium();

            translate([0, 0, -100/2 - 0.1])
            cube([200, 200, 100], center=true);
        }

        translate([-23, 15, bh_z])
        _M5_bolt_head_hole();

        translate([-23, -15, bh_z])
        _M5_bolt_head_hole();

        translate([-23, 32, bh_z])
        _M5_bolt_head_hole();

        translate([-23, -32, bh_z])
        _M5_bolt_head_hole(); 

        translate([23, 15, bh_z])
        _M5_bolt_head_hole();

        translate([23, -15, bh_z])
        _M5_bolt_head_hole();

        translate([23, 32, bh_z])
        _M5_bolt_head_hole();

        translate([23, -32, bh_z])
        _M5_bolt_head_hole();
    }
}


module attachment_nut_holder_large() {
    difference() {
        translate([0, 0, 4/2])
        intersection() {
            hull() {
                cube([3.7, 33.7, 4], center=true);
                cube([8.7, 30.6, 4], center=true);
            }
            chamfered_cube(
                8.7, 33.7, 4, 0.5, center=true
            );
        }

        translate([0, 12, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, -12, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, 12, 0.4])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([0, -12, 0.4])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([0, 0, 4/2 + 2])
        cube([6, 14, 4], center=true);
    }
}

module attachment_nut_holder_medium() {
    difference() {
        translate([0, 0, 4/2])
        intersection() {
            hull() {
                cube([3.7, 29.7, 4], center=true);
                cube([8.7, 26.6, 4], center=true);
            }

            chamfered_cube(
                8.7, 29.7, 4, 0.5, center=true
            );
        }

        translate([0, 10, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, -10, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, 10, 0.4])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([0, -10, 0.4])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([0, 0, 4/2 + 2])
        cube([6, 10, 4], center=true);
    }
}


module neck_nut_holder_large() {
    difference() {
        translate([0, 0, 3.8/2])
        chamfered_cube(
            8.7, 26, 3.8, 0.5, center=true
        );

        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, 0, 0.4])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([0, 8, 4/2 + 1])
        cube([6.2, 7, 4], center=true);

        translate([0, -8, 4/2 + 1])
        cube([6.2, 7, 4], center=true);
    }
}

module neck_nut_holder_medium() {
    difference() {
        translate([0, 0, 3.8/2])
        chamfered_cube(
            8.7, 23.9, 3.8, 0.5, center=true
        );

        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, 0, 0.4])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([0, 7.5, 4/2 + 1])
        cube([6.2, 6, 4], center=true);

        translate([0, -7.5, 4/2 + 1])
        cube([6.2, 6, 4], center=true);
    }
}

module neck_large() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 2/2])
                cube([60, 40, 2], center=true);

                translate([0, 0, 10])
                chamfered_cube_side(
                    45, 30, 1, 3, center=true
                );
            }

            translate([0, 0, 56/2])
            chamfered_cube_side(
                50, 35, 56, 3, center=true
            );

            translate([20.5, 12, -9])
            rotate([0, 25, 0])
            translate([0, 0, 14])
            cylinder(d=8, h=3.4, $fn=30);

            translate([20.5, -12, -9])
            rotate([0, 25, 0])
            translate([0, 0, 14])
            cylinder(d=8, h=3.4, $fn=30);

            translate([-20.5, 12, -9])
            rotate([0, -25, 0])
            translate([0, 0, 14])
            cylinder(d=8, h=3.4, $fn=30);

            translate([-20.5, -12, -9])
            rotate([0, -25, 0])
            translate([0, 0, 14])
            cylinder(d=8, h=3.4, $fn=30);

            translate([0, 0, 50 -10/2 + 9/2 + 1.6])
            rotate([0, 90, 0])
            chamfered_cylinder(
                10, 52, 1, center=true, $fn=30
            );
        }

        // top cut
        translate([0, 0, 66])
        rotate([12, 0, 0])
        cube([100, 100, 20], center=true);

        cube([23, 19, 200], center=true);

        translate([20.5, 12, -9])
        rotate([0, 25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        translate([20.5, -12, -9])
        rotate([0, 25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        translate([-20.5, 12, -9])
        rotate([0, -25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        translate([-20.5, -12, -9])
        rotate([0, -25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        hull() {
            translate([0, 50, 33])
            rotate([90, 0, 0])
            cylinder(d=4.2, h=100, center=true, $fn=30);

            translate([0, 50, 34])
            rotate([90, 0, 0])
            cylinder(d=4.2, h=100, center=true, $fn=30);
        }

        translate([0, 0, 50])
        rotate([12, 0, 0])
        union() {
            translate([0, 0, 1/2])
            rounded_cube_side(
                45.3, 26.2, 11.2,
                2, center=true, $fn=30
            );

            translate([0, 0, -10/2 + 9/2 + 1.6])
            rotate([0, 90, 0])
            cylinder(d=3.2, h=200, center=true, $fn=30);
        }

        translate([36, 0, 26])
        chamfered_cube(
            30, 24, 30, 4, center=true
        );

        translate([-36, 0, 26])
        chamfered_cube(
            30, 24, 30, 4, center=true
        );

        translate([0, -24, 26])
        chamfered_cube(
            40, 20, 32, 4, center=true
        );

        translate([0, 24, 26])
        chamfered_cube(
            40, 20, 32, 4, center=true
        );
    }
}

module neck_medium() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 2/2])
                cube([62, 35, 2], center=true);

                translate([0, 0, 10])
                chamfered_cube_side(
                    47, 25, 1, 3, center=true
                );
            }

            translate([0, 0, 56/2])
            chamfered_cube_side(
                52, 30, 56, 3, center=true
            );

            translate([22.5, 10, -9])
            rotate([0, 25, 0])
            translate([0, 0, 11.8])
            cylinder(d=8, h=5.6, $fn=30);

            translate([22.5, -10, -9])
            rotate([0, 25, 0])
            translate([0, 0, 11.8])
            cylinder(d=8, h=5.6, $fn=30);

            translate([-22.5, 10, -9])
            rotate([0, -25, 0])
            translate([0, 0, 11.8])
            cylinder(d=8, h=5.6, $fn=30);

            translate([-22.5, -10, -9])
            rotate([0, -25, 0])
            translate([0, 0, 11.8])
            cylinder(d=8, h=5.6, $fn=30);

            translate([0, 0, 50 -10/2 + 9/2 + 1.6])
            rotate([0, 90, 0])
            chamfered_cylinder(
                10, 54, 1, center=true, $fn=30
            );
        }

        // top cut
        translate([0, 0, 66])
        rotate([12, 0, 0])
        cube([100, 100, 20], center=true);

        // chute
        cube([30, 12.7, 200], center=true);

        #translate([22.5, 10, -9])
        rotate([0, 25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        translate([22.5, -10, -9])
        rotate([0, 25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        translate([-22.5, 10, -9])
        rotate([0, -25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        translate([-22.5, -10, -9])
        rotate([0, -25, 0])
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        _M3_screw_hole(l=16);

        // metal plate mount hole
        hull() {
            translate([0, 50, 33])
            rotate([90, 0, 0])
            cylinder(d=4.2, h=100, center=true, $fn=30);

            translate([0, 50, 34])
            rotate([90, 0, 0])
            cylinder(d=4.2, h=100, center=true, $fn=30);
        }

        // attachment mount hole
        translate([0, 0, 50])
        rotate([12, 0, 0])
        union() {
            translate([0, 0, 1/2])
            rounded_cube_side(
                47.3, 24.2, 11.2,
                2, center=true, $fn=30
            );

            translate([0, 0, -10/2 + 9/2 + 1.6])
            rotate([0, 90, 0])
            cylinder(d=3.2, h=200, center=true, $fn=30);
        }

        translate([37, 0, 26])
        chamfered_cube(
            26, 24, 32, 4, center=true
        );

        translate([-37, 0, 26])
        chamfered_cube(
            26, 24, 32, 4, center=true
        );

        translate([0, -22, 26])
        chamfered_cube(
            42, 20, 32, 4, center=true
        );

        translate([0, 22, 28])
        chamfered_cube(
            42, 20, 36, 4, center=true
        );
    }
}


module hopper_large() {
    bottom_w = 22;
    bottom_d = 19;

    top_w = bottom_w * 5;
    top_d = bottom_d * 5;

    h = 65;

    module _form(
        b_w, b_d, t_w, t_d, h, d_b, d_t
    ) {
        hull() {
            translate([-b_w/2, -b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([b_w/2, -b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([-b_w/2, b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([b_w/2, b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([-t_w/2, -t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([t_w/2, -t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([-t_w/2, t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([t_w/2, t_d/2, h])
            sphere(d=d_t, $fn=30);
        }
    
    }

    difference() {
        union() {
            translate([0, 0.8, 9])
            intersection() {
                _form(
                    bottom_w, bottom_d,
                    top_w, top_d, h, 5.2, 10
                );

                cylinder(d=1000, h=h - 2);
            }

            translate([0, 0, 30/2])
            rounded_cube_side(
                45, 26, 30, 2, center=true, $fn=30
            );
        }

        translate([0, 0.8, 9 - 0.1])
        _form(
            bottom_w, bottom_d,
            top_w, top_d, h + 0.2, 1, 6
        );

        translate([0, -1.05, 0])
        rotate([-12, 0, 0])
        cube([23, 19, 200], center=true);
        
        translate([-18, 0, 9/2 + 1.6])
        hull() {
            cube([4, 50, 9], center=true);

            translate([0, 0, 1.2])
            cube([0.1, 50, 9], center=true);
        }

        translate([18, 0, 9/2 + 1.6])
        hull() {
            cube([4, 50, 9], center=true);

            translate([0, 0, 1.2])
            cube([0.1, 50, 9], center=true);
        }

        #translate([13.5, 0, 9/2 + 1.6])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=15, $fn=30);

        #translate([-13.5, 0, 9/2 + 1.6])
        rotate([0, -90, 0])
        cylinder(d=3.2, h=15, $fn=30);
    }
}

module hopper_medium() {
    bottom_w = 26;
    bottom_d = 16;

    top_w = bottom_w * 4;
    top_d = bottom_d * 6;

    h = 65;

    module _form(
        b_w, b_d, t_w, t_d, h, d_b, d_t
    ) {
        hull() {
            translate([-b_w/2, -b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([b_w/2, -b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([-b_w/2, b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([b_w/2, b_d/2, 0])
            sphere(d=d_b, $fn=30);

            translate([-t_w/2, -t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([t_w/2, -t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([-t_w/2, t_d/2, h])
            sphere(d=d_t, $fn=30);

            translate([t_w/2, t_d/2, h])
            sphere(d=d_t, $fn=30);
        }
    
    }

    difference() {
        union() {
            translate([0, 0.8, 9])
            intersection() {
                _form(
                    bottom_w, bottom_d,
                    top_w, top_d, h, 5.2, 10
                );

                cylinder(d=1000, h=h - 2);
            }

            translate([0, 0, 32/2])
            rounded_cube_side(
                47, 23.9, 32, 2, center=true, $fn=30
            );
        }

        translate([0, 0.8, 9 - 0.1])
        _form(
            bottom_w, bottom_d,
            top_w, top_d, h + 0.2, 1, 6
        );

        // chute opening
        translate([0, -1.05, 0])
        rotate([-12, 0, 0])
        cube([30, 12.7, 200], center=true);

        hull() {
            translate([0, -1.05, 0])
            rotate([-12, 0, 0])
            translate([0, -0.5, 3])
            cube([30, 11.7, 1], center=true);

            translate([0, -1.05, 0])
            rotate([-12, 0, 0])
            translate([0, -2.4, 19.2])
            cube([30, 23.9, 10], center=true);
        }
        
        translate([-19, 0, 9/2 + 1.6])
        hull() {
            cube([4, 50, 9], center=true);

            translate([0, 0, 1.2])
            cube([0.1, 50, 9], center=true);
        }

        translate([19, 0, 9/2 + 1.6])
        hull() {
            cube([4, 50, 9], center=true);

            translate([0, 0, 1.2])
            cube([0.1, 50, 9], center=true);
        }

        #translate([15.5, 0, 9/2 + 1.6])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=15, $fn=30);

        #translate([-15.5, 0, 9/2 + 1.6])
        rotate([0, -90, 0])
        cylinder(d=3.2, h=15, $fn=30);
    }
}

module jar_adapter_large() {
    module _screw_hole() {
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        union() {
            _M3_screw_hole(l=16);

            translate([0, 0, -19.9])
            cylinder(d=6, h=20, $fn=30);
        }
    }

    difference() {
        union() {
            hull() {
                translate([0, 0, 2/2])
                cube([60, 40, 2], center=true);

                translate([0, 5, 30])
                rotate([12, 0, 0])
                cylinder(d=67, h=20, $fn=50);
            }
        }

        translate([0, 5, 30])
        rotate([12, 0, 0])
        difference() {
            cylinder(d=62.8, h=23, $fn=50);

            difference() {
                cylinder(d=70, h=23);

                v_screw(
                    h=24,
                    screw_d=65.5,
                    pitch=4,
                    direction=0,
                    steps=80,
                    depth=1
                );
            }
        }

        translate([20.5, 12, -9])
        rotate([0, 25, 0])
        _screw_hole();

        translate([20.5, -12, -9])
        rotate([0, 25, 0])
        _screw_hole();

        translate([-20.5, 12, -9])
        rotate([0, -25, 0])
        _screw_hole();

        translate([-20.5, -12, -9])
        rotate([0, -25, 0])
        _screw_hole();

        hull() {
            rounded_cube_side(
                42, 30, 1, 3, center=true, $fn=30
            );

            translate([0, 5, 29.5])
            rotate([12, 0, 0])
            cylinder(d=54, h=1, $fn=50);
        }
    }
}

module jar_adapter_medium() {
    module _screw_hole() {
        translate([0, 0, 17.5])
        rotate([180, 0, 0])
        union() {
            _M3_screw_hole(l=16);

            translate([0, 0, -19.9])
            cylinder(d=6, h=20, $fn=30);
        }
    }

    difference() {
        union() {
            hull() {
                translate([0, 0, 2/2])
                cube([62, 35, 2], center=true);

                translate([0, 7.5, 30])
                rotate([12, 0, 0])
                cylinder(d=67, h=20, $fn=50);
            }
        }

        translate([0, 7.5, 30])
        rotate([12, 0, 0])
        difference() {
            cylinder(d=62.8, h=23, $fn=50);

            difference() {
                cylinder(d=70, h=23);

                v_screw(
                    h=24,
                    screw_d=65.5,
                    pitch=4,
                    direction=0,
                    steps=80,
                    depth=1
                );
            }
        }

        translate([22.5, 10, -9])
        rotate([0, 25, 0])
        _screw_hole();

        translate([22.5, -10, -9])
        rotate([0, 25, 0])
        _screw_hole();

        translate([-22.5, 10, -9])
        rotate([0, -25, 0])
        _screw_hole();

        translate([-22.5, -10, -9])
        rotate([0, -25, 0])
        _screw_hole();

        hull() {
            rounded_cube_side(
                42, 30, 1, 3, center=true, $fn=30
            );

            translate([0, 5, 29.5])
            rotate([12, 0, 0])
            cylinder(d=54, h=1, $fn=50);
        }
    }
}

module jar_extender() {
    difference() {
        union() {
            cylinder(d=67, h=35, $fn=50);

            translate([0, 0, 34.9])
            intersection() {
                v_screw(
                    h=20,
                    screw_d=65.1,
                    pitch=4,
                    direction=0,
                    steps=80,
                    depth=1
                );

                cylinder(d=62.5, h=30, $fn=50);
            }
        }

        translate([0, 0, -0.1])
        difference() {
            cylinder(d=62.8, h=20.12, $fn=50);

            difference() {
                cylinder(d=70, h=23);

                v_screw(
                    h=20.12,
                    screw_d=65.5,
                    pitch=4,
                    direction=0,
                    steps=80,
                    depth=1,
                    chamfer=true
                );
            }
        }

        cylinder(d=54, h=60, $fn=50);

        hull() {
            translate([0, 0, 17.8])
            cylinder(d=60.8, h=0.1, $fn=80);

            translate([0, 0, 22.6])
            cylinder(d=52, h=0.1, $fn=80);
        }
    }
}

module plunger_large(h=22, end=true) {

    union() {
        // handle
        difference() {
            intersection() {
                translate([0, 0, h/2])
                chamfered_cube(
                    7, 50, h, 1, center=true
                );

                union() {
                    translate([0, 7, h/2])
                    rotate([0, 90, 0])
                    rounded_cylinder(
                        36, 5, 3.4, center=true, $fn=70
                    );

                    translate([0, -3, 0])
                    cube([5, 20, 80], center=true);
                }
            }
            intersection() {
                translate([-5.5, 11, h/2])
                scale([0.4, 1, 1])
                sphere(d=26, $fn=50);

                translate([-10/2 - 1.5, 11, 0])
                cube([10, 50, 100], center=true);
            }

            intersection() {
                translate([5.5, 11, h/2])
                scale([0.4, 1, 1])
                sphere(d=26, $fn=50);

                translate([10/2 + 1.5, 11, 0])
                cube([10, 50, 100], center=true);
            }
        }

        // stopper
        translate([0, 1, h/2])
        cube([30, 3, h], center=true);

        translate([0, 0, 0])
        intersection() {
            tube(30, h, 3.5, $fn=40);

            translate([0, -40/2, 0])
            cube([40, 40, 100], center=true);
        }

        // arm
        translate([9.4, -55.7, h/2])
        rotate([90, 0, 12]) {
            chamfered_cube_side(
                10, h, 87, 3, center=true
            );

            if (end) {
                hull() {
                    translate([0, 0, 87/2 - 5/2])
                    chamfered_cube_side(
                        18.3, h, 5, 1, center=true
                    );

                    translate([0, 0, 87/2 - 10])
                    chamfered_cube_side(
                        10, h, 1, 3, center=true
                    );

                }
            }
        }
    }
}

module plunger_large_thin() {
    plunger_large(h=13, end=false);
}

module plunger_medium(h=29, end=true) {

    union() {
        // handle
        difference() {
            intersection() {
                translate([0, 0, h/2])
                chamfered_cube(
                    7, 50, h, 1, center=true
                );

                union() {
                    translate([0, 7, h/2])
                    rotate([0, 90, 0])
                    rounded_cylinder(
                        36, 5, 3.4, center=true, $fn=70
                    );

                    translate([0, -3, 0])
                    cube([5, 20, 80], center=true);
                }
            }
            intersection() {
                translate([-5.5, 11, h/2])
                scale([0.4, 1, 1])
                sphere(d=26, $fn=50);

                translate([-10/2 - 1.5, 11, 0])
                cube([10, 50, 100], center=true);
            }

            intersection() {
                translate([5.5, 11, h/2])
                scale([0.4, 1, 1])
                sphere(d=26, $fn=50);

                translate([10/2 + 1.5, 11, 0])
                cube([10, 50, 100], center=true);
            }
        }

        // stopper
        translate([0, 1, h/2])
        cube([30, 3, h], center=true);

        translate([0, 0, 0])
        intersection() {
            tube(30, h, 3.5, $fn=40);

            translate([0, -40/2, 0])
            cube([40, 40, 100], center=true);
        }

        // arm
        translate([-0.4, -12, h/2])
        rotate([90, 0, 12]) {
            translate([0, 0, 93/2])
            chamfered_cube_side(
                10, h, 93, 3, center=true
            );

            if (end) {
                hull() {
                    translate([0, 0, 93 - 5/2])
                    chamfered_cube_side(
                        12, h, 5, 1, center=true
                    );

                    translate([0, 0, 93 - 10])
                    chamfered_cube_side(
                        10, h, 1, 3, center=true
                    );

                }
            }
        }
    }
}

module plunger_medium_thin() {
    plunger_medium(h=14, end=false);
}

module pelletizer_large() {
    l = 90.5;
    h = 15.6;

    difference() {
        union() {
            rotate([90, 0, 0])
            chamfered_cube_side(
                14, h, l, 3, center=true
            );

            rotate([90, 0, 0])
            hull() {
                translate([0, 0, -l/2 + 12/2])
                chamfered_cube_side(
                    22.3, h, 12, 2, center=true
                );

                translate([0, 0, -l/2 + 17])
                chamfered_cube_side(
                    14, h, 1, 3, center=true
                );
            }

            rotate([90, 0, 0])
            hull() {
                translate([0, 0, l/2 - 6/2])
                chamfered_cube_side(
                    22.3, h, 6, 2, center=true
                );

                translate([0, 0, l/2 - 11])
                chamfered_cube_side(
                    14, h, 1, 3, center=true
                );
            }

            hull() {
                translate([
                    0, 91/2 - 9/2, -h/2 + 18.6/2
                ])
                rotate([0, 90, 0])
                cylinder(d=9, h=45, center=true, $fn=50);

                translate([
                    0, 91/2 - 9/2 - 1.9, -h/2 + 18.6/2
                ])
                rotate([0, 90, 0])
                cylinder(d=9, h=45, center=true, $fn=50);

                translate([
                    0, l/2 - 6/2, 0
                ])
                cube([36, 6, h], center=true);
            }

        }

        translate([0, 0, -h/2 + 18.6/2])
        rotate([90, 0, 0])
        scale([1, 1.05, 1])
        cylinder(d=3, h=300, center=true, $fn=30);

        translate([20, l/2 - 9/2, -h/2 + 18.6/2])
        rotate([0, 90, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([-20, l/2 - 9/2, -h/2 + 18.6/2])
        rotate([0, 90, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([6, -l/2 + 4, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([-6, -l/2 + 4, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([0, l/2 + 2, -h/2 + 18.6/2])
        sphere(
            d=12, $fn=50
        );
    }
}

module pelletizer_medium() {
    l = 93.5;
    h = 9;

    difference() {
        union() {
            rotate([90, 0, 0])
            chamfered_cube_side(
                14, h, l, 3, center=true
            );

            rotate([90, 0, 0])
            hull() {
                translate([0, 0, -l/2 + 12/2])
                chamfered_cube_side(
                    29, h, 12, 2, center=true
                );

                translate([0, 0, -l/2 + 17])
                chamfered_cube_side(
                    14, h, 1, 3, center=true
                );
            }

            rotate([90, 0, 0])
            hull() {
                translate([0, 0, l/2 - 6/2])
                chamfered_cube_side(
                    29, h, 6, 2, center=true
                );

                translate([0, 0, l/2 - 11])
                chamfered_cube_side(
                    14, h, 1, 3, center=true
                );
            }

            hull() {
                translate([
                    0, l/2 - 9/2, -h/2 + 12/2
                ])
                rotate([0, 90, 0])
                cylinder(d=9, h=46.9, center=true, $fn=50);

                translate([
                    0, l/2 - 9/2 - 1.9, -h/2 + 12/2
                ])
                rotate([0, 90, 0])
                cylinder(d=9, h=46.9, center=true, $fn=50);

                translate([
                    0, l/2 - 8/2, 0
                ])
                cube([42, 8, h], center=true);
            }

        }

        translate([0, 0, -h/2 + 12/2])
        rotate([90, 0, 0])
        scale([1, 1.05, 1])
        cylinder(d=3, h=300, center=true, $fn=30);

        translate([0, -l/2 + 2.4, -h/2 + 12/2])
        rotate([90, 0, 0])
        cylinder(d=4.2, h=5.4, center=true, $fn=30);

        translate([20, l/2 - 9/2, -h/2 + 12/2])
        rotate([0, 90, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([-20, l/2 - 9/2, -h/2 + 12/2])
        rotate([0, 90, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([6, -l/2 + 4, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([-6, -l/2 + 4, 0])
        cylinder(d=2.8, h=20, center=true, $fn=30);

        translate([0, l/2 + 2, -h/2 + 12/2])
        sphere(
            d=12, $fn=50
        );
    }
}

module table_mount_large() {
    module _M5_nut_hole() {
        cylinder(d=5.2, h=100, center=true, $fn=40);
        M5_nut();

        hull() {
            translate([0, 0, 4])
            M5_nut();

            translate([0, 0, 10])
            cylinder(d=10, h=25, $fn=30);
        }
    }

    %translate([31, 0, 25])
    rotate([102, 0, 0])
    cylinder(d=8, h=200, center=true, $fn=40);
    
    difference() {
        union() {
            translate([0, 0, 22.2/2])
            cube([60, 88, 22.2], center=true);

            rotate([12, 0, 0])
            hull() {
                translate([31, 25, 25])
                rotate([90, 0, 0])
                cylinder(
                    d=20, h=30, center=true, $fn=40
                );

                translate([60/2 - 34/2, 25, 0])
                cube([34, 30, 1], center=true);
            }

            rotate([12, 0, 0])
            hull() {
                translate([-31, 25, 25])
                rotate([90, 0, 0])
                cylinder(
                    d=20, h=30, center=true, $fn=40
                );

                translate([-60/2 + 34/2, 25, 0])
                cube([34, 30, 1], center=true);
            }
        }

        translate([-20, 32, 9])
        _M5_nut_hole();

        translate([20, 32, 9])
        _M5_nut_hole();

        translate([-20, 15, 9])
        _M5_nut_hole();

        translate([20, 15, 9])
        _M5_nut_hole();

        translate([-20, -32, 9])
        _M5_nut_hole();

        translate([20, -32, 9])
        _M5_nut_hole();

        translate([-20, -15, 9])
        _M5_nut_hole();

        translate([20, -15, 9])
        _M5_nut_hole();

        translate([0, 61, 0])
        rotate([12, 0, 0])
        cube([100, 40, 100], center=true);

        translate([0, -60, 0])
        rotate([12, 0, 0])
        cube([100, 40, 100], center=true);

        translate([0, -40, 35])
        rotate([12, 0, 0])
        cube([100, 84.1, 44], center=true);

        translate([-31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, -5])
        cylinder(d=22, h=6, $fn=40);

        translate([-31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, 0.99])
        cylinder(d1=22, d2=1, h=22, $fn=40);

        translate([31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, -5])
        cylinder(d=22, h=6, $fn=40);

        translate([31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, 0.99])
        cylinder(d1=22, d2=1, h=22, $fn=40);

        translate([31, 0, 25])
        rotate([102, 0, 0])
        hull() {
            cylinder(d=8.3, h=200, center=true, $fn=40);

            translate([0, 4.7, 0])
            cylinder(d=.3, h=200, center=true, $fn=40);
        }

        translate([-31, 0, 25])
        rotate([102, 0, 0])
        hull() {
            cylinder(d=8.3, h=200, center=true, $fn=40);

            translate([0, 4.7, 0])
            cylinder(d=.3, h=200, center=true, $fn=40);
        }

        translate([0, -41, 28])
        chamfered_cube(
            28, 100, 50, 6, center=true
        );

        hull() {
            translate([-9, 0, 0])
            cylinder(d=10, h=50, center=true, $fn=30);

            translate([9, 0, 0])
            cylinder(d=10, h=50, center=true, $fn=30);
        }

        hull() {
            translate([-7, -16.5, 0])
            cylinder(d=10, h=50, center=true, $fn=30);

            translate([7, -16.5, 0])
            cylinder(d=10, h=50, center=true, $fn=30);
        }
    }
}

module table_mount_medium() {
    module _M5_nut_hole() {
        cylinder(d=5.2, h=20, center=true, $fn=40);
        M5_nut(4.5, cone=false);

        hull() {
            translate([0, 0, 4.4])
            M5_nut(cone=false);

            translate([0, 0, 9])
            cylinder(d=10, h=0.1, $fn=30);
        }

        hull() {
            translate([0, 0, 9])
            cylinder(d=10, h=0.1, $fn=30);

            translate([5, 0, 32])
            cylinder(d=10, h=0.1, $fn=30);
           
        }

    }

    %translate([31, 0, 25])
    rotate([102, 0, 0])
    cylinder(d=8, h=200, center=true, $fn=40);
    
    difference() {
        union() {
            translate([0, 0, 22.2/2])
            cube([62, 88, 22.2], center=true);

            rotate([12, 0, 0])
            hull() {
                translate([31, 25, 25])
                rotate([90, 0, 0])
                cylinder(
                    d=20, h=30, center=true, $fn=40
                );

                translate([60/2 - 34/2, 25, 0])
                cube([34, 30, 1], center=true);
            }

            rotate([12, 0, 0])
            hull() {
                translate([-31, 25, 25])
                rotate([90, 0, 0])
                cylinder(
                    d=20, h=30, center=true, $fn=40
                );

                translate([-60/2 + 34/2, 25, 0])
                cube([34, 30, 1], center=true);
            }
        }

        translate([-23, 32, 9])
        _M5_nut_hole();

        translate([23, 32, 9])
        rotate([0, 0, 180])
        _M5_nut_hole();

        translate([-23, 15, 9])
        _M5_nut_hole();

        translate([23, 15, 9])
        rotate([0, 0, 180])
        _M5_nut_hole();

        translate([-23, -32, 9])
        _M5_nut_hole();

        translate([23, -32, 9])
        rotate([0, 0, 180])
        _M5_nut_hole();

        translate([-23, -15, 9])
        _M5_nut_hole();

        translate([23, -15, 9])
        rotate([0, 0, 180])
        _M5_nut_hole();

        translate([0, 61, 0])
        rotate([12, 0, 0])
        cube([100, 40, 100], center=true);

        translate([0, -60, 0])
        rotate([12, 0, 0])
        cube([100, 40, 100], center=true);

        translate([0, -40, 35])
        rotate([12, 0, 0])
        cube([100, 84.1, 44], center=true);

        translate([-31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, -5])
        cylinder(d=22, h=6, $fn=40);

        translate([-31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, 0.99])
        cylinder(d1=22, d2=1, h=22, $fn=40);

        translate([31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, -5])
        cylinder(d=22, h=6, $fn=40);

        translate([31, 0, 25])
        rotate([102, 0, 0])
        translate([0, 0, 0.99])
        cylinder(d1=22, d2=1, h=22, $fn=40);

        translate([31, 0, 25])
        rotate([102, 0, 0])
        hull() {
            cylinder(d=8.3, h=200, center=true, $fn=40);

            translate([0, 4.7, 0])
            cylinder(d=.3, h=200, center=true, $fn=40);
        }

        translate([-31, 0, 25])
        rotate([102, 0, 0])
        hull() {
            cylinder(d=8.3, h=200, center=true, $fn=40);

            translate([0, 4.7, 0])
            cylinder(d=.3, h=200, center=true, $fn=40);
        }

        translate([0, -41, 28])
        chamfered_cube(
            28, 100, 50, 6, center=true
        );

        hull() {
            translate([-9, 0, 0])
            cylinder(d=10, h=50, center=true, $fn=30);

            translate([9, 0, 0])
            cylinder(d=10, h=50, center=true, $fn=30);
        }

        hull() {
            translate([-7, -16.5, 0])
            cylinder(d=10, h=50, center=true, $fn=30);

            translate([7, -16.5, 0])
            cylinder(d=10, h=50, center=true, $fn=30);
        }
    }
}


module metal_plate_mount_plug() {
    difference() {
        union() {
            hull() {
                translate([-7, 0, 0])
                cylinder(d=9.5, h=2, $fn=40);

                translate([7, 0, 0])
                cylinder(d=9.5, h=2, $fn=40);

                translate([0, 10, 0])
                cylinder(d=6, h=2, $fn=40);
            }

            hull() {
                translate([-7, 0, 0])
                cylinder(d=9.5, h=5, $fn=40);

                translate([7, 0, 0])
                cylinder(d=9.5, h=5, $fn=40);
            }

            hull() {
                translate([-6, 0.5, 0])
                cylinder(d=3.8, h=15.4, $fn=30);

                translate([-6, -0.5, 0])
                cylinder(d=3.8, h=15.4, $fn=30);
            }

            hull() {
                translate([6, 0.5, 0])
                cylinder(d=3.8, h=15.4, $fn=30);

                translate([6, -0.5, 0])
                cylinder(d=3.8, h=15.4, $fn=30);
            }
        }

        translate([0, 10, 0])
        cylinder(d=3.2, h=20, center=true, $fn=40);
    }
}

module table_mount_flex_spacer() {
    difference() {
        union() {
            cylinder(d=20, h=3, $fn=40);
            cylinder(d=13, h=15, $fn=40);
        }

        cylinder(d=8, h=100, center=true, $fn=40);
    }
}

module _table_reinforcement_form() {
    hull() {
        translate([-50, 110, 0])
        chamfered_cylinder(30, 70, 3, $fn=50);

        translate([50, 110, 0])
        chamfered_cylinder(30, 70, 3, $fn=50);

        translate([-57.5, 15/2, 0])
        chamfered_cylinder(15, 70, 3, $fn=50);

        translate([57.5, 15/2, 0])
        chamfered_cylinder(15, 70, 3, $fn=50);
    }
}

module table_reinforcement_top() {
    module _screw_hole(d=3, h=50) {
        union() {
            cylinder(d=d, h=h, $fn=30);

            for(i = [0:h/2]) {
                translate([0, 0, 1 + i*2])
                hull() {
                    cylinder(
                        d=d, h=2, center=true, $fn=30
                    );
                    cylinder(
                        d=d*1.6, h=0.1,
                        center=true, $fn=30
                    );
                }
            }
        }
    }

    module _screw_head_hole_front() {
        rotate([-90, 0, 0])
        union() {
            cylinder(d=5, h=11, $fn=30);
            cylinder(d=10.1, h=4, center=true, $fn=30);

            translate([0, 0, 1.99])
            cylinder(d1=10.1, d2=5, h=3.6, $fn=30);
        }
        
    }

    difference() {
        _table_reinforcement_form();

        translate([0, 0, 60])
        cylinder(d=200, h=20);

        difference() {
            translate([0, 200/2 + 10, 100/2 + 10])
            cube([200, 200, 100], center=true);

            translate([0, 10 + 13.2 + 20/2, 10 + 47/2])
            cube([115, 20, 47], center=true);

            translate([
                -31, 10 + 13.2 + 90/2, 10 + 47/2
            ])
            cube([15, 90, 47], center=true);

            translate([31, 10 + 13.2 + 90/2, 10 + 47/2])
            cube([15, 90, 47], center=true);
        }

        translate([-31, 10 + 13.2, 10 + 50/2])
        cube([8, 8, 50], center=true);

        translate([31, 10 + 13.2, 10 + 50/2])
        cube([8, 8, 50], center=true);

        translate([-31, 10 + 13 + 13.2/2, 0])
        cylinder(d=13.2, h=200, center=true, $fn=50);

        translate([31, 10 + 13 + 13.2/2, 0])
        cylinder(d=13.2, h=200, center=true, $fn=50);

        translate([-50, 10 + 13 + 20/2, 2])
        _screw_hole(d=3, h=60);

        // screw holes
        translate([50, 10 + 13 + 20/2, 2])
        _screw_hole(d=3, h=60);

        translate([-13, 10 + 13 + 20/2, 2])
        _screw_hole(d=3, h=60);

        translate([13, 10 + 13 + 20/2, 2])
        _screw_hole(d=3, h=60);

        translate([-31, 55, 2])
        _screw_hole(d=3, h=60);

        translate([31, 55, 2])
        _screw_hole(d=3, h=60);

        translate([-31, 80, 2])
        _screw_hole(d=3, h=60);

        translate([31, 80, 2])
        _screw_hole(d=3, h=60);

        translate([-31, 105, 2])
        _screw_hole(d=3, h=60);

        translate([31, 105, 2])
        _screw_hole(d=3, h=60);

        // screw holes front
        translate([42.5, 45, 10 + 50/2])
        rotate([90, 0, ])
        _screw_hole(d=3, h=60);

        translate([42.5, 0, 10 + 50/2])
        _screw_head_hole_front();

        translate([-42.5, 45, 10 + 50/2])
        rotate([90, 0, ])
        _screw_hole(d=3, h=60);

        translate([-42.5, 0, 10 + 50/2])
        _screw_head_hole_front();

        translate([0, 45, 10 + 50/2])
        rotate([90, 0, ])
        _screw_hole(d=3, h=60);

        translate([0, 0, 10 + 50/2])
        _screw_head_hole_front();

        // front top screw holes
        translate([-57, 10/2, 20])
        _screw_hole(d=2.2, h=60);

        translate([57, 10/2, 20])
        _screw_hole(d=2.2, h=60);

        translate([-28, 10/2, 20])
        _screw_hole(d=2.2, h=60);

        translate([28, 10/2, 20])
        _screw_hole(d=2.2, h=60);

        translate([0, 10/2, 40])
        _screw_hole(d=2.2, h=60);
        
    }
}

module table_reinforcement_bottom() {
    module _screw_head_hole_front() {
        translate([0, 0, 10])
        rotate([180, 0, 0])
        union() {
            cylinder(d=3.4, h=11, $fn=30);
            cylinder(d=7, h=4, center=true, $fn=30);

            translate([0, 0, 1.99])
            cylinder(d1=7, d2=3.4, h=2.6, $fn=30);
        }
    }

    module _screw_head_hole() {
        translate([0, 0, 10])
        rotate([180, 0, 0])
        union() {
            cylinder(d=4.6, h=11, $fn=30);
            cylinder(d=9.1, h=4, center=true, $fn=30);

            translate([0, 0, 1.99])
            cylinder(d1=9.1, d2=4.6, h=3, $fn=30);
        }
    }

    difference() {
        translate([0, 0, 10])
        rotate([0, 180, 0])
        intersection() {
            _table_reinforcement_form();
            cube([200, 400, 20], center=true);
        }
        // table leg cut
        hull() {
            translate([-68, 9 + 50/2, 0])
            cylinder(d=50, h=30, center=true, $fn=30);

            #translate([-70, 9 + 86/2, 0])
            cube([1, 86, 30], center=true);
        }

        // rod holes
        translate([-31, 10 + 13 + 13.2/2, 0])
        cylinder(d=13.2, h=200, center=true, $fn=50);

        translate([31, 10 + 13 + 13.2/2, 0])
        cylinder(d=13.2, h=200, center=true, $fn=50);

        // screw head holes
        translate([-50, 10 + 13 + 20/2, 0])
        _screw_head_hole();

        translate([50, 10 + 13 + 20/2, 0])
        _screw_head_hole();

        translate([-13, 10 + 13 + 20/2, 0])
        _screw_head_hole();

        translate([13, 10 + 13 + 20/2, 0])
        _screw_head_hole();

        translate([-31, 55, 0])
        _screw_head_hole();

        translate([31, 55, 0])
        _screw_head_hole();

        translate([-31, 80, 0])
        _screw_head_hole();

        translate([31, 80, 0])
        _screw_head_hole();

        translate([-31, 105, 0])
        _screw_head_hole();

        translate([31, 105, 0])
        _screw_head_hole();

        // front top screw holes
        translate([-57, 10/2, 0])
        _screw_head_hole_front();

        translate([57, 10/2, 0])
        _screw_head_hole_front();

        translate([-28, 10/2, 0])
        _screw_head_hole_front();

        translate([28, 10/2, 0])
        _screw_head_hole_front();

        translate([0, 10/2, 0])
        _screw_head_hole_front();

        // table screw holes

        translate([-42, 10 + 13/2, 0])
        _screw_head_hole_front();

        translate([42, 10 + 13/2, 0])
        _screw_head_hole_front();

        translate([-14, 10 + 13/2, 0])
        _screw_head_hole_front();

        translate([14, 10 + 13/2, 0])
        _screw_head_hole_front();
    }
}

module table_reinforcement_jig() {
    difference() {
        union() {
            translate([0, -2/2, 30/2])
            cube([95, 2, 30], center=true);

            translate([0, 13.2 + 20/2, 2/2])
            cube([115, 20, 2], center=true);

            translate([
                -31, 113.2/2, 2/2
            ])
            cube([15, 113.2, 2], center=true);

            translate([31, 113.2/2, 2/2])
            cube([15, 113.2, 2], center=true);
        }
        translate([-42.5, 0, 2 + 50/2])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=20);

        translate([42.5, 0, 2 + 50/2])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=20);

        translate([0, 0, 2 + 50/2])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=20);
    }
}