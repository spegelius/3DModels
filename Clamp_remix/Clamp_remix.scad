use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path,
    "Clamp/"
);


//_orig_Clamp();

//debug();

Clamp_new();


module _orig_Clamp() {
    import(
        str(
            spath,
            "Clamp.stl"
        ),
        convexity=10
    );
}

module debug() {
    intersection() {
        Clamp_new();

        translate([0, 0, 200/2 + 15])
        cube([200, 200, 200], center=true);
    }
}

module Clamp_new() {
    difference() {
        translate([-125, -100, 0])
        _orig_Clamp();

        translate([-50, 35.75, 15])
        hull() {
            rotate([0, 90, 0])
            cylinder(d=15.8, h=50, center=true, $fn=40);

            translate([0, 0, 15.5/2])
            cube([50, 5, 1], center=true);
        }

        for(i = [0:7]) {
            translate([-36.25 - i*2.5, 35.75, 21.4])
            rotate([0, 0, 2.6])
            hull() {
                translate([0, 0, 2.5])
                cube([0.6, 6, 1], center=true);

                cube([0.8, 12, 1], center=true);
            }
        }

        translate([-35.2, 35.75, 21.4])
        rotate([0, 0, 2.6])
        hull() {
            translate([0, 0, 2.5])
            cube([0.6, 6, 1], center=true);

            cube([0.8, 12, 1], center=true);
        }

        translate([-35.7, 35.75, 21.4])
        rotate([0, 0, 2.6])
        hull() {
            translate([0, 0, 2.5])
            cube([0.6, 6, 1], center=true);

            cube([0.8, 12, 1], center=true);
        }

        translate([-54.3, 35.75, 21.4])
        rotate([0, 0, 2.6])
        hull() {
            translate([0, 0, 2.5])
            cube([0.6, 6, 1], center=true);

            cube([0.8, 12, 1], center=true);
        }

        translate([-54.7, 35.75, 21.4])
        rotate([0, 0, 2.6])
        hull() {
            translate([0, 0, 2.5])
            cube([0.6, 6, 1], center=true);

            cube([0.8, 12, 1], center=true);
        }

    }

//    #translate([-50, 35.75, 15])
//    rotate([0, 90, 0])
//    cylinder(d=15.8, h=50, center=true, $fn=40);
}