use <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


//debug_sas_connector_keeper();

//SAS_disk_mount_1();
//SAS_disk_mount_2();
//SAS_end_clip_1();
//SAS_end_clip_2();
SAS_end_clip();


module debug_sas_connector_keeper() {
    color("grey")
    mock_ssd_enterprise(connector=true);

//    // SAS connector
//    translate([47/2 + 6.3, -13/2, + 8/2])
//    union() {
//        cube([47, 13, 8], center=true);
//
//        translate([0, -2, 0])
//        cube([34, 13, 5.5], center=true);
//    }

    translate([-1, 41.3, 9/2])
    SAS_disk_mount_1();

    translate([71, 41.3, 9/2])
    SAS_disk_mount_2();

//    %translate([3.25, -15, 9/2])
//    rotate([-90, 0, 0])
//    SAS_end_clip_1();
//
//    %translate([70 - 8.25, -15, 9/2])
//    rotate([-90, 0, 0])
//    SAS_end_clip_2();

    translate([35, -14.9, 9/2])
    rotate([-90, 0, 0])
    SAS_end_clip();
}

module _disk_mount() {
    module _mount_hole() {
        translate([0, 0, -1.5])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-10.2, 0, -1.5])
        rotate([0, 90, 0])
        //cylinder(d=7, h=5, $fn=30);
        chamfered_cylinder(7, 10, 3.7/2, $fn=30);
    }

    difference() {
        cube([12, 108, 9], center=true);

        translate([6, 10, 0])
        cube([10, 108, 12], center=true);

        translate([-13, 37, 0])
        chamfered_cube(
            20, 160, 30, 3, center=true
        );

        translate([0, -108/2 - 4/2, 0])
        chamfered_cube(20, 5, 8, 1, center=true);

        // chamfers
        translate([-12/2, 0, 9/2])
        rotate([0, 45, 0])
        cube([1.45, 200, 5], center=true);

        translate([-12/2, 0, -9/2])
        rotate([0, -45, 0])
        cube([1.45, 200, 5], center=true);
        
        // mount holes
//        translate([0, 108/2 - 4.7, -1.5])
//        rotate([0, 90, 0])
//        cylinder(d=3.3, h=20, center=true, $fn=30);
//
//        translate([-7, 108/2 - 4.7, -1.5])
//        rotate([0, 90, 0])
//        cylinder(d=7, h=5, $fn=30);
        translate([0, 108/2 - 4.7, 0])
        _mount_hole();

        translate([0, -108/2 + 26.7, 0])
        _mount_hole();

        // end mount holes
        translate([0, -108/2, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=19, center=true, $fn=30);

        translate([0, -108/2 + 4.5, 10/2 - 6/2])
        cube([6, 2, 10], center=true);
    }
}

module SAS_disk_mount_1() {
    _disk_mount();
}

module SAS_disk_mount_2() {
    mirror([1, 0, 0])
    _disk_mount();
}

module SAS_end_clip_1() {
    difference() {
        union() {
            cube([20.5, 9, 4], center=true);

            translate([12/2 - 20.5/2, 0, 1.5])
            rotate([0, 90, 0])
            chamfered_cube_side(
                2, 7.8, 12, 0.9, center=true
            );
        }

        translate([-4.25, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-4.25, 0, -1])
        cylinder(
            d2=3.3, d1=6.6, h=3.1,
            center=true, $fn=30
        );

        translate([14.2, -0.5, 0])
        chamfered_cube(10, 5.6, 10, 0.7, center=true);
    }
}

module SAS_end_clip_2() {
    difference() {
        union() {
            cube([30.5, 9, 4], center=true);

            translate([-12/2 + 30.5/2, 0, 1.5])
            rotate([0, 90, 0])
            chamfered_cube_side(
                2, 7.8, 12, 0.9, center=true
            );
        }

        translate([9.25, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([9.25, 0, -1])
        cylinder(
            d2=3.3, d1=6.6, h=3.1,
            center=true, $fn=30
        );

        translate([-19.5, -0.5, 0])
        chamfered_cube(10, 5.6, 10, 0.7, center=true);
    }
}

module SAS_end_clip() {
    difference() {
        union() {
            chamfered_cube_side(
                84, 9, 4, 1, center=true
            );

            translate([-5.25, 0, 0])
            chamfered_cube_side(
                47, 11, 4, 2, center=true
            );

            translate([-84/2 + 6, 0, 1.5])
            rotate([0, 90, 0])
            chamfered_cube(
                2, 7.8, 12, 0.9, center=true
            );

            translate([84/2 - 6, 0, 1.5])
            rotate([0, 90, 0])
            chamfered_cube(
                2, 7.8, 12, 0.9, center=true
            );
        }

        translate([-84/2 + 6, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-84/2 + 6, 0, -1])
        cylinder(
            d2=3.3, d1=6.6, h=3.1,
            center=true, $fn=30
        );

        translate([84/2 - 6, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([84/2 - 6, 0, -1])
        cylinder(
            d2=3.3, d1=6.6, h=3.1,
            center=true, $fn=30
        );

        translate([-5.15, 1.5, 0])
        chamfered_cube(34.8, 5.5, 10, 0.2, center=true);

        translate([-5.15, 3, 0])
        cube([33.3, 5.6, 10], center=true);
    }
}