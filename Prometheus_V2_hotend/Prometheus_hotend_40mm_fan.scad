include <../Dollo/NEW_Long_ties/include.scad>;
use <Prometheus_V2_hotend.scad>;
use <../PCParts/common.scad>;

$fn = 40;
fan_side = 40;
bolt_hole_distance = 32;

bolt_hole_offset = bolt_hole_distance/2;

wall = 1.5;

stl_path = "../_downloaded/";


//debug();

fan_shroud_40mm();
//fan_shroud_40mm_cube_mount();


module debug() {
    intersection() {
        fan_shroud_40mm();

//        translate([-50, -10, 0])
//        cube([100, 100, 15]);

        //translate([-50, -10, 0])
        //cube([100, 20, 100]);
    }

//    translate([0, -2.1, fan_side/2 + 1/2 - 4.5])
//    rotate([78, 0, 0])
//    translate([0, 0, 10/2])
//    mock_fan_40mm();
}

module hotend_body() {
    hull()
    intersection() {
        prometheus_v2_heat_sink_4mm();

        cube([35, 35, 48], center=true);
    }
}

module arms() {

    x_scale = (29.5 + 2*wall)/30;
    echo(x_scale*30);
    y_scale = (15 + wall)/15;

    difference() {
        intersection() {
            scale([x_scale, y_scale, 1.03])
            hotend_body();

            translate([0, -1, 0])
            cube([34, 14, 46], center=true);
        }
        scale([29.5/30, 1, 1])
        hotend_body();
    }
}

module arms_extension() {
    rotate([-90, 0, 0])
    linear_extrude(1)
    projection(cut=true)
    translate([0, 0, 7.99])
    rotate([90, 0, 0])
    arms();
}

module _body() {
    hull() {
        translate([0, 21, 0])
        arms_extension();

        translate([0, 0, (fan_side + 1)/2 - 3])
        rotate([78, 0, 0])
        chamfered_cube_side(
            fan_side + 1, fan_side + 1, 4,
            2.5, center=true
        );
    }
}

scale_val = (40 - 2*wall)/40;

module _body_scaled() {
    hull() {
        translate([0, 21, 0])
        scale([(27 - 2*wall)/27, 1, 20.5/22.5]) 
        arms_extension();

        translate([0, 0, (fan_side - 1.5)/2 + 1/2 - 3])
        rotate([78, 0, 0])
        cylinder(d=fan_side - 1.5, h=2, $fn=70);
    }
}

module shroud_body() {
    
    difference() {
        union() {
            _body();

            translate([0, 22, 0])
            arms_extension();

            translate([0, 22, 1/2])
            cube([26, 2, 1], center=true);

            translate([0, 31, 0])
            arms();
        }

        translate([0, -0.6, 1])
        _body_scaled();

        translate([0, 24, 1])
        rotate([90, 0, 0])
        linear_extrude(3)
        projection(cut=true)
        translate([0, 0, 22])
        rotate([-90, 0, 0])
        scale([1, 1, 1.01])
        _body_scaled();
    }
}

module _screw_holes() {
    translate([0, 0, fan_side/2 + 1/2 - 3])
    rotate([78, 0, 0])
    union() {
        translate([
            bolt_hole_offset,
            bolt_hole_offset, 0
        ])
        cylinder(d=2.6, h=16, center=true, $fn=25);

        translate([
            -bolt_hole_offset,
            bolt_hole_offset, 0
        ])
        cylinder(d=2.6, h=16, center=true, $fn=25);

        translate([
            bolt_hole_offset,
            -bolt_hole_offset, 0
        ])
        cylinder(d=2.6, h=16, center=true, $fn=25);

        translate([
            -bolt_hole_offset,
            -bolt_hole_offset, 0
        ])
        cylinder(d=2.6, h=16, center=true, $fn=25);
    }
}

module fan_shroud_40mm() {
    difference() {
        shroud_body();

        _screw_holes();
    }
}

module fan_shroud_40mm_cube_mount() {
    difference() {
        union() {
            fan_shroud_40mm();

            difference() {
                translate([-fan_side/2 - 2.5, 2.1, 15])
                rotate([-12, 0, 0])
                chamfered_cube_side(
                    10, 9, 5, 1.5, center=true
                );

                translate([-fan_side/2 + 3, 2, 15])
                rotate([-12, 0, -7])
                cube([5, 10, 10], center=true);

                translate([-24, 2.3, 15])
                rotate([-12, 0, 0])
                cylinder(
                    d=3.3, h=10, center=true, $fn=20
                );
            }
        }
    }
}