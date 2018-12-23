use <../Dollo/NEW_long_ties/include.scad>;

$fn=30;

axle_d = 3;

module chasis_new() {
    
    axle_hole = axle_d + 0.2;
    
    difference() {
        union() {
            translate([0,0,14]) rotate([-90,0,0]) import("../_downloaded/Generic_Tractor/chasis.stl", convexity=10);
            translate([0,18.8,4.9]) rotate([0,90,0]) rounded_cube_side(5,5,16.25,3,center=true);
        }
        translate([0,18.8,4.9]) rotate([0,90,0]) cylinder(d=axle_hole,h=50,center=true);
        translate([0,-12.4,2.6]) rotate([0,90,0]) cylinder(d=axle_hole,h=50,center=true);
    }
}

module Rueda_Der_Delantera_new() {
    difference() {
        translate([-18.8,-9.12,-8.07]) rotate([0,90,0]) import("../_downloaded/Generic_Tractor/Rueda_Der_Delantera.stl", convexity=10);
        union() {
            cylinder(d=axle_d,h=4);
            translate([0,0,3.99]) cylinder(d1=axle_d, d2=0,h=2);
        }
    }
}

module Rueda_Izq_Delantera_new() {
    difference() {
        translate([18.8,-9.12,-8.07]) rotate([0,-90,0]) import("../_downloaded/Generic_Tractor/Rueda_Izq_Delantera.stl", convexity=10);
        union() {
            cylinder(d=axle_d,h=4);
            translate([0,0,3.99]) cylinder(d1=axle_d, d2=0,h=2);
        }
    }
}

module Rueda_Der_Trasera_new() {
    difference() {
        translate([12.4,-11.422,-6.7]) rotate([0,90,0]) import("../_downloaded/Generic_Tractor/Rueda_Der_Trasera.stl", convexity=10);
        union() {
            cylinder(d=axle_d,h=4);
            translate([0,0,3.99]) cylinder(d1=axle_d, d2=0,h=2);
        }
    }
}

module Rueda_Izq_Trasera_new() {
    difference() {
        translate([-12.4,-11.422,-6.7]) rotate([0,-90,0]) import("../_downloaded/Generic_Tractor/Rueda_Izq_Trasera.stl", convexity=10);
        union() {
            cylinder(d=axle_d,h=4);
            translate([0,0,3.99]) cylinder(d1=axle_d, d2=0,h=2);
        }
    }
}

module axle() {
    h = 16+2*4;
    intersection() {
        rotate([90,0,0]) union() {
            cylinder(d=axle_d, h=h, center=true);
            translate([0,0,h/2-0.01]) cylinder(d1=axle_d,d2=0,h=2);
            translate([0,0,-h/2-1.99]) cylinder(d2=axle_d,d1=0,h=2);
        }
        translate([0,0,axle_d*0.12]) cube([axle_d+1,h*2,axle_d], center=true);
    }
}


chasis_new();
//Rueda_Der_Delantera_new();
//Rueda_Izq_Delantera_new();
//Rueda_Der_Trasera_new();
//Rueda_Izq_Trasera_new();
//axle();