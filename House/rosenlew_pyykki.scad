use <../Dollo/NEW_long_ties/include.scad>;

// For Rosenlew RTF801

//debug();
//debug_new();


//adjuster_inner_part();
//adjuster_inner_part_supports();

adjuster_inner_part_new();
//adjuster_knob_new();
//adjuster_inner_part_new_supports();
//adjuster_inner_part_new_soluble_supports();


module debug() {

    intersection() {
        adjuster_inner_part();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    intersection() {
        adjuster_inner_part_supports();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    adjuster_inner_part_soluble_supports();
}

module debug_new() {

    intersection() {
        adjuster_inner_part_new();

        translate([0, -100/2, 0])
        cube([100, 100, 100], center=true);
    }

    intersection() {
        adjuster_inner_part_new_supports();

        translate([0, -100/2, 0])
        cube([100, 100, 100], center=true);
    }

    adjuster_inner_part_new_soluble_supports();

    rotate([180, 0, 95])
    adjuster_knob_new();
}

module _center_pillar() {
    difference() {
        union() {
            cylinder(d=20.8, h=32.4, $fn=50);
            cylinder(d=8.8, h=33.8, $fn=50);
        }

        // indent
        translate([0, 0, 32.4 - 12])
        tube(20.8 - 6, 14, 3, $fn=50);

        // screw hole
        cylinder(d=5, h=60, $fn=50);

        // bottom hole
        cylinder(d=16.1, h=13.4*2, center=true, $fn=50);

        // top tooth cuts
        difference() {
            translate([0, 0, 25.3])
            tube(22, 10, 4);

            for(i = [0:4]) {
                rotate([0, 0, 360/5 * i])
                hull() {
                    translate([0, 0, 1/2])
                    cube([25, 2.5, 1], center=true);

                    translate([0, 0, 32.4 - 2.5/2])
                    rotate([0, 90, 0])
                    cylinder(d=2.5, h=50, center=true, $fn=50);
                }
            }

            hull() {
                cylinder(d=0.1, h=32.5, $fn=50);

                translate([0, -10.5, 0])
                cylinder(d=6.4, h=32.5, $fn=50);
            }
        }
    }
}

module adjuster_inner_part() {
    difference() {
        union() {
            cylinder(d=39.4, h=1.8, $fn=50);

            _center_pillar();

            // lock clip
            hull() {
                rotate([0, 0, 1])
                translate([-39.4/2 + 0.8, 0, 0])
                cylinder(d=3, h=1.8, $fn=30);

                rotate([0, 0, 8])
                translate([-39.4/2 + 1, 0, 0])
                cylinder(d=3, h=1.8, $fn=30);
                
                rotate([0, 0, 16])
                translate([-39.4/2 + 1.1, 0, 0])
                cylinder(d=3, h=1.8, $fn=30);
            }

            // lock nub
            rotate([0, 0, 7])
            translate([-37.4/2, 0, 1.8 - 4.6])
            cylinder(d=2.7, h=4.6, $fn=30);

            hull() {
                rotate([0, 0, 7])
                translate([-37.4/2, 0, 1.8 - 3.6])
                cylinder(d=2.7, h=3.6, $fn=30);

                rotate([0, 0, 1])
                translate([-37.4/2, 0, 0])
                cylinder(d=2.7, h=1.8, $fn=30);

            }
        }

        // bottom slots
        intersection() {
            translate([0, 0, -1])
            tube(40, 4, 3.3, $fn=50);

            union() {
                rotate([0, 0, -67])
                hull() {
                    cylinder(d=0.1, h=10, center=true);

                    translate([20, 0, 0])
                    cylinder(d=11, h=10, center=true);
                }

                rotate([0, 0, -67 + 180])
                hull() {
                    cylinder(d=0.1, h=10, center=true);

                    translate([20, 0, 0])
                    cylinder(d=11, h=10, center=true);
                }
            }
        }

        // locking clip cut
        rotate([0, 0, -22])
        translate([-39.4/2 + 3.5/2 + 2.6, 0, 0])
        cylinder(d=3.5, h=10, center=true, $fn=50);

        rotate([0, 0, -2])
        translate([-39.4/2 + 3.5/2 + 2.6, 0, 0])
        cylinder(d=3.5, h=10, center=true, $fn=50);

        rotate([0, 0, -12])
        intersection() {
            translate([0, 0, -1])
            tube(39.4 - 5.2, 10, 3.5, $fn=50);

            hull() {
                cylinder(d=0.1, h=10, center=true);

                translate([-18, 0, 0])
                cylinder(d=6.5, h=10, center=true, $fn=50);
            }
        }

        rotate([0, 0, 4])
        intersection() {
            translate([0, 0, -1])
            tube(39.4 - 6.2, 10, 3, $fn=50);

            hull() {
                cylinder(d=0.1, h=10, center=true);

                translate([-18, 0, 0])
                cylinder(d=5, h=10, center=true, $fn=50);
            }
        }

        translate([-16, -9.8, 0])
        rotate([0, 0, -10])
        cube([2.6, 15, 10], center=true);

        translate([-18, -8.4, 0])
        rotate([0, 0, 9])
        cube([4, 4, 10], center=true);
    }

    // measuring aids
    %translate([-11.8, 10.1])
    rotate([0, 0, -30])
    cube([1, 6.5, 10], center=true);

    %translate([-18.5, -2.8])
    rotate([0, 0, 12])
    cube([1, 7.5, 10], center=true);
}

module adjuster_inner_part_supports() {
    difference() {
        union() {
            translate([0, 0, -2.8])
            cylinder(d=40, h=2.4, $fn=30);

            translate([0, 0, -2.8])
            cylinder(d=15, h=2.8 + 13, $fn=30);
        }

        rotate([0, 0, 7])
        translate([-37.4/2, 0, -3])
        cylinder(d=3, h=4, $fn=30);

        rotate([0, 0, 7])
        translate([-37.4/2, 0, -2.6])
        cylinder(d=4, h=4, $fn=30);

        rotate([0, 0, 3])
        translate([-37.4/2, 0, -1.6])
        cylinder(d=4, h=4, $fn=30);

        hull() {
            translate([0, 0, -3])
            cylinder(d=14, h=3 + 11, $fn=30);

            translate([0, 0, -3])
            cylinder(d=12, h=3 + 12, $fn=30);
        }
    }
}

module adjuster_inner_part_soluble_supports() {
    difference() {
        translate([0, 0, -0.4])
        cylinder(d=40, h=0.4, $fn=50);

        cylinder(d=15.5, h=10, center=true, $fn=50);

        adjuster_inner_part();
    }

    translate([0, 0, 13])
    cylinder(d=16, h=0.4, $fn=50);
}

module adjuster_inner_part_new() {

    module _screw_holes() {
        translate([14, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([14, 0, 2])
        rotate([0, 0, 30])
        M3_nut(4);

        translate([-14, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-14, 0, 2])
        rotate([0, 0, 30])
        M3_nut(4);
    }

    difference() {
        union() {
            intersection() {
                translate([0, 0, -5])
                _center_pillar();

                cylinder(d=40, h=50);
            }

            tube(45, 5, 13, $fn=50);
        }

        rotate([0, 0, 5])
        _screw_holes();
    }
}

module adjuster_knob_new() {
    module _handle() {
        difference() {
            hull() {
                translate([5, 3, 11])
                rotate([90, 0, 0])
                rounded_cylinder(30, 6, 5.5, $fn=50);

                translate([10, 3, 3])
                rotate([90, 0, 0])
                rounded_cylinder(25, 6, 5.5, $fn=50);

                translate([-18, 3, 0])
                rotate([90, 0, 0])
                rounded_cylinder(15, 6, 5.5, $fn=50);
            }

            hull() {
                translate([4, -2, 10])
                rotate([90, 0, 0])
                rounded_cylinder(22, 10, 5, $fn=50);

                translate([2, -2, 0])
                rotate([90, 0, 0])
                rounded_cylinder(28, 10, 5, $fn=50);
            }

            hull() {
                translate([4, 2, 10])
                rotate([-90, 0, 0])
                rounded_cylinder(22, 10, 5, $fn=50);

                translate([2, 2, 0])
                rotate([-90, 0, 0])
                rounded_cylinder(28, 10, 5, $fn=50);
            }

        }
    }

    module _screw_hole() {
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([0, 0, 4])
        chamfered_cylinder(
            7, 10, 2, $fn=30
        );
    }

    difference() {
        intersection() {
            union() {
            
                translate([0, 0, -16])
                scale([1.8, 1.8, 1])
                sphere(d=50, $fn=150);


                _handle();
            }

            cylinder(d=45, h=100, $fn=50);
        }

        translate([0, 14, 0])
        _screw_hole();

        translate([0, -14, 0])
        _screw_hole();
    }
}

module adjuster_inner_part_new_supports() {
    difference() {
        cylinder(d=15, h=8, $fn=30);

        difference() {
            hull() {
                translate([0, 0, 0.2])
                cylinder(d=14, h=6, $fn=30);

                translate([0, 0, 0.2])
                cylinder(d=12, h=7, $fn=30);
            }

            cylinder(d=7, h=25, center=true, $fn=30);
        }
        cylinder(d=6, h=7.2, $fn=30);

        cube([0.1, 12, 0.4], center=true);
    }
}

module adjuster_inner_part_new_soluble_supports() {
    translate([0, 0, 8])
    cylinder(d=16, h=0.4, $fn=50);
}