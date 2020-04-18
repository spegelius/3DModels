$fn=50;

module spacer1() {
    difference() {
        cylinder(d=15,h=4.5);
        cylinder(d=10.5,h=7);
    }
}

module spacer2() {
    difference() {
        union() {
            cylinder(d=18,h=1);
            cylinder(d=14.5,h=6);
        }
        translate([1,0,0]) cylinder(d=10.5,h=7);
    }
}

spacer2();