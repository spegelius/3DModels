
include <../Dollo/NEW_long_ties/include.scad>;

w = 50;
l = 25;

chamfer = 3.5;

//top_r();
//bottom_r();

//top_f();
//bottom_f();

//top_rf();
bottom_rf();


module _cable_round() {
    difference() {
        rotate([0, 90, 0])
        cylinder(d=6.5, h=w/2 + 10, $fn=40);

        translate([w/2 - 7.5, 0, -6.5/2])
        rotate([90, 0, 0])
        cylinder(d=0.8, h=20, center=true, $fn=15);

        translate([w/2 - 7.5, 0, 6.5/2])
        rotate([90, 0, 0])
        cylinder(d=0.8, h=20, center=true, $fn=15);

    }
}

module _cable_flat() {
    difference() {
        rotate([0, -90, 0])
        hull() {
            translate([0, 1, 0])
            cylinder(d=3.5, h=w/2 + 10, $fn=20);

            translate([0, -1, 0])
            cylinder(d=3.5, h=w/2 + 10, $fn=20);
        }

        translate([-w/2 + 7.5, 0, -3.5/2])
        rotate([90, 0, 0])
        cylinder(d=0.8, h=20, center=true, $fn=10);

        translate([-w/2 + 7.5, 0, 3.5/2])
        rotate([90, 0, 0])
        cylinder(d=0.8, h=20, center=true, $fn=10);

    }
}

module _half() {
    difference() {
        intersection() {
            chamfered_cube(
                w, l, 20, chamfer, center=true
            );

            translate([0, 0, -10/2])
            cube([w, l, 10], center=true);
        }
        chamfered_cube(
            w - 3, l - 3, 20 - 3,
            chamfer - 1.5, center=true
        );

//        _cable_round();
//        _cable_flat();
    }
}

module _top() {
    difference() {
        union() {
            _half();

            translate([w/2 - 7.5, 0, -8.8/2 - 0.2])
            cube([7, 17, 8.8], center=true);

            translate([-w/2 + 7.5, 0, -8.8/2 - 0.2])
            cube([7, 17, 8.8], center=true);
        }
        translate([w/2 - 7.5, 5, -8.5])
        cylinder(d=2.7, h=10, $fn=30);

        translate([w/2 - 7.5, -5, -8.5])
        cylinder(d=2.7, h=10, $fn=30);

        translate([-w/2 + 7.5, 5, -8.5])
        cylinder(d=2.7, h=10, $fn=30);

        translate([-w/2 + 7.5, -5, -8.5])
        cylinder(d=2.7, h=10, $fn=30);
    }
}

module _bottom() {
    difference() {
        union() {
            _half();

            translate([w/2 - 7.5, 0, -8.8/2 - 0.2])
            cube([8, 19, 8.8], center=true);

            translate([-w/2 + 7.5, 0, -8.8/2 - 0.2])
            cube([8, 19, 8.8], center=true);
        }

        translate([w/2 - 7.5, 5, -11]) {
            translate([0, 0, 4])
            cylinder(d=3.2, h=10, $fn=30);

            cylinder(d=6.5, h=3.8, $fn=30);
        }

        translate([w/2 - 7.5, -5, -11]) {
            translate([0, 0, 4])
            cylinder(d=3.2, h=10, $fn=30);

            cylinder(d=6.5, h=3.8, $fn=30);
        }

        translate([-w/2 + 7.5, 5, -11]) {
            translate([0, 0, 4])
            cylinder(d=3.2, h=10, $fn=30);

            cylinder(d=6.5, h=3.8, $fn=30);
        }

        translate([-w/2 + 7.5, -5, -11]) {
            translate([0, 0, 4])
            cylinder(d=3.2, h=10, $fn=30);

            cylinder(d=6.5, h=3.8, $fn=30);
        }
    }
}

module top_rf() {
    // round and flat cables
    difference() {
        _top();
        _cable_round();
        _cable_flat();
    }
}

module bottom_rf() {
    // round and flat cables
    difference() {
        _bottom();

        translate([0, 0, 0.2])
        _cable_round();

        translate([0, 0, 0.2])
        _cable_flat();
    }
}

module top_r() {
    // round cables
    difference() {
        _top();
        _cable_round();

        mirror([1, 0, 0])
        _cable_round();
    }
}

module bottom_r() {
    // round cables
    difference() {
        _bottom();

        translate([0, 0, 0.2])
        _cable_round();

        translate([0, 0, 0.2])
        mirror([1, 0, 0])
        _cable_round();
    }
}

module top_f() {
    // round cables
    difference() {
        _top();
        _cable_flat();

        mirror([1, 0, 0])
        _cable_flat();
    }
}

module bottom_f() {
    // round cables
    difference() {
        _bottom();

        translate([0, 0, 0.2])
        _cable_flat();

        translate([0, 0, 0.2])
        mirror([1, 0, 0])
        _cable_flat();
    }
}