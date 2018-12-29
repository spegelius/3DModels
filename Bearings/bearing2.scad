
$fn=60;
nozzle=0.46;

module ring(x=10, d=7) {
    union() {
        rotate_extrude(convexity=7) {
            translate([x, 0, 0]) circle(d=d);
        }
        translate([0,0,-d/2]) cylinder(d=x*2, h=d);
    }
}

module ring2(d=14, h=5) {
    hull() {
        translate([0,0,-h/2]) cylinder(d=d-h/1.5, h=1);
        translate([0,0,-0.1]) cylinder(d=d, h=0.2);
        translate([0,0,0.1]) cylinder(d=d-h/1.5, h=h/2);
    }
}

module fin(nozzle=nozzle) {
    
   module sub() {
        rotate([0,0,50]) translate([13,10,0]) difference() {
            ring(x=8, d=11);
            ring(x=8, d=11-2*nozzle);
            translate([-20,1,-10]) cube([40,20,20]);
            translate([-9,-20,-10]) rotate([0,0,-20]) cube([20,40,20]);
            translate([-20,-20,-20]) cube([40,40,20]);
            cylinder(d=20.3, h=10);
        }
    }
    translate([0,0,-4.8]) sub();
    mirror([0,0,1]) translate([0,0,-4.8]) sub();
}

module outer(nozzle=nozzle) {
    difference() {
        ring(x=14, d=12);
        //ring(x=3, d=8);
        translate([0,0,-5]) cylinder(d=30,h=12);
        translate([0,0,-8]) cylinder(d=40,h=3.2);
        translate([0,0,4.8]) cylinder(d=40,h=6);
        rotate_extrude(convexity=7) {
            translate([23, 0, 0]) circle(d=10);
        }
    }
    for (i=[0:5]) {
        rotate([0,0,i*360/6]) translate([0,6,0]) fin(nozzle);
    }
}

module inner(d=22.1, cube_side=7) {
    difference() {
        ring2(d=22.1, h=9.6);
        cube([cube_side,cube_side,22], center=true);
    }
}

module key() {

    difference() {
        union() {
            cube([6.8, 20, 6.8]);
            translate([-20+3.4, -2, 3.4]) rotate([0,90,0]) cylinder(d=12, h=40);
        }
        translate([0,0,-2.5]) cube([50,20,5], center=true);
    }
}

//translate([20,0,0]) fin();
outer();
//translate([30,0,0]) inner();

//translate([0,-70,0]) key();
