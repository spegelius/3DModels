
module orig_key() {
    translate([-72.5,-74]) import("../_downloaded/Lockpick/lockpick-10_1.stl");
}

module spiral() {
    linear_extrude(100,twist=1050, convexity=10) translate([5,0,0]) rotate([20,0,0]) circle(5);
}

module _support() {
    difference() {
        union() {
            cylinder(d=11,h=59.15,$fn=30);
            cylinder(d=17,h=0.2,$fn=30);
        }
        cylinder(d=11-1,h=58.15,$fn=30);
    }
}

module new_key1() {
    difference() {
        orig_key();
        spiral();
    }
    // supports
    translate([15,0,0]) _support();
    translate([-15,0,0]) _support();
}

module new_key2() {
    intersection() {
        orig_key();
        spiral();
    }
}

new_key1();
//new_key2();
//spiral();