use <../../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../../_downloaded/";
spath = str(
    stl_base_path, "Raspberry Pi 3 2 b/"
);

//_rpi_vesa_bottom();
//debug_raspi_mount();

//raspi_mount_1();
raspi_mount_2();


module _rpi_vesa_bottom() {
    import(
        str(spath, "rpi3-bottom_100mm-vesa_netfabb.stl"),
        convexity=10
    );
}

module debug_raspi_mount() {

    _rpi_vesa_bottom();

    translate([104.3, 4.3, -4.55])
    rotate([0, -90, 90])
    raspi_mount_1();

    translate([104.3, 104.3, -4.55])
    rotate([0, -90, 90])
    raspi_mount_2();
}

module raspi_mount_1() {
    difference() {
        union() {
            intersection() {
                hull() {
                    translate([0, 1.5, 0])
                    rotate([0, 90, 0])
                    cylinder(d=15, h=5, center=true, $fn=40);

                    translate([-38, -5/2 + 113, 0])
                    rotate([90, 0, 0])
                    cylinder(d=15, h=5, center=true, $fn=40);

                    translate([-10/2 + 5/2, -10/2 + 113, 0])
                    cylinder(d=10, h=12, center=true, $fn=40);
                }
                cube([300, 300, 12], center=true);
            }

            rotate([0, 90, 0])
            cylinder(d=9, h=5/2 + 2, $fn=40);

            translate([0, 100, 0])
            rotate([0, 90, 0])
            cylinder(d=9, h=5/2 + 2, $fn=40);
        }

        translate([-60/2 - 5/2, 0, 0])
        cube([60, (50 + 58)*2, 30], center=true);

        rotate([0, 90, 0])
        cylinder(d=4.3, h=10, center=true, $fn=40);

        translate([1.4, 0, 0])
        rotate([0, -90, 0])
        M4_nut(4);

        translate([0, 100, 0])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=10, center=true, $fn=40);

        translate([1.4, 100, 0])
        rotate([0, -90, 0])
        M4_nut(4);

        translate([-5/2 - 13.1, 110, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-5/2 - 13.1, 117, 0])
        rotate([90, 0, 0])
        chamfered_cylinder(7, 7, 2.2, $fn=30);

        translate([-5/2 - 13.1 - 22.75, 110, 0])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-5/2 - 13.1 - 22.75, 117, 0])
        rotate([90, 0, 0])
        chamfered_cylinder(7, 7, 2.2, $fn=30);
    }
}

module raspi_mount_2() {
    difference() {
        union() {
            intersection() {
                hull() {
                    translate([0, 1.5, 0])
                    rotate([0, 90, 0])
                    cylinder(d=15, h=5, center=true, $fn=40);

                    translate([-10/2 + 5/2, -10/2 + 113, 0])
                    cylinder(d=10, h=12, center=true, $fn=40);

                    translate([5/2 - 125.5 - 5, -5/2 + 113, 0])
                    cylinder(d=5, h=12, center=true, $fn=40);

                    translate([5/2 - 125.5 - 5, -5/2 + 105, 0])
                    cylinder(d=5, h=12, center=true, $fn=40);
                }
                cube([300, 300, 12], center=true);
            }

            rotate([0, 90, 0])
            cylinder(d=9, h=5/2 + 2, $fn=40);

            translate([0, 100, 0])
            rotate([0, 90, 0])
            cylinder(d=9, h=5/2 + 2, $fn=40);
        }

        translate([-125.7/2 - 5/2, 0, 0])
        cube([125.7, (50 + 58)*2, 30], center=true);

        rotate([0, 90, 0])
        cylinder(d=4.3, h=10, center=true, $fn=40);

        translate([1.4, 0, 0])
        rotate([0, -90, 0])
        M4_nut(4);

        translate([0, 100, 0])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=10, center=true, $fn=40);

        translate([1.4, 100, 0])
        rotate([0, -90, 0])
        M4_nut(4);
    }
}