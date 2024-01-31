$fn=30;

bed_carriage_bottom();

module base() {
    difference() {
        //base
        cube([40, 56, 4]);
    
        hull() {
            translate([10, 8, 0])
            cylinder(d=5, h=8);

            translate([12, 8, 0])
            cylinder(d=5, h=8);
        }
        translate([30, 8, 0])
        cylinder(d=5, h=8);

        hull() {
            translate([30, 46, 0])
            cylinder(d=5, h=8);

            translate([30, 48, 0])
            cylinder(d=5, h=8);
        }
    }
}

module body() {
    union() {
        base();
        translate([0, 13, 0])
        cube([40, 28, 10]);

        translate([0, 41, 0])
        cube([20, 6, 10]);
    }
}

module bed_carriage_bottom() {
    difference() {
        body();

        translate([7, 18, 0])
        cylinder(d=3.3, h=11);

        translate([33, 18, 0])
        cylinder(d=3.3, h=11);

        translate([7, 38, 0])
        cylinder(d=3.3, h=11);

        translate([33, 36, 0]) cylinder(d=3.3, h=11);
    }
}
