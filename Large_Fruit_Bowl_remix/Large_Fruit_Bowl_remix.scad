use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/Bowls/";
b_stl_path = str(
    stl_base_path,
    "Large Fruit Bowl/"
);


//_orig_bowl_1();
//debug_bowl_1();

new_bowl_1();


module _orig_bowl_1() {
    translate([-152.5, -152.5, 0])
    import (
        str(b_stl_path, "LR2425-S17-H098-D270.stl"),
        convexity=10
    );
    //%cylinder(d=272, h=200);
}

module debug_bowl_1() {
    intersection() {
        new_bowl_1();

        translate([0, 1000/2, 0])
        cube([1000, 1000, 1000], center=true);
    }
}

module new_bowl_1() {
    difference() {
        _orig_bowl_1();

        for(i = [0:22]) {
            cube_donut(10 + i*9, 2.3, $fn=80);
        }
    }
}