
module skull() {
    import("../_downloaded/T800_Smooth_Terminator/T800_Base_Supported_v5.4_mesmix.stl", convexity=10);
}

//t800_text();
//skull_no_text();
skull();

module t800_text() {
    translate([0, 0, -50.5])
    rotate([0, 49, 0])
    intersection() {
        skull();

        translate([-71.495, -65, 10])
        rotate([0, 41, 0])
        cube([10, 130, 20]);
    }
}

module skull_no_text() {
    difference() {
        skull();

        translate([-71.47, -65, 10])
        rotate([0, 41, 0])
        cube([10, 130, 20]);
    }
}

