
frame_w = 18.2;
w = frame_w + 8;
h = 95 + 20;

// flat part
frame_l = 226;

frame_corner_d = 50;

$fn=60;


//debug();
//test_frame();

//front_leg();
back_leg();


module mock_frame() {
    translate([frame_corner_d/2, 0, 0])
    hull() {
        cylinder(d=frame_corner_d, h=frame_w);

        translate([frame_l, 0, 0])
        cylinder(d=frame_corner_d, h=frame_w);
    }
}

module _leg(width=135) {
    difference() {
        hull() {
            translate([30/2, 30/2, 0])
            cylinder(d=30, h=w);

            translate([20, 0, 0])
            cube([width, h, w]);
        }
        translate([42.25, 96, 4])
        hull() {
            translate([0, frame_corner_d/2, 0])
            cylinder(d=frame_corner_d, h=frame_w);

            cube([width*2, 10, frame_w]);
        }
        translate([155/2 + 20, h, 0])
        scale([1, 1.8, 1])
        cylinder(d=90, h=w + 1);

        translate([45, h - 20 - 10, w/2])
        rotate([-90, 0, 0])
        cylinder(d=4.2, h=h);

        translate([45, 0, w/2])
        rotate([-90, 0, 0])
        cylinder(d=9, h=h - 20 - 10.3);
    }
}

module front_leg() {
    rotate([90, 0, 0])
    difference() {
        union() {
            _leg(135 - 8);

            translate([20 + 135, 0, w/2])
            rotate([-90, 0, 0])
            cylinder(d=w - 6, h=h - 19);
        }
        translate([20 + 135, h - 20 - 10, w/2])
        rotate([-90, 0, 0])
        cylinder(d=4.2, h=h);

        translate([20 + 135, 0, w/2])
        rotate([-90, 0, 0])
        cylinder(d=9, h=h - 20 - 10.3);
    }
}

module back_leg() {

    rotate([90, 0, 0])
    difference() {
        _leg(135 + 8);

        translate([20 + 135 + 0.5, 0, w/2])
        rotate([-90, 0, 0])
        cylinder(d=w - 5.5,h=h - 19);
    }
}

module debug() {
    intersection() {
        union() {
            front_leg();

            translate([155*2 + 0.5, -w, 0])
            rotate([0, 0, 180])
            back_leg();
        }
        rotate([90, 0, 0])
        cube([500, 500, w/2]);
    }
    %translate([
        -frame_corner_d/2 + 42.25, 0, h + 6
    ])
    rotate([90, 0, 0])
    mock_frame();
}

module test_frame() {
    
    scale_x = (frame_l + frame_corner_d + 5)/(frame_l +frame_corner_d);
    scale_y = (frame_corner_d + 5)/(frame_corner_d);

    intersection() {
        difference() {
            scale([scale_x, scale_y, 1])
            translate([
                -(frame_l + frame_corner_d)/2,
                0, 0
            ])
            mock_frame();

            translate([
                -(frame_l + frame_corner_d)/2,
                0, 0
            ])
            mock_frame();
        }
        cube([frame_l + frame_corner_d + 10, 50, 20]);
    }
}
