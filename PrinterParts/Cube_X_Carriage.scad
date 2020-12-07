
include <../Dollo/NEW_Long_ties/mockups.scad>;
include <../Dollo/NEW_Long_ties/globals.scad>;
include <../Dollo/NEW_Long_ties/include.scad>;

use <Prometheus_hotend_40mm_fan.scad>;

use <../Original-Prusa-i3/Printed-Parts/scad/nozzle-fan.scad>;
use <../Original-Prusa-i3/Printed-Parts/scad/nozzle-fan-holder.scad>;

////// VARIABLES //////
slop = 0.15;
nozzle=0.4;
//hotend = "e3dv6";
hotend = "prometheus";

////// VIEW //////
view_proper();

//translate([-30,0,30/2])
//rotate([180,0,0])
//body();

//rotate([180,0,0])
//mount(hotend);
//mount_clamp(hotend);
//prox_sensor_clamp();
//fan_tunnel();
//fan_tunnel_arm();
//rotate([-90,0,0]) fan_tunnel_arm2();
//cable_mount();
//prusa_nozzle_fan();
//prusa_nozzle_fan_2();
//prusa_nozzle_fan2_adapter();
//rotate([90,0,0]) mount_clamp_prusafan(hotend=hotend);
//mount_clamp_prusafan_clip();
//prusa_nozzle_fan2_holder();


////// MODULES //////
module mock_slide() {
    difference() {
        cube([28.7, 8, 20], center=true);

        translate([5,-8/2-0.1,7.5])
        rotate([-90,0,0])
        cylinder(d=3, h=3.6, $fn=20);

        translate([5,-8/2-0.1,-7.5])
        rotate([-90,0,0])
        cylinder(d=3, h=3.6, $fn=20);

        translate([-5,-8/2-0.1,7.5])
        rotate([-90,0,0])
        cylinder(d=3, h=3.6, $fn=20);

        translate([-5,-8/2-0.1,-7.5])
        rotate([-90,0,0])
        cylinder(d=3, h=3.6, $fn=20);
    }
}

module prometheus_hotend() {
    scale([10,10,10])
    import("../_downloaded/Prometheus_Hot_End/Aluminium_Heat_Sink_V2_4mm.stl");

    translate([0,0,-10])
    scale([10,10,10])
    rotate([0,0,90])
    import("../_downloaded/Prometheus_Hot_End/Aluminium_Heater_Block_V2_4mm.stl");

    translate([0,0,-15])
    scale([10,10,10])
    import("../_downloaded/Prometheus_Hot_End/Stainless_Steel_Nozzle_V2_2mm_0.4mm.stl");
}

module belt_teeth(){
    difference() {
        union() {
            cube([14,19,4],center=true);

            translate([0,1,2])
            cube([14,2,4],center=true);

            for (i=[0:6]) {
                translate([-6+i*2,0,4/2])
                cube([1,15,0.8],center=true);
            }
        }
        translate([-12,0,-3.7])
        rotate([90,0,0])
        cylinder(d=15,h=19,$fn=40);

        translate([12,0,-3.7])
        rotate([90,0,0])
        cylinder(d=15,h=19,$fn=40);

        translate([-7.55,-9.5,0])
        cube([14,4,7],center=true);

        translate([4.5,-12.75,0])
        rotate([0,0,-30])
        cube([14,4,7],center=true);
    }
}

module body() {
    depth = 20;
    screw_head_depth = depth-(12-3.5);
    difference() {
        cube([50,depth,30], center=true);
        
        // screw holes
        translate([5,-depth/2-0.1,7.5-5])
        rotate([-90,0,0])
        cylinder(d=3, h=30, $fn=20);

        translate([5,-depth/2-0.1,-7.5-5])
        rotate([-90,0,0])
        cylinder(d=3, h=30, $fn=20);

        translate([-5,-depth/2-0.1,7.5-5])
        rotate([-90,0,0])
        cylinder(d=3, h=30, $fn=20);

        translate([-5,-depth/2-0.1,-7.5-5])
        rotate([-90,0,0])
        cylinder(d=3, h=30, $fn=20);

        // screw head holes
        translate([5,-depth/2-0.2,7.5-5])
        rotate([-90,0,0])
        cylinder(d=6, h=screw_head_depth, $fn=30);

        translate([5,-depth/2-0.2,-7.5-5])
        rotate([-90,0,0])
        cylinder(d=6, h=screw_head_depth, $fn=30);

        translate([-5,-depth/2-0.2,7.5-5])
        rotate([-90,0,0])
        cylinder(d=6, h=screw_head_depth, $fn=30);

        translate([-5,-depth/2-0.2,-7.5-5])
        rotate([-90,0,0])
        cylinder(d=6, h=screw_head_depth, $fn=30);

        // bewels
        translate([-35,4,0])
        rotate([0,0,-45])
        cube([20,40,60], center=true);

        translate([35,4,0])
        rotate([0,0,45])
        cube([20,40,60], center=true);

        translate([0,4.5,24.5])
        rotate([-45,0,0])
        cube([60,40,20], center=true);

        translate([-50/2+12,-depth/2,0])
        rotate([0,0,45])
        cube([5,5,40], center=true);

        translate([50/2-12,-depth/2,0])
        rotate([0,0,45])
        cube([5,5,40], center=true);

        translate([-50/2+5, -depth/2+5, -20])
        cylinder(d=bolt_hole_dia,h=40, $fn=30);

        translate([50/2-5, -depth/2+5, -20])
        cylinder(d=bolt_hole_dia,h=40, $fn=30);
    }

    translate([0,10,5+4/2+1.5])
    rotate([180,0,0])
    belt_teeth();
}

module mount(hotend="e3dv6") {
    difference() {
        union() {
            cube([50,40,40], center=true);

            translate([0,-20,20-22/2])
            cube([29,30,22],center=true);
        }
        translate([0,20,0])
        cube([55,20,30+slop*2], center=true);

        // bolt holes
        translate([-50/2+5, 10+5, -30])
        cylinder(d=bolt_hole_dia,h=60, $fn=30);

        translate([50/2-5, 10+5, -30])
        cylinder(d=bolt_hole_dia,h=60, $fn=30);

        translate([-50/2+5, 10+5, 40/2-2.5])
        cylinder(d=bolt_head_hole_dia,h=60, $fn=30);

        translate([50/2-5, 10+5, 40/2-2.5])
        cylinder(d=bolt_head_hole_dia,h=60, $fn=30);

        // nuts
        translate([-50/2+5, 10+5, -40/2])
        M3_nut();

        translate([50/2-5, 10+5, -40/2])
        M3_nut();

        // sides
        translate([-50/2-7,0,0])
        rotate([0,0,19])
        cube([20,49.2,50],center=true);

        translate([50/2+7,0,0])
        rotate([0,0,-19])
        cube([20,49.2,50],center=true);

        translate([0,-24.5,-10.3])
        rotate([45,0,0])cube([60,20,50],center=true);

        // hot end neck
        translate([0,-34, 10])
        cylinder(d=12, h=20, $fn=40);

        // hot end body
        if (hotend == "prometheus") {
            translate([0,-34, 13.4])
            cylinder(d=16.2, h=2, $fn=40);

            hull() {
                translate([0,-34, -8])
                cylinder(d1=42, d2=20, h=28-5.4, $fn=60);

                translate([-30,-34, -8])
                cylinder(d1=42, d2=20, h=28-5.4, $fn=60);
            }
        } else {
            translate([0,-34, 0])
            cylinder(d=27, h=20-5.4, $fn=60);

            translate([-10,-30.55, 4.6])
            cube([20,20,20],center=true);
        }

        // hot end clamp bolt holes
        translate([-50/2+15, -50, 20-5.4/2])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia,h=30, $fn=30);

        translate([50/2-15, -50, 20-5.4/2])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia,h=30, $fn=30);

        // hot end clamp nut holes
        translate([-50/2+15, -25, 20-5.4/2-0.1])
        rotate([-90,0,0])
        M3_nut(h=2.6, cone=false);

        translate([50/2-15, -25, 20-5.4/2-0.1])
        rotate([-90,0,0])
        M3_nut(h=2.6, cone=false);

        translate([-50/2+15, -25+2.6/2, 20-0.3])
        cube([6.2,2.6,5], center=true);

        translate([50/2-15, -25+2.6/2, 20-0.3])
        cube([6.2,2.6,5], center=true);

        // utility holes
        translate([14.5,9,15])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([14.5,9,0])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([14.5,9,-15])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([7.5,-10,15])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([7.5,-10,0])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([11,0,15])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([11,0,0])
        rotate([0,90,-19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-14.5,9,15])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-14.5,9,0])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-14.5,9,-15])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-7.5,-10,15])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-7.5,-10,0])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-11,0,15])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-11,0,0])
        rotate([0,-90,19])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-13,3,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([13,3,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-9,-7,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([9,-7,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-5,-17,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([5,-17,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([0,3,11])
        cylinder(d=2.5,h=10, $fn=30);

        translate([0,-7,11])
        cylinder(d=2.5,h=10, $fn=30);
    }

    translate([-50/2+12,10,0])
    rotate([0,0,45])
    cube([5,5,40], center=true);

    translate([50/2-12,10,0])
    rotate([0,0,45])
    cube([5,5,40], center=true);
}

module mount_clamp(hotend="e3dv6"){
    difference() {
        union() {
            cube([29,10,5.4],center=true);

            translate([0,-5.1,5.4/2+0.1])
            cube([22,8,11],center=true);
        }
        // hot end neck
        translate([0,6, -10])
        cylinder(d=12, h=20, $fn=40);

        if (hotend == "prometheus") {
            translate([0,6, -3.9])
            cylinder(d=16.2, h=2, $fn=40);
        }
        translate([0,6, 5.4/2])
        cylinder(d=18, h=20, $fn=40);

        // hot end clamp bolt holes
        translate([-50/2+15, -10, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia,h=30, $fn=30);

        translate([-50/2+12, -10, 0])
        cube([7,14,5.4], center=true);

        translate([-50/2+15, -10, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_head_hole_dia,h=7, $fn=30);

        translate([50/2-15, -10, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia,h=30, $fn=30);

        translate([50/2-12, -10, 0])
        cube([7,14,5.4], center=true);

        translate([50/2-15, -10, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_head_hole_dia,h=7, $fn=30);

        // fan mount bolt hole
        translate([-50/2, -6, 5.4])
        rotate([-90,0,-90])
        cylinder(d=bolt_hole_dia,h=50, $fn=30);
    }
}

module prox_sensor_clamp() {
    height = 25;
    
    module halfround(d=30, h=5) {
        hull() {
            cylinder(d=d,h=h, $fn=50);

            translate([-d/2,-d/2,0])
            cube([1,1,h]);
        }
    }
    
    module main() {
        translate([-1,5,0])
        halfround();

        translate([-37,-16.5,0])
        cube([35,3,28]);

        translate([-37,-13.5,0])
        cube([44,25,28]);

        translate([-1,5,23])
        halfround();
    }

    difference() {
        main();

        translate([-1,5,0])
        cylinder(d=prox_sensor_dia, h=36, $fn=50);

        translate([-1,5,5])
        cylinder(d=prox_sensor_washer_dia+3, h=19, $fn=50);

        translate([-25,-1,5+20/2])
        cube([25,25,20], center=true);

        translate([-30,8.9,5+20/2])
        rotate([0,0,49])
        cube([55,20,31], center=true);

        translate([2,-16.4,5+20/2])
        rotate([0,0,35])
        cube([40,10,31], center=true);

        translate([-14,-12.5,23])
        rotate([0,-90,90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);

        translate([-14,21.5,23])
        rotate([0,-90,90])
        cylinder(d=bolt_head_hole_dia, h=35, $fn=20);

        translate([-14,-12.5,8])
        rotate([0,-90,90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);

        translate([-14,-3.5,8])
        rotate([0,-90,90])
        cylinder(d=bolt_head_hole_dia, h=10, $fn=20);

        translate([-34.3,-12.5,23])
        rotate([0,-90,90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);

        translate([-34.3,-12.5,8])
        rotate([0,-90,90])
        cylinder(d=bolt_hole_dia, h=10, $fn=20);
    }
}

module fan_tunnel(wall=2*nozzle) {
    
    module capsule(d=12, x=20) {
        hull() {
            translate([0,x/2,0])
            circle(d=d, $fn=30);

            translate([0,-x/2,0])
            circle(d=d, $fn=30);
        }
    }
    
    module capsule_3d(d=12, x=20, h=1) {
        hull() {
            translate([0,x/2,0])
            cylinder(d=d, h=h, $fn=30);

            translate([0,-x/2,0])
            cylinder(d=d, h=h, $fn=30);
        }
    }
    
    module curve(d=12,x=20) {
        difference() {
            rotate_extrude(convexity=10, $fn=80) {
                translate([20,0,0])
                capsule(d=d, x=x);
            }
            translate([-10,24,-50/2])
            rotate([0,0,-66])
            cube([50,50,50,]);

            translate([-50,-25,-50/2])
            cube([50,50,50]);
        }
    }
    
    module fan_piece() {
        difference () {
            union() {
                translate([0,0,3])
                cube([42,42,6], center=true);

                hull() {
                    translate([-11,25,3])
                    rotate([0,90,0])
                    cylinder(d=6, h=22, $fn=30);

                    translate([0,23,3])
                    cube([22,4,6],center=true);
                }
            }
            translate([-13,25,3])
            rotate([0,90,0])
            cylinder(d=bolt_hole_dia, h=26, $fn=30);

            cylinder(d=41-2*wall, h=7, $fn=40);

            translate([32/2, 32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);

            translate([-32/2, 32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);

            translate([32/2, -32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);

            translate([-32/2, -32/2, 0])
            cylinder(d=2.5, h=7, $fn=30);
        }
    }

    fan_piece();
    
    difference() {
        hull() {
            translate([0,0,5])
            cylinder(d=41,h=1, $fn=40);

            translate([0,-7,31])
            rotate([0,0,90])
            capsule_3d(d=8, x=25, h=1);
        }
        hull() {
            translate([0,0,5])
            cylinder(d=41-2*wall,h=1, $fn=40);

            translate([0,-7,31])
            rotate([0,0,90])
            capsule_3d(d=8-2*wall, x=25, h=1);
        }
    }

    translate([0,13,32])
    rotate([0,-90,0])
    difference() {
        curve(d=8,x=25);
        curve(d=8-2*wall,x=25);
    }

    module fan_nozzle_half(d1=8, d2=3, x=25) {
        intersection() {
            hull() {
                rotate([0,0,90])
                capsule_3d(d=d1, x=x, h=1);

                rotate([0,0,90])
                translate([(d1/2-d2/2),-2,10])
                capsule_3d(d=d2,x=x,h=1);
            }
            translate([0,-20,0])
            cube([40,40,40]);
        }
    }

    module hollow_circle(d, x) {
        difference() {
            rotate([90,0,0])
            rotate_extrude(convexity=10, $fn=80) {
                translate([12,0,0])
                rotate([0,0,90])
                capsule(d=d, x=x);
            }
            hull() {
                translate([0,2,5])
                rotate([90,0,0])
                cylinder(d=13,h=5);

                translate([0,2,21])
                rotate([90,0,0])
                cylinder(d=13,h=5);
            }
            //translate([0,-10,11])
            //rotate([0,45,0])
            //cube([20,20,20], center=true);

            translate([0,-10,11])
            cube([12,20,20], center=true);
        }
    }

    translate([0,-5.1,40.5])
    rotate([-21,0,0])
    difference() {
        union() {
            fan_nozzle_half(d2=3);

            mirror([1,0,0])
            fan_nozzle_half(d2=3);

            rotate([-26.5,0,0])
            translate([0,-2.51,17])
            hollow_circle(3, 8);

            translate([0,2.5,11.2])
            rotate([-20,0,0])
            cube([11,2.8,1],center=true);            
        }
        union() {
            fan_nozzle_half(d1=8-4*nozzle, d2=1.4);

            mirror([1,0,0])
            fan_nozzle_half(d1=8-4*nozzle, d2=1.4);

            rotate([-26.5,0,0])
            translate([0,-2.91,17])
            hollow_circle(3, 5);

            translate([0,0,10.2])
            rotate([-20,0,0])
            cube([11,5,3],center=true);
        }
    }
}

module fan_tunnel_arm() {
    length = 11;
    difference() {
        hull() {
            cylinder(d=6, h=26, $fn=30);

            translate([length,0,0])
            cylinder(d=6, h=26, $fn=30);

            translate([0,6/2,0])
            cube([length,2, 26]);
        }
        translate([-3.5,0,2]) hull() {
            cylinder(d=9, h=22, $fn=30);

            translate([3,0,0])
            cylinder(d=9, h=22, $fn=30);
        }
        translate([length-0.5,0,2]) hull() {
            cylinder(d=9, h=22, $fn=30);

            translate([3,0,0])
            cylinder(d=9, h=22, $fn=30);
        }
        cylinder(d=bolt_hole_dia, h=27, $fn=30);

        translate([length,0,0])
        cylinder(d=bolt_hole_dia, h=27, $fn=30);

        translate([length,-1,2+22/2])
        rotate([0,0,-35])
        cube([9,15,22], center=true);
    }
}


module fan_tunnel_arm2() {
    length = 8;
    gap = 22+2*slop;
    offset = (28 - gap)/2;
    difference() {
        hull() {
            cylinder(d=6, h=28, $fn=30);

            translate([length,0,0])
            cylinder(d=6, h=28, $fn=30);

            translate([0,6/2,0])
            cube([length,3, 28]);
        }
        translate([-3.5,0,offset])
        hull() {
            cylinder(d=9, h=gap, $fn=30);

            translate([3,0,0])
            cylinder(d=9, h=gap, $fn=30);
        }
        translate([length-0.5,0,offset])
        hull() {
            cylinder(d=9, h=gap, $fn=30);

            translate([3,0,0])
            cylinder(d=9, h=gap, $fn=30);
        }
        cylinder(d=bolt_hole_dia, h=28, $fn=30);

        translate([length,0,0])
        cylinder(d=bolt_hole_dia, h=28, $fn=30);

        translate([length,-1,offset+gap/2])
        rotate([0,0,-35])
        cube([9,15,gap], center=true);
    }
}

module cable_mount() {
    difference() {
        union () {
            translate([0,-4,2])
            cube([50,32,4], center=true);

            translate([0,9.5,1/2])
            hull() {
                cube([45,5,1], center=true);

                translate([0,0,50])
                cube([15,5,1], center=true);
            }

            translate([5/2, 10, 4])
            rotate([90,0,-90])
            linear_extrude(height=5)
            polygon(points=[[0,0], [15,0], [0,15]]);
        }
        
        translate([-50/2-7,0,0])
        rotate([0,0,19])
        cube([20,49.2,50],center=true);

        translate([50/2+7,0,0])
        rotate([0,0,-19])
        cube([20,49.2,50],center=true);

        translate([0,-24.5,-10.3])
        rotate([45,0,0])
        cube([60,20,50],center=true);

        translate([-13,3,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([13,3,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-9,-7,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([9,-7,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-5,-17,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([5,-17,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([0,-7,0])
        cylinder(d=2.5,h=10, $fn=30);

        translate([-12,7,10])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([12,7,10])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([0,7,19])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([-10,7,19])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([10,7,19])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([0,7,28])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([-8,7,28])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([8,7,28])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([0,7,37])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([-6,7,37])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([6,7,37])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([-4,7,46])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);

        translate([4,7,46])
        rotate([-90,0,0])
        cylinder(d=4,h=6, $fn=30);
    }
}

module prusa_nozzle_fan() {
    %translate([9.5,15.6,7.5])
    rotate([90,0,180])
    import("../_downloaded/50mm_Radial_fan/50mm_fan.stl");
    
    // fuck OpenSCAD, fuck it to hell. Cannot render the imported file. So redoing the whole thing
    //%translate([0,-20,75]) import("../_downloaded/Prusa/mk25_upgrade_stl/extruder/nozzle-fan2.stl", convexity=10);
    
    module base_form() {
        
        union() {
            difference() {
                union() {
                    difference() {
                        translate([0,-5,0])
                        cylinder(d=48,h=9,$fn=60);

                        translate([-60,-60,-0.01])
                        cube([120,57,20]);
                    }
                    translate([15.89,-3,0])
                    hull() {
                        translate([-2,0,0])
                        cylinder(d=12,h=9,$fn=30);

                        translate([2,0,0])
                        cylinder(d=12,h=9,$fn=30);
                    }
                    translate([-15.89,-3,0])
                    hull() {
                        translate([-2,0,0])
                        cylinder(d=12,h=9,$fn=30);

                        translate([2,0,0])
                        cylinder(d=12,h=9,$fn=30);
                    }
                    translate([0,20,9/2])
                    cube([36,24,9],center=true);
                }
                translate([0,-5,-0.01])
                cylinder(d=28,h=10,$fn=60);

                translate([13.2,-10,-0.01])
                rotate([0,0,20])
                cube([5,10,20],center=true);

                translate([-13.2,-10,-0.01])
                rotate([0,0,-20])
                cube([5,10,20],center=true);

                translate([18.7,27,-0.01])
                rotate([0,0,30])
                cube([8,20,20],center=true);

                translate([-18.7,27,-0.01])
                rotate([0,0,-30])
                cube([8,20,20],center=true);

                translate([0,-4.5,10/2+6.7])
                rotate([9,0,0])
                cube([60,30,10],center=true);
            }
        }
    }

    module inner_form() {
        intersection() {
            union() {
                difference() {
                    linear_extrude(7,convexity=10)
                    offset(r=-1)
                    projection(cut=true)
                    base_form();

                    translate([0,-4,10/2+4.7])
                    rotate([9,0,0])
                    cube([60,30,10],center=true);
                }
                translate([0,23.2,10/2+1])
                cube([20.2,15.3,10],center=true);

                translate([2.2,22.5,10/2+1])
                cube([20,2.9,10],center=true);
            }
            translate([0,0,10/2])
            hull() {
                translate([30,25.8,0])
                rotate([0,-90,0])
                cylinder(d=10,h=60,$fn=40);

                translate([0,-30,0])
                cube([60,10,10],center=true);

                translate([0,25.9,20])
                cube([60,10,10],center=true);
            }
        }
    }
    
    module final_form() {
        union() {
            difference() {
                union() {
                    base_form();

                    translate([13,11.2,8.99])
                    difference() {
                        cube([5,6,3]);

                        translate([-0.01,1.8,0])
                        cube([3,2.4,2.2]);
                    }
                    translate([-42,27,0])
                    cube([31,5,9]);

                    translate([-42,30.5,0])
                    cube([9,2.5,18]);
                }
                translate([0,0,1])
                inner_form();

                translate([0,-5,-0.01])
                cylinder(d=34,h=4.2,$fn=60);

                translate([-37.5,35,14.5])
                rotate([90,0,0])
                cylinder(d=3.8,h=10,$fn=30);
            }
            translate([-15.6,-4.3,6/2])
            rotate([0,0,80])
            cube([1,3,6],center=true);

            translate([15.6,-4.3,6/2])
            rotate([0,0,-80])
            cube([1,3,6],center=true);

            translate([-12.9,4.5,5/2])
            rotate([0,0,55])
            cube([1,4,5],center=true);

            translate([12.9,4.5,5/2])
            rotate([0,0,-55])
            cube([1,4,5],center=true);

            translate([-5.7,10,5/2])
            rotate([0,0,15])
            cube([1,4,5],center=true);

            translate([5.7,10,5/2])
            rotate([0,0,-15])
            cube([1,4,5],center=true);

            translate([0,12,8/2])
            cube([0.8,6,8],center=true);

            translate([-9,12.5,9/2])
            rotate([0,0,-50])
            cube([0.8,8,9],center=true);

            translate([9,12.5,9/2])
            rotate([0,0,50])
            cube([0.8,8,9],center=true);

            translate([-12,18.5,9/2])
            rotate([0,0,-33])
            cube([0.8,5,9],center=true);

            translate([12,18.5,9/2])
            rotate([0,0,33])
            cube([0.8,5,9],center=true);

            translate([10,31.9,2])
            rotate([90,0,180])
            linear_extrude(1)
            text("Hot tamale!", size=5);
        }
    }
    //inner_form();
    final_form();
}


module prusa_nozzle_fan_2() {
    %translate([9.5,15.6,10.5])
    rotate([130,0,180])
    import("../_downloaded/50mm_Radial_fan/50mm_fan.stl");
    
    difference() {
        union() {
            difference() {
                translate([0,-21.7,53])
                nozzle_fan(mount=false);

                translate([11.3,10,9])
                cube([20,20,20]);
            }
            translate([13,9.2,8.99])
            difference() {
                cube([5,6,3]);

                translate([-0.01,1.8,0])
                cube([3,2.4,2.2]);
            }
            translate([-46,12,0])
            intersection() {
                cube([36,19,5]);

                translate([0,11,0])
                rotate([0,0,-20])
                cube([31,17,5]);
            }

            translate([-45,26.40,0])
            rotate([-40,0,0])
            cube([15,4,14]);
        }
        translate([-50,16.6,11.65])
        rotate([-40,0,0])
        cube([50,15,5]);

        translate([-46,16.6,-5])
        cube([20,20,5]);

        translate([-37.5,35,3.4])
        rotate([50,0,0])
        cylinder(d=3.8,h=10,$fn=30);
    }
}

module prusa_nozzle_fan2_adapter() {
    difference() {
        intersection() {
            union() {
                cube([10,5,10]);

                translate([0,0,5])
                rotate([-40,0,0])
                cube([10,5,10]);
            }
            translate([0,0,0])
            cube([10,10,10]);
        }
        translate([10/2,0,4.15])
        rotate([-90,0,0])
        cylinder(d=2.8,h=10,$fn=20);

        translate([10/2,0,11.2])
        rotate([-130,0,0])
        cylinder(d=2.8,h=15,$fn=20);
    }
}

module prusa_nozzle_fan2_holder() {
    difference() {
        union()
        {
            translate([-4,36.5,-25])
            cube([6,45,30]);

            translate([-4,36.5,-25])
            cube([15,10,30]);

            translate([-4,68,-12])
            rotate([50,0,0])
            cube([10,15,11.1]);

            translate([5.5,67.15,-6.65])
            rotate([50,0,0])
            cylinder(r=6.1,h = 7, $fn=6);
        }

        translate([5.5,42,1])
        rotate([90,0,0])
        cylinder(r=1.6,h = 10, $fn=30);

        translate([5.5,46.9,1])
        rotate([90,0,0])
        cylinder(r=3.1,h = 5, $fn=30);

        //#translate([5.5,70,-7]) rotate([50,0,0])  cylinder(r=1.6,h = 15, $fn=60);
        translate([5.5,70,-8.5])
        rotate([50,0,0])
        cylinder(r=1.6,h = 15, $fn=60);

        translate([5.5,65,-4.2])
        rotate([50,0,0])
        cylinder(r=3.1,h = 17, $fn=6);

        translate([-25,46.1,-55])
        rotate([50,0,0])
        cube([50,150,15]);

        translate([-25,46.5,-66])
        rotate([50,0,0])
        cube([50,150,15]);

        translate([-25,86,4])
        rotate([50+90,0,0])
        cube([50,150,15]);

        translate([-25,86,13.5])
        rotate([170,0,0])
        cube([50,150,15]);

        translate([-25,86,-12])
        rotate([175,0,0])
        cube([50,150,15]);

        translate([-5,35,-25])
        cube([20,45,16]);
    }
}

module mount_clamp_prusafan(hotend="e3dv6"){
    difference() {
        union() {
            translate([-29/2,-11,-2.7])
            cube([29,40,10.4]);

            translate([-29/2,-13,-40.3])
            cube([29,2,48]);

            translate([-12,-13,-40.3])
            cube([52,2,10]);

            translate([-20+57.5, -13,-34.8])
            rotate([-90,0,0])
            cylinder(d=7,h=5,$fn=30);
        }
        translate([-30/2,5,-2.71])
        cube([30,30,5.4]);

        translate([-29/2-1,-14,-38.3])
        cube([2.5,4,40]);

        // hot end neck
        translate([0,6, -10])
        cylinder(d=12, h=20, $fn=40);

        if (hotend == "prometheus") {
            translate([0,6, -3.9])
            cylinder(d=16.2, h=2, $fn=40);
        }
        hull() {
            translate([0,6, 5.4/2-0.02])
            cylinder(d=18, h=20, $fn=40);

            translate([0,46, 5.4/2-0.02])
            cylinder(d=18, h=20, $fn=40);
        }
        // hot end clamp bolt holes
        translate([-50/2+15, -10, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia,h=30, $fn=30);

        translate([-50/2+12, -10, 0])
        cube([7,14,5.4], center=true);

        translate([-50/2+15, -20, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_head_hole_dia,h=17, $fn=30);

        translate([50/2-15, -10, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia,h=30, $fn=30);

        translate([50/2-12, -10, 0])
        cube([7,14,5.4], center=true);

        translate([50/2-15, -20, 0])
        rotate([-90,0,0])
        cylinder(d=bolt_head_hole_dia,h=17, $fn=30);

        // fan holes
        translate([-50/2+20, -14,3.2])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia-0.4,h=10, $fn=30);

        translate([-20+57.5, -14,-34.8])
        rotate([-90,0,0])
        cylinder(d=bolt_hole_dia-0.4,h=10, $fn=30);
    }
}

module mount_clamp_prusafan_clip() {
    difference() {
        union() {
            translate([0,0,3/2])
            cube([29,10,3], center=true);

            translate([0,0,5/2+2.99])
            cube([17.5,10,5], center=true);
        }
        translate([5,0,-0.1]) {
            cylinder(d1=4.5,d2=3.3,h=1.5,$fn=20);
            cylinder(d=3.3,h=10,$fn=20);
        }
        translate([-5,0,-0.1]) {
            cylinder(d1=4.5,d2=3.3,h=1.5,$fn=20);
            cylinder(d=3.3,h=10,$fn=20);
        }
    }
}




module view_proper() {

    %translate([0,-8/2, 20/2])
    mock_slide();

    translate([0,-20/2-8,30/2])
    body();

    translate([0,-38.1,40/2-5])
    mount(hotend=hotend);

    //translate([0,-78.2,40-5-5.4/2])
    //mount_clamp(hotend=hotend);

    translate([0,-78.2,40-5-5.4/2])
    mount_clamp_prusafan(hotend=hotend);

    %translate([28,-70,7])
    rotate([0,0,-109])
    prox_sensor_clamp();

    //translate([0,-72.1,-19.4])
    //e3dv6();

    translate([0,-72.1,-3.7])
    rotate([0,0,90])
    prometheus_hotend();

    //translate([33,-70.5,-19])
    //proximity_sensor();

    //translate([0,-115,20])
    //rotate([-42,180,0])
    //fan_tunnel();

    //translate([-13,-95.2,37.5])
    //rotate([90,0,90])
    //fan_tunnel_arm();

    //translate([-31,-72.1,-3.7])
    //rotate([0,0,-90])
    //color("green")
    //fan_shroud();

    //translate([0,-76,-17])
    //rotate([0,0,180])
    //prusa_nozzle_fan();

    translate([0,-78,-17])
    rotate([0,0,180])
    prusa_nozzle_fan_2();

    translate([42.5,-91.2 ,-6.6])
    rotate([0,0,180])
    prusa_nozzle_fan2_adapter();

    translate([0.5,-54.5,35])
    rotate([0,0,180])
    prusa_nozzle_fan2_holder();

    translate([0,-55,43.1])
    rotate([180,0,0])
    mount_clamp_prusafan_clip();
}
