use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Tesla/Tesla Model 3 Angle adapter for trailer hitch (Europe)/"
);


//_orig_angle_adapter();


//angle_adapter_180();
//adapter_seal();
qnd_fix();


module _orig_angle_adapter() {
    import(
        str(spath, "Tesla_Model_3_Winkeladapter_V2.2.stl"),
        convexity=10
    );
}


module angle_adapter_180() {

    module _threads() {
        intersection() {
            _orig_angle_adapter();
            translate([0, 53, 53])
            cylinder(d=43, h=35);
        }
    }

    module _adapters_sans_threads() {
        difference() {
            _orig_angle_adapter();

            translate([0, 53, 53.01])
            cylinder(d=43, h=35);
        }
    }

    union() {
        translate([0, 53 * 2, 0])
        rotate([0, 0, 180])
        _threads();

        _adapters_sans_threads();
    }
    %_orig_angle_adapter();
}

module adapter_seal() {

    module _seal_form(d, h, wall) {
        d1 = d;
        d2 = d - 2 * wall;

        difference() {
            intersection() {
                cylinder(d=d1, h=h, $fn=50);

                cube([d * 2, d1 * 0.87, 100], center=true);
            }

            intersection() {
                cylinder(
                    d=d2, h=h*3,
                    center=true, $fn=50
                );

                cube([
                    d * 2, d * 0.87 - 2*wall,
                    100
                ], center=true);
            }
        }
    }
    
    union() {
        rotate([90, 0, 0])
        intersection() {
            _orig_angle_adapter();

            cube([200, 2, 200], center=true);
        }

        translate([0, -33, 0])
        _seal_form(70, 1.2, 0.5, $fn=150);

        translate([0, -33, 0])
        tube(49, 1.2, 0.5, $fn=150);

        difference() {
            translate([0, -33, 0])
            _seal_form(61, 1.2, 0.5, $fn=150);

            translate([-14, -8.5, 0])
            cylinder(d=6, h=10, center=true, $fn=150);

            translate([29, -33, 0])
            cylinder(d=6, h=10, center=true, $fn=150);

            translate([-14, -57.5, 0])
            cylinder(d=6, h=10, center=true, $fn=150);
        }

        translate([-14, -8.5, 0])
        tube(7, 1.2, 0.9, $fn=150);

        translate([29, -33, 0])
        tube(7, 1.2, 0.9, $fn=150);

        translate([-14, -57.5, 0])
        tube(7, 1.2, 0.9, $fn=150);
    }
}

module qnd_fix() {
    difference() {
        cylinder(d=35.5, h=1, $fn=40);

        cylinder(d=31.9, h=30, center=true, $fn=40);
    }
}