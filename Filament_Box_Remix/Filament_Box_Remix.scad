use <../Dollo/NEW_long_ties/include.scad>;
use <../lib/bearings.scad>;
use <../Spannerhands_Spool_System_remix/remix.scad>;


stl_base_path = "../_downloaded/";
fb_stl_path = str(
    stl_base_path,
    "Filament Box with integrated filament buffer for MMU/"
);

wall = 2;
d = 30;  // corners
cd = 14;  //small corners
w = 130;
h = 224;
l = 250;
di = d - 2*wall;
wi = w - 2*wall;
hi = h - 2*wall;
cdi = 12 - 2*wall;

//_orig_base();
//_orig_filament_wheel();

//_mock_spool_with_core();

//debug_orig();
debug();
//debug_core_universal();

//filament_wheel();

//core_bearing_bolt();
//core_bearing_mount();
//core_universal();
//core_universal(wings=6);


module _orig_base() {
    //translate([0, 86.6, -2])
    //translate([-119, 303.1, -2])
    translate([-121/2, 86.6 + (303.1 - 86.6)/2, -2])
    rotate([0, 0, -90])
    import (
        str(fb_stl_path, "Base.stl"),
        convexity=10
    );
}

module _orig_filament_wheel() {
    //translate([0, 86.6, -2])
    //translate([-119, 303.1, -2])
    //translate([-121/2, 86.6 + (303.1 - 86.6)/2, -2])
    rotate([-90, 0, 0])
    import (
        str(fb_stl_path, "Filament Wheel.stl"),
        convexity=10
    );
}

module _mock_spool() {
    rotate([0, 90, 0])
    difference() {
        cylinder(d=202, h=90, center=true, $fn=100);
        cylinder(d=50, h=190, $fn=100, center=true);
    }
}

module _mock_spool_with_core() {
    _mock_spool();

    translate([-89/2, 0, 0])
    rotate([0, 90, 0])
    union() {
        core_universal();

        %608zz();

        translate([0, 0, 82])
        %608zz();

        translate([0, 0, -5.6])
        core_bearing_mount();

        translate([0, 0, 89 + 5.6])
        rotate([180, 0, 0])
        core_bearing_mount();

        translate([0, 0, 99/2 - 5])
        rotate([0, 90, 100])
        core_bearing_bolt();
    }
    
}

module debug_orig() {
//    %translate([-6, 0, 202/2 + 20])
//    //_mock_spool();
//    _mock_spool_with_core();

    intersection() {
        _orig_base();

        translate([1000/2, 0, 0])
        cube([1000, 1000, 1000], center=true);
    }
}

module debug() {
    %translate([-w/2 + 57.5, 0, 224/2])
    //_mock_spool();
    _mock_spool_with_core();

    intersection() {
        filament_box_base();

        translate([1000/2 + 0, 0, 0])
        cube([1000, 1000, 1000], center=true);

//        translate([1000/2 + 0, 0, -1000/2 + 65])
//        cube([1000, 1000, 1000], center=true);
    }

//    translate([w/2 - 7.4, -25, 65.3])
//    rotate([0, -90, 0])
//    filament_wheel();

    translate([w/2 - 25.8, -25, 65.3])
    rotate([90, 0, 90])
    filament_wheel_bolt();
}

module debug_core_universal() {
    intersection() {
        core_universal();

//        translate([0, 100/2, 0])
//        cube([100, 100, 300], center=true);
    }

    %608zz();

    translate([0, 0, 82])
    %608zz();

    translate([0, 0, 99/2 - 5])
    rotate([0, 90, 100])
    translate([0, 0, -3.2])
    core_bearing_bolt();

//    translate([0, 0, -5.6])
//    core_bearing_mount();

//    translate([0, 0, 89 + 5.6])
//    rotate([180, 0, 0])
//    core_bearing_mount();

    %tube(57, 20, 1, $fn=50);
}

module _filament_box_form(yd=d, cd=cd, w=w, hh=h) {

    intersection() {
        hull() {
            translate([0, l/2 - 50, d/2 - 2])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, -l/2 + 50, d/2 - 2])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, l/2 - 15, h/2 - 10])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, -l/2 + 15, h/2 - 10])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, l/2 - 15, h/2 + 10])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, -l/2 + 15, h/2 + 10])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, l/2 - 50, h - d/2 + 2])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, -l/2 + 50, h - d/2 + 2])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);
        }

        translate([0, 0, hh/2 + (d - yd)/2])
        cube([1000, 1000, hh], center=true);
    }
}

module _filament_box_inner_form() {

    difference() {
        _filament_box_form(yd=di, cd=cdi, w=wi, hh=hi);

        // edges
        translate([-w/2, 0, h/2 + 10])
        chamfered_cube(14, 400, 18, 5, center=true);

        translate([w/2, 0, h/2 + 10])
        chamfered_cube(14, 400, 18, 5, center=true);

        translate([0, l/2, h/2 + 10])
        chamfered_cube(400, 14, 18, 5, center=true);

        translate([0, -l/2, h/2 + 10])
        chamfered_cube(400, 14, 18, 5, center=true);

        // separating wall
        translate([w/2 - 20.8, 0, 0])
        cube([wall, 400, 1000], center=true);

        // spool core supports
        translate([-w/2, 0, h/2])
        rotate([0, -90, 0])
        difference() {
            chamfered_cylinder(58, 24, 10, center=true, $fn=60);

            translate([0, 0, -24/2 - 2])
            cylinder(d=27.6, h=5, $fn=60);

            translate([0, 0, -24/2 + 5])
            rotate([180, 0, 0])
            hull() {
                cylinder(d=30.4, h=2.8, $fn=60);
                cylinder(d=25.4, h=5.8, $fn=60);
            }
        }

        translate([w/2 - 15, 0, h/2])
        rotate([0, 90, 0])
        difference() {
            chamfered_cylinder(50, 24, 6, center=true, $fn=60);

            translate([0, 0, -24/2 - 2])
            cylinder(d=27.6, h=5, $fn=60);

            translate([0, 0, -5])
            cylinder(d=100, h=20);

            translate([0, 0, -24/2 + 5])
            rotate([180, 0, 0])
            hull() {
                cylinder(d=30.4, h=2.8, $fn=60);
                cylinder(d=25.4, h=5.8, $fn=60);
            }
        }

        // PTFE tube
        translate([w/2 - 31, -45, 42])
        rotate([0, 70, -5])
        rotate([0, 0, -20])
        donut(80, 8, angle=60, $fn=60);

        hull() {
            translate([w/2 - 19, -57, 0])
            rotate([0, 0, -10])
            cube([6, 37, 4], center=true);

            translate([w/2 - 19, -63, 2])
            rotate([-40, 0, 0])
            rotate([0, 0, -13])
            cube([6, 38, 1], center=true);
        }

        // filement wheel stuff
        translate([w/2 - 7, -25, 65.3])
        rotate([0, 90, 0])
        difference() {
            chamfered_cylinder(126, 12, 5, $fn=50);

            difference() {
                translate([0, 0, -12 + 5])
                chamfered_cylinder(110, 12, 5, $fn=50);

                chamfered_cylinder(22, 12, 5, $fn=50);
            }
        }
    }
}

module _filament_box_seal_groove() {
    _offset = 1.5;
    dia1 = cd - 2*_offset;
    dia2 = dia1 - 2*4;

    _x = w/2 - cd/2;
    _y = l/2 - cd/2;

    module _corner1() {
        hull() {
            cylinder(d=dia1, h=1, center=true, $fn=40);
            cylinder(d=dia1 - 2, h=5, center=true, $fn=40);
        }
    }

    module _corner2() {
        hull() {
            cylinder(d=dia2 + 2, h=1, center=true, $fn=40);
            cylinder(d=dia2, h=5, center=true, $fn=40);
        }
    }

    difference() {
        hull() {
            translate([-_x, _y, 0])
            _corner1();

            translate([_x, _y, 0])
            _corner1();

            translate([-_x, -_y, 0])
            _corner1();

            translate([_x, -_y, 0])
            _corner1();
        }

        hull() {
            translate([-_x, _y, 5/2 + 1])
            _corner2();

            translate([_x, _y, 5/2 + 1])
            _corner2();

            translate([-_x, -_y, 5/2 + 1])
            _corner2();

            translate([_x, -_y, 5/2 + 1])
            _corner2();
        }

        hull() {
            translate([-_x, _y, -5/2 - 1])
            _corner2();

            translate([_x, _y, -5/2 - 1])
            _corner2();

            translate([-_x, -_y, -5/2 - 1])
            _corner2();

            translate([_x, -_y, -5/2 - 1])
            _corner2();
        }

        rounded_cube_side(
            w - cd + 2*_offset, l - cd + 2*_offset,
            10, 2*_offset, center=true, $fn=40
        );
    }
}

module filament_box_base() {
    difference() {
        intersection() {
            _filament_box_form();
            cube([1000, 1000, h + 18], center=true);
        }

        _filament_box_inner_form();

        translate([0, 0, h/2 + 18/2 + 0.6])
        _filament_box_seal_groove();
        

        hull() {
            translate([-w/2 + 7 + 2.8/2, 0, h/2 + 1/2])
            cube([2.8, 30.4, 1], center=true);

            translate([-w/2 + 7 + 5.8/2, 0, h/2 + 1/2])
            cube([5.8, 25.4, 1], center=true);

            translate([-w/2 + 7 + 2.8/2, 0, h/2 + 10])
            cube([2.8, 32.4, 1], center=true);

            translate([-w/2 + 7 + 5.8/2, 0, h/2 + 10])
            cube([5.8, 27.4, 1], center=true);
        }

        hull() {
            translate([-w/2 + 10, 0, h/2 + 1/2])
            cube([5, 27.6, 1], center=true);

            translate([-w/2 + 10, 0, h/2 + 10])
            cube([5, 29.6, 1], center=true);
        }

        hull() {
            translate([w/2 - 22 - 2.8/2, 0, h/2 + 1/2])
            cube([2.8, 30.4, 1], center=true);

            translate([w/2 - 22 - 5.8/2, 0, h/2 + 1/2])
            cube([5.8, 25.4, 1], center=true);

            translate([w/2 - 22 - 2.8/2, 0, h/2 + 10])
            cube([2.8, 32.4, 1], center=true);

            translate([w/2 - 22 - 5.8/2, 0, h/2 + 10])
            cube([5.8, 27.4, 1], center=true);
        }

        hull() {
            translate([w/2 - 26, 0, h/2 + 1/2])
            cube([5, 27.6, 1], center=true);

            translate([w/2 - 26, 0, h/2 + 10])
            cube([5, 29.6, 1], center=true);
        }

        translate([w/2 - 31, -45, 42])
        rotate([0, 70, -5])
        rotate([0, 0, -22])
        donut(80, 4.3, angle=60, $fn=60);

        translate([w/2 - 31, -45, 42])
        rotate([0, 70, -5])
        rotate([0, 0, -19])
        donut(80, 2.3, angle=60, $fn=60);

        // wheel stuff
        translate([w/2 - 22, -25, 65.3])
        rotate([0, 90, 0])
        cylinder(d=8.2, h=10, $fn=40);

        translate([w/2 - 8, -25, 65.3])
        rotate([0, 90, 0])
        union() {
            v_screw(
                screw_d=8.3,
                h=7,
                pitch=1.8,
                steps=40,
                direction=0
            );

            translate([-1.8, 0, 7/2])
            chamfered_cube_side(
                5, 4, 7, 0.8, center=true
            );
        }
    }
}

module filament_wheel() {
    //%_orig_filament_wheel();

    %translate([0, 0, 1.8])
    608zz();

    h = 12;

    difference() {
        union() {
            cylinder(d=110, h=h, $fn=140);

            hull() {
                cylinder(d=115, h=0.4, $fn=140);
                cylinder(d=110, h=2.7, $fn=140);
            }

            hull() {
                translate([0, 0, h - 0.4])
                cylinder(d=115, h=0.4, $fn=140);

                translate([0, 0, h - 2.7])
                cylinder(d=110, h=2.7, $fn=140);
            }
        }

        // axle hole
        cylinder(d=8.5, h=h*4, center=true, $fn=40);

        // bearing hole
        translate([0, 0, 1.8])
        difference() {
            cylinder(d=22.5, h=h, $fn=40);

            for(i = [0:5]) {
                rotate([0, 0, i*360/6])
                translate([22.5/2 + 0.5, 0, 0])
                cylinder(d=2, h=30, center=true, $fn=30);
            }
        }

        translate([0, 0, h - 1.7])
        chamfered_cylinder(24, 10, 2, $fn=50);

        // spokes cut
        for(i = [0:5])
        rotate([0, 0, i*360/6])
        translate([0, 0, -1])
        linear_extrude(h=h*4)
        offset(3, $fn=30)
        projection()
        intersection() {
            cylinder(d=110 - 10, h=h*4, center=true, $fn=140);

            hull() {
                translate([0, 19, 0])
                cylinder(d=4, h=h*4, center=true, $fn=10);

                rotate([0, 0, 25])
                translate([0, 110/2, 0])
                cylinder(d=1, h=h*4, center=true, $fn=10);

                rotate([0, 0, -25])
                translate([0, 110/2, 0])
                cylinder(d=1, h=h*4, center=true, $fn=10);
            }
        }
    }
}

module filament_wheel_bolt() {
    h = 24.8;

    intersection() {
        union() {
            translate([0, 0, h - 6])
            v_screw(
                screw_d=8,
                h=6,
                pitch=1.8,
                steps=40,
                direction=0
            );

            translate([0, 0, 1])
            cylinder(d=8, h=h - 7, $fn=50);

            hull() {
                translate([-6, 0, 0])
                chamfered_cylinder(8, 4, 0.6, $fn=40);

                translate([6, 0, 0])
                chamfered_cylinder(8, 4, 0.6, $fn=40);
            }
        }
    }
}

module core_bearing_bolt(h=89) {
    hh = h + 10;
    td = 8 - 4*0.15;
    d = 7.9;

    intersection() {
        translate([0, 0, d/2 - 0.8])
        union() {
            translate([hh/2 - 5, 0, 0])
            rotate([0, 90, 0])
            _threads(
                d=td, h=5.1, z_step=1.8,
                depth=0.5, direction=0,$fn=50
            );

            translate([-hh/2 + 5, 0, 0])
            rotate([0, 90, 180])
            _threads(
                d=td, h=5.1, z_step=1.8,
                depth=0.5, direction=0,$fn=50
            );

            rotate([0, 90, 0])
            cylinder(d=d, h=hh - 10, center=true, $fn=50);

        }

        difference() {
            union() {
                translate([0, 0, 8/2])
                cube([hh - 10, 20, 8], center=true);

                translate([-hh/2, 0, 6.4/2])
                cube([10, 20, 6.4], center=true);

                translate([hh/2, 0, 6.4/2])
                cube([10, 20, 6.4], center=true);
            }

            translate([0, 0, d/2 - 0.8])
            rotate([0, 90, 0])
            cylinder(d=0.2, h=200, center=true, $fn=10);
        }
    }
}

module core_bearing_mount() {

    difference() {
        union() {
            hull() {
                cylinder(d=30, h=2, $fn=50);
                cylinder(d=25, h=5, $fn=50);
            }

            translate([0, 0, 4])
            tube(22, 1.4, 1, $fn=90);

            cylinder(d=11, h=5.6, $fn=70);
        }

        translate([0, 0, 0.6])
        _threads(
            d=8, h=20, z_step=1.8, depth=0.5,
            direction=0, $fn=50
        );
    }
}

module core_bearing_bolt(h=89) {
    hh = h + 10;
    td = 8 - 4*0.15;
    d = 7.9;

    intersection() {
        translate([0, 0, d/2 - 0.8])
        union() {
            translate([hh/2 - 5, 0, 0])
            rotate([0, 90, 0])
            _threads(
                d=td, h=5.1, z_step=1.8,
                depth=0.5, direction=0,$fn=50
            );

            translate([-hh/2 + 5, 0, 0])
            rotate([0, 90, 180])
            _threads(
                d=td, h=5.1, z_step=1.8,
                depth=0.5, direction=0,$fn=50
            );

            rotate([0, 90, 0])
            cylinder(d=d, h=hh - 10, center=true, $fn=50);

            translate([hh/2 - 13, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=10, h=2, center=true, $fn=50);

            translate([-hh/2 + 13, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=10, h=2, center=true, $fn=50);
        }

        difference() {
            union() {
                translate([0, 0, 8/2])
                cube([hh - 10, 20, 8], center=true);

                translate([-hh/2, 0, 6.4/2])
                cube([10, 20, 6.4], center=true);

                translate([hh/2, 0, 6.4/2])
                cube([10, 20, 6.4], center=true);
            }

            translate([0, 0, d/2 - 0.8])
            rotate([0, 90, 0])
            cylinder(d=0.2, h=200, center=true, $fn=10);
        }
    }
}

module _core_universal(h=89, wings=5) {

    module _wing() {
        d = 51;
        wall = 1.3;

        intersection() {
            union() {
                difference() {
                    intersection() {
                        cylinder(d=d, h=h, $fn=80);

                        scale([1, 1.5, 1/0.7])
                        chamfered_cylinder(
                            d, h * 0.7, 3.5, $fn=80
                        );
                    }

                    intersection() {
                        cylinder(
                            d=d - wall*2, h=h*3,
                            center=true, $fn=80
                        );

                        translate([0, 0, -0.01])
                        scale([1, 1.5, 1/0.699])
                        chamfered_cylinder(
                            d - wall*2, h * 0.7, 3.8, $fn=80
                        );
                    }
                }
                translate([d/2 - 2/2, 2/2, 5])
                cylinder(d=2, h=h - 10, $fn=20);
            }

            rounded_cube_side(
                d/2, d/2 + 1, h, 2, $fn=20
            );
        }
    }
    //!_wing();

    module _core() {
        inner_d = 22.5;

        union() {
            difference() {
                cylinder(d=inner_d + 3, h=h, $fn=80);
                cylinder(d=inner_d, h=h*3, center=true, $fn=80);
            }

            translate([0, 0, 7.3 + sqrt(2)/2])
            cube_donut(inner_d, 2, $fn=40);

            translate([0, 0, h - (7.3 + sqrt(2)/2)])
            cube_donut(inner_d, 2, $fn=40);

            for(i = [0:4]) {
                rotate([0, 0, 360/5 * i]) {
                    translate([0, inner_d/2 + 0.2, 7/2])
                    cube([1, 1.2, 7], center=true);

                    translate([
                        0, inner_d/2 + 0.2, h - 7/2
                    ])
                    cube([1, 1.2, 7], center=true);
                }
            }
        }
    }

    intersection() {
        union() {
            _core();
            for(i = [0 : wings - 1]) {
                rotate([0, 0, 360/wings*i])
                translate([1.4, -12.8, 0])
                _wing();
            }
        }
        //chamfered_cylinder(58, h, 4, $fn=60);
    }
}

module core_universal(h=89, wings=5) {
    _core_universal(h=h, wings=wings);
}
