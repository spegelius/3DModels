
logo = "logo_bittium.png";

//surface(file=logo, invert=true, convexity = 5);
module logo3d() {
    difference() {
        scale([1,1,1]) translate([0,-4,0]) rotate([90,0,0]) intersection() {
            scale([0.10,0.10,2]) surface(file=logo, invert=true, convexity = 5);
            translate([0,0,-5]) cube([140,30,1]);
        }
    }
}

module _pi() {
    intersection() {
        scale([1.5,1.5,1.8]) translate([0,0,4]) import("PiOpener2-2_d295k.stl", convexity=10);
        translate([0,0,15/2]) cube([100,100,15], center=true);
    }
}

module _inner_pi(height=15) {
    translate([0,0,-0.1]) difference() {
        linear_extrude(0.7) offset(-2) projection(true) _pi();
        translate([36,28.3,-.01]) rotate([90,0,180]) logo3d();
    }
    translate([0,0,height-0.6]) difference() {
        linear_extrude(0.7) offset(-2) projection(true) _pi();
        translate([-16,28.3,.99]) rotate([-90,0,0]) logo3d();
    }

}

module pi() {
    difference() {
        _pi();
        _inner_pi();
    }
}

module pi_v2() {
    difference() {
        _pi();
        translate([0,0,0.2]) _inner_pi(14.6);
    }
}

module pi2() {
    intersection() {
        _inner_pi();
        translate([0,0,15/2]) cube([100,100,15], center=true);
    }
}

module pi2_v2() {
    intersection() {
        translate([0,0,0.2]) _inner_pi(14.6);
        translate([0,0,15/2]) cube([100,100,15], center=true);
    }
}

//pi();
//pi2();
//pi_v2();
pi2_v2();