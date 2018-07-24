
include <../lib/includes.scad>;

height = 19;

small_ball = 19.03;
big_ball = 25.3;

module lamp_clip() {
    difference() {
        cylinder(d=21.5, h=height, $fn=60);
        cylinder(d=18.5, h=height, $fn=60);
        translate([-25,0,0]) rotate([0,0,45]) cube([40,40,40], center=true);
    }
}

module body() {
    difference() {
        import("../_downloaded/Arachnid_task_lamp/clip.STL");
        translate([-27.16,0,-0.1]) cylinder(d=27.2,h=height+1, $fn=80);
    }
}

module clip_18_5mm() {
    union() {
        body();
        translate([-24,0,0]) lamp_clip();
    }
}

module _cup() {
    rotate([0,0,30]) intersection() {
        import("../_downloaded/Arachnid_task_lamp/spider.STL", convexity=10);
        union() {
            translate([0,0,4.33]) sphere(d=31.86, $fn=100);
            rotate([0,0,-30]) translate([0,20,0]) cube([14,40,30], center=true);
        }
    }
}

module utility_plate() {
    
    union() {
        cube([10,50,4], center=true);
        cube([50,10,4], center=true);
        cylinder(d=15,h=15, $fn=40);
        translate([0,0,10+big_ball/2]) sphere(d=big_ball);
    }
    
}

module camera_mount_joint() {
    $fn=50;
    union() {
        translate([0,27.5,0]) _cup();
        difference() {
            rounded_cylinder(28,15, 3);
            intersection() {
                cylinder(d=23.2,h=15);
                cube([19,25,30], center=true);
            }
            translate([0,-20,0]) cube([2,40,30], center=true);
        }
        translate([-19/2-2, 0, 15/2]) sphere(d=5);
        translate([19/2+2, 0, 15/2]) sphere(d=5);
    }
}

module camera_clip_xperia_zx() {
    $fn=50;
    
    d = 8.5;
    width = 72 - 1 - d;

    module clip() {
        difference() {
            union() {
                hull() {
                    translate([0,0,19/2]) cube([d+4,d+4,19],center=true);
                    translate([width,0,0]) cylinder(d=d+4, h=19);
                }
                translate([width/2,d/2,0]) {
                    hull() {
                        translate([0,d+4,0]) cylinder(d=10,h=19);
                        cylinder(d=6,h=19);
                    }
                }
            }
            hull() {
                cylinder(d=d, h=19);
                translate([width,0,0]) cylinder(d=d, h=19);
            }
            translate([0,-d,0]) cube([width,5,19]);
            translate([width/2-2/2,0,0]) cube([2,10,19]);
            
            translate([width/2,d/2,0]) {
                hull() {
                    translate([0,d+4,0]) cylinder(d=6,h=19);
                    cylinder(d=2,h=19);
                }
            }
        }

    }
   
    union() {
        difference() {
            translate([0,0,19/2]) rotate([0,90,0]) intersection() {
                cylinder(d=23,h=15);
                cube([19,25,30], center=true);
            }
            translate([15/2,0,0]) cylinder(d=3,h=20, $fn=30);
        }
        translate([14.9,0,0]) intersection() {
            cylinder(d=23,h=19);
            translate([0,-23/2,0]) cube([13,23,19]);
        }
        translate([15+23/2+8/2,0,0]) clip();
    }
}

module debug() {
    //translate([31.59,0,6.85]) sphere(d=19.03, $fn=90);
    intersection() {
        union() {
            translate([0,0,-25]) import("../_downloaded/Arachnid_task_lamp/spider.STL", convexity=10);
            translate([0,0,-20.65]) sphere(d=25.3, $fn=90);
        }
        translate([0,0,-30]) cube([50,50,50]);
    }
}

//debug();
//utility_plate();

//clip_18_5mm();

//camera_mount_joint();
camera_clip_xperia_zx();