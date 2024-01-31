use <../../Dollo/NEW_long_ties/include.scad>;


copperhead();


module 25mm_fan() {
    color("DarkSlateGrey")
    difference() {
        rounded_cube_side(
            25.5, 25.5, 10.4, 4, center=true, $fn=30
        );

        cylinder(d=24, h=30, center=true, $fn=30);

        for(i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([10, 10, 0])
            cylinder(d=3, h=40, center=true, $fn=20);
        }
    }
}

module _e3d_nozzle() {
    cylinder(d1=1, d2=3.5, h=2, $fn=30);

    translate([0,0,2])
    cylinder(d=7,h=2.5, $fn=6);

    translate([0,0,4.5])
    cylinder(d=4,h=2, $fn=30);
}

module copperhead(block_rotation=0) {
    stl_path = "../../_downloaded/Copperhead/";

    color("DarkSlateGrey")
    translate([0, 0, 20.5])
    rotate([90, 0, 0])
    import(str(stl_path, "heatsink_groove.stl"));

    color("Gray")
    translate([0, 0, 20.5])
    rotate([90,0,0])
    import(str(stl_path, "heatbreak.stl"));

    color("Silver")
    translate([0, 0, 18.5])
    rotate([90,0,-90 + block_rotation])
    translate([-2.75, 0, 0])
    import(str(stl_path, "block.stl"));

    translate([0, 0, 1])
    _e3d_nozzle();
}

