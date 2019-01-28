include <../Dollo/NEW_long_ties/globals.scad>;
include <../Dollo/NEW_long_ties/include.scad>;

module mock_buck() {
    difference() {
        // PCB
        cube([26.2, 61.7, 1.6], center=true);
        
        // M3 holes
        translate([26.2/2-2.6,61.7/2-2.8,0]) cylinder(d=3,h=5,center=true,$fn=20);
        translate([-26.2/2+2.5,61.7/2-2.8,0]) cylinder(d=3,h=5,center=true,$fn=20);
        translate([26.2/2-2.6,-61.7/2+2.8,0]) cylinder(d=3,h=5,center=true,$fn=20);
        translate([-26.2/2+2.5,-61.7/2+2.8,0]) cylinder(d=3,h=5,center=true,$fn=20);
    }
    
    // connector legs
    translate([5/2,61.7/2-3,-1]) cylinder(d=0.7,h=1.8,center=true,$fn=10);
    translate([-5/2,61.7/2-3,-1]) cylinder(d=0.7,h=1.8,center=true,$fn=10);
    translate([5/2,-61.7/2+3,-1]) cylinder(d=0.7,h=1.8,center=true,$fn=10);
    translate([-5/2,-61.7/2+3,-1]) cylinder(d=0.7,h=1.8,center=true,$fn=10);
    
    // connectors
    translate([0,61.7/2-7.5/2,10/2+1.6/2]) cube([10,7.5,10],center=true);
    translate([0,-61.7/2+7.5/2,10/2+1.6/2]) cube([10,7.5,10],center=true);
    
    // potentiometers
    translate([26.2/2-0.8-4.4/2,9.5/2+2.5,10/2+1.6/2]) {
        cube([4.4,9.5,10],center=true);
        translate([4.4/2-1.2,9.5/2-1.2,10/2]) cylinder(d=2.2,h=2,$fn=20);
    }
    translate([26.2/2-0.8-4.4/2,-9.5/2+1.5,10/2+1.6/2]) {
        cube([4.4,9.5,10],center=true);
        translate([4.4/2-1.2,9.5/2-1.2,10/2]) cylinder(d=2.2,h=2,$fn=20);
    }
    
    // coil
    translate([0,-2,1.6/2+15/2]) rotate([90,0,0]) cylinder(d=15,h=7.5,$fn=40);
    
    //wires
    translate([-3/2,61.7/2,3]) rotate([-90,0,0]) cylinder(d=1,h=20);
    translate([3/2,61.7/2,3]) rotate([-90,0,0]) cylinder(d=1,h=20);

    translate([-3/2,-61.7/2,3]) rotate([90,0,0]) cylinder(d=1,h=20);
    translate([3/2,-61.7/2,3]) rotate([90,0,0]) cylinder(d=1,h=20);
    
}

w = 26.8 + 3;
l = 62.3 + 3;

module box_bottom() {
    h = 7;
    difference() {
        union() {
            translate([0,0,h/2]) rounded_cube_side(w,l,h,4,center=true);
            translate([0,0,(h+1)/2]) rounded_cube_side(8,l+15,h+1,4,center=true);
        }
        difference() {
            translate([0,0,h+1.4]) cube([26.8,62.3,h*2],center=true);
            translate([26.2/2-2.6,61.7/2-2.8,0]) cylinder(d=7,h=4,$fn=50);
            translate([-26.2/2+2.5,61.7/2-2.8,0]) cylinder(d=7,h=4,$fn=20);
            translate([26.2/2-2.6,-61.7/2+2.8,0]) cylinder(d=7,h=4,$fn=20);
            translate([-26.2/2+2.5,-61.7/2+2.8,0]) cylinder(d=7,h=4,$fn=20);
        }
        translate([26.2/2-2.6,61.7/2-2.8,0]) {
            cylinder(d=3.2,h=15,center=true,$fn=20);
            cylinder(d1=7.2,d2=3.2,h=2,$fn=20);
        }
        translate([-26.2/2+2.5,61.7/2-2.8,0]) {
            cylinder(d=3.2,h=15,center=true,$fn=20);
            cylinder(d1=7.2,d2=3.2,h=2,$fn=20);
        }
        translate([26.2/2-2.6,-61.7/2+2.8,0]) {
            cylinder(d=3.2,h=15,center=true,$fn=20);
            cylinder(d1=7.2,d2=3.2,h=2,$fn=20);
        }
        translate([-26.2/2+2.5,-61.7/2+2.8,0]) {
            cylinder(d=3.2,h=15,center=true,$fn=20);
            cylinder(d1=7.2,d2=3.2,h=2,$fn=20);
        }
        
        translate([0,0,h+2]) rotate([90,0,0]) cylinder(d=4,h=l+20,center=true,$fn=30);
        
        translate([w/2,-l/2+12/2+8.2,h+1]) cube([3,12,5],center=true);

        translate([-20/2,-l/2-7.5,-2]) hull() {
            cube([20,7.5,1]);
            cube([20,0.01,8.5]);
        }
        mirror([0,1,0]) translate([-20/2,-l/2-7.5,-2]) hull() {
            cube([20,7.5,1]);
            cube([20,0.01,8.5]);
        }

    }
    %translate([0,0,4+1.6/2]) mock_buck();
}

module box_top() {
    h = 16;
    difference() {
        union() {
            difference() {
                union() {
                    translate([0,0,h/2]) rounded_cube_side(w,l,h,4,center=true);
                    translate([0,0,(h-1)/2]) rounded_cube_side(8,l+15,h-1,4,center=true);
                }
                translate([0,0,h+1.4]) cube([26.8,62.3,h*2],center=true);
            }
            
            translate([26.2/2-2.6,61.7/2-2.8,0]) cylinder(d=6,h=h+3-1.6,$fn=50);
            translate([-26.2/2+2.5,61.7/2-2.8,0]) cylinder(d=6,h=h+3-1.6,$fn=50);
            translate([26.2/2-2.6,-61.7/2+2.8,0]) cylinder(d=6,h=h+3-1.6,$fn=50);
            translate([-26.2/2+2.5,-61.7/2+2.8,0]) cylinder(d=6,h=h+3-1.6,$fn=50);
        }
            
        translate([26.2/2-2.5,61.7/2-2.8,0]) cylinder(d=2.8,h=35,center=true,$fn=20);
        translate([-26.2/2+2.6,61.7/2-2.8,0]) cylinder(d=2.8,h=35,center=true,$fn=20);
        translate([26.2/2-2.5,-61.7/2+2.8,0]) cylinder(d=2.8,h=35,center=true,$fn=20);
        translate([-26.2/2+2.6,-61.7/2+2.8,0]) cylinder(d=2.8,h=35,center=true,$fn=20);
        
        translate([-26.2/2+0.8+1.2,9.5+2.5-1.2,0]) cylinder(d=3,h=5,center=true,$fn=20);
        translate([-26.2/2+0.8+1.2,1.5-1.2,0]) cylinder(d=3,h=5,center=true,$fn=20);
        
        translate([0,0,h]) rotate([90,0,0]) cylinder(d=4,h=l+20,center=true,$fn=30);
        
        translate([0,0,h]) cube([8.2,l+1,2],center=true);
        
        translate([-20/2,-l/2-7.5]) hull() {
            cube([20,7.5,h-2.5-7.5]);
            cube([20,0.01,h-2.5]);
        }
        mirror([0,1,0]) translate([-20/2,-l/2-7.5]) hull() {
            cube([20,7.5,h-2.5-7.5]);
            cube([20,0.01,h-2.5]);
        }
        
        translate([w/2+3/2-1.6,0,h+3/2]) cube([3,l,3],center=true);
        translate([-w/2-3/2+1.6,0,h+3/2]) cube([3,l,3],center=true);
        
        translate([0,l/2+3/2-1.6,h+3/2]) cube([w,3,3],center=true);
        translate([0,-l/2-3/2+1.6,h+3/2]) cube([w,3,3],center=true);
        
    }
}

module debug() {
    intersection() {
        union() {
            box_bottom();
            translate([0,0,23]) rotate([0,180,0]) box_top();
        }
        translate([0,-5,0]) cube([100,100,100]);
    }
}
//mock_buck();
//debug();
box_bottom();
translate([40,0,0]) box_top();