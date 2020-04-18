
module ver1() {
    difference() {
        //translate([0,0,4/2]) cube([48,45,4],center=true);
        union() {
            hull() {
                translate([-43/2,-20,0]) cylinder(d=10,h=6,$fn=40);
                translate([43/2,20,0]) cylinder(d=10,h=6,$fn=40);
            }
            hull() {
                translate([43/2,-20,0]) cylinder(d=10,h=6,$fn=40);
                translate([-43/2,20,0]) cylinder(d=10,h=6,$fn=40);
            }

        }
        translate([-43/2,-20,-0.01]) cylinder(d=3.3,h=7,$fn=20);
        translate([-43/2,20,-0.01]) cylinder(d=2.8,h=7,$fn=20);
        
        translate([-43/2,-20,4]) cylinder(d=7,h=7,$fn=20);
        translate([43/2,-20,4]) cylinder(d=7,h=7,$fn=20);
        
        translate([43/2,-20,-0.01]) cylinder(d=3.3,h=7,$fn=20);
        translate([43/2,20,-0.01]) cylinder(d=2.8,h=7,$fn=20);
    }
}

include <../Dollo/NEW_long_ties/include.scad>;
use <../Original-Prusa-i3/AluParts/alu-frame.scad>;

module ver2() {
    difference() {
        union() {
            cube([53,44,4]);
            cube([53,4,70]);
            hull() {
                translate([0,26,3]) cube([2,10,1]);
                translate([0,0,40]) cube([2,1,15]);
            }
        }
        translate([5,40,0]) cylinder(d=3.3,h=7,$fn=20);
        translate([5,40,2]) cylinder(d=7,h=7,$fn=20);
        
        translate([48,40,0]) cylinder(d=3.3,h=7,$fn=20);
        translate([48,40,2]) cylinder(d=7,h=7,$fn=20);
        
        translate([5,0,61.5]) rotate([90,0,0]) cylinder(d=2.8,h=17,center=true,$fn=20);
        translate([5+42.5,0,61.5]) rotate([90,0,0]) cylinder(d=2.8,h=17,center=true,$fn=20);
        translate([31,28,1]) chamfered_cube(12,20,10,3);
        
        translate([53/2,44/2,0]) chamfered_cube(35,30,30,8,center=true);
        
        translate([53/2,0,35]) chamfered_cube(35,30,50,8,center=true);

    }
    %translate([54.8,0,5]) rotate([0,-90,0]) import("../_downloaded/Prusa/RPI3_case_lid.stl");
}

module debug() {
    rotate([90,0,0]) frame();
    //translate([43/2+4.95,0,289.5]) rotate([-90,180,0]) ver1();
    translate([48+4.95,0,229.5]) rotate([-90,180,0]) ver2();
    
}

//debug();
rotate([0,-90,0]) ver2();