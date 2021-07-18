
stl_path = "../_downloaded/Amazon_Volvo_Duplo/";

//orig_plate();

//tire();
//body();
//chassis();
body_chassis();

module orig_plate() {
    import(
        str(stl_path, "Amazon_Volvo_Duplo_with_couplers_fix_1.stl"),
        convexity=10);
}

module tire() {
    union() {
        translate([-131.9, -40.5, 0])
        intersection() {
            orig_plate();

            translate([130, 40, 0])
            cylinder(d=40, h=80, center=true);
        }
    }
    //cylinder(d=8, h=20);
}

module body() {
//    translate([-69, -3, 0])
//    intersection() {
//        orig_plate();
//
//        translate([70, 0, 0])
//        cube([70, 120, 100], center=true);
//    }
    translate([-60, -110, 0])
    import(str(stl_path, "body.stl"));
}

module chassis() {
//    translate([69, -3, 0])
//    intersection() {
//        orig_plate();
//
//        translate([-60, -10, 0])
//        cube([80, 160, 100], center=true);
//    }
    translate([-190.2, -122.9, 0])
    import(str(stl_path, "chassis.stl"));
}

module body_chassis() {
    rotate([0, 0, 90])
    body();

    translate([0, 60, 0])
    rotate([0, 0, 90])
    chassis();
}
