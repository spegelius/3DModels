

difference() {
    cylinder(d=49, h=4, $fn=6);
    cylinder(d=27.7, h=5, $fn=6);
    translate([13.7,0]) rotate([0,0,30]) cube([30,50, 10]);
    translate([-9.3,-40]) rotate([0,0,-30]) cube([30,60, 10]);
}

difference() {
    hull() {
        translate([-80,0,0]) cylinder(d=20,h=4);
        translate([-15,-30/2,0]) cube([1,30,4]);
    }
    translate([-80,0,0]) cylinder(d=8,h=4);
}