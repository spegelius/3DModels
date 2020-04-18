
include <../Dollo/NEW_long_ties/include.scad>;

w = 50;
l = 25;

chamfer = 3.5;

module _cable1() {
    rotate([0,90,0]) cylinder(d=6.5,h=w/2+10,$fn=40);
}

module _cable2() {
    rotate([0,-90,0]) hull() {
        translate([0,1,0]) cylinder(d=3.5,h=w/2+10,$fn=20);
        translate([0,-1,0]) cylinder(d=3.5,h=w/2+10,$fn=20);
    }
}

module _half() {
    difference() {
        intersection() {
            chamfered_cube(w,l,20,chamfer,center=true);
            translate([0,0,-10/2]) cube([w,l,10],center=true);
        }
        chamfered_cube(w-3,l-3,20-3,chamfer-1.5,center=true);
        _cable1();
        _cable2();
    }
}

module top() {
    difference() {
        union() {
            _half();
            translate([w/2-7.5,0,-6/2-3]) cube([6,16,6],center=true);
            translate([-w/2+7.5,0,-7/2-2]) cube([6,16,7],center=true);
        }
        translate([w/2-7.5,5,-8.5]) cylinder(d=2.8,h=10,$fn=30);
        translate([w/2-7.5,-5,-8.5]) cylinder(d=2.8,h=10,$fn=30);
        
        translate([-w/2+7.5,5,-8.5]) cylinder(d=2.8,h=10,$fn=30);
        translate([-w/2+7.5,-5,-8.5]) cylinder(d=2.8,h=10,$fn=30);
    }
}

module bottom() {
    difference() {
        union() {
            _half();
            translate([w/2-7.5,0,-8/2-1]) cube([8,19,8],center=true);
            translate([-w/2+7.5,0,-9/2]) cube([8,19,9],center=true);
        }
        translate([w/2-7.5,5,-11]) {
            translate([0,0,4]) cylinder(d=3.2,h=10,$fn=30);
            cylinder(d=6.5,h=3.8,$fn=30);
        }
        translate([w/2-7.5,-5,-11]) {
            translate([0,0,4]) cylinder(d=3.2,h=10,$fn=30);
            cylinder(d=6.5,h=3.8,$fn=30);
        }
        
        translate([-w/2+7.5,5,-11]) {
            translate([0,0,4]) cylinder(d=3.2,h=10,$fn=30);
            cylinder(d=6.5,h=3.8,$fn=30);
        }
        translate([-w/2+7.5,-5,-11]) {
            translate([0,0,4]) cylinder(d=3.2,h=10,$fn=30);
            cylinder(d=6.5,h=3.8,$fn=30);
        }
        
        translate([0,0,0.5]) _cable1();
        translate([0,0,0.5]) _cable2();
    }
}

//top();
bottom();