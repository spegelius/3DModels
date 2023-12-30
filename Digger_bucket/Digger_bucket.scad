use <../Dollo/NEW_long_ties/include.scad>;

//_original_bucket();
//debug_rotating_bucket();
//debug_rotating_bucket_dc();
//test_rotating();

//rotating_bucket();
//rotating_bucket_dc_yellow();
rotating_bucket_dc_black();



module test_rotating() {
    union() {
        intersection() {
            rotating_bucket();

            translate([0, -51, 40/2])
            cube([40, 30, 40], center=true);
            
        }
        translate([0, -75, 26/2])
        cube([20, 20, 26], center=true);

        translate([0, -26.2, 26/2])
        cube([20, 20, 26], center=true);

    }
}

module _mount_axle() {
    // mount axle
    translate([0, 0, 25/2])
    rotate([0, 90, 0])
    cylinder(d=14, h=24, center=true);
}

module _arm() {
    // arm
    difference() {
        hull() {
            translate([0, 0, 25/2])
            rotate([0, 90, 0])
            cylinder(d=25, h=20, center=true);

            translate([0, -90, 25/2 + 1])
            cube([20, 1, 27], center=true);
        }

        translate([-10/2 - 11/2, 0, 25/2])
        rotate([-7, 0, 0])
        cube([10, 35, 50], center=true);

        translate([10/2 + 11/2, 0, 25/2])
        rotate([-7, 0, 0])
        cube([10, 35, 50], center=true);
        
        translate([-6, -44, 25])
        rotate([-1.2, 0, 0])
        cube([2, 50, 3], center=true);

        translate([6, -44, 25])
        rotate([-1.2, 0, 0])
        cube([2, 50, 3], center=true);

        translate([-6, -53, 0])
        cube([2, 60, 3], center=true);

        translate([6, -53, 0])
        cube([2, 60, 3], center=true);

        translate([2, 0, 0])
        difference() {
            hull() {
                translate([0, 0, 25/2])
                rotate([0, 90, 0])
                cylinder(d=27, h=2, center=true);

                translate([0, -90, 25/2 + 1])
                cube([2, 1, 29], center=true);
            }

            hull() {
                translate([0, 0, 25/2])
                rotate([0, 90, 0])
                cylinder(d=21, h=2, center=true);

                translate([0, -90, 25/2 + 1])
                cube([2, 1, 23], center=true);
            }
        }

        translate([-2, 0, 0])
        difference() {
            hull() {
                translate([0, 0, 25/2])
                rotate([0, 90, 0])
                cylinder(d=27, h=2, center=true);

                translate([0, -90, 25/2 + 1])
                cube([2, 1, 29], center=true);
            }

            hull() {
                translate([0, 0, 25/2])
                rotate([0, 90, 0])
                cylinder(d=21, h=2, center=true);

                translate([0, -90, 25/2 + 1])
                cube([2, 1, 23], center=true);
            }
        }
    }
}

module _bucket() {
    union() {
        hull() {
            translate([0, -89, 40/2])
            rotate([0, 90, 0])
            cylinder(d=43, h=62, center=true, $fn=40);

            translate([0, -68, 26])
            cube([64, 1, 1], center=true);

            translate([0, -127.2, 38])
            cube([68, 1, 1], center=true);
        }

        translate([-23, 0, 0])
        _claw();

        translate([-8, 0, 0])
        _claw();

        translate([8, 0, 0])
        _claw();

        translate([23, 0, 0])
        _claw();
    }
}

module _handles() {

    module _handle_end() {
        difference() {
            union() {
                rotate([0, 0, -45])
                hull() {
                    translate([0, 30/2 - 8/2, 0])
                    cylinder(d=8, h=7, center=true, $fn=40);

                    translate([0, -30/2 + 8/2, 0])
                    cylinder(d=8, h=7, center=true, $fn=40);
                }

                rotate([0, 0, 45])
                hull() {
                    translate([0, 30/2 - 8/2, 0])
                    cylinder(d=8, h=7, center=true, $fn=40);

                    translate([0, -30/2 + 8/2, 0])
                    cylinder(d=8, h=7, center=true, $fn=40);
                }
                cylinder(d=20, h=7, center=true, $fn=40);
            }

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([12.7, 0, 0])
                cylinder(d=10, h=20, center=true, $fn=40);
            }
        }
    }

    union() {
        translate([0, -27, 17])
        rotate([0, 90, 0])
        cylinder(d=9, h=60, center=true, $fn=40);

        translate([60/2, -27, 17])
        rotate([0, 90, 0])
        _handle_end();

        translate([-60/2, -27, 17])
        rotate([0, 90, 0])
        _handle_end();
    }
}

module _arm_removed() {
    translate([0, 0, 25/2])
    rotate([0, 90, 0])
    cylinder(d=4, h=34, center=true, $fn=30);

    translate([8, 0, 25/2])
    rotate([0, 90, 0])
    cylinder(d1=4, d2=12, h=5, $fn=30);

    translate([-8, 0, 25/2])
    rotate([0, -90, 0])
    cylinder(d1=4, d2=12, h=5, $fn=30);

    translate([0, -27, 17])
    rotate([0, 90, 0])
    cylinder(d=1, h=85, center=true, $fn=40);

    translate([30, -27, 17])
    rotate([0, 90, 0])
    cylinder(d1=6, d2=14, h=5, $fn=30);

    translate([-30, -27, 17])
    rotate([0, -90, 0])
    cylinder(d1=6, d2=14, h=5, $fn=30);

    translate([0, -35, 27/2])
    rotate([90, 0, 0])
    cylinder(d=4, h=70, center=true, $fn=40);


}

module _bucket_removed() {
    difference() {
        union() {
            hull() {
                translate([0, -90, 40/2])
                rotate([0, 90, 0])
                cylinder(d=37, h=58, center=true);

                translate([0, -70, 26])
                cube([60, 1, 1], center=true);

                translate([0, -123, 35.5])
                cube([64, 1, 1], center=true);
            }

            hull() {
                translate([0, -68, 26.5 + 20/2])
                cube([69, 1, 20], center=true);

                translate([0, -129, 36.3 + 20/2])
                cube([69, 1, 20], center=true);
            }

            translate([0, 0, -10/2])
            cube([100, 300, 10], center=true);
        }

        translate([-23, 0, 0])
        _claw();

        translate([-8, 0, 0])
        _claw();

        translate([8, 0, 0])
        _claw();

        translate([23, 0, 0])
        _claw();
    }
}

module _claw() {
    translate([0, -121.4, 31])
    rotate([-54.2, 0, 0])
    hull() {
        translate([0, 0, -1])
        cube([7, 18, 1], center=true);

        translate([0, 0, 1])
        cube([7, 15, 1], center=true);
    }
}

module _original_bucket() {
    difference() {
        union() {
            _mount_axle();
            _arm();
            _bucket();
            _handles();
        }
        _arm_removed();
        _bucket_removed();
    }
}

module _rotating_arm_1() {
    difference() {
        union() {
            difference() {
                _arm();

                translate([0, -60/2 - 62, 0])
                cube([50, 60, 80], center=true);
            }

            translate([0, -55, 27/2])
            rotate([90, 0, 0])
            chamfered_cylinder(
                34, 18, 1.7, center=true, $fn=40
            );
        }

        // axle cuts
        translate([0, -55, 27/2])
        rotate([90, 0, 0])
        cylinder(d=24, h=10, center=true, $fn=40);

        translate([0, -59, 27/2])
        rotate([90, 0, 0])
        chamfered_cylinder(
            16, 26, 4, center=true, $fn=40
        );

        translate([0, -55, 0])
        cube([3, 7, 10], center=true);

        // axle bottom supports
        translate([0, -55, 27/2 - 23/2 + 0.2/2])
        cube([0.5, 11, 0.2], center=true);

        translate([3.4, -55, 27/2 - 23/2 + 0.2/2 + 0.6])
        cube([0.5, 11, 0.2], center=true);

        translate([-3.4, -55, 27/2 - 23/2 + 0.2/2 + 0.6])
        cube([0.5, 11, 0.2], center=true);
    }
}

module _rotating_arm_2() {
    union() {
        difference() {
            _arm();

            translate([0, 100/2 - 64.25, 0])
            cube([50, 100, 80], center=true);

            translate([-10.5, -63.8, -0.1])
            rotate([45, 0, 45])
            cube([3, 3, 3], center=true);

            translate([10.5, -63.8, -0.1])
            rotate([45, 0, -45])
            cube([3, 3, 3], center=true);

            translate([-10.5, -63.8, 26.5])
            rotate([45, 0, 45])
            cube([3, 3, 3], center=true);

            translate([10.5, -63.8, 26.5])
            rotate([45, 0, -45])
            cube([3, 3, 3], center=true);

        }

        translate([0, -55, 27/2])
        rotate([90, 0, 0])
        difference() {
            chamfered_cylinder(
                23, 9.5, 1, center=true, $fn=40
            );

            cylinder(d=4, h=30, center=true, $fn=30);
        }

        translate([0, -58, 27/2])
        rotate([90, 0, 0])
        difference() {
            chamfered_cylinder(
                15, 23, 3.4, center=true, $fn=40
            );

            cylinder(d=4, h=100, center=true, $fn=30);
        }

        // axle bottom supports
        translate([0, -55, 27/2 - 23/2 + 0.2/2])
        cube([0.5, 11, 0.2], center=true);

        translate([3.4, -55, 27/2 - 23/2 + 0.2/2 + 0.6])
        cube([0.5, 11, 0.2], center=true);

        translate([-3.4, -55, 27/2 - 23/2 + 0.2/2 + 0.6])
        cube([0.5, 11, 0.2], center=true);

    }
}

module debug_rotating_bucket() {
    intersection() {
        rotating_bucket();

        translate([-100/2, 0, 0])
        cube([100, 300, 100], center=true);
    }
}

module debug_rotating_bucket_dc() {
    color("yellow")
    render()
    intersection() {
        rotating_bucket_dc_yellow();

        translate([-100/2, 0, 0])
        cube([100, 300, 100], center=true);
    }

    color("black")
    render()
    intersection() {
        rotating_bucket_dc_black();

        translate([-100/2, 0, 0])
        cube([100, 300, 100], center=true);
    }
}

module rotating_bucket() {
    difference() {
        union() {
            _mount_axle();
            _rotating_arm_1();
            _rotating_arm_2();
            _bucket();
            _handles();
        }
        _arm_removed();
        _bucket_removed();
    }
}

module rotating_bucket_dc_yellow() {
    difference() {
        union() {
            _mount_axle();
            _rotating_arm_1();
        }
        _handles();
        _arm_removed();
        _bucket_removed();
    }
}

module rotating_bucket_dc_black() {
    difference() {
        union() {
            _rotating_arm_2();
            _bucket();
            _handles();
        }
        _arm_removed();
        _bucket_removed();
    }
}