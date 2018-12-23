
module _yingyang() {
    d = 80;
    h = 10;
    difference() {
        union() {
            intersection() {
                cylinder(d=d,h=h,$fn=100);
                translate([0,-100,0]) cube([100,200,11]);
            }
            translate([0,d/4-1/2,0]) cylinder(d=d/2-1,h=h,$fn=100);
            translate([0,-d/2+0.5]) cylinder(d=1,h=h,$fn=20);
        }
        translate([0,-d/4+1/2,-0.1]) cylinder(d=d/2-1,h=h+1,$fn=100);
        translate([0,d/4,-0.1]) cylinder(d=d/6,h=h+1,$fn=100);
        translate([0,d/2-0.5]) cylinder(d=1,h=h,$fn=20);
    }
    translate([0,-d/4,0]) cylinder(d=d/6,h=h,$fn=100);
}

module ying() {
    _yingyang();
}

module yang() {
    rotate([0,0,180]) _yingyang();
}

ying();
//yang();