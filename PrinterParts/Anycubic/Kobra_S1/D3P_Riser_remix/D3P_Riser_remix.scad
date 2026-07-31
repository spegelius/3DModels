use <../../../../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../../../../_downloaded/Anycubic/Kobra S1/";
spath = str(
    stl_base_path, "D3P_Riser/"
);


//_orig_drawer_front();
//_orig_bottom_inlay_left();
//_orig_bottom_inlay_right();
//_orig_alignment_pin();
//_orig_bp_holder_left();
//_orig_bp_holder_right();
//_orig_front_left();
//_orig_front_right();
//_orig_kobra_riser_sign();
//_orig_sign_pins();
//_orig_drawer();
//_orig_rear_left();
//_orig_rear_right();
//_orig_middle_left();
//_orig_middle_right();
//_orig_side_insert_no_fill();
//_orig_top_inlay_left();
//_orig_top_inlay_right();

assembly();

//new_middle_left();
//new_middle_right();
//new_rear_left();
//new_rear_right();
//new_drawer();
//new_kobra_riser_sign_green();
//new_kobra_riser_sign_black();
//new_kobra_riser_sign_white();


module _orig_drawer_front() {
    color("lightgrey")
    import(
        str(spath, "Drawer front.stl"),
        convexity=10
    );
}

module _orig_bottom_inlay_left() {
    color("lightgreen")
    translate([213, -318, 40])
    import(
        str(spath, "Bottom inlay Left.stl"),
        convexity=10
    );
}

module _orig_bottom_inlay_right() {
    color("lightgreen")
    translate([213, 68, 40])
    import(
        str(spath, "Bottom inlay Right.stl"),
        convexity=10
    );
}

module _orig_alignment_pin() {
    import(
        str(spath, "Alignment pin.stl"),
        convexity=10
    );
}

module _orig_bp_holder_left() {
    color("lightgrey")
    translate([20, -240, 100])
    import(
        str(spath, "BP holder Left.stl"),
        convexity=10
    );
}

module _orig_bp_holder_right() {
    color("lightgrey")
    rotate([0, 0, 180])
    translate([-670, 0, 0])
    import(
        str(spath, "BP holder Right.stl"),
        convexity=10
    );
}

module _orig_front_left() {
    color("darkslategrey")
    import(
        str(spath, "Front left.stl"),
        convexity=10
    );
}

module _orig_front_right() {
    color("darkslategrey")
    import(
        str(spath, "Front right.stl"),
        convexity=10
    );
}

module _orig_kobra_riser_sign() {
    import(
        str(spath, "Kobra riser sign.stl"),
        convexity=10
    );
}

module _orig_sign_pins() {
    import(
        str(spath, "Sign pins.stl"),
        convexity=10
    );
}

module _orig_drawer() {
    color("lightgrey")
    import(
        str(spath, "Drawer.stl"),
        convexity=10
    );
}

module _orig_rear_left() {
    color("darkslategrey")
    import(
        str(spath, "Rear left.stl"),
        convexity=10
    );
}

module _orig_rear_right() {
    color("darkslategrey")
    import(
        str(spath, "Rear Right.stl"),
        convexity=10
    );
}

module _orig_middle_left() {
    color("darkslategrey")
    import(
        str(spath, "Middle left.stl"),
        convexity=10
    );
}

module _orig_middle_right() {
    color("darkslategrey")
    import(
        str(spath, "Middle Right.stl"),
        convexity=10
    );
}

module _orig_side_insert_no_fill() {
    import(
        str(spath, "Side insert no fill.stl"),
        convexity=10
    );
}

module _orig_top_inlay_left() {
    color("lightgreen")
    import(
        str(spath, "Top inlay Left.stl"),
        convexity=10
    );
}

module _orig_top_inlay_right() {
    color("lightgreen")
    import(
        str(spath, "Top inlay Right.stl"),
        convexity=10
    );
}

module assembly() {
    _orig_drawer_front();
    _orig_bottom_inlay_left();
    _orig_bottom_inlay_right();
    _orig_alignment_pin();
    _orig_bp_holder_left();
    _orig_bp_holder_right();
    _orig_front_left();
    _orig_front_right();
//    _orig_kobra_riser_sign();
    _orig_sign_pins();
    _orig_drawer();
    _orig_rear_left();
    _orig_rear_right();
    _orig_middle_left();
    _orig_middle_right();
    _orig_side_insert_no_fill();
    _orig_top_inlay_left();
    _orig_top_inlay_right();

    
    rotate([0, 90, 0])
    translate([-36, -100, 384.174]) {
        color("lightgreen")
        render()
        new_kobra_riser_sign_green();
    }

    rotate([0, 90, 0])
    translate([-36, -100, 384.174]) {
        color("darkslategrey")
        render()
        new_kobra_riser_sign_black();
    }

    rotate([0, 90, 0])
    translate([-36, -100, 384.174]) {
        color("white")
        render()
        new_kobra_riser_sign_white();
    }
}

module _screw_hole() {
    union() {
        cylinder(d=5, h=200, $fn=30);

        chamfered_cylinder(
            11, 70, 3, $fn=40
        );
    }
}

module new_middle_left() {

    difference() {
        _orig_middle_left();

        #translate([252, -125, 88])
        _screw_hole();

        #translate([252, 0, 48.5])
        _screw_hole();
    }
}

module new_middle_right() {

    difference() {
        _orig_middle_right();

        #translate([252, 125, 88])
        _screw_hole();

        #translate([252, 0, 48.5])
        _screw_hole();
    }
}

module new_rear_left() {

    difference() {
        _orig_rear_left();

        #translate([30, -125, 88])
        _screw_hole();

        #translate([30, 0, 48.5])
        _screw_hole();

        #translate([141, -125, 88])
        _screw_hole();

        #translate([141, 0, 48.5])
        _screw_hole();
    }
}

module new_rear_right() {

    difference() {
        _orig_rear_right();

        #translate([30, 125, 88])
        _screw_hole();

        #translate([30, 0, 48.5])
        _screw_hole();

        #translate([141, 125, 88])
        _screw_hole();

        #translate([141, 0, 48.5])
        _screw_hole();
    }
}

module new_drawer() {

    module _bottom_cuts() {
        d = 3;
        z = 0;

        translate([-16, 0, z])
        rotate([45, 0, 0])
        cube([220, d, d], center=true);

        translate([-16, 42.34, z])
        rotate([45, 0, 0])
        cube([220, d, d], center=true);

        translate([-16, -42.34, z])
        rotate([45, 0, 0])
        cube([220, d, d], center=true);

        difference() {
            union() {
                translate([0, 0, z])
                rotate([0, 45, 0])
                cube([d, 160, d], center=true);

                translate([-42.34, 0, z])
                rotate([0, 45, 0])
                cube([d, 160, d], center=true);

                translate([2*-42.34, 0, z])
                rotate([0, 45, 0])
                cube([d, 160, d], center=true);

                translate([42.34, 0, z])
                rotate([0, 45, 0])
                cube([d, 160, d], center=true);

                translate([2*42.34, 0, z])
                rotate([0, 45, 0])
                cube([d, 160, d], center=true);
            }

            translate([-16, 0, z])
            rotate([45, 0, 0])
            cube([220, d + 3, d + 3], center=true);

            translate([-16, 42.34, z])
            rotate([45, 0, 0])
            cube([220, d + 3, d + 3], center=true);

            translate([-16, -42.34, z])
            rotate([45, 0, 0])
            cube([220, d + 3, d + 3], center=true);
        }
    }

    difference() {
        translate([-187.5, -97.1, -121.84])
        _orig_drawer();

        _bottom_cuts();
    }
}

module _new_kobra_riser_sign() {
    translate([36, 100, -384.174])
    rotate([0, -90, 0])
    _orig_kobra_riser_sign();
}

module new_kobra_riser_sign_green() {
    intersection() {
        _new_kobra_riser_sign();

        translate([-2, 0, 17.25])
        rotate([0, -21.1, 0])
        difference() {
            cube([50, 150, 10], center=true);

            cube([20, 100, 30], center=true);
        }
    }
}

module new_kobra_riser_sign_black() {
    difference() {
        _new_kobra_riser_sign();

        translate([-2, 0, 17.25])
        rotate([0, -21.1, 0])
        cube([50, 150, 10], center=true);
    }
}

module new_kobra_riser_sign_white() {
    intersection() {
        _new_kobra_riser_sign();

        translate([-2, 0, 17.25])
        rotate([0, -21.1, 0])
        cube([20, 100, 10], center=true);
    }
}