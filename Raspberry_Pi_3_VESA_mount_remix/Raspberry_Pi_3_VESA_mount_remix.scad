use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Raspberry Pi 3 2 b/"
);


//_orig_vesa_100_bottom();
//_case_bottom();

new_rpi3_bottom_100mm_vesa();


module _orig_vesa_100_bottom() {
    translate([-108.5/2, -108.5/2, 0])
    import(
        str(spath, "rpi3-bottom_100mm-vesa_netfabb.stl"),
        convexity=10
    );

    //%cube([108.5, 108.5, 30], center=true);
}

module _case_bottom() {
    intersection() {
        _orig_vesa_100_bottom();

        union() {
            hull() {
                translate([0, -5, 0])
                cube([62, 91, 30], center=true);

                translate([0, 1, 0])
                cube([53.5, 91, 30], center=true);
            }

            hull() {
                translate([-33, -44.6, 0])
                cylinder(d=8, h=30, center=true, $fn=40);

                translate([33, -44.6, 0])
                cylinder(d=8, h=30, center=true, $fn=40);

                translate([0, -91/2 - 4 + 12/2, 0])
                cube([62, 12, 30], center=true);
            }
        }
    }
}


module new_rpi3_bottom_100mm_vesa() {
//    %translate([-12, -4, 0])
//    _orig_vesa_100_bottom();

    module _vesa_arms() {
        difference() {
            union() {
                hull() {
                    translate([-50 - 12, -50 - 4, 0])
                    cylinder(d=8.5, h=3.5, $fn=50);

                    translate([-62/2 + 8/2, -4, 0])
                    cylinder(d=8, h=3.5, $fn=50);

                    translate([-29, -46, 0])
                    cylinder(d=8, h=3.5, $fn=50);
                }

                hull() {
                    translate([50 - 12, -50 - 4, 0])
                    cylinder(d=8.5, h=3.5, $fn=50);

                    translate([62/2 - 8/2, -32, 0])
                    cylinder(d=8, h=3.5, $fn=50);

                    translate([20, -46, 0])
                    cylinder(d=8, h=3.5, $fn=50);
                }

                hull() {
                    translate([-50 - 12, 50 - 4, 0])
                    cylinder(d=8.5, h=3.5, $fn=50);

                    translate([-25.2, 42, 0])
                    cylinder(d=8, h=3.5, $fn=50);

                    translate([-62/2 + 8/2, -4, 0])
                    cylinder(d=8, h=3.5, $fn=50);
                }

                hull() {
                    translate([50 - 12, 50 - 4, 0])
                    cylinder(d=8.5, h=3.5, $fn=50);

                    translate([25.2, 42, 0])
                    cylinder(d=8, h=3.5, $fn=50);

                    translate([62/2 - 8/2, 22, 0])
                    cylinder(d=8, h=3.5, $fn=50);
                }

                translate([-35, 0, 3.5/2])
                cube([10, 40, 3.5], center=true);
            }

            translate([0, -5, 20/2 + 1])
            cube([59, 89, 20], center=true);

            translate([-42, 33, 0])
            cylinder(d=13, h=30, center=true, $fn=40);

            translate([-45, -42, 0])
            cylinder(d=12, h=30, center=true, $fn=40);            
        }
    }
    
    difference() {
        union() {
            _case_bottom();
            _vesa_arms();
        }

        translate([-50 - 12, -50 - 4, 0])
        cylinder(d=4.5, h=30, center=true, $fn=50);

        translate([-50 - 12, 50 - 4, 0])
        cylinder(d=4.5, h=30, center=true, $fn=50);

        translate([50 - 12, -50 - 4, 0])
        cylinder(d=4.5, h=30, center=true, $fn=50);

        translate([50 - 12, 50 - 4, 0])
        cylinder(d=4.5, h=30, center=true, $fn=50);
    }
}