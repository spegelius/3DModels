use <../../../Dollo/NEW_long_ties/include.scad>;


//mock_bearing();
//mock_axle();

//mock_axle_assembly();
//mock_dry_box();
mock_dry_box_lid();


module mock_bearing() {
    difference() {
        union() {
            cylinder(d=15, h=1, $fn=40);
            chamfered_cylinder(13, 5, 0.3, $fn=40);
        }

        cylinder(d=4, h=20, center=true, $fn=40);
    }
}

module mock_axle() {
    union() {
        cylinder(d=4, h=86, center=true, $fn=40);
        cylinder(d=6, h=76, center=true, $fn=40);
    }
}

module mock_axle_assembly() {
    rotate([0, 90, 0]) {
        mock_axle();

        translate([0, 0, 76/2 + 0.3])
        mock_bearing();

        rotate([180, 0, 0])
        translate([0, 0, 76/2 + 0.3])
        mock_bearing();
    }
}

module mock_dry_box() {
    module _axle_holder() {
        difference() {
            hull() {
                translate([0, 0, 165 - 88 - 6/2])
                rotate([0, 90, 0])
                rounded_cube_side(6, 16.5, 20, 2, center=true, $fn=30);

                translate([0, 0, 165 - 123])
                rotate([0, 90, 0])
                cylinder(d=24, h=20, center=true, $fn=30);
            }

            union() {
                translate([0, 0, 165 - 99 + 13/2])
                rotate([0, 90, 0])
                cylinder(d=13, h=30, center=true, $fn=30);

                translate([0, 0, 165 - 99 + 13])
                cube([30, 12, 10], center=true);
            }
        }
    }

    module _inner_cut() {
        difference() {
            union() {
                hull() {
                    translate([0, 220/2 - 80/2 - 35, 80/2 + 165 - 112])
                    rotate([0, 90, 0])
                    cylinder(d=80, h=90, center=true, $fn=40);

                    translate([0, -220/2 + 80/2 + 35, 80/2 + 165 - 112])
                    rotate([0, 90, 0])
                    cylinder(d=80, h=90, center=true, $fn=40);

                    translate([0, 220/2 - 80/2 - 35, 200])
                    rotate([0, 90, 0])
                    cylinder(d=80, h=90, center=true, $fn=40);

                    translate([0, -220/2 + 80/2 + 35, 200])
                    rotate([0, 90, 0])
                    cylinder(d=80, h=90, center=true, $fn=40);
                }
                translate([0, 0, 200/2 + 165 - 78])
                chamfered_cube_side(90, 212, 200, 1, center=true);
            }

            translate([100/2, 0, 0])
            cube([12.8, 1.2, 500], center=true);

            translate([100/2, 32.5, 0])
            cube([12.8, 1.2, 500], center=true);

            translate([100/2, -32.5, 0])
            cube([12.8, 1.2, 500], center=true);

            translate([-100/2, 0, 0])
            cube([12.8, 1.2, 500], center=true);

            translate([-100/2, 32.5, 0])
            cube([12.8, 1.2, 500], center=true);

            translate([-100/2, -32.5, 0])
            cube([12.8, 1.2, 500], center=true);

            translate([100/2, 111/2, 0])
            _axle_holder();

            translate([100/2, -111/2, 0])
            _axle_holder();

            translate([-100/2, 111/2, 0])
            _axle_holder();

            translate([-100/2, -111/2, 0])
            _axle_holder();
        }
    }

    difference() {
        intersection() {
            hull() {
                translate([0, 220/2 - 30/2, 30/2])
                rotate([0, 90, 0])
                chamfered_cylinder(30, 100, 5, center=true, $fn=40);

                translate([0, -220/2 + 30/2, 30/2])
                rotate([0, 90, 0])
                chamfered_cylinder(30, 100, 5, center=true, $fn=40);

                translate([0, 220/2 - 30/2, 165])
                rotate([0, 90, 0])
                chamfered_cylinder(30, 100, 5, center=true, $fn=40);

                translate([0, -220/2 + 30/2, 165])
                rotate([0, 90, 0])
                chamfered_cylinder(30, 100, 5, center=true, $fn=40);
            }

            translate([0, 0, 165/2])
            cube([100, 220, 165], center=true);
        }

        _inner_cut();
    }
}

module mock_dry_box_lid() {
    module _inner_cut() {
        intersection() {
            hull() {
                translate([0, 220/2 - 110/2, 103 - 110/2 - 2.8])
                rotate([0, 90, 0])
                chamfered_cylinder(
                    110 - 5.6, 100 - 5.6, 3.4, center=true, $fn=40
                );

                translate([0, -220/2 + 110/2, 103 - 110/2])
                rotate([0, 90, 0])
                chamfered_cylinder(
                    110 - 5.6, 100 - 5.6, 3.4, center=true, $fn=40
                );

                translate([0, 220/2 - 30/2, -10])
                rotate([0, 90, 0])
                chamfered_cylinder(
                    30 - 5.6, 100 - 5.6, 3.4, center=true, $fn=40
                );

                translate([0, -220/2 + 30/2, -10])
                rotate([0, 90, 0])
                chamfered_cylinder(
                    30 - 5.6, 100 - 5.6, 3.4, center=true, $fn=40
                );
            }

            translate([0, 0, 103/2 - 1])
            cube([100, 220, 103], center=true);
        }
    
    }

    translate([0, 0, 165])
    difference() {
        intersection() {
            hull() {
                translate([0, 220/2 - 110/2, 103 - 110/2])
                rotate([0, 90, 0])
                chamfered_cylinder(110, 100, 5, center=true, $fn=40);

                translate([0, -220/2 + 110/2, 103 - 110/2])
                rotate([0, 90, 0])
                chamfered_cylinder(110, 100, 5, center=true, $fn=40);

                translate([0, 220/2 - 30/2, -10])
                rotate([0, 90, 0])
                chamfered_cylinder(30, 100, 5, center=true, $fn=40);

                translate([0, -220/2 + 30/2, -10])
                rotate([0, 90, 0])
                chamfered_cylinder(30, 100, 5, center=true, $fn=40);
            }

            translate([0, 0, 103/2])
            cube([100, 220, 103], center=true);
        }

        _inner_cut();
    }
    
}
