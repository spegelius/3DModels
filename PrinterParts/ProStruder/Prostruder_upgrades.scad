
// PLA
M3_hole = 3.3;
PTFE_hole = 4.3;

// nylon
//M3_hole = 3.5;
//PTFE_hole = 4.5;

use <../../Dollo/NEW_long_ties/include.scad>;
include <../../lib/includes.scad>;

module hinge_623zz() {
    translate([-9.9,-9.9]) import("../_downloaded/ProStruder/Hinge_4.5mm_[3D_Print.stl");
}

module hinge_625zz() {
    difference() {
        union() {
            translate([-9.9,-9.9]) import("../_downloaded/ProStruder/Hinge_4.5mm_[3D_Print.stl", convexity=3);
            translate([4.6,-9.9,4]) cylinder(d1=9, d2=7.5,h=2.9,$fn=40);
            hull() {
                translate([3.1,-10.9,0]) cylinder(d=10,h=4.5,$fn=30);
                translate([6.5,-10.9,0]) cylinder(d=9,h=4.5,$fn=30);
                translate([3.7,2.1,0]) cylinder(d=8,h=4.5,$fn=60);
            }
        }
        translate([4.6,-9.9, 1.7]) cylinder(d=5.4,h=10,$fn=40);
        translate([4.6,-9.9,-0.1]) cylinder(d=10.4,h=1.6,$fn=40);
        cylinder(d=3.3,h=5,$fn=40);
        translate([-41.4,1.1,0]) cylinder(d=3.3,h=5,$fn=40);
    }
    //translate([1.6,-9.9]) cylinder(d=2.8,h=5,$fn=20);
}

module mock_prometheus_motor() {
    color("grey") translate([-42/2, -42/2,0]) cube([42,42, 43.7]);
    
    color("grey") difference() {
        translate([0,0,43.7]) cylinder(d=36, h=22.65, $fn=50);
        translate([-19.7/2,19.7/2,43.7+22.65-6]) cylinder(d=3, h=7, $fn=30);
        translate([19.7/2,19.7/2,43.7+22.65-6]) cylinder(d=3, h=7, $fn=30);
        translate([-19.7/2,-19.7/2,43.7+22.65-6]) cylinder(d=3, h=7, $fn=30);
        translate([19.7/2,-19.7/2,43.7+22.65-6]) cylinder(d=3, h=7, $fn=30);
    }
    color("brown") translate([0,0,43.7+23.65]) cylinder(d=11, h=16.5, $fn=30);
}

module tube_guide() {
    $fn=40;
    difference() {
        hull() {
            cylinder(d=8, h=4.53);
            translate([34,0,0]) cylinder(d=8, h=4.53);
        }
        cylinder(d=M3_hole, h=5);
        translate([34,0,0]) cylinder(d=M3_hole, h=5);
        translate([34/2,0,0]) cylinder(d=4.2, h=5);
    }
}

module filament_tube(length) {
    union() {
        cylinder(d=2.4, h=length-2);
        translate([0,0,length-2]) cylinder(d1=2.4, d2=2.7, h=2);
    }
}

//filament_tube(20);

module new_top_guide(bearing="623zz") {
    $fn=40;
    
    difference() {
        hull() {
            if (bearing == "623zz") {
                cylinder(d=7.5, h=16);
                translate([34,0,0]) cylinder(d=7.5, h=16);
            } else if (bearing == "625zz") {
                cylinder(d=8.5, h=16);
                translate([44,0,0]) cylinder(d=8.5, h=16);
            }
        }
        cylinder(d=M3_hole, h=17);
        translate([34,0,0]) cylinder(d=M3_hole, h=17);
        if (bearing == "623zz") {
            #translate([34/2-0.3,0,2.4]) rotate([0,1.3,0]) filament_tube(10-6.6);
            translate([34/2-0.2,0,6]) rotate([0,1.3,0]) cylinder(d=PTFE_hole, h=11);
        } else if (bearing == "625zz") {
            translate([34/2-0.3,0,2.4]) rotate([0,1.3,0]) filament_tube(10-4.6);
            translate([34/2-0.2,0,8]) rotate([0,1.3,0]) cylinder(d=PTFE_hole, h=11);
        }
        
        translate([6.5,5,0.9]) rotate([90,0,0]) hull() {
            cylinder(d=11.6,h=10);
            translate([4,0,0]) cylinder(d=11.2,h=10);
        }
        if (bearing == "623zz") {
            translate([21.4,5,0.9]) rotate([90,0,0]) hull() {
                cylinder(d=10.5,h=10);
                translate([4,-1,0]) cylinder(d=12.5,h=10);
            }
        } else if (bearing == "625zz") {
            translate([24,5,1]) rotate([90,0,0]) hull() {
                cylinder(d=16.5,h=10);
                translate([7,0,0]) cylinder(d=16.5,h=10);
            }
            translate([34,0,-16+2.1+2.2+4.5+2.8]) cylinder(d=7, h=16);
            translate([48.5,0,16]) rotate([0,45,0]) cube([16,15,16],center=true);
            translate([44,0,-0.1]) cylinder(d=M3_hole, h=3.8);
            translate([44,0,4]) nut(10);
        }
        translate([34/2,0,0]) cube([4,10,5], center=true);
    }
}

module new_bottom_guide(bearing="623zz") {
    $fn=40;
    height = 7*4.53 - 16 + 1.7;
    difference() {
        hull() {
            if (bearing == "623zz") {
                cylinder(d=7.5, h=height);
                translate([34,0,0]) cylinder(d=7.5, h=height);
            } else if (bearing == "625zz") {
                cylinder(d=8.5, h=height);
                translate([44,0,0]) cylinder(d=8.5, h=height);
            }
        }
        cylinder(d=M3_hole, h=height);
        translate([34,0,0]) cylinder(d=M3_hole, h=height);
        if (bearing == "623zz") {
            translate([34/2-0.40,0,height-1.35]) rotate([180,-1.3,0]) filament_tube(height-13);
            translate([34/2,0,-0.5]) rotate([0,-1.3,0]) cylinder(d=PTFE_hole, h=12);
        } else if (bearing == "625zz") {
            translate([34/2-0.40,0,height-0]) rotate([180,-1.3,0]) filament_tube(height-10.65);
            translate([34/2,0,-0.5]) rotate([0,-1.3,0]) cylinder(d=PTFE_hole, h=11);
        }
        translate([34/2,0,-0.5]) cube([10,10,3], center=true);
       
        translate([6.5,5,18]) rotate([90,0,0]) hull() {
            cylinder(d=11.6,h=10);
            translate([4,0,0]) cylinder(d=11.2,h=10);
        }
        if (bearing == "623zz") {
            translate([21.4,5,18]) rotate([90,0,0]) hull() {
                cylinder(d=10.5,h=10);
                translate([4,0,0]) cylinder(d=12.5,h=10);
            }
        } else if (bearing == "625zz") {
            translate([24,5,18]) rotate([90,0,0]) hull() {
                cylinder(d=16.5,h=10);
                translate([6,0,0]) cylinder(d=18.5,h=10);
            }
            translate([34,0,12-4.5-3]) nut(8);
            translate([48.5,0,0]) rotate([0,45,0]) cube([16,15,16],center=true);
            translate([44,0,height-4.8]) cylinder(d=M3_hole, h=height+1);
            translate([44,0,-0.1]) cylinder(d=7, h=height-5);
        }

        translate([10.5+19.7/2,5,18.1-19.6/2]) rotate([90,0,0]) cylinder(d=M3_hole,h=10);

        translate([34/2,0,height]) cube([4,10,3], center=true);
    }
    translate([34/2,0,1+0.2/2]) cube([10,7,0.2], center=true);
}

module prostruder_assembly(bearing="623zz") {
    
    translate([34,0.2,16.6]) rotate([-90,0,0]) prostruder_top_end(thread=false);
    
    translate([17,4.53, 33/2]) rotate([-90,0,0]) new_bottom_guide(bearing);
    
    //translate([17,4.53+1.4+5*4.53, 33/2]) rotate([-90,0,0]) tube_guide();
    //translate([17,4.53+1.4+6*4.53, 33/2]) rotate([-90,0,0]) tube_guide();
    
    translate([17,4.53+1.7+5*4.53-(16-2*4.53), 33/2]) rotate([-90,0,0]) new_top_guide(bearing);

    translate([34/2+10.4,22.8,-64]) mock_prometheus_motor();
    
    if (bearing == "623zz") {
        translate([34/2+17+10/2+0.4, 22.8, 33/2-4/2]) color("cyan") 623zz();
        translate([37.4,13.0,27]) rotate([180,0,-2.5]) hinge_623zz();
        import("../_downloaded/ProStruder/Front_4.5mm_[3D_Print.stl");
    } else if (bearing == "625zz") {
        translate([34/2+17+16/2+0.4, 22.7, 33/2-5/2]) color("cyan") 625zz();
        translate([37.4,13.0,26]) rotate([180,0,-2.5]) hinge_625zz();
        translate([37.4,13.0,7.2]) rotate([180,0,-2.5]) mirror([0,0,1]) hinge_625zz();
        translate([27.5,22.9,31]) rotate([180,0,0]) front_625zz();
        translate([27.5,22.9,6.7]) rotate([180,0,0]) back_625zz();
    }
}

module prostruder_top_end(thread=true) {
    thread_pitch = 6/7;
    thread_d = 9.5 - thread_pitch;
    
    difference() {
        import("../_downloaded/ProStruder/Top_4.5mm_[3D_Print.stl", convexity=3);
        translate([-35,-9/2,2.8]) cube([4.4,9,5]);
        translate([-40,-9/2-5.5,2]) rotate([0,-5,0]) cube([30,5.5,5]);
        translate([-40,9/2,2]) rotate([0,-5,0]) cube([30,5.5,5]);
        cylinder(d=9,h=10,$fn=80);
        cylinder(d1=10,d2=9,h=0.5,$fn=80);
        if (thread) {
            _v_thread(thread_d=thread_d, pitch=thread_pitch, rounds=20, direction=0, steps=50);
        } else {
            cylinder(d=thread_d,h=10);
        }
    }
}

module front_625zz() {
    difference() {
        import("../_downloaded/ProStruder/Front_4.5mm_[3D_Print.stl", convexity=3);
        hull() {
            translate([0,-1,-0.1]) cylinder(d=11,h=10,$fn=50);
            translate([17,-0.5,-0.1]) cylinder(d=11,h=10,$fn=50);
        }
        translate([9.9,9.9,-0.1]) cylinder(d=3.3,h=5,$fn=40);
    }
}

module back_625zz() {
    difference() {
        import("../_downloaded/ProStruder/Back_4.5mm_[3D_Print.stl", convexity=3);
        hull() {
            translate([0,-1,-0.1]) cylinder(d=11,h=10,$fn=50);
            translate([17,-0.5,-0.1]) cylinder(d=11,h=10,$fn=50);
        }
        translate([9.9,9.9,-0.1]) cylinder(d=3.3,h=5,$fn=40);
        translate([9.9,-9.9,-0.1]) cylinder(d=3.3,h=5,$fn=40);
        translate([-9.9,-9.9,-0.1]) cylinder(d=3.3,h=5,$fn=40);
    }
}

//bearing = "623zz";
bearing = "625zz";

//prostruder_assembly(bearing);

translate([0,10,16]) rotate([180,0,0]) new_top_guide(bearing);
new_bottom_guide(bearing);
//prostruder_top_end();

//hinge_625zz();
//front_625zz();
//back_625zz();
