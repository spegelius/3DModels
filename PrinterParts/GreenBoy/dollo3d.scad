include <../../Dollo/NEW_long_ties/include.scad>;

use <../../Dollo/NEW_long_ties/motor_mount_small.scad>;
use <../../Dollo/NEW_long_ties/long_bow_tie.scad>;

use <mockups.scad>;


//debug_dollo3d_mount();

// TinkerCad stuff
dollo3d_mount();
//dollo3d_mount_additions();
//dollo3d_mount_deletes();

// proper models
//dollo3d_mount_clip_top();
//dollo3d_mount_clip_back();


module debug_dollo3d_mount() {
    dollo3d_mount();

    translate([-10.68, 30.1, 45])
    intersection() {
        rotate([-90, 0, 0])
        motor_mount(bridges=false, motor_side=false);

        translate([100/2 +8, 0, 0])
        cube([100, 100, 200], center=true);
    }

    translate([-10.68, 30.2, 51.6])
    dollo3d_mount_clip_top();

    translate([-10.68, 30.2, 32.8])
    rotate([-90, 0, 0])
    dollo3d_mount_clip_back();
    // positioning aids
//    %translate([-10.68, 5.2])
//    cylinder(d=23, h=1);
//
//    %translate([-10.68, 5.2])
//    cylinder(d=36.2, h=100);
}

module dollo3d_mount_additions() {
    // tinkercad positioning aids
    translate([0, 100, 5/2])
    cube([5, 5, 5], center=true);

    translate([100, -100, 5/2])
    cube([5, 5, 5], center=true);

    translate([-100, -100 , 5/2])
    cube([5, 5, 5], center=true);

    // additions
    translate([-30/2 + 2, 30.25 - 4.9/2, 40.5])
    cube([30, 4.9, 7], center=true);

    translate([10.6, 30.25, 41.2])
    rotate([90, 0, 0])
    cylinder(d=5, h=10, $fn=20);

    translate([8, 30.25 - 4.9/2, 9])
    cube([5, 4.9, 10], center=true);

    // motor hole plug
    translate([-10.68, 5.2, 5/2 + 46.6])
    rounded_cube_side(
        28, 28, 5, 4, center=true, $fn=20
    );
}

module dollo3d_mount_deletes() {
    // tinkercad positioning aids
    translate([0, 100, 6/2])
    cube([6, 6, 6], center=true);

    translate([100, -100, 6/2])
    cube([6, 6, 6], center=true);

    translate([-100, -100, 6/2])
    cube([6, 6, 6], center=true);

    // deletes
    translate([-37.687, 30.15, 40])
    cube([10, 10, 25], center=true);

    translate([15, 31, 64.097])
    chamfered_cube(
        60, 40, 25, 10, center=true
    );
    
    translate([0, 30.2 + 10/2, 100/2])
    cube([100, 10, 100], center=true);

    hull() {
        translate([18.1, 35, 51.7])
        rotate([90, 0, 0])
        chamfered_cylinder(
            9, 25, 2, $fn=30
        );

        translate([17.8, 35, 72.2])
        chamfered_cube(
            9, 50, 9, 2, center=true
        );
    }

    translate([25, 30, 53])
    cube([10, 30, 10], center=true);

    // motor
    translate([-10.68, 5.2, 30])
    cylinder(d=22.4, h=50, center=true, $fn=30);

    translate([-10.68, 5.2, 30])
    for(i = [0:3]) {
        rotate([0, 0, i*90])
        translate([20/2, 20/2, 30])
        cylinder(d=3.2, h=50, center=true, $fn=30);

        rotate([0, 0, i*90])
        translate([20/2, 20/2, 0])
        chamfered_cylinder(
            6.2, 18.5, 1.8, $fn=30
        );
    }

    // dollo top mount holes
    translate([-10.68 - 13, 23, 43])
    rotate([0, 0, 30])
    M3_nut(6, cone=false);

    translate([-10.68 + 13, 23, 43])
    rotate([0, 0, 30])
    M3_nut(6, cone=false);

    translate([-10.68 - 13, 23, 42.6])
    cylinder(d=3.2, h=30, center=true, $fn=30);

    translate([-10.68 + 13, 23, 42.6])
    cylinder(d=3.2, h=30, center=true, $fn=30);

    // dollo back mount holes
    translate([-10.68 - 13, 30, 22.6])
    rotate([90, 0, 0])
    cylinder(d=3.2, h=20, center=true, $fn=30);

    translate([-10.68 + 13, 30, 22.6])
    rotate([90, 0, 0])
    cylinder(d=3.2, h=20, center=true, $fn=30);

    translate([-10.68 - 13, 28.3, 22.6])
    rotate([90, 0, 0])
    chamfered_cylinder(
        6.2, 10, 1.8, $fn=30
    );

    translate([-10.68 + 13, 28.3, 22.6])
    rotate([90, 0, 0])
    chamfered_cylinder(
        6.2, 10, 1.8, $fn=30
    );
}


module dollo3d_mount() {
    difference() {
        union() {
            _v10_mount_fixed_tk();

            dollo3d_mount_additions();
        }

        dollo3d_mount_deletes();
    }
}

module dollo3d_mount_clip_top() {
    difference() {
        union() {
            translate([-8, 5, 13./2 + 4.4])
            rotate([90, 0, 0])
            long_bow_tie_split(13);

            translate([8, 5, 13/2 + 4.4])
            rotate([90, 0, 0])
            long_bow_tie_split(13);

            translate([0, -12/2, 17.4/2])
            chamfered_cube_side(
                36, 12, 17.4, 2, center=true
            );
        }

        translate([-13, -7.2, 0])
        cylinder(d=3.2, h=100, center=true, $fn=30);

        translate([13, -7.2, 0])
        cylinder(d=3.2, h=100, center=true, $fn=30);

        translate([-13, -7.2, 12])
        chamfered_cylinder(
            6.1, 10, 2, $fn=30
        );

        translate([13, -7.2, 12])
        chamfered_cylinder(
            6.1, 10, 2, $fn=30
        );

        translate([0, -25, 0])
        cylinder(d=36.5, h=100, center=true, $fn=60);
    }
}

module dollo3d_mount_clip_back() {
    difference() {
        union() {
            translate([-8, 0, -4.75])
            long_bow_tie_split(20);

            translate([8, 0, -4.75])
            long_bow_tie_split(20);

            translate([0, 10.1, 5/2])
            chamfered_cube_side(
                35, 10, 5, 2, center=true
            );

            translate([0, 18, 5/2])
            cube([31, 12, 5], center=true);

            translate([0, 28.1, 5/2])
            chamfered_cube_side(
                40, 10, 5, 2, center=true
            );

            // slides
            translate([14, 30, 8/2 + 1.2])
            chamfered_cube(10, 5, 8, 1, center=true);

            translate([-14, 30, 8/2 + 1.2])
            chamfered_cube(10, 5, 8, 1, center=true);

        }

        translate([0, 20, 0])
        chamfered_cube(17, 15, 20, 3, center=true);

        translate([13, 10.2, 2])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([-13, 10.2, 2])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([13, 10.2, 2])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([-13, 10.2, 2])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, 0, -10/2])
        cube([100, 100, 10], center=true);
    }
}