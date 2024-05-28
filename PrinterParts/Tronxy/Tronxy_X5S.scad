
use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;
use <../../Dollo/New_long_ties/mockups.scad>;
use <../../lib/bearings.scad>;


//debug_tronxy_cable_pcb_mount();
//debug_gt2_idler_625zz();


//gt2_belt();
//rounded_gt2_belt(10, 30);
//tronxy_z_rod_top_washer();
//tronxy_board_frame_adapters();
//hotend_pcb();
//tronxy_cable_pcb_mount();
//tronxy_cable_pcb_mount_tube_trap();
//tronxy_cable_pcb_mount_fasterner();
//tronxy_bed_spacer();
//qnd_motor_mount_fix();
//motor_mount_adapter_dollo();
//tronxy_PTFE_holder();
//tronxy_motor_mount_spacer();
//rotate([90, 0, 0]) tronxy_z_endstop_mount();
//tronxy_z_position_nut();
//tronxy_wire_chain_support();
//tronxy_corner_bearing_mount_right();
//tronxy_corner_bearing_mount_left();
tronxy_corner_bearing_mount_spacers();
//gt2_idler_625zz();
//gt2_idler_625zz_retainer();
//gt2_idler_625zz_spacer();
//duet_case_frame_adapter();
//z_chain_fix();
//y_endstop_holder();
//tronxy_frame_brace();
//tronxy_frame_brace(psu_mount=true);


module debug_tronxy_cable_pcb_mount() {
    tronxy_cable_pcb_mount();

    translate([10.6, 15, 3])
    tronxy_cable_pcb_mount_fasterner();

    translate([-2, 2.75 + 9, 25])
    rotate([0, 0, 90])
    tronxy_cable_pcb_mount_tube_trap();
}

module debug_gt2_idler_625zz() {
    intersection() {
        rotate([0, 0, 22])
        gt2_idler_625zz();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

    intersection() {
        translate([0, 0, 11.01])
        rotate([180, 0, 40])
        gt2_idler_625zz_retainer();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

    translate([0, 0, 5.4])
    gt2_idler_625zz_spacer();

    %translate([0, 0, 0.4])
    625zz();

    %translate([0, 0, 11 - 5.4])
    625zz();

    translate([30, 0, 0])
    gt2_idler_625zz_retainer();
}

module tronxy_z_rod_top_washer() {
    $fn=50;
    difference() {
        union() {
            cylinder(d1=8, d2=11, h=3.2);
            translate([0, 0, 3.19])
            cylinder(d=11, h=6);
        }
        cylinder(d=4.2, h=20);

        translate([-10, 3, 3.19])
        cube([20, 6, 10]);

        translate([-10, -3 - 6, 3.19])
        cube([20, 6, 10]);
    }
}

module tronxy_board_frame_adapters() {
    h = 6;
    
    module side_adapter(w) {
        difference() {
            union() {
                rounded_cube_side(w, 40, h, 4);
                rounded_cube_side(w, 21.5, h + 2, 4);
            }
            translate([-0.01, -1, h - 0.01])
            rounded_cube_side(w + 0.02, 21, h, 5);

            translate([w/2, 10, -0.1])
            cylinder(d=4.5, h=10, $fn=30);

            translate([w/2, 10, -0.1])
            M4_nut();

            translate([w/2,30,-0.1])
            cylinder(d=4.5,h=10,$fn=30);
        }
    }
    
    module bottom_adapter() {
        w = 20.1;
        difference() {
            union() {
                rounded_cube_side(w, 40, h, 4);
                rounded_cube_side(w, 20, h + 2, 4);
            }
            translate([1.5, -0.01, h - 0.01])
            rounded_cube_side(w + 0.02, 20.02, h, 5);

            translate([10 + 1.5, 10, -0.1])
            cylinder(d=4.5, h=10, $fn=30);

            translate([10 + 1.5, 10, -0.1])
            M4_nut();

            translate([w/2, 30, -0.1])
            cylinder(d=4.5, h=10, $fn=30);
        }
    }
    
    //side_adapter(17.8);
    translate([25, 0, 0])
    side_adapter(20.1);

    translate([-25, 0, 0])
    bottom_adapter();
}

module hotend_pcb() {
    color("grey")
    difference() {
        cube([23, 28, 1]);

        translate([-0.4, -0.4, 0])
        for (i = [0:12]) {
            for (j = [0:12]) {
                translate([i*2.54, j*2.54, 0])
                cube([0.8, 0.8, 2]);
            }
        }
    }
    
    translate([0.66 + 2*2.54, 0.02 + 3*2.54, 1])
    mock_fan_connector_male();

    translate([0.66 + 2*2.54, 0.02 + 8*2.54, 1]) 
    mock_fan_connector_male();

    translate([-0.3 + 5*2.54, 0.3 + 3*2.54, -2])
    rotate([0, 0, -90])
    pin_header(2);

    translate([-0.3 + 5*2.54, 0.3 + 9*2.54, -2])
    rotate([0,0,-90])
    pin_header(4);
}

pcw_mount_w = 40;
pcw_mount_l = 44;

module tronxy_cable_pcb_mount() {
    h = 53;

    difference() {
        union() {
            // base
            hull() {
                translate([-2, -5, 0])
                rounded_cube_side(
                    pcw_mount_w + 2,
                    pcw_mount_l + 20,
                    3, 9, $fn=60
                );

                translate([
                    -2 + 9/2, -11 + 9/2, 0
                ])
                cylinder(d=9, h=3);
            }

            // tower
            hull() {
                translate([-2, 0, 0])
                cube([6.3, 22.5, h]);

                translate([-2, -10, 0])
                cube([6.3, 22.5, 20]);
            }

            // tube traps
            hull() {
                translate([6.3/2 - 2, -15 + 11.75, 25])
                cube([6.3, 30, 10], center=true);

                translate([6.3/2 - 2, -7.5, 35/2])
                cube([6.3, 7, 35], center=true);
            }

            hull() {
                translate([6.3/2 - 2, 25 + 11.75, 25])
                cube([6.3, 10, 10], center=true);

                translate([6.3/2 -2, 2.75 + 25, 35/2])
                cube([6.3, 10, 35], center=true);
            }

            // reinforcement
            hull() {
                translate([-2, 20.5, 0])
                cube([12.4, 3, 1]);

                translate([-2, 20.5, h - 1])
                cube([6.3, 3, 1]);
            }

            // nut extrusions
            translate([
                -2, 22.5/2 + 0.5,
                h - 15.8 + 5
            ])
            chamfered_cube(
                4, 22.5, 11, 1.9, center=true
            );

            translate([
                -2, 22.5/2 - 8.5, 3 + 9
            ])
            chamfered_cube(
                4, 22.5, 11, 1.9, center=true
            );

            // cable rest
            translate([2, 16.8, 2])
            rotate([0, 0, -25])
            cube([22, 7, 6]);
        }

        // tower cuts
        translate([0, 2.6, h - 15.9 - 4])
        cube([2.2, 18.2, 22]);

        translate([-1.2, 2.75 + 5, h - 15.8 + 5])
        rotate([0, -90, 0]) {
            cylinder(
                d=3.3, h=15,
                center=true, $fn=20
            );

            M3_nut(5);
        }

        translate([
            -1.2, 2.75 + 18 - 5, h - 15.8 + 5
        ])
        rotate([0, -90, 0]) {
            cylinder(
                d=3.3, h=15,
                center=true, $fn=20
            );

            M3_nut(5);
        }

        translate([-1.2, 2.75 - 4, 3 + 9])
        rotate([0, -90, 0]) {
            cylinder(
                d=3.3, h=15,
                center=true, $fn=20
            );

            M3_nut(5);
        }

        translate([
            -1.2, 2.75 + 9 - 5, 3 + 9
        ])
        rotate([0, -90, 0]) {
            cylinder(
                d=3.3, h=15,
                center=true, $fn=20
            );

            M3_nut(5);
        }

        // tube trap holes
        #translate([0, 11.75 + 25, 25])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        #translate([0, 11.75 - 25, 25])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        // tube trap holes
        translate([5, 11.75 + 25, 25])
        rotate([0, 90, 0])
        cylinder(d=7.5, h=5, center=true, $fn=30);

        translate([5, 11.75 - 25, 25])
        rotate([0, 90, 0])
        cylinder(d=7.5, h=5, center=true, $fn=30);
        
        // PCB cuts
        translate([13, 24, -0.1])
        cube([21, 26, 4]);

        translate([12, 23, 1.5])
        cube([23, 28, 4]);

        translate([23.5, 19, -0.1])
        cylinder(d=3.3, h=5, $fn=20);

        translate([23.5, pcw_mount_l + 11, -0.1])
        cylinder(d=3.3, h=5, $fn=20);

        // cable rest groove
        translate([14, 15.3, 11.4])
        rotate([90, 0, -25])
        cylinder(d=10, h=10, center=true, $fn=40);

        // zip tie groove
        translate([14, 15.3, -5])
        rotate([90, 0, -25])
        difference() {
            cube([
                17, 30, 3
            ], center=true);

            rounded_cube_side(
                13, 26, 4, 6,
                center=true, $fn=40
            );
        }

        // random holes for cable ties
        translate([10, 55.6, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([20, -4.4, 0])
        cylinder(d=4, h=10, center=true, $fn=30);
    }
}

module tronxy_cable_pcb_mount_tube_trap() {
    difference() {
        intersection() {
            rounded_cube_side(
                60, 70, 10, 35, center=true, $fn=40
            );

            translate([0, 100/2, 0])
            cube([100, 100, 100], center=true);
        }

        rounded_cube_side(
            40, 50, 20, 15, center=true, $fn=40
        );

        // screw holes
        translate([25, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);
        
        translate([-25, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        // nut holes
        translate([-25, 4, 10/2 - 6/2])
        cube([6, 2, 10], center=true);

        translate([25, 4, 10/2 - 6/2])
        cube([6, 2, 10], center=true);
    }
}

module tronxy_cable_pcb_mount_fasterner() {
    difference() {
        union() {
            hull() {
                translate([26/2, 4, 0])
                cylinder(d=7, h=2, $fn=20);

                translate([0, 6, 0])
                cube([26, pcw_mount_l - 12, 2]);

                translate([
                    26/2, pcw_mount_l - 4, 0
                ])
                cylinder(d=7, h=2, $fn=20);
            }
            translate([26/2, 4])
            cylinder(d=8, h=5, $fn=20);

            translate([26/2, pcw_mount_l - 4])
            cylinder(d=8, h=5, $fn=20);
        }

        translate([3, (pcw_mount_l - 25)/2, -0.1])
        cube([20, 25, 14]);

        translate([26/2, 4, -1])
        cylinder(d=3.3, h=6, $fn=20);

        translate([26/2, pcw_mount_l - 4, -1])
        cylinder(d=3.3, h=6, $fn=20);

        translate([26/2, 4, 3])
        M3_nut();

        translate([26/2, pcw_mount_l - 4,3])
        M3_nut();
    }
}

module tronxy_bed_spacer() {
    difference() {
        cube([35, 10, 15], center=true);

        translate([-10, 0, 0])
        cylinder(d=4.5, h=16, center=true, $fn=40);

        translate([10, 0, 0])
        cylinder(d=4.5, h=16, center=true, $fn=40);
    }
}

module qnd_motor_mount_fix() {
    //translate([90,203.5,0])
    //rotate([0,0,-13])
    //translate([-90,-203.5,0])
    //tronxy_motor_mount();

    //%tronxy_motor_mount();

    difference() {
        union() {
            chamfered_cube_side(28, 35, 20, 3);
 
            translate([-33.7, 30.6])
            rotate([0, 0, -13]) {
                cube([40, 19.8, 20]);

                translate([20, -5, 0])
                cube([39, 29.8, 20]);
            }
            translate([0, 5.9, 0])
            rotate([0, 0, 45])
            cube([20, 21.65, 20]);
        }
        translate([30, 30, 0])
        rotate([0, 0, 60])
        cube([20, 50, 20]);

        translate([8, 7, -0.1])
        cube([25, 20.2, 20 + 1]);

        translate([-20, 7 + 20.2/2, 20/2])
        rotate([0, 90, 0])
        cylinder(d=4.4, h=30, $fn=40);

        translate([-20, 7 + 20.2/2, 20/2])
        rotate([0, 90, 0])
        cylinder(d=10, h=21, $fn=40);

        translate([-33.7, 30.6, 20/2])
        rotate([0, 90, -13])
        translate([0, 19.8/2 - 1, -1])
        cylinder(d=3.7, h=27, $fn=40);
    }
}

module motor_mount_adapter_dollo() {
    //translate([90,203.5,0])
    //rotate([0,0,-13])
    //translate([-90,-203.5,0])
    //tronxy_motor_mount();

    //%tronxy_motor_mount();

    difference() {
        union() {
            chamfered_cube_side(35, 40, 20, 3);

            translate([-33.7, 30.6])
            rotate([0, 0, -13]) {
                cube([40, 19.8, 20]);

                translate([20, -5, 0])
                cube([39, 29.8, 20]);
            }
            translate([0, 3, 0])
            rotate([0, 0, 40.1])
            cube([20, 23.8, 20]);
        }
        translate([35, 37, 0])
        rotate([0, 0, 65])
        cube([20, 50, 20]);

        translate([6, 0, -0.1])
        cube([35, 30, 20 + 1]);

        translate([6, 15, 0])
        rotate([0, 0, 90])
        male_dovetail();

        translate([6 + 15, 30, 0])
        male_dovetail();

        translate([-33.7, 30.6, 20/2])
        rotate([0, 90, -13])
        translate([0, 19.8/2 - 1, -1])
        cylinder(d=3.7, h=27, $fn=40);
    }
}

module tronxy_PTFE_holder() {

    difference() {
        union() {
            cube([30, 6.5, 20]);

            translate([22 - 3, -2, 0])
            cube([6, 2.2, 20]);

            rotate([0, 0, 10])
            cube([5, 25, 20]);

            rotate([0, 0, 10])
            translate([5/2, 25, 0])
            cylinder(d=8, h=20, $fn=30);
        }

        translate([22, -1, 20/2])
        rotate([-90, 0, 0])
        cylinder(d=4.3, h=10, $fn=30);

        translate([0, -10.01, 3])
        chamfered_cube(30, 10, 14, 2);
        
        rotate([0, 0, 10])
        translate([5/2, 25, 0])
        cylinder(d1=4.5, d2=2.2, h=16, $fn=20);

        rotate([0, 0, 10])
        translate([5/2, 25, 15.99])
        cylinder(d=4, h=15, $fn=20);

        rotate([0, 0, 45])
        cube([4, 8, 60], center=true);

        translate([30, 6.5])
        rotate([0, 0, 45])
        cube([4, 4, 60], center=true);
    }
}

module tronxy_motor_mount_spacer() {
    difference() {
        union() {
            cube([44, 20, 7]);

            translate([0, 7, 0])
            cube([44,6, 8.5]);
        }
        translate([8, 20/2, 0])
        cylinder(d=4.5, h=20, center=true, $fn=30);

        translate([8 + 18, 20/2, 0])
        cylinder(d=4.5, h=20, center=true, $fn=30);
    }
}

module tronxy_z_endstop_mount() {
    difference() {
        union() {
            chamfered_cube_side(20, 45, 5, 4);

            translate([7, 0, -2.3])
            cube([6, 19, 5]);

            translate([7, 30.5, 3])
            rotate([0, 90, 0])
            chamfered_cube_side(
                5, 4, 6, 1.9
            );

            translate([6, 0, 0])
            cube([5, 20, 18]);
        }

        translate([-1, -1, -1])
        cube([7, 21, 10]);

        translate([0, 20, 1])
        rotate([0, 0, 45])
        cube([sqrt(6*6*2), sqrt(6*6*2), 10], center=true);

        translate([10, 25, 0])
        cylinder(d=4.5, h=11, center=true, $fn=20);

        translate([10, 40, 0])
        cylinder(d=4.5, h=11, center=true, $fn=20);

        translate([3, 5, 14])
        rotate([0, 90, 0])
        cylinder(d=1.3, h=10, $fn=10);

        translate([3, 15, 14])
        rotate([0, 90, 0])
        cylinder(d=1.3, h=10, $fn=10);
    }

    %translate([0, 0, 11])
    rotate([90, 0, 90])
    mechanical_endstop();
}

module tronxy_z_position_nut() {
    dents = 26;

    difference() {
        union() {
            translate([0, 0, 1/2])
            rounded_cylinder(23, 3, 1, $fn=50);

            cylinder(d=12, h=5, $fn=40);
        }
        cylinder(d=3.2, h=5, $fn=20);
        M3_nut();

        for(i = [0:dents - 1]) {
            rotate([0, 0, 360/dents*i])
            translate([24/2 + 0.4, 0, 0])
            rotate([0, 0, 45])
            cube([2, 2, 10], center=true);
        }
    }
}

module tronxy_wire_chain_support() {
    tilt = 3;
    l = 91;
    h = 30;

    difference() {
        intersection() {
            union() {
                translate([-1.99, 0, 0])
                cube([7, l/2 + 15, h]);

                translate([5, l/2 - 10, 0])
                cube([7, l/2 + 25, h]);

                translate([7, l, h/2])
                rotate([-tilt, 0, 0]) {
                    translate([
                        10/2, -18.4/2 - 5/2, 0
                    ])
                    cube([10, 5, 50], center=true);

                    translate([
                        10/2, 18.4/2 + 5/2, 0
                    ])
                    cube([10, 5, 50], center=true);
                }

                translate([7.5/2, 20/2, h/2])
                cube([7.5, 6, 30], center=true);
            }

            translate([-5, 0, 0])
            chamfered_cube(
                30, l + 13.5, h, 3
            );
        }

        // chamfers
        translate([5.01, 0, h/2 - 16/2])
        chamfered_cube(6, 19, 16, 2.5);

        translate([5, l/2 + 15, 0])
        rotate([0, 0, 74])
        translate([-40, 0, -1])
        cube([40, 30, 50]);

        translate([5, l/2 - 10, 0])
        rotate([0, 0, -16])
        translate([0, 0, -1])
        cube([30, 30, 50]);

        // frame mount hole
        translate([0, 10, h/2])
        rotate([0, 90, 0])
        cylinder(
            d=4.4, h=20, center=true, $fn=40
        );
        
        translate([0, l, h/2])
        rotate([-tilt, 0, 0]) {
            translate([9, 0, -8/2]) {
                rotate([0, -90, 0]) {
                    M3_nut(5);

                    cylinder(
                        d=3.3, h=10,
                        center=true, $fn=30
                    );
                }
            }
            translate([9, 0, 8/2]) {
                rotate([0, -90, 0]) {
                    M3_nut(5);

                    cylinder(
                        d=3.3, h=10,
                        center=true, $fn=30
                    );
                }
            }
        }
    }
}

module tronxy_corner_bearing_mount_left(
    y_endstop=false
) {
    //%translate([0,20,5])
    //rotate([0,180,0])
    //import("../../../Drivers/Tronxy/X5S-2EV2.0 -En/stl/gou-lun-db-l.stl");

    h = 40;

    pulley_d = 35;

    //translate([0, 0, -13/2])
    //rotate([90, -45, 0])

    difference() {
        union() {
            chamfered_cube(25, 49, h, 2);
            chamfered_cube(45, 40, h, 2);

            translate([-7, -7, -34])
            chamfered_cube(37, 37, h + 34, 2);
        }

        translate([34, 10, 0]) {
            cylinder(
                d=4.3, h=h*3, center=true, $fn=40
            );

            translate([0, 0, 4])
            cylinder(d=9.2, h=h, $fn=50);
        }
        translate([18, 10, 0]) {
            cylinder(
                d=4.3, h=h*3, center=true, $fn=40
            );

            translate([0, 0, 4])
            cylinder(d=9.2, h=h, $fn=50);
        }
        translate([10, 44, 0]) {
            cylinder(
                d=4.3, h=h*3, center=true, $fn=40
            );

            translate([0, 0, 4])
            cylinder(d=9.2, h=h, $fn=50);
        }

        translate([30, 26, 0]) {
            cylinder(
                d=5.2, h=h*3, center=true, $fn=50
            );

            translate([0, 0, 5])
            hull() {
                cylinder(
                    d=pulley_d + 2, h=h - 10, $fn=50
                );

                translate([-10, 30, 0])
                cylinder(
                    d=pulley_d + 2, h=h - 10, $fn=50
                );

                translate([30, -5, 0])
                cylinder(
                    d=pulley_d + 2, h=h - 10, $fn=50
                );
            }
        }
        // cuts
        translate([20/2 + 20, 45, 0])
        cube([20, 20, 20], center=true);

        // bottom mount screw holes
        translate([0, 10, -26])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=20, center=true, $fn=40);

        translate([-9, 10, -26])
        rotate([0, -90, 0])
        cylinder(d=9.2, h=10, center=true, $fn=40);

        translate([23, 0, -10])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=20, center=true, $fn=40);

        translate([23, -9, -10])
        rotate([90, 0, 0])
        cylinder(d=9.2, h=10, center=true, $fn=40);

        // chamfers
        hull() {
            translate([-11, 50, 3])
            cube([60, 50, 1]);

            translate([-11, 32, h])
            cube([60, 50, 1]);
        }

        translate([-5, -5, 0])
        rotate([0, 0, 45])
        cube([8, 25, h*3], center=true);

        translate([0, 29, -27])
        rotate([-35, 0, 0])
        cube([60, 20, 50], center=true);

        translate([20, 0, -31])
        rotate([0, 60, 0])
        cube([20, 100, 60], center=true);

        translate([40, 41, 0])
        rotate([0, 0, -45])
        cube([50, 20, 140], center=true);


        // bottom cut
        translate([0, 0, -35])
        cube([45, 55, 35]);

        if (y_endstop) {
//            translate([-7, 20, -15])
//            chamfered_cube(10, 12, 18, 2);

            translate([-7, 25, -2])
            rotate([0, 90, 0])
            cylinder(d=1.3, h=20, center=true, $fn=10);

            translate([-7, 25, -12])
            rotate([0, 90, 0])
            cylinder(d=1.3, h=20, center=true, $fn=10);
        }
    }
}

module tronxy_corner_bearing_mount_right() {
    mirror([1, 0, 0])
    tronxy_corner_bearing_mount_left(
        y_endstop=true
    );
}

module tronxy_corner_bearing_mount_spacers() {
    h = 30;

    // bottom spacer
    tube(8.3, 4.4, (8.3 - 5.2)/2, $fn=60);

    // top spacer
    translate([10, 0, 0])
    tube(8.3, 2.6, (8.3 - 5.2)/2, $fn=60);
   
    // middle spacer
    translate([5, 9, 0])
    tube(8.3, 1, (8.3 - 5.2)/2, $fn=60);   
}

module gt2_idler_625zz() {

    d = 24;
    h = 11;

    union() {
        difference() {
            union() {
                // edge
                hull() {
                    cylinder(d=d + 4, h=0.8, $fn=100);
                    cylinder(d=d + 2.8, h=1.4, $fn=100);
                }

                // main idler
                cylinder(d=d, h=h - 1.4, $fn=100);

                // retainer locking part
                translate([0, 0, h - 1.4])
                cylinder(
                    d1=d - 4, d2=d - 2.2,
                    h=1, $fn=100
                );
            }
            translate([0, 0, 0.4])
            cylinder(d=16 + 0.2, h=h*3, $fn=100);

            translate([0, 0, -0.4])
            cylinder(d=14.2, h=2, $fn=100);

            for(i = [0:3]) {
                rotate([0, 0, 360/4*i])
                translate([
                    (d - 5)/2 + 2/2, 0,
                    h - 1.4 + 2/2
                ])
                cube([2, 6, 2], center=true);
            }
        }
        for(i = [0:6]) {
            rotate([0, 0, 360/7*i])
            translate([17/2, 0, 0])
            cylinder(d=1.2, h=h - 0.4, $fn=20);
        }

//        #translate([0, 0, h/2])
//        cube_donut(17, 2);
    }
}

module gt2_idler_625zz_retainer() {
    d = 24;
    h = 11;

    union() {
        difference() {
            // edge
            hull() {
                cylinder(d=d + 4, h=0.8, $fn=100);
                cylinder(d=d + 2.8, h=1.4, $fn=100);
            }

            translate([0, 0, 0.4])
            cylinder(d=d - 1.8, h=2, $fn=100);

            translate([0, 0, -0.4])
            cylinder(d=14.2, h=2, $fn=100);

            for (i = [0:3]) {
                rotate([0, 0, i*90 + 45])
                translate([9, 0, 0])
                cylinder(d=2, h=2, center=true, $fn=30);
            }
        }

        difference() {
            for (i = [0:3]) {
                rotate([0, 0, i*90 + 45])
                translate([
                    (d - 4.8)/2 + 2/2, 0, 1/2 + 0.4
                ])
                cube([2, 5.5, 1], center=true);
            }

            translate([0, 0, 0.4])
            cylinder(
                d2=d - 3.8, d1=d - 2, h=1, $fn=100
            );

            translate([0, 0, 1.2])
            cylinder(d=20.2, h=1.2, $fn=100);
        }
    }
}

module gt2_idler_625zz_spacer() {
   difference() {
       cylinder(d=15.9, h=0.2, $fn=50);
       cylinder(d=10, h=2, center=true, $fn=50);
   }
}

module duet_case_frame_adapter() {
    difference() {
        chamfered_cube_side(180, 20, 7, 3, center=true);

        cylinder(d=4.3, h=20, center=true, $fn=30);

        translate([0, 0, -0.6])
        M4_nut(4);

        translate([-44.5, 0, 0])
        cylinder(d=4.3, h=20, center=true, $fn=30);

        translate([-44.5, 0, -0.6])
        M4_nut(4);

        translate([44.5, 0, 0])
        cylinder(d=4.3, h=20, center=true, $fn=30);

        translate([44.5, 0, -0.6])
        M4_nut(4);

        translate([-83, 0, -1.8])
        cylinder(d=4.3, h=20, $fn=30);

        translate([83, 0, -1.8])
        cylinder(d=4.3, h=20, $fn=30);

        translate([-83, 0, -4.5])
        cylinder(d=8, h=5, center=true, $fn=30);

        translate([83, 0, -4.5])
        cylinder(d=8, h=5, center=true, $fn=30);
    }
}

module z_chain_fix() {

    module _chain_side() {
        difference() {
            hull() {
                rotate([0, 90, 0])
                cylinder(d=14.1, h=3, $fn=40);

                translate([3/2, 10/2 - 0.5, 0])
                cube([3, 10, 22], center=true);
            }

            difference() {
                translate([-0.05, 0, 0])
                rotate([0, 90, 0])
                cylinder(d=6, h=5, $fn=40);

                translate([-0.4, 0, 0])
                rotate([0, 0, -12])
                cube([2, 10, 10], center=true);
            }

            intersection() {
                hull() {
                    translate([1.8, 0, 0])
                    rotate([0, 90, 0])
                    cylinder(d=9, h=2, $fn=40);

                    translate([1.8, -8, 0])
                    rotate([0, 90, 0])
                    cylinder(d=7.2, h=2, $fn=40);

                    translate([3.7, 8, 0])
                    rotate([0, 90, 0])
                    cylinder(d=7.2, h=2, $fn=40);
                }

                translate([1.8 + 2/2, 0])
                cube([2, 20, 7.2], center=true);
            }
        }
    }

    difference() {
        union() {
            translate([0, 0, 4/2])
            rounded_cube_side(
                20, 42.3, 4, 4, center=true, $fn=60
            );

            translate([0, 42/2 - 18/2, 4+ 3/2])
            cube([18, 18, 3], center=true);

            hull() {
                translate([0, 42.3/2 + 4, 4 + 13.7/2])
                rotate([0, 90, 0])
                cylinder(d=13.7, h=18, center=true, $fn=40);

                translate([0, 17, 4 + 13.7/2])
                cube([18, 0.1, 13.7], center=true);

                translate([0, 42/2 - 18 + 0.1/2, 4 + 6/2])
                cube([18, 0.1, 6], center=true);
            }
        }

        translate([0, 0, 4 + 3 + 15/2])
        cube([10, 80, 15], center=true);

        translate([0, 35.8, 0])
        rotate([-45, 0, 0])
        cube([10, 80, 15], center=true);

        translate([-18/2 - 0.5, 42.3/2 + 4, 4 + 14/2])
        _chain_side();

        mirror([1, 0, 0])
        translate([-18/2 - 0.5, 42.3/2 + 4, 4 + 14/2])
        _chain_side();

        translate([0, -42.3/2 + 6.1, 0])
        cylinder(d=4.4, h= 20, center=true, $fn=30);

        translate([0, -42.3/2 + 18.1, 0])
        cylinder(d=4.4, h= 20, center=true, $fn=30);
    }
}

module y_endstop_holder() {
    difference() {
        union() {
            translate([0, 0, 8/2])
            chamfered_cube_side(
                40, 60, 8, 7, center=true
            );

            translate([40/2 - 10, 8, 8])
            cube([6, 14, 4], center=true);

            translate([40/2 - 10, -16, 8])
            cube([6, 10, 4], center=true);

            translate([-40/2 + 10, -8, 8])
            cube([6, 10, 4], center=true);

            translate([-40/2 + 10, -28, 8])
            cube([6, 2, 4], center=true);
        }

        // chamfers
        translate([-40/2 - 10, 60/2 - 15, 0])
        chamfered_cube(
            40, 60, 60, 10, center=true
        );

        translate([10, -35, 0])
        rotate([0, 0, -45])
        cube([20, 70, 60], center=true);

        translate([10, 35, 0])
        rotate([0, 0, 35])
        cube([20, 70, 60], center=true);

        // screw holes
        translate([40/2 - 10, 60/2 - 35, 0])
        cylinder(d=4.3, h=20, center=true, $fn=30);

        translate([-40/2 + 10, 60/2 - 50, 0])
        cylinder(d=4.3, h=20, center=true, $fn=30);

        // endstop screw holes
        translate([40/2 - 25, 60/2 - 4, 0])
        cylinder(d=1.3, h=20, center=true, $fn=10);

        translate([40/2 - 25, 60/2 - 14, 0])
        cylinder(d=1.3, h=20, center=true, $fn=10);
    }

    %translate([-2, 31, 0])
    rotate([180, 0, -90])
    mechanical_endstop();
}

module tronxy_frame_brace(psu_mount=false) {
    l = 150;
    w = 27;

    module _main_body() {
        difference() {
            hull() {
                translate([0, l - w/2 - 10/2, 10/2])
                chamfered_cube(
                    w, 10, 10, 2, center=true
                );

                translate([
                    l - 26/2 - 10/2, 0, 10/2
                ])
                chamfered_cube(
                    10, w, 10, 2, center=true
                );

                translate([0, 0, 10/2])
                chamfered_cube(
                    w, w, 10, 2, center=true
                );
            }

            // 2020 cuts
            translate([0, l/2 - 20/2, 20/2 + 6])
            cube([20.1, l + .2, 20], center=true);

            translate([l/2 - 20/2, 0, 20/2 + 6])
            cube([l + .2, 20.1, 20], center=true);

            // PSU mount hole
            if (psu_mount) {
                translate([-27/2, 22.5, 6 + 20/2])
                rotate([0, 90, 0])
                intersection() {
                    cylinder(
                        d=22, h=10, center=true, $fn=40
                    );

                    translate([-1, 0, 0])
                    cube([22, 22, 10], center=true);
                }
            }

            // honeycomb
            intersection() {
                hull() {
                    translate([w/2 + 3, w/2 + 3, 0])
                    cylinder(
                        d=5, h=40, center=true, $fn=30
                    );

                    translate([w/2 + 3, l - 33, 0])
                    cylinder(
                        d=5, h=40, center=true, $fn=30
                    );

                    translate([l - 33, w/2 + 3, 0])
                    cylinder(
                        d=5, h=40, center=true, $fn=30
                    );
                }

                translate([-235, -235, 0])
                for(j = [0:39]) {
                    translate([0, j*16])
                    rotate([0, 0, -60])
                    for (i = [0:39]) {
                        translate([0, i*16])
                        cylinder(
                            d=15, h=60,
                            center=true, $fn=6
                        );
                    }
                }
            }
        }
    }

    module _frame_screw_holes() {
        cylinder(d=10, h=40, center=true, $fn=40);

        translate([0, 20, 0])
        cylinder(d=10, h=40, center=true, $fn=40);

        translate([20, 0, 0])
        cylinder(d=10, h=40, center=true, $fn=40);
    }

    module _mount_holes() {
        translate([0, 10, 3.25])
        cylinder(d=4.3, h=40, $fn=30);

        translate([0, 10, 0])
        cylinder(d=9.6, h=6, center=true, $fn=30);

        translate([0, l - 22, 3.25])
        cylinder(d=4.3, h=40, $fn=30);

        translate([0, l - 22, 0])
        cylinder(d=9.6, h=6, center=true, $fn=30);

        translate([0, l/2 - 5, 3.25])
        cylinder(d=4.3, h=40, $fn=30);

        translate([0, l/2 - 5, 0])
        cylinder(d=9.6, h=6, center=true, $fn=30);

        translate([10, 0, 3.25])
        cylinder(d=4.3, h=40, $fn=30);

        translate([10, 0, 0])
        cylinder(d=9.6, h=6, center=true, $fn=30);

        translate([l - 22, 0, 3.25])
        cylinder(d=4.3, h=40, $fn=30);

        translate([l - 22, 0, 0])
        cylinder(d=9.6, h=6, center=true, $fn=30);

        translate([l/2 - 5, 0, 3.25])
        cylinder(d=4.3, h=40, $fn=30);

        translate([l/2 - 5, 0, 0])
        cylinder(d=9.6, h=6, center=true, $fn=30);
    }

    module _leg_mount_holes() {
        translate([0, 59, 0])
        cylinder(d=4.3, h=40, center=true, $fn=30);

        translate([0, 59, 2.4])
        M4_nut(4);
        
        translate([59, 0, 0])
        cylinder(d=4.3, h=40, center=true, $fn=30);

        translate([59, 0, 2.4])
        M4_nut(4);

        translate([0, 41, 0])
        cube([6.2, 22, 8], center=true);

        translate([41, 0, 0])
        cube([22, 6.2, 8], center=true);
    }
    
    difference() {
        _main_body();
        _frame_screw_holes();
        _mount_holes();
        _leg_mount_holes();
    }
}