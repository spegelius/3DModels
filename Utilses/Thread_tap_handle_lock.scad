use <../Dollo/NEW_long_ties/include.scad>;

//_mockup();
//debug();

handle_lock();


module _mockup() {
    cylinder(d=12, h=20, $fn=40);

    translate([0, 0, 9.5])
    rotate([0, 90, 0])
    cylinder(d=5.9, h=78.7, center=true, $fn=30);

}

module debug() {
    translate([0, 0, -2])
    _mockup();

    handle_lock();
}

module handle_lock() {
    difference() {
        union() {
            rounded_cylinder(
                16, 10, 2, $fn=60
            );

            hull() {
                translate([0, 0, 10 - 7/2])
                rounded_cube(
                    25, 9, 7, 2, center=true, $fn=60
                );

                translate([0, 0, 7/2])
                rounded_cube(
                    18.2, 9, 7, 2, center=true, $fn=60
                );
            }
        }
        cylinder(d=12.2, h=60, center=true, $fn=40);

        translate([0, 0, 7.5])
        rotate([0, 90, 0])
        cylinder(d=5.9, h=78.7, center=true, $fn=30);

        translate([0, 0, 10])
        hull() {
            cube([26, 5.5, 5], center=true);
            cube([12, 6, 5], center=true);
        }
    }
}