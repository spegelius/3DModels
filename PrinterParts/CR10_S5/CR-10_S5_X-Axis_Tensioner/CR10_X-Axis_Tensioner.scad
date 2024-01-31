use <../../../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../../../_downloaded/";

t_stl_path = str(
    stl_base_path,
    "CR-10 S5/CR10 X-Axis tensioner/"
);


//_mockup();


//cr10_x_tensioner();
cr10_x_tensioner_puller();


module _orig_1() {
    fname = "X_ULK-Halter.stl";

    translate([-208.4, 10, 131.3])
    rotate([90, 0, 0])
    import(
        str(t_stl_path, fname),
        convexity=10
    );


}

module _mock_bearing() {
    difference() {
        union() {
            cylinder(d=16, h=10, center=true, $fn=30);

            translate([0, 0, -10/2 + 1/2])
            cylinder(d=18, h=1, center=true, $fn=30);

            translate([0, 0, 10/2 - 1/2])
            cylinder(d=18, h=1, center=true, $fn=30);

        }

        cylinder(d=8, h=20, center=true, $fn=30);
    }
}

module _mockup() {
    cube([100, 20, 20], center=true);

    translate([100/2 + 10, 0, -1])
    rotate([90, 0, 0])
    _mock_bearing();

    translate([45, -15, 0])
    rotate([-90, 0, 0])
    cr10_x_tensioner();

    translate([76, 0, -1])
    rotate([90, 0, -90])
    cr10_x_tensioner_puller();

    //%_orig_1();

    %translate([45, 20, 71/2])
    rotate([90, 0, 0])
    cylinder(d=5, h=40, $fn=30);

    %translate([45, 20, -71/2])
    rotate([90, 0, 0])
    cylinder(d=5, h=40, $fn=30);
}

module cr10_x_tensioner() {
    difference() {
        hull() {
            translate([0, 71/2, 0])
            cylinder(d=13, h=25, $fn=40);

            translate([0, -71/2, 0])
            cylinder(d=13, h=25, $fn=40);

            translate([36, 14, 0])
            cylinder(d=12, h=25, $fn=40);

            translate([36, -14, 0])
            cylinder(d=12, h=25, $fn=40);
        }

        // mount screw holes
        translate([0, 71/2, 22.75])
        cylinder(d=5.5, h=10, $fn=40);

        translate([0, 71/2, 0])
        cylinder(d=10, h=45, center=true, $fn=40);

        translate([0, -71/2, 22.75])
        cylinder(d=5.5, h=10, $fn=40);

        translate([0, -71/2, 0])
        cylinder(d=10, h=45, center=true, $fn=40);

        translate([0, 0, 2.25])
        cylinder(d=4.4, h=20, $fn=30);

        cylinder(d=9.4, h=4, center=true, $fn=30);

        hull() {
            translate([13, 1, 0])
            cylinder(d=15, h=20, center=true);

            translate([23, 1, 0])
            cylinder(d=15, h=20, center=true);

        }

        // main hole
        translate([-4, 0, 20/2 + 5])
        cube([19, 20.2, 20.2], center=true);

        translate([0, 0, 20/2 + 5])
        chamfered_cube(
            72, 20.2, 20.2, 3, center=true
        );

        translate([10, 1, 5 + 20/2])
        chamfered_cube(
            54, 22.2, 20.2, 2, center=true
        );

        // puller screw hole
        translate([30, 0, 5 + 20/2])
        rotate([0, 90, 0])
        cylinder(d=5.4, h=30, center=true, $fn=30);

        // chamfers
        translate([0, -44, 0])
        rotate([40, 0, 20])
        cube([180, 30, 50], center=true);

        mirror([0, 1, 0])
        translate([0, -44, 0])
        rotate([40, 0, 20])
        cube([180, 30, 50], center=true);

        translate([54, 0, 0])
        rotate([0, 40, 0])
        cube([30, 70, 50], center=true);
    }
}

module cr10_x_tensioner_puller() {
    difference() {
        intersection() {
            translate([0, 0, 27/2])
            chamfered_cube(
                19.8, 21.8, 27, 1.9, center=true
            );

            translate([0, 0, -5])
            rotate([0, 90, 0])
            cylinder(d=60, h=25, center=true, $fn=60);
        }

        // puller screw hole and nut
        cylinder(d=5.4, h=60, center=true, $fn=40);

        translate([0, 0, 3.6])
        M5_nut(6);

        // bearing bolt hole
        translate([0, 0, 16])
        rotate([0, 90, 0])
        cylinder(d=8.2, h=40, center=true, $fn=50);

        // bearing bolt indents
        translate([-19.8/2, 0, 16])
        rotate([0, 90, 0])
        cylinder(d=15, h=3, center=true, $fn=50);

        translate([19.8/2, 0, 16])
        rotate([0, 90, 0])
        cylinder(d=15, h=3, center=true, $fn=50);

        // bearing hole
        difference() {
            hull() {
                translate([0, 0, 16])
                rotate([0, 90, 0])
                cylinder(d=19, h=10.7, center=true, $fn=50);

                translate([0, 0, 26])
                rotate([0, 90, 0])
                cylinder(d=23, h=10.7, center=true, $fn=50);
            }

            translate([-12/2, 0, 16])
            rotate([0, 90, 0])
            cylinder(d=12, h=1.8, center=true, $fn=30);

            translate([12/2, 0, 16])
            rotate([0, 90, 0])
            cylinder(d=12, h=1.8, center=true, $fn=30);
        }

        translate([0, 18, 24])
        cube([10.7, 20, 10], center=true);

        translate([0, -18, 24])
        cube([10.7, 20, 10], center=true);

    }

    %translate([0, 0, 16])
    rotate([0, 90, 0])
    _mock_bearing();
}
