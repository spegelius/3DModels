
$fn=100;

module ring(x=10, d=7) {
    hull() {
        rotate_extrude(convexity=7) {
            translate([x, 0, 0])
            circle(d=d);
        }
    }
}

module ring2(d=14) {
    hull() {
        translate([0, 0, -2.5])
        cylinder(d=d - 5, h=2.4);

        cylinder(d=d, h=0.2, center=true);

        translate([0, 0, 0.1])
        cylinder(d=d - 5, h=2.4);
    }
}

difference() {
    ring(x=8, d=5);
    //ring(x=3, d=8);
    ring2(d=18);
}

//difference() {
//    translate([0, 0, 0])
//    sphere(d=13.9);

//    translate([0, 0, 2.4])
//    cylinder(d=14, h=5);

//    translate([0, 0, -7.4])
//    cylinder(d=14, h=5);
//}

//translate([40, 0, 0])
//ring2();

//difference() {
//    ring2(d=17.2);
//    cube([4, 4, 10], center=true);
//}