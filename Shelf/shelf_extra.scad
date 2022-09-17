use <Shelf.scad>;


//debug();

//extra_part(160, 19 + 2, 278);
extra_part(160, 19 + 2, 650/2);


module debug() {
    intersection() {
        extra_part(160, 19 + 2, 278);

        translate([0, 10, 0])
        cube([200, 100, 600]);
    }
}

module extra_part(w, d, h) {

    module _long_screw_hole() {
        rotate([0, 90, 0]) {
            cylinder(d=5.2, h=200, $fn=30);

            translate([0, 0, 90 + 25])
            hull() {
                cylinder(d=5.2, h=100, $fn=30);

                translate([0, 0, (11 - 5.2)/2])
                cylinder(d=11, h=100 - 11 - 5.2, $fn=30);
            }
        }
    }

    module _screw_hole() {
        rotate([-90, 0, 0]) {
            cylinder(d=3.5, h=10, center=true, $fn=30);

            translate([0, 0, -(6.5 - 3.5)/2])
            hull() {
                cylinder(d=3.5, h=10, $fn=30);

                translate([0, 0, (6.5 - 3.5)/2])
                cylinder(d=6.5, h=10, $fn=30);
            }
        }
    }    

    difference() {
        translate([0, d/2, 0])
        union() {
            //_section_form(170, 19 + 2, h);
            _section_shell(w, d, h, wall=1.2);

            translate([(90 + 1.2)/2, 0, h/2])
            cube([90 + 1.2, d, h], center=true);

            intersection() {
                union() {
                    translate([90 + 90/2, -2/2, 25])
                    rotate([45, 0, 0])
                    cube([90, 14, 14], center=true);

                    translate([90 + 90/2, -2/2, h/2])
                    rotate([45, 0, 0])
                    cube([90, 14, 14], center=true);

                    translate([90 + 90/2, -2/2, h - 25])
                    rotate([45, 0, 0])
                    cube([90, 14, 14], center=true);
                }
                _section_form(w, 19 + 2, h);
            }

        }

        translate([0, 0, 0])
        cube([180, 19 * 2, h * 3], center=true);

        translate([0, 19/2, 25])
        _long_screw_hole();

        translate([0, 19/2, h/2])
        _long_screw_hole();

        translate([0, 19/2, h - 25])
        _long_screw_hole();

        translate([15, 19 + 2, 15])
        _screw_hole();

        translate([15, 19 + 2, h/2])
        _screw_hole();

        translate([15, 19 + 2, h - 15])
        _screw_hole();

        translate([75, 19 + 2, h/4])
        _screw_hole();

        translate([75, 19 + 2, h - h/4])
        _screw_hole();
    }
}

