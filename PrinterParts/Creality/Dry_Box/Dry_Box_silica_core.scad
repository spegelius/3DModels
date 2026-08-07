use <../../../Dollo/NEW_long_ties/include.scad>;

use <common.scad>;

use <../../Anycubic/ACE_Pro/Mod_Spool_Holder_remix/Mod_Spool_Holder_remix.scad>;

use <../../../Spool_remix/Spool_remix.scad>;


stl_base_path = "../../../_downloaded/Creality/";
spath = str(
    stl_base_path, "Adapter for Creality Dry Box 2.0 (250g Spools) filament dryer/"
);

spath2 = str(
    stl_base_path, "Creality Dry Box 2.0 Dessicant Box with Lid/"
);


//_orig_adapter_p1();
//_orig_adapter_p2();
//_orig_dessicant_basket();

//mockup();

//dry_box_silica_core_adapter();
dry_box_silica_core_adapter_joiner();


module _orig_adapter_p1() {
    import(
        str(spath, "250g-adapter-creality-dryer-part1.stl"),
        convexity=10
    );
}

module _orig_adapter_p2() {
    import(
        str(spath, "250g-adapter-creality-dryer-part2.stl"),
        convexity=10
    );
}

module _orig_dessicant_basket() {
    translate([-74 - 88/2, -63.5 - 203/2, 0])
    import(
        str(spath2, "dessicant-basket.stl"),
        convexity=10
    );
}

module mockup() {
    intersection() {
        mock_dry_box();

        translate([300/2, 0, 0])
        cube([300, 600, 600], center=true);
    }

//    %intersection() {
//        mock_dry_box_lid();
//
//        translate([300/2, 0, 0])
//        cube([300, 600, 600], center=true);
//    }

    %translate([0, 111/2, 165 - 99 + 13/2])
    mock_axle_assembly();

    %translate([0, -111/2, 165 - 99 + 13/2])
    mock_axle_assembly();

//    render()
//    translate([73/2, 0, 0])
//    rotate([0, 0, 90])
//    union() {
//        _orig_adapter_p1();
//        _orig_adapter_p2();
//    }

//    translate([0, 0, 86])
//    _orig_dessicant_basket();

    render()
    translate([-36, 0, 161])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-67/2, 0, 160])
    rotate([0, 90, 0])
    spool_remix_assembly();

    color("white")
    translate([90/2, 0, 60])
    rotate([90, 0, -90])
    dry_box_silica_core_adapter();

//    color("white")
//    translate([-90/2, 0, 60])
//    rotate([90, 0, 90])
//    dry_box_silica_core_adapter();

    translate([0, 0, 53])
    dry_box_silica_core_adapter_joiner();
}

module dry_box_silica_core_adapter() {
    h = 7;

    difference() {
        union() {
            hull() {
                translate([-111/2 + 3, 20, 0])
                cylinder(d=16, h=h, $fn=40);

                translate([0, 100, 0])
                cylinder(d=16, h=h, $fn=40);

                translate([111/2 - 3, 20, 0])
                cylinder(d=16, h=h, $fn=40);
            }

            hull() {
                translate([-41, 20, 0])
                cylinder(d=16, h=h, $fn=40);

                translate([-30, 4, 0])
                cylinder(d=22, h=h, $fn=40);

                translate([41, 20, 0])
                cylinder(d=16, h=h, $fn=40);

                translate([30, 4, 0])
                cylinder(d=22, h=h, $fn=40);
            }

            translate([0, 101, 0])
            cylinder(d=12, h=h, $fn=40);
        }

        translate([-111/2, 12.5, 0])
        cylinder(d=13.1, h=250, center=true, $fn=40);

        translate([-111/2, 12.5, 4.4])
        cylinder(d=15.2, h=250, $fn=40);

        translate([111/2, 12.5, 0])
        cylinder(d=13.1, h=250, center=true, $fn=40);

        translate([111/2, 12.5, 4.4])
        cylinder(d=15.2, h=250, $fn=40);


        hull() {
            translate([-111/2, 0, 0])
            rounded_cube_side(17, 35, 20, 2, center=true, $fn=30);

            translate([-111/2, 0, 0])
            cube([31, 1, 20], center=true);
        }

        hull() {
            translate([111/2, 0, 0])
            rounded_cube_side(17, 35, 20, 2, center=true, $fn=30);

            translate([111/2, 0, 0])
            cube([31, 1, 20], center=true);
        }

        hull() {
            translate([30, 4, 0])
            cylinder(d=6, h=25, center=true,$fn=40);

            translate([42, 30.2, 0])
            cylinder(d=8, h=25, center=true,$fn=40);

            translate([8, 4, 0])
            cylinder(d=6, h=25, center=true,$fn=40);

            translate([7, 86.5, 0])
            cylinder(d=4, h=25, center=true,$fn=40);
        }

        hull() {
            translate([-30, 4, 0])
            cylinder(d=6, h=25, center=true,$fn=40);

            translate([-42, 30.2, 0])
            cylinder(d=8, h=25, center=true,$fn=40);

            translate([-8, 4, 0])
            cylinder(d=6, h=25, center=true,$fn=40);

            translate([-7, 86.5, 0])
            cylinder(d=4, h=25, center=true,$fn=40);
        }

        hull() {
            translate([0, 101, 0])
            cylinder(d=8.2, h=20, center=true, $fn=40);

            translate([0, 111, 0])
            cylinder(d=12, h=20, center=true, $fn=40);
        }

        rotate([-1.05, 0, 0])
        cube([1.8, 300, 8.8], center=true);
        
        translate([32.5, 0, 0])
        rotate([-1.05, 0, 0])
        cube([1.8, 300, 8.8], center=true);

        translate([-32.5, 0, 0])
        rotate([-1.05, 0, 0])
        cube([1.8, 300, 8.8], center=true);

        translate([-26, -3, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([26, -3, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([-26, -3, -10 + 2.4])
        chamfered_cylinder(6.2, 10, 1.5, $fn=30);

        translate([26, -3, -10 + 2.4])
        chamfered_cylinder(6.2, 10, 1.5, $fn=30);

        translate([0, 200/2 + 5, 20/2 + 6])
        chamfered_cube(200, 200, 20, 2, center=true);
    }
}

module dry_box_silica_core_adapter_joiner() {
    difference() {
        union() {
            translate([0, 26, 8/2])
            rotate([0, 90, 0])
            chamfered_cube_side(8, 10, 76, 2, center=true);

            translate([0, -26, 8/2])
            rotate([0, 90, 0])
            chamfered_cube_side(8, 10, 76, 2, center=true);

            translate([-76/2 + 4/2, 0, 5/2])
            cube([4, 50, 5], center=true);

            translate([76/2 - 4/2, 0, 5/2])
            cube([4, 50, 5], center=true);

            translate([0, 0, 5/2])
            rotate([0, 0, 55])
            cube([4, 90, 5], center=true);

            translate([0, 0, 5/2])
            rotate([0, 0, -55])
            cube([4, 90, 5], center=true);
        }

        translate([76/2, 26, 8/2])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=30, center=true, $fn=30);

        translate([-76/2, 26, 8/2])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=30, center=true, $fn=30);

        translate([76/2, -26, 8/2])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=30, center=true, $fn=30);

        translate([-76/2, -26, 8/2])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=30, center=true, $fn=30);

        translate([0, 0, 200/2 + 4.5])
        rotate([0, 90, 0])
        cylinder(d=200, h=80, center=true, $fn=200);

    }
}