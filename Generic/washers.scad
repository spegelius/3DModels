

module _washer(outer_d, inner_d, h) {
    $fn=80;
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

module washer_8_5_1() {
    _washer(8, 5.3, 1);
}

module washer_7_5_2() {
    _washer(7, 5.3, 2);
}

module washer_7_5_2_5() {
    _washer(7, 5.3, 2.5);
}

module washer_plate(count_side, outer_d, inner_d, h) {
    union() {
        for (i = [0:count_side-1]) {
            for (j = [0:count_side-1]) {
                translate([i*(outer_d+1),j*(outer_d+1),0])
                _washer(outer_d, inner_d, h);
            }
        }
        
        for (i = [0:count_side-2]) {
            for (j = [0:count_side-1]) {
                translate([i*(outer_d+1)+outer_d/2+1/2,
                           j*(outer_d+1), 0.2/2])
                cube([1.2,1,0.2],center=true);
            }
        }
        
        for (i = [0:count_side-1]) {
            for (j = [0:count_side-2]) {
                translate([i*(outer_d+1),
                           j*(outer_d+1)+outer_d/2+1/2, 0.2/2])
                cube([1,1.2,0.2],center=true);
            }
        }
    }
}

//washer_M4(1.8);
//washer_tronxy_idler();
//tronxy_idler_spacer();
//washer_13_8_1();
//washer_7_5_2();
//washer_7_5_2_5();

washer_plate(4, 8.5, 3.2, 0.8);
