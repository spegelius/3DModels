stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Impossible_polygon_with_ball/"
);


//_orig_polygon_and_ball();


polygon_only(side_supports=true);
//ball_only();
//supports_soluble();
//supports_nonsoluble();

module _orig_polygon_and_ball() {
    translate([-30.06, -30.06, -0.097])
    import(
        str(spath, "one octahedron w ball.STL"),
        convexity=10
    );
}

module polygon_only(side_supports=false) {

    difference() {
        _orig_polygon_and_ball();

        translate([0, 0, 28.4])
        sphere(d=42, $fn=80);
    }
    
    if (side_supports) {
        for (i=[0:3]) {
            rotate([0, 0, 45 + i*90])
            hull() {
                translate([0, 15/2 + 14.1, 0.1/2])
                cube([0.5, 15, 0.1], center=true);

                translate([0, 29, 14.5])
                cube([0.5, 1, 0.1], center=true);
            }
        }
    }
}

module ball_only() {
    hull()
    intersection() {
        _orig_polygon_and_ball();

        translate([0, 0, 28.4])
        sphere(d=42, $fn=80);
    }
}

module supports_soluble() {
    color("lightgrey")
    difference() {
        union() {
            translate([0, 0, 5])
            cylinder(d1=24, d2=35, h=10, $fn=30);

            translate([0, 0, 45])
            cylinder(d=23, h=4.8, $fn=30);

            for (i=[0:3]) {
                rotate([0, 0, i*90])
                hull() {
                    translate([0, 27, 24.3])
                    cube([14.3, 3, 0.2], center=true);

                    translate([0, 27, 22.7])
                    cube([13, 1, 1], center=true);

                }
            }
        }

        polygon_only(side_supports=true);

        ball_only();

        translate([0, 0, 40])
        cylinder(d=15, h=20, center=true);

    }
}

module supports_nonsoluble() {
    difference() {
        translate([0, 0, 5/2])
        cube([9.5, 9.5, 5], center=true);

        for (i=[0:3]) {
            rotate([0, 0, i*90])
            translate([4/2 + 0.5/2, 4/2 + 0.5/2, 0])
            cube([4, 4, 8], center=true);
        }
    }

    for (i=[0:3]) {
        rotate([0, 0, i*90])
        difference() {
            translate([0, 27, 23.4/2])
            cube([15, 4, 23.4], center=true);

            translate([0, 27, 0])
            cube([14, 3, 43], center=true);

            hull() {
                translate([0, 27, 24.3])
                cube([14.3, 3, 0.2], center=true);

                translate([0, 27, 22.7])
                cube([13, 1, 1], center=true);
            }
        }
    }
}