include <../Dollo/NEW_long_ties/include.scad>;


module mock_radiator() {
    rounded_cube(131.3, 400, 38.8,2);
}


module back_clip() {
    difference() {
        union() {
            cube([40,15,43]);
            translate([0,-15,0]) cube([40,19,4]);
            hull() {
                translate([0,-14,1]) cube([2,17,3]);
                translate([0,0,1]) cube([2,1,18]);
                translate([0,0,1]) cube([12,1,1]);
            }
            hull() {
                translate([40-2,-14,0]) cube([2,17,4]);
                translate([40-2,0,0]) cube([2,1,18]);
                translate([40-12,0,0]) cube([12,1,1]);
            }

        }
        translate([-1,4,-1]) cube([42,20,40]);
        translate([7,-10,-1]) cylinder(d=4.3,h=7,$fn=20);
        translate([7,-10,4]) cylinder(d=8.3,h=7,$fn=20);
        translate([40-7,-10,-1]) cylinder(d=4.3,h=7,$fn=20);
        translate([40-7,-10,4]) cylinder(d=8.3,h=7,$fn=20);
    }
}

module front_clip() {
    intersection() {
        difference() {
            union() {
                cube([30,30,43]);
                cube([42,42,4]);
                translate([0,27,1]) hull() {
                    cube([2,14,3]);
                    cube([2,1,15]);
                }
                translate([27,0,1]) hull() {
                    cube([14,2,3]);
                    cube([1,2,15]);
                }
                translate([28.3,27,1]) rotate([0,0,45]) hull() {
                    cube([9,2,3]);
                    cube([1,2,19]);
                }
                // support
                translate([29,-0.7,43-25]) rotate([0,0,-45]) cube([5,2,25]);

            }
            cube([26,26,39]);
            cylinder(d=34,h=50,$fn=50);
            
            translate([10,36,0]) cylinder(d=4.3,h=7,$fn=20);
            translate([36,10,0]) cylinder(d=4.3,h=7,$fn=20);
        }
        translate([20,20,0]) rotate([0,0,45]) cube([40,50,90],center=true);
    }
}

module debug() {
    back_clip();
    translate([91.3-26,400-22,0]) front_clip();
    
    %translate([-40,4,0]) mock_radiator();
}

//rotate([0,-90,0]) back_clip();
rotate([90,45,0]) front_clip();
//debug();