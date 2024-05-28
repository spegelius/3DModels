use <common.scad>;
use <3D_Simo_cable_holder.scad>;


mockup();


module mockup() {

    intersection() {
        _orig_main_body();

        translate([0, 100/2, 0])
        cube([200, 100, 100], center=true);
    }

    translate([1, 0, 0])
    _orig_3D_left();

    translate([1, 0, 0])
    _orig_3D_right();

    translate([-1, 0, 0])
    //_orig_body_lock();
    body_lock_cable_holder();

    // PTFE tube
    color("lightblue")
    translate([8.4, 0, -4.9])
    rotate([0, 90, 0])
    cylinder(d=4, h=74, $fn=30);
}