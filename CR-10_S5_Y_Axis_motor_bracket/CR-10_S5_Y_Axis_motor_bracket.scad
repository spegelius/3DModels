include <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;



//debug();
bracket_front();
//bracket_back();


module debug() {

    // 2020 beam
    %cube([200, 20, 20], center=true);

    color("silver")
    translate([0, -20/2 - 27, 26])
    translate([0, 0, -motor_side_length/2])
    rotate([0, 0, 90])
    mock_stepper_motor();

    translate([-20, -20/2 - 27, 26])
    rotate([90, 0, -90])
    bracket_front();

    translate([20, -20/2 - 27, 26])
    rotate([90, 0, 90])
    bracket_back();
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

        translate([8/2 - 27, -26 + 21/2 - 20/2, h/2])
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