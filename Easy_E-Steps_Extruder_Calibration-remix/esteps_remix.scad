

//original();
body();
//text();

module original() {
    import(
        "../_downloaded/Easy E-Steps Extruder Calibration/EASYESTEPSV2_tinkercad.stl",
        convexity=10);
}

module body() {
    difference() {
        original();

        translate([0, 30/2 - 6.775, 10/2 + 1.103])
        cube([200, 30, 10], center=true);
    }
}

module text() {

    translate([0, 0, -0.001])
    intersection() {
        original();

        translate([0, 30/2 - 6.775, 10/2 + 1.104])
        cube([200, 30, 10], center=true);
    }
}