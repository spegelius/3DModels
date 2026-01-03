use <../Dollo/NEW_long_ties/include.scad>;

//mock_g9_lamp();
mock_g9_lamp_socket();
//g9_lamp_socket_diy(h=18);
//mock_iec_c8_female_connector();


module mock_g9_lamp() {
    translate([0, 0, -17.2/2])
    difference() {
        union() {
            cube([14.2, 5.2, 17.2], center=true);

            translate([0, 0, 17.2/2])
            cylinder(d=17, h=4.7, $fn=40);

            translate([0, 0, 17.2/2 + 4.7])
            cylinder(d1=16.9, d2=15, h=25, $fn=40);
        }
        translate([0, 2/2 + 1.85, 0])
        cube([10, 2, 17.2], center=true);

        translate([0, -2/2 - 1.85, 0])
        cube([10, 2, 17.2], center=true);

        translate([0, 0, -17/2 + (17.2 - 12.9) - 5/2]) {
            cube([5, 5, 5], center=true);

            translate([0, 3/2 + 1.2/2, 0])
            cube([25, 3, 5], center=true);

            translate([0, -3/2 - 1.2/2, 0])
            cube([25, 3, 5], center=true);
        }
    }
}

module mock_g9_lamp_socket() {
    difference() {
        union() {
            intersection() {
                cylinder(d=24, h=13.5, $fn=40);
                cube([21, 25, 50], center=true);
            }

            intersection() {
                cylinder(d=20.5, h=20, $fn=40);

                rotate([0, 0, -10])
                cube([11.5, 25, 50], center=true);
            }

            rotate([0, 0, -40])
            translate([0, 17/2, -1.5])
            cylinder(d=6.5, h=4, $fn=30);

            rotate([0, 0, -40])
            translate([0, -17/2, -1.5])
            cylinder(d=6.5, h=4, $fn=30);

        }

        rotate([0, 0, 40])
        translate([0, 17/2, 0])
        cylinder(d=3, h=50, center=true, $fn=30);

        rotate([0, 0, 40])
        translate([0, 17/2, 13.5])
        cylinder(d=6, h=20, $fn=30);

        rotate([0, 0, 40])
        translate([0, -17/2, 0])
        cylinder(d=3, h=50, center=true, $fn=30);

        rotate([0, 0, 40])
        translate([0, -17/2, 13.5])
        cylinder(d=6, h=20, $fn=30);

    }
}

module g9_lamp_socket_diy(h=30) {
    
    module _wire_hole(h) {
        hull() {
            cylinder(d=3.3, h=h, $fn=30);
            cylinder(d=0.1, h=h + 4, $fn=30);
        }
    }

    bolt_z = h - 17.2 + 4.3/2;

    difference() {
        intersection() {
            union() {
                cylinder(d=22, h=h, $fn=50);

                translate([14/2 - 3/2, 1, bolt_z])
                rotate([-90, 0, 0])
                cylinder(d=10, h=10, $fn=30);

                translate([-14/2 + 3/2, 1, bolt_z])
                rotate([-90, 0, 0])
                cylinder(d=10, h=10, $fn=30);
            }
            translate([0, 0, h/2])
            cube([23, 23, h], center=true);
        }
        translate([0, 0, h])
        mock_g9_lamp();

        translate([14/2 - 3.3/2, 1.15, -0.1])
        _wire_hole(h - 12);

        translate([-14/2 + 3.3/2, 1.15, -0.1])
        _wire_hole(h-12);

        translate([14/2 - 3/2, 1, bolt_z])
        rotate([-90, 0, 0])
        cylinder(d=2.7, h=10, $fn=20);

        translate([-14/2 + 3/2, 1, bolt_z])
        rotate([-90, 0, 0])
        cylinder(d=2.7, h=10, $fn=20);

        translate([14/2 - 3/2, 6, bolt_z])
        rotate([-90, 0, 0])
        cylinder(d=6.4, h=10, $fn=20);

        translate([-14/2 + 3/2, 6, bolt_z])
        rotate([-90, 0, 0])
        cylinder(d=6.4, h=10, $fn=20);
    }
}

module mock_iec_c8_female_connector() {

    difference() {
        union() {
            translate([0, 0, 3.3/2])
            rounded_cube_side(
                35, 15, 3.3, 3,
                center=true, $fn=30
            );

            hull() {
                translate([8.5/2, 0, -1])
                cylinder(
                    d=12, h=3, $fn=30
                );

                translate([-8.5/2, 0, -1])
                cylinder(
                    d=12, h=3, $fn=30
                );
            }

            hull() {
                translate([8.5/2, 0, 1])
                cylinder(
                    d=11.5, h=16, $fn=30
                );

                translate([-8.5/2, 0, 1])
                cylinder(
                    d=11.5, h=16, $fn=30
                );
            }
        }
        translate([28/2, 0, 0])
        cylinder(d=3.2, h=10, center=true, $fn=20);

        translate([-28/2, 0, 0])
        cylinder(d=3.2, h=10, center=true, $fn=20);
    }
}