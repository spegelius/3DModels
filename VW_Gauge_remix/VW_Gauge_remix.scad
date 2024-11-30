include <../Dollo/NEW_Long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path,
    "Vw Gauge for MK4 52MM inside/"
);


//_orig_left_grill();
debug();

//left_grill_42mm_gauge();


module _orig_left_grill() {
    translate([-7.75, 21.7, 0])
    import(
        str(
            spath,
            "Left_grill_Remix_V2.stl"
        ),
        convexity=10
    );

//    %cube([90.7, 2, 20], center=true);
//    %cube([2, 56.6, 20], center=true);
}

module _mock_gauge_52mm() {
    union() {
        cylinder(d=52, h=52, $fn=60);

        translate([0, 0, 52 - 4])
        cylinder(d=56, h=4, $fn=60);
    }
}

module debug() {
    intersection() {
        //left_grill_42mm_gauge();
        left_grill_52mm_gauge();

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }
    
}

module _left_grill_form(h=20) {
    intersection() {
        rounded_cube(
            90.6, 56.6, h*2, 6, center=true, $fn=40
        );

        cylinder(d=200, h=30);
    }
}

module _left_grill(h=20) {
    //%_orig_left_grill();

    module _grill() {
        hull() {
            translate([0, 0, -10])
            rotate([0, 90, 0])
            cylinder(d=3, h=90, center=true, $fn=30);

            translate([0, 0, h - 3/2])
            rotate([0, 90, 0])
            cylinder(d=3, h=90, center=true, $fn=30);
        }
    }

    module _grills() {
        difference() {
            rounded_cube(
                85.6, 51.6, h*3, 1, center=true, $fn=40
            );

            _grill();

            translate([0, 8.5, 0])
            _grill();

            translate([0, -8.5, 0])
            _grill();

            translate([0, 17, 0])
            _grill();

            translate([0, -17, 0])
            _grill();
        }
    }

    union() {
        difference() {
            _left_grill_form(h);
            _grills();
        }

        translate([90/2 - 1.8, -0.25, h - 8.97])
        rotate([0, 90, 0])
        chamfered_cylinder(6, 5, 0.6, $fn=40);

        translate([-90/2 + 1.8, -0.25, h - 8.97])
        rotate([0, -90, 0])
        chamfered_cylinder(6, 4.5, 0.6, $fn=40);
    }
}

module left_grill_42mm_gauge() {
    h = 25.2;

    difference() {
        union() {
            _left_grill(h=h);

            intersection() {
                translate([0, 1.8, h/2])
                rotate([20, 0, 0])
                translate([0, 0, -1.3])
                rounded_cylinder(
                    47, h + 20, 3, center=true, $fn=70
                );

                scale([1, 1, 2])
                _left_grill_form(h=h);
            }
        }

        #translate([0, 1.8, h/2])
        rotate([20, 0, 0])
        translate([0, 0, (h + 20)/2 - 26.1 - 1.2])
        cylinder(d=42.3, h=26.1, $fn=70);
    }
}

module left_grill_52mm_gauge() {
    h = 20;

    difference() {
        union() {
            _left_grill(h=h);

            intersection() {
                translate([0, 0, h/2 + 3/2])
                rotate([0, 0, 0])
                translate([0, 0, -3])
                rounded_cylinder(
                    57, h + 3, 3, center=true, $fn=70
                );

                scale([1, 1, 2])
                _left_grill_form(h=h);
            }
        }

        #translate([0, 0, -52 + h + 4])
        rotate([0, 0, 0])
        //translate([0, 0, (h + 20)/2 - 26.1 - 1.2])
        //cylinder(d=52.3, h=26.1, $fn=70);
        _mock_gauge_52mm();
    }
}