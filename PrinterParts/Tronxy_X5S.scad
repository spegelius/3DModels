
use <../PCParts/common.scad>;
include <../Dollo/New_long_ties/globals.scad>;
use <../Dollo/New_long_ties/include.scad>;

module round_tooth(height) {
    hull() {
        cube([1,1,height]);
        translate([0.5,1,0]) cylinder(d=1,h=height,$fn=10);
    }
}
    
module tooth(height) {
    cube([1,1.55,height]);
}

module gt2_belt(length=10, height=6) {
    
    cube([length,0.9,height]);
    teeth = round(length/2);
    for(i = [0:teeth-1]) {
        translate([i*2,0,0]) tooth(height);
    }
}

module rounded_gt2_belt(length, dia, height=6, teeth_inside=true) {
    
    total_len = PI * dia;
    step = 2/(total_len/360);
    
    steps = round(length/2);
    
    function tooth_pos() = teeth_inside ? dia/2-1.57+0.9/2 : dia/2-0.9/2;
    function start_angle() = -steps/2 * step;
        
    translate([length/2,-dia/2,0]) union() {
        difference() {
            cylinder(d=dia+0.9, h=height,$fn=60);
            translate([0,0,-0.1]) cylinder(d=dia-0.9, h=height+1,$fn=60);
            rotate([0,0,start_angle()]) translate([0,-(dia+1)/2,-0.1]) cube([dia+1,dia+1,height+1]);
            rotate([0,0,-start_angle()]) translate([-(dia+1),-(dia+1)/2,-0.1]) cube([dia+1,dia+1,height+1]);
        }
        for (i = [0:steps-1]) {
            rotate([0,0,step*i+start_angle()]) translate([0,tooth_pos(),0]) translate([-1/2,0,0]) tooth(height);
        }
    }
}

module tronxy_belt_clip_left_top() {
    difference() {
        cube([20,8,19]);
        translate([0,5/2+0.5,13]) rotate([0,0,18]) mirror([0,1,0]) rounded_gt2_belt(14, 50, 7, teeth_inside=false);
        translate([13.5,0,0]) cube([3.5,3,20]);
        translate([13.5,1,0]) cube([4.5,2,20]);
        translate([15,0,14.5]) cube([6,3,10]);
        translate([8.5,0,13]) cube([6,3,10]);
        translate([8.5,3,13]) rotate([0,0,-45]) translate([0,-5,0]) cube([6,5,10]);
        
        rotate([0,45,0]) cube([10,20,10],center=true);
        
        translate([-0.5,26,0]) cylinder(d=40,h=30,$fn=70);
        translate([23.5,20,0]) cylinder(d=30,h=30,$fn=70);
    }
}

module tronxy_belt_clip_right_top() {
    difference() {
        hull() {
            cylinder(d=11,h=20,$fn=30);
            translate([3,-11/2-6,0]) cube([15,12,20]);
        }
        cylinder(d=4.3,h=21, $fn=30);
        translate([18,-33.7,0]) cylinder(d=50,h=25,$fn=50);
        translate([20,11.5,0]) cylinder(d=30,h=25,$fn=50);
        translate([-12+5.1,-12,15]) cube([12,18,10]);
        translate([1,-11/2-4.05,20-7]) rotate([0,0,16]) mirror([0,0,0]) rounded_gt2_belt(18, 60, 7);
        
        //%translate([18,0,0]) cylinder(d=11,h=5,$fn=30);
    }
}

module tronxy_belt_clip_left_bottom() {
    difference() {
        union() {
            hull() {
                cylinder(d=11,h=11,$fn=30);
                translate([3,-6,0]) cube([13,18,11]);
            }
            cylinder(d=11,h=18,$fn=30);
            translate([5,-6,0]) cube([8,11,22]);
        }
        cylinder(d=4.3,h=19, $fn=30);
        translate([17,33.7,0]) cylinder(d=50,h=25,$fn=50);
        translate([21,-10,0]) cylinder(d=30,h=25,$fn=50);
        translate([-12+5.1,-6,0]) cube([12,18,3]);
        translate([13,-6,0]) cube([12,18,3]);
        #translate([0,11/2+4.05,4]) rotate([0,0,-16]) mirror([0,1,0]) rounded_gt2_belt(18, 60, 7);
        
        //%translate([18,0,0]) cylinder(d=11,h=5,$fn=30);
    }
}

module tronxy_belt_clip_right_bottom() {
    difference() {
        cube([20,8,16]);
        translate([6,5/2+5.1,3]) rotate([0,0,-18]) mirror([0,1,0]) rounded_gt2_belt(14, 50, 7, teeth_inside=false);
        translate([3,0,0]) cube([3.5,3,20]);
        cube([3.5,3,2]);
        translate([2,1,0]) cube([4.5,2,20]);
        
        translate([4,-1,0]) cube([20,2,20]);
        
        translate([25,22,9.8]) cylinder(d=50,h=30,$fn=70);
        translate([25,21,15]) cylinder(d=56,h=30,$fn=70);
        
        rotate([0,45,0]) cube([4,25,4],center=true);
    }
}

module pin_header(pins) {
    color("silver") for (i=[0:pins-1]) {
        translate([i*2.54,0,0]) cube([0.6,0.6, 11.5]);
    }
    w = pins * 2.54;
    color("black") translate([-2.54/2+0.3,-2.54/2+0.3,3]) cube([w, 2.45, 2.45]);
}

module pin_connector(pins) {
    cube([pins*2.54,2.45,14]);
}

module hotend_pcb() {
    difference() {
        cube([23,28,1]);
        translate([-0.4,-0.4,0]) for (i = [0:12]) {
            for (j = [0:12]) {
                translate([i*2.54,j*2.54,0]) cube([0.8,0.8,2]);
            }
        }
    }
    
    translate([0.66+2*2.54,0.02+3*2.54,1]) mock_fan_connector_male();
    translate([0.66+2*2.54,0.02+8*2.54,1]) mock_fan_connector_male();
    
    translate([-0.3+5*2.54,0.3+3*2.54,-2]) rotate([0,0,-90]) pin_header(2);
    
    translate([-0.3+5*2.54,0.3+9*2.54,-2]) rotate([0,0,-90]) pin_header(4);
}

module tronxy_cable_pcb_mount() {
    w = 40;
    l = 44;
    difference() {
        union() {
            cube([w,l,3]);
            cube([4,22,22]);
            translate([0,20.1,0]) cube([9,2,22]);
            cube([7,22,5.2]);
        }
        translate([9,0,3]) rotate([0,-15,0]) cube([12,24,25]);
        translate([-0.1,2,5.2]) cube([2.1,18.1,22]);
        
        translate([0,2+5,5.2+9]) rotate([0,90,0]) cylinder(d=3.3,h=5,$fn=20);
        translate([0,2+18-5,5.2+9]) rotate([0,90,0]) cylinder(d=3.3,h=5,$fn=20);
        
        translate([13,9,-0.1]) cube([21,26,4]);
        translate([12,8,1.5]) cube([23,28,4]);
        
        translate([23.5,4,-0.1]) cylinder(d=3.3,h=5,$fn=20);
        translate([23.5,l-4,-0.1]) cylinder(d=3.3,h=5,$fn=20);
    }
    
    translate([42,0,0]) difference() {
        union() {
            hull() {
                translate([26/2,4,0]) cylinder(d=7,h=2,$fn=20);
                translate([0,6,0]) cube([26,l-12,2]);
                translate([26/2,l-4,0]) cylinder(d=7,h=2,$fn=20);
            }
            translate([26/2,4]) cylinder(d=8,h=5,$fn=20);
            translate([26/2,l-4]) cylinder(d=8,h=5,$fn=20);

        }
        translate([3,(l-25)/2,-0.1]) cube([20,25,14]);
        translate([26/2,4]) cylinder(d=3.3,h=5,$fn=20);
        translate([26/2,l-4]) cylinder(d=3.3,h=5,$fn=20);
        
        translate([26/2,4,3]) nut();
        translate([26/2,l-4,3]) nut();
    }
}

module tronxy_bed_spacer() {
    difference() {
        cube([35,10,15],center=true);
        translate([-10,0,0]) cylinder(d=4.5,h=16,center=true,$fn=40);
        translate([10,0,0]) cylinder(d=4.5,h=16,center=true,$fn=40);
    }
}

module tronxy_motor_mount() {
    h = 20;
    
    d = 199.7;
    
    difference() {
        union() {
            difference() {
                intersection() {
                    translate([d/2-25,d/3+25,0]) difference() {
                        cylinder(d=d,h=h,$fn=100);
                        cylinder(d=d-50,h=h*2.1,$fn=100,center=true);
                    }
                    translate([-28,0,0]) cube([d/2+10,210,h]);
                }
                translate([87,205,0]) rotate([0,0,-40]) cube([40,40,h*2.1],center=true);
            }
            chamfered_cube_side(28,35,h,3);
            translate([87,200,7.6/2]) rotate([0,0,-40]) hull() {
                rounded_cube_side(42,50,7.6,8, center=true);
                translate([-2,-45,0]) cube([5,1,7.6],center=true);
            }
             
        }
        translate([8,7,-0.1]) cube([25,20.2,h+1]);
        translate([28,-0.1,-0.1]) cube([70,50,h+1]);
        translate([0,7+20.2/2,h/2]) rotate([0,90,0]) cylinder(d=4.4,h=10,$fn=40);
                
        translate([57,204,7.6]) rotate([45,0,-40]) cube([50,40,40]);
        translate([69,125.9,-0.1]) rotate([0,0,8.6]) cube([40,40,40]);
        
        translate([87,200,-0.1]) rotate([0,0,-40]) translate([0,4.5,0]) motor_plate_holes(8, center_chamfer=false);
    }
}

//gt2_belt();
//rounded_gt2_belt(10, 30);
//tronxy_belt_clip_left_top();
//tronxy_belt_clip_right_top();
//tronxy_belt_clip_left_bottom();
//tronxy_belt_clip_right_bottom();
//hotend_pcb();
//tronxy_cable_pcb_mount();
//tronxy_bed_spacer();
tronxy_motor_mount();
