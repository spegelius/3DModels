use <../../../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../../../_downloaded/";
spath = str(
    stl_base_path, "Qidi Plus 4/Exhaust Filter HEPA/"
);


//_orig_base();


base_v2();


module _orig_base() {
    translate([0, 0, 3])
    rotate([180, 0, 0])
    import(
        str(spath, "base.stl"),
        convexity=10
    );
}

module base_v2() {
    difference() {
        union() {
            _orig_base();

            for(i = [0:3]) {
                rotate([0, 0, 25.5 + i*90])
                intersection() {
                    tube(73, 10, 2, $fn=100);

                    translate([0, 75/2 + 1.3, 0])
                    rounded_cube_side(10, 10, 14, 3, center=true, $fn=40);
                }

                rotate([0, 0, 24.7 + i*90])
                intersection() {
                    tube(73, 10, 2, $fn=100);

                    translate([0, 75/2 + 1.3, 0])
                    rounded_cube_side(10, 10, 12, 3, center=true, $fn=40);
                }
            }
        }

        difference() {
            cylinder(d=73, h=10, center=true, $fn=100);

            for(i = [0:3]) {
                rotate([0, 0, 24.2 + i*90])
                translate([0, 75/2 + 1.1, 0])
                rounded_cube(12, 10, 20, 3, center=true, $fn=40);
            }
        }
    }
}