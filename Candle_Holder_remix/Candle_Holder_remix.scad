use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "candle holder2/"
);


//_orig_candle_holder();

new_candle_holder();


module _orig_candle_holder() {
    translate([0, 0, 0])
    import(
        str(spath, "candle holder.stl"),
        convexity=10
    );

    //%cylinder(d=80, h=20);
}

module new_candle_holder() {
    module _holder_additions() {
        union() {
            _orig_candle_holder();
            
            translate([0, 0, 1])
            tube(46, 7, 3, $fn=60);

            rotate([0, 0, 16])
            intersection() {
                _orig_candle_holder();

                for(i = [0:13]) {
                    rotate([0, 0, -15 + i*360/14])
                    translate([0, -41, 3])
                    hull() {
                        cube([6, 4, 1], center=true);

                        translate([6, 0, 7])
                        cube([6, 4, 1], center=true);
                    }
                }
            }

            rotate([0, 0, 8])
            intersection() {
                _orig_candle_holder();

                for(i = [0:13]) {
                    rotate([0, 0, -7 + i*360/14])
                    translate([0, -41, 100 - 9])
                    hull() {
                        cube([6, 5, 1], center=true);

                        translate([6, 0, 7])
                        cube([6, 5, 1], center=true);
                    }
                }
            }

            rotate([0, 0, -16])
            intersection() {
                _orig_candle_holder();

                for(i = [0:13]) {
                    rotate([0, 0, 4 + i*360/14])
                    translate([0, -41, 50 - 3.5])
                    hull() {
                        cube([5, 5, 1], center=true);

                        translate([6.8, 0, 8])
                        cube([5, 5, 1], center=true);
                    }
                }
            }
        }
    }

    difference() {
        intersection() {
            _holder_additions();

            union() {
                difference() {
                    chamfered_cylinder(
                        84.8, 100, 1, $fn=130
                    );

                    cylinder(
                        d=79.5, h=300, center=true, $fn=130
                    );

                    translate([0, 0, 100 - 1])
                    chamfered_cylinder(
                        79.5 + 2, 20, 1, $fn=130
                    );
                }
                cylinder(d=82, h=3);
                cylinder(d=50, h=20);
            }
        }
    }
}