use <../../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../../_downloaded/";
spath = str(
    stl_base_path, "Gigabyte Aorus logo/"
);

h = 4;

//debug_aorus_logo_plate();
//test_aorus_logo_bottom();
//test_aorus_logo_top();

//aorus_logo();
//full_aorus_logo();

//aorus_logo_plate_top();
//aorus_logo_plate_bottom();
aorus_logo_plate_back();


module _led_strip() {
    translate([0, 0, 0.3/2])
    cube([300, 10, 0.3], center=true);

    color("lightgrey")
    for(i = [0:17]) {
        translate([-145 + i*16.5, 0, 1.77/2])
        cube([5, 5, 1.77], center=true);
    }
}

module debug_aorus_logo_plate() {
    color(c = [40/255, 40/255, 40/255])
    translate([200, -100, 0])
    aorus_logo_plate_top();

    color("GhostWhite")
    translate([200, -100, 0])
    aorus_logo_plate_bottom();

    // led strip
    translate([200, -100, 0])
    translate([0, 0, -15.5])
    //rotate([30, 0, 0])
    _led_strip();

    translate([200, -100, 0])
    translate([0, 0, -17.5])
    //rotate([30, 0, 0])
    aorus_logo_plate_back();
}

module test_aorus_logo_bottom() {
    intersection() {
        aorus_logo_plate_bottom();

        translate([-18, 0, 0])
        cube([60, 60, 20], center=true);
    }
}

module test_aorus_logo_top() {
    intersection() {
        aorus_logo_plate_top();

        translate([-18, 0, 0])
        cube([60, 60, 20], center=true);
    }
}

module aorus_logo() {
    translate([-2400, 620, -45])
    import(
        str(spath, "logo.stl"),
        convexity=10
    );
}

module aorus_letter_a() {
    translate([-2400, 620, -45])
    import(
        str(spath, "a.stl"),
        convexity=10
    );
}

module aorus_letter_o() {
    translate([-2400, 620, -45])
    import(
        str(spath, "o.stl"),
        convexity=10
    );
}

module aorus_letter_r() {
    translate([-2400, 620, -45])
    import(
        str(spath, "r.stl"),
        convexity=10
    );
}

module aorus_letter_u() {
    translate([-2400, 620, -45])
    import(
        str(spath, "u.stl"),
        convexity=10
    );
}

module aorus_letter_s() {
    translate([-2400, 620, -45])
    import(
        str(spath, "s.stl"),
        convexity=10
    );
}

module aorus_text() {
    aorus_letter_a();
    aorus_letter_o();
    aorus_letter_r();
    aorus_letter_u();
    aorus_letter_s();
}

module full_aorus_logo() {
    aorus_logo();
    aorus_text();
}

module _hex_tile(split_d=1) {
    d = 13;

    difference() {
        rotate([0, 0, 30])
        cylinder(d=d, h=9, $fn=6);

        hull() {
            cylinder(
                d=split_d, h=20,
                center=true, $fn=20
            );

            translate([0, d/2, 0])
            cylinder(
                d=split_d, h=20,
                center=true, $fn=20
            );
        }

        hull() {
            cylinder(
                d=split_d + 0.2, h=20,
                center=true, $fn=20
            );

            translate([0, -d/2, 0])
            cylinder(
                d=split_d + 0.2, h=20,
                center=true, $fn=20
            );
        }

        rotate([0, 0, 60])
        hull() {
            cylinder(
                d=split_d - 0.2, h=20,
                center=true, $fn=20
            );

            translate([0, d/2, 0])
            cylinder(
                d=split_d - 0.2, h=20,
                center=true, $fn=20
            );
        }

        rotate([0, 0, 120])
        hull() {
            cylinder(
                d=split_d - 0.1, h=20,
                center=true, $fn=20
            );

            translate([0, d/2, 0])
            cylinder(
                d=split_d - 0.1, h=20,
                center=true, $fn=20
            );
        }

        rotate([0, 0, -60])
        hull() {
            cylinder(
                d=split_d - 0.2, h=20,
                center=true, $fn=20
            );

            translate([0, d/2, 0])
            cylinder(
                d=split_d - 0.2, h=20,
                center=true, $fn=20
            );
        }

        rotate([0, 0, -120])
        hull() {
            cylinder(
                d=split_d - 0.1, h=20,
                center=true, $fn=20
            );

            translate([0, d/2, 0])
            cylinder(
                d=split_d - 0.1, h=20,
                center=true, $fn=20
            );
        }
    }
}

//_hex_tile();

//#translate([-3.3, 0, 0])
//_triangle();

module _triangle() {
    linear_extrude(19)
    polygon([
        [2.3, 0], [-2.3, 2.65],
        [-2.3, -2.65]
    ]);
}

module _triangle_pattern() {
    x_off = -200;
    x_step = 10;
    y_step = 3.2;
    y_off = 12.3;

    for(i = [0:42]) {
        for(j = [0:5]) {
            translate([
                x_off + i*x_step,
                y_off + j*y_step, 0
            ])
            scale([
                0.75 + j*0.05,
                0.75 + j*0.05, 1
            ])
            rotate([0, 0, j*180])
            _triangle();
        }
    }

    for(i = [0:42]) {
        for(j = [0:5]) {
            translate([
                x_off - 5 + i*x_step,
                y_off + j*y_step, 0
            ])
            scale([
                0.75 + j*0.05,
                0.75 + j*0.05, 1
            ])
            rotate([
                0, 0, (j - 1)*180
            ])
            _triangle();
        }
    }

    mirror([0, 1, 0])
    for(i = [0:42]) {
        for(j = [0:5]) {
            translate([
                x_off + i*x_step,
                y_off + j*y_step, 0
            ])
            scale([
                0.75 + j*0.05,
                0.75 + j*0.05, 1
            ])
            rotate([0, 0, j*180])
            _triangle();
        }
    }

    mirror([0, 1, 0])
    for(i = [0:42]) {
        for(j = [0:5]) {
            translate([
                x_off - 5 + i*x_step,
                y_off + j*y_step, 0
            ])
            scale([
                0.75 + j*0.05,
                0.75 + j*0.05, 1
            ])
            rotate([
                0, 0, (j - 1)*180
            ])
            _triangle();
        }
    }
}

module aorus_logo_plate_top() {
    lh = 1;

    render()
    difference() {
        translate([0, 0, h - 1 + lh/2])
        cube([342, 50, lh], center=true);

        linear_extrude(h - 0.8)
        offset(0.1)
        projection()
        scale([0.14, 0.14, 1])
        full_aorus_logo();

        scale([0.14, 0.14, 1])
        full_aorus_logo();

        translate([0, 0, h - 1])
        difference() {
            _triangle_pattern();

            linear_extrude(1)
            offset(2)
            projection()
            scale([0.14, 0.14, 1])
            full_aorus_logo();

            cube(
                [400, 21, 0.8],
                center=true
            );

            cube(
                [400, 27, 0.4],
                center=true
            );
        }

//        translate([-342/2 + 15/2, 0])
//        cylinder(d=6.1, h=20, center=true, $fn=30);
//
//        translate([342/2 - 15/2, 0])
//        cylinder(d=6.1, h=20, center=true, $fn=30);
    }
}

module aorus_logo_plate_bottom() {
    h = h - 1;

    difference() {
        translate([0, 0, h/2])
        cube([342, 50, h], center=true);

//        translate([-342/2 + 15/2, 0, 2])
//        cylinder(d=6.1, h=20, $fn=30);
//
//        translate([342/2 - 15/2, 0, 2])
//        cylinder(d=6.1, h=20, $fn=30);

//        translate([-342/2 + 15/2, 0])
//        cylinder(d=3.2, h=20, center=true, $fn=30);
//
//        translate([342/2 - 15/2, 0])
//        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([-123.5, -8, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);

        translate([123.5, -8, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);

        translate([0, 8, 0])
        cylinder(d=2.8, h=6, center=true, $fn=20);
    }
}

module aorus_logo_plate_back() {
    module _mount_stud() {
        hull() {
            translate([1, 0, 0])
            cylinder(d=6.1, h=1, $fn=20);

            translate([0, 0, 16.5])
            cylinder(d=6.5, h=1, $fn=20);

            translate([-1, 0, 0])
            cylinder(d=6.1, h=1, $fn=20);
        }
    }

    difference() {
        union() {
            // body
            hull() {
                translate([0, 30/2 - 2/2, 2/2])
                rotate([0, 90, 0])
                cylinder(d=2, h=300, center=true, $fn=20);

                translate([0, -30/2 + 2/2, 2/2])
                rotate([0, 90, 0])
                cylinder(d=2, h=300, center=true, $fn=20);
            }

            hull() {
                translate([0, 30/2 - 2/2, 2/2])
                rotate([0, 90, 0])
                cylinder(d=2, h=300, center=true, $fn=20);

                translate([0, 43/2, 10])
                rotate([0, 90, 0])
                cylinder(d=1.2, h=300, center=true, $fn=20);
            }

            hull() {
                translate([0, -30/2 + 2/2, 2/2])
                rotate([0, 90, 0])
                cylinder(d=2, h=300, center=true, $fn=20);

                translate([0, -43/2, 10])
                rotate([0, 90, 0])
                cylinder(d=1.2, h=300, center=true, $fn=20);
            }

            translate([-123.5, -8, 0])
            _mount_stud();

            translate([123.5, -8, 0])
            _mount_stud();

            translate([0, 8, 0])
            _mount_stud();
        }

        translate([-123.5, -8, 0])
        cylinder(d=3.6, h=60, center=true, $fn=20);

        translate([123.5, -8, 0])
        cylinder(d=3.6, h=60, center=true, $fn=20);

        translate([0, 8, 0])
        cylinder(d=3.6, h=60, center=true, $fn=20);

        // holes
        for(i = [0:17]) {
            translate([-140 + i*16.5, 9, 0])
            cylinder(d=7, h=10, center=true, $fn=6);
        }

        for(i = [2:15]) {
            translate([-140 + i*16.5, -9, 0])
            cylinder(d=7, h=10, center=true, $fn=6);
        }

        translate([-140, -9, 0])
        cylinder(d=7, h=10, center=true, $fn=6);

        translate([140, -9, 0])
        cylinder(d=7, h=10, center=true, $fn=6);
    }
}