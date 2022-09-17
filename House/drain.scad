use <../Dollo/NEW_long_ties/include.scad>;


//drain_extension(102.5, 73.5, 50, 28, $fn=30);
drain_extension_bend(102.5, 73.5, 28);


module drain_extension(w, d, h, corner) {
    difference() {
        rounded_cube_side(
            w + 4, d + 4, h, corner, center=true
        );

        rounded_cube_side(
            w, d, h + 2,
            corner - 4, center=true
        );
    }
}

module drain_extension_bend(w, d, corner) {
    intersection() {
        drain_extension(w, d, 50, corner);

        translate([0, 0, -9])
        rotate([5, 0, 0])
        cube([200, 200, 60], center=true);
    }

    translate([0, -2.18, 33.3])
    intersection() {
        rotate([10, 0, 0])
        drain_extension(w, d, 40, corner);

        rotate([5, 0, 0])
        cube([200, 200, 25], center=true);
    }

    translate([0, -2*2.18, 54])
    intersection() {
        drain_extension(w, d, 25, corner);

        translate([0, 0, 14])
        rotate([5, 0, 0])
        cube([200, 200, 45], center=true);
    }        
}