use <../_downloaded/ISOThreads/threads.scad>;

module fitting_thread_M6(fitting_h=6, slop=0) {
    translate([0,0,-1])
    intersection() {
        union() {
            metric_thread(
                diameter=6 + slop,
                pitch=1,
                length=fitting_h + 2,
                internal=true,
                $fn=40
            );
        }
        translate([0, 0, 1])
        cylinder(d=6.2, h=fitting_h, $fn=50);
    }
}
//fitting_thread_M6();

module fitting_thread_M10(fitting_h=6, slop=0) {
    translate([0, 0, -1])
    intersection() {
        union() {
            metric_thread(
                diameter=10 + slop,
                pitch=1,
                length=fitting_h + 2,
                internal=true,
                $fn=40
            );
        }
        translate([0, 0, 1])
        cylinder(d=10.2, h=fitting_h, $fn=50);
    }
}
//fitting_thread_M10();