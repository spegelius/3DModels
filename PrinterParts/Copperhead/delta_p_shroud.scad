use <../../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


debug();

//copperhead_delta_p_mount();


module _delta_p_fan_mount_form() {
    h = 5;

    union() {
        hull() {
            translate([18.2, 0.4, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );

            translate([2, -5, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );

            translate([-2, -6.4, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );

            translate([14, -30, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );
        }

        hull() {
            translate([-1, -5.8, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );

            translate([-36, -3.8, 0])
            chamfered_cylinder(
                5, h, 0.5, $fn=30
            );

            translate([-36, -6.8, 0])
            chamfered_cylinder(
                5, h, 0.5, $fn=30
            );
        }

        hull() {
            translate([19, -56.6, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );

            translate([14, -27.5, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );

            translate([-9, -17.5, 0])
            chamfered_cylinder(
                9, h, 0.5, $fn=30
            );
        }

        translate([-15.4, -20, h/2])
        chamfered_cube(40, 30, h, 0.5, center=true);
    }
}

module debug() {
    %translate([2.8, -20.8, 48.3])
    rotate([90, 49, 0])
    import(
        "../../_downloaded/50mm_Radial_fan/50mm_fan.stl");

    rotate([0, 0, 90])
    copperhead(block_rotation=-90);

    rotate([0, 0, 90])
    translate([0, -16.2, 36])
    rotate([90, -20, 0])
    25mm_fan();

    translate([-103.85, 106, 2.6])
    rotate([0, 0, -90])
    import(
        "../CubePrometheus/Cube_X_Carriage_delta_p_V2R2.2-duct_X2-no_LEDs.stl"
    );

    translate([20.8, -20.8, 17.8])
    rotate([-90, 0, 0])
    copperhead_delta_p_mount();

}


module copperhead_delta_p_mount() {

    module _infill() {
        intersection() {
            translate([-90, -60, 0])
            for(i = [0:20]) {
                for(j = [0:20]) {
                    translate([
                        i*8 + (j%2 ? 0 : 4),
                        j*7,
                        1
                    ])
                    rotate([0, 0, 30])
                    hull() {
                        cylinder(
                            d=7, h=8,
                            center=true, $fn=6
                        );
                            
                        cylinder(
                            d=1, h=11,
                            center=true
                        );
                    }
                }
            }

            difference() {
                translate([0, 0, -11/2 + 1])
                linear_extrude(11)
                offset(-3)
                projection(cut=true)
                _delta_p_fan_mount_form();

                translate([18.2, 0.4, 0])
                cylinder(d=10, h=20, center=true, $fn=30);

                translate([1.7, -5.2, 0])
                cylinder(d=10, h=20, center=true, $fn=30);

                translate([19, -56.6, 0])
                cylinder(d=10, h=20, center=true, $fn=30);

                translate([-34, -5.1, 0])
                cylinder(
                    d=10, h=20,
                    center=true, $fn=30
                );

                translate([-15.7, -20, 8/2 + 3])
                chamfered_cube(38, 34, 8, 0.5, center=true);
            }
        }
    }

    difference() {
        union() {
            _delta_p_fan_mount_form();

            hull() {
                translate([0.8, -31, 26.8])
                rotate([0, 90, 0])
                cylinder(d=7, h=2.4, $fn=30);

                translate([0.8, -5.4, 14.8])
                rotate([0, 90, 0])
                cylinder(d=7, h=2.4, $fn=30);

                translate([2, -18, 1])
                cube([2.4, 32, 1], center=true);
            }

            hull() {
                translate([-32.1, -31, 26.8])
                rotate([0, 90, 0])
                cylinder(d=7, h=2.4, $fn=30);

                translate([-32.1, -28.4, 4.8])
                rotate([0, 90, 0])
                cylinder(d=7, h=2.4, $fn=30);

                translate([-30.9, -20, 1])
                cube([2.4, 28, 1], center=true);
            }

            translate([-15, -18, 11/2])
            cube([34.2, 28, 11], center=true);

            translate([1.7, -5.2, 2.2])
            cylinder(d=6, h=8, $fn=30);
        }

        // mount screw holes
        translate([-34, -5.1, 0])
        cylinder(d=3.5, h=20, center=true, $fn=20);

        translate([-34, -5.1, 2.2])
        M3_nut(6);

        translate([18.2, 0.4, 0])
        cylinder(d=3.5, h=20, center=true, $fn=20);

        translate([18.2, 0.4, 2.2])
        M3_nut(6);

        translate([19, -56.6, 0])
        cylinder(d=3.5, h=20, center=true, $fn=20);

        translate([19, -56.6, 2.2])
        M3_nut(6);

        translate([1.7, -5.2, 0])
        cylinder(d=3.5, h=4, center=true, $fn=20);

        translate([1.7, -5.2, 4.2])
        cylinder(d=3.5, h=6, $fn=20);

        translate([
            1.7, -5.2, 1.8 + 2.2/2
        ])
        rotate([0, 0, 10])
        translate([0, 15/2 - 6/2, 0])
        cube([6, 15, 2.2], center=true);

        // fan hole
        translate([7, -18.2, 20.8])
        rotate([0, -90, 0])
        cylinder(d=24, h=10, $fn=60);

        intersection() {
            hull() {
                translate([-20.8, -18.2, 20.8])
                sphere(d=29, $fn=50);

                translate([-8, -18.2, 20.8])
                rotate([0, -90, 0])
                cylinder(d1=23.5, d2=31, h=25, $fn=60);
            }

            translate([-20, -18.2, 40/2])
            cube([50, 20.1, 40], center=true);
        }

        translate([-4.6, -18.2, 20.8])
        rotate([20, 0, 0])
        cube([10.8, 25.7, 25.7], center=true);

        // hotend mount holes
        translate([-15, -31, 26.8])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=37, center=true, $fn=20);

        translate([-15, -5.4, 14.8])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=37, center=true, $fn=20);

        translate([-3, -24.2, 8])
        rotate([0, 90, 0])
        cylinder(d=2.2, h=17, center=true, $fn=20);

        translate([3, -24.2, 8])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=10, center=true, $fn=20);


        _infill();
    }
}