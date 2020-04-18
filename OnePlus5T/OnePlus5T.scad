use <../Dollo/NEW_long_ties/include.scad>;

_offset = 11/2 + 7.3/2;

module body() {
    hull() {
        translate([-75/2+_offset,-156.1/2+_offset])
        donut(11,7.3,$fn=30);

        translate([75/2-_offset,-156.1/2+_offset])
        donut(11,7.3,$fn=30);

        translate([-75/2+_offset,156.1/2-_offset])
        donut(11,7.3,$fn=30);

        translate([75/2-_offset,156.1/2-_offset])
        donut(11,7.3,$fn=30);
    }
    translate([-75/2+21/2+10,156/2-11/2-5,7.3/2])
    hull() {
        translate([-21/2+11/2,0,0])
        cylinder(d1=11, d2=9, h=1.5,$fn=30);

        translate([21/2-11/2,0,0])
        cylinder(d1=11, d2=9, h=1.5,$fn=30);
    }
}

body();