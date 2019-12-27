include <../../Dollo/NEW_long_ties/globals.scad>;
include <../../Dollo/NEW_long_ties/include.scad>;

pitch = 3;
dia_adjustable_inner = sqrt(30*30*2) + pitch+0.5 - 2*slop;
screw_steps = 100;
pylon_dia = dia_adjustable_inner-4;

echo("Thread inner dia", dia_adjustable_inner);

//fast = true;
fast = false;

module _pylon() {
    difference() {
        cylinder(d=pylon_dia,h=200,$fn=50);
        if (!fast) {
            for (i=[0:15]) {
                rotate([0,0,360/16*i]) linear_extrude(height=200,convexity=10,twist=360, slices=100) translate([pylon_dia/2+0.5,0]) circle(d=3,$fn=20);
            }
        }
    }
}

module _dove_groove(height) {
    union() {
        dovetail_3d(max_width=9.2, min_width=6.2, depth=3, height=height);
        translate([-9/2,3,0]) cube([9,0.3,height]);
    }
}

module leg() {
    translate([0,0,200])
    rotate([180,0,0])
    difference() {
        union() {
            intersection() {
                render() v_screw(h=15, screw_d=dia_adjustable_inner, pitch=pitch, direction=0, steps=screw_steps);
                cylinder(d1=pylon_dia+30,d2=pylon_dia,h=15,$fn=100);
            }
            _pylon();
            translate([-10,60/2,200-7/2]) chamfered_cube_side(20,60,7,1.5,center=true);
            translate([60/2,-10,200-7/2]) chamfered_cube_side(60,20,7,1.5,center=true);
            hull() {
                translate([21/2-20,21/2-20,200-7/2]) cube([21,21,7],center=true);
                translate([21/2-14,21/2-14,180-7/2]) cube([21,21,7],center=true);
            }
            
            translate([60,-20,200-7]) rotate([-5,-155,0]) chamfered_cube_side(10,5,130,1.5);
            translate([-15,60,200-7]) rotate([5,-155,90]) chamfered_cube_side(10,5,130,1.5);
        }
        cylinder(d=pylon_dia-10,h=200-7,$fn=80);
        
        translate([-10,-20,200]) rotate([-90,0,0]) _dove_groove(64);
        translate([-20,-10,200]) rotate([-90,0,-90]) _dove_groove(64);
        
        translate([50,-10,195-7]) {
            cylinder(d=4.3,h=20,$fn=40);
            cylinder(d=8.3,h=7,$fn=40);
        }
        translate([-10,50,195-7/2]) {
            cylinder(d=4.3,h=20,$fn=40);
            cylinder(d=8.3,h=7,$fn=40);
        }
    }
}

module peg() {
    union() {
        dovetail_3d(max_width=9, min_width=6, depth=3, height=15);
        translate([0,-4/2,15/2]) cube([6,4,15],center=true);
    }
}

module peg_slot() {
    union() {
        peg();
        translate([0,-2-2/2,15/2]) cube([10,2,15],center=true);
    }
}

//_pylon();

leg();
//peg();
//peg_slot();
