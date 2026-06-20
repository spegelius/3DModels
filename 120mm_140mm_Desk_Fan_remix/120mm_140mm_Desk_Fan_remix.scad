use <../Dollo/NEW_long_ties/include.scad>;
use <../PCParts/common.scad>;


stl_base_path = "../_downloaded/";
df_stl_path = str(
    stl_base_path,
    "120mm_140mm Desk Fan/"
);


//_orig_stand_v2();
//_orig_shroud_v2_120();
//_orig_intake_v2_120();

//orig_assembly();

intake_v2_with_arm();
//extension_arm();



module _orig_stand_v2() {
    translate([-250/2, -210/2, 0])
    import (
        str(df_stl_path, "stand_v2.stl"),
        convexity=10
    );
}

module _orig_shroud_v2_120() {
    translate([-250/2, -210/2, 0])
    import (
        str(df_stl_path, "shroud_v2_120.stl"),
        convexity=10
    );
}

module _orig_intake_v2_120() {
    translate([-250/2, -210/2, 0])
    import (
        str(df_stl_path, "intake_v2_120.stl"),
        convexity=10
    );
}

module orig_assembly() {
    _orig_stand_v2();

    translate([0, 21, 105])
    rotate([80, 0, 0])
    _orig_shroud_v2_120();

    
    rotate([80 - 180, 0, 0])
    translate([0, -117.5, 27.5])
    _orig_intake_v2_120();

    %translate([0, 21, 105])
    rotate([80, 0, 0])
    translate([0, 10.5, -12.5])
    mock_fan_120mm();
}

module debug() {
    _orig_stand_v2();

    rotate([80 - 180, 0, 0])
    translate([0, -117.5, 27.5])
    _orig_intake_v2_120();

    %translate([0, 21, 105])
    rotate([80, 0, 0])
    translate([0, 10.5, -12.5])
    mock_fan_120mm();
}

module intake_v2_with_arm() {

    union() {
        _orig_intake_v2_120();

        intersection() {
            translate([0, -10.5, 0])
            _orig_shroud_v2_120();

            translate([0, -120/2 - 50/2, 0])
            cube([40, 50, 35], center=true);
        }

        difference() {
            translate([0, -120/2, 14/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                25, 14, 10, 2, center=true
            );

            cylinder(d1=111, d2=121, h=40, $fn=60);
        }
    }
}

module extension_arm() {
    %translate([0, 69, 0])
    intake_v2_with_arm();

    difference() {
        union() {
            intersection() {
                translate([0, -10.5, 0])
                _orig_shroud_v2_120();

                translate([0, -120/2 - 50/2 - 0.1, 0])
                cube([40, 50, 35], center=true);
            }

            translate([0, -120/2 + 29, 14/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                25, 14, 65, 2, center=true
            );
        }

        // chamfers
        translate([0, 4, 15])
        rotate([45, 0, 0])
        cube([50, 10, 10], center=true);

        translate([0, 4, -1])
        rotate([45, 0, 0])
        cube([50, 10, 10], center=true);

        translate([25/2 + 20/2 -  2, -60, -10/2 + 2])
        chamfered_cube(
            20, 20, 10, 2, center=true
        );

        // screw hole
        hull() {
            translate([0, -5, 7])
            rotate([0, 90, 0])
            cylinder(d=6.17, h=50, center=true, $fn=40);

            translate([0, -5, 9.9])
            rotate([45, 0, 0])
            cube([50, 2, 2], center=true);
        }

        // connector cuts
        translate([25/2, 0, 14/2])
        rotate([0, 90, 0])
        hull() {
            translate([0, -4.7, 0])
            cylinder(d=17, h=10.2, center=true, $fn=40);

            translate([0, 10, 0])
            cylinder(d=17, h=10.2, center=true, $fn=40);
        }

        translate([-25/2, 0, 14/2])
        rotate([0, 90, 0])
        hull() {
            translate([0, -4.7, 0])
            cylinder(d=17, h=10.2, center=true, $fn=40);

            translate([0, 10, 0])
            cylinder(d=17, h=10.2, center=true, $fn=40);
        }

        translate([0, 0, 14/2])
        rotate([0, 90, 0])
        hull() {
            translate([0, -4.7, 0])
            cylinder(d=17, h=4.8, center=true, $fn=40);

            translate([0, 10, 0])
            cylinder(d=17, h=4.8, center=true, $fn=40);
        }

        // inner cuts
        difference() {
            for(i = [0:5]) {
                translate([0, -75 + i*15])
                union() {
                    rotate([0, 0, 35])
                    cube([3, 50, 30], center=true);

                    translate([0, 0, -10/2 + 2])
                    rotate([0, 0, 35])
                    chamfered_cube(
                        7, 50, 10, 2, center=true
                    );

                    translate([0, 0, 14 + 10/2 - 2])
                    rotate([0, 0, 35])
                    chamfered_cube(
                        7, 50, 10, 2, center=true
                    );
                }
            }

            translate([-30/2 - 25/2 + 5.5, 0, 14/2])
            chamfered_cube(30, 200, 14, 2, center=true);

            translate([30/2 + 25/2 - 5.5, 0, 14/2])
            chamfered_cube(30, 200, 14, 2, center=true);

            translate([0, 0, 14/2])
            chamfered_cube(200, 30, 14, 2, center=true);

            translate([0, -76, 14/2])
            chamfered_cube(200, 30, 14, 2, center=true);
        }
    }
}
