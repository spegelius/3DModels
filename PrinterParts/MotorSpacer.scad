
side = 42;
corner_d = 10;
corner = side - corner_d;
bolt_d = 3.4;

$fn=50;


//motor_spacer(h=1.4);
//motor_spacer(h=4, open=true);
//motor_spacer(h=2, open=true);
motor_spacer_half(2.6);

module motor_spacer(h, open=false) {
    difference() {
        hull() {
            translate([corner/2, corner/2, 0])
            cylinder(d=corner_d, h=h);

            translate([-corner/2, corner/2, 0])
            cylinder(d=corner_d, h=h);

            translate([corner/2, -corner/2, 0])
            cylinder(d=corner_d, h=h);

            translate([-corner/2, -corner/2, 0])
            cylinder(d=corner_d, h=h);
        }
        
        translate([-31/2, 31/2, -0.1])
        cylinder(d=bolt_d, h=h + 1);

        translate([-31/2, -31/2, -0.1])
        cylinder(d=bolt_d, h=h + 1);

        translate([31/2, -31/2, -0.1])
        cylinder(d=bolt_d, h=h + 1);

        translate([31/2, 31/2, -0.1])
        cylinder(d=bolt_d, h=h + 1);
        
        translate([0, 0, -0.1])
        cylinder(d=23, h=h + 1);

        if(open) {
            hull() {
                cylinder(d=23, h=h*3, center=true);

                translate([25, 0, 0])
                cylinder(d=23, h=h*3, center=true);
            }
        }
    }
}

module motor_spacer_half(h) {
    intersection() {
        motor_spacer(h, open=true);

        translate([-100/2, 0, 0])
        cube([100, 100, 100], center=true);
    }
}
