// Remixes https://www.thingiverse.com/thing:3346466

use <../../PCParts/common.scad>;
include <../../Dollo/New_long_ties/globals.scad>;
use <../../Dollo/New_long_ties/include.scad>;
use <../../Dollo/New_long_ties/mockups.scad>;

module _original() {
    rotate([-180,0,-90]) translate([-165,-38.25,-56]) import("../../_downloaded/Tronxy_X5S_Single_Z_und_stabiles_Druckbett/X5S_Z-Achsentuning_Schiene_unten_links.stl", convexity=10);
}

module _original_motor_mount() {
    rotate([180,0,0]) translate([11,273,-144.4]) import("../../_downloaded/Tronxy_X5S_Single_Z_und_stabiles_Druckbett/X5S_Z-Achsentuning_Motorhalterung_Z-Motor_V2.stl", convexity=10);
}

module _bearing_hole() {
    d = 16;
    difference() {
        union() {
            translate([0,0,1.2]) cylinder(d=d+0.2,h=7,$fn=60);
            cylinder(d=d-2,h=7,$fn=60);
        }
        cylinder(d1=7,d2=1.3,h=2,$fn=30);
    }
}

module _long_nut() {
    hull() {
        rotate([0,0,360/6/2]) nut(h=2.7, cone=false);
        translate([0,6,0]) rotate([0,0,360/6/2]) nut(h=2.7, cone=false);
    }
}

module z_bottom_top() {
    h = 34;
    difference() {
        union() {
            hull() {
                translate([0,0,1/2]) cube([20,75,1],center=true);
                translate([0,0,-1/2+h]) cube([20,90,1],center=true);
            }
            translate([20/2-1,0,10/2]) chamfered_cube_side(5,6,10,2,center=true);
        }
        translate([0,0,h/2+10]) cube([30,58.3,h],center=true);
        hull() {
            translate([0,0,h/2+10]) cube([1,65.2,h],center=true);
            translate([0,0,h/2+10]) cube([20,45.2,h],center=true);
        }
        translate([0,37.5,-1]) {
            hull() {
                cylinder(d=8.5,h=h-2,$fn=30);
                translate([0,10,0]) cylinder(d=8.5,h=h-2,$fn=30);
            }
            translate([0,0,h-2+0.2]) cylinder(d=4.2,h=4,$fn=30);
        }
        
        translate([0,-37.5,-1]) {
            hull() {
                cylinder(d=8.5,h=h-2,$fn=30);
                translate([0,-10,0]) cylinder(d=8.5,h=h-2,$fn=30);
            }
            translate([0,0,h-2+0.2]) cylinder(d=4.2,h=4,$fn=30);
        }
        
        cylinder(d=8.5,h=h-10,$fn=40);
        
        translate([0,0,10-6.4]) _bearing_hole();
        
        //translate([0,10,23]) rotate([0,0,45]) chamfered_cube(12,50,24,5.5,center=true);
    }
}

module z_bottom() {
    h = 32;
    module _body() {
        difference() {
            union() {
                translate([0,0,8/2]) cube([20,180,8],center=true);
                translate([0,0,h/2]) cube([20,58,h],center=true);
                //cylinder(d=24.2,h=15,$fn=60);
                hull() {
                    translate([0,0,h/2]) cube([1,65,h],center=true);
                    translate([0,0,h/2]) cube([20,45,h],center=true);
                }
                translate([0,65,0]) cylinder(d=20,h=22,$fn=30);
                translate([0,-65,0]) cylinder(d=20,h=22,$fn=30);
            }
            translate([0,0,40/2+15]) cube([30,50,40],center=true);
            translate([0,37.5,0]) cylinder(d=4.2,h=50,center=true,$fn=30);
            translate([0,-37.5,0]) cylinder(d=4.2,h=50,center=true,$fn=30);
            
            translate([0,65,0]) {
                cylinder(d=4.2,h=50,center=true,$fn=30);
                translate([0,0,1]) cylinder(d=8.1,h=50,$fn=30);
                translate([0,0,15]) rotate([0,90,0]) cylinder(d=3.2,h=15,$fn=20);
                translate([8,0,15]) rotate([90,0,-90]) _long_nut();
            }
            
            translate([0,-65,0]) {
                cylinder(d=4.2,h=50,center=true,$fn=30);
                translate([0,0,1]) cylinder(d=8.1,h=50,$fn=30);
                translate([0,0,15]) rotate([0,90,0]) cylinder(d=3.2,h=15,$fn=20);
                translate([8,0,15]) rotate([90,0,-90]) _long_nut();
            }
            
            translate([0,82,0]) {
                cylinder(d=4.2,h=50,center=true,$fn=30);
                translate([0,0,8]) cylinder(d=8.2,h=4,center=true,$fn=30);
            }
            translate([0,-82,0]){
                cylinder(d=4.2,h=50,center=true,$fn=30);
                translate([0,0,8]) cylinder(d=8.2,h=4,center=true,$fn=30);
            }
            translate([0,0,15-6.4]) _bearing_hole();
            
            translate([0,10,27]) rotate([0,0,-45]) chamfered_cube(12,50,24,5.5,center=true);
            translate([0,-10,27]) rotate([0,0,45]) chamfered_cube(12,50,24,5.5,center=true);
            
            translate([0,52,0]) cube([6.2,15.2,5],center=true);
            translate([0,-52,0]) cube([6.2,15.2,5],center=true);
        }
    }
    
    union() {
        _body();
    }
    %translate([0,0,h+2+8]) rotate([0,180,180]) z_bottom_top();
}

module z_top() {
    difference() {
        union() {
            translate([0,0,5/2]) cube([20,145,5],center=true);
            translate([0,65,0]) cylinder(d=14,h=14,$fn=30);
            translate([0,-65,0]) cylinder(d=14,h=14,$fn=30);
            //v_screw(h=15, screw_d=15, pitch=3, direction=0, steps=100);
            cylinder(d=15,h=15,$fn=40);
        }
        translate([0,65,1]) {
            hull() {
                cylinder(d=8.2,h=22,$fn=30);
                translate([10,0,0]) cylinder(d=8.3,h=22,$fn=30);
            }
            cylinder(d=4.3,h=15,$fn=20,center=true);
            translate([0,0,10]) donut(15.5,1,$fn=30);
        }
        translate([0,-65,1]) {
            hull() {
                cylinder(d=8.2,h=22,$fn=30);
                translate([10,0,0]) cylinder(d=8.3,h=22,$fn=30);
            }
            cylinder(d=4.3,h=15,$fn=20,center=true);
            translate([0,0,10]) donut(15.5,1,$fn=30);
        }
        translate([0,0,2]) hull() {
            cylinder(d=9,h=25,$fn=40);
            translate([10,0,0]) cylinder(d=9,h=25,$fn=40);
        }
        translate([0,0,11]) donut(16.5,1,$fn=30);
        
        translate([0,33,0]) cylinder(d=4.3,h=15,center=true,$fn=40);
        translate([0,-33,0]) cylinder(d=4.3,h=15,center=true,$fn=40);
        translate([0,49,0]) cube([6.2,15.2,5],center=true);
        translate([0,-49,0]) cube([6.2,15.2,5],center=true);
    }
}

module rod_clip(inner_d=14,h=9, wall=1.7) {
    
    module _arm() {
        hull() {
            cylinder(d=wall,h=9/2-0.1,$fn=20);
            translate([-7,-5,0]) cylinder(d=wall,h=9/2-0.1,$fn=20);
        }
    }
    
    union() {
        difference() {
            cylinder(d=inner_d+2*wall,h=h,$fn=40);
            difference() {
                cylinder(d=inner_d+.2,h=h+1,$fn=40);
                hull() {
                    cylinder(d=inner_d-6.1,h=10,$fn=40);
                    translate([10,0,0]) cylinder(d=inner_d-6.1,h=10,$fn=40);
                }
                translate([0,0,6]) intersection() {
                    donut(inner_d+1.5,0.9,$fn=30);
                    translate([-30/2,0,0]) cube([30,30,h*3],center=true);
                }
            }
            cylinder(d=inner_d-5.7,h=h+2,$fn=40);
            cube([4,inner_d-5.7,h*3],center=true);
            
            translate([-(inner_d+4)/2,0,0]) cube([6,4,h*3],center=true);
        }
        translate([-inner_d/2-0.8,2.2,0]) _arm();
        translate([-inner_d/2-0.8,-2.2,9]) rotate([180,0,0]) _arm();
        
        // support
        translate([-inner_d/2-7.8,2.8]) cylinder(d=3,h=9/2-0.1,$fn=20);
    }
}

module z_screw_clip() {
    rod_clip(inner_d=15,h=19,wall=2);
}

module z_bottom_centering_peg() {
    translate([0,0,5/2]) cube([6,15,5],center=true);
}

module z_motor_mount() {
    
    h = 43;
    
    module bearing_indent() {
        difference() {
            chamfered_cylinder(d=24,h=11,chamfer=1,$fn=50);
            cylinder(d1=6,d2=4.5,h=1,$fn=40);
            translate([0,0,10]) cylinder(d2=6,d1=4.5,h=1,$fn=40);
        }
    }
    
    difference() {
        union() {
            translate([-68/2+43/2,0,h/2]) cube([68,60,h],center=true);
            translate([-25/2-68+43/2+25,0,(h+12)/2]) cube([25,60,h+12],center=true);
        }
        translate([0,0,(h-4)/2]) cube([43.1,43.1,h-4],center=true);
        translate([-26,0,2]) rotate([0,-30,0]) cube([10,20,20],center=true);

        // bearing hole
        translate([0,0,9/2+h]) cube([103.1,53,9],center=true);
        translate([-43,0,9/2+h]) hull() {
            cube([1,53,9],center=true);
            translate([-6,0,0]) cube([1,63,9],center=true);
        }
        
        translate([0,0,(h-12)/2+4]) cube([103.1,43.1,h-12],center=true);
        translate([0,0,h-5]) motor_plate_holes(h=5, bolt_head_cones=true, center_chamfer=true);
        translate([-36,14,h-1]) bearing_indent();
        translate([-36,-14,h-1]) bearing_indent();
        
        translate([-36,14,h-15]) cylinder(d=3.2,h=30,$fn=30);
        translate([-36,-14,h-15]) cylinder(d=3.2,h=30,$fn=30);
        
        translate([-365,14,h-8.1]) nut(cone=false);
        translate([-36,-14,h-8.1]) nut(cone=false);
        
        translate([0,65/2,20/2+5]) chamfered_cube(100,10,20,3,center=true);
        translate([0,-65/2,20/2+5]) chamfered_cube(100,10,20,3,center=true);
        
        translate([-22,-43/2,15]) rotate([90,0,0]) {
            M4_nut(cone=false);
            cylinder(d=4.2,h=30,center=true,$fn=30);
            translate([0,14,8.6]) rotate([0,45,0]) cube([1,10,1],center=true);
        }
        translate([-22,43/2,15]) rotate([-90,0,0]) {
            M4_nut(cone=false);
            cylinder(d=4.2,h=30,center=true,$fn=30);
            translate([0,-14,8.6]) rotate([0,45,0]) cube([1,10,1],center=true);
        }
    }
    
    %translate([0,42/2,19.5]) rotate([90,0,0]) mock_stepper_motor();
    //%translate([-35,14,h]) import("../../_downloaded/Parametric_idler_pulley/beltpulley_623.stl");
    %translate([-36,14,h]) 623zz_idler_pulley();
    %translate([-36,14,h+9]) rotate([180,0,0]) pulley_washer();
    %translate([0,0,h+15]) rotate([180,0,0]) import("../../_downloaded/Parametric_pulley/GT2_16teeth.stl");
    
    %translate([25,0,20/2+5]) rotate([180,0,0]) z_motor_mount_arm();
}

module z_motor_mount_arm() {
    
    module _arm() {
        translate([-15,0,0]) difference() {
            chamfered_cube(120,10,20,3,center=true);
            // reinforcement
            cube([121,0.1,0.2],center=true);
            translate([0,0,6]) cube([121,0.1,0.2],center=true);
            translate([0,0,-6]) cube([121,0.1,0.2],center=true);
        }
    }

    difference() {
        union() {
            translate([0,65/2,0]) _arm();
            translate([0,-65/2,0]) _arm();
            translate([90/2-5/2,0,5/2]) cube([5,115,25],center=true);
            translate([90/2+20/2,0,-20/2+5/2]) cube([20,75,5],center=true);
            translate([90/2-5/2,32.5,15/2]) hull() {
                cube([5,4,15],center=true);
                translate([-25/2,0,-5/2]) cube([25,4,10],center=true);
            }
            translate([90/2-5/2,-32.5,15/2]) hull() {
                cube([5,4,15],center=true);
                translate([-25/2,0,-5/2]) cube([25,4,10],center=true);
            }
            
            translate([90/2-5/2,115/2-27/2,-20/2+5/2]) hull() {
                cube([5,27,5],center=true);
                translate([-140/2,-20/2,0]) cube([25,1,5],center=true);
            }
            translate([90/2-5/2,-115/2+27/2,-20/2+5/2]) hull() {
                cube([5,27,5],center=true);
                translate([-140/2,20/2,0]) cube([25,1,5],center=true);
            }
        }
        translate([90/2,-23,5]) rotate([0,90,0]) cylinder(d=4.2,h=10,center=true,$fn=30);
        translate([90/2,23,5]) rotate([0,90,0]) cylinder(d=4.2,h=10,center=true,$fn=30);
        
        translate([90/2+20/2,27,-10]) hull() {
            cylinder(d=4.2,h=10,center=true,$fn=30);
            translate([30,0,0]) cylinder(d=4.2,h=10,center=true,$fn=30);
        }
        translate([90/2+20/2,-27,-10]) hull() {
            cylinder(d=4.2,h=10,center=true,$fn=30);
            translate([30,0,0]) cylinder(d=4.2,h=10,center=true,$fn=30);
        }
        
        for(i = [0:12]) {
            translate([-24-i*3.35,0,0]) rotate([90,0,0]) cylinder(d=4.2,h=100,center=true,$fn=30);
        }
        
        intersection() {
            translate([-24,0,0]) rotate([90,0,0]) hull() {
                cylinder(d=4.2,h=100,center=true,$fn=30);
                translate([-40,0,0]) cylinder(d=4.2,h=100,center=true,$fn=30);
            }
            translate([0,0,5/2]) cube([200,100,5],center=true);
        }
        
        // reinforcement
        translate([90/2-5/2,30,5/2]) cube([0.1,0.1,40],center=true);
        translate([90/2-5/2,0,5/2]) cube([0.1,0.1,40],center=true);
        translate([90/2-5/2,-30,5/2]) cube([0.1,0.1,40],center=true);
        
        translate([0,35,-8]) rotate([0,0,18]) cube([141,0.1,0.2],center=true);
        translate([0,-35,-8]) rotate([0,0,-18]) cube([141,0.1,0.2],center=true);
    }
}

module 623zz_idler_pulley() {
    difference() {
        union() {
            cylinder(d=13,h=8,$fn=60);
            cylinder(d1=15.5,d2=13,h=1.25,$fn=60);
            translate([0,0,8-1.25]) cylinder(d2=15.5,d1=13,h=1.25,$fn=60);
        }
        cylinder(d=10.1,h=50,center=true,$fn=60);
    }
}

module pulley_washer() {
    difference() {
        cylinder(d1=8.2,d2=7.2,h=1,$fn=40);
        cylinder(d=5.2,h=1,$fn=40);
    }
}

module center_rod_mount() {
    difference() {
        union() {
            translate([0,0,5/2]) chamfered_cube_side(50,20,5,4,center=true);
            cylinder(d=20,h=12,$fn=40);
        }
        translate([0,0,1]) cylinder(d=11,h=30,$fn=30);
        translate([20,0,-1]) cylinder(d=4.3,h=7,$fn=30);
        translate([-20,0,-1]) cylinder(d=4.3,h=7,$fn=30);
        
        for (i=[0:11]) {
            rotate([0,0,360/12*i]) translate([7.5,0,0]) cylinder(d=0.1,h=60,center=true);
        }
    }
}

module z_rod_support() {
    rotate([0,90,0]) difference() {
        union() {
            hull() {
                translate([0,0,5]) chamfered_cube_side(18,9,20,3,center=true);
                translate([0,-39,50]) cube([18,4,60],center=true);
            }
            chamfered_cube_side(18,9,30,3,center=true);
            translate([0,-47,50]) chamfered_cube_side(18,18,60,3,center=true);
        }
        translate([0,-47,20]) cylinder(d=10.5,h=180,center=true,$fn=40);
        translate([0,-47,10]) cylinder(d=22,h=10,$fn=40);
        
        translate([0,0,-30/2-1]) chamfered_cube(6,20,5,2,center=true);
        
        // reinforcements
        translate([-6,0,5]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([6,0,5]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([-6,0,15]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([6,0,15]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([-6,0,25]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([6,0,25]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([-6,0,35]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([6,0,35]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([-6,0,45]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        translate([6,0,45]) rotate([90,0,0]) cylinder(d=0.2,h=180,center=true);
        
        translate([0,0,8]) rotate([28,0,0]) cylinder(d=0.2,h=180,center=true);
    }
}

use<../../_downloaded/Parametric_pulley/Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;
module z_pulley_40t() {
    GT2_2mm_pulley_dia = tooth_spacing (2,0.254);

    module _pulley() {
        pulley ( "GT2 2mm" , GT2_2mm_pulley_dia , 0.764 , 1.494 );
    }
    
    module _pulley_top() {
        intersection() {
            _pulley();
            translate([0,0,8]) cylinder(d=50,h=10);
        }
    }
    
    module _pulley_teeth() {
        // scaling helps the pulley to mesh better with the belt
        scale([1.01,1.01,1]) intersection() {
            union() {
                _pulley();
                translate([0,0,0]) cylinder(d=6,h=8.5);
            }
            translate([0,0,1.5]) cylinder(d=50,h=6.51);
        }
        
    }

    difference() {
        union() {
            _pulley_teeth();
            _pulley_top();
            hull() {
                cylinder(d=28,h=1.51,$fn=100);
                cylinder(d=29,h=1,$fn=100);
            }
            translate([0,0,15.49]) cylinder(d=7.5,h=1,$fn=30);
        }
        cylinder(d=5.2,h=59,$fn=60,center=true);
        translate([0,0,8]) difference() {
            cylinder(d=20.2,h=1.2,$fn=40);
            cylinder(d1=17.8,d2=20.2,h=1.2,$fn=40);
        }
        for (i=[0:3]) {
            rotate([0,0,i*90+45]) translate([10,0,8+10/2]) cube([3,5,10],center=true);
        }
    }
}

module z_pulley_40t_retainer() {
    union() {
        difference() {
            hull() {
                cylinder(d=28,h=1.5,$fn=100);
                translate([0,0,0.5]) cylinder(d=29,h=1,$fn=100);
            }
            cylinder(d=20.2,h=2,$fn=60);
        }
        difference() {
            for (i=[0:3]) {
                rotate([0,0,i*90+45]) translate([10.1,0,1.5/2]) cube([3,5,1.5],center=true);
            }
            cylinder(d1=17.8,d2=20.2,h=1.2,$fn=80);
            translate([0,0,1.2]) cylinder(d=20.2,h=1.2,$fn=80);
        }
    }
}

use <../../lib/includes.scad>;
module support_rod_nut() {
    
    difference() {
        cylinder(d=19.2,h=6,$fn=6);
        fitting_thread_M10(8);
    }
}

module debug() {
    translate([40,0,0]) _original();
    translate([40,14,26]) rotate([0,0,-45]) chamfered_cube(12,50,22,5.5,center=true);
    
    //translate([0,80,0]) _original_motor_mount();
}

//z_bottom();
//z_bottom_top();

//z_top();
//rod_clip();
//z_screw_clip();
//translate([20,10,0]) z_bottom_centering_peg();
//translate([20,-10,0]) z_bottom_centering_peg();
//rotate([0,-90,0]) z_motor_mount();
//z_motor_mount_arm();
//623zz_idler_pulley();
//pulley_washer();
//center_rod_mount();
//z_rod_support();
//z_pulley_40t();
z_pulley_40t_retainer();
//support_rod_nut();