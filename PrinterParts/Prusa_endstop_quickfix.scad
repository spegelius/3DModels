difference() {
    cube([17, 17, 4.6], center=true);

    translate([17/2 - 7.5, 9.5/2, 0])
    cylinder(d=1.8, h=20, center=true, $fn=10);

    translate([17/2 - 7.5, -9.5/2, 0])
    cylinder(d=1.8, h=20, center=true, $fn=10);

}