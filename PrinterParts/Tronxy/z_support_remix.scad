include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;
use <../../Dollo/New_long_ties/mockups.scad>;
include <common.scad>;

stl_base_path = "../../_downloaded/";

debug();
//debug_height_block();
//_mock_z_plate();

//new_z_support(final_render=false);
//new_z_support(final_render=true);
//height_block();
//height_block(10);
//support_fixing_spacer();
//qnd_middle_support();


module _original() {
    z_support_path = str(
        stl_base_path, "X5S_z_support/"
    );

    translate([-17, 38, 114.57])
    rotate([180, 0, 0])
    import(str(
        z_support_path,
        "X5S_Z_support_System_and_bed_lowering-8mm_rod.stl"
    ), convexity=5);
}

module _mock_z_plate() {
    difference() {

        // main form
        cube([331, 35, 5], center=true);

        // bed carriage mount holes
        translate([z_plate_len/2 - 5, 35/2 - 7.5, 0])
        cylinder(d=5, h=20, center=true, $fn=20);

        translate([z_plate_len/2 - 5, -35/2 + 7.5, 0])
        cylinder(d=5, h=20, center=true, $fn=20);

        translate([-z_plate_len/2 + 5, 35/2 - 7.5, 0])
        cylinder(d=5, h=20, center=true, $fn=20);

        translate([-z_plate_len/2 + 5, -35/2 + 7.5, 0])
        cylinder(d=5, h=20, center=true, $fn=20);

        // bed adjustment screw holes
        translate([-z_plate_len/2 + 25, 35/2 - 10, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([z_plate_len/2 - 25, 35/2 - 10, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        // trapezoid nut hole and screw holes
        cylinder(d=10.5, h=20, center=true, $fn=30);

        translate([-8, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([8, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([0, -8, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([0, 8, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        // just holes
        translate([-37/2, 0, 0])
        cylinder(d=10, h=20, center=true, $fn=30);

        translate([37/2, 0, 0])
        cylinder(d=10, h=20, center=true, $fn=30);

        // bearing holes
        translate([-65, 0, 0])
        cylinder(d=18.5, h=20, center=true, $fn=30);

        translate([65, 0, 0])
        cylinder(d=18.5, h=20, center=true, $fn=30);

        // bearing mount screw holes
        translate([-65 - 12, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([-65 + 12, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([-65, -12, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([-65, 12, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([65 - 12, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([65 + 12, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=10);
        
        translate([65, -12, 0])
        cylinder(d=3, h=20, center=true, $fn=10);

        translate([65, 12, 0])
        cylinder(d=3, h=20, center=true, $fn=10);
    }
}

module debug() {
    intersection() {
        translate([0, 0, 5])
        new_z_support();

        translate([0, 40/2, 0])
        cube([321, 40, 220], center=true);
    }
    %translate([0, 0, 5/2])
    _mock_z_plate();

    //cylinder(d=10, h=1, $fn=30);

    color("darkgrey")
    translate([-65, 0, -5])
    plastic_bearing_housing();

    translate([-65, 0, 51.4 + 24/2 - 5])
    mock_LM8UU();

    translate([z_plate_len/2 - 5, 0, 16.1])
    rotate([180, 0, 0])
    height_block();

    translate([37/2, 0, -1.4])
    support_fixing_spacer();

    translate([-37/2, 0, -1.4])
    support_fixing_spacer();
}

module debug_height_block() {
    height_block();

    intersection() {
        translate([0, 0, 5.05])
        height_block();

        translate([100/2, 0, 0])
        cube([100, 30, 30], center=true);
    }
}

module middle_support() {
    z_support_path = str(
        stl_base_path, "Tronxy_z_support/"
    );
    
    translate([-17, -38, -73.6])
    import(str(
        z_support_path,
        "Standalone.stl"
    ), convexity=5);
}

module mock_LM8UU() {
    color("silver")
    difference() {
        cylinder(d=15, h=24, center=true, $fn=30);
        cylinder(d=8, h=25, center=true, $fn=30);
    }
}

module plastic_bearing_housing() {
    difference() {
        union() {
            cylinder(d=32, h=5, $fn=40);
            cylinder(d=17.4, h=5 + 46.4, $fn=30);
        }
        cylinder(d=8, h=51, $fn=40);
    }
}

module hole_with_spring(d, h, top_gap=false) {

    module arc() {
        intersection() {
            difference() {
                cylinder(d=d + 5, h=h, $fn=50);
                cylinder(d=d + 3, h=h, $fn=50);
            }
            //cube([d*2, d*0.7, h*2], center=true);
            hull() {
                cylinder(d=1, h=h);
                translate([(d + 5)/2, 0, h/2])
                cube([1, d*0.7, h], center=true);
            }
        }
    }
    
    scaling = (d - 0.2)/d;
    
    union() {
        intersection() {
            cylinder(d=d + 0.2, h=h, $fn=50);

            scale([scaling, 1.1,1])
            cylinder(d=d, h=h, $fn=50);

            scale([1.1, scaling, 1])
            cylinder(d=d, h=h, $fn=50);
        }
        translate([0, 0, h/2])
        cube([1, d + 4.5, h], center=true);

        translate([0, 0, h/2])
        cube([d + 4.5, 1, h], center=true);

        for (i=[0:3]) {
            rotate([0, 0, 360/4*i])
            arc();
        }
        if (top_gap) {
            translate([0, 0, h - 0.2])
            cylinder(d=d + 4, h=0.2, $fn=50);
        }
    }
}

//hole_with_spring(30, 20, top_gap=true);

module _remove_middle() {
    translate([0, 0, 37])
    difference() {
        cube([130, 50, 10], center=true);

        translate([-65, 0, 0])
        cylinder(d=30, h=10, center=true);

        translate([65, 0, 0])
        cylinder(d=30, h=10, center=true);
    }
}

module new_z_support(final_render=false) {
    //%_original();

    module _side_form() {

        module _side_indent() {
            hull() {
                translate([-113, 12, 0])
                sphere(d=20, $fn=40);

                translate([-65, 31, 0])
                sphere(d=20, $fn=40);

                translate([-65, 12, 0])
                sphere(d=20, $fn=40);
            }

            hull() {
                translate([113, 12, 0])
                sphere(d=20, $fn=40);

                translate([65, 31, 0])
                sphere(d=20, $fn=40);

                translate([65, 12, 0])
                sphere(d=20, $fn=40);
            }

            hull() {
                translate([52, 31, 0])
                sphere(d=20, $fn=40);

                translate([6.5, 31, 0])
                sphere(d=20, $fn=40);

                translate([52, 12, 0])
                sphere(d=20, $fn=40);

                translate([6.5, 12, 0])
                sphere(d=20, $fn=40);
            }

            hull() {
                translate([-52, 31, 0])
                sphere(d=20, $fn=40);

                translate([-6.5, 31, 0])
                sphere(d=20, $fn=40);

                translate([-52, 12, 0])
                sphere(d=20, $fn=40);

                translate([-6.5, 12, 0])
                sphere(d=20, $fn=40);
            }
        }

        difference() {
            union() {
                translate([0, 42/2, 0])
                cube([130, 42, 6], center=true);

                hull() {
                    translate([-130/2, 42/2, 0])
                    cube([1, 42, 6], center=true);

                    translate([-z_plate_len/2 + 11, 6/2, 0])
                    cube([1, 6, 6], center=true);
                }

                hull() {
                    translate([130/2, 42/2, 0])
                    cube([1, 42, 6], center=true);

                    translate([z_plate_len/2 - 11, 6/2, 0])
                    cube([1, 6, 6], center=true);
                }

            }

            translate([0, 0, 20/2 + 0.8])
            _side_indent();

            translate([0, 0, -20/2 - 0.8])
            _side_indent();
        }
    }
    
    module _main_z_support_form() {
        union() {
            translate([0, 0, 6/2])
            cube([z_plate_len, 35, 6], center=true);

            translate([0, -35/2 + 6/2, 0])
            rotate([90, 0, 0])
            _side_form();

            translate([0, 35/2 - 6/2, 0])
            rotate([90, 0, 0])
            _side_form();

            translate([-65, 0, 0]) {
                cylinder(d=30, h=51.4 - 10);

                translate([0, 0, 51.4 - 10])
                cylinder(d1=30, d2=27, h=24);
            }

            translate([65, 0, 0]) {
                cylinder(d=30, h=51.4 - 10);

                translate([0, 0, 51.4 - 10])
                cylinder(d1=30, d2=27, h=24);
            }

            translate([-z_plate_len/2 + 25, 35/2 - 10])
            cylinder(d=8, h=14, $fn=30);

            translate([z_plate_len/2 - 25, 35/2 - 10])
            cylinder(d=8, h=14, $fn=30);

        translate([-37/2, 0, 0])
        cylinder(d=11, h=8, $fn=6);

        translate([37/2, 0, 0])
        cylinder(d=11, h=8, $fn=6);
        }
    }


    difference() {

        _main_z_support_form();

        // bearing holes
        translate([-65, 0, 0]) {
            if (final_render) {
                hole_with_spring(17.6, 51.4 - 10, top_gap=true);

                translate([0, 0, 51.4 - 10 + 0.2])
                hole_with_spring(15, 26);
            } else {
                cylinder(d=17.5, h=51.4 - 10, $fn=30);
                translate([0, 0, 51.4 - 10 + 0.2])
                cylinder(d=15, h=26, $fn=30);
            }

            cylinder(d1=18.2, d2=16.8, h=0.7, $fn=30);

            translate([0, 0, 51.4 - 10 + 24 - 0.7])
            cylinder(d1=14.6, d2=16, h=0.7, $fn=30);
        }

        // bearing holes
        translate([65, 0, 0]) {
            if (final_render) {
                hole_with_spring(17.5, 51.4 - 10, top_gap=true);

                translate([0, 0, 51.4 - 10 + 0.2])
                hole_with_spring(15, 26);
            } else {
                cylinder(d=17.5, h=51.4 - 10, $fn=30);

                translate([0, 0, 51.4 - 10 + 0.2])
                cylinder(d=15, h=26, $fn=30);
            }
            cylinder(d1=18.2, d2=16.8, h=0.7);

            translate([0, 0, 51.4 - 10 + 24 - 0.7])
            cylinder(d1=14.6, d2=16, h=0.7, $fn=30);
        }

        // bed carriage mount holes
        translate([z_plate_len/2 - 5, -35/2 + 7.5, 0])
        cylinder(d=5.2, h=20, center=true, $fn=40);

        translate([z_plate_len/2 - 5, 35/2 - 7.5, 0])
        cylinder(d=5.2, h=20, center=true, $fn=40);

        translate([-z_plate_len/2 + 5, -35/2 + 7.5, 0])
        cylinder(d=5.2, h=20, center=true, $fn=40);

        translate([-z_plate_len/2 + 5, 35/2 - 7.5, 0])
        cylinder(d=5.2, h=20, center=true, $fn=40);

        // height block indents
        translate([z_plate_len/2 - 5, -35/2 + 7.5, 4])
        cylinder(d2=8.2, d1=5.1, h=2.1, $fn=40);

        translate([z_plate_len/2 - 5, 35/2 - 7.5, 4])
        cylinder(d2=8.2, d1=5.1, h=2.1, $fn=40);

        translate([-z_plate_len/2 + 5, -35/2 + 7.5, 4])
        cylinder(d2=8.2, d1=5.1, h=2.1, $fn=40);

        translate([-z_plate_len/2 + 5, 35/2 - 7.5, 4])
        cylinder(d2=8.2, d1=5.1, h=2.1, $fn=40);

        // adjust screw holes
        translate([z_plate_len/2 - 25, 35/2 - 10])
        cylinder(d=3.6, h=40, center=true, $fn=30);

        translate([-z_plate_len/2 + 25, 35/2 - 10])
        cylinder(d=3.6, h=40, center=true, $fn=30);

        // main screw hole
        cylinder(d=24, h=200, center=true, $fn=60);

        // center plate fixing holes
        translate([-37/2, 0, 0])
        cylinder(d=4.3, h=20, center=true, $fn=30);

        translate([37/2, 0, 0])
        cylinder(d=4.3, h=20, center=true, $fn=30);

        translate([-37/2, 0, 4])
        M4_nut(5);

        translate([37/2, 0, 4])
        M4_nut(5);

    }
}

module height_block(h=5) {
    difference() {
        union() {
            translate([0, 0, h/2])
            cube([10, 35, h], center=true);

            translate([0, -35/2 + 7.5, h])
            cylinder(d1=8, d2=6.5, h=1, $fn=40);

            translate([0, 35/2 - 7.5, h])
            cylinder(d1=8, d2=6.5, h=1, $fn=40);
        }
        translate([0, -35/2 + 7.5, -0.1])
        cylinder(d1=8.2, d2=5.1, h=2.1, $fn=40);

        translate([0, 35/2 - 7.5, -0.1])
        cylinder(d1=8.2, d2=5.1, h=2.1, $fn=40);

        translate([0, -35/2 + 7.5, 0])
        cylinder(d=5.2, h=h*10, center=true, $fn=40);

        translate([0, 35/2 - 7.5, 0])
        cylinder(d=5.2, h=h*10, center=true, $fn=40);
    }
}

module support_fixing_spacer() {
    difference() {
        union() {
            cylinder(d=14, h=1.4, $fn=30);

            cylinder(d=9.5, h=6.2, $fn=30);
        }
        cylinder(d=4.3, h=20, center=true, $fn=30);
    }
}

module qnd_middle_support() {
    difference() {
        union() {
            middle_support();

            translate([65, 0, 0])
            intersection() {
                tube(33, 6, 2, $fn=40);

                translate([-30/2, 0, 0])
                cube([30, 20, 20], center=true);
            }
            translate([-65, 0, 0])
            intersection() {
                tube(33, 6, 2, $fn=40);
                translate([30/2, 0, 0])
                cube([30, 20, 20], center=true);
            }
        }
        translate([-65, 0, 0])
        cylinder(d=30.1, h=20, center=true, $fn=50);

        translate([65, 0, 0])
        cylinder(d=30.1, h=20, center=true, $fn=50);
    }
}
