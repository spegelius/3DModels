include <../Dollo/NEW_long_ties/include.scad>;

wall = 3;

resolution = 200;


// DEBUG
//_bowl_form();
//debug();

// single color model
//bowl();

// parts
//bowl_1();
//bowl_2();
//bowl_3();
//bowl_4();
//bowl_main();
//bowl_bottom();
bowl_rim();


module _bowl_form(wall=wall) {
    intersection() {
        translate([0, 0, 99/2])
        difference() {
            translate([0, 0, -6])
            sphere(d=100, $fn=resolution);

            intersection() {
                translate([0, 0, -6])
                sphere(d=100 - 2*wall, $fn=resolution);

                translate([0, 0, -100/2 + wall])
                cylinder(d=200, h=200);
            }

            difference() {
                sphere(d=101, $fn=100);

                translate([0, 0, -8])
                cylinder(d1=102, d2=0, h=8, $fn=resolution);

                translate([0, 0, -100/2 - 8])
                cylinder(d=102, h=100/2, $fn=resolution);
            }
        }
        cylinder(d=200, h=41);
    }
}

module debug() {
    color("white")
    render()
    intersection() {
        bowl_main();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    intersection() {
        bowl_rim();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    intersection() {
        bowl_bottom();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }
}

module bowl_rim() {
    translate([0, 0, 99/2])
    translate([0, 0, -8])
    intersection() {
        donut(
            100 - wall - 0.2, wall + 0.8,
            $fn=resolution
        );

        translate([0, 0, -wall/2 + 0.4])
        cylinder(d=200, h=wall - 0.2);
    }
}

module _bowl_bottom() {
    translate([0, 0, 99/2])
    intersection() {
        hull()
        translate([0, 0, -100/2 + 4])
        donut(58, 8, $fn=resolution);

        difference() {
            cylinder(d=105, h=99, center=true);

            translate([0, 0, -6])
            sphere(d=100 - wall, $fn=resolution);
        }
    }
}

module bowl() {
    union() {
        _bowl_form();
        _bowl_bottom();
        bowl_rim();
    }
}

module bowl_bottom() {
    difference() {
        _bowl_bottom();
        _bowl_form();
    }
}

module _bowl_1() {
    union() {
        for(i=[0:3]) {
            rotate([0, 0, 90*i])
            translate([100/2 - 8, 0, 22])
            scale([1, 1, 0.8])
            rotate([0, 90, 0])
            cylinder(
                d=7, h=20, center=true, $fn=40
            );
        }
    }
}

module bowl_1() {
    difference() {
        intersection() {
            _bowl_1();
            bowl();
        }
        translate([0, 0, 99/2 - 6])
        sphere(d=100 - 2*wall + 2, $fn=resolution);
    }
}

module _bowl_2() {
    module _form_2() {
        difference() {
            cylinder(d=30, h=50, center=true, $fn=40);

            translate([0, -30/2 - 5, 0])
            cylinder(d=30, h=60, center=true, $fn=40);

            translate([0, 30/2 + 5, 0])
            cylinder(d=30, h=60, center=true, $fn=40);
        }
    }

    union() {
        for(i=[0:3]) {
            rotate([0, 0, 90*i])
            translate([100/2 - 8, 0, 22])
            scale([1, 1, 0.8])
            rotate([0, 90, 0])
            _form_2();
        }
    }
}

module bowl_2() {
    difference() {
        intersection() {
            difference() {
                _bowl_2();
                _bowl_1();
            }
            bowl();
        }
        translate([0, 0, 99/2 - 6])
        sphere(d=100 - 2*wall + 2, $fn=resolution);
    }
}

module _bowl_3() {
    module _form_3() {
        difference() {
            cube([10, 10, 50], center=true);
            for(i = [0:3]) {
                rotate([0, 0, 90*i])
                translate([5, 5, 0])
                cylinder(
                    d=2.5, h=60,
                    center=true, $fn=20
                );
            }
        }
    }

    intersection() {
        bowl();
        union() {
            for(i=[0:3]) {
                rotate([0, 0, 90*i + 45])
                translate([100/2 - 8, 0, 22])
                scale([1, 1, 0.85])
                rotate([0, 90, 0])
                _form_3();
            }
        }
    }
}

module bowl_3() {
    difference() {
        intersection() {
            _bowl_3();
            bowl();
        }
        translate([0, 0, 99/2 - 6])
        sphere(d=100 - 2*wall + 2, $fn=resolution);
    }
}

module _bowl_4() {
    module _form_4() {
        difference() {
            cube([20, 20, 50], center=true);
            for(i = [0:3]) {
                rotate([0, 0, 90*i])
                translate([10, 10, 0])
                cylinder(
                    d=5, h=60,
                    center=true, $fn=30
                );
            }
        }
    }

    union() {
        for(i=[0:3]) {
            rotate([0, 0, 90*i + 45])
            translate([100/2 - 8, 0, 22])
            scale([1, 1, 0.85])
            rotate([0, 90, 0])
            _form_4();
        }
    }
}

module bowl_4() {
    difference() {
        intersection() {
            difference() {
                _bowl_4();
                _bowl_3();
            }
            bowl();
        }
        translate([0, 0, 99/2 - 6])
        sphere(d=100 - 2*wall + 2, $fn=resolution);
    }
}

module bowl_main() {
    difference() {
        _bowl_form();
        bowl_rim();
        difference() {
            union() {
                _bowl_2();
                _bowl_4();
            }

            translate([0, 0, 99/2 - 6])
            sphere(d=100 - 2*wall + 2, $fn=resolution);
        }
    }
}
