use <common.scad>;


sata_card_fan_mount();

module sata_card_fan_mount() {
    difference() {
        cube([14, 47, 15], center=true);

        translate([14/2 - 9 -1.7/2, 4, 0])
        cube([1.7, 47, 40], center=true);

        translate([-14/2, 13, 0])
        cube([7, 47, 40], center=true);

        translate([0, 48/2, 15/2])
        cube([20, 10, 9], center=true);
        
        translate([12, 4, 40/2 - 15/2 + 3])
        rotate([0, 90, 0])
        cylinder(d=39, h=30, center=true, $fn=40);

        translate([2.5, 4 - 32/2, -15/2 + 7])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=10, center=true, $fn=20);

        translate([2.5, 4 + 32/2, -15/2 + 7])
        rotate([0, 90, 0])
        cylinder(d=2.7, h=10, center=true, $fn=20);

        translate([3, 25, -15/2 - 1])
        rotate([45, 0, 0])
        cube([15, 10, 10], center=true);

        hull() {
            translate([-3 + 1/2, 10, -15/2 + 5/2])
            cube([1, 47, 5], center=true);

            translate([-3 + 5.5/2, 10, -15/2 - 0.1/2])
            cube([5.5, 47, 0.1], center=true);
        }

        hull() {
            translate([-3 + 1/2, 10, -15/2 + 5/2 + 9])
            cube([1, 47, 5], center=true);

            translate([-3 + 5.5/2, 10, -15/2 + 0.1/2 + 14])
            cube([5.5, 47, 0.1], center=true);
        }
    }

    %translate([14/2 + 10/2, 4, 40/2 - 15/2 + 3])
    rotate([0, 90, 0])
    mock_fan_40mm();
}