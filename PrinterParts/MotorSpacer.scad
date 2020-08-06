
side = 42;
corner_d = 10;
corner = side - corner_d;
h = 4;

$fn=50;

module motor_spacer(open=false) {
    difference() {
        hull() {
            translate([corner/2, corner/2,0])
            cylinder(d=corner_d,h=h);

            translate([-corner/2, corner/2,0])
            cylinder(d=corner_d,h=h);

            translate([corner/2, -corner/2,0])
            cylinder(d=corner_d,h=h);

            translate([-corner/2, -corner/2,0])
            cylinder(d=corner_d,h=h);
        }
        
        translate([-31/2, 31/2,-0.1])
        cylinder(d=3.3,h=h+1);

        translate([-31/2, -31/2,-0.1])
        cylinder(d=3.3,h=h+1);

        translate([31/2, -31/2,-0.1])
        cylinder(d=3.3,h=h+1);

        translate([31/2, 31/2,-0.1])
        cylinder(d=3.3,h=h+1);
        
        translate([0,0,-0.1])
        cylinder(d=23, h=h+1);

        if(open) {
            hull() {
                cylinder(d=23,h=h*3,center=true);

                translate([25,0,0])
                cylinder(d=23,h=h*3,center=true);
            }
        }
    }
}

//motor_spacer();
motor_spacer(open=true);
