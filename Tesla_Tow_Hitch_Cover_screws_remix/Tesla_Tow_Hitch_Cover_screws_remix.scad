use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Tesla/Tesla Tow Hitch Cover screws/"
);


//_orig_screw();
debug_connector();

//new_screw();
//screw_soluble_supports();
//screw_nonsoluble_supports();


module _orig_screw() {
    translate([0, 0, 9])
    import(
        str(spath, "teslaplug.stl"),
        convexity=10
    );
}

module debug_connector() {
    intersection() {
        screw_connector();

        translate([0, 30/2, 0])
        cube([50, 30, 50], center=true);
    }

    translate([0, 9.3, -0.8])
    rotate([90, 0, 0])
    new_screw();
}

module new_screw() {
    translate([0, 0, 0.4])
    intersection() {
        _orig_screw();

        translate([0, -5.01, 18/2])
        rotate([-90, 0, 0])
        difference() {
            chamfered_cylinder(18.2, 30, 0.8, $fn=40);

            cylinder(d=0.2, h=31, center=true);

            cube([2, 10, 3], center=true);
        }
    }
}

module _screw_supports_form() {
    difference() {
        union() {
            translate([0, -1.9, 9/2])
            cube([20, 6, 9], center=true);

            translate([0, 0, 1/2])
            cube([6, 6, 1], center=true);

            translate([0, 21/2 + 1.4, 8/2])
            cube([9, 21, 8], center=true);

            translate([0, 17.7, 8.4/2])
            cube([9, 10, 8.4], center=true);

            hull() {
                translate([0, 0, 0.2/2])
                cube([20, 7, 0.2], center=true);

                translate([0, 23, 0.2/2])
                cube([10, 1, 0.2], center=true);
            }
        }

        translate([0, 0, 0.4])
        _orig_screw();

        translate([0, 0.9, 18.4/2 + 0.1])
        rotate([90, 0, 0])
        cylinder(d=15, h=0.5, center=true, $fn=84);
    }
}

module screw_soluble_supports() {
    difference() {
        _screw_supports_form();
        screw_nonsoluble_supports();
    }
}

module screw_nonsoluble_supports() {
    %_screw_supports_form();

    intersection() {
        _screw_supports_form();

        difference() {
            union() {
                translate([0, 24/2 + 1.3, 6/2])
                cube([22, 24, 6], center=true);

                translate([0, -10/2 + 1.3, 0.2/2])
                cube([22, 10, 0.2], center=true);
            }

            translate([0, 0, 6])
            cube([6, 60, 2], center=true);

            translate([0, -10/2 + 1.3, 0])
            cube([13, 10, 2], center=true);
        }
    }
}

module screw_connector() {
    difference() {
        translate([0, 0, 20/2])
        cube([20, 20, 20], center=true);

        difference() {
            union() {
                cylinder(d=7.2, h=50, center=true, $fn=30);

                translate([0, 0, 20/2 + 5])
                cube([7.2, 22, 20], center=true);
            }

            translate([-4.1, 0, 12.3])
            scale([1, 1, 1.7])
            rotate([0, 49, 0])
            cube([4, 30, 4], center=true);

            translate([4.1, 0, 12.3])
            scale([1, 1, 1.7])
            rotate([0, 41, 0])
            cube([4, 30, 4], center=true);
        }

        translate([10/2 + 5.1, 0, 20/2 + 5])
        cube([10, 30, 20], center=true);

        translate([-10/2 - 5.1, 0, 20/2 + 5])
        cube([10, 30, 20], center=true);
        
        translate([-5.7, 0, 12.3])
        scale([1, 1, 1.7])
        rotate([0, 49, 0])
        cube([4, 30, 4], center=true);

        translate([5.7, 0, 12.3])
        scale([1, 1, 1.7])
        rotate([0, 41, 0])
        cube([4, 30, 4], center=true);

    }
}