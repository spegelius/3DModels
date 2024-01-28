
use <common.scad>;

difference() {
    cylinder(d=18, h=16);

    translate([0, 0, -1])
    g1_4_thread(19, slop=0.3);
}