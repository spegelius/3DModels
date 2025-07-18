use <../lib/bearings.scad>;

_router_bit();
//_router_bit_large();


module _router_bit() {
    union() {
        cylinder(d=6.35, h=93.5, $fn=40);

        translate([0, 0, 39.3])
        cylinder(d=12.7, h=5, $fn=60);

        translate([0, 0, 93.5 - 8.8])
        cylinder(d=12.7, h=5, $fn=60);

        translate([0, 0, 41])
        cylinder(d=10.4, h=44, $fn=30);

        translate([0, 0, 63])
        cube([0.1, 12.68, 44], center=true);

        translate([0, 0, 32.1])
        R4AZZ();
    }
}

module _router_bit_large() {
    union() {
        cylinder(d=8, h=69.7, $fn=40);

        // bearing1
        translate([0, 0, 27])
        cylinder(d=22, h=7, $fn=60);

        // top bearing
        translate([0, 0, 69.7 - 7])
        cylinder(d=19, h=7, $fn=60);

        // 
        translate([0, 0, 34.5])
        cylinder(d=16, h=25.7, $fn=30);

        translate([0, 0, 34.5 + 25.7/2])
        cube([0.1, 18.88, 25.7], center=true);
    }
}