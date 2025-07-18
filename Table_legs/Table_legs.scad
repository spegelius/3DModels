use <../Dollo/NEW_long_ties/include.scad>;


//////// DEBUG ////////

debug();
//debug_leg_portion();
//debug_small_leg_portion();
//debug_foot();
//debug_leg_mount();
//debug_small_leg_mount();
//debug_small_foot();

//_leg_portion(200);


//////// PRINT ////////
//leg_mount();
//small_leg_mount();

//leg_1();
//leg_2();
//leg_3();
//small_leg_1();
//small_leg_2();
//small_leg_3();

//foot();
//small_foot();

//holk();
//holk_big();
//holk_big_center();
//drill_helper();


//////// MODULES ////////
module debug() {
    module _tabletop() {
        difference() {
            translate([0, 0, 48/2])
            cube([1480, 550, 48], center=true);

            // right side
            translate([1480/2 - 26, 550/2 - 51, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);

            translate([1480/2 - 26, 550/2 - 115, 48 - 17.5])
            cylinder(d=7.8, h=18, $fn=20);

            translate([1480/2 - 26, 0, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);

            translate([1480/2 - 26, -550/2 + 115, 48 - 17.5])
            cylinder(d=7.8, h=18, $fn=20);

            translate([1480/2 - 26, -550/2 + 51, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);

            // left side
            translate([-1480/2 + 26, 550/2 - 51, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);

            translate([-1480/2 + 26, 550/2 - 115, 48 - 17.5])
            cylinder(d=7.8, h=18, $fn=20);

            translate([-1480/2 + 26, 0, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);

            translate([
                -1480/2 + 26, -550/2 + 115, 48 - 17.5
            ])
            cylinder(d=7.8, h=18, $fn=20);

            translate([-1480/2 + 26, -550/2 + 51, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);
        }
    }
    
    _tabletop();

    color("DarkSlateGray")
    render()
    translate([-1480/2 + 25, -550/2 + 25, 48])
    leg_mount();

    color("DarkSlateGray")
    render()
    translate([-1480/2 + 65, -550/2 + 65, 48 + 20 + 210])
    rotate([180,0,0])
    leg_1();

    color("DimGray")
    render()
    translate([-1480/2 + 65, -550/2 + 65, 48 + 20 + 420])
    rotate([180,0,0])
    leg_2();

    color("WhiteSmoke")
    render()
    translate([-1480/2 + 65, -550/2 + 65, 48 + 20 + 630])
    rotate([180,0,0])
    leg_3();

    color("DarkSlateGray")
    render()
    translate([0, -550/2 + 8, 48])
    small_leg_mount();

    color("DarkSlateGray")
    render()
    translate([0, -550/2 + 27, 48 + 15 + 210])
    rotate([180,0,0])
    small_leg_1();

    color("DimGray")
    render()
    translate([0, -550/2 + 27, 48 + 15 + 420])
    rotate([180,0,0])
    small_leg_2();

    color("WhiteSmoke")
    render()
    translate([0, -550/2 + 27, 48 + 15 + 650])
    rotate([180,0,0])
    small_leg_3();
}

module debug_leg_portion() {
    intersection() {
        union() {
            _leg_portion(200);

            translate([0, 0, 200.1])
            _leg_portion(200, rotation=-20);
        }

        cube([100, 100, 1000]);
    }
}

module debug_small_leg_portion() {
    intersection() {
        union() {
            _small_leg_portion(200);

            translate([0, 0, 200.1])
            _small_leg_portion(200, rotation=-40);
        }

        translate([])
        cube([100,100,1000]);
    }
}

module debug_foot() {
    intersection() {
        foot();

        cube([100, 100, 100]);
    }

    translate([0, 0, 21])
    rotate([0, 0, -60])
    leg_3();
}

module debug_leg_mount() {
    intersection() {
        leg_mount();

        translate([24, -10, 0])
        cube([100, 70, 100]);
    }

    translate([40, 40, 20 + 210])
    rotate([180, 0, 0])
    leg_1();
}

module debug_small_leg_mount() {
    intersection() {
        small_leg_mount();

        translate([0, -10, 0])
        cube([100, 30, 100]);
    }

    translate([0, 27 - 8, 15 + 210])
    rotate([0, 180, 0])
    small_leg_1();
}

module debug_small_foot() {
    intersection() {
        small_foot();

        cube([100, 100, 100]);
    }

    translate([0, 0, 5.5])
    rotate([0, 0, 0])
    small_leg_3();
}

module leg_mount() {

    module _main() {
        union() {
            translate([0, 0, -5])
            intersection() {
                hull() {
                    sphere(d=50, $fn=50);

                    translate([100, 0, 0])
                    sphere(d=50, $fn=50);

                    translate([0, 100, 0])
                    sphere(d=50, $fn=50);

                    translate([56, 56, 0])
                    sphere(d=90, $fn=50);
                }

                translate([75, 75, 20/2 + 5])
                cube([200, 200, 20], center=true);
            }
        }
    }

    difference() {
        _main();

        translate([40, 40, 0])
        for(i = [0:2]) {
            rotate([0, 0, i * 120])
            translate([70/2 - 10, 0, -1/2]) {
                M5_nut(6 + 1/2, cone=false, bridging=true);

                translate([0, 0, 5])
                cylinder(d=5.3, h=25, $fn=20);

                translate([0, 0, 20 - 7 + 1/2])
                cylinder(d=13.5, h=8, $fn=20);
            }
        }

        translate([1, 90, 20]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=13.5, h=14, center=true, $fn=20);
        }

        translate([90, 1, 20]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=13.5, h=14, center=true, $fn=20);
        }

        translate([1, 1, 20]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=13.5, h=14, center=true, $fn=20);
        }

        translate([77, 77, 20]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=13.5, h=14, center=true, $fn=20);
        }
    }
}

module small_leg_mount() {
    module _main() {
        union() {
            translate([0, 0, 0])
            intersection() {
                hull() {
                    translate([-40, 0, 5])
                    sphere(d=25, $fn=50);

                    translate([40, 0, 5])
                    sphere(d=25, $fn=50);

                    translate([0, 50, 5])
                    sphere(d=25, $fn=50);
                }

                translate([0, 200/2 - 8, 15/2])
                cube([200, 200, 15], center=true);
            }
        }
    }

    difference() {
        _main();

        translate([0, 27 - 8, 15 - 5])
        for(i = [0:1]) {
            rotate([0, 0, i * 180])
            translate([40/2 - 8, 0, 0])
            cylinder(d=6.5, h=7 + 1/2, $fn=20);
        }

        translate([0, 27 - 8, -1/2]) {
            M5_nut(5+ 1/2, cone=false, bridging=true);

            translate([0, 0, 5])
            cylinder(d=5.3, h=25, $fn=20);

            translate([0, 0, 15 - 5 + 1/2])
            cylinder(d=13.5, h=8, $fn=40);
        }

        translate([40, 0, 16]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=10, h=14, center=true, $fn=20);
        }

        translate([-40, 0, 16]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=10, h=14, center=true, $fn=20);
        }

        translate([0, 49, 16]) {
            cylinder(d=5.5, h=70, center=true, $fn=20);
            cylinder(d=13.5, h=14, center=true, $fn=20);
        }
    }
}

module _leg_form(h) {

    twist = h / 100 * 50;

    linear_extrude(
        height = h, center = false, convexity = 10,
        twist = twist, $fn=50)
    circle(d=70, $fn=9);
}

module _small_leg_form(h) {

    twist = h / 100 * 50;

    linear_extrude(
        height = h, center = false, convexity = 10,
        twist = twist, $fn=50)
    circle(d=40, $fn=6);
}


module _leg_portion(h, rotation=0) {
    union() {
        difference() {
            union() {
                rotate([0, 0, rotation])
                _leg_form(h);

                for(i = [0:2]) {
                    rotate([0, 0, i * 120])
                    translate([70/2 - 10, 0, h])
                    cylinder(d=13, h=6, $fn=20);
                }
            }

            // big hole
            difference() {
                hull() {
                    for(i = [0:2]) {
                        rotate([0, 0, i * 120 + 60])
                        translate([70/2 - 21, 0, -1/2])
                        cylinder(d=30, h=h + 1, $fn=40);
                    }
                }
                for(i = [0:2]) {
                    rotate([0, 0, i * 120])
                    translate([70/2 - 5, 0, -1/2])
                    cylinder(d=25, h=h + 1, $fn=50);
                }
            }

            for(i = [0:2]) {
                rotate([0, 0, i * 120])
                translate([70/2 - 10, 0, -1/2]) {
                    translate([0, 0, 7.25 + 1/2])
                    cylinder(d=5.5, h=h, $fn=20);

                    cylinder(d=13.5, h=7 + 1/2, $fn=20);
                }
            }
        }
    }
}

module _small_leg_portion(h, rotation=0) {
    union() {
        difference() {
            union() {
                rotate([0, 0, rotation])
                _small_leg_form(h);

                for(i = [0:1]) {
                    rotate([0, 0, i * 180])
                    translate([40/2 - 8, 0, h])
                    cylinder(d=6, h=4, $fn=20);
                }

                translate([0, 0, h])
                cylinder(d=13, h=4, $fn=20);
            }


            for(i = [0:1]) {
                rotate([0, 0, i * 180])
                translate([40/2 - 8, 0, -1/2])
                cylinder(d=6.5, h=6 + 1/2, $fn=20);
            }

            translate([0, 0, -1/2]) {
                translate([0, 0, 6.25 + 1/2])
                cylinder(d=5.5, h=h, $fn=20);

                cylinder(d=13.5, h=6 + 1/2, $fn=40);
            }
        }
    }
}

module leg_1() {
    _leg_portion(210);
}

module leg_2() {
    _leg_portion(210, -15);
}

module leg_3() {
    difference() {
        union() {
            _leg_portion(210, -30);

            cylinder(d=59, h=25, $fn=50);
        }

        for(i = [0:2]) {
            rotate([0, 0, i * 120])
            translate([70/2 - 10, 0, -1/2]) {
                translate([0, 0, 7.25 + 1/2])
                cylinder(d=5.5, h=50, $fn=20);
                
                cylinder(d=13, h=7 + 1/2, $fn=20);
            }
        }

        translate([0, 0, -0.1])
        v_screw(h=27, screw_d=38, pitch=3, direction=0,
            steps=100, depth=0.2, chamfer=false);
    }
}

module small_leg_1() {
    _small_leg_portion(210);
}

module small_leg_2() {
    _small_leg_portion(210, -15);
}

module small_leg_3() {

    difference() {
        _small_leg_portion(230, -20);

        difference() {
            cylinder(d=60, h=20);

            cylinder(d1=0, d2=42, h=21, $fn=50);

            intersection() {
                translate([0, 0, -1/2])
                v_screw(h=21, screw_d=37, pitch=3, direction=0,
                steps=100, depth=0.2, chamfer=false);

                cylinder(d1=33, d2=33 + 21 * 2, h=21, $fn=50);
            }
        }
    }
}


module foot() {
    intersection() {
        difference() {
            union() {
                v_screw(
                    h=40, screw_d=38 - 0.5, pitch=3,
                    direction=0, steps=100,
                    depth=0.2, chamfer=true
                );

                difference() {
                    scale([1.15, 1.15, 1])
                    _leg_form(40);

                    translate([0, 0, 20])
                    cylinder(d=70.5, h=25, $fn=160);
                }
                
            }
            cylinder(d=20, h=200, center=true, $fn=50);
        }
        chamfered_cylinder(82, 40, 4, $fn=80);
    }
}

module small_foot() {

    intersection() {
        difference() {
            scale([1.25, 1.25, 1])
            _small_leg_form(40);

            translate([0, 0, 5])
            v_screw(h=40, screw_d=37 + 0.5, pitch=3, direction=0,
            steps=100, depth=0.2, chamfer=true);

            translate([0, 0, 5])
            cylinder(d1=0, d2=40.5, h=20.25, $fn=50);

            translate([0, 0, 25.25])
            cylinder(d=40.5, h=20, $fn=100);

            cylinder(d=20, h=60, center=true, $fn=50);
        }

        chamfered_cylinder(50, 40, 4, $fn=80);
    }
    
}

// for Lack tabletop
module holk() {
    difference() {
        cylinder(d=7.8, h=16, $fn=40);

        v_screw(h=18, screw_d=5, pitch=0.8, direction=0,
                steps=40, depth=0.1, chamfer=false);

        translate([0, 5/2, 0])
        cube([0.6, 5, 40], center=true);

        for(i = [0:34]) {
            translate([0, 0, i + 0.4])
            cube_donut(8, 0.4, $fn=50);
        }
    }
}

module holk_big() {
    difference() {
        cylinder(d=18.2, h=46, $fn=60);

        translate([0, 0, 2])
        v_screw(h=50, screw_d=5.1, pitch=0.8, direction=0,
                steps=40, depth=0.1, chamfer=false);

        for(i = [0:54]) {
            translate([0, 0, i * 1.5 + 0.4])
            cube_donut(18.2, 1, $fn=50);
        }

        for(i = [0: 19]) {
            rotate([0, 0, 360/20 * i])
            translate([18.2/2, 0, 0])
            rotate([0, 0, 45])
            cube([1, 1, 100], center=true);
        }
    }
}

module holk_big_center() {
    intersection() {
        translate([0, 0, -5])
        holk_big();

        cylinder(d=40, h=35.5);
    }
}

// for centering 2.5mm drill bit on 5mm holes
module drill_helper() {
    tube(5, 20, 1.1, $fn=30);
}
