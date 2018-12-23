
module _washer(outer_d, inner_d, h) {
    $fn=40;
    difference() {
        cylinder(d=outer_d,h=h);
        cylinder(d=inner_d,h=h*3,center=true);
    }
}

module washer_M4(h=1) {
    _washer(7.5, 4.5, h);
}

module washer_tronxy_idler() {
    _washer(7.8, 5.4, 0.6);
}

module tronxy_idler_spacer() {
    $fn=40;
    difference() {
        hull() {
            cylinder(d=7.8, h=4.2);
            cylinder(d=8.8, h=3.7);
        }
        cylinder(d=5.4,h=5);
    }
}

module washer_13_8_1() {
    _washer(13, 8, 1);
}


//washer_M4(1.8);
//washer_tronxy_idler();
//tronxy_idler_spacer();
washer_13_8_1();

