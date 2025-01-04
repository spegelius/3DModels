use <../Dollo/NEW_long_ties/include.scad>;


routapiikki();


module _routapiikki_base() {
    difference() {
        intersection() {
            hull() {
                translate([-20, 25, 0])
                scale([1, 1, 0.5])
                sphere(d=15, $fn=60);

                translate([20, 25, 0])
                scale([1, 1, 0.5])
                sphere(d=15, $fn=60);

                translate([-20, -25, 0])
                scale([1, 1, 0.5])
                sphere(d=15, $fn=60);

                translate([20, -25, 0])
                scale([1, 1, 0.5])
                sphere(d=15, $fn=60);
            }
            cube([100, 100, 4], center=true);
        }

        translate([0, -65/2, 0])
        difference() {
            union() {
                cube([19, 40, 5], center=true);
                cube([30, 15, 5], center=true);
            }
        
            translate([1, 10, 0])
            rotate([0, 0, 45])
            donut(20, 15/2, angle=90, $fn=60);

            translate([-1, 10, 0])
            rotate([0, 0, 135])
            donut(20, 15/2, angle=90, $fn=60);

            translate([11 + 15/2, 10, 0])
            rotate([0, 0, -135])
            donut(15, 15/2, angle=90, $fn=60);

            translate([-11 - 15/2, 10, 0])
            rotate([0, 0, 315])
            donut(15, 15/2, angle=90, $fn=60);

            translate([0, 10 + 20/2, 0])
            rotate([0, 90, 0])
            cylinder(d=15/2, h=2, center=true, $fn=60);
        }

        mirror([0, 1, 0])
        translate([0, -65/2, 0])
        difference() {
            union() {
                cube([19, 40, 5], center=true);
                cube([30, 15, 5], center=true);
            }
        
            translate([1, 10, 0])
            rotate([0, 0, 45])
            donut(20, 15/2, angle=90, $fn=60);

            translate([-1, 10, 0])
            rotate([0, 0, 135])
            donut(20, 15/2, angle=90, $fn=60);

            translate([11 + 15/2, 10, 0])
            rotate([0, 0, -135])
            donut(15, 15/2, angle=90, $fn=60);

            translate([-11 - 15/2, 10, 0])
            rotate([0, 0, 315])
            donut(15, 15/2, angle=90, $fn=60);

            translate([0, 10 + 20/2, 0])
            rotate([0, 90, 0])
            cylinder(d=15/2, h=2, center=true, $fn=60);
        }

        translate([-20, 0, 0])
        difference() {
            cube([5, 20, 5], center=true);

            translate([0, 7, 0])
            rotate([0, 0, 90])
            donut(13, 10, angle=180, $fn=60);

            translate([0, -7, 0])
            rotate([0, 0, -90])
            donut(13, 10, angle=180, $fn=60);

            translate([-13/2, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=10, h=14, center=true, $fn=60);

            translate([13/2, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=10, h=14, center=true, $fn=60);
        }

        translate([20, 0, 0])
        difference() {
            cube([5, 20, 5], center=true);

            translate([0, 7, 0])
            rotate([0, 0, 90])
            donut(13, 10, angle=180, $fn=60);

            translate([0, -7, 0])
            rotate([0, 0, -90])
            donut(13, 10, angle=180, $fn=60);

            translate([-13/2, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=10, h=14, center=true, $fn=60);

            translate([13/2, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=10, h=14, center=true, $fn=60);
        }
    }
}

module _routapiikki() {
    difference() {
        intersection() {
            translate([0, -73, -20])
            rotate([0, 90, 0])
            cylinder(d=180, h=10, center=true, $fn=100);

            union() {
                hull() {
                    cube([9, 40, 1], center=true);

                    translate([0, -20, 35])
                    rotate([35, 0, 0])
                    cube([9, 40, 1], center=true);
                }

                translate([0, -14.4, 39])
                rotate([0, 90, 0])
                chamfered_cylinder(
                    17.8, 10, 2, center=true, $fn=50
                );

                hull() {
                    translate([0, -20, 37])
                    rotate([35, 0, 0])
                    cube([10, 40, 1], center=true);

                    translate([0, -30, 61])
                    //rotate([35, 0, 0])
                    cube([10, 40, 1], center=true);
                }
            }
        }

        translate([0, -103, -0])
        rotate([0, 90, 0])
        cylinder(d=180, h=12, center=true, $fn=100);

        translate([5, -14.4, 39])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=4, center=true, $fn=30);

        translate([-5, -14.4, 39])
        rotate([0, 90, 0])
        cylinder(d=3.5, h=4, center=true, $fn=30);

        translate([5, -18.7, 45])
        rotate([0, 90, 0])
        cylinder(d=3, h=4, center=true, $fn=30);

        translate([-5, -18.7, 45])
        rotate([0, 90, 0])
        cylinder(d=3, h=4, center=true, $fn=30);

        translate([-5.5, -27, 53])
        rotate([20, 0, 0])
        chamfered_cube(2, 10, 1, 0.4, center=true);

        translate([5.5, -27, 53])
        rotate([20, 0, 0])
        chamfered_cube(2, 10, 1, 0.4, center=true);
    }
}

module routapiikki() {
    union() {
        _routapiikki_base();

        _routapiikki();
    }
}