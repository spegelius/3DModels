use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Toxic Rugged Boxes/"
);


//_orig_radiation();


//new_radioation_yellow();
//new_radioation_black();
new_radioation_rest();



module _orig_radiation() {
    translate([-125, -105, -61.06])
    import(
        str(spath, "radiation.stl"),
        convexity=10
    );
}

module new_radioation_yellow() {
    intersection() {
        _orig_radiation();

        cylinder(d=24, h=0.614, $fn=50);
    }
}

module new_radioation_black() {
    intersection() {
        _orig_radiation();

        translate([0, 0, 0.614])
        cylinder(d=26, h=0.4, $fn=50);
    }
}

module new_radioation_rest() {
    difference() {
        _orig_radiation();
        cylinder(d=24, h=0.614, $fn=50);

        translate([0, 0, 0.614])
        cylinder(d=26, h=0.4, $fn=50);
    }
}