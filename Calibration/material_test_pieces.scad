use <../Dollo/NEW_long_ties/include.scad>;



material_test_pieces();


module standing() {
    translate([0, 0, 40/2])
    difference() {
        cube([10, 4, 40], center=true);

        translate([10/2 + 3, 0, 0])
        chamfered_cube(10, 20, 10, 2, center=true);

        translate([-10/2 - 3, 0, 0])
        chamfered_cube(10, 20, 10, 2, center=true);
    }
}

module flat() {
    translate([0, 0, 4/2])
    cube([80, 10, 4], center=true);
}

module material_test_pieces() {

    standing();

    translate([0, 7, 0])
    standing();

    translate([0, 14, 0])
    standing();

    translate([50, 0, 0])
    flat();

    translate([50, 13, 0])
    flat();

    translate([50, 26, 0])
    flat();

}