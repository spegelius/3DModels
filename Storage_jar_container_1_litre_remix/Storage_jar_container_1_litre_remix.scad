use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Storage_jar/"
);


//_orig_storage_jar();
//_orig_storage_jar_lid();

//debug_storage_jar();
//debug_lid_v2();

//storage_jar_lid_v2();
storage_jar_fixed();


module _orig_storage_jar() {
    translate([-380.1, -105, -86.1])
    import(
        str(spath, "storage_jar_fixed.stl"),
        convexity=10
    );

    //%cylinder(d=81, h=400, $fn=100);
}


module _orig_storage_jar_lid() {
    translate([-42.1515, 0, 0])
    import(
        str(spath, "storage_jar_lid.stl"),
        convexity=10
    );

    //%cylinder(d=94, h=1, $fn=150);
}

module debug_storage_jar() {
    intersection() {
        //_orig_storage_jar();
        storage_jar_fixed();

        translate([0, 200/2, 0])
        cube([200, 200, 600], center=true);
    }
}

module debug_lid_v2() {
    intersection() {
        storage_jar_lid_v2();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }
}


module storage_jar_lid_v2() {
    difference() {
        intersection() {
            union() {
                _orig_storage_jar_lid();

                rotate([0, 0, 10])
                cylinder(d=94, h=1.4, $fn=18);
            }

            hull() {
                translate([0, 0, 6])
                cylinder(d=95, h=20, $fn=80);

                translate([0, 0, 2.6])
                donut(87, 6, $fn=80);
            }
        }

        translate([0, 0, 1.4])
        chamfered_cylinder(79.2, 30, 1, $fn=80);
    }
}

module storage_jar_fixed() {
    difference() {
        union() {
            _orig_storage_jar();

            translate([0, 0, 147.9])
            tube(83.4, 21.6, 1.55, $fn=100);
        }
        translate([0, 0, 138.8])
        scale([1, 1, 1.5])
        chamfered_cylinder(82, 7.5, 2, $fn=100);
    }
}