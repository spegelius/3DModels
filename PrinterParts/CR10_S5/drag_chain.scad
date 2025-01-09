include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
use <mockups.scad>;

stl_base_path = "../../_downloaded/";
dc_stl_path = str(
    stl_base_path,
    "CR-10 S5/Y-Axis Drag-Cable/"
);


//drag_chain_bottom_orig();
//drag_chain_top_orig();

//drag_chain_bottom_new();
drag_chain_top_new();


module drag_chain_bottom_orig() {
    fname =
        "bottom_rotated.stl";

    translate([-17.56 - 22.45/2, -45, -6.5])
    import(
        str(dc_stl_path, fname), convexity=10
    );
}

module drag_chain_top_orig() {

    fname =
        "Top_rotated.stl";

    rotate([0, 180, 0])
    translate([-17.56 - 22.45/2, -45, -19.77])
    import(
        str(dc_stl_path, fname), convexity=10
    );
    
}

module drag_chain_bottom_new() {
    module _bottom_half() {
        intersection() {
            drag_chain_bottom_orig();

            translate([-20/2 + 0.1, 0, 0])
            cube([20, 40, 40], center=true);
        }
    }


    union() {
        _bottom_half();

        mirror([1, 0, 0])
        _bottom_half();
    }
}

module drag_chain_top_new() {
    difference() {
        union() {
            drag_chain_top_orig();

            translate([0, 0.75, 4/2])
            cube([13.2, 7.7, 4], center=true);
        }

        translate([-15/2, -6, 13.95/2 - 0.62])
        rotate([0, 90, 0])
        intersection() {
            rotate([0, 0, 1])
            tube(13.95, 15, 3.5, $fn=47);

            translate([10/2, 0, 0])
            cube([10, 20, 40], center=true);
        }

        translate([0, 0, 7/2 + 2])
        rounded_cube(12.86, 20, 7, 3, center=true, $fn=30);
    }
}