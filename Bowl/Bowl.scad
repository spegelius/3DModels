include <../Dollo/NEW_long_ties/include.scad>;

wall = 3;

resolution = 200;


// DEBUG
//_bowl_form();

// single model
//bowl();

// parts
//bowl_1();
//bowl_2();
//bowl_3();
//bowl_4();
bowl_main();
bowl_bottom();
bowl_rim();


module _bowl_form() {
    translate([0,0,99/2]) intersection() {
        difference() {
            sphere(d=100,$fn=resolution);
            sphere(d=100-2*wall,$fn=resolution);
            difference() {
                sphere(d=101,$fn=100);
                translate([0,0,-8]) cylinder(d1=102,d2=0,h=8,$fn=resolution);
                translate([0,0,-100/2-8]) cylinder(d=102,h=100/2,$fn=resolution);
            }
        }
        cylinder(d=105,h=99,center=true);
    }
}

module bowl_rim() {
    translate([0, 0, 99/2])
    translate([0, 0, -8])
    donut(
        100 - wall - 1.3, wall + 0.4,
        $fn=resolution
    );
}

module _bowl_bottom() {
    translate([0, 0, 99/2])
    intersection() {
        translate([0, 0, -100/2 + 4])
        donut(53, 8, $fn=resolution);

        cylinder(d=105, h=99, center=true);
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
            rotate([0, 125, 0])
            cylinder(
                d=7, h=20, center=true, $fn=40
            );
        }
    }
}

module bowl_1() {
    intersection() {
        _bowl_1();
        bowl();
    }
}

module _bowl_2() {
    module _form_2() {
        difference() {
            cylinder(d=30, h=20, center=true, $fn=40);

            translate([0, -30/2 - 5, 0])
            cylinder(d=30, h=20, center=true, $fn=40);

            translate([0, 30/2 + 5, 0])
            cylinder(d=30, h=20, center=true, $fn=40);
        }
    }

    union() {
        for(i=[0:3]) {
            rotate([0, 0, 90*i])
            translate([100/2 - 8, 0, 22])
            rotate([0, 125, 0])
            _form_2();
        }
    }
}

module bowl_2() {
    intersection() {
        difference() {
            _bowl_2();
            _bowl_1();
        }
        bowl();
    }
}

module _bowl_3() {
    module _form_3() {
        difference() {
            cube([10, 10, 20], center=true);
            for(i = [0:3]) {
                rotate([0, 0, 90*i])
                translate([5, 5, 0])
                cylinder(
                    d=2.5, h=20,
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
                rotate([0, 125, 0])
                _form_3();
            }
        }
    }
}

module bowl_3() {
    intersection() {
        _bowl_3();
        bowl();
    }
}

module _bowl_4() {
    module _form_4() {
        difference() {
            cube([20, 20, 20], center=true);
            for(i = [0:3]) {
                rotate([0, 0, 90*i])
                translate([10, 10, 0])
                cylinder(
                    d=5, h=20,
                    center=true, $fn=30
                );
            }
        }
    }

    union() {
        for(i=[0:3]) {
            rotate([0, 0, 90*i + 45])
            translate([100/2 - 8, 0, 22])
            rotate([0, 125, 0])
            _form_4();
        }
    }
}

module bowl_4() {
    intersection() {
        difference() {
            _bowl_4();
            _bowl_3();
        }
        bowl();
    }
}

module bowl_main() {
    difference() {
        _bowl_form();
        bowl_rim();
        _bowl_2();
        _bowl_4();
    }
}
