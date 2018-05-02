use <../lib/includes.scad>;

diff = 2.5;

y_offset = (56-50)/2;
x_offset = (138.5-132)/2;

feet_dia = 7;

module mock_relay_board() {

    difference() {
        cube([138.5, 56, 1]);
        translate([x_offset, y_offset,0]) cylinder(d=3, h=2, $fn=30);
        translate([132+x_offset, y_offset,0]) cylinder(d=3, h=2, $fn=30);
        translate([132+x_offset, 50+y_offset,0]) cylinder(d=3, h=2, $fn=30);
        translate([x_offset, 50+y_offset,0]) cylinder(d=3, h=2, $fn=30);
    }
}

module mock_connector_board() {


    difference() {
        cube([31.5, 40, 1]);
        
        translate([2*diff, 2*diff,0]) cylinder(d=3, h=2, $fn=30);
        translate([10*diff, 2*diff,0]) cylinder(d=3, h=2, $fn=30);
        translate([2*diff, 14*diff,0]) cylinder(d=3, h=2, $fn=30);
        translate([10*diff, 14*diff,0]) cylinder(d=3, h=2, $fn=30);
    }
}

module box() {
    difference() {
        intersection() {
            cube([185,70,35]);
            translate([0,0,-7]) rounded_cube(185,70,47, 7);
        }
        difference() {
            translate([1.5, 1.5, 1.5]) rounded_cube(182,67,44, 4);
            
            translate([3.5, 3.5, 30]) hull() {
                cylinder(d=7, h=4, $fn=50);
                translate([-2.5,-2.5,-6]) cylinder(d=0.5, h=0.5);
            }
            translate([185-3.5, 3.5, 30]) hull() {
                cylinder(d=7, h=4, $fn=50);
                translate([2.5,-2.5,-6]) cylinder(d=0.5, h=0.5);
            }
            translate([3.5, 70-3.5, 30]) hull() {
                cylinder(d=7, h=4, $fn=50);
                translate([-2.5,2.5,-6]) cylinder(d=0.5, h=0.5);
            }
            translate([185-3.5, 70-3.5, 30]) hull() {
                cylinder(d=7, h=4, $fn=50);
                translate([2.5,2.5,-6]) cylinder(d=0.5, h=0.5);
            }
        }
        translate([3.5, 3.5, 30]) cylinder(d=2.8, h=6, $fn=30);
        translate([185-3.5, 3.5, 30]) cylinder(d=2.8, h=6, $fn=30);
        translate([3.5, 70-3.5, 30]) cylinder(d=2.8, h=6, $fn=30);
        translate([185-3.5, 70-3.5, 30]) cylinder(d=2.8, h=6, $fn=30);
        
        
        translate([20, 70/2, 0]) hull() {
            cube([20,20,0.1], center=true);
            translate([0,0,1.9]) cube([20,22,0.1], center=true);
        }
        
        translate([185-40, 70/2, 0]) hull() {
            cube([20,20,0.1], center=true);
            translate([0,0,1.9]) cube([20,22,0.1], center=true);
        }
        translate([30,70/2-23/2,-1]) rounded_cube(21,23,4,1);
        translate([185-30,70/2-23/2,-1]) rounded_cube(21,23,4,1);
        
        translate([183, 15, 20]) rotate([0,90,0]) cylinder(d=15,h=2);
        translate([183, 35, 20]) rotate([0,90,0]) cylinder(d=15,h=2);
        translate([183, 55, 20]) rotate([0,90,0]) cylinder(d=15,h=2);
    }
    
    difference() {
        translate([145,15,1]) {
            translate([2*diff, 2*diff,0]) cylinder(d=feet_dia, h=3, $fn=30);
            translate([10*diff, 2*diff,0]) cylinder(d=feet_dia, h=3, $fn=30);
            translate([2*diff, 14*diff,0]) cylinder(d=feet_dia, h=3, $fn=30);
            translate([10*diff, 14*diff,0]) cylinder(d=feet_dia, h=3, $fn=30);
        }
        translate([145,15,1]) {
            translate([2*diff, 2*diff,0]) cylinder(d=2.8, h=3, $fn=30);
            translate([10*diff, 2*diff,0]) cylinder(d=2.8, h=3, $fn=30);
            translate([2*diff, 14*diff,0]) cylinder(d=2.8, h=3, $fn=30);
            translate([10*diff, 14*diff,0]) cylinder(d=2.8, h=3, $fn=30);
        }
    }
    difference() {
        translate([3,7,1]) {
            translate([x_offset, y_offset,0]) cylinder(d=feet_dia, h=3, $fn=30);
            translate([132+x_offset, y_offset,0]) cylinder(d=feet_dia, h=3, $fn=30);
            translate([132+x_offset, 50+y_offset,0]) cylinder(d=feet_dia, h=3, $fn=30);
            translate([x_offset, 50+y_offset,0]) cylinder(d=feet_dia, h=3, $fn=30);
        }
        translate([3,7,1]) {
            translate([x_offset, y_offset,0]) cylinder(d=2.8, h=3, $fn=30);
            translate([132+x_offset, y_offset,0]) cylinder(d=2.8, h=3, $fn=30);
            translate([132+x_offset, 50+y_offset,0]) cylinder(d=2.8, h=3, $fn=30);
            translate([x_offset, 50+y_offset,0]) cylinder(d=2.8, h=3, $fn=30);
        }
    }
    
}

module lid() {
    difference() {
        union() {
            intersection() {
                cube([185,70,2]);
                translate([0,0,-10]) rounded_cube(185,70,20,7);
            }
            translate([1.75,1.75,2]) intersection() {
                translate([181.5/2,66.5/2,1.6/2]) difference() {
                    cube([181.5,66.5,1.6], center=true);
                    cube([170,55,2], center=true);
                }
                translate([0,0,-10]) rounded_cube(181.5,66.5,20,4);
            }
        }
        translate([3.5, 3.5, 3]) cylinder(d=7.5, 20, $fn=30);
        translate([185-3.5, 3.5, 3]) cylinder(d=7.5, 20, $fn=30);
        translate([185-3.5, 70-3.5, 3]) cylinder(d=7.5, 20, $fn=30);
        translate([3.5, 70-3.5, 3]) cylinder(d=7.5, 20, $fn=30);
        
        translate([3.5, 3.5, 0]) hull() {
            cylinder(d=5.2, h=0.1, $fn=30);
            translate([0,0,0.9]) cylinder(d=3.2, h=0.1, $fn=30);
        }
        translate([3.5,3.5,1]) cylinder(d=3.2, h=2, $fn=30);
        
        translate([185-3.5, 3.5, 0]) hull() {
            cylinder(d=5.2, h=0.1, $fn=30);
            translate([0,0,0.9]) cylinder(d=3.2, h=0.1, $fn=30);
        }
        translate([185-3.5, 3.5, 1]) cylinder(d=3.2, h=2, $fn=30);
        
        translate([185-3.5, 70-3.5, 0]) hull() {
            cylinder(d=5.2, h=0.1, $fn=30);
            translate([0,0,0.9]) cylinder(d=3.2, h=0.1, $fn=30);
        }
        translate([185-3.5, 70-3.5, 1]) cylinder(d=3.2, h=2, $fn=30);
        
        translate([3.5, 70-3.5, 0]) hull() {
            cylinder(d=5.2, h=0.1, $fn=30);
            translate([0,0,0.9]) cylinder(d=3.2, h=0.1, $fn=30);
        }
        translate([3.5, 70-3.5, 1]) cylinder(d=3.2, h=2, $fn=30);
        
        for (i=[0:13]) {
            translate([27+i*10,70/2,0]) {
                hull() {
                    translate([5,15,0]) cylinder(d=3,h=5, $fn=30);
                    translate([-5,-15,0]) cylinder(d=3,h=5, $fn=30);
                }
            }
        }
    }
}

module clip() {
    difference() {
        translate([-10, -11, 0]) hull() {
            rounded_cube(20,20,0.1, 2);
            translate([0,-1,1.9]) rounded_cube(20,22,0.1, 2);
        }
        cylinder(d=3, h=2, $fn=30);
        hull() {
            translate([0,0,1]) cylinder(d=3, h=2, $fn=30);
            translate([0,0,2]) cylinder(d=5,h=0.1, $fn=30);
        }
    }
}

//%translate([3,7,4]) mock_relay_board();
//%translate([145,15,4]) mock_connector_board();

box();
//lid();
//translate([0,0,37]) mirror([0,0,1]) lid();
//clip();