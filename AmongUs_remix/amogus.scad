use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Among Us/"
);


//_orig_body();

//mockup();
body();
//rim();
//visor();

module _orig_body() {
//    translate([-160.8, -142.76, 0])
//    import(
//        str(spath, "amongusBody_meshmixer2.STL"),
//        convexity=10
//    );

    translate([-160.8, -142.76, 0])
    import(
        str(spath, "amongusBody_meshmixer2_simplify1.stl"),
        convexity=10
    );

//    %translate([-160.8, -142.76, 0])
//    import(
//        str(spath, "amongusBody.STL"),
//        convexity=10
//    );

//    import(
//        str(spath, "amongusBody_tinkercad.STL"),
//        convexity=10
//    );

//    union() {
//        translate([-165.34, 160.27, 28.86])
//        rotate([180, 0, 0])
//        import(
//            str(spath, "bodyLow.stl"),
//            convexity=10
//        );
//
//        translate([-161.443, -181.87, 28.8])
//        rotate([0, 0, 0])
//        import(
//            str(spath, "bodyUp.stl"),
//            convexity=10
//        );
//    }
}

module _orig_rim() {
    translate([-182.4, -146.88, 0])
    import(
        str(spath, "Rim.stl"),
        convexity=10
    );
}

module _orig_visor() {
    translate([-201.9, -172.57, 0])
    import(
        str(spath, "Visor.stl"),
        convexity=10
    );
}

module mockup() {

    intersection() {
        body();

        //translate([100/2, 0, 0])
        //cube([100, 100, 200], center=true);

        //translate([0, 100/2 - 10, 0])
        //cube([100, 100, 200], center=true);

        //translate([0, 0, 0])
        //cube([100, 100, 90], center=true);
    }

    rim();

    visor();
}

module body() {
    difference() {
        _orig_body();

        rim();

        visor();
    }
}

module rim() {
    difference() {
        translate([0, -11.5, 43.4])
        scale([1, 1, 1.01])
        rotate([90, 0, 0])
        intersection() {
            _orig_rim();

            cylinder(d=40, h=20);
        }

        visor();
    }
}

module visor() {
    translate([0, -11.5, 43.05])
    scale([1.02, 1, 1.04])
    rotate([90, 0, 0])
    intersection() {
        translate([0, 0, -0.5])
        _orig_visor();

        cylinder(d=40, h=20);
    }
}