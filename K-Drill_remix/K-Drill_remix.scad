use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "K-Drill/"
);


//k_drill_4_5_mm();
//k_drill_4_mm();
k_drill_8_mm();


module _orig_k_drill() {
    translate([0, 25, 8])
    import(
        str(spath, "k-drill.stl"),
        convexity=10
    );
}

module _k_drill_body() {
    intersection() {
        difference() {
            union() {
                _orig_k_drill();

                translate([0, 0, 1])
                cylinder(d=6, h=19);
            }

            hull() {
                translate([0, 0, 4])
                rotate([0, 90, 0])
                cylinder(d=3.11, h=50, center=true, $fn=80);

                translate([0, 0, 4 - 1/2 + 3.11/2 + 0.1])
                cube([50, 1, 1], center=true);
            }
        }

        _rounded_body();
    }
}

module _rounded_body() {
    hull() {
        translate([14.4, 3.5, 1.9])
        sphere(d=5, $fn=40);

        translate([14.4, 3.5, 20 - 1.9])
        sphere(d=5, $fn=40);

        translate([14.4, -3.5, 1.9])
        sphere(d=5, $fn=40);

        translate([14.4, -3.5, 20 - 1.9])
        sphere(d=5, $fn=40);

        translate([0, 6.7, 1.9])
        sphere(d=5, $fn=40);
        
        translate([0, 6.7, 20 - 1.9])
        sphere(d=5, $fn=40);

        translate([0, -6.7, 1.9])
        sphere(d=5, $fn=40);
        
        translate([0, -6.7, 20 - 1.9])
        sphere(d=5, $fn=40);

        translate([-14.4, 3.5, 1.9])
        sphere(d=5, $fn=40);

        translate([-14.4, 3.5, 20 - 1.9])
        sphere(d=5, $fn=40);

        translate([-14.4, -3.5, 1.9])
        sphere(d=5, $fn=40);

        translate([-14.4, -3.5, 20 - 1.9])
        sphere(d=5, $fn=40);
    }
}

module k_drill_4_5_mm() {
    difference() {
        _k_drill_body();

        translate([0, 0, 1])
        cylinder(d=4.65, h=40, $fn=40);

        rotate([0, 0, 13])
        translate([-1.2, -8.6, 6])
        rotate([90, 0, 0])
        linear_extrude(1)
        text(text="4.5", size=8);

        rotate([0, 0, 13 + 180])
        translate([-1.2, -8.6, 6])
        rotate([90, 0, 0])
        linear_extrude(1)
        text(text="4.5", size=8);

    }
}

module k_drill_4_mm() {
    difference() {
        _k_drill_body();

        translate([0, 0, 1])
        cylinder(d=4.15, h=40, $fn=40);

        rotate([0, 0, 13])
        translate([3, -8.6, 5])
        rotate([90, 0, 0])
        linear_extrude(1)
        text(text="4", size=10);

        rotate([0, 0, 13 + 180])
        translate([3, -8.6, 5])
        rotate([90, 0, 0])
        linear_extrude(1)
        text(text="4", size=10);

    }
}

module k_drill_8_mm() {
    difference() {
        _k_drill_body();

        translate([0, 0, 1])
        cylinder(d=8.15, h=40, $fn=40);

        rotate([0, 0, 13])
        translate([3, -8.6, 5])
        rotate([90, 0, 0])
        linear_extrude(1)
        text(text="8", size=10);

        rotate([0, 0, 13 + 180])
        translate([3, -8.6, 5])
        rotate([90, 0, 0])
        linear_extrude(1)
        text(text="8", size=10);
    }
}