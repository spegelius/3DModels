use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/Bowls/";
spath = str(
    stl_base_path, "Snack Bowl Torx/"
);


//_orig_bowl();

//debug_orig();
//debug_new_torx_bowl();


//new_torx_bowl();
new_torx_bowl(counter_torx=true);


module _orig_bowl() {
    rotate([0, 0, -6.4])
    translate([-9.01, 2.94, 0])
    import(
        str(spath, "Snack_Torx_Bowl.stl"),
        convexity=10
    );

//    %rotate([0, 0, -6.6])
//    cylinder(d=110, h=1, $fn=7);

//    %rotate([0, 0, -6.6])
//    cylinder(d=110, h=1, $fn=170);
}

module debug_orig() {
    intersection() {
        _orig_bowl();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    %cylinder(d=10, h=1);
}

module debug_new_torx_bowl() {
    intersection() {
        new_torx_bowl();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

//    translate([0, 0, 49])
//    cylinder(d=93.6, h=1, $fn=80);

    translate([0, 0, 51.5])
    new_torx_bowl(counter_torx=true);
}

module new_torx_bowl(counter_torx) {
    module _body() {
        union() {
            translate([0, 0, 5])
            _orig_bowl();

            if (counter_torx) {
                translate([0, 0, 5])
                mirror([1, 0, 0])
                _orig_bowl();
            }

            cylinder(d=105, h=5.2);
        }

    }

    difference() {
        union() {
            intersection() {
                _body();

                translate([0, 0, 1])
                chamfered_cylinder(110, 58, 9.5, $fn=100);
            }

            cylinder(d=93.6, h=3, $fn=80);
        }

        translate([0, 0, 53])
        chamfered_cylinder(98.6, 58, 3, $fn=100);

        // bottom inside
        hull() {
            difference() {
                translate([0, 0, 5.9])
                cylinder(d=98, h=0.05, $fn=80);

                _body();
            }

            translate([0, 0, 2.2])
            cylinder(d=87, h=0.1, $fn=80);
        }

        cube_donut(10, 1.6, $fn=80);
        cube_donut(25, 1.6, $fn=80);
        cube_donut(40, 1.6, $fn=80);
        cube_donut(55, 1.6, $fn=80);
        cube_donut(70, 1.6, $fn=80);
        cube_donut(85, 1.6, $fn=80);
    }
}