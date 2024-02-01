use <../Dollo/NEW_long_ties/include.scad>;

stl_path = "../_downloaded/";
vc_path = str(
    stl_path,
    "Voronoi Cat Tea Light/"
);

//_mock_candle();



//debug_candle_adapter_120_percent();

candle_adapter_120_percent();


//%translate([156.5, 29])
//cylinder(d=59.5, h=10, $fn=60);

module _mock_candle() {
    cylinder(d1=38, d2=37.5, h=18);

    for(i = [0:2]) {
        rotate([0, 0, i*120])
        translate([38/2 - 2, 0, 0])
        cylinder(d=2.3, h=4, center=true, $fn=20);
    }

    translate([0, 0, 19])
    cylinder(d=8, h=12, $fn=30);

    translate([0, 0, 19 + 12])
    cylinder(d1=8, d2=1, h=7, $fn=30);
}

module _voronoi_cat() {
    translate([30, 0, 0])
    import(str(vc_path, "HpolyVcat.stl"), convexity=10);
}

module debug_candle_adapter_120_percent() {
    %render()
    intersection() {
        translate([-156.5, -29])
        scale([1.2, 1.2, 1.2])
        _voronoi_cat();

        //cylinder(d=68, h=4);
    }

    candle_adapter_120_percent();
}

module candle_adapter_120_percent() {

    module _spring() {
        intersection() {
            tube(20, 8, 2, $fn=40);

            translate([20/2, -20/2, 0])
            cube([20, 20, 40], center=true);
        }
    }

    difference() {
        union() {
            cylinder(d=59.5, h=10.2, $fn=50);

            rotate([0, 0, -6])
            translate([27, 0, -6])
            rotate([0, 90, 0])
            cylinder(d=15, h=5);

            rotate([0, 0, -182.8])
            translate([26, 0, -4])
            rotate([0, 90, 0])
            cylinder(d=11, h=5);

            rotate([0, 0, 81])
            translate([26, 0, -2])
            rotate([0, 90, 0])
            cylinder(d=8, h=5);

            rotate([0, 0, -97.6])
            translate([26.5, 0, -2.5])
            rotate([0, 90, 0])
            cylinder(d=9, h=5);
        }

        // bottom cut
        translate([0, 0, -20])
        cylinder(d=100, h=20);

        // hole through
        cylinder(d=34, h=30, center=true, $fn=30);

        // inner cut
        translate([0, 0, 2])
        cylinder(d=50, h=30, $fn=30);

        // nodes
        for(i = [0:2]) {
            rotate([0, 0, i*120])
            translate([38/2 - 2, 0, 0])
            cylinder(d=4, h=8, center=true, $fn=20);
        }

        // direction marker
        hull() {
            translate([59.5/2 - 2, 0, 0])
            cylinder(d=0.2, h=1, center=true, $fn=10);

            translate([59.5/2 - 6, 0, 0])
            cube([0.1, 5, 1], center=true);

        }
    }

    // springs added
    for(i = [0:4]) {
        rotate([0, 0, i* 360/5])
        translate([-26.3, 11, 2.2])
        _spring();
    }

    %_mock_candle();
}