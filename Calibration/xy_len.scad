//xy_len(120);
//xy_len(150);
xy_len(250);
//xy_len(300);


module _beam(length) {
    hull() {
        cube([length, 4, 3], center=true);

        cube([length - 2, 2, 5], center=true);
    }
}

module xy_len(length) {
    union() {
        translate([4/2, length/2, 5/2])
        rotate([0, 0, 90])
        _beam(length);

        translate([length/2, 4/2, 5/2])
        _beam(length);

        translate([10/2 + 1, length - 4/2, 5/2])
        _beam(10);

        translate([length - 4/2, 10/2 + 1, 5/2])
        rotate([0, 0, 90])
        _beam(10);

        translate([10/2 + 1, length/2 - 4/2, 5/2])
        _beam(10);

        translate([length/2 - 4/2, 10/2 + 1, 5/2])
        rotate([0, 0, 90])
        _beam(10);

        intersection() {
            translate([length/2.3, length/2.3, 5/2])
            rotate([0, 0, -45])
            _beam(length * 2);

            translate([1, 1, 0])
            cube([length * 2, length * 2, 10]);
        }

        if(length > 200) {
            hull() {
                translate([2.5, 2.5, 0])
                cylinder(d=3, h=5, $fn=30);

                translate([
                    length/2.3 - 0.3, length/2.3 - 0.3, 0
                ])
                cylinder(d=3, h=5, $fn=30);
            }
        }
    }
}