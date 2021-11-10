include <common.scad>;
use <ssd_rack.scad>;

$fn=40;

//view_proper();

//leg();
card_plate();
//ssd_attachment();
//ssd_attachment(slot=2);
//fixit();


module leg() {
    difference() {
        union() {
            cylinder(d1=24, d2=12, h=20);
            translate([0, 0, 19.99])
            cylinder(d=12.01, h=5);

            translate([-10/2, -13, 0])
            cube([10, 26, 8]);

            translate([-13, -10/2, 0])
            cube([26, 10, 8]);
        }
        cylinder(d=3, h=32);

        translate([0, 0, 4])
        rotate([90, 0, 0])
        cylinder(d=3, h=32, center=true);

        translate([0, 0, 4])
        rotate([0, 90, 0])
        cylinder(d=3, h=32,center=true);
    }
}

module card_plate() {
    difference() {
        union() {
            mobo_card_plate();

            translate([0, -17.6, 0])
            cube([21, 28, 3]);

            translate([123, -17.6, 0])
            cube([21, 28, 3]);
        }
        translate([7.3, -18.5 + 4.9, -1])
        cylinder(d=4, h=13);

        translate([141 - 18.2 + 9, -18.5 + 4.9, -1])
        cylinder(d=4, h=13);
    }
}

module ssd_attachment(slot=1) {
    difference() {
        union() {
            if (slot == 1) {
                cube([122.5, 10, 3]);
            } else {
                translate([-20, 0, 0])
                cube([162.5, 10, 3]);
            }

            translate([(122.5 - 72)/2 - 1.7, -40])
            cube([74, 10, 1.6]);

            translate([(122.5 - 72)/2 - 1.7, -41.99])
            cube([74.4, 2, 10]);

            translate(
                [(122.5 - 72)/2 - 1.7, 100 - 40 - 10])
            cube([74, 10, 1.6]);

            translate([(122.5 - 72)/2 - 1.7, -40])
            cube([2, 100, 21]);

            translate([(122.5 - 72)/2 + 70.7, -40])
            cube([2, 100, 21]);
        }
        if (slot == 1) {
            rotate([0, 0, 45])
            cube([16, 16, 10], center=true);

            translate([122.5, 0, 0])
            rotate([0, 0, 45])
            cube([16, 16, 10], center=true);
        } else {
            translate([-17, 0, 0])
            rotate([0, 0, 45])
            cube([16, 16, 10], center=true);

            translate([139.5, 0, 0])
            rotate([0, 0, 45])
            cube([16, 16, 10], center=true);
        }

        // center beam cut
        translate([70.4/2 + 25.55, 0, 10/2 + 1.6])
        cube([70.4, 30, 10], center=true);


        // SSD mount holes
        translate([50, -45 + 15.2, 5.5])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=350, center=true);

        translate([50, 65 - 17.5, 5.5])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=350, center=true);

        translate([50, -45 + 15.2, 5.5 + 9.5])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=350, center=true);

        translate([50, 65 - 17.5, 5.5 + 9.5])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=350, center=true);
    }
    
    // crossbar
    if (slot == 1) {
        translate([-6, 7])
        difference() {
            cube([30, 3, 10]);

            translate([5, 0, 3.5])
            rotate([-90, 0, 0])
            cylinder(d=4, center=true, h=15);
        }
        translate([128.5 - 31, 7])
        difference() {
            cube([30, 3, 10]);

            translate([26, 0, 3.5])
            rotate([-90, 0, 0])
            cylinder(d=4, center=true, h=15);
        }
    } else {
        translate([-22.5, 7])
        difference() {
            cube([46.5, 3, 10]);

            translate([5, 0, 3.5])
            rotate([-90, 0, 0])
            cylinder(d=4, center=true, h=15);
        }
        translate([128 - 31, 7])
        difference() {
            cube([46.5, 3, 10]);

            translate([43, 0, 3.5])
            rotate([-90, 0, 0])
            cylinder(d=4, center=true, h=15);
        }
    }
    %translate([95.8, 61, 12])
    rotate([0, 0, 180])
    mock_ssd();

    %translate([95.8, 61, 2.5])
    rotate([0, 0, 180])
    mock_ssd();
}

module fixit() {
    difference() {
        cylinder(d=24, h=5, $fn=40);
        cylinder(d=4, h=6, $fn=40);

        translate([0, 0, 1.8])
        cylinder(d=7.2, h=6, $fn=40);
    }
}

module view_proper() {
    %mock_mobo_card();
    
    translate([6.35 + 281.94, 10.16, -25])
    leg();

    translate([6.35 + 281.94, 10.16 + 154.94, -25])
    leg();

    translate([6.35 + 281.94, 10.16 + 227.33, -25])
    leg();

    translate([6.35 + 157.48 + 45.72, 10, -25])
    leg();

    translate([6.35 + 157.48, 10.16, -25])
    leg();

    translate([6.35 + 157.48, 10.16 + 154.94, -25])
    leg();

    translate([6.35 + 157.48, 10.16 + 227.33, -25])
    leg();

    translate([6.35, 22.86, -25])
    leg();

    translate([6.35, 10.16 + 154.94, -25])
    leg();

    translate([6.35, 10.16 + 227.33, -25])
    leg();

    translate([305 - 148.5, -2.65, -7.4])
    rotate([90, 0, 0])
    card_plate();

    translate([165, 142, -25])
    ssd_attachment();

    translate([23.75, 139, -25])
    ssd_attachment(slot=2);
}
