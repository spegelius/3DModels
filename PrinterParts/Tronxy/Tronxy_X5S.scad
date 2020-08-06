
use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;
use <../../Dollo/New_long_ties/mockups.scad>;
use <../../lib/includes.scad>;

module tronxy_z_rod_top_washer() {
    $fn=50;
    difference() {
        union() {
            cylinder(d1=8, d2=11, h=3.2);
            translate([0,0,3.19]) cylinder(d=11, h=6);
        }
        cylinder(d=4.2, h=20);
        translate([-10,3,3.19]) cube([20,6,10]);
        translate([-10,-3-6,3.19]) cube([20,6,10]);
    }
}

module tronxy_board_frame_adapters() {
    h = 6;
    
    module side_adapter(w) {
        difference() {
            union() {
                rounded_cube_side(w,40,h,4);
                rounded_cube_side(w,21.5,h+2,4);
            }
            translate([-0.01,-1,h-0.01]) rounded_cube_side(w+0.02,21,h,5);
            translate([w/2,10,-0.1]) cylinder(d=4.5,h=10,$fn=30);
            translate([w/2,10,-0.1]) M4_nut();
            translate([w/2,30,-0.1]) cylinder(d=4.5,h=10,$fn=30);
        }
    }
    
    module bottom_adapter() {
        w = 20.1;
        difference() {
            union() {
                rounded_cube_side(w,40,h,4);
                rounded_cube_side(w,20,h+2,4);
            }
            translate([1.5,-0.01,h-0.01]) rounded_cube_side(w+0.02,20.02,h,5);
            translate([10+1.5,10,-0.1]) cylinder(d=4.5,h=10,$fn=30);
            translate([10+1.5,10,-0.1]) M4_nut();
            translate([w/2,30,-0.1]) cylinder(d=4.5,h=10,$fn=30);
        }
    }
    
    //side_adapter(17.8);
    translate([25,0,0]) side_adapter(20.1);
    
    translate([-25,0,0]) bottom_adapter();
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

pcw_mount_w = 40;
pcw_mount_l = 44;

module tronxy_cable_pcb_mount() {
    h = 40;

    difference() {
        union() {
            cube([pcw_mount_w,pcw_mount_l,3]);
            translate([-2,0,0])
            cube([6.3,22.5,h]);

            translate([0,20.5,0])
            cube([9,2,h-2]);

            cube([7,22,5.2]);

            translate([-1,22.5/2,h-15.8+9])
            chamfered_cube(4,22.5,9,1,center=true);

            translate([-1,22.5/2,5.2+9])
            chamfered_cube(4,22.5,9,1,center=true);
        }
        translate([9,0,3])
        rotate([0,-8,0])
        cube([12,24,h]);

        translate([-0.3/2,2,h-15.9])
        cube([2.3,18.5,22]);
        
        translate([-1,2.25+5,h-15.8+9]) {
            rotate([0,-90,0]) {
                cylinder(d=3.3,h=11,center=true,$fn=20);
                M3_nut();
            }
        }
        translate([-1,2.25+18-5,h-15.8+9]) {
            rotate([0,-90,0]) {
                cylinder(d=3.3,h=11,center=true,$fn=20);
                M3_nut();
            }
        }

        translate([-1,2.25+5,5.2+9]) {
            rotate([0,-90,0]) {
                cylinder(d=3.3,h=11,center=true,$fn=20);
                M3_nut();
            }
        }
        translate([-1,2.25+18-5,5.2+9]) {
            rotate([0,-90,0]) {
                cylinder(d=3.3,h=11,center=true,$fn=20);
                M3_nut();
            }
        }
        
        translate([13,9,-0.1])
        cube([21,26,4]);

        translate([12,8,1.5])
        cube([23,28,4]);
        
        translate([23.5,4,-0.1])
        cylinder(d=3.3,h=5,$fn=20);

        translate([23.5,pcw_mount_l-4,-0.1])
        cylinder(d=3.3,h=5,$fn=20);
    }
}

module tronxy_cable_pcb_mount_fasterner() {
    difference() {
        union() {
            hull() {
                translate([26/2,4,0]) cylinder(d=7,h=2,$fn=20);
                translate([0,6,0]) cube([26,pcw_mount_l-12,2]);
                translate([26/2,pcw_mount_l-4,0]) cylinder(d=7,h=2,$fn=20);
            }
            translate([26/2,4]) cylinder(d=8,h=5,$fn=20);
            translate([26/2,pcw_mount_l-4]) cylinder(d=8,h=5,$fn=20);

        }
        translate([3,(pcw_mount_l-25)/2,-0.1]) cube([20,25,14]);
        translate([26/2,4]) cylinder(d=3.3,h=5,$fn=20);
        translate([26/2,pcw_mount_l-4]) cylinder(d=3.3,h=5,$fn=20);
        
        translate([26/2,4,3]) M3_nut();
        translate([26/2,pcw_mount_l-4,3]) M3_nut();
    }
}

module tronxy_bed_spacer() {
    difference() {
        cube([35,10,15],center=true);
        translate([-10,0,0]) cylinder(d=4.5,h=16,center=true,$fn=40);
        translate([10,0,0]) cylinder(d=4.5,h=16,center=true,$fn=40);
    }
}



module qnd_motor_mount_fix() {
    //translate([90,203.5,0]) rotate([0,0,-13]) translate([-90,-203.5,0]) tronxy_motor_mount();
    //%tronxy_motor_mount();

    difference() {
        union() {
            chamfered_cube_side(28,35,20,3);
            translate([-33.7,30.6]) rotate([0,0,-13]) {
                cube([40,19.8,20]);
                translate([20,-5,0]) cube([39,29.8,20]);
            }
            translate([0,5.9,0]) rotate([0,0,45]) cube([20,21.65,20]);
        }
        translate([30,30,0]) rotate([0,0,60]) cube([20,50,20]);
        translate([8,7,-0.1]) cube([25,20.2,20+1]);
        translate([-20,7+20.2/2,20/2]) rotate([0,90,0]) cylinder(d=4.4,h=30,$fn=40);
        translate([-20,7+20.2/2,20/2]) rotate([0,90,0]) cylinder(d=10,h=21,$fn=40);
        
        translate([-33.7,30.6,20/2]) rotate([0,90,-13]) translate([0,19.8/2-1,-1]) cylinder(d=3.7,h=27,$fn=40);
    }
}

module motor_mount_adapter_dollo() {
    //translate([90,203.5,0]) rotate([0,0,-13]) translate([-90,-203.5,0]) tronxy_motor_mount();
    //%tronxy_motor_mount();

    difference() {
        union() {
            chamfered_cube_side(35,40,20,3);
            translate([-33.7,30.6]) rotate([0,0,-13]) {
                cube([40,19.8,20]);
                translate([20,-5,0]) cube([39,29.8,20]);
            }
            translate([0,3,0]) rotate([0,0,40.1]) cube([20,23.8,20]);
        }
        translate([35,37,0]) rotate([0,0,65]) cube([20,50,20]);
        translate([6,0,-0.1]) cube([35,30,20+1]);
        translate([6,15,0]) rotate([0,0,90]) male_dovetail();
        translate([6+15,30,0]) male_dovetail();
        
        translate([-33.7,30.6,20/2]) rotate([0,90,-13]) translate([0,19.8/2-1,-1]) cylinder(d=3.7,h=27,$fn=40);
    }
}


module tronxy_PTFE_holder() {

    difference() {
        union() {
            cube([30,6.5,20]);
            translate([22-3,-2,0]) cube([6,2.2,20]);
            rotate([0,0,10]) cube([5,25,20]);
            rotate([0,0,10]) translate([5/2,25,0]) cylinder(d=8,h=20,$fn=30);
        }
        translate([22,-1,20/2]) rotate([-90,0,0]) cylinder(d=4.3,h=10,$fn=30);
        translate([0,-10.01,3]) chamfered_cube(30,10,14,2);
        
        rotate([0,0,10]) translate([5/2,25,0]) cylinder(d1=4.5,d2=2.2,h=16,$fn=20);
        rotate([0,0,10]) translate([5/2,25,15.99]) cylinder(d=4,h=15,$fn=20);
        
        rotate([0,0,45]) cube([4,8,60],center=true);
        translate([30,6.5]) rotate([0,0,45]) cube([4,4,60],center=true);
    }
}

module tronxy_motor_mount_spacer() {
    difference() {
        union() {
            cube([44,20,7]);
            translate([0,7,0]) cube([44,6,8.5]);
        }
        translate([8,20/2,0]) cylinder(d=4.5,h=20,center=true,$fn=30);
        translate([8+18,20/2,0]) cylinder(d=4.5,h=20,center=true,$fn=30);
    }
}

module tronxy_z_endstop_mount() {
    difference() {
        union() {
            chamfered_cube_side(20,45,5,4);
            translate([7,0,-1.5]) cube([6,45,5]);
            translate([6,0,0]) cube([5,20,17]);
        }
        %translate([0,0,10]) rotate([90,0,90]) mechanical_endstop();
        cube([6,20,10]);
        translate([0,20,0]) rotate([0,0,45]) cube([sqrt(6*6*2),sqrt(6*6*2),10],center=true);
        translate([10,25,0]) cylinder(d=4.5,h=11,center=true,$fn=20);
        translate([10,40,0]) cylinder(d=4.5,h=11,center=true,$fn=20);
        
        translate([3,5,13]) rotate([0,90,0]) cylinder(d=1.3,h=10,$fn=10);
        translate([3,15,13]) rotate([0,90,0]) cylinder(d=1.3,h=10,$fn=10);
    }
}

module tronxy_z_position_nut() {
    dents = 26;
    difference() {
        union() {
            translate([0,0,1/2]) rounded_cylinder(23,3,1,$fn=50);
            cylinder(d=12,h=5,$fn=40);
        }
        cylinder(d=3.2,h=5,$fn=20);
        nut();
        
        for(i=[0:dents-1]) {
            rotate([0,0,360/dents*i]) translate([24/2+0.4,0,0]) rotate([0,0,45]) cube([2,2,10],center=true);
        }
    }
}

module tronxy_wire_chain_support() {
    tilt = 3;
    l = 80;
    difference() {
        intersection() {
            union() {
                cube([5,l+13,25]);
                translate([0,l,25/2])
                rotate([-tilt,0,0]) {
                    translate([10/2,-18.4/2-5/2,0])
                    cube([10,5,50],center=true);

                    translate([10/2,18.4/2+5/2,0])
                    cube([10,5,50],center=true);
                }
                translate([7.5/2,20/2,25/2])
                cube([7.5,6,25],center=true);
            }
            cube([20,l+20,25]);
        }
        translate([5.01,0,25/2-16/2])
        chamfered_cube(6,19,16,2.5);

        translate([0,10,25/2])
        rotate([0,90,0])
        cylinder(d=4.4,h=20,center=true,$fn=40);
        
        translate([0,l,25/2])
        rotate([-tilt,0,0]) {
            translate([2,0,-8/2]) {
                rotate([0,-90,0]) {
                    M3_nut();
                    cylinder(d=3.3,h=10,center=true,$fn=30);
                }
            }
            translate([2,0,8/2]) {
                rotate([0,-90,0]) {
                    M3_nut();
                    cylinder(d=3.3,h=10,center=true,$fn=30);
                }
            }
        }
    }
}

module tronxy_corner_bearing_mount_left() {
    //%translate([0,20,5]) rotate([0,180,0]) import("../../../Drivers/Tronxy/X5S-2EV2.0 -En/stl/gou-lun-db-l.stl");
    
    h = 40;
    
    pulley_d = 35;
    
    //translate([0,0,-13/2]) rotate([90,-45,0]) difference() {
    difference() {
        union() {
            chamfered_cube_side(20,50,h,4);
            chamfered_cube_side(40,35,h,4);
            translate([-5,0,-20]) chamfered_cube(10,35,h,4);
            translate([0,-5,-20]) chamfered_cube(35,10,h,4);
        }
        translate([34,10,0]) {
            cylinder(d=4.3,h=h*3,center=true,$fn=40);
            translate([0,0,5]) cylinder(d=8.5,h=h,$fn=50);
        }
        translate([18,10,0]) {
            cylinder(d=4.3,h=h*3,center=true,$fn=40);
            translate([0,0,5]) cylinder(d=8.5,h=h,$fn=50);
        }
        translate([10,44,0]) {
            cylinder(d=4.3,h=h*3,center=true,$fn=40);
            translate([0,0,5]) cylinder(d=8.5,h=h,$fn=50);
        }
        
        translate([30,26,0]) {
            cylinder(d=5.2,h=h*3,center=true,$fn=50);
            translate([0,0,5]) hull() {
                cylinder(d=pulley_d,h=h-10,$fn=50);
                translate([-10,30,0]) cylinder(d=pulley_d,h=h-10,$fn=50);
                translate([30,-5,0]) cylinder(d=pulley_d,h=h-10,$fn=50);
            }
        }

        hull() {
            translate([-1,50,3]) cube([50,50,1]);
            translate([-1,32,h]) cube([50,50,1]);
        }
        
        translate([0,25,-10]) rotate([0,90,0]) cylinder(d=4.3,h=10,center=true,$fn=40);
        translate([25,0,-10]) rotate([90,0,0]) cylinder(d=4.3,h=10,center=true,$fn=40);
        
        rotate([0,0,45]) cube([8,25,h*3],center=true);
        translate([0,0,-30]) cube([40,40,30]);
    }
}

module tronxy_corner_bearing_mount_right() {
    mirror([1,0,0]) tronxy_corner_bearing_mount_left();
}

module gt2_idler_625zz() {
    d = 24;
    h = 11;
    union() {
        difference() {
            union() {
                hull() {
                    cylinder(d=d+8,h=1,$fn=80);
                    cylinder(d=d+7,h=1.5,$fn=80);
                }
                cylinder(d=d,h=h-1.5,$fn=100);
                translate([0,0,h-1.5]) cylinder(d1=d-5,d2=d-2,h=1.5,$fn=80);
            }
            cylinder(d=16+0.5,h=h*3,$fn=80);
            for(i=[0:3]) {
                rotate([0,0,360/4*i]) translate([(d-5)/2+2/2,0,h-1.5+2/2]) cube([2,6,2],center=true);
            }
        }
        for(i=[0:4]) {
            rotate([0,0,360/5*i]) translate([17/2,0,0]) cylinder(d=1.5,h=h,$fn=20);
        }
        translate([0,0,h/2]) cube_donut(17,2);
    }
}

module gt2_idler_625zz_retainer() {
    d = 24;
    h = 11;
    union() {
        difference() {
            hull() {
                translate([0,0,0.5]) cylinder(d=d+8,h=1,$fn=80);
                cylinder(d=d+7,h=1.5,$fn=80);
            }
            cylinder(d=d-1.8,h=2,$fn=80);
        }
        difference() {
            for (i=[0:3]) {
                rotate([0,0,i*90+45]) translate([(d-4.8)/2+2/2,0,1.5/2]) cube([2,5.5,1.5],center=true);
            }
            cylinder(d1=d-4.8,d2=d-1.8,h=1.5,$fn=80);
            translate([0,0,1.2]) cylinder(d=20.2,h=1.2,$fn=80);
        }
    }
}

//gt2_belt();
//rounded_gt2_belt(10, 30);
//tronxy_z_rod_top_washer();
//tronxy_board_frame_adapters();
hotend_pcb();
//tronxy_cable_pcb_mount();
//tronxy_cable_pcb_mount_fasterner();
//tronxy_bed_spacer();
//qnd_motor_mount_fix();
//motor_mount_adapter_dollo();
//tronxy_PTFE_holder();
//tronxy_motor_mount_spacer();
//rotate([90,0,0]) tronxy_z_endstop_mount();
//tronxy_z_position_nut();
//tronxy_wire_chain_support();
//tronxy_corner_bearing_mount_right();
//tronxy_corner_bearing_mount_left();
//gt2_idler_625zz();
//gt2_idler_625zz_retainer();
