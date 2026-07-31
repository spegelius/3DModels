use <../../../../Dollo/NEW_long_ties/include.scad>;
use <../../../../lib/bearings.scad>;
use <../../../../Silica_Gel_Spool-Core_Drying_Container_remix/Silica_Gel_Spool-Core_Drying_Container_remix.scad>;


stl_base_path = "../../../../_downloaded/Anycubic/ACE Pro/";
spath = str(
    stl_base_path, "Anycubic Ace PRO mod Spool Holder/"
);


//mock_M8_nylock();

//_orig_cylinder_spool_holder_ace();
//_orig_right_spool_holder_ace();

//assembly();
//debug_cylinder_silica();


//cylinder_silica_gel_cap();
//cylinder_silica_gel();

//cylinder_silica_gel_cap(d=52.5);
cylinder_silica_gel(d=52.5);


//M4_rod_axle_nut();
//M4_rod_axle_half();


module mock_M8_nylock() {
    difference() {
        union() {
            M8_nut(5.5, cone=false);
            rounded_cylinder(12.5, 8, 2, $fn=30);
        }

        cylinder(d=8, h=30, center=true, $fn=30);
    }
}

module _orig_cylinder_spool_holder_ace() {

    translate([27, 102, -8.25])
    rotate([0, -90, 0])
    import(
        str(spath, "cylinder_spool_holder_ace.stl"),
        convexity=10
    );

    //%cylinder(d=10, h=1, $fn=40);
    //%cylinder(d=52.5, h=72, $fn=120);
}

module _orig_right_spool_holder_ace() {

    import(
        str(spath, "right_spool_holder_ace.stl"),
        convexity=10
    );

    //%cylinder(d=10, h=1, $fn=40);
    //%cylinder(d=52.5, h=2, $fn=120);
}

module _orig_left_spool_holder_ace() {

    import(
        str(spath, "left_spool_holder_ace.stl"),
        convexity=10
    );

    //%cylinder(d=10, h=1, $fn=40);
    //%cylinder(d=52.5, h=2, $fn=120);
}

module assembly() {
    _orig_right_spool_holder_ace();
    _orig_left_spool_holder_ace();

    translate([8.25, -103, 28])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    translate([8.25 + 84.5, -103, 28])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    translate([8.25 + 84.5 + 85.5, -103, 28])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    translate([8.25 + 84.5 + 85.5 + 84.5, -103, 28])
    rotate([0, 90, 0])
    debug_cylinder_silica();
}

module debug_cylinder_silica() {
    intersection() {
        cylinder_silica_gel_cap(d=52.5);

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    intersection() {
        translate([0, 0, 72])
        rotate([0, 180, 0])
        cylinder_silica_gel(d=52.5);

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }

    intersection() {
        union() {
            color("lightgrey")
            translate([0, 0, 6])
            608zz();

            color("lightgrey")
            translate([0, 0, 72 - 13])
            608zz();
        }

        translate([0, 100/2, 0])
        cube([100, 100, 300], center=true);
    }
//
//    color("grey")
//    translate([0, 0, -5])
//    cylinder(d=8, h=82, $fn=30);
//
//    color("grey")
//    translate([0, 0, 6])
//    rotate([180, 0, 0])
//    mock_M8_nylock();
//
//    color("grey")
//    translate([0, 0, 72 - 6])
//    mock_M8_nylock();

    color("grey")
    translate([0, 0, -5.5])
    cylinder(d=4, h=83, $fn=30);

    translate([0, 0, 6])
    rotate([180, 0, 0])
    M4_rod_axle_nut();

    translate([0, 0, 72 - 6])
    M4_rod_axle_nut();

    translate([0, 0, 6])
    M4_rod_axle_half();

    translate([0, 0, 36])
    M4_rod_axle_half();

}

module cylinder_silica_gel_cap(d=48) {
    sd = d - 1;

    difference() {
        intersection() {
            union() {
                cylinder(d=sd, h=2, $fn=60);
                tube(sd, 5, 3, $fn=60);
                tube(28.1, 3, 1.1, $fn=60);
                
                intersection() {
                    union() {
                        v_screw(
                            h=11,
                            screw_d=sd - 2,
                            pitch=2,
                            direction=0,
                            steps=60,
                            depth=0.5,
                            chamfer=true
                        );

                        chamfered_cylinder(sd - 4.4, 11, 0.8, $fn=60);
                    }

                    tube(sd - 3, 200, 2, center=true, $fn=60);
                }

            }

            chamfered_cylinder(sd, 100, 1.8, $fn=60);
        }

        translate([0, 0, -8])
        _bottom_grills(gd=1.2, spacing=9.75);

        cylinder(d=22.1, h=13, $fn=60);

        for(i = [0:25]) {
            rotate([0, 0, i*360/26])
            translate([sd/2 + 0.5, 0, 0])
            cylinder(d=2, h=20, $fn=30);
        }
    }
}

module cylinder_silica_gel(d=48) {
    sd = d - 1;

    difference() {
        union() {
            intersection() {
                translate([0, 0, -0.2])
                new_silica_gel_spool_core(d=sd, h=86);

                translate([0, 0, 0])
                cylinder(d=100, h=67);
            }

            difference() {
                translate([0, 0, 61])
                tube(sd, 6, 2, $fn=60);

                chamfered_cylinder(sd, 63.5, 4, $fn=60);
            }


            hull() {
                cylinder(d=25.6, h=13.5, $fn=60);
                cylinder(d=12, h=18.7, $fn=60);
            }

            hull() {
                translate([0, 0, 70 - 11.5])
                cylinder(d=25.6, h=11.5, $fn=60);

                translate([0, 0, 70 - 16.7])
                cylinder(d=12, h=16.7, $fn=60);
            }

            cylinder(d=12.1, h=53.5, $fn=60);

            translate([0, 0, 58.5])
            cube([1.2, sd - 1, 5], center=true);

            translate([0, 0, 55.5])
            cube([sd - 1, 1.2, 5], center=true);

        }

        hull() {
            cylinder(d=22.2, h=13, $fn=60);
            cylinder(d=9, h=18, $fn=60);
        }

        hull() {
            translate([0, 0, 70 - 11])
            cylinder(d=22.2, h=11, $fn=60);

            translate([0, 0, 70 - 16])
            cylinder(d=9, h=16, $fn=60);
        }
        cylinder(d=9, h=160, center=true, $fn=60);

        translate([0, 0, 61])
        difference() {
            intersection() {
                v_screw(
                    h=10,
                    screw_d=sd - 1.6,
                    pitch=2,
                    direction=0,
                    steps=60,
                    depth=0.5,
                    chamfer=true
                );

                cylinder(d=sd - 2.6, h=200, center=true, $fn=60);
            }

            cylinder(d=40, h=60, center=true);
        }
    }
}

module M4_rod_axle_nut() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 8 - 4.5])
                M8_nut(4, cone=false);

                cylinder(d=10, h=8, $fn=20);
            }
            cylinder(d=8, h=11.5, $fn=40);
        }

        difference() {
            cylinder(d=3.9, h=60, center=true, $fn=20);

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([3.9/2 + 0.2, 0, 0])
                cylinder(d=1, h=60, center=true, $fn=20);
            }
        }
    }
}

module M4_rod_axle_half() {
    difference() {
        tube(8, 30, 1.9, $fn=40);

        translate([0, 0, 30/2])
        chamfered_cylinder(4.4, 21, 1, center=true, $fn=40);
    }
}