use <../Dollo/NEW_long_ties/include.scad>;

//mock_charger();
//debug();

//charger_wire_support_base();
//charger_wire_support_lid();
//usb_wire_support_base();
usb_wire_support_lid();

module mock_charger() {
    cylinder(d1=35, d2=34.2, h=9, $fn=50);

    translate([0, -35/2 + 2, 5.4/2 + 2])
    rotate([90, 0, 0])
    cylinder(d=5.4, h=10, $fn=30);
}

module debug() {

    translate([-10, 0, 0])
    charger_wire_support_base();

    translate([-10, 0, 0])
    rotate([0, 180, 0])
    charger_wire_support_lid();

    translate([10, 0, 0])
    usb_wire_support_base();

    translate([10, 0, 0])
    rotate([0, 180, 0])
    usb_wire_support_lid();
}

module charger_wire_support_base() {
    difference() {
        rotate([90, 0, 0])
        chamfered_cube_side(
            9.4, 9, 20, 1.2, center=true
        );

        translate([0, -20/2 + 8, 0])
        rotate([90, 0, 0])
        hull() {
            translate([0, 10, 0])
            cylinder(d=5.5, h=16, $fn=30);

            cylinder(d=5.5, h=16, $fn=30);
        }

        rotate([90, 0, 0])
        hull() {
            translate([-0.6, 0, 0])
            cylinder(d=2.8, h=50 ,center=true, $fn=30);

            translate([0.6, 0, 0])
            cylinder(d=2.8, h=50 ,center=true, $fn=30);

            translate([-0.6, 10, 0])
            cylinder(d=2.8, h=50 ,center=true, $fn=30);

            translate([0.6, 10, 0])
            cylinder(d=2.8, h=50 ,center=true, $fn=30);
        }
    }
}

module charger_wire_support_lid() {
    difference() {
        union() {
            translate([0, -20/2 + 7.8/2, -9/2 + 3.2/2])
            cube([5.3, 7.8, 3.2], center=true);

            translate([0, 0, -9/2 + 3.6/2])
            cube([3.8, 20, 3.6], center=true);
        }

        translate([0, -20/2 + 8])
        rotate([90, 0, 0])
        cylinder(d=5.5, h=8.2, $fn=30);

        rotate([90, 0, 0])
        hull() {
            translate([-0.6, 0, 0])
            cylinder(d=2.8, h=50, center=true, $fn=30);

            translate([0.6, 0, 0])
            cylinder(d=2.8, h=50, center=true, $fn=30);
        }
    }
}

module usb_wire_support_base() {
    difference() {
        rotate([90, 0, 0])
        chamfered_cube_side(
            8, 7, 10, 1.2, center=true
        );

        translate([0, -10/2 + 4, 0])
        rotate([90, 0, 0])
        hull() {
            translate([0, 10, 0])
            cylinder(d=5.7, h=8, $fn=30);

            cylinder(d=5.7, h=8, $fn=30);
        }

        rotate([90, 0, 0])
        hull() {
            translate([0, 10, 0])
            cylinder(d=3.1, h=12, center=true, $fn=30);

            cylinder(d=3.1, h=12, center=true, $fn=30);
        }
    }
}

module usb_wire_support_lid() {
    difference() {
        union() {
            translate([0, -10/2 + 3.8/2, -7/2 + 2.2/2])
            cube([5.5, 3.8, 2.2], center=true);

            translate([0, 0, -7/2 + 2.6/2])
            cube([2.9, 10, 2.6], center=true);            
        }


        translate([0, -10/2 + 4])
        rotate([90, 0, 0])
        cylinder(d=5.7, h=4.2, $fn=30);

        rotate([90, 0, 0])
        cylinder(d=3.1, h=50, center=true, $fn=30);
    }
}