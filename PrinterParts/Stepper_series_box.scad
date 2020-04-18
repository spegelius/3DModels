
include <../PCParts/common.scad>;
include <../Dollo/NEW_long_ties/include.scad>;

slop = 0.15;

module pcb_mockup() {
    translate([0,0,-1.4]) pin_header(4);
    translate([0,2.54,-1.4]) pin_header(4);
    translate([0,3*2.54,-1.4]) pin_header(4);
    
    translate([-2.24,-2.24-2.54]) pcb_with_holes(12.8,17.8);
    
}

module box(parallel=false) {
    
    h = 13;
    
    module slot() {
        union() {
            cube([10.7,2.7,h+1],center=true);
            translate([0,0,-h/2-0.1]) hull() {
                cube([11.2,3.2,0.1],center=true);
                cube([10.7,2.7,0.8],center=true);
            }
        }
    }
    
    difference() {
        union() {
            chamfered_cube_side(16,21,h,2,center=true);
            translate([16/2-2/2,0,0]) rotate([0,90,0]) chamfered_cube_side(h,35,2,3,center=true);
            translate([-16/2,4,-5]) rotate([90,0,-90]) {
                if (parallel) {
                    linear_extrude(0.5) text("P");
                } else {
                    linear_extrude(0.5) text("S");
                }
            }
        }
        translate([0,0,6]) cube([13,18,10],center=true);
        translate([0,-3.75]) slot();
        translate([0,3.85]) slot();
        translate([0,1.3]) slot();
        
        translate([0,28/2,0]) rotate([0,90,0]) cylinder(d=3.2,h=30,$fn=20,center=true);
        translate([0,-28/2,0]) rotate([0,90,0]) cylinder(d=3.2,h=30,$fn=20,center=true);
    }
}

module backplate() {
    union() {
        translate([0,0,1/2]) chamfered_cube_side(16,21,1,2,center=true);
        translate([0,0,1.5/2]) cube([13-slop,18-slop,1.5],center=true);
    }
}

module debug() {
    intersection() {
        box();
        translate([0,-60/2,-30/2]) cube([30,60,30]);
    }
    translate([-4.1,4.1,2.6]) rotate([180,0,0]) pcb_mockup();
}

//debug();

box(parallel=true);
//box(parallel=false);
//backplate();