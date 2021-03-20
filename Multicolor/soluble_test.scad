
difference() {
    union() {
        cylinder(d=60,h=4,$fn=80);

        cylinder(d=15,h=10,$fn=40);

        translate([0,0,9])
        cylinder(d=60,h=4,$fn=80);
    }
    cylinder(d=4,h=15,$fn=20);
}