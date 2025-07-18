use <../Dollo/NEW_long_ties/include.scad>;


////// VARIABLES //////
resolution = 60;
screw_d = 11.2;
outer_d = 13;


////// VIEW DEV //////
//debug();
//debug_e3d_titan_bowden_adapter();
//mock_PTFE();


////// VIEW PRINT //////
//cap1();
//cap2();
//insert();
//plate();

e3d_titan_bowden_adapter();


////// MODULES //////
module mock_PTFE() {
    rotate([90, 0, 0])
    cylinder(d=4, h=25, center=true, $fn=30);

    translate([0, -1, 0])
    rotate([90, 0, 0])
    M4_nut(cone=false);

    translate([0, 1, 0])
    rotate([-90, 0, 0])
    M4_nut(cone=false);
}


module debug() {
    intersection() {
        union() {
            cap1();

            translate([0, 0, 19.15])
            rotate([0, 180, 130])
            cap2();

            translate([0, 0, 8.25])
            insert();

            color("grey") {
                translate([0, 0, 5])
                M4_nut(cone=false);

                translate([0, 0, 10.9])
                M4_nut(cone=false);
            }
        }
        cube([20, 20, 20]);
    }
}


module debug_e3d_titan_bowden_adapter() {
    intersection() {
        e3d_titan_bowden_adapter();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

    intersection() {
        translate([0, 0, 25.6])
        rotate([0, 180, 180])
        cap2();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

//    translate([0, 0, 14.4])
//    insert();

    color("grey") {
        translate([0, 0, 17.4])
        M4_nut(cone=false);
    }
}

module cap1() {
    difference() {
        union() {
            translate([0, 0, 1])
            cylinder(
                d2=outer_d, d1=5.5,
                h=(outer_d - 5.5)/2 + 2,
                $fn=50
            );

            translate([0, 0, (outer_d - 5.5)/2 + 3])
            cylinder(d=outer_d, h=6, $fn=50);

            M5_nut();
        }
        cylinder(d=4.4, h=15, $fn=50);

        translate([0, 0, 5])
        cylinder(d=8.3, h=10, $fn=50);

        translate([0, 0, 8.2])
        v_screw(
            h=11, screw_d=screw_d + 0.5,
            pitch=1.5, direction=0,
            steps=resolution
        );
    }
}

module cap2() {
    difference() {
        union() {
            translate([0, 0, 1])
            cylinder(
                d2=outer_d, d1=5.5,
                h=(outer_d - 5.5)/2 + 2,
                $fn=50
            );

            translate([0, 0, (outer_d - 5.5)/2 + 3])
            v_screw(
                h=4.25, screw_d=screw_d,
                pitch=1.5, direction=0,
                steps=resolution
            );

            M5_nut();
        }
        cylinder(d=4.4, h=15, $fn=50);

        translate([0, 0, 5])
        cylinder(d=8.3, h=10, $fn=50);
    }
}

module insert() {
    difference() {
        cylinder(d=7.9, h=2.6, $fn=40);
        cylinder(d=4.4, h=3.1, $fn=40);
    }
}

module plate() {
    translate([-7, 0, 0])
    cap1();

    translate([7, 0, 0])
    cap2();

    translate([0, 5, 0])
    insert();
}



module _orig_e3d_titan_bowden_adapter() {
    stl_base_path = "../_downloaded/";
    spath = str(
        stl_base_path, "Titan_bowden_M10/"
    );

    translate([0, 0, -72])
    import(
        str(spath, "E3D_PC4-M10_adapter_for_PETG.stl"),
        convexity=10
    );
}

module e3d_titan_bowden_adapter() {
//    %intersection() {
//        _orig_e3d_titan_bowden_adapter();
//
//        translate([0, 30/2, 0])
//        cube([30, 30, 30], center=true);
//
//    }

    difference() {
        union() {
            hull() {
                chamfered_cylinder(
                    16.1, 3.6, 0.4, $fn=50
                );

                translate([0, -16.1/2, 3.6/2])
                chamfered_cube(
                    16.1, 1, 3.6, 0.4, center=true
                );

            }
            cylinder(d=12, h=14.2, $fn=50);
            cylinder(d=7.9, h=17.2, $fn=50);

            translate([0, 0, 6])
            cap1();
        }

        cylinder(d=4.4, h=50, center=true, $fn=50);

        translate([0, 0, -0.2])
        M4_nut(5, cone=false, bridging=true);
    }
}