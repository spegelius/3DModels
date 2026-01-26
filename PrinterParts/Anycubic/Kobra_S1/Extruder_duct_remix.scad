use <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../PCParts/common.scad>;


stl_base_path = "../../../_downloaded/Anycubic/";
spath = str(
    stl_base_path, "Kobra S1/"
);


//_orig_extruder_duct();


new_extruder_duct();


module _orig_extruder_duct() {
    translate([-140, -130])
    import(
        str(spath, "Kobra_S1_Extruder_Duct.stl"),
        convexity=10
    );
}

module new_extruder_duct() {

    %translate([0, 0, 32.7])
    rotate([180, 0, 180])
    _orig_extruder_duct();

    %translate([0.2, 9, 27.7])
    mock_fan_25mm();

    module _cutout_form() {
        hull() {
            translate([4.5, 7.4, 0])
            cube([24, 19.5, 32.8], center=true);

            translate([4.3, 7.4, 0])
            cube([23.6, 19.5, 33.8], center=true);
        }

        difference() {
            hull() {
                translate([0.15, 6.3, 22.7 + 11/2])
                cube([25.2, 19.9, 11], center=true);

                translate([0.25, 6.3, 22.5 + 11/2])
                cube([25, 19.9, 11], center=true);
            }

            difference() {
                union() {
                    translate([-12.7, 2.3, 25])
                    cylinder(d=3, h=20, center=true, $fn=30);

                    translate([13, 2.3, 25])
                    cylinder(d=3, h=20, center=true, $fn=30);
                }

                translate([0.15, 0, 0])
                chamfered_cube(
                    26, 40, 60, 5, center=true
                );
            }
        }

        hull() {
            translate([0.15, 6.3, 22.7 + 0.1/2])
            cube([25.2, 19.9, 0.1], center=true);

            translate([-2.3, 7.61, 16.6])
            cube([10, 19.9, 0.1], center=true);
        }

        hull() {
            translate([1.15, 6.37, 22.4 + 0.1/2])
            cube([23.2, 19.9, 0.1], center=true);

            translate([8.5, 7.65, 16.4])
            cube([16, 19.9, 0.1], center=true);
        }

        translate([20, 16.2, 0])
        cube([30, 20, 70], center=true);
    }

    difference() {
        union() {
            translate([4.5, 1.4, 16.6/2])
            cube([26, 9.5, 16.6], center=true);

            hull() {
                translate([4.5, 5.95, 16.6 - 0.1/2])
                cube([26, 18.6, 0.1], center=true);

                translate([0.15, 5.5, 22.6 - 0.1/2])
                cube([27.2, 19.5, 0.1], center=true);
            }

            translate([0.15, 5.5, 22.6 + 10/2])
            cube([27.2, 19.5, 10], center=true);
        }

        difference() {
            _cutout_form();

            difference() {
                translate([0, -4, 16.6 + 6/2])
                cube([70, 20, 6], center=true);

                translate([0.15, 9, 22.5])
                cylinder(d=23.8, h=1, $fn=50);

                hull() {
                    translate([0.15, 9, 22.5])
                    cylinder(d=23.8, h=0.1, $fn=50);

                    translate([4.5, 7.4, 16.6])
                    rounded_cube_side(
                        24, 19.5, 0.1, 1, center=true, $fn=30
                    );

                    translate([4.3, 7.4, 16.8])
                    rounded_cube_side(
                        23.6, 19.5, 0.1, 1, center=true, $fn=30
                    );
                }

                translate([10.5, -1.1, 18])
                cylinder(d=1.8, h=20, $fn=30);

                translate([-10.1, -1.1, 18])
                cylinder(d=1.8, h=20, $fn=30);
            }
        }

    }
}