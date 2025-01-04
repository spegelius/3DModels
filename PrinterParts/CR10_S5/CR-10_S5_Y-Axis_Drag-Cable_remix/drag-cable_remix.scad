use <../../../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../../../_downloaded/";
dc_stl_path = str(
    stl_base_path,
    "CR-10 S5/Y-Axis Drag-Cable/"
);


//original();

new_bracing_mount();


module original() {
    fname =
       "Drag_Cable_-_Bracing_Mount_to_Ground_V01.stl";

    translate([86.22, 70, 0])
    rotate([0, 180, 0])
    import(str(dc_stl_path, fname), convexity=10);
}

module new_bracing_mount() {

    difference() {
        union() {
            original();

            translate([30/2, 35/2 + 10, -8.8/2])
            cube([30, 35, 8.8], center=true);

            translate([2.487/2, 15/2 + 2.65, 0])
            cube([2.487, 15, 13.2], center=true);

            translate([
                19.955 + 2.487/2, 15/2 + 2.65, 0
            ])
            cube([2.487, 15, 13.2], center=true);
        }

        translate([15, -12.01, -16.6])
        chamfered_cube(60, 40, 40, 10, center=true);

        translate([15.01, 32, 20.01])
        chamfered_cube(60, 40, 40, 5.5, center=true);

        // slope
        translate([30, 57, 0])
        rotate([0, 0, 27])
        cube([100, 30, 30], center=true);

        // zip tie holes
        translate([5 + 12.4/2, 17, 0])
        rotate([90, 0, 0])
        scale([1, 2, 1.5])
        donut(12.4, 3.5, $fn=30);

        // chamfers
        translate([65, 46.7, 0])
        rotate([0, 0, 45])
        cube([10, 10, 30], center=true);

        translate([65, 6.5, 0])
        rotate([0, 0, 45])
        cube([10, 10, 30], center=true);

        // mount holes
        hull() {
            translate([44, 14.8, 0])
            cylinder(
                d=4.4, h=30,
                center=true, $fn=30
            );

            translate([57.5, 14.8, 0])
            cylinder(
                d=4.4, h=30,
                center=true, $fn=30
            );
        }

        hull() {
            translate([44, 38.8, 0])
            cylinder(
                d=4.4, h=30,
                center=true, $fn=30
            );

            translate([57.5, 38.8, 0])
            cylinder(
                d=4.4, h=30,
                center=true, $fn=30
            );
        }

    }
}