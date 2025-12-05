use <../../../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../../../_downloaded/";
spath = str(
    stl_base_path, "Qidi Plus 4/Cable Ramp V2/"
);


//_orig_cable_ramp_v2();


//cable_ramp_v3();
cable_ramp_v3_no_support();


module _orig_cable_ramp_v2() {
    import(
        str(spath, "cableramp_v2.stl"),
        convexity=10
    );
}

module cable_ramp_v3() {
    module _patch() {
        difference() {
            cylinder(d=10, h=3, $fn=30);
            cylinder(d=3.3, h=10, center=true, $fn=30);

            translate([0, 0, 1])
            chamfered_cylinder(6.5, 10, 1.6, $fn=30);
        }
    }

    union() {
        _orig_cable_ramp_v2();

        translate([-13.5, 13.7])
        _patch();

        translate([-13.5, 84.2])
        _patch();

    }
}

module cable_ramp_v3_no_support() {
    intersection() {
        rotate([0, 180, 0])
        cable_ramp_v3();

        union() {
            translate([0, 0, -10/2])
            cube([65, 300, 10], center=true);

            translate([30/2 + 19, 0, 0])
            cube([30, 300, 40], center=true);

            translate([20, -30, 0])
            cube([50, 50, 40], center=true);

        }
    }
}