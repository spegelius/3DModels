
module U604zz() {
    difference() {
        cylinder(d=13, h=4, $fn=30);
        cylinder(d=4, h=5, $fn=20);

        translate([0, 0, 4/2])
        donut(13, 2.1, $fn=30);
    }
}

module 608zz() {
    difference() {
        cylinder(d=22, h=7, $fn=50);
        cylinder(d=8, h=80, center=true, $fn=50);
    }
}

module 623zz() {
    difference() {
        hull() {
            cylinder(d=9, h=4, $fn=40);

            translate([0, 0, 0.5])
            cylinder(d=10, h=3, $fn=40);
        }

        cylinder(d=3, h=15, $fn=30, center=true);
    }
}

module MR105zz() {
    difference() {

        hull() {
            cylinder(d=9.5, h=4, $fn=80);

            translate([0, 0, 0.25])
            cylinder(d=10, h=3.5, $fn=80);
        }
        
        translate([0, 0, -1/2])
        cylinder(d=5, h=5, $fn=60);
    }
}

module 625zz() {
    difference() {
        hull() {
            cylinder(d=15, h=5, $fn=40);

            translate([0, 0, 0.5])
            cylinder(d=16, h=4, $fn=40);
        }

        cylinder(d=5, h=15, $fn=30, center=true);
    }
}

module trapezoid_bearing() {
    difference() {
        union() {
            hull() {
                cylinder(d=27, h=4, $fn=40);

                translate([36.5/2, 0, 0])
                cylinder(d=11, h=4, $fn=30);

                translate([-36.5/2, 0, 0])
                cylinder(d=11, h=4, $fn=30);
            }

            cylinder(d=26.5, h=8, $fn=35);
            cylinder(d=12, h=11, $fn=30);
        }

        cylinder(d=8, h=40, center=true, $fn=30);

        translate([36.5/2, 0, 0])
        cylinder(d=5, h=20, center=true, $fn=20);

        translate([-36.5/2, 0, 0])
        cylinder(d=5, h=20, center=true, $fn=20);

    }
}

//trapezoid_bearing();