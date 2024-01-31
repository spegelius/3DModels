use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;

use <common.scad>;
use <../../Generic/washers.scad>;

stl_path = "../../_downloaded/Tronxy/Tronxy_X5S_Mega_gantry_plates/";


debug();

//tronxy_mega_gantry_left();
//tronxy_mega_gantry_right();

//translate([0, -130, 0])
//tronxy_mega_gantry_right();

//top_bearing_support_left();
//top_bearing_support_right();
//washer_8_5_1();


module debug() {

    2020_path = "../../_downloaded/2020_profile/";

//    color("DarkSlateGrey")
//    translate([340, -60, -130])
//    translate([0, 0, 4.65])
//    scale([1, 10, 1])
//    import(str(
//        2020_path, "2020_v-slot.stl"
//    ), convexity=10);

//    color("DarkSlateGrey")
//    translate([-0.2, -20, 20/2 + 4.6])
//    rotate([90, 0, 0])
//    2020_vslot();

    intersection() {
        tronxy_mega_gantry_left();

//        translate([0, -18, 0])
//        cube([200, 100, 100], center=true);
        
    }

    translate([0, -4.65, -29.6])
    top_bearing_support_left();

    %translate([23, 16 - 4.65, -12])
    mock_idler();

    %translate([23, 16-4.65, -24])
    mock_idler();

    translate([23, 16 - 4.65, -13])
    washer_8_5_1();

    translate([23, 16 - 4.65, -1])
    washer_8_5_1();

    // bolts
    #translate([-30, -58, 14.6])
    rotate([0, 90, 0])
    cylinder(d=4, h=25);

    #translate([0, -10, 0])
    cylinder(d=4, h=10, $fn=20);

    #translate([0, 12.8, 0])
    cylinder(d=4, h=10, $fn=20);
    
    tnut_path = str(
        "../../_downloaded/",
        "T-nut_Generator_and_Customizer/"
    );

    translate([-5, -17.1, 7])
    import(str(
        tnut_path, "tnut_37_22.8.stl"
    ), convexity=10);
}

module _long_nut() {
    hull() {
        rotate([0, 0, 360/6/2])
        scale([1.02, 1.02, 1.01])
        M4_nut(h=3.4, cone=false);

        translate([0, 6, 0])
        rotate([0, 0, 360/6/2])
        scale([1.02, 1.02, 1.01])
        M4_nut(h=3.4, cone=false);
    }
}

module _long_hole() {
    d = 5.3;

    hull() {
        translate([0, -0.5, 32.1])
        cylinder(d=d, h=1, $fn=60);

        translate([0, 0.5, 32.1])
        cylinder(d=d, h=1, $fn=60);

        cylinder(d=d, h=1, $fn=60);
    }
}

module tronxy_mega_gantry_left() {

    difference() {
        union() {
            intersection() {
                translate([0, -4.5, -88.55])
                import(
                    str(
                       stl_path, "x5s_y_l_plate_r1.STL"
                    ), convexity=5);

                translate([24, 0, 0])
                cube([113, 131, 50], center=true);
            }

            translate([-11.1, -36, 14.6])
            v_slot_guide(30);

            translate([-11.1, -1.5, 14.6])
            v_slot_guide(7);
        }

        // chamfers
        translate([-34, -68, 0])
        rotate([0, 0, 45])
        cube([10, 10, 100],center=true);

        translate([-8.5, -68, 0])
        rotate([0, 0, 45])
        cube([10, 10, 100], center=true);

        translate([-37, 0, 0])
        rotate([0, 45, 0])
        cube([10, 200, 10], center=true);

        translate([82, 0, 0])
        rotate([0, 45, 0])
        cube([10, 200, 10], center=true);

        translate([78, 0, 0])
        rotate([0, 45, 0])
        cube([10, 80, 10], center=true);

        translate([0, 68, 0])
        rotate([45, 0, 0])
        cube([200, 10, 10], center=true);

        // center M5 nut indent
        translate([23, 11.35, 23])
        rotate([0, 180, 0])
        M5_nut_tapering(13, cone=false);
        //cylinder(d=4.5,h=1);

        // bolt head indents
        translate([-31.8, -13, 14.6])
        rotate([0, 90, 0])
        cylinder(d=8.6, h=3, $fn=40, center=true);

        translate([-31.8, -58, 14.6])
        rotate([0, 90, 0])
        cylinder(d=8.6, h=3, $fn=40, center=true);

        // back outer roller bolt hole
        translate([-23, 51.5, -21])
        _long_hole();

        translate([-23, 51.5, 0])
        cylinder(d1=10.7, d2=4.7, h=3.75, $fn=60);

        // back tightening bolt hole
        translate([-23, 65.5, 6])
        rotate([90, 0, 0])
        cylinder(d=4.2, h=13, $fn=40);

        translate([-23, 60.5, 6])
        rotate([90, 0, 0])
        _long_nut();

        // front outer roller bolt hole
        translate([67, 51.5, -21])
        _long_hole();

        translate([67, 51.5, 0])
        cylinder(d1=10.7, d2=4.7, h=3.75, $fn=60);

        // back tightening bolt hole
        translate([67, 65.5, 6])
        rotate([90, 0, 0])
        cylinder(d=4.2, h=13, $fn=40);

        translate([67, 60.5, 6])
        rotate([90, 0, 0])
        _long_nut();

        // inner roller bolt holes
        translate([-23, 11.35, 0])
        cylinder(d1=10.7, d2=4.7, h=3.75, $fn=60);

        translate([65, 11.35, 0])
        cylinder(d1=10.7, d2=4.7, h=3.75, $fn=60);

        // infill
        translate([-18, 0, 3.5])
        cube([0.1, 200, 4], center=true);

        translate([-28, 0, 3.5])
        cube([0.1, 200, 4], center=true);

        translate([-8, 0, 2.5])
        cube([0.1, 200, 3], center=true);

        translate([5, 0, 2.5])
        cube([0.1, 200, 3], center=true);

        translate([15, 0, 3])
        cube([0.1, 200, 4], center=true);

        translate([25, 0, 3])
        cube([0.1, 200, 4], center=true);

        translate([35, 0, 3])
        cube([0.1, 200, 4], center=true);

        translate([45, 0, 3])
        cube([0.1, 200, 4], center=true);

        translate([55, 0, 3])
        cube([0.1, 200, 4], center=true);
    }

//    %translate([67, 52, 18.2])
//    roller();
//
//    %translate([65, 11.5, 18.2])
//    roller();
//
//    %translate([-23, 11.5, 18.2])
//    roller();
//
//    %translate([-23, 52, 18.2])
//    roller();
}

module tronxy_mega_gantry_right() {
    mirror([0, 1, 0])
    tronxy_mega_gantry_left();
}

module bridge_cylinder() {
    h = 3;
    intersection() {
        union() {
            cylinder(d=9.1, h=h, $fn=60);

            translate([0, 0, (h + 0.2)/2])
            cube([5.3, 9.1, h + 0.2], center=true);

            translate([0, 0, (h + 0.4)/2])
            cube([5.3, 5.3, h + 0.4], center=true);
        }
        cylinder(d=9.1, h=h + 0.4, $fn=60);
    }
}

module _top_bearing_support() {
    $fn = 40;
    d = 13;

    module pylon() {
        union() {
            cylinder(d=d, h=29.5);

            translate([0, 0, 29.5 - 0.1])
            cylinder(d1=10.5, d2=6.5, h=2.5, $fn=60);
        }
    }

    difference() {
        // main body
        union() {
            hull() {
                translate([67, 56, 0])
                cylinder(d=d, h=5);

                translate([-23, 56, 0])
                cylinder(d=d, h=5);
            }
            hull() {
                translate([-23, 16, 0])
                cylinder(d=d, h=5);

                translate([65, 16, 0])
                cylinder(d=d, h=5);
            }
            hull() {
                translate([67, 56, 0])
                cylinder(d=d, h=5);

                translate([65, 16, 0])
                cylinder(d=d, h=5);
            }
            hull() {
                translate([-23, 56, 0])
                cylinder(d=d, h=5);

                translate([-23, 16, 0])
                cylinder(d=d, h=5);
            }

            translate([67, 56, 0])
            pylon();

            translate([-23, 56, 0])
            pylon();

            translate([65, 16, 0])
            pylon();

            translate([-23, 16, 0])
            pylon();

            translate([23, 16, 0])
            cylinder(d=7, h=5.5, $fn=40);

            translate([23, 16 + 40/2, 5/2])
            cube([d, 40, 5], center=true);
        }

        translate([67, 56, -0.01]) {
            _long_hole();
            bridge_cylinder();
        }
        translate([-23, 56, -0.01]) {
            _long_hole();
            bridge_cylinder();
        }
        translate([23, 16, -0.01]) {
            cylinder(d=5.2, h=45, $fn=40);
            bridge_cylinder();
        }
        translate([-23, 16, -0.01]) {
            cylinder(d=5.2, h=45, $fn=40);
            bridge_cylinder();
        }
        translate([65, 16, -0.01]) {
            cylinder(d=5.2, h=45, $fn=40);
            bridge_cylinder();
        }

        // custom infill
        translate([63, 56, -1])
        cylinder(d=0.1, h=45, $fn=10);

        translate([-19, 56, -1])
        cylinder(d=0.1, h=45, $fn=40);

        translate([65, 20, -1])
        cylinder(d=0.1, h=45, $fn=40);

        translate([-23, 20, -1])
        cylinder(d=0.1, h=45, $fn=40);

        translate([23, 0, 2])
        cube([0.1, 100, 0.2]);
    }
}

module top_bearing_support_left() {
    _top_bearing_support();
}

module top_bearing_support_right() {
    rotate([0, 0, 180])
    mirror([1, 0, 0])
    _top_bearing_support();
}

module 2020_vslot(h=100) {
    iw = 20 - 2*(4.3 + 1.8);
    iw2 = iw - sqrt((1.5 * 1.5)/2) * 2;
    
    ih = 4.3 - (11 - iw2)/2;
    echo(iw, iw2, ih);
    

    difference() {
        rounded_cube_side(
            20, 20, h, .8, center=true, $fn=15
        );

        cylinder(d=4.2, h=h*2, center=true, $fn=30);
        for (i=[0:3]) {
            rotate([0, 0, i * 90])
            translate([0, 20/2 + 10/2, 0])
            hull() {
                cube([
                    6.2, 10 + (9.55 - 6.2), h * 2
                ], center=true);

                cube([9.55, 10, h*2], center=true);
            }

            rotate([0, 0, i * 90])
            translate([0, 20/2, 0])
            cube([6.2, 5, h*2], center=true);

            rotate([0, 0, i * 90])
            hull() {
                translate([0, 20/2 - 1.8 - ih/2, 0])
                cube([11, ih, h*2], center=true);

                translate([0, iw/2 + 0.1/2, 0])
                cube([iw2, 0.1, h*2], center=true);
            }
            
        }
    }
}

module v_slot_guide(length) {
    intersection() {
        union() {
            hull() {
                cube([5.2, length, 6], center=true);

                cube([
                    1.5, length, 9.55
                ], center=true);
            }

            cube([5.7, length, 6], center=true);
        }
        translate([10/2, 0, 0])
        cube([10, length, 20], center=true);
    }
}
