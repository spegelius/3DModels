
module outer() {
    difference() {
        cube([60, 60, 60], center=true);
        sphere(d=74, $fn=80);
    }
}

module inner_minus() {
    for (i = [0:3])
    rotate([0, 0, 360/4*i])
    translate([-7, -52/2 + 10, -10])
    rotate([90, 0, 0])
    linear_extrude(11)
    text("B", size=20);
}

module inner_text() {
    translate([0, 0, -(60 - 54)/2])
    intersection() {
        inner_minus();
        sphere(d=54, $fn=60);
    }
}

module inner() {
    translate([0, 0, -(60 -54)/2])
    difference() {
        sphere(d=54, $fn=60);
        inner_minus();
    }
}


outer();
inner();
inner_text();

