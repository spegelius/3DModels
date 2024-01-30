include <../Dollo/NEW_long_ties/include.scad>;
include <../Dollo/NEW_long_ties/globals.scad>;
include <../Dollo/NEW_long_ties/mockups.scad>;

include <../PCParts/common.scad>;



$fn=30;

//%translate([53, 2.5, 35])
//rotate([90, 0, 180])
//mock_PSU_600W();
//cord_socket_hole_AC_14_F1(nuts=true);

//cover1_360W();
//cover2_360W();
//cover2_360W_with_2020_ear();
//cover_240W();
//cover_240W_with_2020_ear();
cover_240W_ATX();

//bottom_bracket1();
//bottom_bracket2();

//translate([0, -25, 0])
//cord_holder();

//translate([20, -25, 0])
//cord_holder(false);

//cord_socket_hole();


module cord_socket_hole_AC_14_F1(nuts=false) {
    cut_side = 8.5;
    
    difference() {
        cube([47.5, 27.3, 30], center=true);

        translate([47.5/2, -27.3/2, 0])
        rotate([0, 0, 45])
        cube([cut_side, cut_side, 35], center=true);

        translate([47.5/2, 27.3/2, 0])
        rotate([0, 0, 45])
        cube([cut_side, cut_side, 35], center=true);
    }

    translate([-1, 39/2, 0])
    cylinder(d=3.2, h=30, center=true);

    translate([-1, -39/2, 0])
    cylinder(d=3.2, h=30, center=true);

    if (nuts) {
        translate([-1, 39/2, 2])
        M3_nut(15);

        translate([-1, -39/2, 2])
        M3_nut(15);
    }
}


module cover1_360W() {
    difference() {
        union() {
            translate([0, 0, 38.75])
            import("PSU_Cover_v2.stl", convexity=5);

            translate([-59, 17, 0])
            cube([54, 35, 2]);
            //translate([9, 27, -38.75])
            //cube([38, 25, 2]);
        }

        translate([33, 18, -1])
        cylinder(d=8, h=3);

        translate([23.5, 18, -1])
        cylinder(d=3.3, h=3);

        translate([42.5, 18, -1])
        cylinder(d=3.3, h=3);

        translate([2, 25, 0])
        mains_switch_hole();
    }

    module extrusion() {
        hull() {
            sphere(d=2);

            translate([0, 5, 0])
            sphere(d=2);
        }
    }

    translate([-62.6, 5, 34])
    extrusion();

    translate([-62.6, 45, 34])
    extrusion();

    translate([-62.6, 5, 42])
    extrusion();

    translate([-62.6, 45, 42])
    extrusion();

    translate([55.1, 5, 34])
    extrusion();

    translate([55.1, 45, 34])
    extrusion();

    translate([55.1, 5, 42])
    extrusion();

    translate([55.1, 45, 42])
    extrusion();

    // cord hole body
    translate([33, 18, 0])
    difference() {
        cylinder(d=11, h=5);

        hull() {
            translate([0, 0, 5])
            cylinder(d=8, h=1);

            cylinder(d=7, h=1);
        }
    }
}

module cover2_360W() {
    difference() {
        union() {
            translate([0, 0, 38.75])
            import("PSU_Cover_v2.stl", convexity=5);

            translate([-59, 17, 0])
            cube([54, 35, 2]);

            translate([-52.5, 53, 2])
            cube([45, 2, 24]);

            translate([-4, 53, 4])
            cube([20, 2, 24]);

            translate([-30 -20, 50, 12])
            hull() {
                cube([8, 1, 8], center=true);

                translate([0, 4, 0])
                cube([8, 1, 16], center=true);
            }

            translate([-30 + 20, 50, 12])
            hull() {
                cube([8, 1, 8], center=true);

                translate([0, 4, 0])
                cube([8, 1, 16], center=true);
            }
        }

        translate([16.1, 55, 16.25])
        rotate([90, 0, 0])
        cylinder(d=3, h=10, center=true, $fn=50);

        translate([16.1, 55, 23.25])
        rotate([90, 0, 0])
        cylinder(d=3, h=10, center=true, $fn=50);

        translate([5, 55, 16])
        rotate([90, 0, 0])
        mains_switch_hole();

        translate([-30, 48, 12])
        rotate([-90, 0, 0])
        cord_socket_hole();

        translate([-30 - 20, 52, 12])
        rotate([0, 90, -90])
        M3_nut(3);

        translate([-30 + 20, 52, 12])
        rotate([0, 90, -90])
        M3_nut(3);
    }
}

module cover2_360W_with_2020_ear() {
    difference() {
        union() {
            cover2_360W();

            translate([-68.5, -3, 20/2])
            hull() {
                rotate([-90, 0, 0])
                cylinder(d=20, h=5);

                translate([10, 0, -20/2])
                cube([1, 5, 20]);

                translate([14, 3, -20/2])
                cube([1, 2, 20]);
            }
        }

        translate([-68.5, 0, 20/2])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=11, center=true);
    }
}

module cover_240W(grills=true, socket_hole=true) {
    w = 111 + 4.5;
    l = 50 + 4.5;
    h = 70;

    module grill(l) {
        rotate([90, 0, 0])
        hull() {
            translate([-l/2, 0, 0])
            cylinder(d=3, h=10, $fn=50, center=true);

            translate([l/2, 0, 0])
            cylinder(d=3, h=10, $fn=50, center=true);
        }
    }

    difference() {
        union() {
            // body
            translate([0, 0, h/2])
            difference() {
                rounded_cube_side(
                    w, l, h, 2, center=true, $fn=80
                );

                translate([0, 0, 2])
                rounded_cube_side(
                    w - 4, l - 4, h, 1,
                    center=true, $fn=80
                );
            }

            // PSU mount bodies
            translate([w/2 - 7, l/2 - 8, h - 15/2])
            hull() {
                cube([11, 1, 13], center=true);

                translate([0, 6, -5/2])
                cube([11, 1, 18], center=true);
            }

            translate([w/2 - 8, -l/2 + 14, h - 13/2])
            hull() {
                cube([1, 25, 13], center=true);

                translate([6, 0, -5/2])
                cube([1, 25, 18], center=true);
            }

            translate([
                -w/2 + 13, -l/2 + 43/2 + 0.7, h - 10/2
            ])
            hull(){
                cube([1, 43, 10], center=true);

                translate([-11, 0, -8/2])
                cube([1, 43, 18], center=true);
            }

            // socket hole nut bodies
            if (socket_hole) {
                translate([25, -l/2 + 3.5, 8/2 + 1.5])
                cube([8, 4, 8], center=true);

                translate([25, -l/2 + 3.5, 39 + 8/2 + 1.5])
                hull() {
                    cube([8, 4, 8], center=true);

                    translate([0, -3, -2])
                    cube([8, 1, 10], center=true);
                }
            }
        }

        translate([
            w/2 - 2 - 11/2, l/2 - 2 - 1.6/2, h - 11/2
        ])
        cube([11, 1.6, 11], center=true);

        translate([
            w/2 - 2 - 1.6/2, l/2 - 2 - 10/2, h - 11/2
        ])
        cube([1.6, 10, 11], center=true);

        translate([
            w/2 - 2 - 1.6/2, -l/2 + 2 + 25/2,
            h - 12/2 + 1
        ])
        cube([1.6, 25, 12], center=true);

        translate([w/2 - 5, -l/2 + 2 + 6.7, h - 5])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=15, center=true, $fn=40);

        translate([w/2 - 5, -l/2 + 2 + 16.7, h - 5])
        rotate([0, 90, 0])
        cylinder(d=4.3, h=15, center=true, $fn=40);

        translate([w/2 - 2 - 6.25, l/2 - 7, h - 6])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=15, center=true, $fn=40);

        translate([-w/2 + 2 + 7.25, -3, h - 6])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=l, center=true, $fn=40);

        translate([-w/2 + 2 + 7.25, -l/2 + 9, h - 6])
        rotate([90, 0, 0])
        cylinder(d=7, h=l, center=true, $fn=40);

        translate([w/2 - 6, -l/2 + 2 + 6.7, h - 5])
        rotate([0, -90, 0])
        M4_nut();

        translate([w/2 - 6, -l/2 + 2 + 16.7, h - 5])
        rotate([0, -90, 0])
        M4_nut();

        translate([w/2 - 2 - 6.25, l/2 - 6, h - 6])
        rotate([0, 90, -90])
        M4_nut();

        if (socket_hole) {
            translate([26, -l/2, 25])
            rotate([90, 0, 0])
            cord_socket_hole_AC_14_F1();

            translate([25, -l/2 + 3.5, 8/2 + 1.5])
            rotate([0, 90, 90])
            M3_nut();

            translate([25, -l/2 + 3.5, 39 + 8/2 + 1.5])
            rotate([0, 90, 90])
            M3_nut();
        }

        // cables hole
        translate([20, 15, 0])
        cylinder(d=12, h=5, center=true);

        // grills
        if (grills) {
            translate([-w/2, 3, h - 20])
            rotate([0, 0, 90])
            grill(20);

            translate([-w/2, 3, h - 28])
            rotate([0, 0, 90])
            grill(20);

            translate([-w/2, 3, h - 36])
            rotate([0, 0, 90])
            grill(20);

            translate([w/2, 3, h - 20])
            rotate([0, 0, 90])
            grill(20);

            translate([w/2, 3, h - 28])
            rotate([0, 0, 90])
            grill(20);

            translate([w/2, 3, h - 36])
            rotate([0, 0, 90])
            grill(20);

            translate([30, -l/2, h - 20])
            grill(25);

            translate([-30, -l/2, h - 20])
            grill(25);

            translate([-30, -l/2, h - 28])
            grill(25);

            translate([-30, -l/2, h - 36])
            grill(25);

            translate([-30, -l/2, h - 44])
            grill(25);
        }
    }

    //%translate([-w/2 + 2.25, l/2 - 2.25, h - 11])
    //rotate([90, 0, 0])
    //mock_PSU_240W();
}

module cover_240W_ATX() {
    difference() {
        union() {
            translate([0, 15.75, 3])
            cover_240W(grills=false, socket_hole=false);

            translate([0, 0, 10/2])
            cube([
                atx_psu_width, atx_psu_height, 10
            ], center=true);
        }

        translate([0, atx_psu_height/2, -1])
        rotate([90, 0, 0])
        atx_psu_holes(hole=2.8, h=15);

        translate([30, 15, 0])
        rotate([0, 0, 90])
        cord_socket_hole_AC_14_F1(nuts=true);
    }

//    %translate([0, atx_psu_height/2, 0])
//    rotate([90, 0, 0])
//    mock_atx_psu();
}

module cover_240W_with_2020_ear() {
    difference() {
        union() {
            translate([0, 54.5/2, 0])
            rotate([0, 0, 180])
            cover_240W();

            translate([-63.5, -3, 20/2])
            hull() {
                rotate([-90, 0, 0])
                cylinder(d=20, h=5);

                translate([10, 0, -20/2])
                cube([1, 5, 20]);

                translate([14, 3, -20/2])
                cube([1, 2, 20]);
            }
            translate([63.5, -3, 20/2])
            hull() {
                rotate([-90, 0, 0])
                cylinder(d=20, h=5);

                translate([-11, 0, -20/2])
                cube([1, 5, 20]);

                translate([-15, 3, -20/2])
                cube([1, 2, 20]);
            }
        }

        translate([-63.5, 0, 20/2])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=11, center=true);

        translate([63.5, 0, 20/2])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=11, center=true);
    }
}

module bottom_bracket1() {
    // for 360W PSU
    difference() {
        union() {
            hull() {
                translate([-25, 0, 0])
                cylinder(d=20, h=5);

                translate([65, 0, 0])
                cylinder(d=20, h=5);
            }

            hull() {
                translate([-25, 0, 0])
                cylinder(d=20, h=5);

                translate([-66, 22.5, 0])
                cylinder(d=20, h=5);
            }
        }
        translate([65, 0, 0])
        cylinder(d=4.2, h=11, center=true);

        translate([-66, 22.5, 0])
        cylinder(d=4.2, h=11, center=true);

        translate([-25, 0, 0])
        cylinder(d=4.2, h=11, center=true);

        translate([25, 0, 0])
        cylinder(d=4.2, h=11, center=true);
    }
    //%translate([-114/2, -183, 5])
    //mock_PSU_600W();    
}

module bottom_bracket2() {
    difference() {
        hull() {
            translate([-45.5, 0, 0])
            cylinder(d=20, h=5);

            translate([63.5, 0, 0])
            cylinder(d=20, h=5);
        }
        translate([63.5, 0, 0])
        cylinder(d=4.2, h=11, center=true);

        translate([-45.5, 0, 0])
        cylinder(d=4.2, h=11, center=true);

        translate([40.5, 0, 0])
        cylinder(d=4.2, h=11, center=true);
    }
    //%translate([-111/2, -187, 5])
    //mock_PSU_240W();
}

module cord_holder(nut_holes=true) {
    
    module bolt_hole() {
        hull() {
            translate([1, 0, 0])
            cylinder(d=bolt_hole_dia, h=6);

            translate([-1, 0, 0])
            cylinder(d=bolt_hole_dia, h=6);
        }
    }

    module arm() {
        difference() {
            cube([5, 9, 6]);

            translate([0, 4.5, 3])
            rotate([0, 90, 0])
            cylinder(d=bolt_hole_dia, h=6);

            if (nut_holes) { 
                translate([2, 4.5, 3])
                rotate([0, 90, 180]) M3_nut();
            }
        }
    }

    module main() {

        difference() {
            union() {
                cube([14, 13, 6]);
            }

            translate([6, 6.5, 3.6])
            elongated_nut(2.5);

            translate([6, 6.5, 0])
            bolt_hole();

            translate([15.5, 6.5, 0])
            cylinder(d=7, h=8);
        }
        
        translate([9, -9, 0])
        arm();

        translate([9, 13, 0])
        arm();
    }

    main();
}

