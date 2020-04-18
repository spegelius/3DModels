
difference() {
    cube([214,6,1]);
    translate([2.5,3,-0.1]) cylinder(d=3.2,h=5,$fn=20);
    translate([2.5+209,3,-0.1]) cylinder(d=3.2,h=5,$fn=20);
}