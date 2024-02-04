
difference() {
    union() {
        hull() {
            cylinder(d=5, h=6, $fn=30);

            translate([114, 43, 0])
            cylinder(d=5, h=6, $fn=30);
        }

//        hull() {
//            cylinder(d=5, h=6, $fn=30);
//
//            translate([0, 87.5, 0])
//            cylinder(d=5, h=6, $fn=30);
//        }

        translate([15, 87.5/2, 6/2])
        cube([5, 78, 6], center=true);
        

        hull() {
            translate([114, 43, 0])
            cylinder(d=5, h=6, $fn=30);

            translate([0, 87.5, 0])
            cylinder(d=5, h=6, $fn=30);
        }

        cylinder(d=12, h=6, $fn=30);

        translate([114, 43, 0])
        cylinder(d=12, h=6, $fn=30);

        translate([0, 87.5, 0])
        cylinder(d=12, h=6, $fn=30);
    }

    cylinder(d=4, h=18, center=true, $fn=30);

    translate([114, 43, 0])
    cylinder(d=4, h=18, center=true, $fn=30);

    translate([0, 87.5, 0])
    cylinder(d=4, h=18, center=true, $fn=30);
}