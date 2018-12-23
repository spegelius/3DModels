
include <../lib/includes.scad>;

ball_d = 8;
ball_slop = 0.1;
balls = 13;
bearing_h = 9;

module balls(ball_d=ball_d) {
    for (i=[1:balls]) {
        rotate([0,0,360/balls*i]) translate([35/2,0,0]) sphere(d=ball_d-ball_slop, $fn=60);
    }
}

module bearing_body() {
    difference() {
        beweled_cylinder(d=50,h=bearing_h,b=2,center=true,$fn=80);
        
        difference() {
            cylinder(d=41,h=bearing_h+1,center=true,$fn=80);
            cylinder(d=29,h=bearing_h+1,center=true,$fn=80);
        }
        donut(35,ball_d,$fn=100);
        cylinder(d=10,h=bearing_h+1,center=true,$fn=30);
    }
}

module ball_support() {
    difference() {
        translate([0,0,0.2/2-bearing_h/2]) cylinder(d=40.5,h=0.2,center=true,$fn=80);
        translate([0,0,3/2-bearing_h/2-0.1]) cylinder(d=29.5,h=3,center=true,$fn=80);
    }
}

module ball_interface() {
    intersection() {
        difference() {
            balls(ball_d=ball_d+3);
            balls();
            ball_support();
        }
        difference() {
            translate([0,0,2/2-bearing_h/2]) cylinder(d=40.5,h=2,center=true,$fn=80);
            translate([0,0,3/2-bearing_h/2]) cylinder(d=29.5,h=3,center=true,$fn=80);
        }
    }
}

module debug() {
    intersection() {
        union() {
            bearing_body();
            ball_support();
            //ball_interface();
        }
        translate([0,0,-10]) cube([100,100,100]);
    }
}

//debug();

//bearing_body();
//balls();
ball_support();
//ball_interface();