use <../Dollo/NEW_long_ties/include.scad>;
use <../PCParts/common.scad>;

pump_width = 45.5;
pump_height = 63.5;
pump_depth = 63;

tube1_outer_dia = 12.15; // copper
tube1_inner_dia = 10;

tube2_outer_dia = 10;
tube2_inner_dia = 8.5;

fitting_thread_dia = 13;

passthrough_thread_dia = 16;

wire_pass_thread_dia = 12;

// threads
g3_8_d = 16.6;
g1_4_d = 13.3;
g1_2_d = 20.955;

//mock_radiator_360();
//mock_radiator_420();


module mock_pump() {
    difference() {
        translate([0, 0, 6])
        cube([
            pump_width, pump_depth,
            pump_height
        ]);

        translate([0, 63, 45 + 6])
        rotate([30, 0, 0])
        cube([
            50, pump_depth - 23,
            pump_height - 23.5
        ]);
    }
    translate([
        pump_width/2, 41.6 + 13.1/2,
        pump_height - (20 - 14.3) + 6
    ])
    cylinder(d=13.1, h=20, $fn=30);

    module foot() {
        hull() {
            cylinder(d=20, h=0.1);
            translate([0, 0, 5.9])
            cylinder(d=11, h=0.1);
        }
    }
    translate([6.7, 15.4, 0])
    foot();

    translate([
        pump_width - 6.7, 15.4, 0
    ])
    foot();

    translate([6.7, 48.3, 0])
    foot();

    translate([
        pump_width - 6.7, 48.3, 0
    ])
    foot();
}

module mock_pump_Eheim_1250_790() {
    difference() {
        intersection() {
            translate([
                0, 0, (112 + 5 + 11)/2 - 5
            ])
            chamfered_cube(
                81, 75, 112 + 5 + 11,
                11, center=true
            );

            translate([0, 0, 112/2])
            cube(
                [81, 75, 112], center=true
            );
        }
        translate([0, 0, 112 - 5 + 20/2])
        chamfered_cube_side(
            81 - 3, 75 - 3, 20, 13
        );
    }

    difference() {
        cylinder(
            d=24, h=112 + 18.5, $fn=40
        );
        cylinder(
            d=24 - 2, h=112 + 19, $fn=40
        );
    }

    // hose
    translate([-81/2, 0, 112 - 25])
    rotate([0, 90, 0])
    cylinder(d=20, h=81 + 33, $fn=40);
}

module g3_8_thread(h, slop=0) {
    v_screw(
        h=h,
        screw_d=g3_8_d + slop,
        pitch=1.337,
        direction=0,
        steps=80,
        chamfer=true
    );

}

module g1_4_thread(h, slop=0) {
    v_screw(
        h=h,
        screw_d=g1_4_d + slop,
        pitch=1.337,
        direction=0,
        steps=70,
        chamfer=true
    );
}

module mock_radiator_360() {
    difference() {
        rounded_cube_side(
            131, 400, 39, 5, center=true, $fn=30
        );

        translate([61.5/2, 400/2 - 15, 15])
        cylinder(d=12, h=10, $fn=30);

        translate([-61.5/2, 400/2 - 15, 15])
        cylinder(d=12, h=10, $fn=30);

        translate([61.5/2, 400/2 - 15, -21])
        cylinder(d=12, h=10, $fn=30);

        translate([-61.5/2, 400/2 - 15, -21])
        cylinder(d=12, h=10, $fn=30);

        translate([0, -400/2 + 75, 0]) {
            %translate([0, 0,  39/2 + 25/2])
            mock_fan_120mm();

            fan_mount_holes(120);
        }

        translate([0, -400/2 + 196, 0]) {
            %translate([0, 0,  39/2 + 25/2])
            mock_fan_120mm();

            fan_mount_holes(120);
        }

        translate([0, -400/2 + 317, 0]) {
            %translate([0, 0,  39/2 + 25/2])
            mock_fan_120mm();

            fan_mount_holes(120);
        }
    }
}

module mock_radiator_420() {
    difference() {
        rounded_cube_side(
            145, 460, 39, 5, center=true, $fn=30
        );

        translate([61.5/2, 460/2 - 15, 15])
        cylinder(d=12, h=10, $fn=30);

        translate([-61.5/2, 460/2 - 15, 15])
        cylinder(d=12, h=10, $fn=30);

        translate([61.5/2, 460/2 - 15, -21])
        cylinder(d=12, h=10, $fn=30);

        translate([-61.5/2, 460/2 - 15, -21])
        cylinder(d=12, h=10, $fn=30);

        translate([0, -460/2 + 85, 0]) {
            %translate([0, 0,  39/2 + 25/2])
            mock_fan_140mm();

            fan_mount_holes(140);
        }

        translate([0, -460/2 + 226, 0]) {
            %translate([0, 0,  39/2 + 25/2])
            mock_fan_140mm();

            fan_mount_holes(140);
        }

        translate([0, -460/2 + 367, 0]) {
            %translate([0, 0,  39/2 + 25/2])
            mock_fan_140mm();

            fan_mount_holes(140);
        }
    }
}