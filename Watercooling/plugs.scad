
$fn=80;

plug_dia = 11;

union() {
    translate([0, 0, 3])
    intersection() {
        cube([20, 6, 6], center=true);

        translate([10, 0, 0])
        rotate([0, -90, 0])
        cylinder(d=7, h=20);
    }

    hull() {
        cylinder(d=plug_dia, h=1);
        translate([0, 0, 25])
        sphere(d=plug_dia);

        translate([0, 0, 30])
        cylinder(d=9, h=0.1);
    }
}