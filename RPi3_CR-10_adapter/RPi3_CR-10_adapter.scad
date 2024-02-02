use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
rpi_stl_path = str(
    stl_base_path,
    "Raspberry Pi 3 2 b/");


//debug();

adapter_clip();


module debug() {
    translate([-108.5/2, -108.5/2, 0])
    import(str(
        rpi_stl_path,
        "rpi3-bottom_100mm-vesa_netfabb.stl"
    ));

    translate([-108.5/2 + 4.25, 0, -30/2 - 2])
    rotate([90, 0, 90])
    adapter_clip();
}

module adapter_clip() {
    difference() {
        union() {
            intersection() {
                rounded_cube_side(
                    129, 30, 12, 10, center=true, $fn=20
                );

                hull() {
                    translate([0, 40, 0])
                    cube([130, 1, 20], center=true);

                    translate([0, 18/2, 0])
                    rotate([0, 90, 0])
                    cylinder(
                        d=18, h=130,
                        center=true, $fn=40
                    );
                }
            }

            translate([-108.5/2 + 4.25, 30/2, 0])
            rotate([90, 0, 0])
            cylinder(d=8.5, h=4, center=true, $fn=60);

            translate([108.5/2 - 4.25, 30/2, 0])
            rotate([90, 0, 0])
            cylinder(d=8.5, h=4, center=true, $fn=60);

        }

        difference() {
            cube([125, 20, 20], center=true);

            translate([-125/2 - 20/2 + 0.4, 4, 0])
            cylinder(d=20, h=20, center=true, $fn=60);

            translate([125/2 + 20/2 - 0.4, 4, 0])
            cylinder(d=20, h=20, center=true, $fn=60);
        }

        translate([-108.5/2 + 4.25, 30/2, 0])
        rotate([90, 0, 0]) {
            cylinder(d=4, h=20, center=true, $fn=20);

            translate([0, 0, 1])
            rotate([0, 0, 30])
            M4_nut(4);
        }

        translate([108.5/2 - 4.25, 30/2, 0])
        rotate([90, 0, 0]) {
            cylinder(d=4, h=20, center=true, $fn=20);

            translate([0, 0, 1])
            rotate([0, 0, 30])
            M4_nut(4);
        }
    }
}