use <../Dollo/NEW_long_ties/include.scad>;

stl_path = "../_downloaded/Marvin_dual_color/";


//_orig_marvin_1();
//_orig_marvin_2();

new_marvin_dc_1();
new_marvin_dc_2();


module _orig_marvin_1() {
    import(str(
        stl_path,
        "20140205_Marvin_KeyChain_Dual_Color_1.stl"
    ), convexity=10);
}

module _orig_marvin_2() {
    import(str(
        stl_path,
        "20140205_Marvin_KeyChain_Dual_Color_2.stl"
    ), convexity=10);
}

module _ear_disks() {
    difference() {
        union() {
            translate([3.45, 10.1, 12.6])
            rotate([0, -90, 0])
            cylinder(d=9.1, h=1.1, $fn=50);

            translate([21.3, 10.1, 12.6])
            rotate([0, 90, 0])
            cylinder(d=9.1, h=1.1, $fn=50);
        }
        _ear_canal();
    }
}

module _ear_canal() {
    translate([12.35, 10.1, 12.6])
    rotate([0, 90, 0])
    difference() {
        union() {
            cylinder(d=6, h=20.2, center=true, $fn=50);
            cylinder(d=10, h=17, center=true, $fn=50);
        }

        cylinder(d=12, h=16.2, center=true);
    }
}

module new_marvin_dc_1() {

    difference() {
        union() {
            _orig_marvin_1();
            _ear_disks();
        }

//        union() {

//

//        }
        _ear_canal();

        intersection() {
            translate([12.4, 12, 18.2])
            cylinder(d=40, h=20);

            translate([12.35, 10.1, 12.6])
            sphere(d=18, $fn=40);
        }

        cube([100, 50, 12], center=true);

        translate([0, 20/2 + 29.5/2, 0])
        cube([100, 20, 38], center=true);
    }
}

module new_marvin_dc_2() {
    difference() {
        union() {
            _orig_marvin_2();
            _ear_canal();

            difference() {
                translate([12.35, 10.1, 12.6])
                sphere(d=18, $fn=40);

                translate([0, 0, 6 + 12.2/2])
                cube([100, 29.5, 12.2], center=true);
            }
        }
        _ear_disks();
    }

}