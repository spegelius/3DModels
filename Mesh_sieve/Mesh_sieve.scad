use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Filter Sieve/"
);


//_orig_sieve();
//debug();
//debug_mesh_sieve_seal();


//mesh_sieve();
//mesh_sieve_bottom();
mesh_sieve_seal();


module _orig_sieve() {
    import(
        str(spath, "Sieve.stl"),
        convexity=10
    );
}

module debug() {
    intersection() {
        mesh_sieve();

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }

    %translate([-25, 0, 0])
    _mock_mesh_strip();

    %_mock_mesh_strip();

    %translate([25, 0, 0])
    _mock_mesh_strip();

//    %scale(1.5)
//    _orig_sieve();
}

module debug_mesh_sieve_seal() {
    intersection() {
        union() {
            mesh_sieve_seal();

            translate([0, 0, 17.6])
            rotate([180, 0, 0])
            mesh_sieve_seal();
        }

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }

    %translate([0, 0, 17.6/2])
    rotate([0, 90, 0])
    _mock_mesh_strip();
}

module _mock_mesh_strip() {
    translate([0, 0, 0.09/2])
    cube([13.6, 101.8, 0.09], center=true);
}

module _sieve_form() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 65])
                cylinder(d=176, h=0.1, $fn=80);

                translate([0, 0, 10/2 + 16])
                rounded_cube_side(
                    85, 120, 10, 12, center=true, $fn=30
                );
            }

            translate([0, 0, 16.1/2])
            rounded_cube_side(
                85, 120, 16.1, 12, center=true, $fn=30
            );
        }

        hull() {
            translate([0, 0, 65.1])
            cylinder(d=172, h=0.1, $fn=80);

            translate([0, 0, 16])
            rounded_cube_side(
                80.9, 115.9, 0.1, 7, center=true, $fn=30
            );

            translate([0, 0, 10])
            rounded_cube_side(
                70, 108, 1, 1, center=true, $fn=30
            );
        }
    }
}

module mesh_sieve() {

    difference() {
        _sieve_form();

        translate([-25, 0, 0])
        cube([12, 100, 30], center=true);

        hull() {
            translate([-25, 0, 5])
            cube([12, 100, 1], center=true);

            translate([-25, 0, 10])
            cube([20, 108, 1], center=true);
        }

        translate([25, 0, 0])
        cube([12, 100, 30], center=true);

        hull() {
            translate([25, 0, 5])
            cube([12, 100, 1], center=true);

            translate([25, 0, 10])
            cube([20, 108, 1], center=true);
        }

        translate([0, 0, 0])
        cube([12, 100, 30], center=true);

        hull() {
            translate([0, 0, 5])
            cube([12, 100, 1], center=true);

            translate([0, 0, 10])
            cube([20, 108, 1], center=true);
        }

        translate([-38, 23, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([38, 23, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([-38, -23, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([38, -23, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([13, 55, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([-13, 55, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([12.5, 0, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([-12.5, 0, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([13, -55, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);

        translate([-13, -55, 0])
        cylinder(d=2.8, h=18, center=true, $fn=30);
    }
}

module mesh_sieve_bottom() {
    difference() {
        translate([0, 0, 7/2])
        rounded_cube_side(
            85, 120, 7, 12, center=true, $fn=30
        );

        translate([-25, 0, 0])
        cube([11.6, 99.5, 30], center=true);

        translate([25, 0, 0])
        cube([11.6, 99.5, 30], center=true);

        translate([0, 0, 0])
        cube([11.6, 99.5, 30], center=true);

        translate([-25, 0, 6])
        cube([13.6, 101.8, 0.2], center=true);

        translate([25, 0, 6])
        cube([13.6, 101.8, 0.2], center=true);

        translate([0, 0, 6])
        cube([13.6, 101.8, 0.2], center=true);

        translate([-25, 0, 6 + 4/2])
        rounded_cube_side(
           20, 108, 4, 6, center=true, $fn=30
        );

        translate([0, 0, 6 + 4/2])
        rounded_cube_side(
           20, 108, 4, 6, center=true, $fn=30
        );

        translate([25, 0, 6 + 4/2])
        rounded_cube_side(
           20, 108, 4, 6, center=true, $fn=30
        );

        translate([-38, 23, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-38, 23, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([38, 23, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([38, 23, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([-38, -23, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-38, -23, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([38, -23, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([38, -23, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([13, 55, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([13, 55, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([-13, 55, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-13, 55, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([12.5, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([12.5, 0, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([-12.5, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-12.5, 0, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([13, -55, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([13, -55, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);

        translate([-13, -55, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([-13, -55, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=30);
        
    }
}

module mesh_sieve_seal() {

//    difference() {
//        union() {
//            translate([0, 0, 1.2/2])
//            rounded_cube_side(
//               20, 108, 1.2, 6, center=true, $fn=30
//            );
//
//            translate([0, 0, 1.3/2])
//            cube([13.6, 101.8, 1.3], center=true);
//        }
//        cube([12, 100, 30], center=true);
//    }

    difference() {
        translate([0, 0, 14.6/2])
        cube([4.2, 105.8, 14.6], center=true);

        translate([0, 4, 17.6/2 + 3])
        cube([10, 103.8, 17.6], center=true);

        translate([0, 0, 13.6/2 + 2])
        cube([0.3, 102.2, 13.6], center=true);
    }
}