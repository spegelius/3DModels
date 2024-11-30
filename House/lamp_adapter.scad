use <../Dollo/New_long_ties/include.scad>;

wall = 3;
id = 175;
od = id + 2*wall;
h = 40;


//debug();

lamp_adapter();


module debug() {
    intersection() {
//        translate([200, 200])
//        rotate([0, 0, 30])
//        translate([-200, -200])
        lamp_adapter();

        translate([200, 200])
        cube([300, 10, 200], center=true);
    }
}

module lamp_adapter() {
    supports = 40;

    module _support_slice() {
        hull() {
            cylinder(d=0.1, h=80, center=true);

            rotate([0, 0, -360/supports/2])
            translate([od/2/2, 0, 0])
            cube([od/2, 1, 80], center=true);

            rotate([0, 0, 360/supports/2])
            translate([od/2/2, 0, 0])
            cube([od/2, 1, 80], center=true);
        }
    }

    module _lines() {
        translate([154/2 + 1.4, 0, h - wall - 0.25/2])
        cube([1, 50, 0.25], center=true);

        translate([154/2 + 3.2, 0, h - wall - 0.25/2])
        cube([1, 50, 0.25], center=true);

        translate([154/2 + 5, 0, h - wall - 0.25/2])
        cube([1, 50, 0.25], center=true);

//        translate([154/2 + 7, 0, h - wall - 0.25/2])
//        cube([1, 50, 0.25], center=true);
    }

    module _inner() {
        difference() {
            translate([0, 0, wall])
            hull() {
                cylinder(d=id, h=32 - 2*wall, $fn=120);
                cylinder(d=id - 9, h=h - 2*wall, $fn=120);
            }

            for(i = [0:supports - 1]) {
                rotate([0, 0, 360/supports*i])
                translate([od/2 - 6.5, 0, 38])
                rotate([0, -45, 0])
                cube([10, 1.4, 30], center=true);

                rotate([0, 0, 360/supports*(i + 1/2)])
                intersection() {
                    _lines();
                    _support_slice();
                }
            }
        }
    }

    translate([200, 200])
    difference() {
        hull() {
            cylinder(d=od, h=h - 10, $fn=120);
            cylinder(d=170, h=h, $fn=120);
        }

        _inner();

        // bottom hole
        cylinder(d=40, h=200, center=true, $fn=40);

        // top hole with chamfer
        translate([0, 0, 10])
        cylinder(d=154, h=h, $fn=120);

        translate([0, 0, h - wall])
        cylinder(
            d1=162, d2=150, h=8, center=true, $fn=120
        );

        //mount holes
//        translate([40, 0, 0])
//        cylinder(d=5, h=100, center=true, $fn=30);
//
//        translate([-40, 0, 0])
//        cylinder(d=5, h=100, center=true, $fn=30);
//
//        // lamp mount holes
//        translate([-od/2 + 8, 0, 40])
//        cylinder(d=3, h=40, center=true, $fn=30);
//
//        translate([od/2 - 8, 0, 40])
//        cylinder(d=3, h=40, center=true, $fn=30);
    }
}