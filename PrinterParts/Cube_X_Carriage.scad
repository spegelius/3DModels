
include <../_downloaded/Dollo/NEW_Long_ties/mockups.scad>;
include <../_downloaded/Dollo/NEW_Long_ties/globals.scad>;
include <../_downloaded/Dollo/NEW_Long_ties/include.scad>;

slop = 0.15;
nozzle=0.4;

module mock_slide() {
    difference() {
        cube([28.7, 8, 20], center=true);
        translate([5,-8/2-0.1,7.5]) rotate([-90,0,0]) cylinder(d=3, h=3.6, $fn=20);
        translate([5,-8/2-0.1,-7.5]) rotate([-90,0,0]) cylinder(d=3, h=3.6, $fn=20);
        translate([-5,-8/2-0.1,7.5]) rotate([-90,0,0]) cylinder(d=3, h=3.6, $fn=20);
        translate([-5,-8/2-0.1,-7.5]) rotate([-90,0,0]) cylinder(d=3, h=3.6, $fn=20);
    }
}

module belt_teeth(){
    difference() {
        union() {
            cube([14,19,4],center=true);
            translate([0,1,2]) cube([14,2,4],center=true);
            for (i=[0:6]) {
                translate([-6+i*2,0,4/2]) cube([1,15,0.8],center=true);
            }
        }
        translate([-12,0,-3.7]) rotate([90,0,0]) cylinder(d=15,h=19,$fn=40);
        translate([12,0,-3.7]) rotate([90,0,0]) cylinder(d=15,h=19,$fn=40);
        translate([-7.55,-9.5,0]) cube([14,4,7],center=true);
        translate([4.5,-12.75,0]) rotate([0,0,-30]) cube([14,4,7],center=true);
    }
}

module body() {
    depth = 20;
    screw_head_depth = depth-(12-3.5);
    difference() {
        cube([50,depth,30], center=true);
        
        // screw holes
        translate([5,-depth/2-0.1,7.5-5]) rotate([-90,0,0]) cylinder(d=3, h=30, $fn=20);
        translate([5,-depth/2-0.1,-7.5-5]) rotate([-90,0,0]) cylinder(d=3, h=30, $fn=20);
        translate([-5,-depth/2-0.1,7.5-5]) rotate([-90,0,0]) cylinder(d=3, h=30, $fn=20);
        translate([-5,-depth/2-0.1,-7.5-5]) rotate([-90,0,0]) cylinder(d=3, h=30, $fn=20);

        // screw head holes
        translate([5,-depth/2-0.2,7.5-5]) rotate([-90,0,0]) cylinder(d=6, h=screw_head_depth, $fn=30);
        translate([5,-depth/2-0.2,-7.5-5]) rotate([-90,0,0]) cylinder(d=6, h=screw_head_depth, $fn=30);
        translate([-5,-depth/2-0.2,7.5-5]) rotate([-90,0,0]) cylinder(d=6, h=screw_head_depth, $fn=30);
        translate([-5,-depth/2-0.2,-7.5-5]) rotate([-90,0,0]) cylinder(d=6, h=screw_head_depth, $fn=30);
        
        // bewels
        translate([-35,4,0]) rotate([0,0,-45]) cube([20,40,60], center=true);
        translate([35,4,0]) rotate([0,0,45]) cube([20,40,60], center=true);
        translate([0,4.5,24.5]) rotate([-45,0,0]) cube([60,40,20], center=true);
        
        translate([-50/2+12,-depth/2,0]) rotate([0,0,45]) cube([5,5,40], center=true);
        translate([50/2-12,-depth/2,0]) rotate([0,0,45]) cube([5,5,40], center=true);
        
        translate([-50/2+5, -depth/2+5, -20]) cylinder(d=bolt_hole_dia,h=40, $fn=30);
        translate([50/2-5, -depth/2+5, -20]) cylinder(d=bolt_hole_dia,h=40, $fn=30);
    }
    
    translate([0,10,5+4/2+1.5]) rotate([180,0,0]) belt_teeth();
    
}

module mount() {
    difference() {
        union() {
            cube([50,40,40], center=true);
            translate([0,-20,20-22/2]) cube([29,30,22],center=true);
        }
        translate([0,20,0]) cube([55,20,30+slop*2], center=true);
        
        // bolt holes
        translate([-50/2+5, 10+5, -30]) cylinder(d=bolt_hole_dia,h=60, $fn=30);
        translate([50/2-5, 10+5, -30]) cylinder(d=bolt_hole_dia,h=60, $fn=30);
        
        translate([-50/2+5, 10+5, 40/2-2.5]) cylinder(d=bolt_head_hole_dia,h=60, $fn=30);
        translate([50/2-5, 10+5, 40/2-2.5]) cylinder(d=bolt_head_hole_dia,h=60, $fn=30);
        
        // nuts
        translate([-50/2+5, 10+5, -40/2]) nut();
        translate([50/2-5, 10+5, -40/2]) nut();

        // sides
        translate([-50/2-7,0,0]) rotate([0,0,19]) cube([20,49.2,50],center=true);
        translate([50/2+7,0,0]) rotate([0,0,-19]) cube([20,49.2,50],center=true);
        
        translate([0,-24.5,-10.3]) rotate([45,0,0]) cube([60,20,50],center=true);
        
        // hot end neck
        translate([0,-34, 10]) cylinder(d=12, h=20, $fn=40);
        
        // hot end body
        translate([0,-34, 0]) cylinder(d=27, h=20-5.4, $fn=60);
        translate([-10,-30.55, 4.6]) cube([20,20,20],center=true);
        
        // hot end clamp bolt holes
        translate([-50/2+15, -50, 20-5.4/2]) rotate([-90,0,0]) cylinder(d=bolt_hole_dia,h=30, $fn=30);
        translate([50/2-15, -50, 20-5.4/2]) rotate([-90,0,0]) cylinder(d=bolt_hole_dia,h=30, $fn=30);
        
        // hot end clamp nut holes
        translate([-50/2+15, -25, 20-5.4/2-0.1]) rotate([-90,0,0]) nut(h=2.6, cone=false);
        translate([50/2-15, -25, 20-5.4/2-0.1]) rotate([-90,0,0]) nut(h=2.6, cone=false);
        translate([-50/2+15, -25+2.6/2, 20-0.3]) cube([6.5,2.6,5], center=true);
        translate([50/2-15, -25+2.6/2, 20-0.3]) cube([6.5,2.6,5], center=true);

        // utility holes
        translate([14.5,9,15]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        translate([14.5,9,0]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        translate([14.5,9,-15]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([7.5,-10,15]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        translate([7.5,-10,0]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([11,0,15]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        translate([11,0,0]) rotate([0,90,-19]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([-14.5,9,15]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        translate([-14.5,9,0]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        translate([-14.5,9,-15]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([-7.5,-10,15]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        translate([-7.5,-10,0]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([-11,0,15]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        translate([-11,0,0]) rotate([0,-90,19]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([-13,3,11]) cylinder(d=2.5,h=10, $fn=30);
        translate([13,3,11]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([-9,-7,11]) cylinder(d=2.5,h=10, $fn=30);
        translate([9,-7,11]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([-5,-17,11]) cylinder(d=2.5,h=10, $fn=30);
        translate([5,-17,11]) cylinder(d=2.5,h=10, $fn=30);
        
        translate([0,3,11]) cylinder(d=2.5,h=10, $fn=30);
        translate([0,-7,11]) cylinder(d=2.5,h=10, $fn=30);

    }
    
    translate([-50/2+12,10,0]) rotate([0,0,45]) cube([5,5,40], center=true);
    translate([50/2-12,10,0]) rotate([0,0,45]) cube([5,5,40], center=true);

}

module mount_clamp(){
    difference() {
        union() {
            cube([29,10,5.4],center=true);
            translate([0,-5.1,5.4/2+0.1]) cube([22,8,11],center=true);
        }
        // hot end neck
        translate([0,6, -10]) cylinder(d=12, h=20, $fn=40);
        translate([0,6, 5.4/2]) cylinder(d=18, h=20, $fn=40);
        // hot end clamp bolt holes
        translate([-50/2+15, -10, 0]) rotate([-90,0,0]) cylinder(d=bolt_hole_dia,h=30, $fn=30);
        translate([-50/2+12, -10, 0]) cube([7,14,5.4], center=true);
        translate([-50/2+15, -10, 0]) rotate([-90,0,0]) cylinder(d=bolt_head_hole_dia,h=7, $fn=30);
        translate([50/2-15, -10, 0]) rotate([-90,0,0]) cylinder(d=bolt_hole_dia,h=30, $fn=30);
        translate([50/2-12, -10, 0]) cube([7,14,5.4], center=true);
        translate([50/2-15, -10, 0]) rotate([-90,0,0]) cylinder(d=bolt_head_hole_dia,h=7, $fn=30);
        
        // fan mount bolt hole
        translate([-50/2, -6, 5.4]) rotate([-90,0,-90]) cylinder(d=bolt_hole_dia,h=50, $fn=30);


    }
}

module prox_sensor_clamp() {
    height = 25;
    
    module halfround(d=30, h=5) {
        hull() {
            cylinder(d=d,h=h);
            translate([-d/2,-d/2,0]) cube([1,1,h]);
        }
    }
    
    module main() {
        halfround();
        translate([-37,-16.5,0]) cube([30,3,28]);
        translate([-25,-13.5,0]) cube([10,10,28]);
        translate([-(30-27.2)/2,0,25]) halfround(d=27.2, h=3);
    }

    difference() {
        main();
        cylinder(d=prox_sensor_dia, h=36);

        translate([0,0,5]) cylinder(d=prox_sensor_washer_dia+3, h=20, $fn=40);
        
        translate([-20,-5.5,5+20/2]) cube([15,16,20], center=true);
        translate([-25,-3.5,5+20/2]) rotate([0,0,45]) cube([sqrt(200),sqrt(200),31], center=true);

        translate([-14,-12.5,23]) rotate([0,-90,90]) cylinder(d=bolt_hole_dia, h=10, $fn=20);
        translate([-14,11.5,23]) rotate([0,-90,90]) cylinder(d=bolt_head_hole_dia, h=25, $fn=20);
        translate([-14,-12.5,8]) rotate([0,-90,90]) cylinder(d=bolt_hole_dia, h=10, $fn=20);
        translate([-34.3,-12.5,23]) rotate([0,-90,90]) cylinder(d=bolt_hole_dia, h=10, $fn=20);
        translate([-34.3,-12.5,8]) rotate([0,-90,90]) cylinder(d=bolt_hole_dia, h=10, $fn=20);
    }
        
}

module fan_tunnel(wall=2*nozzle) {
    
    module capsule(d=12, x=20) {
        hull() {
            translate([0,x/2,0]) circle(d=d, $fn=30);
            translate([0,-x/2,0]) circle(d=d, $fn=30);
        }
    }
    
    module capsule_3d(d=12, x=20, h=1) {
        hull() {
            translate([0,x/2,0]) cylinder(d=d, h=h, $fn=30);
            translate([0,-x/2,0]) cylinder(d=d, h=h, $fn=30);
        }
    }
    
    module curve(d=12,x=20) {
        difference() {
            rotate_extrude(convexity=10, $fn=80) {
                translate([20,0,0]) capsule(d=d, x=x);
            }
            translate([-10,24,-50/2]) rotate([0,0,-66]) cube([50,50,50,]);
            translate([-50,-25,-50/2]) cube([50,50,50]);
        }
    }
    
    module fan_piece() {
        difference () {
            union() {
                translate([0,0,3]) cube([42,42,6], center=true);
                hull() {
                    translate([-11,25,3]) rotate([0,90,0]) cylinder(d=6, h=22, $fn=30);
                    translate([0,23,3]) cube([22,4,6],center=true);
                }
            }
            translate([-13,25,3]) rotate([0,90,0]) cylinder(d=bolt_hole_dia, h=26, $fn=30);
            cylinder(d=41-2*wall, h=7, $fn=40);
            translate([32/2, 32/2, 0]) cylinder(d=2.5, h=7, $fn=30);
            translate([-32/2, 32/2, 0]) cylinder(d=2.5, h=7, $fn=30);
            translate([32/2, -32/2, 0]) cylinder(d=2.5, h=7, $fn=30);
            translate([-32/2, -32/2, 0]) cylinder(d=2.5, h=7, $fn=30);
        }
        
    }

    fan_piece();
    
    difference() {
        hull() {
            translate([0,0,5]) cylinder(d=41,h=1, $fn=40);
            translate([0,-7,31]) rotate([0,0,90]) capsule_3d(d=8, x=25, h=1);
        }
        hull() {
            translate([0,0,5]) cylinder(d=41-2*wall,h=1, $fn=40);
            translate([0,-7,31]) rotate([0,0,90]) capsule_3d(d=8-2*wall, x=25, h=1);
        }
    }
    
    translate([0,13,32]) rotate([0,-90,0]) difference() {
        curve(d=8,x=25);
        curve(d=8-2*wall,x=25);
    }
    
    module fan_nozzle_half(d1=8, d2=3, x=25) {
        intersection() {
            hull() {
                rotate([0,0,90]) capsule_3d(d=d1, x=x, h=1);
                rotate([0,0,90]) translate([(d1/2-d2/2),-2,10]) capsule_3d(d=d2,x=x,h=1);
            }
            translate([0,-20,0]) cube([40,40,40]);
        }
    }

    module hollow_circle(d, x) {
        difference() {
            rotate([90,0,0]) rotate_extrude(convexity=10, $fn=80) {
                translate([12,0,0]) rotate([0,0,90]) capsule(d=d, x=x);
            }
            hull() {
                translate([0,2,5]) rotate([90,0,0]) cylinder(d=13,h=5);
                translate([0,2,21]) rotate([90,0,0]) cylinder(d=13,h=5);
            }
            //translate([0,-10,11]) rotate([0,45,0]) cube([20,20,20], center=true);
            translate([0,-10,11]) cube([12,20,20], center=true);
        }

    }

    translate([0,-5.1,40.5]) rotate([-21,0,0]) difference() {
        union() {
            fan_nozzle_half(d2=3);
            mirror([1,0,0]) fan_nozzle_half(d2=3);
            rotate([-26.5,0,0]) translate([0,-2.51,17]) hollow_circle(3, 8);
            translate([0,2.5,11.2]) rotate([-20,0,0]) cube([11,2.8,1],center=true);            
        }
        union() {
            fan_nozzle_half(d1=8-4*nozzle, d2=1.4);
            mirror([1,0,0]) fan_nozzle_half(d1=8-4*nozzle, d2=1.4);
            rotate([-26.5,0,0]) translate([0,-2.91,17]) hollow_circle(3, 5);
            translate([0,0,10.2]) rotate([-20,0,0]) cube([11,5,3],center=true);
        }
    }
}

module fan_tunnel_arm() {
    length = 11;
    difference() {
        hull() {
            cylinder(d=6, h=26, $fn=30);
            translate([length,0,0]) cylinder(d=6, h=26, $fn=30);
            translate([0,6/2,0]) cube([length,2, 26]);
        }
        translate([-3.5,0,2]) hull() {
            cylinder(d=9, h=22, $fn=30);
            translate([3,0,0]) cylinder(d=9, h=22, $fn=30);
        }
        translate([length-0.5,0,2]) hull() {
            cylinder(d=9, h=22, $fn=30);
            translate([3,0,0]) cylinder(d=9, h=22, $fn=30);
        }
        cylinder(d=bolt_hole_dia, h=27, $fn=30);
        translate([length,0,0]) cylinder(d=bolt_hole_dia, h=27, $fn=30);
        
        translate([length,-1,2+22/2]) rotate([0,0,-35]) cube([9,15,22], center=true);
    }
}


module fan_tunnel_arm2() {
    length = 8;
    gap = 22+2*slop;
    offset = (28 - gap)/2;
    difference() {
        hull() {
            cylinder(d=6, h=28, $fn=30);
            translate([length,0,0]) cylinder(d=6, h=28, $fn=30);
            translate([0,6/2,0]) cube([length,3, 28]);
        }
        translate([-3.5,0,offset]) hull() {
            cylinder(d=9, h=gap, $fn=30);
            translate([3,0,0]) cylinder(d=9, h=gap, $fn=30);
        }
        translate([length-0.5,0,offset]) hull() {
            cylinder(d=9, h=gap, $fn=30);
            translate([3,0,0]) cylinder(d=9, h=gap, $fn=30);
        }
        cylinder(d=bolt_hole_dia, h=28, $fn=30);
        translate([length,0,0]) cylinder(d=bolt_hole_dia, h=28, $fn=30);
        
        translate([length,-1,offset+gap/2]) rotate([0,0,-35]) cube([9,15,gap], center=true);
    }
}

module view_proper() {
    %translate([0,-8/2, 20/2]) mock_slide();

    translate([0,-20/2-8,30/2]) body();
    translate([0,-38.1,40/2-5]) mount();
    
    translate([0,-78.2,40-5-5.4/2]) mount_clamp();
    
    %translate([28,-70,7]) rotate([0,0,-109]) prox_sensor_clamp();

    translate([0,-72.1,-19.4]) e3dv6();

    translate([28,-70,-19]) proximity_sensor();
    
    translate([0,-115,20]) rotate([-42,180,0]) fan_tunnel();
    translate([-13,-95.2,37.5]) rotate([90,0,90]) fan_tunnel_arm();
}

view_proper();

//translate([-30,0,30/2]) rotate([180,0,0]) body();
//translate([0,0,40/2-5]) rotate([180,0,0]) mount();
//mount_clamp();
//rotate([90,0,0]) prox_sensor_clamp();
//fan_tunnel();
//rotate([-90,0,0]) fan_tunnel_arm2();
