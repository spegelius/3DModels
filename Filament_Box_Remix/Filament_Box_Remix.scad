use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
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
//w = 129; // 90mm spool
w = 111; // 72mm spool
h = 224;
l = 250;
di = d - 2*wall;
wi = w - 2*wall;
hi = h - 2*wall;
cdi = 12 - 2*wall;

//_orig_base();
//_orig_filament_wheel();

//_mock_spool_with_core(width=90);
//_mock_spool_with_core(width=72);

//debug_orig();
//debug_base();
//debug_lid();
//debug_lid_old();
//debug_core_universal();

//filament_box_base();
//filament_box_lid();
//filament_box_lid(window="old");
//filament_box_seal();

//filament_box_clip();
//filament_box_clip(gap=18.5);

//filament_wheel();
//filament_wheel_bolt();

//window_frame();
//window_frame_seal();
//humidity_window_back_frame();
//humidity_window_back_frame_round();

//window_drill_jig_1();
//window_drill_jig_2();

//core_bearing_bolt(h=89);  // 90mm spool
//core_bearing_bolt(h=71);  // 72mm spool
//core_bearing_mount();
core_universal(h=89, wall=1.4);  // 90mm spool
//core_universal(h=71);  // 72mm spool


//ptfe_connector_mount_m10();
//ptfe_connector_mount_m10_seal();


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

module _mock_spool(width=90) {
    rotate([0, 90, 0])
    difference() {
        cylinder(d=202, h=width, center=true, $fn=100);
        cylinder(d=50, h=190, $fn=100, center=true);
    }
}

module _mock_spool_with_core(width=90) {
    _mock_spool(width=width);

    cw = width - 1;

    translate([-cw/2, 0, 0])
    rotate([0, 90, 0])
    union() {
        core_universal(h=cw);

        %608zz();

        translate([0, 0, width - 8])
        %608zz();

        translate([0, 0, -5.6])
        core_bearing_mount();

        translate([0, 0, cw + 5.6])
        rotate([180, 0, 0])
        core_bearing_mount();

        translate([0, -8/2, cw/2 + 5/2])
        rotate([0, 90, 100])
        core_bearing_bolt(h=cw);
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

module debug_base() {
    sw = w - 39;
    %translate([-w/2 + sw/2 + 12.5, 0, 224/2])
    _mock_spool_with_core(width=sw);

    intersection() {
        filament_box_base();

        translate([1000/2 + 0, 0, 0])
        cube([1000, 1000, 1000], center=true);

//        translate([1000/2 + 46, 0, 0])
//        cube([1000, 1000, 1000], center=true);

//        translate([1000/2 + 0, 0, -1000/2 + 65])
//        cube([1000, 1000, 1000], center=true);

//        translate([1000/2 + 0, 0, 0])
//        cube([1000, 1000, h + 4], center=true);
    }

    translate([w/2 - 7.4, -25, 65.3])
    rotate([0, -90, 0])
    filament_wheel();

    translate([w/2 - 24.8, -25, 65.3])
    rotate([90, 0, 90])
    filament_wheel_bolt();

    translate([w/2 - 13, -l/2, h/2 + 1])
    rotate([90, 0, 0])
    ptfe_connector_mount_m10();

//    translate([0, -l/2, h/2 + 18/2])
//    rotate([90, 0, -90])
//    filament_box_clip();
}


module debug_lid() {
    intersection() {
        filament_box_lid();

//        translate([1000/2 + 0, 0, 0])
//        cube([1000, 1000, 1000], center=true);
    }

    translate([0, 0, (h + 18)/2 + 1])
    color("lightgrey")
    filament_box_seal();

    translate([-7, 0, h + 3.4])
    rotate([0, 180, 0])
    window_frame();

    translate([0, -98, h - 40])
    rotate([66.4, 0, 0])
    translate([0, 0, 9])
    rotate([0, 180, 0])
    window_frame();

    translate([0, -98, h - 40])
    rotate([66.4, 0, 0])
    translate([0, 0, 3])
    rotate([180, 0, 0])
    humidity_window_back_frame();
}

module debug_lid_old() {
    render()
    intersection() {
        filament_box_lid(window="old");

        translate([1000/2 + 0, 0, 0])
        cube([1000, 1000, 1000], center=true);
    }

    translate([0, 0, (h + 18)/2 + 1])
    color("lightgrey")
    filament_box_seal();

    translate([-7, 0, h + 3.4])
    rotate([0, 180, 0])
    _window_frame();

    translate([0, -98, h - 40])
    rotate([66.4, 0, 0])
    translate([0, 0, 9])
    rotate([0, 180, 0])
    window_frame();

    translate([0, -98, h - 40])
    rotate([66.4, 0, 0])
    translate([0, 0, 3])
    rotate([180, 0, 0])
    humidity_window_back_frame();
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

    %tube(52, 20, 1, $fn=50);

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

            translate([0, l/2 - 15, h/2 + 19])
            rotate([0, 90, 0])
            rounded_cylinder(yd, w, cd, center=true, $fn=60);

            translate([0, -l/2 + 15, h/2 + 19])
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

module _filament_box_inner_form(window="new") {

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
        translate([w/2 - 19.8, 0, 0])
        cube([wall, 400, 1000], center=true);

        // pillars
        hull() {
            translate([w/2 - 22.8, 0, h + 20])
            cube([3, 9, h], center=true);

            translate([w/2 - 19.8, 0, h + 20])
            cube([wall, 12, h], center=true);
        }

        hull() {
            translate([-w/2 + 3.8, 0, h + 20])
            cube([3, 9, h], center=true);

            translate([-w/2, 0, h + 20])
            cube([wall, 12, h], center=true);
        }

        hull() {
            translate([w/2 - 22.8, 0, -16])
            cube([3, 9, h], center=true);

            translate([w/2 - 19.8, 0, -16])
            cube([wall, 12, h], center=true);
        }

        hull() {
            translate([-w/2 + 3.8, 0, -16])
            cube([3, 9, h], center=true);

            translate([-w/2, 0, -16])
            cube([wall, 12, h], center=true);
        }

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
                cylinder(d=22.4, h=5.8, $fn=60);
            }
        }

        translate([w/2 - 14, 0, h/2])
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
                cylinder(d=22.4, h=5.8, $fn=60);
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

        // filament wheel stuff
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

        // clip holes
        hull() {
            translate([0, -l/2 + 3, (h + 18)/2 - 8])
            rotate([0, 90, 0])
            cylinder(d=10, h=60, center=true, $fn=30);

            translate([0, -l/2 + 3 - 60/2 + 10/2, (h + 18)/2 - 51])
            cube([60, 60, 1], center=true);
        }

        hull() {
            translate([0, l/2 - 3, (h + 18)/2 - 8])
            rotate([0, 90, 0])
            cylinder(d=10, h=60, center=true, $fn=30);

            translate([0, l/2 - 3 + 60/2 - 10/2, (h + 18)/2 - 51])
            cube([60, 60, 1], center=true);
        }

        hull() {
            translate([0, -l/2 + 3, (h + 18)/2 + 10])
            rotate([0, 90, 0])
            cylinder(d=10, h=60, center=true, $fn=30);

            translate([0, -l/2 + 3 - 60/2 + 10/2, (h + 18)/2 + 53])
            cube([60, 60, 1], center=true);
        }

        hull() {
            translate([0, l/2 - 3, (h + 18)/2 + 10])
            rotate([0, 90, 0])
            cylinder(d=10, h=60, center=true, $fn=30);

            translate([0, l/2 - 3 + 60/2 - 10/2, (h + 18)/2 + 53])
            cube([60, 60, 1], center=true);
        }

        // window reinforcement
        if (window == "new") {
            translate([-7, 0, h])
            rounded_cube_side(64, 64, 10, 13, center=true, $fn=30);
        } else {
            translate([-7, 0, h])
            rounded_cube_side(60, 60, 10, 11, center=true, $fn=30);
        }

        // ptfe out
        hull() {
            translate([w/2 - 25/2, -l/2, h/2 + 18/2 - 10/2])
            cube([25, 20, 10], center=true);

            translate([w/2 - 20/2, -l/2, h/2 + 18/2 - 18])
            cube([20, 2, 1], center=true);
        }
    }
}

module filament_box_base() {
    difference() {
        union() {
            intersection() {
                _filament_box_form();

                union() {
                    cube([1000, 1000, h + 18], center=true);

                    translate([w/2 - 20.8, 0, 0])
                    cube([wall, l - 14, h + 19.6], center=true);
                }
            }

            hull() {
                translate([w/2 - 4, -l/2, h/2 + 1])
                rotate([-90, 0, 0])
                cylinder(d=8, h=5, $fn=40);

                translate([w/2 - 10, -l/2, h/2 + 1])
                rotate([-90, 0, 0])
                cylinder(d=11, h=5, $fn=40);
            }
        }

        _filament_box_inner_form();

        translate([0, 0, h/2 + 18/2 + 1/2])
        _filament_box_seal_groove();

        // core supports
        hull() {
            translate([-w/2 + 7 + 2.8/2, 0, h/2 + 1/2])
            cube([2.8, 30.4, 1], center=true);

            translate([-w/2 + 7 + 5.8/2, 0, h/2 + 1/2])
            cube([5.8, 22.4, 1], center=true);

            translate([-w/2 + 7 + 2.8/2, 0, h/2 + 10])
            cube([2.8, 32.4, 1], center=true);

            translate([-w/2 + 7 + 5.8/2, 0, h/2 + 10])
            cube([5.8, 24.4, 1], center=true);
        }

        hull() {
            translate([-w/2 + 10, 0, h/2 + 1/2])
            cube([5, 27.6, 1], center=true);

            translate([-w/2 + 10, 0, h/2 + 10])
            cube([5, 29.6, 1], center=true);
        }

        hull() {
            translate([w/2 - 21 - 2.8/2, 0, h/2 + 1/2])
            cube([2.8, 30.4, 1], center=true);

            translate([w/2 - 21 - 5.8/2, 0, h/2 + 1/2])
            cube([5.8, 22.4, 1], center=true);

            translate([w/2 - 21 - 2.8/2, 0, h/2 + 10])
            cube([2.8, 32.4, 1], center=true);

            translate([w/2 - 21 - 5.8/2, 0, h/2 + 10])
            cube([5.8, 24.4, 1], center=true);
        }

        hull() {
            translate([w/2 - 25, 0, h/2 + 1/2])
            cube([5, 27.6, 1], center=true);

            translate([w/2 - 25, 0, h/2 + 10])
            cube([5, 29.6, 1], center=true);
        }

        translate([w/2 - 31, -45, 42])
        rotate([0, 70, -5])
        rotate([0, 0, -22])
        donut(80, 4.55, angle=60, $fn=60);

        translate([w/2 - 31, -45, 42])
        rotate([0, 70, -5])
        rotate([0, 0, -19])
        donut(80, 3.8, angle=60, $fn=60);

        // wheel stuff
        translate([w/2 - 22, -25, 65.3])
        rotate([0, 90, 0])
        cylinder(d=8.2, h=10, $fn=40);

        translate([w/2 - 8, -25, 65.3])
        rotate([0, 90, 0])
        union() {
            v_screw(
                screw_d=8.3,
                h=7.1,
                pitch=1.8,
                steps=40,
                direction=0
            );

            translate([-1.8, 0, 7/2])
            chamfered_cube_side(
                5, 4, 7, 0.8, center=true
            );
        }

        hull() {
            translate([w/2 - 19, -40, h/2])
            rotate([0, 90, 0])
            cylinder(d=15, h=20, center=true, $fn=40);

            translate([w/2 - 19, -40, h/2 + 20])
            rotate([0, -90, 0])
            cylinder(d=22, h=20, center=true, $fn=40);

        }

        // clip holes
        hull() {
            translate([0, -l/2 + 3, (h + 18)/2 - 9.2])
            rotate([0, 90, 0])
            cylinder(d=6, h=56, center=true, $fn=30);

            translate([0, -l/2 + 3, (h + 18)/2 - 6])
            rotate([0, 90, 0])
            cylinder(d=1, h=56, center=true, $fn=30);

            translate([0, -l/2 + 3 - 60/2 + 6/2, (h + 18)/2 - 52])
            cube([56, 60, 1], center=true);
        }

        translate([0, -l/2, (h + 18)/2 - 9])
        cube([56, 5, 4], center=true);

        hull() {
            translate([0, l/2 - 3, (h + 18)/2 - 9.2])
            rotate([0, 90, 0])
            cylinder(d=6, h=56, center=true, $fn=30);

            translate([0, l/2 - 3, (h + 18)/2 - 6])
            rotate([0, 90, 0])
            cylinder(d=1, h=56, center=true, $fn=30);

            translate([0, l/2 - 3 + 60/2 - 6/2, (h + 18)/2 - 52])
            cube([56, 60, 1], center=true);
        }

        translate([0, l/2, (h + 18)/2 - 9])
        cube([56, 5, 4], center=true);

        // ptfe out
        translate([w/2 - 13, -l/2 + -.4, 200/2 + h/2 + 1])
        rotate([0, 90, 0])
        union() {
            donut(200, 10.3, angle=3.5, $fn=80);
            donut(200, 4.4, angle=10.2, $fn=80);
            donut(200, 3.5, angle=15, $fn=80);
        }

        translate([w/2 - 4, -l/2, h/2 + 1])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=15, center=true, $fn=30);

        translate([w/2 - 22, -l/2, h/2 + 1])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=15, center=true, $fn=30);
    }

    // supports
    translate([0, -l/2 + 1, (h/2 + 18/2) - 8 - 0.3/2])
    cube([57, 2, 0.3], center=true);

    translate([0, -l/2 + 0.5, (h/2 + 18/2) - 8 + 0.8/2])
    cube([55, 1, 0.8], center=true);

    translate([0, l/2 - 1, (h/2 + 18/2) - 8 - 0.3/2])
    cube([57, 2, 0.3], center=true);

    translate([0, l/2 - 0.5, (h/2 + 18/2) - 8 + 0.8/2])
    cube([55, 1, 0.8], center=true);
}

module filament_box_lid(window="new") {
    difference() {
        difference() {
            _filament_box_form();

            difference() {
                cube([1000, 1000, h + 22], center=true);

                translate([w/2 - 20.8, 0, (h + 22)/2])
                cube([wall, l - 14, 1.6], center=true);
            }
        }

        _filament_box_inner_form(window=window);

        translate([0, 0, h/2 + 22/2 - 1/2])
        _filament_box_seal_groove();

        // clip holes
        hull() {
            translate([0, -l/2 + 3, (h + 18)/2 + 11.2])
            rotate([0, 90, 0])
            cylinder(d=6, h=56, center=true, $fn=30);

            translate([0, -l/2 + 3, (h + 18)/2 + 8])
            rotate([0, 90, 0])
            cylinder(d=1, h=56, center=true, $fn=30);

            translate([0, -l/2 + 3 - 60/2 + 6/2, (h + 18)/2 + 54])
            cube([56, 60, 1], center=true);
        }

        translate([0, -l/2, (h + 18)/2 + 11])
        cube([56, 5, 4], center=true);

        hull() {
            translate([0, l/2 - 3, (h + 18)/2 + 11.2])
            rotate([0, 90, 0])
            cylinder(d=6, h=56, center=true, $fn=30);

            translate([0, l/2 - 3, (h + 18)/2 + 8])
            rotate([0, 90, 0])
            cylinder(d=1, h=56, center=true, $fn=30);

            translate([0, l/2 - 3 + 60/2 - 6/2, (h + 18)/2 + 54])
            cube([56, 60, 1], center=true);
        }

        translate([0, l/2, (h + 18)/2 + 11])
        cube([56, 5, 4], center=true);

        // window holes
        if (window == "new") {
            translate([-7, 0, h])
            rounded_cube_side(
                49, 49, 10, 4, center=true, $fn=30
            );

            hull() {
                translate([-7, 0, h - 1])
                rounded_cube_side(
                    49, 49, 1, 4, center=true, $fn=30
                );

                translate([-7, 0, h - 5])
                rounded_cube_side(
                    51, 51, 1, 5, center=true, $fn=30
                );
            }

            translate([-7, 0, h])
            for (i = [0:3]) {
                rotate([0, 0, i*90])
                translate([27, 27, 0])
                cylinder(d=2.8, h=12, center=true, $fn=20);

                rotate([0, 0, i*90])
                translate([29, 0, 0])
                cylinder(d=2.8, h=12, center=true, $fn=20);
            }
        } else {
            translate([-7, 0, h])
            rounded_cube_side(
                42, 42, 10, 4, center=true, $fn=30
            );

            hull() {
                translate([-7, 0, h - 1])
                rounded_cube_side(
                    42, 42, 1, 4, center=true, $fn=30
                );

                translate([-7, 0, h - 5])
                rounded_cube_side(
                    44, 44, 1, 5, center=true, $fn=30
                );
            }

            translate([-7, 0, h])
            for (i = [0:3]) {
                rotate([0, 0, i*90])
                translate([25, 25, 0])
                cylinder(d=2.8, h=12, center=true, $fn=20);

                rotate([0, 0, i*90])
                translate([26, 0, 0])
                cylinder(d=2.8, h=12, center=true, $fn=20);
            }
        }

        // humidity meter hole
        translate([0, -98, h - 40])
        rotate([66.4, 0, 0]) {
            rounded_cube_side(50, 50, 10, 2, center=true, $fn=30);

            for (i = [0:3]) {
                rotate([0, 0, i*90])
                translate([27, 27, 0])
                cylinder(d=3.3, h=12, center=true, $fn=20);

                rotate([0, 0, i*90])
                translate([29, 0, 0])
                cylinder(d=3.3, h=12, center=true, $fn=20);
            }
        }
    }

    // supports
    translate([0, -l/2 + 1, (h/2 + 18/2) + 10 + 0.3/2])
    cube([57, 2, 0.3], center=true);

    translate([0, -l/2 + 0.5, (h/2 + 18/2) + 10 - 0.8/2])
    cube([55, 1, 0.8], center=true);

    translate([0, l/2 - 1, (h/2 + 18/2) + 10 + 0.3/2])
    cube([57, 2, 0.3], center=true);

    translate([0, l/2 - 0.5, (h/2 + 18/2) + 10 - 0.8/2])
    cube([55, 1, 0.8], center=true);
}

module filament_box_clip(gap=17.5) {

    difference() {
        union() {
            translate([-3, -gap/2, 0])
            cylinder(d=5, h=54, center=true, $fn=30);

            translate([-3, gap/2, 0])
            cylinder(d=5, h=54, center=true, $fn=30);

            translate([0, -10.75, 0])
            intersection() {
                tube(8, 54, 2, center=true, $fn=30);

                translate([0, -10/2 + 0.4, 0])
                cube([10, 10, 100], center=true);
            }

            translate([101.64, -2.85, 0])
            intersection() {
                tube(200, 54, 2, center=true, $fn=90);

                translate([-100, 12.5, 0])
                cube([19.4, 40, 100], center=true);
            }

            hull() {
                translate([-3, 9.25, 0])
                cylinder(d=2, h=54, center=true, $fn=30);

                translate([4, 14.25, 0])
                cylinder(d=2, h=54, center=true, $fn=30);
            }

            translate([8.4, 29.25, 0])
            cylinder(d=4, h=54, center=true, $fn=30);
        }

        translate([-3, -gap/2, 0])
        cylinder(d=2, h=100, center=true, $fn=30);

        translate([-3, gap/2, 0])
        cylinder(d=2, h=100, center=true, $fn=30);

    }
}

module _filament_box_seal_groove(h=5) {
    _offset = 1.5;
    dia1 = cd - 2*_offset;
    dia2 = dia1 - 2*4;

    _x = w/2 - cd/2;
    _y = l/2 - cd/2;

    module _corner1() {
        hull() {
            cylinder(d=dia1, h=h - 4, center=true, $fn=40);
            cylinder(d=dia1 - 2, h=h, center=true, $fn=40);
        }
    }

    module _corner2() {
        hull() {
            cylinder(d=dia2 + 2, h=1, center=true, $fn=40);
            cylinder(d=dia2, h=5, center=true, $fn=40);
        }
    }

    difference() {
        // outer form
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

        // inner chamfer cuts
        hull() {
            translate([-_x, _y, h/2 + 1/2])
            _corner2();

            translate([_x, _y, h/2 + 1/2])
            _corner2();

            translate([-_x, -_y, h/2 + 1/2])
            _corner2();

            translate([_x, -_y, h/2 + 1/2])
            _corner2();
        }

        hull() {
            translate([-_x, _y, -h/2 - 1/2])
            _corner2();

            translate([_x, _y, -h/2 - 1/2])
            _corner2();

            translate([-_x, -_y, -h/2 - 1/2])
            _corner2();

            translate([_x, -_y, -h/2 - 1/2])
            _corner2();
        }

        rounded_cube_side(
            w - cd + 2*_offset, l - cd + 2*_offset,
            10, 2*_offset, center=true, $fn=40
        );
    }
}

module filament_box_seal() {
    _filament_box_seal_groove(h=6);
}

module filament_wheel() {
    //%_orig_filament_wheel();

    %translate([0, 0, 1.8])
    608zz();

    h = 11;

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
                cylinder(d=1.8, h=30, center=true, $fn=30);
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
    h = 23.8;

    difference() {
        union() {
            translate([0, 0, h - 6])
            v_screw(
                screw_d=8,
                h=6,
                pitch=1.8,
                steps=40,
                direction=0,
                chamfer=true
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

        cylinder(d=1, h=100, $fn=20);
    }
}

module window_frame() {

    union() {
        difference() {
            hull() {
                translate([0, 0, 1/2])
                rounded_cube_side(
                    66, 66, 1, 12, center=true, $fn=30
                );

                translate([0, 0, 4 - 0.4/2])
                rounded_cube_side(
                    68.5, 68.5, 0.4, 14, center=true, $fn=30
                );
            }

            for (i = [0:3]) {
                rotate([0, 0, i*90])
                translate([27, 27, 2])
                cylinder(d=3.3, h=5, center=true, $fn=20);

                rotate([0, 0, i*90])
                translate([27, 27, -0.2])
                cylinder(d1=6.8, d2=3.3, h=2.2, $fn=30);

                rotate([0, 0, i*90])
                translate([29, 0, 2])
                cylinder(d=3.3, h=5, center=true, $fn=20);

                rotate([0, 0, i*90])
                translate([29, 0, -0.2])
                cylinder(d1=6.8, d2=3.3, h=2.2, $fn=30);
                
            }

            // window hole
            rounded_cube_side(
                49, 49, 10, 4, center=true, $fn=30
            );
        }
    }
}

module window_frame_seal() {
    difference() {
        union() {
            translate([0, 0, 1.2/2])
            rounded_cube_side(
                68.5, 68.5, 1.2, 14, center=true, $fn=30
            );

            for (i = [0:3]) {
                rotate([0, 0, i*90])
                translate([27, 27, 0])
                cylinder(d=5, h=1.6, $fn=20);
            }

            difference() {
                translate([0, 0, 0.4/2 + 1.2])
                rounded_cube_side(
                    62.5, 62.5, 0.4, 7.4, center=true, $fn=30
                );

                translate([0, 0, 0])
                rounded_cube_side(
                    60.5, 60.5, 10, 5.4, center=true, $fn=30
                );
            }

            difference() {
                translate([0, 0, 0.4/2 + 1.2])
                rounded_cube_side(
                    57.5, 57.5, 0.4, 5.4, center=true, $fn=30
                );

                translate([0, 0, 0])
                rounded_cube_side(
                    55.5, 55.5, 10, 3.4, center=true, $fn=30
                );
            }

            difference() {
                translate([0, 0, 0.4/2 + 1.2])
                rounded_cube_side(
                    52.5, 52.5, 0.4, 8.4, center=true, $fn=30
                );

                translate([0, 0, 0])
                rounded_cube_side(
                    50.5, 50.5, 10, 6.4, center=true, $fn=30
                );
            }
        }

        // window hole
        rounded_cube_side(
            49, 49, 10, 10, center=true, $fn=30
        );

        for (i = [0:3]) {
            rotate([0, 0, i*90])
            translate([27, 27, 0])
            cylinder(d=2.8, h=40, center=true, $fn=20);

            rotate([0, 0, i*90])
            translate([29, 0, 0])
            cylinder(d=2.8, h=40, center=true, $fn=20);
        }
    }
}

module humidity_window_back_frame() {
    difference() {
        translate([0, 0, 5/2])
        rounded_cube_side(
            65, 65, 5, 9, center=true, $fn=30
        );

        for (i = [0:3]) {
            rotate([0, 0, i*90])
            translate([27, 27, 0])
            cylinder(d=2.8, h=40, center=true, $fn=20);

            rotate([0, 0, i*90])
            translate([29, 0, 0])
            cylinder(d=2.8, h=40, center=true, $fn=20);
        }

        //meter hole
        cube([45.2, 26.3, 20], center=true);

        translate([0, 0, 20/2 + 1.4])
        hull() {
            cube([50, 26.3, 20], center=true);

            translate([0, 0, 5])
            cube([52, 30, 20], center=true);
        }

        translate([0, 0, 10/2 + 3])
        rounded_cube_side(49, 49, 10, 2, center=true, $fn=30);
    }

//    %translate([0, 0, 13.6])
//    rotate([180, 0, 0])
//    color("darkgrey")
//    mock_humidity_meter();
}

module humidity_window_back_frame_round() {
    difference() {
        translate([0, 0, 5/2])
        rounded_cube_side(
            65, 65, 5, 9, center=true, $fn=30
        );

        for (i = [0:3]) {
            rotate([0, 0, i*90])
            translate([27, 27, 0])
            cylinder(d=2.8, h=40, center=true, $fn=20);

            rotate([0, 0, i*90])
            translate([29, 0, 0])
            cylinder(d=2.8, h=40, center=true, $fn=20);
        }

        //meter hole
        cylinder(d=42, h=20, center=true, $fn=50);

        translate([0, 0, 1.4])
        hull() {
            cylinder(d=46, h=20, $fn=50);

            translate([0, 0, 5])
            cylinder(d=48, h=20, $fn=50);
        }

        translate([0, 0, 10/2 + 3])
        rounded_cube_side(49, 49, 10, 2, center=true, $fn=30);
    }

    %translate([0, 0, -13 + 1.4])
    color("darkgrey")
    mock_humidity_meter_round();
}

module window_drill_jig_1() {
    difference() {
        translate([0, 0, 5/2])
        rounded_cube_side(
            71, 71, 5, 16.5, center=true, $fn=30
        );

        translate([0, 0, 5/2 + 2])
        rounded_cube_side(
            68.5, 68.5, 5, 14, center=true, $fn=30
        );

        for (i = [0:3]) {
            rotate([0, 0, i*90])
            translate([27, 27, 0])
            cylinder(d=3, h=40, center=true, $fn=20);

            rotate([0, 0, i*90])
            translate([29, 0, 0])
            cylinder(d=3, h=40, center=true, $fn=20);
        }
    }
}

module window_drill_jig_2() {
    difference() {
        translate([0, 0, 5/2])
        rounded_cube_side(
            68.2, 68.2, 5, 13.7, center=true, $fn=30
        );

        for (i = [0:3]) {
            rotate([0, 0, i*90])
            translate([27, 27, 0])
            cylinder(d=3, h=40, center=true, $fn=20);

            rotate([0, 0, i*90])
            translate([29, 0, 0])
            cylinder(d=3, h=40, center=true, $fn=20);
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
                cylinder(d=22, h=5, $fn=50);
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

module _core_universal(h=89, wall=1.6) {
    wings = 4;

    module _wing() {
        d = 40;

        union() {
            // lower wing
            difference() {
                union() {
                    intersection() {
                        union() {
                            cylinder(d=d, h=h, $fn=80);

                            translate([0, d/2 - wall, 0])
                            cylinder(d=2*wall, h=h, $fn=20);
                        }

                        translate([-wall, 8.5, 0])
                        hull() {
                            rounded_cube_side(
                                d/2 + wall*2 - 0.6, d/2 - 8.5,
                                h, 2*wall, $fn=80
                            );

                            translate([-0.8, d/2 - 12, 0])
                            cube([1, 1, h]);
                        }
                    }
                    translate([d/2 - 2.15, 8.9, 0])
                    intersection() {
                        cylinder(d=2*wall, h=h, $fn=40);

                        translate([0, -wall/2, h/2])
                        cube([2*wall, wall, h], center=true);
                    }
                }

                difference() {
                    cylinder(d=d - 2*wall, h=3*h, center=true, $fn=80);

                    translate([-wall, d/2 - 3/2, 0])
                    cube([2*wall, 3, 3*h], center=true);
                }
            }

            // upper wing
            difference() {
                union() {
                    intersection() {
                        translate([-6.3/2 + wall, 9, 0])
                        cylinder(d=d + 2, h=h, $fn=80);

                        translate([1.3, 8.9, 0])
                        cube([d/2 + wall*2 - 0.6, d/2 + 6, h]);

                        rotate([0, 0, -7])
                        cube([d, d, h]);
                    }

                    rotate([0, 0, -7])
                    translate([0, (d + 2 - 2*wall)/2 + 9 + 3/3, 0])
                    union() {
                        intersection() {
                            cylinder(d=3, h=h, $fn=30);

                            translate([-1.5/2, 10/2 - 1.5, h/2])
                            cube([1.5, 10, h], center=true);
                        }

                        hull() {
                            rotate([0, 0, -4])
                            translate([-1.5/2, 1/2, h/2])
                            cube([1.5, 1, h], center=true);

                            rotate([0, 0, -4])
                            translate([-1.5/2, 5 - wall/2, 0])
                            cylinder(d=1.5, h=h, $fn=20);
                        }
                    }

                }
                translate([-6.3/2 + wall, 9, 0])
                cylinder(
                    d=d + 2 - 2*wall, h=3*h, center=true, $fn=80
                );
            }
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
                translate([1.5/2, -5.5, 0])
                _wing();
            }
        }
        scale([1, 1, 1/0.7])
        chamfered_cylinder(59, 0.7 * h, 5, $fn=80);
    }
}

module core_universal(h=89, wall=1.6) {
    _core_universal(h=h, wall=wall);
}

module ptfe_connector_mount_m10() {
    difference() {

        hull() {
            cylinder(d=13, h=4, $fn=30);

            translate([-9, 0, 0])
            cylinder(d=8, h=4, $fn=30);

            translate([9, 0, 0])
            cylinder(d=8, h=4, $fn=30);
        }

        translate([0, 0, -1])
        v_screw(
            h=8, screw_d=10.2,
            pitch=1, direction=0,
            depth=0.2, steps=60
        );

        translate([-9, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-9, 0, 2])
        cylinder(d1=3.3, d2=8, h=3, $fn=30);

        translate([9, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([9, 0, 2])
        cylinder(d1=3.3, d2=8, h=3, $fn=30);

    }

    %translate([0, 0, -2.6])
    mock_ptfe_pc4m10();
}

module ptfe_connector_mount_m10_seal() {
    difference() {
        union() {
            hull() {
                cylinder(d=13, h=1, $fn=30);

                translate([-9, 0, 0])
                cylinder(d=8, h=1, $fn=30);

                translate([9, 0, 0])
                cylinder(d=8, h=1, $fn=30);
            }

            cylinder(d=12, h=1.2, $fn=30);
        }

        translate([0, 0, -1])
        v_screw(
            h=8, screw_d=10,
            pitch=1, direction=0,
            depth=0.2, steps=60
        );

        translate([-9, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=30);

        translate([9, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=30);
    }
}
