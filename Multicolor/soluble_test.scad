
//soluble_test();

soluble_test2();

module soluble_test() {

    difference() {
        union() {
            cylinder(d=60, h=4, $fn=80);

            cylinder(d=15, h=10, $fn=40);

            translate([0, 0, 9])
            cylinder(d=60, h=4, $fn=80);
        }
        cylinder(d=4, h=15, $fn=20);
    }
}

module soluble_test2() {
    h = 35; 
    union() {
        translate([0, 0, h/2])
        sphere(d=30, $fn=40);

        translate([30/2 + 3, 0, h/2])
        cube([10, 10, h], center=true);

        translate([-30/2 - 3, 0, h/2])
        cube([10, 10, h], center=true);

        translate([30/2 + 3, 0, h/2])
        cube([10, h, 10], center=true);

        translate([-30/2 - 3, 0, h/2])
        cube([10, h, 10], center=true);

    }
}