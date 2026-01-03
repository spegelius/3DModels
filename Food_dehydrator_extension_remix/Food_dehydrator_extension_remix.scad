use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Filament dryer extension with thermometer/"
);

spath2 = str(
    stl_base_path, "food dehydrator filamentdryer mod/"
);

//_orig_dryerextension_sensor();
//_orig_dryerextension_sensor_part1();
//_orig_dryerextension_sensor_part2();
//_orig_dryerextension_sensor_part3();
//_orig_dryerextension_sensor_part4();
//_orig_dryerextension_sensor_assembly();

//_orig_filamentdryer();
//_orig_filamentdryer_full();


//filamentdryer_full_with_sensor();
//filamentdryer_part_with_sensor();
shim();


module _orig_dryerextension_sensor() {
    translate([-124.5, -110, 0])
    import(
        str(spath, "dryerextension_sensor4x325.stl"),
        convexity=10
    );
}

module _orig_dryerextension_sensor_part1() {
    rotate([0, 0, 180])
    translate([-1, -186.7, 0])
    intersection() {
        _orig_dryerextension_sensor();

        translate([0, 330/2 + 10, 0])
        cylinder(d=330, h=200, center=true);
    }
}

module _orig_dryerextension_sensor_part2() {
    rotate([0, 0, 90])
    translate([-0.6, -151.6, 0])
    intersection() {
        _orig_dryerextension_sensor();

        translate([0, 330/2 - 25, 0])
        tube(330, 200, 20, center=true);
    }
}

module _orig_dryerextension_sensor_part3() {
    rotate([0, 0, -90])
    translate([-0.2, -116.7, 0])
    intersection() {
        _orig_dryerextension_sensor();

        translate([0, 330/2 - 50, 0])
        tube(330, 200, 20, center=true);
    }
}

module _orig_dryerextension_sensor_part4() {
    translate([0, -81.6, 0])
    intersection() {
        _orig_dryerextension_sensor();

        translate([0, 330/2 - 90, 0])
        tube(330, 200, 20, center=true);
    }
}

module _orig_dryerextension_sensor_assembly() {
    intersection() {
        union() {
            _orig_dryerextension_sensor_part1();
            _orig_dryerextension_sensor_part2();
            _orig_dryerextension_sensor_part3();
            _orig_dryerextension_sensor_part4();
        }

//        translate([0, 0, 500/2 + 10])
//        cube([500, 500, 500], center=true);

        translate([0, -500/2, 0])
        cube([500, 500, 500], center=true);
    }
//    %cylinder(d=327, h=1, $fn=100);

//    %translate([0.5, -127, 32.5])
//    rotate([90, 0, 0])
//    chamfered_cylinder(61, 40, 6, $fn=100);

//    %translate([0.67, -147, 32.5])
//    rotate([90, 0, 0])
//    cylinder(d=42.6, h=30, $fn=50);
//
//    %translate([0.67, -147, 32.5])
//    rotate([0, -25.85, 0])
//    cube([8, 30, 44.8], center=true);
}

module _orig_filamentdryer() {
    translate([0, 0, -23.2])
    import(
        str(spath2, "filamentdryer.stl"),
        convexity=10
    );
}

module _orig_filamentdryer_full() {
    translate([0, 0, 80])
    rotate([-90, 0, 0])
    import(
        str(spath2, "filmentdryer_full.stl"),
        convexity=10
    );

    //%cylinder(d=235, h=100, $fn=200);
    //%cylinder(d=240, h=100, $fn=200);
}

module _sensor_body() {
    difference() {
        translate([0, -84, 38])
        rotate([90, 0, 0])
        chamfered_cylinder(61, 40, 6, $fn=100);

        cylinder(d=240, h=100);
    }
}

module _sensor_hole() {
    translate([0, -107, 38])
    rotate([90, 0, 0])
    cylinder(d=42.6, h=30, $fn=50);

    translate([0, -117, 38])
    rotate([0, -25.85, 0])
    cube([8, 30, 44.8], center=true);
}

module filamentdryer_full_with_sensor() {
    difference() {
        union() {
            intersection() {
                _orig_filamentdryer_full();
                cylinder(d=241.5, h=200, $fn=200);
            }
            _sensor_body();
        }
        _sensor_hole();
    }
}

module filamentdryer_part_with_sensor() {
    //%filamentdryer_full_with_sensor();

    difference() {
        union() {
            rotate([0, 0, -30])
            translate([0, -82, 0])
            _orig_filamentdryer();

            _sensor_body();
        }
        _sensor_hole();
    }
}

module shim() {
    tube(237.5, 10, 1, $fn=200);
}