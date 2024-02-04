// Remixes model:
//  https://www.printables.com/model/40769-mmu-buffer

use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Prusa/MMU_Buffer/"
);


//_orig_base();
//_orig_wheel();
//debug();


//new_MMU_base();
MMU_filament_catcher();


module _orig_base() {
    translate([-90.93, -26.67, -19])
    import(
        str(spath,
        "base-Original.stl"),
        convexity=10
    );

    // helpers
    //%cube([138, 50, 1], center=true);
}

module _orig_wheel() {
    translate([-50, 12.5, 24.95])
    rotate([90, 0, 0])
    import(
        str(spath,
        "wheel-Original.stl"),
        convexity=10
    );

    // helpers
//    %translate([0, 0, 74.95])
//    rotate([90, 0, 0])
//    cylinder(d=20, h=10, center=true);
}

module debug() {
    %new_MMU_base();
    _orig_wheel();

    translate([0, 0, 75])
    MMU_filament_catcher();
}

module new_MMU_base() {
    module _ender() {
        difference() {
            cylinder(d=7, h=1, $fn=25);

            cube([6, 3.2, 5], center=true);
        }
    }

    difference() {
        union() {
            _orig_base();

            translate([53, 0.1, 70.955])
            _ender();

            translate([-53, 0, 70.955])
            _ender();
        }

        // axle sizing helper
//        translate([0, 0, 74.95])
//        rotate([90, 0, 0])
//        cylinder(d=10.2, h=46, center=true, $fn=30);
    }
}

module MMU_filament_catcher() {
    difference() {
        hull() {
            translate([0, 0, 30/2])
            chamfered_cube_side(
                20, 50, 30, 2, center=true
            );

            translate([0, 0, 260 - 9/2])
            rotate([0, 90, 0])
            chamfered_cylinder(
                18, 20, 2, center=true, $fn=50
            );
        }

        // axle
        rotate([90, 0, 0])
        cylinder(d=10.2, h=46, center=true, $fn=30);

        // zip tie holes
        translate([50/2 + 6.65, -50/2 + 8.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([-50/2 - 6.65, -50/2 + 8.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([50/2 + 6.65, 50/2 - 3.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([-50/2 - 6.65, 50/2 - 3.01, -2])
        rotate([90, 0, 0])
        tube(50, 5, 2, $fn=50);

        translate([0, -50/2 + 5.5, -60/2 + 24])
        rotate([90, 0, 0])
        difference() {
            rounded_cube_side(
                43, 70, 6, 3, center=true
            );

            rounded_cube_side(
                20, 48, 7, 15, center=true, $fn=30
            );

            translate([0, -30/2 + 12, 0])
            cube([50, 30, 20], center=true);
        }

        translate([0, 50/2 - 5.5, -60/2 + 24])
        rotate([90, 0, 0])
        difference() {
            rounded_cube_side(
                43, 70, 6, 3, center=true
            );

            rounded_cube_side(
                20, 48, 7, 15, center=true, $fn=30
            );

            translate([0, -30/2 + 12, 0])
            cube([50, 30, 20], center=true);
        }

        // inner cuts
        rotate([90, 0, 0])
        cylinder(d=100.8, h=28, center=true, $fn=100);

        translate([0, 0, 55])
        cube([40, 21, 20], center=true);

        hull() {
            translate([0, 0, 260 - 9/2])
            rotate([0, 90, 0])
            cylinder(d=9, h=40, center=true, $fn=50);

            translate([0, 0, 58])
            cube([40, 35, 1], center=true);

            translate([0, 0, 47])
            cube([40, 10, 1], center=true);
        }

        // fancy cuts
        hull() {
            translate([0, 50/2 - 5.7, 34])
            rotate([0, 90, 0])
            cylinder(d=5, h=40, center=true, $fn=30);

            translate([0, 50/2 - 6.5, 49])
            rotate([0, 90, 0])
            cylinder(d=4.5, h=40, center=true, $fn=30);
       }

        hull() {
            translate([0, -50/2 + 5.7, 34])
            rotate([0, 90, 0])
            cylinder(d=5, h=40, center=true, $fn=30);

            translate([0, -50/2 + 6.5, 49])
            rotate([0, 90, 0])
            cylinder(d=4.5, h=40, center=true, $fn=30);
       }
    }
}