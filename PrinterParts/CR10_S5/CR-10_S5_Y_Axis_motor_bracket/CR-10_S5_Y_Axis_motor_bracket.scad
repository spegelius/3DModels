include <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../Dollo/NEW_long_ties/mockups.scad>;
use <../../../Bearings/pulleys.scad>;


//debug_y_motor_bracket();
//debug_y_motor_bracket2();

//bracket_front();
//bracket_back();

//bracket_v2_front();
bracket_v2_back();
//bracket_v2_pulley();
//bracket_v2_pulley_spacer();


module debug_y_motor_bracket() {

    // 2020 beam
    %translate([0, 340, 10])
    cube([200, 20, 20], center=true);

    color("silver")
    translate([-31, 340 + 20/2 + 27, 36])
    translate([0, 0, -motor_side_length/2])
    rotate([0, 0, -90])
    mock_stepper_motor();

    color("silver")
    translate([0, 340 + 20/2 + 27, 36])
    rotate([0, 90, 0])
    cylinder(d=14, h=10, center=true, $fn=40);

    translate([0, 228, 36 + 14/2 - 1.4/2])
    cube([10, 300, 1.4], center=true);

    translate([0, 228, 36 - 14/2 +  1.4/2])
    cube([10, 300, 1.4], center=true);

    translate([-31 + 20, 340 + 20/2 + 27, 36])
    rotate([90, 0, 90])
    bracket_front();

    translate([-31 - 20, 340 + 20/2 + 27, 36])
    rotate([90, 0, -90])
    bracket_back();
}

module debug_y_motor_bracket2() {

    // 2020 beam
    %translate([0, 340, 10])
    cube([200, 20, 20], center=true);

    color("silver")
    translate([-31, 340 + 20/2 + 27, 27.5])
    translate([0, -motor_side_length/2, 0])
    rotate([0, -90, -90])
    mock_stepper_motor();

    color("silver")
    translate([0, 340 + 20/2 + 27, 27.5])
    rotate([0, 90, 0])
    cylinder(d=14, h=10, center=true, $fn=40);

    translate([-6.9, 340 + 20/2, 35])
    rotate([0, 90, 0])
    bracket_v2_pulley();

    translate([0, 228, 36 + 14/2 - 1.4/2])
    cube([10, 300, 1.4], center=true);

    translate([0, 228, 36 - 14/2 +  1.4/2 - 8.5])
    cube([10, 300, 1.4], center=true);

    translate([9, 340 + 7/2, -7])
    rotate([0, 0, 180])
    bracket_v2_front();

    translate([-71, 340 + 7/2, -7])
    rotate([0, 0, 180])
    bracket_v2_back();
}

module _mount_hole() {
    cylinder(
        d=5.3, h=20,
        center=true, $fn=30
    );

    translate([0, 0, 3])
    cylinder(d1=11, d2=18, h=5, $fn=30);

    translate([0, 0, 7.99])
    cylinder(d1=18, d2=4, h=20, $fn=30);
}

module _bracket_form(h, front=true) {
    union() {
        translate([0, 0, 10/2])
        chamfered_cube_side(
            motor_side_length - 0.3,
            motor_side_length - 0.3,
            10, 4, center=true
        );

        if (front) {
            translate([
                28/2 - 27 - 20,
                -26 + 20/2 + 5/2, h/2
            ])
            cube([28, 5, h], center=true);
        }

        #translate([8/2 - 27, -26 + 21/2 - 20/2, h/2])
        cube([8, 21, h], center=true);

        hull() {
            if (front) {
                translate([
                    28/2 - 27 - 20,
                    -26 + 20/2 - 1/2 + 5,
                    10/2
                ])
                cube([28, 1, 10], center=true);
            } else {
                translate([
                    8/2 - 27,
                    -26 + 20/2 - 1/2 + 1,
                    10/2
                ])
                cube([8, 1, 10], center=true);
            }

            translate([
                -(motor_side_length - 0.3)/2 + 0.649,
                15.65, 10/2
            ])
            cube([1.3, 2.7, 10], center=true);
        }

        hull() {
            translate([
                -1/2 - 27 + 8, -26 + 18/2 - 20/2,
                10/2
            ])
            cube([1, 18, 10], center=true);

            translate([
                (motor_side_length - 0.3)/2 - 1/2,
                -(motor_side_length - 0.3)/2 + 15/2 - 7,
                10/2
            ])
            cube([1, 15, 10], center=true);
        }

        hull() {
            translate([
                -1/2 - 27 + 8, -26 + 5/2 - 20/2,
                h/2
            ])
            cube([1, 5, h], center=true);

            translate([
                (motor_side_length - 0.3)/2 - 1/2,
                -(motor_side_length - 0.3)/2 + 1/2 - 7,
                10/2
            ])
            cube([1, 5, 10], center=true);
        }
    }
}

module bracket_front() {
    h = 60;

    // 2020 beam
    %translate([-20/2 - 27, -26])
    cube([20, 20, 100], center=true);

    difference() {

        _bracket_form(h);

        for(i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([
                motor_bolt_hole_distance/2,
                motor_bolt_hole_distance/2, 3
            ])
            cylinder(d=7, h=10, $fn=20);
        }

        motor_plate_holes(10);

        translate([-30, 0, 20/2 + 3])
        cube([50, 21.99, 20], center=true);

        translate([-27, -26, 20])
        rotate([0, 90, 0])
        _mount_hole();

        translate([-27, -26, h - 10])
        rotate([0, 90, 0])
        _mount_hole();

        translate([-20/2 - 27, -26 + 20/2, 35])
        rotate([-90, 0, 0])
        _mount_hole();
    }
}

module bracket_back() {
    h = 60;

    difference() {
        mirror([1, 0, 0])
        _bracket_form(h, front=false);

        translate([27, -26, 20])
        rotate([0, -90, 0])
        _mount_hole();

        translate([27, -26, h - 10])
        rotate([0, -90, 0])
        _mount_hole();

        motor_plate_holes(10);

        for(i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([
                motor_bolt_hole_distance/2,
                motor_bolt_hole_distance/2, 3
            ])
            cylinder(d=7, h=10, $fn=20);
        }

        translate([20/2 + 27, -26 + 20/2, 35])
        rotate([-90, 0, 0])
        _mount_hole();
    }
}

module _bracker_v2_form() {
    //h = 60;

    // 2020 beam
    %translate([0, 7/2, 20/2 + 7])
    cube([100, 20, 20], center=true);

    difference() {
        union() {
            translate([0, 0, 27/2])
            cube([40, 27, 27], center=true);

            // motor plate
            hull() {
                translate([15, -33.5, 34.5])
                rotate([0, 90, 0])
                chamfered_cube_side(
                    motor_side_length - 0.3,
                    motor_side_length - 0.3,
                    10, 4, center=true
                );

                translate([15, -21, 1/2])
                cube([10, 40, 1], center=true);
            }

            hull() {
                translate([0, -27/2 + 1/2, 7/2])
                cube([40, 1, 7], center=true);

                translate([15, -21, 7/2])
                cube([10, 40, 7], center=true);
            }
        }

        // 2020 profile cut
        translate([0, 7, 20/2 + 7])
        cube([100, 27.2, 20], center=true);

        // motor screw holes
        translate([20, -33.5, 34.5])
        rotate([0, -90, 0])
        union() {
            motor_plate_holes(10);

            for(i = [0:3]) {
                rotate([0, 0, i * 90])
                translate([
                    motor_bolt_hole_distance/2,
                    motor_bolt_hole_distance/2, 4
                ])
                cylinder(d=8, h=10, $fn=20);
            }
        }

        // mount holes
        translate([0.7, -20/2 + 7/2, 17])
        rotate([90, 0, 0])
        cylinder(
            d=5.3, h=20,
            center=true, $fn=30
        );

        translate([0.7, -20/2 - 3 + 7/2, 17])
        rotate([90, 0, 0])
        cylinder(
            d1=10, d2=16.5, h=12,
            center=false, $fn=30
        );

        translate([0, 7/2, 7])
        rotate([180, 0, 0])
        difference() {
            _mount_hole();

            translate([0, 0, 2.8])
            cylinder(d=10, h=0.2);
        }
    }
}

module bracket_v2_front() {

    difference() {
        union() {
            _bracker_v2_form();

            // bearing mounts
            hull() {
                translate([16.4, -6.5, 42])
                rotate([0, 90, 0])
                cylinder(d=12, h=10, $fn=30);

                translate([16.4 + 10/2, -9.1, 42])
                cube([10, 5, 12], center=true);

                translate([16.4 + 3.6/2, -9.1, 35])
                cube([3.6, 5, 15], center=true);
            }

            translate([16.4 + 3.6/2, -9.1, 33])
            cube([3.6, 5, 15], center=true);

            hull() {
                translate([16.4 - 15.2 - 10, -6.5, 42])
                rotate([0, 90, 0])
                cylinder(d=14, h=10, $fn=30);

                translate([
                    16.4 - 15.2 - 21.2/2,
                    -27/2 - 14/2 + 7, 27 + 1/2
                ])
                cube([21.2, 14, 1], center=true);
            }

            hull() {
                translate([
                    16.4 - 26.4 - 10/2,
                    -27/2 + 7/2, 14 + 1/2
                ])
                cube([10, 7, 1], center=true);

                translate([
                    16.4 - 15.2 - 21.2/2,
                    -27/2 - 14/2 + 7, 27 + 1/2
                ])
                cube([21.2, 14, 1], center=true);
            }
        }

        // bearing mount cut
        translate([40/2 + 10/2, -21.6, 0])
        cube([10, 20, 120], center=true);

        // motor screw hole
        translate([20, -33.5, 34.5])
        rotate([0, -90, 0])
        translate([
            motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, 1.4
        ])
        cylinder(d2=7.5, d1=3, h=2.25, $fn=40);

        // belt cut
        hull() {
            translate([8.8, -6, 48])
            cube([15.2, 1, 42], center=true);

            translate([8.8, -29, 36.5])
            cube([15.2, 1, 25], center=true);
        }

        // idler bearing screw holes
        translate([0, -6.5, 42])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=100, center=true, $fn=30);

        translate([27, -6.5, 42])
        rotate([0, -90, 0])
        M3_nut_tapering(6, cone=false);

        translate([-11, -6.5, 42])
        rotate([0, -90, 0])
        cylinder(d1=8, d2=12, h=16, center=true, $fn=30);
    }
}

module bracket_v2_back() {
    mirror([1, 0, 0])
    difference() {
        _bracker_v2_form();

        // motor screw holes
        translate([23, -33.5, 34.5])
        rotate([0, -90, 0])
        translate([
            motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, 1.4
        ])
        cylinder(d=7.5, h=15, $fn=40);

        translate([23, -33.5, 34.5])
        rotate([0, -90, 0])
        translate([
            -motor_bolt_hole_distance/2,
            -motor_bolt_hole_distance/2, 1.4
        ])
        cylinder(d=7.5, h=15, $fn=40);
    }
}

module bracket_v2_pulley() {
    623zz_idler_pulley_tooth();
}

module bracket_v2_pulley_spacer() {
    tube(9.8, (13.8 - 12)/2, 1, $fn=30);
}