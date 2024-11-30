use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Bambu_filament_winder_spooler/"
);


//%_orig_spooler_centering_disk_55mm();


spooler_centering_disk_51mm();
//spooler_centering_disk_54mm();
//spooler_centering_disk_55mm();


module _orig_spooler_centering_disk_55mm() {
    translate([-0.03, 82.68, 1])
    import(
        str(
            spath,
            "Spooler Centering Disc for Bambu Lab Spools 55 mm.stl"
        ),
        convexity=10
    );

//    #cylinder(d=32, h=1, $fn=50);
//    #cylinder(d=55, h=9.4, $fn=30);
//    #cylinder(d1=55 + 2*3.5, d2=55, h=3.5, $fn=30);
//    #cylinder(d=88, h=2, $fn=40);

//      #translate([0, 0, 2])
//      chamfered_cylinder(
//          55 - 4, 20, 3, $fn=30
//      );
}


module _spooler_centering_disk(d=54) {
    difference() {
        union() {
            cylinder(d=d, h=9.4, $fn=30);
            cylinder(d1=d + 2*3.5, d2=d, h=3.5, $fn=30);
            cylinder(d=88, h=2, $fn=40);
        }

        translate([0, 0, 2])
        chamfered_cylinder(
          d - 3.7, 20, 1.5, $fn=30
        );

        cylinder(d=32.2, h=10, center=true, $fn=40);
    }
}

module spooler_centering_disk_54mm() {
    difference() {
        _spooler_centering_disk(d=54);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="54", size=14);
    }
}

module spooler_centering_disk_55mm() {
    difference() {
        _spooler_centering_disk(d=55);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="55", size=14);
    }
}

module spooler_centering_disk_51mm() {
    difference() {
        _spooler_centering_disk(d=51);

        translate([-40, 7, 0.2])
        rotate([180, 0, 0])
        linear_extrude(1)
        text(text="51", size=14);
    }
}