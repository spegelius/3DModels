use <../Dollo/NEW_long_ties/include.scad>;

use <Lepy7.scad>;
include <common.scad>;


//debug();
//debug2();
//debug_front_clip();
//debug_drill_jig();


//lepy7_front_grill();
//lepy7_front_grill_drill_jig();

lepy7_front_grill2();
//lepy7_front_grill2_1();
//lepy7_front_grill2_2();

//test_front_clip();
//lepy7_front_grill_clip();
//lepy7_front_bottom_grill_clip();

//lepy7_2_front_buttons_frame();

module debug() {
    intersection() {
        union() {
            mock_case_front();

            translate([0, -27, -20])
            rotate([-90, 0, 0])
            lepy7_front_grill();

            translate([-60.5, -5, 181.1])
            rotate([180, 90, 0])
            lepy7_front_grill_clip();

            translate([-60.5, -5, -51.1])
            rotate([180, 90, 0])
            lepy7_front_grill_clip();

            translate([60.5, -5, 181.1])
            rotate([180, -90, 0])
            lepy7_front_grill_clip();

            translate([60.5, -5, -51.1])
            rotate([180, -90, 0])
            lepy7_front_grill_clip();

            translate([4.5, -5, -51.1 - 174.9])
            rotate([180, 90, 0])
            lepy7_front_grill_clip();
        }

        translate([60.5, 0, 0])
        cube([20, 100, 700], center=true);
    }
}

module debug2() {
    intersection() {
        union() {
            mock_case_front2();

            translate([0, -28, -23])
            rotate([-90, 0, 0])
            lepy7_front_grill2();

            translate([-75.5, -5, 202])
            rotate([180, 90, 0])
            lepy7_front_grill_clip();

            translate([-75.5, -5, -92])
            rotate([180, 90, 0])
            lepy7_front_grill_clip();

            translate([75.5, -5, 202])
            rotate([180, -90, 0])
            lepy7_front_grill_clip();

            translate([75.5, -5, -92])
            rotate([180, -90, 0])
            lepy7_front_grill_clip();

            translate([8.5, 0, -51 - 202])
            rotate([180, 90, 0])
            lepy7_front_bottom_grill_clip();
        }

        translate([85/2, 0, 00])
        cube([85, 100, 1300], center=true);
    }
}

module debug_front_clip() {
   lepy7_front_grill_clip();

   #lepy7_front_grill_clip_coutout();
}

module debug_drill_jig() {
    mock_case_front();

    translate([0, 0, -51.1])
    rotate([90, 0, 0])
    lepy7_front_grill_drill_jig();
}

module lepy7_front_grill() {
    difference() {
        union() {
            translate([0, 0, 27/2])
            cube([143, 440, 27], center=true);

            translate([0, -168, 27/2])
            cube([149, 43, 27], center=true);
        }

        // inner cut
        #difference() {
            hull() {
                translate([0, 0, 29/2 + 2])
                cube([122, 420, 29], center=true);

                translate([0, 0, 29])
                cube([135, 436, 1], center=true);

            }

            translate([0, 420/2, 0])
            cube([13, 20, 70], center=true);

            translate([-122/2 - 20/2, -201.1, 0])
            cube([20, 13, 70], center=true);

            translate([122/2 + 20/2, -201.1, 0])
            cube([20, 13, 70], center=true);

            translate([-122/2 - 20/2, 31.1, 0])
            cube([20, 13, 70], center=true);

            translate([122/2 + 20/2, 31.1, 0])
            cube([20, 13, 70], center=true);

        }
        
        // chamfers
        difference() {
            union() {
                translate([143/2 + 8, 0, 27])
                rotate([0, -19, 0])
                cube([20, 500, 20], center=true);

                translate([-143/2 - 8, 0, 27])
                rotate([0, 19, 0])
                cube([20, 500, 20], center=true);
            }

            translate([0, -168, 27/2])
            cube([149, 43, 27], center=true);
        }

        translate([143/2 + 8, 0, 8])
        rotate([0, 19, 0])
        cube([20, 500, 40], center=true);

        translate([-143/2 - 8, 0, 8])
        rotate([0, -19, 0])
        cube([20, 500, 40], center=true);

        // top & bottom chamfers
        translate([0, 440/2 + 3, 0])
        rotate([-22, 0, 0])
        cube([200, 20, 40], center=true);

        translate([0, -440/2 - 3, 0])
        rotate([22, 0, 0])
        cube([200, 20, 40], center=true);

        // fan screw holes
        translate([0, -144, 0])
        fan_mount_holes(120);

        translate([0, -20, 0])
        fan_mount_holes(120);

        translate([0, 104, 0])
        fan_mount_holes(120);

        // front grill cut
        intersection() {
            hexagon_form(
                -71.5, -301, 50, 12, 0
            );

            intersection() {
                union() {
                    translate([0, -144, 0])
                    cylinder(d=128, h=100, center=true, $fn=80);

                    translate([0, -20, 0])
                    cylinder(d=128, h=100, center=true, $fn=80);

                    translate([0, 104, 0])
                    cylinder(d=128, h=100, center=true, $fn=80);
                }
                difference() {
                    translate([0, -20, 0])
                    cube([121, 370, 100], center=true);

                    translate([0, -82, 0])
                    cube([200, 4, 100], center=true);
                
                    translate([0, 42, 0])
                    cube([200, 4, 100], center=true);
                }
            }
        }

        // clip cuts
        translate([-65, -201.1, 27 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([-65, 31.1, 27 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([65, -201.1, 27 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([65, 31.1, 27 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([0, 206, 27 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

    }

    %translate([0, -144, 25/2 + 2])
    mock_fan_120mm();

    %translate([0, -20, 25/2 + 2])
    mock_fan_120mm();

    %translate([0, 104, 25/2 + 2])
    mock_fan_120mm();
}

module lepy7_front_grill_clip() {
    difference() {
        translate([0, 0, 9/2])
        cube([12, 10, 9], center=true);

        hull() {
            cube([8.5, 6, 30], center=true);

            translate([0, 1, 0])
            cube([5, 6, 30], center=true);
        }

        translate([0, 4, 0])
        cube([7.1, 10, 30], center=true);

        hull() {
            translate([0, 10, 0])
            cube([14.8, 1, 30], center=true);

            cube([1, 1.3, 30], center=true);
        }

        translate([0, 0, 9/2])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=20);

        translate([0, -3.7, 9/2])
        rotate([90, 0, 0])
        cylinder(d1=6.6, d2=3.3, h=1.9, center=true, $fn=30);
    }
}

module lepy7_front_bottom_grill_clip() {
    difference() {
        union() {
            translate([0, 10/2, 4])
            lepy7_front_grill_clip();

            translate([21/2 - 6, 2/2, 17/2])
            //cube([25, 2, 17], center=true);
            rotate([90, 0, 0])
            chamfered_cube_side(
                21, 17, 2, 2, center=true
            );
        }

        translate([11, 0, 4])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=10, center=true, $fn=20);

        translate([11, 0, 17 - 4])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=10, center=true, $fn=20);

        translate([11, 1.3, 4])
        rotate([90, 0, 0])
        cylinder(d1=6.6, d2=3.3, h=1.9, center=true, $fn=30);

        translate([11, 1.3, 17 - 4])
        rotate([90, 0, 0])
        cylinder(d1=6.6, d2=3.3, h=1.9, center=true, $fn=30);
    }
    // supports
    translate([-4.9, 8/2 + 2.3, 3.8/2])
    cube([2.2, 8, 3.8], center=true);

    translate([4.9, 8/2 + 2.3, 3.8/2])
    cube([2.2, 8, 3.8], center=true);
}

module lepy7_front_grill_clip_coutout() {
    difference() {
        intersection() {
            cube([14, 11, 14], center=true);

            union() {
                translate([0, -11/2, 0])
                cube([14, 11, 14], center=true);

                cube([14, 13, 9.7], center=true);

            }
        }
           
        union() {
            translate([0, 6.9, 0])
            cube([6.8, 10, 30], center=true);

            hull() {
                translate([0, -10/2 + 6.3, 0])
                cube([2, 7, 30], center=true);

                translate([0, 2.45, 0])
                cube([8.2, 1.2, 30], center=true);
            }
        }
    }
}

module test_front_clip() {

    difference() {
        translate([1.1, 0, 14/2])
        cube([12, 20, 14], center=true);

        translate([0, 0, 14 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();
    }

    translate([17, 0, 0])
    lepy7_front_grill_clip();
}

// for the bottom hole on the front of the case
module lepy7_front_grill_drill_jig() {
    difference() {
        union() {
            hull() {
                translate([-130/2, 0, 0])
                cylinder(d=10, h=3, $fn=30);

                translate([130/2, 0, 0])
                cylinder(d=10, h=3, $fn=30);
            }

            hull() {
                translate([-130/2, 0, 0])
                cylinder(d=10, h=3, $fn=30);

                translate([0, -173.9, 0])
                cylinder(d=10, h=3, $fn=30);
            }

            hull() {
                translate([130/2, 0, 0])
                cylinder(d=10, h=3, $fn=30);

                translate([0, -173.9, 0])
                cylinder(d=10, h=3, $fn=30);
            }
        }

        translate([-130/2, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([130/2, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([0, -174.9, 0])
        cylinder(d=2, h=20, center=true, $fn=30);
    }
}

module lepy7_front_grill2() {
    difference() {
        union() {
            translate([0, 0, 28/2])
            cube([176.5, 480, 28], center=true);
        }

        // inner cut
        difference() {
            union() {
                hull() {
                    translate([0, 0, 30/2 + 2])
                    cube([156, 461, 30], center=true);

                    translate([0, 0, 30])
                    cube([172.5, 476, 1], center=true);
                }

                intersection() {
                    union() {
                        translate([0, -159, 1.6])
                        cylinder(d=148, h=100, $fn=80);

                        translate([0, -15, 1.6])
                        cylinder(d=148, h=100, $fn=80);

                        translate([0, 129, 1.6])
                        cylinder(d=148, h=100, $fn=80);
                    }
                    translate([0, -14, 0])
                    cube([144, 432, 10], center=true);
                }
            }

            translate([0, 470/2, 0])
            cube([13, 20, 70], center=true);

            translate([-151/2 - 20/2, -225, 0])
            cube([20, 13, 70], center=true);

            translate([151/2 + 20/2, -225, 0])
            cube([20, 13, 70], center=true);

            translate([-151/2 - 20/2, 69, 0])
            cube([20, 13, 70], center=true);

            translate([151/2 + 20/2, 69, 0])
            cube([20, 13, 70], center=true);

            // fan screw hole bumps
            translate([0, -159, 0])
            fan_mount_holes(140, h_d=8, h=5.2);

            translate([0, -15, 0])
            fan_mount_holes(140, h_d=8, h=5.2);

            translate([0, 129, 0])
            fan_mount_holes(140, h_d=8, h=5.2);

        }
        
        // chamfers
        translate([165/2 + 11, 0, 8])
        rotate([0, 19, 0])
        cube([20, 500, 40], center=true);

        translate([-165/2 - 11, 0, 8])
        rotate([0, -19, 0])
        cube([20, 500, 40], center=true);

        // top & bottom chamfers
        translate([0, 480/2 + 3, 0])
        rotate([-22, 0, 0])
        cube([200, 20, 40], center=true);

        translate([0, -480/2 - 3, 0])
        rotate([22, 0, 0])
        cube([200, 20, 40], center=true);

        // fan screw holes
        translate([0, -159, 0])
        fan_mount_holes(140);

        translate([0, -15, 0])
        fan_mount_holes(140);

        translate([0, 129, 0])
        fan_mount_holes(140);

        // front grill cut
        intersection() {
            intersection() {
                union() {
                    translate([0, -159, 0])
                    cylinder(
                        d=148, h=100, center=true, $fn=80
                    );

                    translate([0, -15, 0])
                    cylinder(
                        d=148, h=100, center=true, $fn=80
                    );

                    translate([0, 129, 0])
                    cylinder(
                        d=148, h=100, center=true, $fn=80
                    );
                }
                difference() {
                    translate([0, -14, 0])
                    cube([141, 430, 100], center=true);

                    translate([0, -87, 0])
                    cube([200, 4, 100], center=true);
                
                    translate([0, 57, 0])
                    cube([200, 4, 100], center=true);
                }
            }

            hexagon_form(
                -71.5, -301, 50, 12, 0, h=5
            );
        }

        // clip cuts
        translate([-80.25, -225, 28 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([-80.25, 69, 28 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([80.25, -225, 28 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([80.25, 69, 28 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([0, 230, 28 - 10/2])
        rotate([-90, 0, 90])
        lepy7_front_grill_clip_coutout();

        translate([0, 230, 28])
        cube([18, 30, 4.4], center=true);

    }

    %translate([0, -159, 25/2 + 2])
    mock_fan_140mm();

    %translate([0, -15, 25/2 + 2])
    mock_fan_140mm();

    %translate([0, 129, 25/2 + 2])
    mock_fan_140mm();
}

module lepy7_front_grill2_1() {
    intersection() {
        lepy7_front_grill2();

        translate([0, 0, 1/2])
        cube([400, 600, 1], center=true);
    }
}

module lepy7_front_grill2_2() {
    intersection() {
        lepy7_front_grill2();

        translate([0, 0, 1 + 30/2])
        cube([400, 600, 30], center=true);
    }
}

module lepy7_2_front_buttons_frame() {
    difference() {
        union() {
            translate([0, 0, 17/2])
            cube([177, 70, 17], center=true);

            translate([0, 70/2 - 13/2, 17/2])
            cube([177, 13, 17], center=true);
        }

        hull() {
            translate([-160/2 - 4.3, -70/2 + 26, 0])
            cylinder(d=4.3, h=20, center=true, $fn=30);

            translate([-160/2 - 4.3, -70/2 + 29, 0])
            cylinder(d=4.3, h=20, center=true, $fn=30);
        }

        hull() {
            translate([160/2 + 4.3, -70/2 + 26, 0])
            cylinder(d=4.3, h=20, center=true, $fn=30);

            translate([160/2 + 4.3, -70/2 + 29, 0])
            cylinder(d=4.3, h=20, center=true, $fn=30);
        }

        translate([0, -70/2 + 57 - 4/2, 30/2 + 3])
        cube([160, 4, 30], center=true);

        translate([0, 50, 0])
        rotate([40, 0, 0])
        cube([200, 20, 80], center=true);

        translate([0, -8, 30/2 + 16])
        cube([200, 60, 30], center=true);

        translate([0, -70/2 + 19/2 + 18, 30/2 + 6.4])
        cube([200, 19, 30], center=true);

        translate([0, -8, 30/2 + 6.4])
        cube([160, 60, 30], center=true);

        translate([0, -13, 0])
        cube([158, 60, 30], center=true);

    }
}