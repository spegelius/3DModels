use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;

module round_tooth(height) {
    hull() {
        cube([1,1,height]);

        translate([0.5,1,0])
        cylinder(d=1,h=height,$fn=10);
    }
}
    
module tooth(height) {
    cube([1,1.55,height]);
}

module gt2_belt(length=10, height=6) {
    
    cube([length,0.9,height]);
    teeth = round(length/2);
    for(i = [0:teeth-1]) {
        translate([i*2,0,0])
        tooth(height);
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

            translate([0,0,-0.1])
            cylinder(d=dia-0.9, h=height+1,$fn=60);

            rotate([0,0,start_angle()])
            translate([0,-(dia+1)/2,-0.1])
            cube([dia+1,dia+1,height+1]);

            rotate([0,0,-start_angle()])
            translate([-(dia+1),-(dia+1)/2,-0.1])
            cube([dia+1,dia+1,height+1]);
        }
        for (i = [0:steps-1]) {
            rotate([0,0,step*i+start_angle()])
            translate([0,tooth_pos(),0])
            translate([-1/2,0,0]) tooth(height);
        }
    }
}

module tronxy_belt_clip_left_top() {
    difference() {
        cube([20,8,19]);

        translate([0,5/2+0.5,11])
        rotate([0,0,18])
        mirror([0,1,0])
        rounded_gt2_belt(14, 50, 9, teeth_inside=false);

        translate([13.5,0,0])
        cube([3.5,3,20]);

        translate([13.5,1,0])
        cube([4.5,2,20]);

        translate([15,0,14.5])
        cube([6,3,10]);

        translate([8.5,0,13])
        cube([6,3,10]);

        translate([8.5,3,13])
        rotate([0,0,-45])
        translate([0,-5,0]) cube([6,5,10]);

        rotate([0,45,0])
        cube([10,20,10],center=true);

        translate([-0.8,26.3,0])
        cylinder(d=39,h=30,$fn=70);

        translate([24.5,20,0])
        cylinder(d=30,h=30,$fn=70);
    }
}

module tronxy_belt_clip_right_top() {
    difference() {
        hull() {
            cylinder(d=11,h=20,$fn=30);

            translate([3,-11/2-6,0])
            cube([15,12,20]);
        }
        cylinder(d=4.3,h=21, $fn=30);

        translate([18,-33.7,0])
        cylinder(d=50,h=25,$fn=50);

        translate([20,11.5,0])
        cylinder(d=30,h=25,$fn=50);

        translate([-12+5.1,-12,15.5])
        cube([12,18,10]);

        translate([1,-11/2-4.05,20-8])
        rotate([0,0,16])
        mirror([0,0,0])
        rounded_gt2_belt(18, 60, 9);
        
        //%translate([18,0,0]) cylinder(d=11,h=5,$fn=30);
    }
}

module tronxy_belt_clip_left_bottom() {
    difference() {
        union() {
            hull() {
                cylinder(d=11,h=11,$fn=30);

                translate([3,-6,0])
                cube([13,18,11]);
            }
            cylinder(d=11,h=18.5,$fn=30);

            translate([5,-6,0])
            cube([8,11,22]);
        }
        cylinder(d=4.3,h=19, $fn=30);

        translate([17,33.7,0])
        cylinder(d=50,h=25,$fn=50);

        translate([21,-10,0])
        cylinder(d=30,h=25,$fn=50);

        translate([-12+5.1,-6,0])
        cube([12,18,3]);

        translate([13,-6,0])
        cube([12,18,3]);

        translate([0,11/2+4.05,4])
        rotate([0,0,-16])
        mirror([0,1,0])
        rounded_gt2_belt(18, 60, 7);
        
        //%translate([18,0,0]) cylinder(d=11,h=5,$fn=30);
    }
}

module tronxy_belt_clip_right_bottom() {
    difference() {
        cube([20,8,16]);

        translate([6,5/2+5.1,2])
        rotate([0,0,-18])
        mirror([0,1,0])
        rounded_gt2_belt(14, 50, 8, teeth_inside=false);

        translate([3,0,0])
        cube([3.5,3,20]);

        cube([3.5,3,2]);

        translate([2,1,0])
        cube([4.5,2,20]);

        translate([4,-1,0])
        cube([20,2,20]);
        
        translate([25,22,9.8])
        cylinder(d=50,h=30,$fn=70);

        translate([25,21,15])
        cylinder(d=56,h=30,$fn=70);

        rotate([0,45,0])
        cube([4,25,4],center=true);
    }
}

module tronxy_E3D_mount() {
    difference() {
        import("../../_downloaded/Tronxy X5s e3d v6 Mount With Belt Aligner/tronxy_x5s_e3d_v6_mtg_+_belt_aligner_r1.STL", convexity=3);

        translate([-23.5,3,0])
        cube([20,50,25]);

        translate([70.5,4,0])
        cube([20,50,25]);

        translate([72.5,-4,0])
        cube([20,50,25]);
    }
    %translate([1.5,3,11.5])
    rotate([-90,180,0])
    tronxy_belt_clip_left_bottom();

    %translate([65.5,6,11.5])
    rotate([-90,0,0])
    tronxy_belt_clip_right_top();

    %translate([-15,3,0])
    rotate([-90,0,0])
    tronxy_belt_clip_left_top();

    %translate([62.5,6,0])
    rotate([-90,0,0])
    tronxy_belt_clip_right_bottom();
}

tronxy_belt_clip_left_top();
//tronxy_belt_clip_right_top();
//tronxy_belt_clip_left_bottom();
//tronxy_belt_clip_right_bottom();
//tronxy_E3D_mount();
