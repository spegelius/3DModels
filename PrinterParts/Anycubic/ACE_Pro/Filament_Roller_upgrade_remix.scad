use <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../lib/bearings.scad>;


stl_base_path = "../../../_downloaded/Anycubic/";
spath = str(
    stl_base_path, "ACE Pro/Ace Pro Filament Roller upgrade/"
);


//_orig_anycubic_roller();
//_orig_aceprorollerbearing();

//debug_ace_pro_roller_623zz();
//debug_ace_pro_roller_half_623zz();


//ace_pro_roller_623zz();
ace_pro_roller_half_623zz();


module _orig_anycubic_roller() {
    difference() {
        union() {
            cylinder(d=9, h=75.6, $fn=30);

            translate([0, 0, 0.5])
            cylinder(d=16, h=1.4, $fn=40);

            translate([0, 0, 75.5 - 1.4])
            cylinder(d=16, h=1.4, $fn=40);

            translate([0, 0, 0.5])
            cylinder(d=11.8, h=75, $fn=40);
        }
        cylinder(d=3, h=200, center=true, $fn=30);

        cylinder(d=7, h=28, center=true, $fn=30);

        translate([0, 0, 75.6])
        cylinder(d=7, h=28, center=true, $fn=30);
    }
}

module _orig_aceprorollerbearing() {
    import(
        str(spath, "aceprorollerbearing.stl"),
        convexity=10
    );

    // measuring
    //%cylinder(d=16, h=1.4, $fn=120);
    %cylinder(d=14, h=10, $fn=120);
}

module debug_ace_pro_roller_623zz() {
    intersection() {
        ace_pro_roller_623zz();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }

    %translate([0, 0, -0.1])
    623zz();

    %translate([0, 0, 75.6 - 4 + 0.1])
    623zz();
}

module debug_ace_pro_roller_half_623zz() {
    intersection() {
        ace_pro_roller_half_623zz();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }

    %translate([0, 0, -0.1])
    623zz();

    %translate([0, 0, 37 - 4 + 0.1])
    623zz();
}

module ace_pro_roller_623zz() {
    //%_orig_aceprorollerbearing();

    difference() {
        union() {
            cylinder(d=16, h=1.4, $fn=120);
            cylinder(d=14, h=75, $fn=120);

            translate([0, 0, 74.2])
            cylinder(d=16, h=1.4, $fn=120);
        }

        chamfered_cylinder(10.15, 8.8, 1, center=true, $fn=18);

        translate([0, 0, 75.6])
        chamfered_cylinder(10.15, 8.8, 1, center=true, $fn=18);

        cylinder(d=8.3, h=200, center=true, $fn=18);
    }
}

module ace_pro_roller_half_623zz() {
    difference() {
        union() {
            cylinder(d=16, h=1.4, $fn=120);
            cylinder(d=14, h=37, $fn=120);
        }

        chamfered_cylinder(10.15, 8.8, 1, center=true, $fn=18);

        translate([0, 0, 37])
        chamfered_cylinder(10.15, 8.8, 1, center=true, $fn=18);

        cylinder(d=8.3, h=200, center=true, $fn=18);
    }
}