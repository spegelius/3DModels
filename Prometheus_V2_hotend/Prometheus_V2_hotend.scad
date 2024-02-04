
stl_path = "../_downloaded/";


prometheus_v2_heat_sink_4mm();


module prometheus_v2_heat_sink_4mm() {
//    %translate([0, 0, 0])
//    intersection() {
//        scale([10, 10, 10])
//        import(str(
//            stl_path,
//            "Prometheus_Hot_End/",
//            "Aluminium_Heat_Sink_V2_4mm.stl"
//        ), convexity=10);
//
////        translate([0, 50/2, 0])
////        cube([50, 50, 100], center=true);
//    }

    difference() {
        union() {
            // fins
            cylinder(d=30, h=1.5, $fn=80);

            translate([0, 0, 3.5])
            cylinder(d=30, h=1.5, $fn=80);

            translate([0, 0, 7])
            cylinder(d=30, h=1, $fn=80);

            translate([0, 0, 10])
            cylinder(d=30, h=1, $fn=80);

            translate([0, 0, 13])
            cylinder(d=30, h=1, $fn=80);

            translate([0, 0, 16])
            cylinder(d=30, h=1, $fn=80);

            translate([0, 0, 19])
            cylinder(d=28, h=1, $fn=80);

            translate([0, 0, 22])
            cylinder(d=24, h=1, $fn=80);

            translate([0, 0, 25])
            cylinder(d=16, h=1, $fn=80);

            // neck
            translate([0, 0, 30.6])
            cylinder(d=16, h=3.5, $fn=80);

            translate([0, 0, 38.7])
            cylinder(d=16, h=4.8, $fn=80);

            // body
            cylinder(d=12, h=43, $fn=50);

            cylinder(d=14, h=23, $fn=50);

            cylinder(d=15, h=20, $fn=50);
        }

        // side cuts
        translate([0, 10/2 + 8, 0])
        cube([40, 10, 60], center=true);

        translate([0, -10/2 - 8, 0])
        cube([40, 10, 60], center=true);

        // inner holes
        cylinder(d=4, h=100, center=true, $fn=60);

        translate([0, 0, 7.5])
        cylinder(d=4.2, h=100, $fn=70);

        hull() {
            translate([0, 0, 30.8])
            cylinder(d=4.2, h=1, $fn=70);

            translate([0, 0, 32.7])
            cylinder(d=8, h=10, $fn=70);
        }

        translate([0, 0, 40.7])
        cylinder(d=14, h=5, $fn=70);

        hull() {
            translate([0, 0, 43])
            cylinder(d=14, h=1, $fn=70);

            translate([0, 0, 44])
            cylinder(d=16, h=1, $fn=70);
        }

        // fan screw holes
        translate([-10, 0, 2.5])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=50);

        translate([10, 0, 2.5])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=50);

        // heatbreak screw holes
        translate([0, 0, 2.5])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, $fn=50);

        translate([0, 0, 6])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, $fn=50);

    }
}