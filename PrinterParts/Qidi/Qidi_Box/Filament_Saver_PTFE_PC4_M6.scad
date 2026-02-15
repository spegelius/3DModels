use <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../Dollo/NEW_long_ties/mockups.scad>;
use <../../../lib/fittings.scad>;


stl_base_path = "../../../_downloaded/Qidi/Qidi_Box/";
spath = str(
    stl_base_path, "Base Plate for using AMS 2 Pro Saver/"
);

threads = true;
thread_slop = 0.2;


//%_orig_qidi_box_ams_snap_base_v21();
//debug();
//_pc4m6_hole();
//_pc4m10_hole();


//filament_saver_ptfe_pc4_m6();
filament_saver_ptfe_pc4_m10();



module _orig_qidi_box_ams_snap_base_v21() {
    import(
        str(spath, "qidi-box-ams-snap-base-v21.stl"),
        convexity=10
    );

//    %translate([35, 20.5, 33/2])
//    cube([45.5, 7, 33], center=true);
//
    %translate([35 + 45.5/2 - 21, 0, 30/2])
    rotate([-90, 0, 0])
    cylinder(d=4, h=30, $fn=30);
}


module debug() {
    intersection() {
        //filament_saver_ptfe_pc4_m6();
        filament_saver_ptfe_pc4_m10();

        translate([0, 0, -200/2 + 15])
        cube([200, 200, 200], center=true);
    }

    %translate([35 + 45.5/2 - 22 + 200/2 - 0.5, 14, 30/2])
    rotate([0, 0, -7.1])
    translate([-200/2, 0, 0])
    rotate([-90, 0, 0])
    //mock_ptfe_pc4m6();
    mock_ptfe_pc4m10();
}

module _pc4m6_hole() {
    union() {
        
        if (threads) {
            fitting_thread_M6(fitting_h=8.1, slop=thread_slop);
        } else {
            cylinder(d=6, h=8.1, $fn=30);
        }

        translate([0, 0, 5])
        cylinder(d=7.5, h=10, $fn=30);

        translate([0, 0, 6.5])
        cylinder(d=100, h=10, $fn=6);

        hull() {
            translate([0, -3.1, 8/2])
            cube([1.3, 0.1, 8], center=true);

            translate([0, -1.5, 8/2])
            cube([3.8, 0.1, 8], center=true);
        }
    }
}

module _pc4m10_hole() {
    union() {
        
        if (threads) {
            fitting_thread_M10(fitting_h=8.1, slop=thread_slop);
        } else {
            cylinder(d=10, h=8.1, $fn=30);
        }

        translate([0, 0, 5])
        cylinder(d=7.5, h=10, $fn=30);

        translate([0, 0, 6.5])
        cylinder(d=100, h=10, $fn=6);

        hull() {
            translate([0, -5.1, 8/2])
            cube([2.3, 0.1, 8], center=true);

            translate([0, -3.5, 8/2])
            cube([4.8, 0.1, 8], center=true);
        }
    }
}

module _filament_saver_ptfe_pc4(m=6) {
    difference() {
        intersection() {
            union() {
                _orig_qidi_box_ams_snap_base_v21();

                translate([10, 19, 33/2])
                rotate([0, 0, -14])
                cube([1.702, 20, 33], center=true);

                hull() {
                    translate([35.45, 25.02, 33/2])
                    cube([49, 2, 33], center=true);

                    translate([35.4, 45.02, 33/2])
                    cube([49, 2, 33], center=true);
                }
            }

            //cylinder(d=200, h=30, $fn=6);

            union() {
                translate([0, 0, 30/2])
                cube([130, 50, 30], center=true);

                hull() {
                    translate([25.1, 21.1, 0])
                    cylinder(d=30, h=30, $fn=80);

                    translate([35, 26, 30/2])
                    cube([15, 20, 30], center=true);

                    translate([55, 16, 30/2])
                    cube([15, 20, 30], center=true);
                }
            }
        }

        // ptfe hole
        translate([35 + 45.5/2 - 22, 0, 30/2])
        rotate([90, 0, 0])
        chamfered_cylinder(10, 50, 1, center=true, $fn=40);

        #translate([35 + 45.5/2 - 22 + 200/2 - 0.5, 14, 30/2])
        donut(200, 4.3, $fn=200);

        translate([35 + 45.5/2 - 22 + 200/2 - 0.5, 14, 30/2])
        rotate([0, 0, -7.1])
        translate([-200/2, 0, 0])
        rotate([-90, 0, 0])
        if (m==6) {
            _pc4m6_hole();
        } else {
            _pc4m10_hole();
        }

        // led hole
        #hull() {
            translate([35 + 45.5/2 - 30, 24, 30/2])
            rotate([-90, 0, 0])
            cylinder(d=5, h=1, $fn=30);

            translate([35 + 45.5/2 - 33, 24, 30/2])
            rotate([-90, 0, 0])
            cylinder(d=5, h=1, $fn=30);
        }

        hull() {
            translate([35 + 45.5/2 - 30, 24.7, 30/2])
            rotate([-90, 0, 0])
            cylinder(d=5, h=0.1, $fn=30);

            translate([35 + 45.5/2 - 33, 24.7, 30/2])
            rotate([-90, 0, 0])
            cylinder(d=5, h=0.1, $fn=30);

            translate([35 + 45.5/2 - 29.2 - 40/2, 43, 30/2])
            rotate([-90, 0, 0])
            rounded_cube_side(
                40, 29, 10, 5, center=true, $fn=30
            );
        }

        // trimming
        translate([51, 18, 0])
        cube([10, 10, 100], center=true);

        translate([52.73, 18.2, 0])
        rotate([0, 0, 6])
        cube([10, 4, 100], center=true);
    }
}

module filament_saver_ptfe_pc4_m6() {
    _filament_saver_ptfe_pc4(m=6);
}

module filament_saver_ptfe_pc4_m10() {
    _filament_saver_ptfe_pc4(m=10);
}