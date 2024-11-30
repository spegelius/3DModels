

stl_base_path = "../_downloaded/";
zl_stl_path = str(
    stl_base_path,
    "CR-10 S5/Z Sync Stepper Lift Mounts/"
);


//debug();
//original();

new_z_motor_lifter();


module debug() {
    intersection() {
        new_z_motor_lifter();

        translate()
        cube([100, 100, 100]);
    }
}

module original() {
    fname =
       "Z_Axis_Stepper_Mount_V2_Beta.stl";

    translate([0, -550, 0])
    import(str(zl_stl_path, fname), convexity=10);
}

module new_z_motor_lifter() {
    union() {
        original();

        translate([38/2 - 3.5, 0, 0.2/2 + 15.99])
        cube([38, 7, 0.2], center=true);
    }
}