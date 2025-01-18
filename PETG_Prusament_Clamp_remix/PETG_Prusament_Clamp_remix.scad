use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path,
    "PETG Prusament Clamp/"

);

//_orig_jaw();
//_orig_frame();

//debug_flex_jaw_pad();


flex_jaw_pad();
//frame_jaw_pad();


module _orig_jaw() {
    translate([-30.9375, 0.256, 0])
    import(
        str(
            spath,
            "prusamentpet_jaw.stl"
        ),
        convexity=10
    );

    %cylinder(d=24, h=3, $fn=70);
}

module _orig_frame() {
    import(
        str(
            spath,
            "prusamentpet_frame.stl"
        ),
        convexity=10
    );

}

module debug_flex_jaw_pad() {
    intersection() {
        flex_jaw_pad();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    translate([0, 0, 2.1])
    _orig_jaw();
}

module flex_jaw_pad() {
    difference() {
        chamfered_cylinder(
            28, 6.6, 1, $fn=70
        );

        difference() {
            translate([0, 0, 2])
            cylinder(d=24, h=10, $fn=70);

            translate([24/2 + 1.15, 0, 8])
            rotate([0, 60, 0])
            cube([4, 20, 4], center=true);

            translate([-24/2 - 1.15, 0, 8])
            rotate([0, -60, 0])
            cube([4, 20, 4], center=true);

        }
    }
}

module frame_jaw_pad() {
    module _frame_base() {
        translate([40, 12, 20.3])
        rotate([90, 90, 0])
        _orig_frame();
    }

    module _arm_form() {
        scale([1.01, 1.01, 50])
        difference() {
            scale([1.17, 1.1, 1])
            intersection() {
                _frame_base();

                translate([0, 0, 1/2])
                cube([40, 30, 1], center=true);

            }

            _frame_base();
        }
    }
    //%_frame_base();
    

    translate([0, 0, 8.7])
    rotate([0, -22, 0])
    intersection() {
        translate([0, 0, -15])
        _arm_form();

        hull() {
            translate([0, 0, 20.12])
            rotate([0, -30, 0])
            translate([-7.5, 0, 0])
            cube([40, 30, 1], center=true);

            translate([15, 0, 24.3])
            cube([1, 30, 1], center=true);

            translate([0, 0, -8.9])
            rotate([0, 22, 0])
            cube([40, 30, 1], center=true);
        }
    }
}
