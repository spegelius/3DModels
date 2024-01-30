
module _beam(length) {
    hull() {
        cube([length, 4, 3], center=true);

        cube([length - 2, 2, 5], center=true);
    }
}

union() {
    translate([4/2, 150/2, 5/2])
    rotate([0, 0, 90])
    _beam(150);

    translate([150/2, 4/2, 5/2])
    _beam(150);

    translate([10/2 + 1, 150 - 4/2, 5/2])
    _beam(10);

    translate([150 - 4/2, 10/2 + 1, 5/2])
    rotate([0, 0, 90])
    _beam(10);

    intersection() {
        translate([70, 70, 5/2])
        rotate([0, 0, -45])
        _beam(200);

        translate([1, 1, 0])
        cube([200, 200, 10]);
    }
}