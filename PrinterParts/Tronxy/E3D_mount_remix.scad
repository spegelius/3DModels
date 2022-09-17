use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;
use <../../Dollo/New_long_ties/mockups.scad>;

use <../Copperhead/cooling_shroud.scad>;

stl_path = 
    "../../_downloaded/Tronxy X5s e3d v6 Mount With Belt Aligner/";


//debug_copperhead_cooling_shroud();
//debug_tronxy_E3D_mount_M4();

//tronxy_belt_clip_left_top();
//tronxy_belt_clip_right_top();
//tronxy_belt_clip_left_bottom();
//tronxy_belt_clip_right_bottom();
//tronxy_E3D_mount();
//tronxy_E3D_mount_M4();
//tronxy_E3D_mount_cap();
tronxy_E3D_M4_mount_cap();


module round_tooth(height) {
    hull() {
        cube([0.95, 0.95, height]);

        translate([0.5, 1, 0])
        cylinder(d=0.95, h=height, $fn=10);
    }
}
    
module tooth(height) {
    cube([1.05, 1.55, height]);
}

module gt2_belt(length=10, height=6) {

    teeth = round(length/2);
    
    cube([length, 0.9, height]);

    for(i = [0:teeth - 1]) {
        translate([i*2, 0, 0])
        tooth(height);
    }
}

module rounded_gt2_belt(
    length, dia, height=6, teeth_inside=true) {
    
    total_len = PI * dia;
    step = 2/(total_len/360);
    steps = round(length/2);
    
    function tooth_pos() = 
        teeth_inside ? dia/2 - 1.57 + 0.9/2 : dia/2 - 0.9/2;

    function start_angle() = -steps/2 * step;
        
    translate([length/2, -dia/2, 0])
    union() {
        difference() {
            cylinder(d=dia + 0.9, h=height, $fn=60);

            translate([0, 0, -0.1])
            cylinder(d=dia - 0.9, h=height + 1, $fn=60);

            rotate([0, 0, start_angle()])
            translate([0, -(dia + 1)/2, -0.1])
            cube([dia + 1, dia + 1, height + 1]);

            rotate([0, 0, -start_angle()])
            translate([-(dia + 1), -(dia + 1)/2, -0.1])
            cube([dia + 1, dia + 1, height + 1]);
        }
        for (i = [0:steps - 1]) {
            rotate([0, 0, step*i + start_angle()])
            translate([0, tooth_pos(), 0])
            translate([-1/2, 0, 0])
            tooth(height);
        }
    }
}


module tronxy_belt_clip_left_top() {
    difference() {
        cube([20, 9, 20]);

        translate([0, 3.3, 12.6])
        rotate([0, 0, 14])
        mirror([0, 1, 0])
        rounded_gt2_belt(18, 60, 9, teeth_inside=false);

        translate([13.5, -0.1, -0.1])
        cube([3.5, 3.5, 20.1]);

        translate([13.5, 1.35, -0.1])
        cube([4.5, 2.05, 20.1]);

        translate([15, -0.1, 14.5])
        cube([6, 3.5, 10]);

        translate([13, -0.1, 13])
        cube([2, 3.5, 10]);

        translate([11, -0.1, 13])
        cube([4, 1.6, 10]);

        rotate([0, 45, 0])
        cube([10, 20, 10], center=true);

        translate([24.5, 20, -0.1])
        cylinder(d=31, h=30, $fn=70);

        rotate([45, 0, 0])
        cube([29, 3, 10], center=true);
    }
}

module tronxy_belt_clip_right_top() {
    difference() {
        hull() {
            cylinder(d=11, h=20, $fn=30);

            translate([4, -11/2 - 9, 0])
            cube([14, 15, 20]);
        }
        cylinder(d=4.3, h=50, center=true, $fn=30);

        translate([15.5, -36, -0.1])
        cylinder(d=50, h=25, $fn=80);

        translate([20, 10.5, -0.1])
        cylinder(d=30, h=25, $fn=80);

        translate([-12 + 5.1, -8.7, 15.5])
        cube([12, 18, 10]);

        translate([0, -9, 20 - 7.8])
        rotate([0, 0, 8])
        mirror([0, 0, 0])
        rounded_gt2_belt(28, 80, 9);

        translate([16, 0, 0])
        rotate([0, 35, 0])
        cube([10, 30, 30], center=true);
    }
}

module tronxy_belt_clip_left_bottom() {
    difference() {
        union() {
            hull() {
                cylinder(d=11, h=11, $fn=30);

                translate([4.64, -6, 0])
                cube([13, 20, 11]);
            }
            cylinder(d=11, h=15.5, $fn=30);

            translate([5, -6, 0])
            cube([8, 11, 19]);
        }
        cylinder(d=4.3, h=49, center=true, $fn=30);

        translate([13.5, 55, -0.1])
        cylinder(d=88, h=25, $fn=150);

        translate([22, -10, -0.1])
        cylinder(d=30, h=25, $fn=50);

        translate([0, 8, -0.8])
        rotate([0, 0, -6])
        mirror([0, 1, 0])
        rounded_gt2_belt(18, 120, 8);
    }
}

module tronxy_belt_clip_right_bottom() {
    difference() {
        union() {
            cube([20, 9, 14]);

            //translate([10.5, -2, 0])
            //cube([9.5, 10, 14]);
        }

        translate([0, 8.1, -0.8])
        rotate([0, 0, -10])
        mirror([0, 1, 0])
        rounded_gt2_belt(30, 60, 8, teeth_inside=false);

        translate([3, -0.1, -0.1])
        cube([3.5, 3.5, 20]);

        translate([2, 1.35, -0.1])
        cube([4.5, 2.05, 20]);

        translate([4, -1, -0.1])
        cube([6.5, 2.4, 20]);
        
        translate([19, 25, -0.1])
        cylinder(d=33.5, h=30, $fn=70);

        translate([20, 0, 14])
        rotate([0, 45, 0])
        cube([7, 20, 7], center=true);
    }
}

module tronxy_E3D_mount() {

    union() {
        difference() {
        
            import(str(
                stl_path,
                "tronxy_x5s_e3d_v6_mtg_+_belt_aligner_r1.STL"
            ), convexity=10);

            translate([-23.5, 3, 0])
            cube([20, 50, 25]);

            translate([70.5, 4, 0])
            cube([20, 50, 25]);

            translate([72.5, -4, 0])
            cube([20, 50, 25]);

            translate([14, -17.2, 9.10])
            cube([40, 10, 25]);

            translate([14, -11.3, 5])
            rotate([45, 0, 0])
            cube([40, 5.8, 25]);

            translate([0, 30, 0])
            rotate([45, 0, 0])
            cube([200, 9, 9], center=true);

        }

        translate([1.5, 2.61, 11.5])
        rotate([90, 0, 0])
        tube(12, 0.6, 3.8, $fn=100);

        hull() {
            translate([8, 15, 12.95])
            cube([0.8, 20, 0.1], center=true);

            translate([1.61, 15, 19.95])
            cube([0.1, 20, 0.1], center=true);

            translate([8.35, 15, 19.95])
            cube([0.1, 20, 0.1], center=true);
        }

        hull() {
            translate([8, 15, 12.95])
            cube([0.8, 20, 0.1], center=true);

            translate([8, 15, 2.95])
            cube([0.8, 20, 0.1], center=true);
        }

        hull() {
            translate([67, 15, 2.5])
            cube([1, 22.1, 1], center=true);

            translate([65, 15, 5])
            cube([1, 22.1, 1], center=true);

            translate([72.45, 15, 7.28])
            cube([0.1, 22.1, 1], center=true);

            translate([72.45, 15, 2.5])
            cube([0.1, 22.1, 1], center=true);
        }
    }

    // debug
    %translate([1.5, 6, 11.5])
    rotate([-90, 180, 0])
    tronxy_belt_clip_left_bottom();

    %translate([65.5, 6, 11.5])
    rotate([-90, 0, 0])
    tronxy_belt_clip_right_top();

    %translate([-16.4, 5.5, 3.3])
    rotate([-90, 0, 0])
    tronxy_belt_clip_left_top();

    %translate([63.4, 6, 3.3])
    rotate([-90, 0, 0])
    tronxy_belt_clip_right_bottom();

    // hole pos debug
    %translate([13.5, 8.5, 0])
    cylinder(d=4.5, h=20, center=true, $fn=30);

    %translate([53.5, 8.5, 0])
    cylinder(d=4.5, h=20, center=true, $fn=30);

    %translate([26.5, -11.5, 0])
    cylinder(d=3, h=20, center=true, $fn=30);

    %translate([40.5, -11.5, 0])
    cylinder(d=3, h=20, center=true, $fn=30);

}

module tronxy_E3D_mount_M4() {
    difference() {
        union() {
            tronxy_E3D_mount();

            difference() {
                translate([33.5, 14.4, 15/2 + 5])
                cube([33, 18, 15], center=true);

                translate([33.5, 2, 20])
                rotate([-90, 0, 0])
                cylinder(d=16.1, h=5, $fn=200);

                translate([33.5 + 20, 8.5])
                cylinder(d=12, h=30);

                translate([33.5 - 20, 8.5])
                cylinder(d=12, h=30);

            }
        }

        translate([33.5, 14.4 + 9, 20])
        rotate([-90, 0, 0])
        cylinder(d1=24, d2=54, h=20, $fn=100);

        translate([33.5, 1, 20])
        rotate([-90, 0, 0])
        cylinder(d=4.3, h=27, $fn=60);

        translate([33.5, 10.7, 20])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, $fn=60);

        translate([33.5, 18, 20])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, $fn=60);

        translate([33.5 + 8, 16, 0]) {
            cylinder(d=3.4, h=60, $fn=30);

            M3_nut_tapering(
                h=10.4, cone=true,
                bridging=false
            );
        }

        translate([33.5 + -8, 16, 0]) {
            cylinder(d=3.4, h=60, $fn=30);

            M3_nut_tapering(
                h=10.4, cone=true,
                bridging=false
            );
        }
    }
}

module tronxy_E3D_mount_cap() {
    difference() {
        import(str(stl_path,
                "tronxy_x5s_e3d_v6_mtg_cap_r1.STL"),
            convexity=10);

        translate([10, 27.7, 25])
        cube([50, 20, 20], center=true);
    }
}

module tronxy_E3D_M4_mount_cap() {
    difference() {
        translate([0, 0, 9])
        rotate([180, 0, 0])
        intersection() {
            chamfered_cube(
                24, 15, 20, 3, center=true
            );

            cylinder(d=60, h=9);
        }

        translate([8, 0, 0])
        cylinder(d=3.4, h=60, center=true, $fn=30);

        translate([-8, 0, 0])
        cylinder(d=3.4, h=60, center=true, $fn=30);

        translate([0, 0, 9])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=60, center=true, $fn=30);

        translate([0, 3.65, 9])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);
        
        translate([0, -3.65, 9])
        rotate([-90, 0, 0])
        cylinder(d=8.2, h=3.3, center=true, $fn=60);
    }
}

module debug_copperhead_cooling_shroud() {
    rotate([90, 0, 0])
    tronxy_E3D_mount();

    %translate([33.5, -20, -59.25])
    rotate([0, 0, -90])
    copperhead(block_rotation=90);

    translate([33.5, -41, -56.25])
    new_duct(supports=false);

    translate([26.65, -53, 10.5])
    rotate([-90,0,0])
    tronxy_E3D_mount_cap();
}

module debug_tronxy_E3D_mount_M4() {
    %rotate([-90, 0, 0])
    translate([33.5, -20, -59.25])
    rotate([0, 0, -90])
    copperhead(block_rotation=90);

//    translate([33.5, -57.05, 20])
//    rotate([-90, 0, 0])
//    e3dv6();

    translate([26.65, 10.5, 52.6])
    rotate([180, 0, 0])
    tronxy_E3D_mount_cap();

    translate([33.5, 16, 29.1])
    rotate([180, 0, 0])
    tronxy_E3D_M4_mount_cap();

    intersection() {
        tronxy_E3D_mount_M4();

        translate([100/2 + 33.5, 0, 0])
        cube([100, 100, 100], center=true);
    }

}
