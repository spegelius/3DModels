include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;
use <../../Dollo/New_long_ties/mockups.scad>;


module original_Y() {
    translate([-160,6.25,-2]) rotate([-90,0,0]) import("../../_downloaded/Tronxy_X5S_Belt_geometry_aligned_screw_adjust_motor_mounts/Nats_Tronxy_Y_motor_mount_LHS.stl", convexity=5);
}

module original_X() {
    translate([-160,0,-2]) rotate([-90,0,0]) import("../../_downloaded/Tronxy_X5S_Belt_geometry_aligned_screw_adjust_motor_mounts/Nats_Tronxy_X_motor_mount_RHS_raised_by_10mm.stl", convexity=5);
}

module original_knob() {
    translate([0,0,25]) rotate([-90,0,0]) import("../../_downloaded/Tronxy_X5S_Belt_geometry_aligned_screw_adjust_motor_mounts/Nats_M5_adjusting_knob.stl", convexity=5);
}

module _new_mount(z_offset=0) {
    //%original_Y();
    difference() {
        union() {
            translate([-5,0,25/2-z_offset]) cube([70,52,25],center=true);
            translate([29+25/2,-14,5/2]) cube([25,62,5],center=true);
            translate([29+5/2,-9.5,25/2]) cube([5,71,25],center=true);
            translate([29+5/2,5,45/2]) cube([5,25,45],center=true);
            translate([29+25/2,15.5,45/2]) cube([25,5,45],center=true);
            
            translate([29+15,-22,5/2+4]) cube([6,19,3],center=true);
            translate([29+15,10.5,5/2+4]) cube([6,5,3],center=true);
            
            translate([29+15,10.5,29]) hull() {
                cube([6,1,7],center=true);
                translate([0,2,-1]) cube([6,1,9],center=true);
            }
            
            translate([35,52/2-8/2,45/2]) cube([8,8,45],center=true);
            
            translate([19,52/2-5/2,25-1/2-z_offset]) hull() {
                cube([25,5,1],center=true);
                translate([25/2,0,20+z_offset]) cube([1,5,1],center=true);
            }
            
            if (z_offset != 0) {
                translate([31,0,-z_offset+1/2]) hull() {
                    cube([3,52,1],center=true);
                    translate([9.5/2-3/2,0,z_offset]) cube([9.5,52,1],center=true);
                }
            }
        }
        translate([-2.5,0,105/2+3-z_offset]) cube([67.5,44,105],center=true);
        
        translate([35+8/2,52/2-8,-z_offset]) rotate([0,0,39]) cube([12,16,105]);
        
        translate([29+15,-5.5,0]) cylinder(d=4.3,h=20,center=true,$fn=40);
        translate([29+15,-38,0]) cylinder(d=4.3,h=20,center=true,$fn=40);
        
        translate([29,2.5,15]) {
            rotate([0,90,0]) cylinder(d=4.3,h=20,center=true,$fn=40);
            rotate([0,90,0]) cylinder(d=8.5,h=7,center=true,$fn=40);
        }
        translate([29,2.5,39]) {
            rotate([0,90,0]) cylinder(d=4.3,h=20,center=true,$fn=40);
            rotate([0,90,0]) cylinder(d=8.5,h=7,center=true,$fn=40);
        }
        translate([29,-38,15]) rotate([0,90,0]) cylinder(d=4.3,h=20,center=true,$fn=40);
        
        translate([29+15,9,39]) rotate([90,0,0]) cylinder(d=4.3,h=40,center=true,$fn=40);

        translate([-35,0,9.5-z_offset]) rotate([0,90,0]) cylinder(d=5.2,h=20,center=true,$fn=40);
        
        hull() {
            translate([-2,0,0]) cylinder(d=22.5,h=20,center=true,$fn=50);
            translate([8,0,0]) cylinder(d=22.5,h=20,center=true,$fn=50);
        }
        hull() {
            translate([motor_bolt_hole_distance/2-2,motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
            translate([motor_bolt_hole_distance/2+8,motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
        }
        hull() {
            translate([motor_bolt_hole_distance/2-2,-motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
            translate([motor_bolt_hole_distance/2+8,-motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
        }
        hull() {
            translate([-motor_bolt_hole_distance/2-2,motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
            translate([-motor_bolt_hole_distance/2+8,motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
        }
        hull() {
            translate([-motor_bolt_hole_distance/2-2,-motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
            translate([-motor_bolt_hole_distance/2+8,-motor_bolt_hole_distance/2,0]) cylinder(d=3.2,h=20,center=true,$fn=30);
        }
    }
    %translate([8,-42/2,30]) rotate([-90,0,0]) mock_stepper_motor();
}

module new_mount_Y() {
    difference() {
        _new_mount();
        translate([-40.2,-7,17]) rotate([-90,0,-90]) linear_extrude(1) text("Y", size=12);
    }
}

module new_mount_X() {
    difference() {
        mirror([1,0,0]) _new_mount(z_offset=10);
        translate([39.2,17,7]) rotate([-90,0,-90]) linear_extrude(1) text("X", size=12);
    }
}

module new_knob() {
    union() {
        original_knob();
        translate([0,0,20]) cylinder(d=6,h=0.2,$fn=30);
    }
}

//new_mount_Y();
new_mount_X();
//new_knob();