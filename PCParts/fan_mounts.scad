use <../Dollo/NEW_long_ties/include.scad>;

use <common.scad>;



//debug();
//debug_fan_mount_3ware_9750();


//fan_mount_pcb_top_80mm();
fan_mount_3ware_9750();


module debug() {
    %translate([0, 83/2, 25/2 + 3/2])
    mock_fan_80mm();

    %translate([-55, 23, -49])
    rotate([0, 7, 0])
    cube([110, 2, 50]);

    rotate([0, 180, 0])
    fan_mount_pcb_top_80mm();
}

module debug_fan_mount_3ware_9750() {
    translate([0, 0, -10.5])
    difference() {
        translate([0, 0, 10.5/2])
        cube([30, 55, 10.5], center=true);

        translate([30/2 - 3.5, 55/2 - 3.5, 0])
        cylinder(d=3, h=20, center=true, $fn=20);

        translate([-30/2 + 3.5, -55/2 + 3.5, 0])
        cylinder(d=3, h=20, center=true, $fn=20);

        translate([30/2 - 3.5, 55/2 - 3.5, 1.5])
        hull() {
            cylinder(d=9, h=20, $fn=20);

            translate([0, 6, 20/2])
            cube([9, 1, 20], center=true);

            translate([6, 0, 20/2])
            cube([1, 9, 20], center=true);
        }

        translate([-30/2 + 3.5, -55/2 + 3.5, 1.5])
        hull() {
            cylinder(d=9, h=20, $fn=20);

            translate([0, -6, 20/2])
            cube([9, 1, 20], center=true);

            translate([-6, 0, 20/2])
            cube([1, 9, 20], center=true);
        }
    }

    %translate([0, 0, 7])
    mock_fan_40mm();
    
    fan_mount_3ware_9750();
}

module fan_mount_pcb_top_80mm() {
    difference() {
        intersection() {
            translate([0, 83/2, 0])
            union() {
                cube([80, 80, 3], center=true);
                cylinder(d=83, h=3, center=true, $fn=90);

                hull() {
                    translate([
                        80/2 - 3, -80/2 + 25 - 5, -3/2
                    ])
                    cube([7, 7, 8]);

                    translate([
                        80/2 - 3, -80/2 + 20 - 5, -3/2
                    ])
                    cube([1, 1, 1]);
                }

                hull() {
                    translate([
                        -80/2 - 4, -80/2 + 25 - 5,
                        -3/2
                    ])
                    cube([7, 7, 18]);

                    translate([
                        -80/2 + 3, -80/2 + 25 - 14,
                        -3/2
                    ])
                    cube([1, 7, 1]);
                }
            }
            translate([0, 27/2, 0])
            cube([90, 27, 63], center=true);
        }
        translate([0, 83/2])
        cylinder(d=80, h=77, center=true, $fn=80);

        translate([-72/2, 4 + 1.5, 0])
        cylinder(d=4, h=7, center=true, $fn=30);

        translate([72/2, 4 + 1.5, 0])
        cylinder(d=4, h=7, center=true, $fn=30);

        translate([-55, 23, 12])
        rotate([0, 7, 0])
        cube([110, 1.8, 50]);
    }
}

module fan_mount_3ware_9750() {
    difference() {
        union() {
            translate([0, 0, 8/2])
            rounded_cube_side(
                44, 44, 8, 3, center=true, $fn=30
            );

            scale([1, 1.05, 1])
            cylinder(d1=44, d2=42, h=3, $fn=50);

            hull() {
                translate([0, 0, 8/2])
                cube([40, 1, 8], center=true);

                translate([30/2 - 3.5, 55/2 - 3.5, 0])
                cylinder(d=7, h=8, $fn=30);

                translate([-30/2 + 3.5, -55/2 + 3.5, 0])
                cylinder(d=7, h=8, $fn=30);
            }
        }
        translate([0, 0, 20/2 + 3])
        cube([40.5, 40.5, 20], center=true);

        hull() {
            translate([0, 0, 3])
            cylinder(d=39.4, h=0.1, center=true, $fn=50);

            scale([0.9, 1.1, 1])
            cylinder(d=40, h=0.1, center=true, $fn=50);
        }

        fan_mount_holes(40, 2.6);

        translate([30/2 - 3.5, 55/2 - 3.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-30/2 + 3.5, -55/2 + 3.5, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);
    }
}
