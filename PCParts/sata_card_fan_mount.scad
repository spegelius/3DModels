include <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


//debug();
//mock_card();

sata_card_fan_mount();
//sata_card_fan_mount_clip();


module debug() {
    mock_card();

    translate([-39, -25.5, 1.6])
    sata_card_fan_mount();

    translate([-11, 33.6, 3.6])
    rotate([0, -90, 0])
    sata_card_fan_mount_clip();
}

module mock_card() {
    difference() {
        translate([0, 0, 1.6/2])
        cube([88, 69, 1.6], center=true);

        translate([-88/2, -69/2, 0])
        cube([88, 9.5, 20], center=true);

        translate([88/2, -69/2, 0])
        cube([46, 25.5, 20], center=true);

        // screws
        translate([-88/2 + 5, 69/2 - 29.2])
        cylinder(d=3, h=20, center=true, $fn=30);

        translate([-88/2 + 5, 69/2 - 60])
        cylinder(d=3, h=20, center=true, $fn=30);
    }

    // clock crystal
    color("grey")
    hull() {
        translate([-88/2 + 29 + 4/2, 69/2 - 42 - 4/2, 1.6])
        cylinder(d=4, h=4, $fn=30);
        
        translate([-88/2 + 29 + 4/2, 69/2 - 52 - 4/2, 1.6])
        cylinder(d=4, h=4, $fn=30);
    }

    // ic
    color("black")
    translate([-88/2 + 34 + 5/2, 69/2 - 12.2 - 5/2, 2/2 + 1.6])
    cube([5, 5, 2], center=true);

    // headers
    color("black")
    translate([88/2 - 10.5/2 - 22, 69/2 - 2.7/2 - 0.8])
    cube([10.5, 2.7, 10], center=true);

    // heatsink
    color("orange")
    translate([
        -88/2 + 20/2 + 37,
        -69/2 + 14.5/2 + 29,
        1.6 + 6.5/2
    ])
    cube([20, 14.5, 6.5], center=true);

    %translate([-5, 10, 10/2 + 1.6 + 7.6])
    mock_fan_40mm();
}


module sata_card_fan_mount_old() {
    difference() {
        cube([14, 47, 15], center=true);

        translate([14/2 - 9 -1.7/2, 4, 0])
        cube([1.7, 47, 40], center=true);

        translate([-14/2, 13, 0])
        cube([7, 47, 40], center=true);

        translate([0, 48/2, 15/2])
        cube([20, 10, 9], center=true);
        
        translate([12, 4, 40/2 - 15/2 + 3])
        rotate([0, 90, 0])
        cylinder(d=39, h=30, center=true, $fn=40);

        translate([2.5, 4 - 32/2, -15/2 + 7])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=10, center=true, $fn=20);

        translate([2.5, 4 + 32/2, -15/2 + 7])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=10, center=true, $fn=20);

        translate([3, 25, -15/2 - 1])
        rotate([45, 0, 0])
        cube([15, 10, 10], center=true);

        hull() {
            translate([-3 + 1/2, 10, -15/2 + 5/2])
            cube([1, 47, 5], center=true);

            translate([-3 + 5.5/2, 10, -15/2 - 0.1/2])
            cube([5.5, 47, 0.1], center=true);
        }

        hull() {
            translate([-3 + 1/2, 10, -15/2 + 5/2 + 9])
            cube([1, 47, 5], center=true);

            translate([-3 + 5.5/2, 10, -15/2 + 0.1/2 + 14])
            cube([5.5, 47, 0.1], center=true);
        }
    }

    %translate([14/2 + 10/2, 4, 40/2 - 15/2 + 3])
    rotate([0, 90, 0])
    mock_fan_40mm();
}

module sata_card_fan_mount() {
    difference() {
        union() {
            hull() {
                cylinder(d=9.5, h=7.6, $fn=30);

                translate([0, 30.8, 0])
                cylinder(d=9.5, h=7.6, $fn=30);

                translate([20, 18, 0])
                cylinder(d=9.5, h=7.6, $fn=30);

                translate([20, 48, 0])
                cylinder(d=9.5, h=7.6, $fn=30);
            }

            translate([34, 35.5, 7.6/2])
            rounded_cube_side(
                42, 42, 7.6, 4, center=true, $fn=30
            );

            hull() {
                translate([28, 55, 7.6/2])
                cube([14, 10, 7.6], center=true);

                translate([15, 54.5, 0])
                cylinder(d=4, h=7.6, $fn=30);

            }
        }

        // screw holes
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([0, 30.8, 0])
        cylinder(d=3.5, h=10, center=true, $fn=30);

        translate([0, 0, 1.6])
        cylinder(d=6.8, h=10, $fn=30);

        translate([0, 30.8, 1.6])
        cylinder(d=6.8, h=10, $fn=30);

        translate([28, 55, 7.6/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=20, center=true, $fn=20);

        // fan holes
        translate([34, 35.5, 0])
        cylinder(d=40, h=40, center=true, $fn=50);

        translate([18, 19.5, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);

        translate([18, 19.5 + 32, 0])
        cylinder(d=2.7, h=20, center=true, $fn=20);


        // extra stuf to remove
        translate([43, 10])
        cube([40, 40, 20], center=true);

        translate([55, 45])
        cube([40, 40, 20], center=true);

        hull() {
            translate([0, 0, 10/2 + 3])
            cube([10, 180, 10], center=true);

            translate([9, 0, 10/2 + 7.6])
            cube([10, 180, 10], center=true);

        }
    }
}

module sata_card_fan_mount_clip() {
    difference() {
        cube([11.2, 8, 10], center=true);

        translate([2, -3, 0])
        cube([11.2, 8, 12], center=true);

        translate([11.2/2 - 7.6/2, 0])
        rotate([-90, 0, 0])
        cylinder(d=3.2, h=10, $fn=30);

        translate([11.2/2 - 7.6/2, 8/2 - 1.6])
        rotate([-90, 0, 0])
        cylinder(d1=3.2, d2=6.6, h=1.7, $fn=30);
    }
}