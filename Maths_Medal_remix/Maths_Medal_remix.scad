use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Maths Medal/"
);


//debug();


medal_pi_fixed();


module _orig_medal() {
    import(
        str(spath, "medal-pi.stl"),
        convexity=10
    );
}

module debug() {
    intersection() {
        medal_pi_fixed();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }
}


module medal_pi_fixed() {
    union() {
        difference() {
            _orig_medal();

            translate([1, 1, 4.2])
            cylinder(d=36, h=3);
        }

        translate([0, 0, -1.7])
        scale([1, 1, 1.15])
        intersection() {
            _orig_medal();

            translate([1, 1, 4.6])
            cylinder(d=36, h=3);
        }
    }
}