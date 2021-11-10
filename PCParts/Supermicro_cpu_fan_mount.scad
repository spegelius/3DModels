use <common.scad>;

//mock_sockets();
//mock_cooler();
//mockup();


//fan_mount();
fan_mount_2();


module mock_sockets() {
    module _socket_holes() {

        cylinder(d=3, h=10, center=true, $fn=20);

        translate([80, 0, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([0, 80, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([80, 80, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([15.7, 135.3, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([80 + 15.7, 135.3, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([15.7, 80 + 135.3, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([80 + 15.7, 80 + 135.3, 0])
        cylinder(d=3, h=10, center=true, $fn=20);
    }

//    difference() {
//        scale([0.862, 0.858, 1])
//        translate([-9.5, -31.7, 0])
//        import("Supermicro_sockets.svg");
//
//        _socket_holes();
//    }
    _socket_holes();
}

module mock_cooler() {
    difference() {
        translate([0, 0, 64/2])
        cube([90, 90, 64], center=true);

        translate(
            [90/2 + 13/2 - 12,
             90/2 + 10/2 - 9.5,
            65/2 + 3.5])
        cube([13, 10, 65], center=true);

        translate(
            [90/2 + 13/2 - 12,
             -90/2 - 10/2 + 9.5,
            65/2 + 3.5])
        cube([13, 10, 65], center=true);

        translate(
            [-90/2 - 13/2 + 12,
             -90/2 - 10/2 + 9.5,
            65/2 + 3.5])
        cube([13, 10, 65], center=true);

        translate(
            [-90/2 - 13/2 + 12,
             90/2 + 10/2 - 9.5,
            65/2 + 3.5])
        cube([13, 10, 65], center=true);

        translate([90/2, 0, 100/2 + 3.5])
        cube([6, 200, 100], center=true);

        translate([-80/2, -80/2, 0])
        cylinder(d=4, h=20, center=true, $fn=30);

        translate([80/2, -80/2, 0])
        cylinder(d=4, h=20, center=true, $fn=30);

        translate([80/2, 80/2, 0])
        cylinder(d=4, h=20, center=true, $fn=30);

        translate([-80/2, 80/2, 0])
        cylinder(d=4, h=20, center=true, $fn=30);
        
    }

    translate([90/2 - 2, -90/2 + 9.5 + 9, 38.5]) {
        sphere(d=7.5, $fn=30);

        rotate([0, -90, 0])
        cylinder(d=7.5, h=10, $fn=30);
    }

    translate([90/2 - 2, 90/2 - 9.5 - 9, 38.5]) {
        sphere(d=7.5, $fn=30);

        rotate([0, -90, 0])
        cylinder(d=7.5, h=10, $fn=30);
    }

    translate([-90/2, 0, 38.5])
    sphere(d=6, $fn=30);

    translate([-80/2, -80/2, 3])
    cylinder(d=8, h=20, $fn=30);

    translate([80/2, -80/2, 0])
    cylinder(d=8, h=20, $fn=30);

    translate([80/2, 80/2, 0])
    cylinder(d=8, h=20, $fn=30);

    translate([-80/2, 80/2, 0])
    cylinder(d=8, h=20, $fn=30);
}

module mockup() {

    translate([-80/2, -80/2, 0])
    mock_sockets();
    
    translate([15.7, 135.3, 0])
    rotate([0, 0, 180])
    mock_cooler();

    mock_cooler();

    translate([0, -65, 33])
    rotate([90, 0, 0])
    mock_fan_60mm();

    translate([-1, -90/2 - 2, 62/2 + 2])
    fan_mount();

    translate([15.7, 135.8 - 65, 33])
    rotate([90, 0, 0])
    mock_fan_60mm();

    translate([16.7, 135.3 - 90/2 - 2, 62/2 + 2])
    mirror([1, 0, 0])
    fan_mount(fan_offset=1.5);
}

module fan_mount(fan_offset=0) {
    difference() {
        union() {
            hull() {
                translate([-1/2, 55/2, 0])
                cube([90 + 4 - 1, 55, 62], center=true);

                translate([fan_offset, -5/2, 0])
                cube([64, 5, 62], center=true);
            }

            translate([80/2, 7, 0])
            cylinder(d=12, h=62, center=true, $fn=30);
        }

        translate([80/2, 7, 0])
        cylinder(d=8.5, h=63, center=true, $fn=30);

        // inner block removed
        difference() {
            hull() {
                translate([-1/2 + 0.2, 55/2 + 2.3, 0])
                cube([90 - 1, 55, 63], center=true);

                translate([fan_offset + 0.2, -5/2 + 2, 0])
                cube([59, 5, 63], center=true);
            }
            translate([0, -10/2 + 1.9, -62/2])
            cube([100, 10, 2], center=true);

            translate([90/2, 20.5, 5.5])
            rotate([0, 90, 0])
            cylinder(d1=11, d2=17, h=5, center=true, $fn=30);

            translate([-90/2, 47, 5.5])
            rotate([0, -90, 0])
            cylinder(d1=11, d2=17, h=5, center=true, $fn=30);
        }

        translate([90/2, 6.9, -62/2])
        cube([5, 10, 3.2], center=true);

        translate([fan_offset, 0, -(62 - 59)/2 + 1])
        rotate([90, 0, 0])
        cylinder(d=59, h=100, center=true, $fn=80);

        translate([fan_offset, 0, -(62 - 59)/2 + 1])
        for(i = [0:3]) {
            rotate([90, i * 90, 0])
            translate([50/2, 50/2, 0])
            cylinder(d=5.3, h=20, center=true, $fn=30);
        }

        translate([90/2, 20.5, 5.5])
        rotate([0, 90, 0])
        cylinder(d=7.6, h=10, center=true, $fn=30);

        translate([-90/2, 47, 5.5])
        rotate([0, 90, 0])
        cylinder(d=6, h=10, center=true, $fn=30);

        translate([90/2, 50, 0])
        cube([20, 40, 100], center=true);

        translate([90/2, 36, 32])
        rotate([45, 0, 0])
        cube([20, 40, 40], center=true);

        translate([90/2, 33, -32])
        rotate([55, 0, 0])
        cube([20, 50, 40], center=true);

        translate([-90/2, 59, 32])
        rotate([45, 0, 0])
        cube([20, 40, 40], center=true);

        translate([-90/2, 56.4, -32])
        rotate([55, 0, 0])
        cube([20, 55, 40], center=true);

        translate([-39 - 1/2 + fan_offset/2, 0, 0])
        cube([10 + fan_offset, 20, 50], center=true);

        translate([39 - 1/2 + fan_offset/2, 0, 0])
        cube([10 - fan_offset, 20, 50], center=true);
    }

    // support
    translate([90/2, 7.2, -62/2 + 1.4/2])
    cube([2, 10, 1.4], center=true);
}

module fan_mount_2() {
    mirror([1, 0, 0])
    fan_mount(fan_offset=1.5);
}
