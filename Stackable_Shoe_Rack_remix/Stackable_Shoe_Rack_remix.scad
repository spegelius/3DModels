use <../Dollo/NEW_long_ties/include.scad>;

use <voronoi/voronoi.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Stackable Shoe Rack/"
);

w = 206;

//_orig_shoe_rack_side_v3();


//_voronoi();
//debug();

//shoe_rack_side_v3_honeycomb();
//shoe_rack_side_v3_dc_1();
//shoe_rack_side_v3_dc_2();

//voronoi_board();
//voronoi_board_250_1();
//voronoi_board_250_2();
//voronoi_board_250_3();
//voronoi_board_250_4();
//board_end();
//board_spacer();
board_middle();


module _orig_shoe_rack_side_v3() {
    import(
        str(spath, "shoe-rack-side-v3.stl"),
        convexity=10
    );
}

module debug() {
    render()
    translate([0, -1000/2 + 20, 0])
    intersection() {
        _orig_shoe_rack_side_v3();

//        translate([0, 0, -400/2])
//        cube([400, 300, 400], center=true);

        translate([-400/2, 0, 0])
        cube([400, 300, 400], center=true);
    }

//    render()
//    voronoi_board();

    render()
    intersection() {
        translate([0, -5/2, 0])
        voronoi_board_250_1();

        translate([0, 0, -100/2])
        cube([2000, 2000, 100], center=true);
    }

    render()
    intersection() {
        translate([0, -5/2, 0])
        voronoi_board_250_2();

        translate([0, 0, -100/2])
        cube([2000, 2000, 100], center=true);
    }

    render()
    translate([0, 5/2, 0])
    voronoi_board_250_3();

    render()
    translate([0, 5/2, 0])
    voronoi_board_250_4();

    render()
    translate([0, -1000/2 - 9.2 - 5/2, 0])
    rotate([-90, 0, 0])
    board_end();

    render()
    intersection() {
        rotate([90, 0, 0])
        board_middle();

        translate([0, 0, -300/2])
        cube([2000, 2000, 300], center=true);
    }

    render()
    translate([-w/2 + 15, -1/2, 0])
    rotate([90, 0, 0])
    board_spacer();

    render()
    translate([-w/2 + 15, -250 - 1/2, 0])
    rotate([90, 0, 0])
    board_spacer();

    %translate([-w/2 + 15, 0, 0])
    rotate([90, 0, 0])
    cylinder(d=6, h=1000, center=true, $fn=40);

    %translate([w/2 - 15, 0, 0])
    rotate([90, 0, 0])
    cylinder(d=6, h=1000, center=true, $fn=40);

}

module _voronoi() {
    random_voronoi(
        n = 894,
        nuclei = false,
        L = 850,
        thickness = 1,
        round = 1,
        min = 0,
        max = 1050,
        seed = 41,
        center=true
    );

    //n = 20, nuclei = true, L = 200, thickness = 1, round = 6, min = 0, max = 100, seed = undef, center = false
}

module _hex_pattern() {
    step = 15;
    hc = 15.6;

    rotate([0, 0, 30])
    for(j = [0:20]) {
        translate([0, j*step, 0])
        rotate([0, 0, -60])
        for (i = [0:49]) {
            translate([0, i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );

            translate([0, -i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );
        }

        translate([0, -j*step, 0])
        rotate([0, 0, -60])
        for (i = [0:49]) {
            translate([0, i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );

            translate([0, -i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );
        }
    }
    
}

module shoe_rack_side_v3_honeycomb() {
    step = 15;
    hc = 15.6;

    difference() {
        rotate([-90, 0, 0])
        _orig_shoe_rack_side_v3();

        intersection() {
            difference() {
                translate([0, 0, -10])
                linear_extrude(40)
                offset(-2.7)
                projection(cut=true)
                rotate([-90, 0, 0])
                _orig_shoe_rack_side_v3();

                translate([-83.5, -192, 25/2])
                chamfered_cube(39, 21, 23, 4, center=true);

                translate([83.5, -192, 25/2])
                chamfered_cube(39, 21, 23, 4, center=true);
            }

            _hex_pattern();
        }
    }
}

module shoe_rack_side_v3_dc_1() {
    difference() {
        shoe_rack_side_v3_honeycomb();

        translate([0, 0, 25 - 2])
        linear_extrude(2.2)
        offset(-1.8)
        projection(cut=true)
        rotate([-90, 0, 0])
        _orig_shoe_rack_side_v3();
    }
}

module shoe_rack_side_v3_dc_2() {
    intersection() {
        shoe_rack_side_v3_honeycomb();

        translate([0, 0, 25 - 2])
        linear_extrude(2.2)
        offset(-1.8)
        projection(cut=true)
        rotate([-90, 0, 0])
        _orig_shoe_rack_side_v3();
    }
}

module voronoi_board() {
    difference() {
        rotate([90, 0, 0])
        chamfered_cube_side(
            w, 18, 1000, 4, center=true
        );

        // voronoi pattern
        difference() {
            translate([0, 0, -10])
            linear_extrude(50)
            _voronoi();

            translate([-w/2, 0, 0])
            rotate([90, 0, 0])
            chamfered_cube_side(
                60, 18, 1000, 4, center=true
            );

            translate([w/2, 0, 0])
            rotate([90, 0, 0])
            chamfered_cube_side(
                60, 18, 1000, 4, center=true
            );

            translate([0, 1000/2, 0])
            rotate([90, 0, 90])
            chamfered_cube_side(
                60, 18, 180, 4, center=true
            );

            translate([0, -1000/2, 0])
            rotate([90, 0, 90])
            chamfered_cube_side(
                60, 18, 180, 4, center=true
            );
        }

        hull() {
            translate([-w/2 + 15, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=6.5, h=2000, center=true, $fn=40);

            translate([-w/2 + 15, 0, 4])
            cube([0.1, 2000, 1], center=true);
        }

        hull() {
            translate([w/2 - 15, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=6.5, h=2000, center=true, $fn=40);

            translate([w/2 - 15, 0, 4])
            cube([0.1, 2000, 1], center=true);
        }

        // nut corners
        translate([w/2, 1000/2, 0])
        cube([46, 30, 30], center=true);

        translate([-w/2, 1000/2, 0])
        cube([46, 30, 30], center=true);

        translate([w/2, -1000/2, 0])
        cube([46, 30, 30], center=true);

        translate([-w/2, -1000/2, 0])
        cube([46, 30, 30], center=true);

        translate([-w/2, 1000/2, 0])
        cube([6, 40, 30], center=true);

        translate([w/2, 1000/2, 0])
        cube([6, 40, 30], center=true);
        
        translate([-w/2, -1000/2, 0])
        cube([6, 40, 30], center=true);

        translate([w/2, -1000/2, 0])
        cube([6, 40, 30], center=true);

        // ends
        translate([0, -1000/2 - 10/2 + 2, 0])
        chamfered_cube(200, 10, 9, 2, center=true);

        translate([0, 1000/2 + 10/2 - 2, 0])
        chamfered_cube(200, 10, 9, 2, center=true);

        translate([-70, 1000/2, 0])
        rotate([90, 0, 0])
        cylinder(d=2.7, h=50, center=true, $fn=30);

        translate([70, 1000/2, 0])
        rotate([90, 0, 0])
        cylinder(d=2.7, h=50, center=true, $fn=30);

        translate([-70, -1000/2, 0])
        rotate([90, 0, 0])
        cylinder(d=2.7, h=50, center=true, $fn=30);

        translate([70, -1000/2, 0])
        rotate([90, 0, 0])
        cylinder(d=2.7, h=50, center=true, $fn=30);
    }
}

module voronoi_board_250_1() {
    intersection() {
        union() {
            voronoi_board();

            translate([0, -250, 0])
            chamfered_cube(w - 40, 8, 18, 2, center=true);
        }

        translate([0, -1000/2 + 250/2, 0])
        difference() {
            cube([300, 250, 50], center=true);

            translate([-w/2 + 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([w/2 - 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);
        }
    }
}

module voronoi_board_250_2() {
    intersection() {
        union() {
            voronoi_board();

            translate([0, -250, 0])
            chamfered_cube(w - 40, 8, 18, 2, center=true);

            chamfered_cube(w - 40, 8, 18, 2, center=true);
        }

        translate([0, -250/2, 0])
        difference() {
            cube([300, 250, 50], center=true);

            translate([-w/2 + 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([w/2 - 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([-w/2 + 15, -250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([w/2 - 15, -250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

        }
    }
}

module voronoi_board_250_3() {
    intersection() {
        union() {
            voronoi_board();

            translate([0, 250, 0])
            chamfered_cube(w - 40, 8, 18, 2, center=true);

            chamfered_cube(w - 40, 8, 18, 2, center=true);
        }

        translate([0, 250/2, 0])
        difference() {
            cube([300, 250, 50], center=true);

            translate([-w/2 + 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([w/2 - 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([-w/2 + 15, -250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([w/2 - 15, -250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);
        }
    }
}

module voronoi_board_250_4() {
    intersection() {
        union() {
            voronoi_board();

            translate([0, 250, 0])
            chamfered_cube(w - 40, 8, 18, 2, center=true);
        }

        translate([0, 1000/2 - 250/2, 0])
        difference() {
            cube([300, 250, 50], center=true);

            translate([-w/2 + 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

            translate([w/2 - 15, 250/2, 0])
            rotate([90, 0, 0])
            chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);
        }
    }
}

module board_end() {
    difference() {
        intersection() {
            translate([0, 0, 12/2])
            chamfered_cube(
                210.5, 27.5, 12, 3.2, center=true
            );

            union() {
                cube([300, 100, 8.4], center=true);
                cube([200, 18, 18.4], center=true);

                chamfered_cube(
                    160, 9, 22.4, 2.2, center=true
                );
            }
        }
        translate([70, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([70, 0, -4])
        chamfered_cylinder(6.5, 6.7, 1.7, $fn=30);

        translate([-70, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=30);

        translate([-70, 0, -4])
        chamfered_cylinder(6.5, 6.7, 1.7, $fn=30);

        translate([-w/2 + 15, 0, 4])
        cylinder(d=14, h=20, $fn=30);

        translate([w/2 - 15, 0, 4])
        cylinder(d=14, h=20, $fn=30);
    }
}

module board_spacer() {
    difference() {
        chamfered_cylinder(13.8, 4, 1.75, $fn=30);
        cylinder(d=6.3, h=20, center=true, $fn=30);
    }
}

module board_middle() {
    //%shoe_rack_side_v3_honeycomb();

    module _form() {
        union() {
            chamfered_cube_side(
                w, 18, 5, 4, center=true
            );

            hull() {
                translate([-w/2 + 60/2, 0, 0])
                chamfered_cube_side(
                    60, 18, 5, 4, center=true
                );

                translate([-108 + 25/2, -178.5, 0])
                chamfered_cube_side(25, 20, 5, 5, center=true);
            }
        }
    }

    difference() {
        _form();

        translate([-w/2 + 15, 0, 0])
        cylinder(d=6.3, h=20, center=true, $fn=30);

        translate([w/2 - 15, 0, 0])
        cylinder(d=6.3, h=20, center=true, $fn=30);

        translate([-w/2 + 15, 0, -5/2])
        chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

        translate([-w/2 + 15, 0, 5/2])
        chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

        translate([w/2 - 15, 0, -5/2])
        chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

        translate([w/2 - 15, 0, 5/2])
        chamfered_cylinder(14, 4, 1.7, center=true, $fn=30);

        translate([-w/2 + 15, 0, 0])
        cylinder(d=10.7, h=10, center=true, $fn=30);

        translate([w/2 - 15, 0, 0])
        cylinder(d=10.7, h=10, center=true, $fn=30);


        intersection() {
            difference() {
                translate([0, 0, -10])
                linear_extrude(40)
                offset(-3)
                projection(cut=true)
                _form();

                translate([-w/2 + 15, 0, 0])
                cylinder(d=22, h=20, center=true, $fn=30);

                translate([w/2 - 15, 0, 0])
                cylinder(d=22, h=20, center=true, $fn=30);
            }

            rotate([0, 0, -30])
            _hex_pattern();
        }

    }
    
}