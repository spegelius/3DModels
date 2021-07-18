use <../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;
use <case_profile.scad>;


h = 171;

stud_h = 4; 

//debug();

//case_corner_1();
//case_corner_2();
//case_corner_3();
//case_corner_4();

//case_middle_1();
//case_middle_2();

//case_top_1();
//case_top_2();
//case_top_3();
//case_top_4();

//case_top_middle();

//card_plate();

//joint_block();
//joint_block_ssd_1();
//joint_block_ssd_2();

//ssd_attachment();

//fan_mount_140();
//fan_mount_140_2();

//fan_mount_120();
//fan_mount_120_2();

//fan_mount_clip_120_top_1();
//fan_mount_clip_120_top_2();

//fan_mount_clip_120_bottom_2();
//fan_mount_clip_120_bottom_1();

//fan_mount_clip_140_bottom_1();
//fan_mount_clip_140_bottom_2();

//fan_mount_clip_140_top_1();
//fan_mount_clip_140_top_2();

//bolt_knob();

//psu_support_clip();
foot_clip();


module M6_thread(h=50) {
    v_screw(h=h, screw_d=6.2, pitch=1, direction=0,
            steps=40, depth=0.1, chamfer=false);
}

module joint_block_ssd_1() {
    difference() {
        union() {
            joint_block();

            translate([-8, -20, -20/2 + 10/2])
            cube([19, 10, 10], center=true);
        }
        translate([-18.5, -18, -20/2 + 10/2])
        rotate([0, 45, 0])
        cube([10, 10, 10], center=true);
    }
}

module joint_block_ssd_2() {
    mirror([1, 0, 0])
    joint_block_ssd_1();
}

module case_corner_1() {

    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([142/2 - 20/2 + 13, 0, 20/2])
            rotate([0, 90, 0])
            _profile(142);

            translate([0, 182/2 - 20/2 + 13, 20/2])
            rotate([-90, 0, 0])
            _profile(182);

            translate([96.35, 182/2 - 20/2 + 13, 20/2])
            rotate([-90, 0, 0])
            _profile(182);

            translate([96.35, 98, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            // PSU mount
            translate([90/2 + 3, 55, 20/2])
            cube([90, 2, 20], center=true);

            translate([90/2 + 3, 165, 20/2])
            cube([90, 2, 20], center=true);

            hull() {
                translate([90/2 + 3, 55, 20 - 1/2])
                cube([90, 7, 1], center=true);

                translate([90/2 + 3, 55, 20 - 4 + 1/2])
                cube([90, 2, 1], center=true);
            }

            hull() {
                translate([74.5, 54 - 2/2, 25])
                rotate([90, 0, 0])
                cylinder(d=12.5, h=3,
                center=true, $fn=40);

                translate([75, 54 - 2/2, 20 - 0.1/2])
                cube([14, 3, 0.1], center=true);
            }

            translate([81.5, 55, 20 + 7/2])
            cube([2, 7, 7], center=true);

            hull() {
                translate([-0.5, 54 - 2/2, 20 + 29])
                rotate([90, 0, 0])
                cylinder(d=12.5, h=3,
                center=true, $fn=40);

                translate([0, 54 - 2/2, 20 - 2/2])
                cube([14, 3, 2], center=true);
            }

            translate([-7.5, 56.5, 20 + 25/2])
            cube([2, 10, 25], center=true);
        }
        translate([96.35, 98, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 0, 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.6, h=500, center=true, $fn=50);

        translate([-20/2, 185, 20/2])
        _joint_form();

        translate([20/2 + 96.35, 185, 20/2])
        rotate([0, 180, 0])
        _joint_form();

        translate([145 + 12/2 - 2, 0, 20/2])
        chamfered_cube(12, 12, 12, 2, center=true);

        // PSU holes
        translate([74, 55 - 2/2, 26])
        rotate([90, 0, 0]) {
            cylinder(d=3.8, h=10, center=true, $fn=40);

            translate([0, 0, 1.5])
            cylinder(d=8, h=2, $fn=40);
        }

        translate([0, 55 - 2/2, 20 + 30])
        rotate([90, 0, 0]) {
            cylinder(d=3.8, h=10, center=true, $fn=40);

            translate([0, 0, 1.5])
            cylinder(d=8, h=2, $fn=40);
        }

        translate([0, 0, h - 20])
        M6_thread(25);
    }

    // supports
    translate([1/2, 185 - 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([3/2, 185 - 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);

    translate([96.35 - 1/2, 185 - 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([96.35 - 3/2, 185 - 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);
}

module case_corner_2() {
    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([142/2 - 20/2 + 13, 0, 20/2])
            rotate([0, 90, 0])
            _profile(142);

            translate([0, -182/2 + 20/2 - 13, 20/2])
            rotate([90, 0, 0])
            _profile(182);

            translate([96.35, -182/2 + 20/2 - 13, 20/2])
            rotate([90, 0, 0])
            _profile(182);

            translate([96.35, -139.9, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            translate([96.35, -67.55, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            // SSD mount
            translate([114, -128, 10/2])
            cube([20, 10, 10], center=true);
        }
        #translate([96.35, -139.9, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        #translate([96.35, -67.55, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 0, 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.6, h=500, center=true, $fn=50);

        translate([-20/2, -185, 20/2])
        _joint_form();

        translate([20/2 + 96.35, -185, 20/2])
        rotate([0, 180, 0])
        _joint_form();

        translate([145 + 12/2 - 2, 0, 20/2])
        chamfered_cube(12, 12, 12, 2, center=true);

        translate([0, 0, h - 20])
        M6_thread(25);

        // SSD mount
        translate([117.4, -123, 10/2])
        rotate([-10, 0, 0])
        cube([14, 3, 15], center=true);
        
        translate([117.4, -123, 10/2])
        rotate([80, 0, 0])
        cylinder(d=2.8, h=30, center=true, $fn=30);
    }

    // supports
    translate([1/2, -185 + 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([3/2, -185 + 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);

    translate([96.35 - 1/2, -185 + 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([96.35 - 3/2, -185 + 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);
}

module case_corner_3() {
    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([-142/2 + 20/2 - 13, 0, 20/2])
            rotate([0, -90, 0])
            _profile(142);

            translate([0, 182/2 - 20/2 + 13, 20/2])
            rotate([-90, 0, 0])
            _profile(182);

            translate([-35/2 + 20/2 - 13, 75.1, 20/2])
            rotate([0, -90, 0])
            _profile(35);

            translate([-31.7, 75.1, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            translate([0, 57, 10])
            cylinder(d=8, h=10, $fn=20);

            translate([0, 37, 10])
            cylinder(d=8, h=10, $fn=20);

            translate([-9 - 39/2, 165, 10/2])
            cube([39, 10, 10], center=true);

        }
        translate([-31.7, 75.1, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 57, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 37, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 0, 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.6, h=500, center=true, $fn=50);

        translate([20/2, 185, 20/2])
        rotate([0, 180, 0])
        _joint_form();

        translate([-145 - 12/2 + 2, 0, 20/2])
        chamfered_cube(12, 12, 12, 2, center=true);

        translate([0, 0, h - 20])
        M6_thread(25);

        translate([-48.6, 167, 10/2])
        rotate([0, 45, 0])
        cube([10, 10, 10], center=true);
    }

    // supports
    translate([-1/2, 185 - 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([- 3/2, 185 - 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);
}

module case_corner_4() {
    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([-142/2 + 20/2 - 13, 0, 20/2])
            rotate([0, -90, 0])
            _profile(142);

            translate([0, -182/2 + 20/2 - 13, 20/2])
            rotate([90, 0, 0])
            _profile(182);

            translate([-35/2 + 20/2 - 13, -67.5, 20/2])
            rotate([0, -90, 0])
            _profile(35);

            translate([-35/2 + 20/2 - 13, -139.9, 20/2])
            rotate([0, -90, 0])
            _profile(35);

            translate([-31.7, -139.9, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            translate([-31.7, -67.55, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            // SSD mount
            translate([-38, -128, 10/2])
            cube([14, 10, 10], center=true);
        }
        #translate([-31.7, -67.55, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        #translate([-31.7, -139.9, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 0, 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.6, h=500, center=true, $fn=50);

        translate([20/2, -185, 20/2])
        rotate([0, 180, 0])
        _joint_form();

        translate([-145 - 12/2 + 2, 0, 20/2])
        chamfered_cube(12, 12, 12, 2, center=true);

        translate([0, 0, h - 20])
        M6_thread(25);

        // SSD mount
        translate([-38, -123, 10/2])
        rotate([-10, 0, 0])
        cube([15, 3, 15], center=true);

        translate([-39.6, -123, 10/2])
        rotate([80, 0, 0])
        cylinder(d=2.8, h=30, center=true, $fn=30);
    }

    // supports
    translate([-1/2, -185 + 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([- 3/2, -185 + 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);
}

module case_middle_1() {
    difference() {
        union() {
            translate([0, 0, 20/2])
            rotate([0, 90, 0])
            _profile(120);

            translate([35, 182/2 - 20/2 + 13, 20/2])
            rotate([-90, 0, 0])
            _profile(182);

            translate(
                [35 + 15/2 - 20/2 + 13, 75.1, 20/2])
            rotate([0, -90, 0])
            _profile(15);

            translate([48.8, 75.1, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            translate([35, 57, 10])
            cylinder(d=8, h=10, $fn=20);

            translate([35, 37, 10])
            cylinder(d=8, h=10, $fn=20);

            translate([-60 + 12/2 - 1.9, 0, 20/2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([60 - 12/2 + 1.9, 0, 20/2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([35 + 9 + 25/2, 165, 10/2])
            cube([25, 10, 10], center=true);
        }

        #translate([48.8, 75.1, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        #translate([35, 57, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        #translate([35, 37, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 0, 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.6, h=500, center=true, $fn=50);

        translate([-20/2 + 35, 185, 20/2])
        _joint_form();

        translate([35 + 34.9, 167, 10/2])
        rotate([0, 45, 0])
        cube([10, 10, 10], center=true);
    }

    // supports
    translate([35 + 1/2, 185 - 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([35 + 3/2, 185 - 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);
}

module case_middle_2() {
    difference() {
        union() {
            translate([0, 0, 20/2])
            rotate([0, 90, 0])
            _profile(120);

            translate([35, -182/2 + 20/2 - 13, 20/2])
            rotate([-90, 0, 0])
            _profile(182);

            translate(
                [35 + 15/2 - 20/2 + 13, -67.5, 20/2])
            rotate([0, -90, 0])
            _profile(15);

            translate(
                [35 + 15/2 - 20/2 + 13, -139.9, 20/2])
            rotate([0, -90, 0])
            _profile(15);

            translate([48.8, -139.9, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            translate([48.8, -67.55, 10])
            cylinder(d=8, h=10 + stud_h, $fn=20);

            translate([-60 + 12/2 - 1.9, 0, 20/2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([60 - 12/2 + 1.9, 0, 20/2])
            chamfered_cube(12, 12, 12, 2, center=true);

            // SSD mount
            translate([17, -128, 10/2])
            cube([16, 10, 10], center=true);

            translate([56, -128, 10/2])
            cube([22, 10, 10], center=true);
        }
        #translate([48.8, -67.55, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        #translate([48.8, -139.9, 0])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        translate([0, 0, 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.6, h=500, center=true, $fn=50);

        translate([-20/2 + 35, -185, 20/2])
        _joint_form();

        // SSD mount
        translate([15.4, -123, 10/2])
        rotate([-10, 0, 0])
        cube([14, 3, 15], center=true);

        translate([62.4, -123, 10/2])
        rotate([-10, 0, 0])
        cube([14, 3, 15], center=true);

        translate([15.4, -123, 10/2])
        rotate([80, 0, 0])
        cylinder(d=2.8, h=30, center=true, $fn=20);

        translate([62.4, -123, 10/2])
        rotate([80, 0, 0])
        cylinder(d=2.8, h=30, center=true, $fn=30);
    }

    // supports
    translate([35 + 1/2, -185 + 40/2, 1.8/2])
    cube([1, 40, 1.8], center=true);

    translate([35 + 3/2, -185 + 40/2, 0.2/2])
    cube([3, 40, 0.2], center=true);
}

module case_top_1() {
    difference() {
        union() {
            translate([0, 0, 20/2])
            _profile(20);

            translate([152/2 - 20/2 + 13, 0, 20/2])
            rotate([0, 90, 0])
            _profile(152);

            translate([0, -182/2 + 20/2 - 13, 20/2])
            rotate([-90, 0, 0])
            _profile(182);
        }
        translate([0, 0, 20 + 12/2 - 2])
        chamfered_cube(12, 12, 12, 2, center=true);

        translate([-20/2, -185, 20/2])
        _joint_form();

        translate([155, 20/2, 20/2])
        rotate([0, 0, -90])
        _joint_form();

        cylinder(d=6.4, h=60, center=true, $fn=40);
    }
}

module case_top_2() {
    mirror([0, 1, 0])
    case_top_1();
}

module case_top_3() {
    mirror([1, 0, 0])
    case_top_1();
}

module case_top_4() {
    mirror([1, 0, 0])
    case_top_2();
}

module case_top_middle() {
    difference() {
        union() {
            translate([0, 0, 20/2])
            rotate([90, 0, 0])
            _profile(99.5);

            translate([-20/2, 100/2, 20/2])
            intersection() {
                joint_block();

                translate([0, 40/2 - 0.5, 0])
                cube([30, 40, 30], center=true);
            }

            translate([-20/2, -100/2, 20/2])
            intersection() {
                joint_block();

                translate([0, -40/2 + 0.5, 0])
                cube([30, 40, 30], center=true);
            }
        }
    }
}
    

module card_plate() {
    rotate([-90, 0, 0])
    difference() {
        union() {
            cube([150, 2, 133.8]);

            translate([0, -10, 133.8 - 4])
            cube([150, 10, 4]);

            for (i = [0:7]) {
                translate(
                    [3.5 + i * card_spacing,
                     -3, 10])
                cube([2.5, 3, 120]);
            }

            translate([-15, -28, 21.5])
            cube([20, 30, 2]);

            hull() {
                translate([3, -23, 21.5])
                cube([2, 25, 2]);

                translate([3, 0, 21.5])
                cube([2, 2, 30]);
            }

            hull() {
                translate([0, 0, 21.5])
                cube([2, 2, 20]);

                translate([-3, 0, 21.5])
                cube([2, 2, 2]);
            }

            translate([147, 1, 21.5])
            hull() {
                cube([28, 1, 2]);

                translate([8, -30, 0])
                cube([20, 1, 2]);
            }

            translate([147, 1, 21.5])
            hull() {
                cube([2, 1, 30]);

                translate([8, -30, 0])
                cube([2, 1, 2]);
            }
        }
        for (i = [0:6]) {
            translate(
                [7.25 + i * card_spacing, -3, 26])
            cube([15, 6, 103.8]);

            translate(
                [9.5 + i * card_spacing, -3, 125])
            cube([10, 6, 106]);

            translate(
                [4.5 + i * card_spacing, -3, 133 - 6])
            cylinder(d=3, h=7, $fn=30);
        }
        
        translate([9, 0, 4])
        rotate([-90, 0, 0])
        cylinder(d=4,h=3);

        translate([141 - 16.5 + 9, 0, 4])
        rotate([-90, 0, 0])
        cylinder(d=4,h=3);

        translate([-1, -4, 0])
        cube([160, 8, 15]);

        translate([-1, -4, 0])
        cube([7, 8, 23.5]);

        translate([-5, -3, 0])
        cylinder(d=3.8, h=50, $fn=30);

        translate([-5, -23, 0])
        cylinder(d=3.8, h=50, $fn=30);

        translate([165, -3, 0])
        cylinder(d=3.8, h=50, $fn=30);

        translate([165, -23, 0])
        cylinder(d=3.8, h=50, $fn=30);
    }
}

module ssd_attachment() {
    difference() {
        union() {
            translate([(122.5 - 72)/2 - 1.7, -40])
            cube([74, 10, 1.6]);

            translate([(122.5 - 72)/2 - 1.7, -41.99])
            cube([74.4, 2, 10]);

            translate(
                [(122.5 - 72)/2 - 1.7, 100 - 40 - 10])
            cube([74, 10, 1.6]);

            translate([(122.5 - 72)/2 - 1.7, -40])
            cube([2, 100, 21]);

            translate([(122.5 - 72)/2 + 70.7, -40])
            cube([2, 100, 21]);

            translate([98, -40, 10/2])
            cube([30, 10, 10], center=true);

            translate([98 - 74.4, -40, 10/2])
            cube([30, 10, 10], center=true);

            intersection() {
                union() {
                    translate([107.5, 40, 10/2])
                    rotate([-10, 0, 0])
                    cube([20, 3, 11], center=true);

                    translate([15, 40, 10/2])
                    rotate([-10, 0, 0])
                    cube([20, 3, 11], center=true);
                }
                translate([70, 40, 10/2])
                cube([200, 10, 10], center=true);
            }
        }

        // center cut
        translate([70.4/2 + 25.55, 0, 10/2 + 1.6])
        cube([70.4, 80, 10], center=true);

        // chamfers
        translate([61, -40 - 30/2 - 2, 0])
        chamfered_cube(75, 30, 70, 10, center=true);

        translate([98 + 30/2, -40, 10])
        rotate([0, 45, 0])
        cube([10, 15, 10], center=true);

        translate([98 + 30/2, -40, 0])
        rotate([0, 45, 0])
        cube([10, 15, 10], center=true);

        translate([98 - 74.4 - 30/2, -40, 10])
        rotate([0, 45, 0])
        cube([10, 15, 10], center=true);

        translate([98 - 74.4 - 30/2, -40, 0])
        rotate([0, 45, 0])
        cube([10, 15, 10], center=true);

        // SSD mount holes
        translate([50, -45 + 15.2, 5.5])
        rotate([0, 90, 0])
        cylinder(d=3.8, h=350, center=true);

        translate([50, 65 - 17.5, 5.5])
        rotate([0, 90, 0])
        cylinder(d=3.8, h=350, center=true);

        translate([50, -45 + 15.2, 5.5 + 9.5])
        rotate([0, 90, 0])
        cylinder(d=3.8, h=350, center=true);

        translate([50, 65 - 17.5, 5.5 + 9.5])
        rotate([0, 90, 0])
        cylinder(d=3.8, h=350, center=true);

        // mount holes
        translate([113, 40, 5])
        rotate([80, 30, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

        translate([10, 40, 5])
        rotate([80, 30, 0])
        cylinder(d=3.5, h=30, center=true, $fn=30);

    }

    %translate([95.8, 61, 12])
    rotate([0, 0, 180])
    mock_ssd();

    %translate([95.8, 61, 2.5])
    rotate([0, 0, 180])
    mock_ssd();
}

module fan_mount_140() {
    difference() {
        chamfered_cube_side(144, 36, 4, 5, center=true);

        translate([0, 2, 3])
        chamfered_cube_side(140, 36, 4, 4.2, center=true);

        translate([0, 140/2, 0])
        //cylinder(d1=140, d2=142, h=5, center=true, $fn=80);
        chamfered_cube(140, 140, 80, 27, center=true);

        translate([-124.5/2, 8.2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([124.5/2, 8.2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([-120/2, -10, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([120/2, -10, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([0, -10, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([-120/4, -10, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([120/4, -10, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);
    }
}

module fan_mount_140_2() {
    difference() {
        chamfered_cube_side(144, 40, 4, 5, center=true);

        translate([0, 2, 3])
        chamfered_cube_side(140, 40, 4, 4.2, center=true);

        translate([0, 140/2 + 4, 0])
        //cylinder(d1=140, d2=142, h=5, center=true, $fn=80);
        chamfered_cube(140, 140, 80, 27, center=true);

        translate([-124.5/2, 15.2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([124.5/2, 15.2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([-120/2, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([120/2, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([0, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([-120/4, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([120/4, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);
    }
}

module fan_mount_120() {
    difference() {
        chamfered_cube_side(124, 56, 4, 5, center=true);

        translate([0, 2, 3])
        chamfered_cube_side(120, 56, 4, 4.2, center=true);

        translate([0, 120/2 + 7, 0])
        //cylinder(d1=140, d2=142, h=5, center=true, $fn=80);
        chamfered_cube(120, 120, 80, 27, center=true);
        translate([0, 160/2 - 10, 0])
        cube([90, 160, 10], center=true);

        translate([-104.5/2, 18.2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([104.5/2, 18.2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([-100/2, -20, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([100/2, -20, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([0, -20, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([-100/4, -20, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([100/4, -20, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);
    }
}

module fan_mount_120_2() {
    difference() {
        chamfered_cube_side(124, 42, 4, 5, center=true);

        translate([0, 2, 3])
        chamfered_cube_side(120, 42, 4, 4.2, center=true);

        translate([0, 120/2 + 7, 0])
        //cylinder(d1=140, d2=142, h=5, center=true, $fn=80);
        chamfered_cube(120, 120, 80, 27, center=true);
        translate([0, 160/2 - 10, 0])
        cube([90, 160, 10], center=true);

        translate([-105/2, 15.1, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([105/2, 15.1, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([-100/2, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([100/2, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([0, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([-100/4, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([100/4, -13, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);
    }
}

module fan_mount_clip_120_bottom_2() {
    difference() {
        union() {
            _frame_clip();

            translate([3, 0, 0])
            cube([53, 3, 20]);

            translate([40.4, 0, 0])
            cube([2, 7, 20]);

            translate([40.4, 0, 0])
            cube([53 - 40.4 + 3, 7, 2]);
        }

        translate([53 - 3, 0, 9.7])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([3 + 53, 0, 20])
        rotate([0, 45, 0])
        cube([8, 10, 8], center=true);
    }
}

module fan_mount_clip_120_bottom_1() {
    mirror([1, 0, 0])
    fan_mount_clip_120_bottom_2();
}

module fan_mount_clip_120_top_1() {
    difference() {
        union() {
            _frame_clip();

            translate([3, 0, 0])
            cube([43, 3, 20]);

            translate([30.4, 0, 0])
            cube([2, 7, 20]);

            translate([30.4, 0, 0])
            cube([43 - 30.4 + 3, 7, 2]);
        }

        translate([43 - 3, 0, 9.7])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([3 + 45, 0, 20])
        rotate([0, 45, 0])
        cube([8, 10, 8], center=true);
    }
}

module fan_mount_clip_120_top_2() {
    mirror([1, 0, 0])
    fan_mount_clip_120_top_1();
}

module fan_mount_clip_140_bottom_2() {
    difference() {
        union() {
            _frame_clip();

            translate([3, 0, 0])
            cube([35, 3, 20]);

            translate([23, 0, 0])
            cube([35 - 23 + 3, 7, 2]);
        }

        translate([35 - 3, 0, 10])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([3 + 35, 0, 20])
        rotate([0, 45, 0])
        cube([8, 10, 8], center=true);
    }
}

module fan_mount_clip_140_bottom_1() {
    mirror([1, 0, 0])
    fan_mount_clip_140_bottom_2();
}

module fan_mount_clip_140_top_1() {
    difference() {
        union() {
            _frame_clip();

            translate([3, 0, 0])
            cube([41.5, 3, 20]);

            translate([28.6, 0, 0])
            cube([2, 7, 20]);

            translate([23, 0, 0])
            cube([41.5 - 23 + 3, 7, 2]);
        }

        translate([41.5 - 3, 0, 10])
        rotate([90, 0, 0])
        cylinder(d=5.3, h=10, center=true, $fn=30);

        translate([3 + 41.5, 0, 20])
        rotate([0, 45, 0])
        cube([8, 10, 8], center=true);
    }
}

module fan_mount_clip_140_top_2() {
    mirror([1, 0, 0])
    fan_mount_clip_140_top_1();
}

module psu_support_clip() {
    union() {
        _frame_clip();

        translate([15, -3.2, 0])
        cube([20, 6.2, 20]);
    }
}

module bolt_knob() {
    difference() {
        union() {
            cylinder(d=15, h=13, $fn=40);

            hull() {
                translate([0, 12, 0])
                cylinder(d=7, h=12, $fn=30);

                translate([0, -12, 0])
                cylinder(d=7, h=12, $fn=30);
            }
        }
        translate([0, 0, 13 - 5.4])
        M6_nut(5.5, cone=false, bridging=true);

        translate([0, 0, 5.2])
        cylinder(d=6.3, h=10, $fn=30);

        cylinder(d=9.5, h=10, center=true, $fn=40);
    }
}

module debug() {
    translate([10, 0, 0])
    mock_mobo_card();

    translate([0, -10, atx_psu_width/2 - stud_h])
    rotate([0, -90, 0])
    mock_atx_psu();

    translate([90, 300, 80 - stud_h + 0.5])
    rotate([90, 0, 0])
    mock_fan_120mm();

    translate([240, 300, 72 - stud_h + 0.5])
    rotate([90, 0, 0])
    mock_fan_140mm();

    translate([77.2, -62, 80 - stud_h + 0.5])
    rotate([90, 0, 0])
    mock_fan_120mm();

    translate([240, -62, 72 - stud_h + 0.3])
    rotate([90, 0, 0])
    mock_fan_140mm();

    translate([-80, -65, -20 - stud_h])
    case_corner_1();

    translate([-80, 305, -20 - stud_h])
    case_corner_2();

    translate([330, -65, -20 - stud_h])
    case_corner_3();

    translate([330, 305, -20 - stud_h])
    case_corner_4();

    translate([125, -65, -20 - stud_h])
    case_middle_1();

    translate([125, 305, -20 - stud_h])
    case_middle_2();

    translate([-80, -65, h - stud_h])
    rotate([180, 0, 0])
    case_top_1();

    translate([-80, 305, h - stud_h])
    rotate([180, 0, 0])
    case_top_2();

    translate([330, -65, h - stud_h])
    rotate([180, 0, 0])
    case_top_3();

    translate([330, 305, h - stud_h])
    rotate([180, 0, 0])
    case_top_4();

    translate([125, -65, h - stud_h - 20])
    rotate([0, 0, 90])
    case_top_middle();

    translate([165, -5, -25.5])
    rotate([90, 0, 0])
    card_plate();

    translate([27.4, 142, -24])
    ssd_attachment();

    translate([177.4, 142, -24])
    ssd_attachment();

    translate([150, 120, -10 - stud_h])
    joint_block_ssd_1();

    translate([26.35, 120, -10 - stud_h])
    joint_block_ssd_2();

//    translate([240, -77, -4])
//    rotate([90, 0, 0])
//    fan_mount_140();
//
//    translate([240, -77, h - 27])
//    rotate([90, 180, 0])
//    fan_mount_140_2();
//
//    translate([90, -77, 6])
//    rotate([90, 0, 0])
//    fan_mount_120();
//
//    translate([90, -77, h - 27])
//    rotate([90, 180, 0])
//    fan_mount_120_2();

    translate([15, -78, h - 2])
    rotate([0, 90, 0])
    fan_mount_clip_120_top_1();

    translate([139.4, -78, h - 2])
    rotate([0, -90, 0])
    fan_mount_clip_120_top_2();

    translate([139.4, -78, -20 - stud_h - 2])
    rotate([0, -90, 0])
    fan_mount_clip_120_bottom_2();

    translate([15, -78, -20 - stud_h - 2])
    rotate([0, 90, 0])
    fan_mount_clip_120_bottom_1();

    translate([167.8, -78, -20 - stud_h - 2])
    rotate([0, 90, 0])
    fan_mount_clip_140_bottom_1();

    translate([312.2, -78, -20 - stud_h - 2])
    rotate([0, -90, 0])
    fan_mount_clip_140_bottom_2();

    translate([167.8, -78, h - 2])
    rotate([0, 90, 0])
    fan_mount_clip_140_top_1();

    translate([312.2, -78, h - 2])
    rotate([0, -90, 0])
    fan_mount_clip_140_top_2();

    translate([3.2, 101.5, -20 - 6.1])
    rotate([0, -90, -90])
    psu_support_clip();
}

module foot_clip() {
    union() {
        _frame_clip();

        difference() {
            hull() {
                translate([-2, 20/2 + 3, 20/2])
                cube([7, 20, 20], center=true);

                translate([20.5/2 + 2, -7/2 + 1, 20/2])
                cube([20.5, 7, 20], center=true);
            }
            translate([22/2 + 2, 22/2 + 2, 0])
            cube([22, 22, 60], center=true);
        }
    }
}