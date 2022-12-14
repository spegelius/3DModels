use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Happy chunky bum sitting pot/"
);


//debug();

//christmas_hat_white();
christmas_hat_red();


module debug() {

    //pot();

    translate([0, 1.4, 64])
    christmas_hat_white();

    intersection() {
        translate([0, 1.4, 64])
        christmas_hat_red();

        translate([0, 100/2 + 1.4, 0])
        cube([200, 100, 400], center=true);
    }
}

module pot() {
    import(str(
        spath, "Chunky sitting pot.stl"
    ), convexity=10);
}

module christmas_hat_white() {
    color("white")
    difference() {
        rounded_cylinder(70, 12, 7, $fn=80);

        translate([0, 0, -0.1])
        hull() {
            intersection() {
                scale([1.01, 1.01, 1])
                translate([0, -1.4, -62.9])
                pot();

                cylinder(d=80, h=10);
            }

            translate([0, -1, 0])
            cylinder(d=30, h=18, $fn=40);
        }

        cylinder(d1=58, d2=60.6, h=12, $fn=80);

        translate([0, 0, 11.8])
        cylinder(d=63, h=10, $fn=80);
    }

    color("white")
    difference() {
        translate([0, 0, 76.5])
        sphere(d=22, $fn=40);

        christmas_hat_red();

        translate([0, 0, 64])
        cylinder(d=8, h=2);
    }
}

module christmas_hat_red() {
    color("red")
    translate([0, 0, 11.8])
    difference() {
        hull() {
            cylinder(d=63, h=0.2, $fn=80);

            translate([0, 0, 54.8])
            cylinder(d=9.4, h=0.1, $fn=80);
        }

        intersection() {
            hull() {
                translate([0, 0, -1])
                cylinder(d=60.6, h=1.2, $fn=80);

                translate([0, 0, 54.8])
                cylinder(d=7, h=0.1, $fn=80);
            }

            cylinder(d=100, h=53.8);
        }
    }
}