module orig_arm() {
    translate([0,0,-55]) import("../_downloaded/B-struder_Bowden_extruder/2017-04-12_B-struder_arm_40Tgear+U604_M6ends.stl", convexity=10);
}

module motor_mount() {
    translate([0,0,-55]) import("../_downloaded/B-struder_Bowden_extruder/2017-04-12_B-studer_Motor_mount.stl", convexity=10);

}

module lock_lever() {
    translate([15.5,15.5,-53]) import("../_downloaded/B-struder_Bowden_extruder/2017-04-12_B-struder_lock_lever.stl");
}

module MR105ZZ_support() {
    translate([0,0,-71]) import("../_downloaded/B-struder_Bowden_extruder/2017-05-06_B-Struder-B-struder_MR105ZZ_support.stl");
}

module spring_cap() {
    translate([-32,9,-60.5]) import("../_downloaded/B-struder_Bowden_extruder/2017-04-12_B-struder_spring_cap.stl");
}

include <../lib/includes.scad>;

$fn=60;

module arm_body(height=15) {
    union() {
        hull() {
            translate([0,-18,0]) cube([18,1,height]);
            translate([15.5,15.5,0]) cylinder(d=18,h=height, $fn=40);
            translate([0,28,0]) cube([12,1,height]);
        }
        hull() {
            translate([0,9,0]) cube([1,19,height]);
            translate([-10,34,0]) cylinder(d=5,h=height, $fn=30);
        }
        hull() {
            translate([-10,34,0]) cylinder(d=5,h=height, $fn=30);
            translate([-12,40,0]) cylinder(d=5,h=height, $fn=30);
        }
    }
}

module E3D_HobGoblin() {
    difference() {
        // E3D HobGoblin
        cylinder(d=8,h=11, $fn=30);
        cylinder(d=5,h=12, $fn=30);
        translate([0,0,7.5]) donut(12.2,5);
        translate([0,0,2.9]) rotate([90,0,0]) cylinder(d=3,h=5,$fn=20);
    }
    translate([0,-2,2.9]) rotate([90,0,0]) cylinder(d=3,h=4,$fn=20);
}

module hinge(height=15) {
    module hinge_bearing() {
        union() {
            cylinder(d1=7, d2=10, h=1.5, $fn=40);
            translate([0,0,1.5]) cylinder(d=10,h=4,$fn=40);
            translate([0,0,1.5+4])cylinder(d1=10, d2=7, h=1.5, $fn=40);
        }
    }
    
    // hinge
    translate([15.5,15.5,0]) {
        difference() {
            union () {
                cylinder(d=7,h=height+1,$fn=40);
                translate([0,0,-1.5]) hinge_bearing();
                translate([0,0,height-4-1.5]) hinge_bearing();
            }
        }
    }
}

module hinge_support(height=15) {
    difference() {
        cylinder(d=5.1,h=height-8,$fn=40);
        cylinder(d=3.1,h=height-7,$fn=40);
    }
}

module fitting_hole_M5() {
    dist = 2.4;
    union() {
        difference() {
            cylinder(d=4.7,h=5, $fn=40);
            translate([dist,dist,0]) cube([2,2,40], center=true);
            translate([-dist,dist,0]) cube([2,2,40], center=true);
            translate([dist,-dist,0]) cube([2,2,40], center=true);
            translate([-dist,-dist,0]) cube([2,2,40], center=true);
        }
        translate([0,0,4]) cylinder(d1=3.7, d2=5.5,h=2, $fn=40);
    }
}

module fitting_hole_M6() {
    dist = 2.7;
    union() {
        difference() {
            cylinder(d=5.7,h=5, $fn=40);
            translate([dist,dist,0]) cube([2,2,40], center=true);
            translate([-dist,dist,0]) cube([2,2,40], center=true);
            translate([dist,-dist,0]) cube([2,2,40], center=true);
            translate([-dist,-dist,0]) cube([2,2,40], center=true);
        }
        translate([0,0,4.01]) cylinder(d1=4.7, d2=6.5,h=2, $fn=40);
    }
}

module spring_notch() {
    // spring notch
    translate([13,-14.5,15/2]) rotate([-90,0,-75]) difference() {
        hull() {
            cylinder(d=8,h=9, $fn=40);
            translate([8,0,0]) cylinder(d=18,h=9, $fn=40);
        }
        cylinder(d1=4.5, d2=2.5,h=2, $fn=40);
    }
}

module E3D_HobGoblin_hole(height=15) {
    // gear indent
    difference() {
        hull() {
            cylinder(d=8.5,h=height+1,$fn=40);
            translate([-15,-35/2,0]) cube([1,54,height+1]);
        }
        translate([0,0,height/2]) donut(12.8,5,80,-90/2-7);
        rotate([0,0,26]) translate([12.8/2,0,height/2]) rotate([-90,0,0]) cylinder(d=5,h=5);
    }
    translate([0,0,7.5+3]) cylinder(d=8+5,h=6);
}

module filament_holes(height=15, offset=5) {
    // filament tube and fitting holes
    translate([0,offset,height/2]) rotate([-90,0,0]) cylinder(d=2,h=30, $fn=30);
    translate([0,20,height/2]) rotate([-90,0,0]) cylinder(d1=2, d2=3.5,h=4, $fn=30);
    translate([0,-offset,height/2]) rotate([90,0,0]) cylinder(d=2,h=60, $fn=30);
    translate([0,30,height/2]) rotate([90,0,0]) cylinder(d=0.8,h=60, $fn=30);

    //translate([0,29-6,height/2]) rotate([-90,0,0]) fitting_hole_M6();
    //translate([0,-18+6,height/2]) rotate([90,0,0]) fitting_hole_M6();
    
    translate([0,29-5.99,height/2]) rotate([-90,0,0]) fitting_thread_M6(6);
    translate([0,-18+5.99,height/2]) rotate([90,0,0]) fitting_thread_M6(6);
}

module arm_E3D_HobGoblin_U604zz() {

    difference() {
        arm_body();
        hinge();
        spring_notch();
        
        E3D_HobGoblin_hole();
        
        translate([4.2,0,0]) filament_holes(offset=5);
        
        // idler hole
        #translate([10.7,0,0]) {
            cylinder(d=3.5, h=5, $fn=30);
            translate([0,0,5]) cylinder(d=4.2, h=15, $fn=30);
            translate([0,0,15-2.5]) cylinder(d=9, h=3, $fn=30);
            translate([0,0,5]) difference() {
                difference() {
                    hull() {
                        cylinder(d=13.3,h=5,$fn=60);
                        translate([20,-18/2,0]) cube([1,18,5]);
                    }
                    translate([0,0,5/2]) donut(13.5,2,110,125);
                }
                difference() {
                    cylinder(d=5.2,h=5,$fn=30);
                    translate([0,0,0.5+4/2]) rotate([0,0,45]) cube([2,8,4], center=true);
                    translate([0,0,0.5+4/2]) rotate([0,0,-45]) cube([2,8,4], center=true);
                }
            }
            
        }
    }
}

module arm_E3D_HobGoblin_608zz() {
    h = 16;
    idler_z = (h - 8)/2;
    
    difference() {
        arm_body(h);
        hinge(h);
        spring_notch(h);
        
        E3D_HobGoblin_hole(h);
        
        translate([4.2,0,0]) filament_holes(height=h, offset=5);
        
        // idler hole
        translate([15.9,0,0]) {
            cylinder(d=7.5, h=idler_z, $fn=30);
            translate([0,0,idler_z]) cylinder(d=8, h=15, $fn=30);
            translate([0,0,h-2.5]) cylinder(d=10, h=3, $fn=30);
            translate([0,0,idler_z]) difference() {
                hull() {
                    cylinder(d=22.5,h=8,$fn=60);
                    translate([25,-22.5/2,0]) cube([1,22.5,5]);
                }
                difference() {
                    cylinder(d=9.2,h=8,$fn=30);
                    translate([0,0,0.5+7/2]) rotate([0,0,45]) cube([2,10,7], center=true);
                    translate([0,0,0.5+7/2]) rotate([0,0,-45]) cube([2,10,7], center=true);
                }
            }
            
        }
    }
}

module arm_E3D_HobGoblin_2x623zz() {
    h = 15;
    idler_z = (h - 9)/2;
    
    difference() {
        arm_body(h);
        hinge(h);
        spring_notch(h);
        
        E3D_HobGoblin_hole(h);
        
        translate([4.2,0,0]) filament_holes(height=h, offset=5);
        
        // idler hole
        translate([9.9,0,0]) {
            cylinder(d=2.5, h=idler_z, $fn=30);
            translate([0,0,idler_z]) cylinder(d=3.1, h=15, $fn=30);
            translate([0,0,h-1]) cylinder(d=6, h=3, $fn=30);
            translate([0,0,idler_z]) difference() {
                hull() {
                    cylinder(d=10.4,h=9,$fn=60);
                    translate([25,-18/2,0]) cube([1,18,9]);
                }
                difference() {
                    cylinder(d=5.2,h=9,$fn=30);
                    translate([0,0,0.5+8/2]) rotate([0,0,45]) cube([1.5,10,8], center=true);
                    translate([0,0,0.5+8/2]) rotate([0,0,-45]) cube([1.5,10,8], center=true);
                }
            }
            
        }
        translate([0,0,12.5]) cylinder(d=12, h=10, $fn=40);
    }
}

module debug() {
    arm = 1;
    
    %motor_mount();
    
    if (arm == 0) { 
        intersection() {
            orig_arm();
            translate([-100/2,-100/2,0]) cube([100,100,15/2]);
        }
        %cylinder(d=11,h=11, $fn=40);
        %translate([12.9,0,5.5]) U604zz();
    } else if (arm == 1) {
        intersection() {
            arm_E3D_HobGoblin_U604zz();
           translate([-100/2,-100/2,0]) cube([100,100,15/2]);
        }
        %translate([0,0,11+4]) rotate([180,0,0]) E3D_HobGoblin();
        %translate([0,0,15.4]) MR105zz();
        %translate([10.5,0,5.5]) U604zz();
        %translate([0,0,19.4]) rotate([0,180,0]) new_MR105zz_support_E3D_HobGoblin();
    } else if (arm == 2) {
        intersection() {
            arm_E3D_HobGoblin_608zz();
            translate([-100/2,-100/2,0]) cube([100,100,15/2]);
        }

        %translate([0,0,0.5]) E3D_HobGoblin();
        %translate([15.9,0,4.5]) 608zz();
    } else if (arm == 3) {
        intersection() {
            arm_E3D_HobGoblin_2x623zz();
            //translate([-100/2,-100/2,0]) cube([100,100,15/2]);
        }

        %E3D_HobGoblin();
        x_offset = 9.8;
        %translate([x_offset,0,3.5]) 623zz();
        %translate([x_offset,0,7.5]) 623zz();
    }
}


module new_motor_mount() {
    difference() {
        union() {
            translate([0,0,5]) motor_mount();
            translate([-30,-20,0]) cube([12.5,40,3]);
            translate([31/2,31/2,3]) cylinder(d1=8.5,d2=5.5,h=2,$fn=30);
        }
        translate([-26, 15,0]) cylinder(d=4.2,h=5,$fn=30);
        translate([-26, -14,0]) cylinder(d=4.2,h=5,$fn=30);
        translate([31/2,-31/2,1.51]) cylinder(d1=3,d2=6,h=1.5,$fn=30);
        translate([31/2,31/2,1.51]) cylinder(d=3.2,h=3.5,$fn=30);
    }
}

module new_lock_lever_E3D_HobGoblin() {
    difference() {
        union() {
            rotate([0,0,55]) lock_lever();
            mirror([0,1,0]) lock_lever();
            cylinder(d=9.6,h=13+3.4,$fn=40);
        }
        cylinder(d=3.3,h=18+5,$fn=20);
    }
}

module new_MR105zz_support_E3D_HobGoblin() {
    difference() {
        union() {
            MR105ZZ_support();
            translate([31/2,31/2,0]) cylinder(d=9.5,h=18+3.4,$fn=40);
        }
        translate([31/2,31/2,0]) cylinder(d=3.3,h=18+5,$fn=20);
    }
}

module E3D_HobGoblin_spacer() {
    difference() {
        cylinder(d=9.5,h=3.4,$fn=40);
        cylinder(d=3.3,h=5,$fn=20);
    }
}

module new_spring_cap_8mm_spring() {
    //spring_cap();
    difference() {
        union() {
            difference() {
                cylinder(d=10.2,h=6, $fn=30);
                translate([0,0,1.5]) cylinder(d=8.2,h=7, $fn=25);
            }
            translate([0,0,1.5]) cylinder(d1=4.5,d2=3.3,h=2, $fn=20);
        }
        cylinder(d=2.5,h=2.5, $fn=25);
    }
}

//debug();

//translate([50,0,0]) orig_arm();
//arm_E3D_HobGoblin_U604zz();
//arm_E3D_HobGoblin_608zz();
//arm_E3D_HobGoblin_2x623zz();
//hinge_support();
//new_motor_mount();
new_lock_lever_E3D_HobGoblin();
//new_MR105zz_support_E3D_HobGoblin();
//E3D_HobGoblin_spacer();
//new_spring_cap_8mm_spring();
