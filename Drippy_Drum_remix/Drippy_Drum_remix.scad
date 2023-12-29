use <../Dollo/NEW_long_ties/include.scad>;


stl_path = "../_downloaded/";
dd_path = str(
    stl_path,
    "Drippy Drum With Divider Insert/"
);


//_orig_drum();
//_orig_lid();
//Drum_dc_1();
//Drum_dc_2();
Lid_dc_1();
//Lid_dc_2();

module _orig_drum() {
    rotate([0, 0, -35])
    import(str(dd_path, "Drum.stl"), convexity=10);
}

module _orig_lid() {
    rotate([0, 0, -35])
    import(str(dd_path, "Lid.stl"), convexity=10);
}

module _pie_slice(id, od) {
    difference() {
        cylinder(d=od, h=1, center=true, $fn=100);
        cylinder(d=id, h=2, center=true, $fn=80);

        translate([0, (od + 1)/2 - 0.0001, 0])
        cube([od + 1, od + 1, 3], center=true);

        rotate([0, 0, -120])
        translate([0, (od + 1)/2 - 0.0001, 0])
        cube([od + 1, od + 1, 3], center=true);
    }
}

module _drum_dc_form() {

    difference() {
        union() {
            translate([0, -2, 2])
            rotate([90, 0, 0])
            cylinder(d=0.157, h=2, center=true, $fn=40);

            translate([0, -1, 2])
            rotate([90, 0, 0])
            tube(1.141, 1, 0.038, $fn=100);

            translate([0, -2, 2])
            rotate([90, -60, 0])
            _pie_slice(0.316, 0.944);

            translate([0, -2, 2])
            rotate([90, 60, 0])
            _pie_slice(0.316, 0.944);

            translate([0, -2, 2])
            rotate([90, 180, 0])
            _pie_slice(0.316, 0.944);
        }
        cylinder(d=3.77, h=8, center=true, $fn=100);;
    }
}

module Drum_dc_1() {
    difference() {
        _orig_drum();
        _drum_dc_form();
    }
}

module Drum_dc_2() {
    intersection() {
        _orig_drum();
        _drum_dc_form();
    }
}

module _lid_dc_form() {
    intersection() {
        union() {
            translate([0, 0, 4])
            cylinder(d=0.235, h=1, center=true, $fn=60);

            translate([0, 0, 4])
            tube(1.7115, 1, 0.0579, $fn=100);
        
            translate([0, 0, 4])
            rotate([0, 0, 25])
            _pie_slice(0.4733, 1.4168);

            translate([0, 0, 4])
            rotate([0, 0, 145])
            _pie_slice(0.4733, 1.4168);

            translate([0, 0, 4])
            rotate([0, 0, 265])
            _pie_slice(0.4733, 1.4168);
        }
        translate([0, 0, 4.34])
        cylinder(d=4, h=1);
    }
}

module Lid_dc_1() {
    difference() {
        _orig_lid();
        _lid_dc_form();
    }
}

module Lid_dc_2() {
    intersection() {
        _orig_lid();
        _lid_dc_form();
    }
}