include <../Dollo/New_long_ties/include.scad>;
use <../Dollo/snappy-reprap/publicDomainGearV1.1.scad>;
use <../Dollo/New_long_ties/mockups.scad>;
use <../lib/bearings.scad>;


// total teeth should be 44
num_teeth_small = 14;
num_teeth_large = 30;
num_teeth_small_2 = 16;
num_teeth_large_2 = 28;

mm_per_tooth = 3.5;
pressure_angle = 18;

function steps_per_t(num_teeth) = 360/num_teeth;

//s_step = 360/num_teeth_small;
//l_step = 360/num_teeth_large;

bearing_hole = 16.25;



//debug_gears();
//debug_gears_2();
//debug();

//mock_shaft();

//small_gear();
//large_gear();
small_gear_2();
//large_gear_2();
//bottom();
//cover();
//cover_bearing_holder();
//large_gear_spacer_bottom();
//large_gear_spacer_top();
//gear_collar_jig();


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
        cylinder(d=5, h=h, $fn=20);

        translate([5/2, 0, 0])
        cube([1, 5, 46], center=true);

        translate([5/2, 0, 31 + 40/2])
        cube([1, 5, 40], center=true);
    }
}

module debug_gears() {

    steps = 0;

    s_step = steps_per_t(num_teeth_small);
    l_step = steps_per_t(num_teeth_large);

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

module debug_gears_2() {

    steps = 0;

    s_step = steps_per_t(num_teeth_small_2);
    l_step = steps_per_t(num_teeth_large_2);

    intersection() {
        union() {
            translate([24.7, 0, 0])
            rotate([0, 0, -steps * s_step])
            small_gear_2();

            rotate([0, 0, l_step/2 + steps * l_step])
            large_gear_2();
        }

        //cylinder(d=80, h=5);
    }
}

module debug() {
    %translate([0.3, 0, -20])
    rotate([90, 0, 45])
    mock_stepper_motor(center=true);

    intersection() {
        union() {
//            translate([0, 0, 6.2])
//            rotate([0, 0, 45])
//            //small_gear();
//            small_gear_2();
//
//            translate([25, 0, 6.2])
//            rotate([0, 0, -3])
//            //large_gear();
//            large_gear_2();

            translate([25, 0, 6.2])
            rotate([0, 0, 180])
            //debug_gears();
            debug_gears_2();

            bottom();

            translate([0, 0, 27.1])
            rotate([180, 0, 0])
            cover();

            translate([25, 0, 0])
            rotate([0, 0, 87])
            mock_shaft();

            translate([25, 0, 24.2])
            cover_bearing_holder();
        }
        translate([0, 100/2, 0])
        cube([200, 100, 100],center=true);
    }

    translate([25, 0, 5.6])
    large_gear_spacer_bottom();

    translate([25, 0, 23.2])
    large_gear_spacer_top();

    %translate([25, 0, 0.6])
    625zz();

    %translate([25, 0, 24.2])
    625zz();
}

module _small_gear(teeth) {

    // gear
    s_twist = 16.85;
    twist_constant = rack_h/2/s_twist;

    difference() {

        rotate([0, 0, -1.2])
        union() {
            // body
            translate([0, 0, 10.4])
            hull() {
                translate([0, 0, 1/2])
                cylinder(d=17.1, h=6.61, $fn=50);

                cylinder(d=16.1, h=7.61, $fn=50);
            }

            // lower gear half
            intersection() {
                translate([0, 0, 5.4/2 - 0.4])
                gear (
                    mm_per_tooth    = mm_per_tooth,
                    number_of_teeth = teeth,
                    thickness       = 5.4,
                    hole_diameter   = 2,
                    twist           = -s_twist,
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
                number_of_teeth = teeth,
                thickness       = 5.4,
                hole_diameter   = 2,
                twist           = -s_twist,
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

module small_gear() {
    _small_gear(num_teeth_small);
}

module small_gear_2() {
    _small_gear(num_teeth_small_2);
}

module _large_gear(teeth) {

    l_twist = 7.3;

    difference() {
        union() {
            // body
            translate([0, 0, 9.9])
            hull() {
                cylinder(d=17.1, h=6.6, $fn=50);
                cylinder(d=16.1, h=7.1, $fn=50);
            }

            // lower gear half
            translate([0, 0, 5/2])
            gear (
                mm_per_tooth    = mm_per_tooth,
                number_of_teeth = teeth,
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
                number_of_teeth = teeth,
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
        cylinder(d=3.1, h=30, $fn=20, center=true);

        translate([0, -19/2 + 3.5, 13.5])
        rotate([90, 0, 0])
        cylinder(d1=1, d2=7, h=3.5, $fn=30);

        translate([0, 19/2 - 3.5, 13.5])
        rotate([-90, 0, 0])
        cylinder(d1=1, d2=7, h=3.5, $fn=30);

        // m3 square nut holes
        translate([0, -4.3, 13.5 + (8 - 6)/2])
        cube([6, 2, 8], center=true);

        translate([0, 4.3, 13.5 + (8 - 6)/2])
        cube([6, 2, 8], center=true);
    }

    %translate([0, 19/2 + 0.4, 13.5])
    rotate([90, 0, 0])
    _m3_bolt(8);

    %translate([0, -19/2 - 0.9, 13.5])
    rotate([-90, 0, 0])
    _m3_bolt(8);
}

module large_gear() {
    difference() {
        _large_gear(num_teeth_large);

        // hex
        for(i = [0:7]) {
            rotate([0, 0, i*360/8])
            translate([11.5, 0, 0])
            cylinder(d=5.5, h=40, center=true, $fn=6);
        }
    }
}

module large_gear_2() {
    difference() {
        _large_gear(num_teeth_large_2);

        // hex
        for(i = [0:7]) {
            rotate([0, 0, i*360/8])
            translate([0, 10.9, 0])
            cylinder(d=5, h=40, center=true, $fn=6);
        }
    }
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

        // motor hole chamfer
        hull() {
            translate([-0.5, 0, 0])
            cylinder(
                d1=18, d2=25, h=12,
                center=true, $fn=40
            );

            translate([1.5, 0, 0])
            cylinder(
                d1=18, d2=25, h=12,
                center=true, $fn=40
            );
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
            cylinder(d=27, h=1, $fn=40);
            cylinder(d=22.2, h=5.2, $fn=40);
        }
        // shaft bearing hole
        translate([0, 0, -1])
        difference() {
            chamfered_cylinder(
                bearing_hole, 6.3, 0.5, $fn=60
            );

            for(i = [0:4]) {
                rotate([0, 0, 360/5*i])
                translate([17/2 + 0.2, 0, 0])
                cylinder(d=1.5, h=10, $fn=20);
            }            
        }        
    }
}

module large_gear_spacer_bottom() {
     tube(8.3, 0.6, (8.3 - 5.2)/2, $fn=60);
}

module large_gear_spacer_top() {
     tube(8.3, 1, (8.3 - 5.2)/2, $fn=60);
}

module gear_collar_jig() {
    difference() {
        union() {
            cylinder(d=35, h=12);

            translate([0, 0, 12/2])
            cube([23, 50, 12], center=true);
        }

        cylinder(d=10, h=30, center=true);

        translate([0, 0, 5])
        tube(19.1, 8, 1.1, $fn=50);

        translate([0, 0, 12 - 3.5])
        rotate([90, 0, -20])
        cylinder(d=2, h=60, $fn=15);

        translate([0, 0, 12 - 3.5])
        rotate([90, 0, 20])
        cylinder(d=3, h=60, $fn=20);

        translate([0, 0, 12 - 3.5])
        rotate([90, 0, 200])
        cylinder(d=2, h=60, $fn=15);

        translate([0, 0, 12 - 3.5])
        rotate([90, 0, 160])
        cylinder(d=3, h=60, $fn=20);


        translate([14/2 + 17/2, 0, 10/2 + 4.8])
        cube([14, 5, 10], center=true);

        translate([-14/2 - 17/2, 0, 10/2 + 4.8])
        cube([14, 5, 10], center=true);

    }
}