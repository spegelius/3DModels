use <../Dollo/NEW_long_ties/include.scad>;

w = 60;
l = 140;
h = 30;
wall = 2;

//_mock_power_control();
//_mock_potentiometer();
//_power_control_box_form();
//debug();


//power_control_box();
power_control_box_lid();
//cord_lock();

module _mock_power_control() {
    difference() {
        union() {
            hull() {
                translate([0, (68.2 - 6.8)/2, 0])
                cylinder(d=6.8, h=21.4, $fn=40);

                translate([0, -(68.2 - 6.8)/2, 0])
                cylinder(d=6.8, h=21.4, $fn=40);
            }

            translate([0, 0, 21.4/2])
            rounded_cube_side(
                30.7, 61.7, 21.4, 6.8, center=true, $fn=40
            );

            translate([0, 0, 22.4/2])
            rounded_cube_side(
                26.4, 57.5, 22.4, 6.8, center=true, $fn=40
            );

            for(i = [0:5]) {
                translate([
                    0, 
                    -(46.6 - 5.3)/2 + (46.6 - 5.3)/5 * i,
                    0
                ])
                hull() {
                    translate([(35.3 - 5.3)/2, 0, 0])
                    cylinder(d=5.3, h=21.4, $fn=40);

                    translate([-(35.3 - 5.3)/2, 0, 0])
                    cylinder(d=5.3, h=21.4, $fn=40);
                }
            }
        }

        translate([0, (68.2 - 6.8)/2, 0])
        cylinder(d=3.2, h=70, center=true, $fn=40);

        translate([0, -(68.2 - 6.8)/2, 0])
        cylinder(d=3.2, h=70, center=true, $fn=40);
    }
}

module _mock_potentiometer() {
    difference() {
        union() {
            cylinder(d=17, h=10.6, $fn=30);
            cylinder(d=9.4, h=12.5, $fn=30);
            cylinder(d=6.8, h=19, $fn=30);
            cylinder(d=5.9, h=25.3, $fn=30);

            translate([0, 5, 10.6 - 2.4/2])
            cube([15.4, 13.9, 2.4], center=true);
        }

        translate([0, 0, 10/2 + 21])
        cube([1, 10, 10], center=true);
    }
}

module _cord() {
    hull() {
        translate([-5.5/2 + 3.4/2, 0, 0])
        cylinder(d=3.4, h=200, center=true, $fn=30);

        translate([5.5/2 - 3.4/2, 0, 0])
        cylinder(d=3.4, h=200, center=true, $fn=30);
    }
}

module debug() {
    %translate([0, 5, 4])
    _mock_power_control();

    intersection() {
        power_control_box();

        translate([-100/2, 0, 0])
        cube([100, 200, 100], center=true);
    }

    intersection() {
        translate([0, 0, h + 0.1])
        rotate([0, 180, 0])
        power_control_box_lid();

        translate([-100/2, 80, 0])
        cube([100, 200, 100], center=true);
    }

    %translate([-16, -48, 26])
    rotate([180, 0, 180])
    _mock_potentiometer();

}

module _power_control_box_form() {
    hull() {
        translate([0, 0, (h - 3)/2 + 2])
        rounded_cube_side(
            w, l, h - 3, 10, center=true, $fn=50
        );

        translate([0, 0, h/2])
        rounded_cube_side(
            w - 3, l - 3, h, 6, center=true, $fn=50
        );
    }
}

module power_control_box() {
    module _inner() {
        difference() {
            union() {
                translate([0, 0, h/2 + wall])
                rounded_cube_side(
                    w - 2*wall, l - 2*wall,
                    h, 10 - 2*wall, center=true,
                    $fn=50
                );

                translate([0, 0, h/2 + 20/2])
                cube([200, 200, 20], center=true);
            }

            // corners
            translate([w/2, l/2, 0])
            rounded_cube_side(
                21, 21, h, 6, center=true, $fn=30
            );

            translate([-w/2, l/2, 0])
            rounded_cube_side(
                21, 21, h, 6, center=true, $fn=30
            );

            translate([w/2, -l/2, 0])
            rounded_cube_side(
                21, 21, h, 6, center=true, $fn=30
            );

            translate([-w/2, -l/2, 0])
            rounded_cube_side(
                21, 21, h, 6, center=true, $fn=30
            );

            // potentiometer base
            translate([-16, -48, 0])
            cylinder(d=22, h=17.2);

            translate([-16, -44, 17.2/2])
            cube([20, 15, 17.2], center=true);

            // controller mounts
            translate([-13, 68.2/2 - 1, -1])
            cylinder(d=12, h=8, $fn=40);

            translate([13, -68.2/2 + 10, -1])
            cylinder(d=12, h=8, $fn=40);

            translate([13, 68.2/2 - 1, -1])
            cylinder(d=12, h=8, $fn=40);

            translate([-13, -68.2/2 + 10, -1])
            cylinder(d=12, h=8, $fn=40);

            translate([-17, 1, -1])
            cylinder(d=8, h=8, $fn=40);

            translate([17, 1, -1])
            cylinder(d=8, h=8, $fn=40);

            // cord mount
            translate([0, l/2, -1.4])
            cube([16.3, 17, h], center=true);
            
            translate([0, -l/2, -1.4])
            cube([16.3, 17, h], center=true);
        }
    }

    difference() {
        _power_control_box_form();

        _inner();

        // potentiometer holes
        translate([-16, -48, 26])
        rotate([180, 0, 180])
        scale([1.05, 1.05, 1])
        _mock_potentiometer();

        translate([-16, -48, -1])
        cylinder(d=6.7, h=20, $fn=50);

        // controller
        translate([0, 5, 4])
        linear_extrude(10)
        offset(0.3)
        projection()
        _mock_power_control();

        // screw holes
        translate([w/2 - 7, l/2 - 7, 1])
        cylinder(d=2.7, h=80, $fn=30);

        translate([-w/2 + 7, l/2 - 7, 1])
        cylinder(d=2.7, h=80, $fn=30);

        translate([w/2 - 7, -l/2 + 7, 1])
        cylinder(d=2.7, h=80, $fn=30);

        translate([-w/2 + 7, -l/2 + 7, 1])
        cylinder(d=2.7, h=80, $fn=30);

        // cord hole
        translate([0, 0, h/2])
        rotate([90, 0, 0])
        _cord();

        // cord lock screw holes
        translate([-5.1, -l/2 + 5.5, 1])
        cylinder(d=2.7, h=20, $fn=30);

        translate([5.1, -l/2 + 5.5, 1])
        cylinder(d=2.7, h=20, $fn=30);

        translate([-5.1, l/2 - 5.5, 1])
        cylinder(d=2.7, h=20, $fn=30);

        translate([5.1, l/2 - 5.5, 1])
        cylinder(d=2.7, h=20, $fn=30);
    }
}

module power_control_box_lid() {
    module _inner() {
        difference() {
            union() {
                translate([0, 0, h/2 + wall])
                rounded_cube_side(
                    w - 2*wall, l - 2*wall,
                    h, 10 - 2*wall, center=true,
                    $fn=50
                );

                translate([0, 0, h/2 + 20/2])
                cube([200, 200, 20], center=true);
            }

            // corners
            translate([w/2, l/2, -60/2 + h/2])
            rounded_cube_side(
                21, 21, 60, 6, center=true, $fn=30
            );

            translate([-w/2, l/2, -60/2 + h/2])
            rounded_cube_side(
                21, 21, 60, 6, center=true, $fn=30
            );

            translate([w/2, -l/2, -60/2 + h/2])
            rounded_cube_side(
                21, 21, 60, 6, center=true, $fn=30
            );

            translate([-w/2, -l/2, -60/2 + h/2])
            rounded_cube_side(
                21, 21, 60, 6, center=true, $fn=30
            );

            // potentiometer support
            translate([16, -48, 0])
            tube(10, 3.6, 1.4, $fn=30);

            // controller mounts
            translate([-13, 68.2/2 - 1, -1])
            cylinder(d=12, h=7, $fn=40);

            translate([13, -68.2/2 + 10, -1])
            cylinder(d=12, h=7, $fn=40);

            translate([13, 68.2/2 - 1, -1])
            cylinder(d=12, h=7, $fn=40);

            translate([-13, -68.2/2 + 10, -1])
            cylinder(d=12, h=7, $fn=40);

            translate([0, 1, -1])
            cylinder(d=8, h=5, $fn=40);

            // sides
            translate([-w/2 + 1.25, 0, h/2 + 1])
            //cube([2.5, l - 24, 3], center=true);
            chamfered_cube(
                4, l - 24, 6, 1, center=true
            );

            translate([w/2 - 1.25, 0, h/2 + 1])
            //cube([2.5, l - 24, 3], center=true);
            chamfered_cube(
                4, l - 24, 6, 1, center=true
            );
        }
    }

    difference() {
        _power_control_box_form();

        _inner();

        // top cut
        translate([0, 0, 10/2 + h/2 + 2])
        cube([100, 300, 10], center=true);

        // cord hole
        translate([0, 0, h/2])
        rotate([90, 0, 0])
        _cord();

        // screw holes
        translate([w/2 - 7, l/2 - 7, -1])
        cylinder(d=3.3, h=80, $fn=30);

        translate([-w/2 + 7, l/2 - 7, -1])
        cylinder(d=3.3, h=80, $fn=30);

        translate([w/2 - 7, -l/2 + 7, -1])
        cylinder(d=3.3, h=80, $fn=30);

        translate([-w/2 + 7, -l/2 + 7, -1])
        cylinder(d=3.3, h=80, $fn=30);

        translate([w/2 - 7, l/2 - 7, -1])
        hull() {
            cylinder(d=6.2, h=3, $fn=30);
            cylinder(d=3.3, h=4.4, $fn=30);
        }

        translate([-w/2 + 7, l/2 - 7, -1])
        hull() {
            cylinder(d=6.2, h=3, $fn=30);
            cylinder(d=3.3, h=4.4, $fn=30);
        }

        translate([w/2 - 7, -l/2 + 7, -1])
        hull() {
            cylinder(d=6.2, h=3, $fn=30);
            cylinder(d=3.3, h=4.4, $fn=30);
        }

        translate([-w/2 + 7, -l/2 + 7, -1])
        hull() {
            cylinder(d=6.2, h=3, $fn=30);
            cylinder(d=3.3, h=4.4, $fn=30);
        }

        // sides
        translate([-w/2, 0, h/2 + 5/2])
        cube([4.4, l, 5], center=true);

        translate([w/2, 0, h/2 + 5/2])
        cube([4.4, l, 5], center=true);

        // controller
        translate([0, 5, h - 4])
        rotate([0, 180, 0])
        scale([1.018, 1.013, 1])
        _mock_power_control();
    }

    //%translate([0, 5, h - 4])
    //rotate([0, 180, 0])
    //_mock_power_control();
}

module cord_lock() {
    difference() {
        hull() {
            translate([-17/2 + 7/2, 0, 0])
            cylinder(d=7, h=5, $fn=20);

            translate([17/2 - 7/2, 0, 0])
            cylinder(d=7, h=5, $fn=20);
        }

        translate([0, 0, 5])
        rotate([90, 0, 0])
        _cord();

        translate([5.1, 0, 0])
        cylinder(d=3.2, h=20, center=true, $fn=20);

        translate([-5.1, 0, 0])
        cylinder(d=3.2, h=20, center=true, $fn=20);
    }
}