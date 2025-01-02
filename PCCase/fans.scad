use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
include <../PCParts/common.scad>;

use <frame_parts.scad>;


//debug_fan_mount_m3_adapter();

//fan_mount_120mm(230);
//fan_mount_120mm(240);

//fan_mount_140mm(218);
//fan_mount_140mm(230);
//fan_mount_140mm(240);

//fan_mount_dual_120mm(230);
//fan_mount_dual_120mm(240);

//fan_mount_dual_140mm(230);
//fan_mount_dual_140mm(240);

//fan_mount_dual_120_140mm(240);

//fan_end_mount_120mm(218);

//fan_mount_m3_adapter();
fan_mount_long_tie_half();


module debug_fan_mount_m3_adapter() {
    fan_mount_140mm(230);

    translate([-124.5/2, 12.1, -2])
    fan_mount_m3_adapter();
}

module _fan_mount_body(w, fan_size) {
    union() {
        difference() {
            union() {
                translate([-w/2, 20/2, 0])
                long_bow_tie_half(20);

                translate([w/2, 20/2, 0])
                long_bow_tie_half(20);
            }

            translate([0, 20/2, 2/2 + 2])
            cube([w, 21, 2], center=true);
        }

        translate([0, 20/2, 2/2])
        cube([w, 20, 2], center=true);

        hull() {
            translate([0, 4/2, 1/2])
            cube([w, 4, 1], center=true);

            translate([0, 4/2, 10/2])
            cube([w - 25, 4, 10], center=true);
        }

        translate([-fan_size/2 - 2/2 - 0.5, 20/2, 10/2])
        cube([2, 20, 10], center=true);

        translate([fan_size/2 + 2/2 + 0.5, 20/2, 10/2])
        cube([2, 20, 10], center=true);
    }
}

module _fan_end_mount_body(w, fan_size) {
    union() {
        difference() {
            rotate([0, 0, -90])
            long_bow_tie_half(30);

            translate([0, 20/2, 2/2 + 2])
            cube([w, 20, 2], center=true);
        }

        translate([0, 20/2 - 4, 2/2])
        cube([w, 20, 2], center=true);
    }
}

module fan_mount_120mm(width) {
    w = width - 60;

//    %translate([0, 120/2 + 4.3, 25/2 + 2])
//    mock_fan_120mm();

    difference() {
        _fan_mount_body(w, 120);

        translate([0, 140/2 + 4.3, 0])
        chamfered_cube(140, 140, 85, 40, center=true);

        translate([105/2, 4 + 15.1/2 + 0.3, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);

        translate([-105/2, 4 + 15.1/2 + 0.3, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);
    }
}

module fan_mount_140mm(width) {

    w = width - 60;

//    %translate([0, 140/2 + 4.3, 25/2 + 2])
//    mock_fan_140mm();

    difference() {
        _fan_mount_body(w, 140);

        translate([0, 140/2 + 4.3, 0])
        chamfered_cube(140, 140, 85, 40, center=true);

        translate([124.5/2, 4 + 15.5/2 + 0.3, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);

        translate([-124.5/2, 4 + 15.5/2 + 0.3, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);
    }
}

module fan_mount_dual_120mm(width) {
    intersection() {
        union() {
            translate([0, -2, 0])
            fan_mount_120mm(width);

            translate([0, 2, 0])
            mirror([0, 1, 0])
            fan_mount_120mm(width);
        }

        chamfered_cube(width - 45, 40, 50, 13, center=true);
    }
}

module fan_mount_dual_140mm(width) {
    intersection() {
        union() {
            translate([0, -2, 0])
            fan_mount_140mm(width);

            translate([0, 2, 0])
            mirror([0, 1, 0])
            fan_mount_140mm(width);
        }

        chamfered_cube(width - 45, 40, 50, 13, center=true);
    }
}

module fan_mount_dual_120_140mm(width) {
    intersection() {
        union() {
            translate([0, -2, 0])
            fan_mount_120mm(width);

            translate([0, 2, 0])
            mirror([0, 1, 0])
            fan_mount_140mm(width);
        }

        chamfered_cube(width - 45, 40, 50, 13, center=true);
    }
}

module fan_end_mount_120mm(width) {
    w = 120;

    %translate([0, 120/2 + 1, 25/2 + 2])
    mock_fan_120mm();

    difference() {
        _fan_end_mount_body(w, 120);

        translate([0, 140/2 + 1, 0])
        chamfered_cube(140, 140, 85, 40, center=true);

        translate([105/2, 1 + 15.1/2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);

        translate([-105/2, 1 + 15.1/2, 0])
        cylinder(d=5.3, h=10, center=true, $fn=40);
    }
    
}

module fan_mount_m3_adapter() {
    difference() {
        union() {
            translate([0, 13/2 - 3, 2/2])
            cube([10, 13, 2], center=true);

            translate([0, 13 - 3 - 2/2, 4/2])
            cube([10, 2, 4], center=true);

            cylinder(d=5, h=4.2, $fn=30);

            for(i = [0:4]) {
                rotate([0, 0, 360/5*i])
                translate([5/2 - 0.3, 0, 3])
                sphere(d=1.2, $fn=30);
            }
        }

        cylinder(d=2.8, h= 20, center=true, $fn=20);

        translate([0, 0, 5])
        cylinder(d1=2.8, d2=5, h=4, center=true, $fn=20);
    }
}

module fan_mount_long_tie_half() {
    long_tie_half_20();
}