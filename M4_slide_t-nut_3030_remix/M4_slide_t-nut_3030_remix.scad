use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path,
    "M4 slide nut t-nut for 3030 extrusion profiles/"
);

//_orig_M4_slide_tnut();
//debug();

M4_slide_tnut_3030_new();


module _orig_M4_slide_tnut() {
    import(
        str(
            spath,
            "3030-m4-t-nut.stl"
        ),
        convexity=10
    );  
}

module debug() {
    intersection() {
        M4_slide_tnut_3030_new();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }
}

module M4_slide_tnut_3030_new() {
    difference() {
        union() {
            _orig_M4_slide_tnut();

            translate([0, 0, 3.2/2])
            cube([10, 8, 3.2], center=true);
        }

        translate([0, 0, -0.01])
        M4_nut(3.8, cone=false, bridging=true);

        cylinder(d=4.2, h=30, center=true, $fn=60);

        translate([0, 6/2 + 3.8, 8.6])
        cube([30, 6, 4], center=true);

        translate([0, -6/2 - 3.8, 8.6])
        cube([30, 6, 4], center=true);

        translate([0, 0, 10.4])
        cube([30, 20, 4], center=true);
    }
}