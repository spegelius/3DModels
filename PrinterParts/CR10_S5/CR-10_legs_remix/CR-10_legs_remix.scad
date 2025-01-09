use <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../Dollo/NEW_long_ties/leg.scad>;

stl_base_path = "../../../_downloaded/";
spath = str(
    stl_base_path, "Creality CR-10 Legs/"
);

t_slop = 0.4;
t_dia = 30;
t_pitch = 3;


//_orig_cr10_leg_corner_1();
//_orig_cr10_leg_corner_2();
//_orig_cr10_leg_middle();
//debug_legs_remix();

//new_leg_corner_1();
//new_leg_corner_2();
//new_leg_middle();
foot();
//foot(t_slop=0.8);


module _orig_cr10_leg_corner_1() {
    import(
        str(spath, "cr10_leg_corner_1.stl"),
        convexity=10
    );
}

module _orig_cr10_leg_corner_2() {
    translate([40, 0, 0])
    import(
        str(spath, "cr10_leg_corner_2.stl"),
        convexity=10
    );
}

module _orig_cr10_leg_middle() {
    import(
        str(spath, "cr10_leg_middle.stl"),
        convexity=10
    );
}

module debug_legs_remix() {
    intersection() {
        rotate([0, 0, 45])
        new_leg_corner_1();
        
        translate([0, 200/2, 0])
        cube([200, 200, 400], center=true);
    }

    translate([0, 0, 131])
    rotate([0, 180, 0])
    intersection() {
        foot();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }

    translate([0, 0, 131])
    rotate([0, 180, 0])
    intersection() {
        foot_dampener();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }
}

module _leg_thread(h=61, slop=0) {
    v_screw(
        h=h,
        screw_d=t_dia - slop,
        pitch=t_pitch,
        direction=0,
        steps=70,
        depth=0.4,
        chamfer=true
    );
}

module _foot_form(h) {

    twist = h / 100 * 50;

    linear_extrude(
        height = h, center = false, convexity = 10,
        twist = twist, $fn=50
    )
    circle(d=60, $fn=9);
}

module new_leg_corner_1() {
    difference() {
        intersection() {
            _orig_cr10_leg_corner_1();

            union() {
                hull() {
                    cylinder(d=55, h=108, $fn=60);
                    cylinder(d=40, h=120, $fn=60);
                }
                cylinder(d=300, h=60);
            }
        }

        translate([0, 0, 121])
        rotate([0, 180, 0])
        _leg_thread();

        cylinder(d=t_dia - 10, h=60.2, $fn=60);
    }
}

module new_leg_corner_2() {
    difference() {
        intersection() {
            _orig_cr10_leg_corner_2();

            union() {
                hull() {
                    cylinder(d=55, h=108, $fn=60);
                    cylinder(d=40, h=120, $fn=60);
                }
                cylinder(d=300, h=60);
            }
        }

        translate([0, 0, 121])
        rotate([0, 180, 0])
        _leg_thread();

        cylinder(d=t_dia - 10, h=60.2, $fn=60);
    }
}

module new_leg_middle() {
    difference() {
        intersection() {
            _orig_cr10_leg_middle();

            union() {
                hull() {
                    cylinder(d=55, h=108, $fn=60);
                    cylinder(d=40, h=120, $fn=60);
                }
                cylinder(d=300, h=60);
            }
        }

        translate([0, 0, 121])
        rotate([0, 180, 0])
        _leg_thread();

        cylinder(d=t_dia - 10, h=60.2, $fn=60);
    }
}

module foot(h=30, t_slop=t_slop) {

    difference() {
        union() {
            _leg_thread(h=h, slop=t_slop);

            difference() {
                intersection() {
                    _foot_form(20);

                    chamfered_cylinder(
                        63, 20, 4, $fn=80
                    );
                }

                translate([0, 0, 10])
                hull() {
                    translate([0, 0, 12])
                    cylinder(d=55.2, h=40, $fn=60);
                    cylinder(d=40.2, h=40, $fn=60);
                }
            }
            
        }
        cylinder(d=15, h=200, center=true, $fn=50);
        _bottom_holes();
    }
}


