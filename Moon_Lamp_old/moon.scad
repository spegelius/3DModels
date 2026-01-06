use <../Dollo/NEW_long_ties/include.scad>;
use <../lib/includes.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Moon_lamp/"
);

screw_d = 119;



debug();

//moon_support();

//bottom_thread();

//scaling = 1/0.8;
//scale(scaling) bottom_thread();


//to_the_moon();
//moon_stand();

//difference() {
//    v_screw(h=5, screw_d=106.5, pitch=3, direction=0, steps=100);
//    cylinder(d=100,h=10,$fn=100);
//}



module _orig_moon_lamp() {
    import(
        str(spath, "moon_lamp_10_inches_refinement_level_360.stl"),
        convexity=10
    );
}

module debug() {
    intersection() {
        translate([0, 0, 10]) {
            //to_the_moon(true);
            to_the_moon(false);
        }
        translate([0, 250/2, 250/2])
        cube([250, 250, 250], center=true);
    }
    moon_support();
}

module to_the_moon(debug=false) {
    difference() {
        union() {
            intersection() {
                if (debug) {
                    translate([0, 0, 250/2 - 25])
                    difference() {
                        sphere(d=245, $fn=100);
                        sphere(d=240, $fn=100);
                    }
                } else {
                    translate([0, 0, 250/2 - 25])
                    _orig_moon_lamp();
                }
                translate([0, 0, 254/2])
                cube([254, 254, 254], center=true);
            }
            cylinder(d=138, h=10, $fn=80);
        }
        cylinder(d=134, h=25, $fn=80, center=true);
        cube([138.1, 5, 25], center=true);

        translate([0, 0, 7+ 5/2])
        rotate([0, 0, 6])
        cube([139, 10, 5], center=true);
    }
}

module moon_support() {
    union() {
        difference() {
            cylinder(d1=80, d2=159, h=190);
            cylinder(d1=78.8, d2=157.8, h=190);
        }
        difference() {
            cylinder(d=90, h=0.2);
            cylinder(d=79, h=0.2);
        }
        translate([0, 0, 190])
        difference() {
            cylinder(d=159, h=3);
            cylinder(d1=157.8, d2=157.8 - 4, h=2.4);
        }
    }
}

module bottom_thread() {
    difference() {
        cylinder(d1=screw_d + 10, d2=screw_d + 30, h=10, $fn=100);

        translate([0, 0, -1])
        v_screw(
            h=13, screw_d=screw_d, pitch=3, direction=0, steps=200
        );
    }
}

module moon_stand(){
    outer_d = screw_d + 30;
    difference() {
        union() {
            cylinder(d1=outer_d, d2=outer_d - 20, h=15, $fn=100);

            translate([0, 0, 14.99])
            v_screw(
                h=10.02, screw_d=screw_d - 0.6,
                pitch=3, direction=0, steps=200
            );
        }
        //cylinder(d=15, h=25, $fn=30);

        translate([0, 0, -0.1])
        difference() {
            cylinder(
                 d1=outer_d - 4, d2=outer_d - 24,h=13.6, $fn=100
            );
            cylinder(d=80, h=28, center=true, $fn=100);
        }

        difference() {
            cylinder(d=76, h=27, center=true, $fn=100);
            cylinder(d=40, h=27, center=true, $fn=100);
        }

        cylinder(d=36, h=27, center=true, $fn=100);

        translate([0, 0, 15])
        cylinder(d=100, h=11, $fn=100);

        translate([0, 0, 13.7])
        cylinder(d=20, h=11, $fn=100);

        translate([0, 0, 8])
        rotate([95, 0, 0])
        cylinder(d=6, h=100, $fn=20);
    }

    translate([0, 0, 13.6])
    g9_lamp_socket(h=41);
}
