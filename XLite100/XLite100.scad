use <../Dollo/NEW_long_ties/include.scad>;

thread_resolution = 100;
w = 36 + 7;

//mock_seat();
//debug_thread();
_holder();

//xlite_holder();

module debug_thread() {
    intersection() {
        _thread_minus();
        cube([20,20,5]);
    }

    translate([24/2+1,0,0])
    cylinder(d=1,h=2,$fn=10);
}

module mock_seat(d=7) {

    angle = 20;

    union() {
        translate([-w/2,-0.05,0])
        rotate([-90,0,0])
        cylinder(d=d,h=40,$fn=80);

        translate([-w/2,0,0])
        rotate([0,90-angle,0])
        translate([-20/2,0,0])
        rotate([0,0,-45/2])
        union() {
            donut(20, d, angle=45, $fn=80);

            rotate([0,0,-45/2])
            translate([20/2,0,0])
            rotate([90,0,0])
            cylinder(d=d,h=40,$fn=80);
        }

        translate([w/2,-0.05,0])
        rotate([-90,0,0])
        cylinder(d=d,h=40,$fn=80);

        translate([w/2,0,0])
        rotate([0,90+angle,0])
        translate([-20/2,0,0])
        rotate([0,0,-45/2])
        union() {
            donut(20, d, angle=45, $fn=80);

            rotate([0,0,-45/2])
            translate([20/2,0,0])
            rotate([90,0,0])
            cylinder(d=d,h=40,$fn=80);
        }
    }
}

module _thread_minus() {
    v_screw(h=5, screw_d=24, pitch=1, direction=0,
            steps=thread_resolution, depth=0, chamfer=false);
}

module _holder() {
    h = 11;
    difference() {
        cylinder(d=24+4.4,h=h,$fn=100);

        translate([0,0,h-3.1])
        cylinder(d=24.4,h=5,$fn=100);

        translate([0,0,h-8])
        _thread_minus();

        translate([0,0,h-9])
        cylinder(d=23,h=5,$fn=100);
    }
}

module _seat_mount() {
    difference() {
        // arm
        translate([0,1,0])
        intersection() {
            hull() {
                translate([-w/2-0.5,0,0])
                cylinder(d=12,h=12,$fn=40);

                translate([w/2+0.5,0,0])
                cylinder(d=12,h=12,$fn=40);
            }
            translate([0,10/2,0])
            cube([100,10,30],center=true);
        }

        // holder cutout
        translate([0,0,4])
        cylinder(d=26,h=20);

        // seat cutout
        translate([0,0,9])
        rotate([-90,0,0])
        mock_seat(d=8);

        // ziptie cutouts
        translate([-w/2-0.5,1,11/2-3.5/2])
        chamfered_tube(14,4.5,1.5,0.5,$fn=40);

        translate([w/2+0.5,1,11/2-3.5/2])
        chamfered_tube(14,4.5,1.5,0.5,$fn=40);
    }
}

module xlite_holder() {
    union() {
        translate([0,0,4])
        _holder();

        hull() {
            cylinder(d=24+4.4-2*4, h=1, $fn=100);

            translate([0,0,4])
            cylinder(d=24+4.4, h=1, $fn=100);
        }

        _seat_mount();
    }

    %translate([0,0,9])
    rotate([-90,0,0])
    mock_seat();
}