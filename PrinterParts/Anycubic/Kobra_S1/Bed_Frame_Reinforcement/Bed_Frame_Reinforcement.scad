use <../../../../Dollo/NEW_long_ties/include.scad>;
use <../../common.scad>;


stl_base_path = "../../../../_downloaded/Anycubic/";
spath = str(
    stl_base_path, "Kobra S1/After Market Bed FRAME/"
);


//_orig_frame();

//debug();


frame_reinforcement();


module _orig_frame() {
    translate([-170, -155])
    import(
        str(spath, "ac_ks1_bed_frame_v3-v1.stl"),
        convexity=10
    );
}

module debug() {
    %render()
    translate([0, 0, 15])
    kobra_s1_bed_frame();

//    %render()
//    translate([0, 0, 15])
//    kobra_s1_bed();

    render()
    frame_reinforcement();
}

module _hex_pattern() {
    step = 25;
    hc = 25.8;

    rotate([0, 0, -30])
    for(j = [0:20]) {
        translate([0, j*step, 0])
        rotate([0, 0, -60])
        for (i = [0:49]) {
            translate([0, i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );

            translate([0, -i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );
        }

        translate([0, -j*step, 0])
        rotate([0, 0, -60])
        for (i = [0:49]) {
            translate([0, i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );

            translate([0, -i*step, 0])
            cylinder(
                d=hc, h=60,
                center=true, $fn=6
            );
        }
    }
}

module frame_reinforcement() {

    h = 15;

    module _main_form() {
        difference() {
            union() {
                hull() {
                    translate([-125, -115, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([125, -115, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([-125, -87, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([125, -87, 0])
                    cylinder(d=10, h=h, $fn=30);


                    translate([-108, 95, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([108, 95, 0])
                    cylinder(d=10, h=h, $fn=30);
                }

                hull() {
                    translate([15, 110, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([-15, 110, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([28, 95, 0])
                    cylinder(d=10, h=h, $fn=30);

                    translate([-28, 95, 0])
                    cylinder(d=10, h=h, $fn=30);
                }
            }

            // frame holes
            translate([-170/2, 170/2, h - 3])
            cylinder(d=7, h=100, $fn=30);

            translate([-170/2, -170/2, h - 3])
            cylinder(d=7, h=100, $fn=30);

            translate([170/2, 170/2, h - 3])
            cylinder(d=7, h=100, $fn=30);

            translate([170/2, -170/2, h - 3])
            cylinder(d=7, h=100, $fn=30);
        }
    }

    difference() {
        _main_form();

        intersection() {
            difference() {
                translate([0, 0, -10])
                linear_extrude(40)
                offset(-3.7)
                projection(cut=true)
                _main_form();

                translate([-170/2, 170/2, 0])
                cylinder(d=10, h=h, $fn=30);

                translate([-170/2, -170/2, 0])
                cylinder(d=10, h=h, $fn=30);

                translate([170/2, 170/2, 0])
                cylinder(d=10, h=h, $fn=30);

                translate([170/2, -170/2, 0])
                cylinder(d=10, h=h, $fn=30);

                translate([0, 100, 0])
                cube([300, 40, 10], center=true);

                translate([0, -110, 0])
                cube([300, 40, 10], center=true);

                translate([85, 0, 0])
                cube([20, 300, 10], center=true);

                translate([-85, 0, 0])
                cube([20, 300, 10], center=true);

                // frame mount holes
                translate([0, 265/2 - 14.5, 0])
                cylinder(d=12, h=100, $fn=30);

                translate([-17/2, 265/2 - 34, 0])
                cylinder(d=12, h=100, center=true, $fn=30);

                translate([17/2, 265/2 - 34, 0])
                cylinder(d=12, h=100, center=true, $fn=30);

                translate([0, 264/2 - 60, 0])
                cylinder(d=12, h=100, center=true, $fn=30);

                translate([-122, -104, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([122, -104, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([-62, -97, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([62, -97, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([0, -102, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([-87, -55, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([-87, 0, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([-87, 50, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                hull() {
                    translate([-95, 85, 0])
                    cylinder(d=6.5, h=100, center=true, $fn=20);

                    translate([-90, 85, 0])
                    cylinder(d=6.5, h=100, center=true, $fn=20);
                }

                translate([87, -55, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([87, 0, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([87, 50, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                hull() {
                    translate([95, 85, 0])
                    cylinder(d=6.5, h=100, center=true, $fn=20);

                    translate([90, 85, 0])
                    cylinder(d=6.5, h=100, center=true, $fn=20);
                }

                translate([38, 80, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([-38, 80, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);

                translate([0, 110, 0])
                cylinder(d=6.5, h=100, center=true, $fn=20);
            }

            _hex_pattern();
        }

        // frame holes
        translate([-170/2, 170/2, -1])
        cylinder(d=5, h=100, $fn=30);

        translate([-170/2, -170/2, -1])
        cylinder(d=5, h=100, $fn=30);

        translate([170/2, 170/2, -1])
        cylinder(d=5, h=100, $fn=30);

        translate([170/2, -170/2, -1])
        cylinder(d=5, h=100, $fn=30);

            // frame mount holes
        translate([0, 265/2 - 14.5, 0])
        cylinder(d=7, h=100, $fn=30);

        translate([-17/2, 265/2 - 34, 0])
        cylinder(d=7, h=100, center=true, $fn=30);

        translate([17/2, 265/2 - 34, 0])
        cylinder(d=7, h=100, center=true, $fn=30);

        translate([0, 264/2 - 60, 0])
        cylinder(d=7, h=100, center=true, $fn=30);

        translate([-122, -104, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([122, -104, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([-62, -97, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([62, -97, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([0, -102, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([-87, -55, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([-87, 0, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([-87, 50, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([-95, 85, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([87, -55, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([87, 0, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([87, 50, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([95, 85, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([38, 80, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([-38, 80, 0])
        cylinder(d=2, h=100, center=true, $fn=20);

        translate([0, 110, 0])
        cylinder(d=2, h=100, center=true, $fn=20);
    }

    
}