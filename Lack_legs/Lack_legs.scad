use <../Dollo/NEW_long_ties/include.scad>;


//debug();
//debug_leg_portion();

//_leg_portion(200);

//leg_mount();
//leg_1();
//leg_2();
//leg_3();
//foot();
//holk();
holk_big();
//drill_helper();

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

            translate([-1480/2 + 26, -550/2 + 115, 48 - 17.5])
            cylinder(d=7.8, h=18, $fn=20);

            translate([-1480/2 + 26, -550/2 + 51, 48 - 12])
            cylinder(d=4.5, h=15, $fn=20);
        }
    }
    
    //_tabletop();

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
}

module debug_leg_portion() {
    intersection() {
        union() {
            _leg_portion(200);

            translate([0, 0, 200.1])
            _leg_portion(200, rotation=-10);
        }

        translate()
        cube([100,100,1000]);
    }
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
                cube([200,200,20], center=true);
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

module _leg_form(h) {

    twist = h / 100 * 50;

    linear_extrude(
        height = h, center = false, convexity = 10,
        twist = twist, $fn=50)
    circle(d=70, $fn=9);
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

module foot() {
    difference() {
        union() {
            v_screw(h=40, screw_d=38 - 0.5, pitch=3, direction=0,
                steps=100, depth=0.2, chamfer=true);

            _leg_form(20);
            
        }
        cylinder(d=20, h=200, center=true, $fn=50);
    }
}

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

module drill_helper() {
    tube(5, 20, 1.1, $fn=30);
}