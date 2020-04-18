
include <../Dollo/New_long_ties/globals.scad>;
use <../Dollo/New_long_ties/include.scad>;
use <../_downloaded/Customizable_Nano_watchband/nano.scad>;

module mock_unit() {
    
    module arc() {
        translate([0,-(160-6)/2,0]) intersection() {
            difference() {
                cylinder(d=160,h=15.4,$fn=100,center=true);
                cylinder(d=160-2*6,h=15.5,$fn=100,center=true);
                cylinder(d1=160-2*6+2.5,d2=160-2*6+2.5-2*16.5,h=16.5,$fn=100,center=true);
                cylinder(d2=160-2*6+2.5,d1=160-2*6+2.5-2*16.5,h=16.5,$fn=100,center=true);
            }
            hull() {
                cylinder(d=0.1,h=15.4,center=true);
                translate([0,160/2-5/2+1.1,0]) cube([40.5,5,15.4],center=true);
            }
        }
    }
    
    arc();
}

module _holder() {
    difference() {
        translate([0,0,0.5]) rounded_cube(45,18,11,5,center=true);
        //rounded_cube_side(45,18,10,6,center=true);
        rotate([-90,0,0]) mock_unit();
        
        rounded_cube_side(30,11,15,2,center=true);
        
        translate([18.4,0,4]) rounded_cube_side(3.5,15.4,7,1,center=true);
        translate([-18.4,0,4]) rounded_cube_side(3.5,15.4,7,1,center=true);
        
        translate([0,0,4]) cube([34,14.5,5],center=true);
        translate([0,0,2]) cube([8.2,26,8],center=true);
        
        translate([-17,0,4]) cube([1,19,10],center=true);
        translate([17,0,4]) cube([1,19,10],center=true);
        
        translate([0,0,140/2+3.3]) rotate([90,0,0]) cylinder(d=140,h=20,center=true,$fn=100);
        
        translate([8,10,-0.3]) rotate([90,0,0]) cylinder(d=1.5,h=5,center=true,$fn=20);
        translate([10.3,10,-0.05]) rotate([90,0,0]) cylinder(d=1.5,h=5,center=true,$fn=20);
        translate([12.6,10,0.1]) rotate([90,0,0]) cylinder(d=1.5,h=5,center=true,$fn=20);
        
        translate([45/2,0,-10/2]) rotate([0,45,0]) cube([5,20,5],center=true);
        translate([-45/2,0,-10/2]) rotate([0,45,0]) cube([3.5,20,3.5],center=true);
    }
}

module holder() {
    
    module _link() {
        intersection() {
            link();
            translate([7/2,0,0]) cube([10,25,10],center=true);
        }
    }
    
    module new_link() {
        union() {
            _link();
            translate([0,0,-6.2]) difference() {
                linear_extrude(5) {
                    projection(true) {
                        translate([0,0,1.15]) _link();
                    }
                }
                translate([5,0,0.5]) rotate([0,45,0]) cube([6.2,20,9],center=true);
                translate([0,10,0.5]) rotate([57,0,0]) cube([19,7,6],center=true);
                translate([0,-10,0.5]) rotate([33,0,0]) cube([19,6,7],center=true);
            }
        }
    }
        
    
    union() {
        _holder();
        translate([45/2+2,0,3.2]) connector();
        translate([45/2+2,0,3.2]) mirror([0,1,0]) connector();
        translate([45/2,0,3.2]) cube([3,12.4,3.5],center=true);
        //translate([45/2+1,0,1]) rotate([0,45,0]) rounded_cube(2,12.4,5,2,center=true);
        translate([45/2+1,0,1.2]) rotate([0,45,0]) cube([2,12.4,5],center=true);
     
        translate([-45/2+0.5,0,3.2]) rotate([0,1,180]) {
            new_link();
//            translate([-0.1,9.8,0]) rotate([0,0,90]) intersection() {
//                rotate([90,0,45]) scale([0.75,1,1]) cylinder(r=1.8,h=5,center=true,$fn=18);
//                translate([-0.1,-0.1,-5/2]) cube([5,5,5]);
//            }
//            translate([-0.1,-9.8,0]) rotate([0,0,180]) intersection() {
//                rotate([90,0,45]) scale([0.75,1,1]) cylinder(r=1.8,h=5,center=true,$fn=18);
//                translate([-0.1,-0.1,-5/2]) cube([5,5,5]);
//            }
        }
    }
}

//mock_unit();
holder();
