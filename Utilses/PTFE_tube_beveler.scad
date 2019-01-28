include <../Dollo/NEW_long_ties/globals.scad>;
include <../Dollo/NEW_long_ties/include.scad>;


PTFE_tube_d = 4.3;
screw_d = 14;

module tube_holder() {
    difference() {
        union() {
            cylinder(d=7, h=20,$fn=50);
            hull() {
                translate([0,0,20+13/2]) rounded_cylinder(20-2,8,2, $fn=60);
                translate([0,0,19.99]) cylinder(d=7,h=1, $fn=50);
            }
            translate([0,0,20+13/2+7.99]) v_screw(h=20, screw_d=screw_d, pitch=2, direction=0, steps=70);
        }
        cylinder(d=PTFE_tube_d, h=60,$fn=50);
        translate([0,0,20+13/2+8+20/2]) cube([1.2,20,20],center=true);
        for(i=[0:19]) {
            rotate([0,0,i*360/20]) translate([20/2+.2,0,20+20/2]) rotate([0,0,45]) cube([2,2,20],center=true);
        }

    }
}

module tube_holder_nut() {
    nut_d = screw_d+3;
    difference() {
        translate([0,0,2/2]) rounded_cylinder(nut_d,20-2,2, $fn=60);
        translate([0,0,-0.1]) intersection() {
            v_screw(h=21, screw_d=screw_d+4*slop, pitch=2, direction=0, steps=70);
            cylinder(d1=screw_d+4*slop, d2=screw_d-1,h=21, $fn=60);
        }
        cylinder(d1=14,d2=12, h=2, $fn=60);
        for(i=[0:17]) {
            rotate([0,0,i*360/18]) translate([nut_d/2+1.3,0,20/2]) rotate([0,0,45]) cube([2,2,20],center=true);
        }
    }
}

module beveler_body() {
    h = 7+3.3;
    difference() {
        union() {
            translate([0,-3,(h)/2]) rotate([90,0,0]) cylinder(d=h, h=25, center=true, $fn=60);
            translate([-15/2,5,0]) cube([15,5,h]);
            translate([-13/2,-20,0]) cube([13,10,h]);
            difference() {
                translate([0,0,h/2]) rotate([0,0,45]) cube([30,30,h],center=true);
                translate([0,7,h]) rotate([0,0,45]) cube([30,30,h],center=true);
            }
        }
        
        translate([0,9,(h)/2]) rotate([90,0,0]) cylinder(d=7.3, h=45, center=true, $fn=60);
        translate([0,7,(h)/2]) rotate([-90,0,0]) cylinder(d1=7.3, d2=20.3, h=13/2, $fn=60);
        translate([0,0,(h)/2]) rotate([90,0,0]) cylinder(d=PTFE_tube_d, h=45, center=true, $fn=60);

        translate([-20/2,-16,h/2]) cube([20,0.5,20]);
        translate([-3.5/2,-23,h/2]) cube([3.5,7,20]);
        translate([-30/2,10,-1]) cube([30,15,20]);
        
        translate([0,-2.5,h/2+7.3/2-1/2]) cube([4,24,1],center=true);
        
        translate([-15,-2.75,h/2+10/2]) rotate([0,0,45]) cube([0.5,40,10], center=true);
        translate([15,-2.75,h/2+10/2]) rotate([0,0,-45]) cube([0.5,40,10], center=true);
    }
}


tube_holder();
//tube_holder_nut();
//beveler_body();
