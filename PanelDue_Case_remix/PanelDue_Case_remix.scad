include<../Dollo/NEW_long_ties/include.scad>;

//translate([-72.5,-43.5,0]) import("../_downloaded/PanelDue_Case/Mount_Arm_oriented.stl");

module swivel() {
    difference() {
        union() {
            cylinder(d=14.5,h=48,$fn=50,center=true);
            hull() {
                translate([0,0.1/2,0]) cube([14.5,0.1,30],center=true);
                translate([0,9,0]) rotate([0,90,0]) cylinder(d=18,h=14.5,center=true,$fn=50);
            }
        }
        cylinder(d=5,h=51,$fn=50,center=true);
        translate([0,10,0]) rotate([0,90,0]) cylinder(d=5.5,h=15,center=true,$fn=50);
    }
}

module swivel_mount(bottom=false) {
    difference() {
        union() {
            difference() {
                hull() {
                    translate([0,0,5/2]) rounded_cylinder(25-5,20-5,5,$fn=80);
                    translate([0,-10+7/2,20/2]) rotate([90,0,0]) rounded_cube_side(20,20,7,5,center=true);
                }

                translate([0,0,12]) cylinder(d=15,h=18.1,$fn=50);
                translate([0,-3,0])
                    rotate([45,0,0]) 
                    translate([0,60/2-1,-15/2]) cube([26,60,15],center=true);
            }
            if (bottom) {
                translate([0,-10-7/2,20/2]) rotate([90,0,0]) rounded_cube_side(20,20,7,5,center=true);
            } else {
                translate([0,-10-7/2,35/2]) rotate([90,0,0]) rounded_cube_side(20,35,7,5,center=true);
            }
        }
        translate([0,0,6]) rotate([90,0,0]) {
            cylinder(d=4.3,h=40,center=true,$fn=40);
            cylinder(d=9,h=2*12,center=true,$fn=40);
        }
        
        translate([0,0,35-6]) rotate([90,0,0]) {
            cylinder(d=4.3,h=40,center=true,$fn=40);
            cylinder(d=9,h=2*12,center=true,$fn=40);
        }
    }
}

module debug() {
    swivel_mount();
    translate([0,0,48/2+12]) swivel();
    translate([0,0,48+20+4]) rotate([0,180,0]) swivel_mount(bottom=true);
}

debug();

//swivel_mount();
//swivel_mount(bottom=true);
//swivel();