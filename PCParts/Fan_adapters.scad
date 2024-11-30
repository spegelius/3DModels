use <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


fan_adapter_supernas_140mm();


module fan_adapter_supernas_140mm() {
    %mock_fan_140mm();

    intersection() {
        difference() {
            union() {
                cylinder(d=220, h=1, $fn=100);

                for(i = [0:3]) {
                    rotate([0, 0, 90*i])
                    translate([147.5/2, 147.5/2, 0])
                    cylinder(d=11, h=5, $fn=30);
                }

                translate([0, 0, 4/2])
                cube([146, 146, 4], center=true);

                tube(220, 4, 4, $fn=100);

                translate([194/2, 0, 4/2])
                cube([8, 102, 4], center=true);

                translate([-194/2, 0, 4/2])
                cube([8, 102, 4], center=true);
            }

            for(i = [0:3]) {
                rotate([0, 0, 90*i])
                translate([147.5/2, 147.5/2, 0])
                cylinder(d=4.4, h=20, center=true, $fn=30);
            }

            cylinder(d=141, h=20, center=true, $fn=100);

            translate([0, 0, 4/2 + 2])
            cube([141, 141, 4], center=true);

            fan_mount_holes(140, h_d=4.4, h=100);
        }
        cube([194, 250, 20], center=true);
    }
}