
include <../Dollo/NEW_long_ties/include.scad>;


////// VARIABLES //////


////// VIEW DEV //////
//debug();
//debug_raspi_adapter();


////// VIEW PRINT //////
//original_bottom();
//original_top();
//new_bottom();
//new_top_40mm_fan();
//new_top_80mm_fan();
//fan_shroud_80mm();
raspi_adapter();


////// MODULES //////
module original_bottom() {
    translate([0, 100, 0])
    rotate([90, 0, 0])
    import("../_downloaded/MKS_Sbase/sbasebot.stl", convexity=10);
}

module original_top() {
    translate([0, 0, 3])
    rotate([-90, 0, 0])
    import("../_downloaded/MKS_Sbase/sbasetop.stl", convexity=10);
}

module new_bottom() {
    difference() {
        union() {
            intersection() {
                original_bottom();
                cube([157, 110, 8]);
            }
            translate([167, 100, 0])
            rotate([0, 0, 180])
            intersection() {
                original_bottom();
                cube([10, 110, 8]);
            }
            translate([157, 1, 1])
            cube([2, 98, 7]);
        }
        translate([4.5, 4.5, 7]) {
            cylinder(d=2.7, h=100, center=true, $fn=20);
            cylinder(d1=4.4, d2=5.4, h=1, $fn=20);
        }
        translate([4.5, 100 - 4.5, 7]) {
            cylinder(d=2.7, h=100, center=true, $fn=20);
            cylinder(d1=4.4, d2=5.4, h=1, $fn=20);
        }
        translate([162.5, 4.5, 7]) {
            cylinder(d=2.7, h=100, center=true, $fn=20);
            cylinder(d1=4.4, d2=5.4, h=1, $fn=20);
        }
        translate([162.5, 100 - 4.5, 7]) {
            cylinder(d=2.7, h=100, center=true, $fn=20);
            cylinder(d1=4.4, d2=5.4, h=1, $fn=20);
        }
    }
    %translate([33, 17.5, 0])
    cylinder(d=2, h=5, $fn=20);

    %translate([33, 65 + 17.5, 0])
    cylinder(d=2, h=5, $fn=20);
}

module new_top_40mm_fan() {
    
    module _top() {
        union() {
            intersection() {
                original_top();
                cube([152, 110, 5]);
            }
            translate([0, 100, 35.99])
            rotate([180, 0, 0])
            intersection() {
                original_bottom();

                translate([0, 0, 9])
                cube([152, 110, 38]);
            }
            translate([167, 100, 0])
            rotate([0, 0, 180]) {
                intersection() {
                    original_top();
                    cube([15, 110, 5]);
                }
                translate([0, 100, 35.99])
                rotate([180, 0, 0])
                intersection() {
                    original_bottom();

                    translate([0, 0, 9])
                    cube([15, 110, 38]);
                }
            }
            translate([157, 1, 0.99])
            cube([2, 98, 26]);

            translate([4.5, 4.5, 27])
            cylinder(d1=5.3, d2=4.3, h=1, $fn=20);

            translate([4.5, 100 - 4.5, 27])
            cylinder(d1=5.3, d2=4.3, h=1, $fn=20);

            translate([162.5, 4.5, 27])
            cylinder(d1=5.3, d2=4.3, h=1, $fn=20);

            translate([162.5, 100 - 4.5, 27])
            cylinder(d1=5.3, d2=4.3, h=1, $fn=20);
        }
    }
    
    difference() {
        union() {
            intersection() {
                _top();
                cube([180, 110, 12]);
            }
            translate([0, 0, 8])
            intersection() {
                _top();

                translate([0, 0, 4])
                cube([180, 110, 35]);
            }
            translate([3, 98, 2])
            cube([100, 2, 13]);

            translate([100, 10, 0])
            cube([30, 80, 3]);
        }

        translate([59, 97, 15])
        cube([25, 5, 30]);

        translate([4.5, 4.5, 0]) {
            cylinder(d=3.3, h=100, center=true, $fn=20);
            cylinder(d1=6.3, d2=3.3, h=1.5, $fn=20);
        }

        translate([4.5, 100 - 4.5, 0]) {
            cylinder(d=3.3, h=100, center=true, $fn=20);
            cylinder(d1=6.3, d2=3.3, h=1.5, $fn=20);
        }

        translate([162.5, 4.5, 0]) {
            cylinder(d=3.3, h=100, center=true, $fn=20);
            cylinder(d1=6.3, d2=3.3, h=1.5, $fn=20);
        }

        translate([162.5, 100 - 4.5, 0]) {
            cylinder(d=3.3, h=100, center=true, $fn=20);
            cylinder(d1=6.3, d2=3.3, h=1.5, $fn=20);
        }

        linear_extrude(0.4)
        translate([130, 10, 0])
        rotate([180, 0, 90])
        text("MKS SBASE");
    }
}

module new_top_80mm_fan() {
    union() {
        difference() {
            union() {
                new_top_40mm_fan();

                translate([20, 20, 0])
                cube([60, 60, 3]);
            }
            translate([60, 50, 0]) {
                cylinder(d=80, h=10, center=true, $fn=50);

                for (i = [0:3]) {
                    rotate([0, 0, i*360/4])
                    translate([72/2, 72/2, 0])
                    cylinder(
                        d=2.7, h=10, center=true, $fn=30
                    );
                }
            }
        }
        
        translate([60, 50, 0]) {
            cylinder(d=20, h=2, $fn=30);
            translate([0, 0, 2/2])
            cube([2, 90, 2], center=true);

            rotate([0, 0, 45])
            translate([0, 0, 2/2])
            cube([2, 90, 2],center=true);

            rotate([0, 0, 90])
            translate([0, 0, 2/2])
            cube([2, 90, 2], center=true);

            rotate([0, 0, 135])
            translate([0, 0, 2/2])
            cube([2, 90, 2], center=true);

            tube(66, 2, 2, $fn=70);
            tube(50, 2, 2, $fn=55);
            tube(35, 2, 2, $fn=40);
        }
    }
}

module fan_shroud_80mm() {
    
    fins = 12;
    
    union() {
        difference() {
            union() {
                translate([0, 0, 2/2])
                rounded_cube_side(
                    82, 82, 2, 4, center=true
                );

                cylinder(d=86, h=2, $fn=50);
            }
            tube(
                d=80, h=5, center=true, wall=30, $fn=50
            );

            for (i = [0:3]) {
                rotate([0, 0, i*360/4])
                translate([72/2, 72/2, 0]) {
                    cylinder(
                        d=4.5, h=10, center=true, $fn=30
                    );

                    translate([0, 0, 1])
                    cylinder(d2=6, d1=4.5, h=1, $fn=30);
                }
            }
        }
        
        intersection() {
            for(j = [0:fins - 1]) {
                translate([0, 0, 2/2])
                rotate([0, 45, j*360/fins])
                translate([0, 41/2, 0])
                cube([1.5, 41, 6], center=true);
            }
            translate([0, 0, 2/2])
            cube([100, 100, 2], center=true);
        }
    } 
}

module raspi_adapter() {
    h = 7;

    difference() {
        union() {
            hull() {
                cylinder(d=10, h=h, $fn=20);

                translate([0, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([0, 65, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([30, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([105, 65, 0])
                cylinder(d=10,h=h,$fn=20);

                translate([75, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([102.5, 119.5, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([75, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([2.5, 119.5, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([30, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([105, 0, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([105, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([0, 92, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([105, 92, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([2.5, 92, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([2.5, 192, 0])
                cylinder(d=10, h=h, $fn=20);
            }

            hull() {
                translate([102.5, 92, 0])
                cylinder(d=10, h=h, $fn=20);

                translate([102.5, 192, 0])
                cylinder(d=10, h=h, $fn=20);
            }
        }

        cylinder(d=3.3, h=3*h, center=true, $fn=20);
        
        translate([0, 0, h - 2.6])
        M3_nut(3);

        #translate([105, 0, h - 2.6]) {
            cylinder(d=3.3, h=4*h, center=true, $fn=20);
            M3_nut(3);
        }

        translate([0, 65, h - 2.6]) {
            cylinder(d=3.3, h=4*h, center=true, $fn=20);
            M3_nut(3);
        }

        translate([105, 65, h - 2.6]) {
            cylinder(d=3.3, h=4*h, center=true, $fn=20);
            M3_nut(3);
        }

        translate([2.5, 92, h - 3.3]) {
            cylinder(d=4.3, h=4*h, center=true, $fn=20);
            M4_nut(4);
        }

        translate([102.5, 92, h - 3.3]) {
            cylinder(d=4.3, h=4*h, center=true, $fn=20);
            M4_nut(4);
        }

        translate([2.5, 192, h - 3.3]) {
            cylinder(d=4.3, h=4*h, center=true, $fn=20);
            M4_nut(4);
        }

        translate([102.5, 192, h - 3.3]) {
            cylinder(d=4.3, h=4*h, center=true, $fn=20);
            M4_nut(4);
        }
    }
}

module debug() {
    new_bottom();

    translate([0, 100, 43])
    rotate([180, 0, 0]) {
        //new_top_40mm_fan();
        new_top_80mm_fan();
    }
    
    translate([60, 50, 0]) {
        %translate([0, 0, 43 + 25/2])
        cube([80, 80, 25], center=true);

        translate([0, 0, 43 + 27])
        rotate([180, 0, 0])
        fan_shroud_80mm();
    }
}

module debug_raspi_adapter() {
    new_bottom();

    translate([138, 17.5, -1])
    rotate([0, 180, 0])
    raspi_adapter();

    translate([140, 105, 0])
    rotate([0, 0, 90])
    import(
        "../_downloaded/Raspberry Pi 3 2 b/rpi3-bottom_100mm-vesa_netfabb.stl",
       convexity=10
    );
}