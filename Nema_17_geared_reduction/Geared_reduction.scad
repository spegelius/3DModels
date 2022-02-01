include <../Dollo/New_long_ties/include.scad>;
use <../Dollo/snappy-reprap/publicDomainGearV1.1.scad>;
use <../Dollo/New_long_ties/mockups.scad>;

num_teeth_small = 14;
num_teeth_large = 30;
mm_per_tooth = 3.5;
pressure_angle = 18;
s_step = 360/num_teeth_small;
l_step = 360/num_teeth_large;

bearing_hole = 16.5;



//debug_gears();
//debug();

//mock_shaft();

small_gear();
//large_gear();
//bottom();
//cover();
//cover_bearing_holder();


module _m3_bolt(h=6) {
    union() {
        cylinder(d=6, h=0.5, $fn=20);

        translate([0, 0, 0.5])
        cylinder(d1=6, d2=3, h=1.5, $fn=20);

        cylinder(d=3, h=h, $fn=20);
    }
}

module mock_shaft() {
    h = 27 + 2 + 22;
    echo(h);
    difference() {
        cylinder(d=5, h=27 + 2 + 22, $fn=20);

        translate([5/2, 0, 0])
        cube([1, 5, 46], center=true);

        translate([5/2, 0, 31 + 40/2])
        cube([1, 5, 40], center=true);
    }
}

module debug_gears() {

    steps = 0;

    intersection() {
        union() {
            translate([24.7, 0, 0])
            rotate([0, 0, -steps * s_step])
            small_gear();

            rotate([0, 0, l_step/2 + steps * l_step])
            large_gear();
        }

        //cylinder(d=80, h=5);
    }
}

module debug() {
    %translate([0, 0, -20])
    rotate([90, 0, 45])
    mock_stepper_motor(center=true);

    intersection() {
        union() {
            translate([0, 0, 6])
            rotate([0, 0, 45])
            small_gear();

            translate([25, 0, 6])
            rotate([0, 0, -3])
            large_gear();

            bottom();

            translate([0, 0, 27.1])
            rotate([180, 0, 0])
            cover();

            translate([25, 0, 0])
            rotate([0, 0, 87])
            mock_shaft();
        }
        translate([0, 100/2, 0])
        cube([200, 100, 100],center=true);
    }
}

module small_gear() {

    // gear
    twist = 16.85;
    twist_constant = rack_h/2/twist;

    difference() {

        rotate([0, 0, -1.2])
        union() {
            // body
            translate([0, 0, 10.4])
            hull() {
                translate([0, 0, 1/2])
                cylinder(d=18.5, h=6.61);

                cylinder(d=17.5, h=7.61);
            }

            // lower gear half
            intersection() {
                translate([0, 0, 5.4/2 - 0.4])
                gear (
                    mm_per_tooth    = mm_per_tooth,
                    number_of_teeth = num_teeth_small,
                    thickness       = 5.4,
                    hole_diameter   = 2,
                    twist           = -twist,
                    teeth_to_hide   = 0,
                    pressure_angle  = pressure_angle,
                    backlash        = 0
                );
                cylinder(d=30, h=10);
            }

            // upper gear half
            translate([0, 0, 5 + 5.4/2])
            mirror([0, 0, 1])
            gear (
                mm_per_tooth    = mm_per_tooth,
                number_of_teeth = num_teeth_small,
                thickness       = 5.4,
                hole_diameter   = 2,
                twist           = -twist,
                teeth_to_hide   = 0,
                pressure_angle  = pressure_angle,
                backlash        = 0
            );
        }

        translate([0, 0, -2])
        motor_shaft(h=21, extra_slop=0.1, $fn=50);

        translate([0, 0, 14.5])
        rotate([90, 30, 0])
        cylinder(d=3.4, h=30, center=true);

        translate([0, -18.5/2 + 3.5, 14.5])
        rotate([90, 0, 0])
        cylinder(d1=1, d2=7, h=3.5, $fn=30);

        translate([0, 18.5/2 - 3.5, 14.5])
        rotate([-90, 0, 0])
        cylinder(d1=1, d2=7, h=3.5, $fn=30);

        translate([0, -4.2, 14.5 + (8 - 6)/2])
        cube([6, 2, 8], center=true);

        translate([0, 4.2, 14.5 + (8 - 6)/2])
        cube([6, 2, 8], center=true);
    }

    %translate([0, 17/2 + 1.4, 14.5])
    rotate([90, 0, 0])
    _m3_bolt(8);    

    %translate([0, -17/2 - 1.8, 14.5])
    rotate([-90, 0, 0])
    _m3_bolt(8);   
}

module large_gear() {

    l_twist = 7.3;

    difference() {
        union() {
            // body
            translate([0, 0, 10])
            hull() {
                cylinder(d=19, h=6.61);

                cylinder(d=18, h=7.11);
            }

            // lower gear half
            translate([0, 0, 5/2])
            gear (
                mm_per_tooth    = mm_per_tooth,
                number_of_teeth = num_teeth_large,
                thickness       = 5,
                hole_diameter   = 2,
                twist           = l_twist,
                teeth_to_hide   = 0,
                pressure_angle  = pressure_angle,
                backlash        = 0
            );

            // upper gear half
            translate([0, 0, 5 + 5/2])
            mirror([0, 0, 1])
            gear (
                mm_per_tooth    = mm_per_tooth,
                number_of_teeth = num_teeth_large,
                thickness       = 5,
                hole_diameter   = 2,
                twist           = l_twist,
                teeth_to_hide   = 0,
                pressure_angle  = pressure_angle,
                backlash        = 0
            );
        }

        translate([0, 0, -4])
        motor_shaft(h=24, extra_slop=0.1, $fn=50);

        translate([0, 0, 13.5])
        rotate([90, 30, 0])
        cylinder(d=3.4, h=30, center=true);

        translate([0, -19/2 + 3.5, 13.5])
        rotate([90, 0, 0])
        cylinder(d1=1, d2=7, h=3.5, $fn=30);

        translate([0, 19/2 - 3.5, 13.5])
        rotate([-90, 0, 0])
        cylinder(d1=1, d2=7, h=3.5, $fn=30);

        translate([0, -4.6, 13.5 + (8 - 6)/2])
        cube([6, 2, 8], center=true);

        translate([0, 4.6, 13.5 + (8 - 6)/2])
        cube([6, 2, 8], center=true);
    }

    %translate([0, 19/2 + 0.4, 13.5])
    rotate([90, 0, 0])
    _m3_bolt(8);

    %translate([0, -19/2 - 0.9, 13.5])
    rotate([-90, 0, 0])
    _m3_bolt(8);
}

module _bolt_tower(h=20, indent=false, nub=false) {
    union() {
        difference() {
            hull() {
                cylinder(d=10, h=h, $fn=30);

                translate([0, 7 - 0.1/2, h/2])
                cube([10, 0.1, h], center=true);
            }
            if (indent) {
                translate([0, 0, h - 1.6])
                cylinder(d=bolt_hole_dia + 3.3, h=5, $fn=30);
            }
        }
        if (nub) {
            translate([0, 0, h - 1.6])
            cylinder(
                d=bolt_hole_dia + 3, h=1.6 + 1.5,
                $fn=30
            );
        }
    }
}

module _nut_hole(h, bottom=false) {
    translate([0, (10 - 6)/2, 5/2])
    cube([6, 10, 2.2], center=true);

    translate([0, 0, 5/2 + 2.2/2 + 0.2])
    cylinder(d=bolt_hole_dia, h=h, $fn=30);

    if (bottom) {
        translate([0, 0, -5/2])
        cylinder(d=bolt_hole_dia, h=5, $fn=30);
    }
}

module bottom() {
    
    h = 5.6;

    module _bolt_hole() {
        union() {
            hull() {
                translate([-0.5, 0, 0])
                cylinder(d=bolt_hole_dia, h + 2, $fn=20);

                translate([1.5, 0, 0])
                cylinder(d=bolt_hole_dia, h + 2, $fn=20);
            }

            translate([0, 0, h - 1.3])
            hull() {
                translate([-0.5, 0, 0])
                cylinder(
                    d1=bolt_hole_dia,
                    d2=bolt_hole_dia + 4, 2.5, $fn=20
                );

                translate([1.5, 0, 0])
                cylinder(
                    d1=bolt_hole_dia,
                    d2=bolt_hole_dia + 4, 2.5, $fn=20
                );
            }

            translate([0, 0, h - 1.3 + 2.5])
            hull() {
                translate([-0.5, 0, 0])
                cylinder(
                    d1=bolt_hole_dia + 4,
                    d2=bolt_hole_dia + 2, 15, $fn=20
                );

                translate([1.5, 0, 0])
                cylinder(
                    d1=bolt_hole_dia + 4,
                    d2=bolt_hole_dia + 2, 15, $fn=20
                );
            }

        }
    }

    module _bolt_towers() {
        intersection() {
            union() {
                translate([25, 0, 0]) {

                    translate([
                        -motor_bolt_hole_distance/2,
                        motor_bolt_hole_distance/2, 0
                    ])
                    _bolt_tower(10, indent=true);

                    translate([
                        -motor_bolt_hole_distance/2,
                        -motor_bolt_hole_distance/2, 0
                    ])
                    rotate([0, 0, 180])
                    _bolt_tower(10, indent=true);
                }
                translate([
                    -motor_bolt_hole_distance/2 - 1.5,
                    motor_bolt_hole_distance/2, 0
                ])
                rotate([0, 0, 45])
                _bolt_tower(17, indent=true);

                translate([
                    -motor_bolt_hole_distance/2 - 1.5,
                    -motor_bolt_hole_distance/2, 0
                ])
                rotate([0, 0, 135])
                _bolt_tower(17, indent=true);
            }
            translate([26/2 - 1, 0, 20/2])
            chamfered_cube_side(
                motor_side_length + 26,
                motor_side_length, 60, 4.6,
                center=true
            );
        }
    }

    module _main() {
        union() {
            translate([26/2 - 1, 0, h/2])
            chamfered_cube_side(
                motor_side_length + 26,
                motor_side_length, h, 4.6,
                center=true
            );

            translate([0, 0, h/2])
            rotate([0, 0, 45])
            chamfered_cube_side(
                motor_side_length,
                motor_side_length, h, 4.6,
                center=true
            );
        
            _bolt_towers();
        }
    }

    difference() {
        _main();

        // motor hole
        hull() {
            translate([-0.5, 0, 0])
            cylinder(d=22.5, h=20, center=true, $fn=40);

            translate([1.5, 0, 0])
            cylinder(d=22.5, h=20, center=true, $fn=40);
        }


        // shaft bearing hole
        translate([25, 0, 0.6])
        difference() {
            cylinder(d=bearing_hole, h=10, $fn=40);

            for(i = [0:4]) {
                rotate([0, 0, 360/5*i])
                translate([17/2 + 0.2, 0, 0])
                cylinder(d=1.5, h=h, $fn=20);
            }            
        }

        translate([25, 0, -1])
        cylinder(d=bearing_hole - 3, h=10, $fn=60);

        // gear hole
        translate([25, 0, h + 0.01])
        cylinder(d=38, h=50, $fn=40);

        // motor bolt holes
        rotate([0, 0, 45])
        translate([
            motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, -1
        ])
        rotate([0, 0, -45])
        _bolt_hole();

        rotate([0, 0, 45])
        translate([
            -motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, -1
        ])
        rotate([0, 0, -45])
        _bolt_hole();

        rotate([0, 0, 45])
        translate([
            motor_bolt_hole_distance/2,
            -motor_bolt_hole_distance/2, -1
        ])
        rotate([0, 0, -45])
        _bolt_hole();

        rotate([0, 0, 45])
        translate([
            -motor_bolt_hole_distance/2,
            -motor_bolt_hole_distance/2, -1
        ])
        rotate([0, 0, -45])
        _bolt_hole();

        difference() {
            translate([25, 0, 0]) {
                translate([
                    motor_bolt_hole_distance/2,
                    motor_bolt_hole_distance/2, -1
                ])
                rotate([0, 0, -45])
                scale([1.02, 1.02, 1])
                _bolt_tower(h + 3);

                translate([
                    motor_bolt_hole_distance/2,
                    -motor_bolt_hole_distance/2, -1
                ])
                rotate([0, 0, -135])
                scale([1.02, 1.02, 1])
                _bolt_tower(h + 3);
            }

            // gear hole
            translate([25, 0, -1])
            cylinder(d=37.8, h=50, $fn=40);
        }

        // nut holes
        translate([
            25 - motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, -0.1
        ]) {
            cylinder(d=bolt_hole_dia, h=20, $fn=30);
            cylinder(d1=7, d2=bolt_hole_dia, h=2, $fn=30);
        }

        translate([
            25 - motor_bolt_hole_distance/2,
            -motor_bolt_hole_distance/2, -0.1
        ]) {
            cylinder(d=bolt_hole_dia, h=20, $fn=30);
            cylinder(d1=7, d2=bolt_hole_dia, h=2, $fn=30);
        }

        translate([
            -motor_bolt_hole_distance/2 - 1.5,
            motor_bolt_hole_distance/2, 1
        ])
        rotate([0, 0, 45])
        _nut_hole(20, bottom=true);

        translate([
            -motor_bolt_hole_distance/2 - 1.5,
            -motor_bolt_hole_distance/2, 1
        ])
        rotate([0, 0, 135])
        _nut_hole(20, bottom=true);

        translate([25, 0, 0])
        rotate([0, 0, -45])
        translate([28/2, 0, 0])
        cube([1.9, 6, 12], center=true);

        translate([25, 0, 0])
        rotate([0, 0, 45])
        translate([28/2, 0, 0])
        cube([1.9, 6, 12], center=true);

        translate([25, 0, h/2])
        rotate([0, 0, -45])
        translate([22/2, 0, 0])
        rotate([0, 90, 0])
        cylinder(d=bolt_hole_dia, h=20, $fn=30);

        translate([25, 0, h/2])
        rotate([0, 0, 45])
        translate([22/2, 0, 0])
        rotate([0, 90, 0])
        cylinder(d=bolt_hole_dia, h=20, $fn=30);

    }
}

module cover() {
    h = 7;

    module _bolt_towers() {

        intersection() {
            union() {
                translate([25, 0, 0]) {
                    translate([
                        motor_bolt_hole_distance/2,
                        motor_bolt_hole_distance/2, 0
                    ])
                    rotate([0, 0, -45])
                    _bolt_tower(27);

                    translate([
                        motor_bolt_hole_distance/2,
                        -motor_bolt_hole_distance/2, 0
                    ])
                    rotate([0, 0, -135])
                    _bolt_tower(27);

                    translate([
                        -motor_bolt_hole_distance/2,
                        motor_bolt_hole_distance/2, 0
                    ])
                    rotate([0, 0, 0])
                    _bolt_tower(17, nub=true);

                    translate([
                        -motor_bolt_hole_distance/2,
                        -motor_bolt_hole_distance/2, 0
                    ])
                    rotate([0, 0, 180])
                    _bolt_tower(17, nub=true);
                }
                translate([
                    -motor_bolt_hole_distance/2 - 1.5,
                    motor_bolt_hole_distance/2, 0
                ])
                rotate([0, 0, 45])
                _bolt_tower(10, nub=true);

                translate([
                    -motor_bolt_hole_distance/2 - 1.5,
                    -motor_bolt_hole_distance/2, 0
                ])
                rotate([0, 0, 135])
                _bolt_tower(10, nub=true);
            }
            translate([26/2 - 1, 0, 20/2])
            chamfered_cube_side(
                motor_side_length + 26,
                motor_side_length, 60, 4.6,
                center=true
            );
        }
    }

    difference() {
        union() {
            translate([26/2 - 1, 0, h/2])
            chamfered_cube_side(
                motor_side_length + 26,
                motor_side_length, h, 4.6,
                center=true
            );

            _bolt_towers();
        }

        cylinder(d1=19, d2=26, h=h * 3, center=true, $fn=40);

        translate([25, 0, -1])
        cylinder(d=22.2, h=6, $fn=40);

        translate([25, 0, 2])
        cylinder(d=27, h=6, $fn=80);

        translate([25, 0, h + 0.01])
        cylinder(d=38, h=50, $fn=60);

        // tall tower holes
        translate([25, 0, 27 - 5.6/2])
        rotate([0, 0, -45])
        translate([22/2, 0, 0])
        rotate([0, 90, 0]) {
            cylinder(d=bolt_hole_dia, h=20, $fn=30);

            translate([0, 0, 13.9])
            cylinder(d1=bolt_hole_dia, d2=7, h=2, $fn=30);
        }

        translate([25, 0, 27 - 5.6/2])
        rotate([0, 0, 45])
        translate([22/2, 0, 0])
        rotate([0, 90, 0]) {
            cylinder(d=bolt_hole_dia, h=20, $fn=30);

            translate([0, 0, 13.9])
            cylinder(d1=bolt_hole_dia, d2=7, h=2, $fn=30);
        }

        // mount holes
        translate([
            25 + motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, 1
        ])
        rotate([0, 0, -45])
        _nut_hole(15, bottom=true);

        translate([
            25 + motor_bolt_hole_distance/2,
            -motor_bolt_hole_distance/2, 1
        ])
        rotate([0, 0, -135])
        _nut_hole(15, bottom=true);

        translate([
            25 + -motor_bolt_hole_distance/2,
            motor_bolt_hole_distance/2, 1
        ]) {
            _nut_hole(10, bottom=true);

            translate([0, 0, 10])
            cylinder(d=2.8, h=10, $fn=10);
        }

        translate([
            25 + -motor_bolt_hole_distance/2,
            -motor_bolt_hole_distance/2, 1
        ])
        rotate([0, 0, 185]) {
            _nut_hole(7, bottom=true);

            translate([0, 0, 10])
            cylinder(d=2.8, h=10, $fn=10);
        }

        translate([
            -motor_bolt_hole_distance/2 - 1.5,
            motor_bolt_hole_distance/2, -0.1
        ]) {
            cylinder(d=bolt_hole_dia, h=20, $fn=30);
            cylinder(d1=7, d2=bolt_hole_dia, h=2, $fn=30);
        }

        translate([
            -motor_bolt_hole_distance/2 - 1.5,
            -motor_bolt_hole_distance/2, -0.1
        ]) {
            cylinder(d=bolt_hole_dia, h=20, $fn=30);
            cylinder(d1=7, d2=bolt_hole_dia, h=2, $fn=30);
        }
    }
}

module cover_bearing_holder() {
    difference() {
        union() {
            cylinder(d=26.7, h=1, $fn=30);
            cylinder(d=22, h=5, $fn=30);
        }
        // shaft bearing hole
        translate([0, 0, -1])
        difference() {
            cylinder(d=bearing_hole, h=10, $fn=40);

            for(i = [0:4]) {
                rotate([0, 0, 360/5*i])
                translate([17/2 + 0.2, 0, 0])
                cylinder(d=1.5, h=10, $fn=20);
            }            
        }        
    }
}