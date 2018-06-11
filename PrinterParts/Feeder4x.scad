
module ProFeeder() {
    import("../_downloaded/ProFeeder/Dual_Feeder_[3D_Print.stl", convexity=10);
}

use <../lib/includes.scad>;
use <../_downloaded/ISOThreads/uploads_6f_12_f1_10_d2_ISOThread.scad>;

//ProFeeder();

dia = 400;
tube_d = 2.4;
fitting_d = 5;
fitting_h = 6;

function tube_angle(h) = asin(h/(dia/2));

module fitting_thread_M6() {
    translate([0,0,-1]) intersection() {
        union() {
            thread_out(6,fitting_h+2,$f=40);
            cylinder(d=5.16, h=fitting_h+2,$fn=50);
        }
        translate([0,0,1]) cylinder(d=6.2,h=fitting_h,$fn=50);
    }
}

//translate([20,0]) fitting_thread_M6();

module tube(h=60) {
    render() intersection() {
        rotate([-90,0,0]) translate([-dia/2,0,0]) donut(dia,tube_d,$fn=200);
        cylinder(d=30,h=h,$fn=10);
    }
}

module tubex2(h=60) {
    union() {
        tube(h=h);
        rotate([0,0,180]) tube(h=h);
    }
}

h1 = fitting_h + 5;
h2 = 18;
h3 = 38;

module tubex4() {


    angle1 = tube_angle(h2-0.5);
    angle2 = tube_angle(h3);
    
    module fitting() {
        union() {
            fitting_thread_M6();
            translate([0,0,fitting_h]) cylinder(d=20,h=5, $fn=20);
        }
    }
    
    fitting_thread_M6();
    translate([0,0,fitting_h + .2]) cylinder(d=tube_d, h=h1-5.2, $fn=40);

    // first junction
    rotate([0,0,90]) translate([0,0,h1]) tubex2(h=h2);

    // second junctions
    translate([0,-dia/2,h1]) rotate([angle1,0,0]) translate([0,dia/2,0]) tubex2(50);
    translate([0,dia/2,h1]) rotate([-angle1,0,0]) translate([0,-dia/2,0]) tubex2(50);

    // fitting holes
    translate([0,-dia/2,h1]) rotate([angle1,0,0]) translate([0,dia/2,0]) {
        translate([dia/2,0,0]) rotate([0,angle2,0]) translate([-dia/2,0,0]) fitting();
    }
    translate([0,dia/2,h1]) rotate([-angle1,0,0]) translate([0,-dia/2,0]) {
        translate([dia/2,0,0]) rotate([0,angle2,0]) translate([-dia/2,0,0]) fitting();
    }

    translate([0,-dia/2,h1]) rotate([angle1,0,0]) translate([0,dia/2,0]) {
        translate([-dia/2,0,0]) rotate([0,-angle2,0]) translate([dia/2,0,0]) fitting();
    }
    translate([0,dia/2,h1]) rotate([-angle1,0,0]) translate([0,-dia/2,0]) {
        translate([-dia/2,0,0]) rotate([0,-angle2,0]) translate([dia/2,0,0]) fitting();
    }

}

module feeder() {

    difference() {
        cylinder(d1=15,d2=20,h=h1+h2+h3 + fitting_h);
        tubex4();
    }
}

module hole_test() {
    difference() {
        cube([20,20,20]);
        translate([5,5,0]) cylinder(d=2.1,h=21,$fn=40);
        translate([15,5,0]) cylinder(d=2.3,h=21,$fn=40);
        translate([5,15,0]) cylinder(d=2.5,h=21,$fn=40);
        translate([15,15,0]) cylinder(d=2.7,h=21,$fn=40);
        
    }
}

//hole_test();

//tube();
//tubex2();
//tubex4();
feeder();


//translate([20,0,0]) {
//    thread_out(6,fitting_h);
//    thread_out_centre(6,fitting_h);
//}