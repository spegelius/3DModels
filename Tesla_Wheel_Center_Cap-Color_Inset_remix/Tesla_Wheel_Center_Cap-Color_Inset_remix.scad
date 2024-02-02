use <../Dollo/NEW_long_ties/include.scad>;

stl_path = "../_downloaded/Tesla/Tesla Wheel Center Cap - Color Inset/";


//_orig_center_cap_inset();
//_orig_cap_logo_bottom();

//new_center_cap();
new_center_cap(inset=false);
//new_cap_logo_bottom();


module _orig_center_cap_inset() {
    import(str(
        stl_path, "center_cap_inset.stl"
    ), convexity=10);
}

module _orig_cap_logo_bottom() {
    import(str(
        stl_path, "cap_logo_bottom.stl"
    ), convexity=10);
}

module new_center_cap(inset=true) {
    intersection() {
        difference() {
            union() {
                translate([0, 0, 0.2])
                _orig_center_cap_inset();

                // new bottom
                cylinder(
                    d1=56, d2=58.2,
                    h=1.41, $fn=100
                );

                translate([0, 0, 1.4])
                cylinder(d=58.2, h=2.8, $fn=100);

                // claw body side extensions
                difference() {
                    translate([0, 0, 4])
                    tube(51, 17.2, 3, $fn=110);

                    for(i = [0:3]) {
                        rotate([0, 0, -4 + i*90])
                        hull() {
                            translate([1/2, -49/2, 18/2 + 4])
                            cube([2, 10, 18], center=true);

                            rotate([0, 0, 55])
                            translate([0, -49/2, 18 + 4])
                            cube([1, 10, 1], center=true);
                        }
                    }
                }
            }

            // claw chamfers
            for(i = [0:3]) {
                rotate([0, 0, i * 90])
                translate([27, 0, 10/2 + 12])
                rotate([0, 0, -55])
                cube([10, 5, 10], center=true);

                rotate([0, 0, i * 90])
                translate([19.54, -16.4, 10/2 + 12])
                rotate([0, 0, 45])
                translate([10/2, -5/2, 0])
                cube([10, 5, 10], center=true);
            }

            // claw shaping
            difference() {
                translate([0, 0, 14])
                cylinder(d=65, h=10);

                for (i = [0:3]) {
                    rotate([0, 0, i * 90 -22.5])
                    translate([3, 0, 10])
                    intersection() {
                        cylinder(
                            d=48.6, h=15, $fn=120
                        );

                        translate([40/2, 0, 0])
                        cube([
                            40, 50, 40
                        ], center=true);
                    }
                }
            }

            // center cutout
            translate([0, 0, 1.8])
            chamfered_cylinder(39.8, 20, 3, $fn=80);

            translate([0, 0, 4.2])
            cylinder(d=51 - 6, h=20, $fn=110);

            // logo cutout
            if (inset) {
                new_cap_logo_bottom();
            }

            // claw bottom cuts
            for (i = [0:1]) {
                rotate([0, 0, -25 + i*90])
                translate([0, 0, 4.2 + 0.2/2])
                cube([18, 60, 0.2], center=true);
            }
        }

        // claw top shaping
        hull() {
            cylinder(d=50, h=21.2, $fn=120);
            cylinder(d=60, h=12, $fn=120);
        }
    }
}

module new_cap_logo_bottom() {
    scale([1, 1, 2])
    _orig_cap_logo_bottom();
}