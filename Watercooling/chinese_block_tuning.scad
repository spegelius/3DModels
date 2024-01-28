
include <../Dollo/NEW_long_ties/include.scad>;

use <../PCParts/AM4_Tuniq_Tower.scad>;


//debug();
//mock_block();

//block_cover();
mount_arm();


module debug() {
    translate([0, 0, 5])
    debug_tuniq_tower_mount();

    rotate([0, 0, 90])
    mock_block();

    translate([0, 0, 14.6])
    rotate([180, 0, 90])
    block_cover();

    translate([0, 0, 15])
    mount_arm();
}

module mock_block() {

    module _pipe() {
        union() {
            cylinder(d=10, h=1.5, $fn=30);
            cylinder(d=8, h=13, $fn=30);

            translate([0, 0, 9.4])
            cylinder(
                d1=9.8, d2=8, h=5.5, $fn=30
            );
        }
    }

    color("blue")
    render()
    union() {
        translate([0, 0, 12.2/2])
        cube([40.5, 42, 12.2], center=true);

        translate([
            40.5/2 - 10/2 - 2.8,
            -42/2 + 10/2 + 3.3,
            12.2
        ])
        _pipe();

        translate([
            -40.5/2 + 10/2 + 2.8,
            42/2 - 10/2 - 3.3,
            12.2
        ])
        _pipe();
    }
}

module block_cover() {
    difference() {
        union() {
            translate([0, 0, 14.6/2])
            rounded_cube_side(
                45, 46.5, 14.6,
                3, center=true, $fn=30
            );

            hull() {
                translate([-52/2, 0, 0])
                cylinder(d=12, h=10, $fn=30);

                translate([52/2, 0, 0])
                cylinder(d=12, h=10, $fn=30);

                translate([0, 0, 10/2])
                cube([40, 30, 10], center=true);
            }
        }

        translate([0, 0, 20/2 + 2.4])
        cube([41, 42.5, 20], center=true);

        translate([
            -40.5/2 + 10/2 + 2.8,
            -42/2 + 10/2 + 3.3,
            -2
        ])
        cylinder(d1=21, d2=13, h=5, $fn=40);

        translate([
            40.5/2 - 10/2 - 2.8,
            42/2 - 10/2 - 3.3,
            -2
        ])
        cylinder(d1=21, d2=13, h=5, $fn=40);

        translate([-52/2, 0, 0])
        cylinder(
            d=3.3, h=30, center=true, $fn=20
        );

        translate([52/2, 0, 0])
        cylinder(
            d=3.3, h=30, center=true, $fn=20
        );

        translate([-52/2, 0, 7])
        M3_nut(5);

        translate([52/2, 0, 7])
        M3_nut(5);
    }
}

module mount_arm() {

    module _arm() {
        difference() {
            union() {
                hull() {
                    translate([0, 91/2, 0])
                    cylinder(d=14, h=10, $fn=30);

                    translate([0, -91/2, 0])
                    cylinder(d=14, h=10, $fn=30);
                }

                intersection() {
                    translate([
                        40.5/2 - 10/2 - 2.8,
                        42/2 - 10/2 - 3.3, 0
                    ])
                    cylinder(
                         d=46, h=10, $fn=40
                    );

                    translate([-20, 14, 0])
                    cube([
                        40, 60, 30
                    ], center=true);
                }

                intersection() {
                    translate([
                        -40.5/2 + 10/2 + 2.8,
                        -42/2 + 10/2 + 3.3, 0
                    ])
                    cylinder(
                         d=46, h=10, $fn=40
                    );

                    translate([20, -14, 0])
                    cube([
                        40, 60, 30
                    ], center=true);
                }

            }

            // M4 holes
            translate([0, 91/2])
            cylinder(
                d=5, h=50,
                center=true, $fn=30
            );

            translate([0, -91/2])
            cylinder(
                d=5.2, h=50,
                center=true, $fn=30
            );

            // M3 holes
            translate([0, 52/2])
            cylinder(
                d=3.3, h=50,
                center=true, $fn=30
            );

            translate([0, 52/2, 5])
            cylinder(
                d=7, h=10, $fn=30
            );

            translate([0, -52/2])
            cylinder(
                d=3.3, h=50,
                center=true, $fn=30
            );

            translate([0, -52/2, 5])
            cylinder(
                d=7, h=10, $fn=30
            );

            // indents
            translate([
                40.5/2 - 10/2 - 2.8,
                42/2 - 10/2 - 3.3, 0
            ])
            cylinder(
                d=19, h=50, center=true, $fn=40
            );

            translate([
                -40.5/2 + 10/2 + 2.8,
                -42/2 + 10/2 + 3.3, 0
            ])
            cylinder(
                d=19, h=50, center=true, $fn=40
            );
        }
    }

    difference() {
        _arm();

        translate([0, 0, 8])
        linear_extrude(3.2)
        offset(-3.4)
        projection(cut=true)
        translate([0, 0, -9])
        _arm();

        translate([0, 0, -1.8])
        linear_extrude(2)
        offset(-3)
        projection(cut=true)
        _arm();
    }

}