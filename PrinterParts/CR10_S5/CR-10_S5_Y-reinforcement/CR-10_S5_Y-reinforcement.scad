use <../../../Dollo/NEW_long_ties/include.scad>;

//debug_y_reinforcement();

frame_mount();


module debug_y_reinforcement() {
    translate([0, 660/2, 20/2])
    rotate([90, 0, 0])
    frame_mount();

    translate([0, -660/2, 20/2])
    rotate([-90, 0, 0])
    frame_mount();

    %translate([0, 0, 20/2])
    rotate([90, 0, 0])
    cylinder(d=10, h=650, center=true, $fn=40);
}

module frame_mount() {
    difference() {
        translate([0, 0, 15/2])
        chamfered_cube_side(
            50, 20, 15, 3, center=true
        );

        translate([-18, 0, 0])
        cylinder(d=4.4, h=40, center=true, $fn=30);

        translate([18, 0, 0])
        cylinder(d=4.4, h=40, center=true, $fn=30);

        translate([-18, 0, 4])
        cylinder(d=10, h=15, $fn=30);

        translate([18, 0, 4])
        cylinder(d=10, h=15, $fn=30);

        cylinder(d=10.1, h=40, center=true, $fn=40);

        // chamfers
        translate([24, 0, 18])
        rotate([0, -55, 0])
        cube([20, 30, 30], center=true);

        translate([-24, 0, 18])
        rotate([0, 55, 0])
        cube([20, 30, 30], center=true);

    }
}