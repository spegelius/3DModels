
module ProFeeder() {
    import("../_downloaded/ProFeeder/Dual_Feeder_[3D_Print.stl", convexity=10);
}

use <../lib/includes.scad>;
use <../_downloaded/ISOThreads/uploads_6f_12_f1_10_d2_ISOThread.scad>;

//ProFeeder();

dia = 350;
tube_d = 2.4;
fitting_d = 5;
fitting_h = 6;

function tube_angle(h) = asin(h/(dia/2));

module tube(h=60) {
    angle = asin(h/(dia/2));
    rotate([90,0,0]) translate([-dia/2,0,0]) donut(dia,tube_d,angle=angle,rotation=0,$fn=150);
}

module tubex2(h=60) {
    union() {
        tube(h=h);
        rotate([0,0,180]) tube(h=h);
    }
}

h1 = fitting_h + 5;
h2 = 18;
h3 = 36;

module tubex4() {


    angle1 = tube_angle(h2-0.5);
    angle2 = tube_angle(h3);
    
    module fitting() {
        union() {
            cylinder(d1=2, d2=3.3,h=3, $fn=40);
            translate([0,0,2.99]) fitting_thread_M6(fitting_h);
            translate([0,0,fitting_h+2.98]) cylinder(d=20,h=5, $fn=20);
        }
    }

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

module tubes_push_fitting() {
    union() {
        fitting_thread_M6(fitting_h);
        translate([0,0,fitting_h + .2]) cylinder(d=tube_d, h=h1-5.2, $fn=40);
        tubex4();
    }
}

module tubes_push_fitting_M10() {
    union() {
        fitting_thread_M10(fitting_h);
        translate([0,0,fitting_h + .2]) cylinder(d=4.2, h=3, $fn=40);
        translate([0,0,fitting_h + 3 + .4]) cylinder(d=tube_d, h=h1-(3.2 + 5.2), $fn=40);
        tubex4();
    }
}

module tubes_collet() {
    difference() {
        union() {
            cylinder(d=7.5, h=3.5, $fn=30);
            translate([0,0,1]) donut(6.8,1,$fn=20);
            translate([0,0,3.5]) cylinder(d1=7.5, d2=4.1, h=2, $fn=30);
            translate([0,0,7/2]) cube([30,1,7], center=true);
            translate([0,0,5.5]) cylinder(d=4.1, h=3, $fn=30);
            translate([0,0,8.7]) cylinder(d=tube_d, h=h1-8.7, $fn=40);
            tubex4();
        }
    }
}

module feeder_push_fitting() {

    difference() {
        cylinder(d1=15,d2=24,h=h1+h2+h3 + fitting_h+3);
        tubes_push_fitting();
    }
}

module feeder_push_fitting_M10() {

    difference() {
        cylinder(d1=15,d2=24,h=h1+h2+h3 + fitting_h+3);
        tubes_push_fitting_M10();
    }
}

module feeder_collet() {
    
    module ear() {
        rotate([90,0,0]) intersection() {
            cylinder(d=8,h=10, $fn=30);
            translate([0,1,8/2]) cube([8,8,10],center=true);
        }
    }

    difference() {
        union() {
            cylinder(d1=15,d2=24,h=h1+h2+h3 + fitting_h+3);
            translate([7,8/2,3]) ear();
            translate([-7,8/2,3]) ear();
        }
        tubes_collet();
        translate([7,30/2,3]) rotate([90,0,0]) cylinder(d=3.2, h=30,$fn=30);
        translate([-7,30/2,3]) rotate([90,0,0]) cylinder(d=3.2, h=30,$fn=30);
        
        translate([7,8,3]) rotate([90,0,0]) cylinder(d=6, h=4,$fn=30);
        translate([-7,8,3]) rotate([90,0,0]) cylinder(d=6, h=4,$fn=30);
        
        translate([7,-4,3]) rotate([90,30,0]) M3_nut();
        translate([-7,-4,3]) rotate([90,30,0]) M3_nut();
    }
}

module hole_test() {
    difference() {
        cube([20,20,10]);
        translate([5,5,0]) cylinder(d=2.1,h=21,$fn=40);
        translate([15,5,0]) cylinder(d=2.3,h=21,$fn=40);
        translate([5,15,0]) cylinder(d=2.5,h=21,$fn=40);
        translate([15,15,0]) cylinder(d=2.7,h=21,$fn=40);
    }
}

hole_test();

//tube();
//tubex2();
//tubex4();
//tubes_push_fitting();
//tubes_push_fitting_M10();
//tubes_collet();

// Printable models
//feeder_push_fitting();
//feeder_push_fitting_M10();
//feeder_collet();
