
//soluble_test_1();

//soluble_test_2_p1();
soluble_test_2_p2();

module soluble_test_1() {

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

s2_h = 35;

module soluble_test_2_p1() {

    difference() {
        union() {
            translate([30/2 + 3, 0, s2_h/2])
            cube([10, 10, s2_h], center=true);

            translate([-30/2 - 3, 0, s2_h/2])
            cube([10, 10, s2_h], center=true);

            translate([30/2 + 3, 0, s2_h/2])
            cube([10, s2_h, 10], center=true);

            translate([-30/2 - 3, 0, s2_h/2])
            cube([10, s2_h, 10], center=true);
        }

        soluble_test_2_p2();
    }
}

module soluble_test_2_p2() {
    translate([0, 0, s2_h/2])
    sphere(d=30, $fn=40);
}