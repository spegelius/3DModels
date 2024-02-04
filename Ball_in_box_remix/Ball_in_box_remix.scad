use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
stl_path = str(
    stl_base_path,
    "Ball_in_a_box/"
);

//debug();

//_original();
//_supports_form_box();
//_supports_form_ball();
//_solubles_form_box();
//_solubles_form_ball();

//ball_in_box();
//ball_in_box_supports();
//ball_in_box_supports_soluble();

//ball_in_box_box();
//ball_in_box_box_supports_soluble();
//ball_in_box_box_supports();

//ball_in_box_ball();
//ball_in_box_ball_supports_soluble();
//ball_in_box_ball_supports();

//ball_in_box_box_dc_1();
//ball_in_box_box_dc_2();


module debug() {

    intersection() {
        union() {
            ball_in_box_box();
            ball_in_box_ball();

            color("white")
            ball_in_box_box_supports_soluble();
            ball_in_box_box_supports();

            color("white")
            ball_in_box_ball_supports_soluble();
            ball_in_box_ball_supports();
        }

        translate([200/2, 0, 0])
        cube([200, 200, 400], center=true);
    }

}

module _support_form(w, l, h, top=0.5, bottom=0.25) {

    slot_w = w - 0.5;
    slot_l = l - 0.5;
    slot_h = h - top - bottom;

    slots = floor(slot_l/6);
    echo(slots);
    slot = (slot_l - slots*0.5 - 0.5)/slots;
    echo(slot);
    
    difference() {
        translate([0, 0, h/2])
        cube([slot_w, slot_l, h], center=true);

        translate([0, -l/2 + 0.5 + slot/2, slot_h/2 + bottom])
        for(i = [0: slots -1]) {
            translate([
                i%2 ? 0.5 : -0.5, i*(slot + 0.5), 0
            ])
            cube([slot_w, slot, slot_h], center=true);
        }
    }

    translate([0, 0, h - top/2])
    cube([w, l, top], center=true);
}

module _original() {
    translate([7.376, -25.4/2, 16.006])
    scale(25.4)
    import(str(
        stl_path,
        "ball_in_box.stl"
    ), convexity=10);

    // for positioning
//    %translate([0, 0, 25.4/2])
//    cube([25.4, 25.4, 25.4], center=true);
}

module ball_in_box() {
    difference() {
        scale(120/25.4)
        _original();

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            union() {
                translate([
                    -120/2 + 6.5, -120/2 + 6.5, 120/2
                ])
                rotate([0, 0, -45])
                cube([0.1, 8.5, 110], center=true);

                translate([
                    -120/2 + 8.5, -120/2 + 6.5,
                    120/2
                ])
                cube([10, 0.1, 0.1], center=true);
            }
        }
    }

    // for  scale
//    %translate([0, 0, 120/2])
//    cube([120, 120, 120], center=true);

}

module ball_in_box_box() {
    difference() {
        ball_in_box();

        translate([0, 0, 120/2])
        sphere(d=122, $fn=100);
    }
}

module ball_in_box_ball() {
    intersection() {
        ball_in_box();

        translate([0, 0, 120/2])
        sphere(d=122, $fn=100);
    }
}


module _supports_form_box() {
    module _top_support() {
        hull() {
            translate([120/2 - 13.1/2 + 1/2, 0, 107.75])
            cube([13, 95.7, 1], center=true);

            translate([120/2 - 6, 0, 105.25 + 1/2])
            cube([13, 92.7, 1], center=true);
        }

        intersection() {
            translate([120/2 + 43.1, 0, -5])
            rotate([0, -24, 0])
            _support_form(12.8, 92.7, 140);

            translate([0, 0, 105.3 - 40/2])
            cube([200, 200, 40], center=true);
        }

        translate([120/2 + 12, 0, 0])
        _support_form(13.8, 92.7, 105.3 - 40);
    }

    difference() {
        union() {
            

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                _top_support();
            }

            difference() {
                translate([0, 0, 2/2])
                rounded_cube_side(
                    123, 123, 2, 14, center=true, $fn=40
                );

                cube([107, 107, 10], center=true);
            }
        }

        ball_in_box();
    }

    //%ball_in_box();
}

module _supports_form_ball() {
    difference() {
        cylinder(d1=70, d2=101, h=21, $fn=60);

        ball_in_box();
    }
}

module _solubles_form_box() {
    union() {
        translate([0, 0, 107.75 + 1/2])
        cube([200, 200, 2], center=true);

        difference() {
            translate([0, 0, 2/2])
            cube([124, 124, 2], center=true);

            cube([107, 107, 10], center=true);
        }
    }
}

module _solubles_form_ball() {
    union() {
        translate([0, 0, 120/2])
        sphere(d=122.4, $fn=120);

        cylinder(d=40, h=10, center=true);
    }
}

module ball_in_box_supports_soluble() {
    intersection() {
        union() {
            _supports_form_box();
            _supports_form_ball();
        }
        union() {
            _solubles_form_box();
            _solubles_form_ball();
        }
    }
}

module ball_in_box_supports() {
    difference() {
        union() {
            _supports_form_box();
            _supports_form_ball();
        }
        union() {
            _solubles_form_box();
            _solubles_form_ball();
        }
    }
}

module ball_in_box_box_supports_soluble() {
    intersection() {
        _supports_form_box();
        _solubles_form_box();
    }
}

module ball_in_box_box_supports() {
    difference() {
        _supports_form_box();
        _solubles_form_box();
    }
}

module ball_in_box_ball_supports_soluble() {
    intersection() {
        _supports_form_ball();
        _solubles_form_ball();
    }
}

module ball_in_box_ball_supports() {
    difference() {
        _supports_form_ball();
        _solubles_form_ball();
    }
}

module _box_dc_corners() {
    module corner() {
        union() {
            cube([20, 20, 20], center=true);

            translate([20/2, 0, 0])
            cube([4, 4, 4], center=true);

            translate([0, 20/2, 0])
            cube([4, 4, 4], center=true);

            translate([0, 0, 20/2])
            cube([4, 4, 4], center=true);
        }
    }

    translate([-107/2, -107/2, 6.5])
    corner();

    translate([107/2, -107/2, 6.5])
    rotate([0, 0, 90])
    corner();

    translate([107/2, 107/2, 6.5])
    rotate([0, 0, 180])
    corner();

    translate([-107/2, 107/2, 6.5])
    rotate([0, 0, 270])
    corner();

    translate([-107/2, -107/2, 120 - 6.5])
    rotate([180, 0, 90])
    corner();

    translate([107/2, -107/2, 120 - 6.5])
    rotate([180, 0, 180])
    corner();

    translate([107/2, 107/2, 120 - 6.5])
    rotate([180, 0, 270])
    corner();

    translate([-107/2, 107/2, 120 - 6.5])
    rotate([180, 0, 0])
    corner();

}

module ball_in_box_box_dc_1() {

    intersection() {
        ball_in_box_box();
        _box_dc_corners();
    }
}

module ball_in_box_box_dc_2() {

    difference() {
        ball_in_box_box();
        _box_dc_corners();
    }
}