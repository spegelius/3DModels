// original models from: https://www.thingiverse.com/thing:2119644

use <../lib/includes.scad>;
//use <../Dollo/NEW_long_ties/include.scad>;
use <../Bearings/bearing5.scad>;

w_1kg = 116.71;
w_thin = 82.7;

// 1kg positioning aid
//color("grey") cube([w_1kg,1,1]);

// thin positioning aid
//color("grey") cube([w_thin,1,1]);

module ear(h=3) {
    difference() {
        hull(){
            cylinder(d=11, h=h, $fn=50);
            translate([-3,0,h/2]) cube([0.1,19,h],center=true);
        }
        translate([-8,-20/2,-0.5]) cube([5,20,h+1]);
    }
}

module base1() {
    union() {
        translate([-100+38.36,-165.25, -9.761]) {
            rotate([-112.5,0,0]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_BASE_1.stl", convexity=10);
            }
        }
        translate([w_1kg,-25,0]) ear(h=3.5);
        translate([w_1kg,-105,0]) ear(h=3.5);

        translate([0,-25,0]) mirror([1,0,0]) ear(h=3.5);
        translate([0,-105,0]) mirror([1,0,0]) ear(h=3.5);
    }
}

//base1();

module thin_base1() {
    union() {
        translate([3+38.36,-38.66, 51.08]) {
            rotate([-112.5,0,0]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v4_Small_Volume_BASE_1.stl", convexity=10);
            }
        }
        translate([w_thin,-25,0]) ear(h=3.5);
        translate([w_thin,-105,0]) ear(h=3.5);

        translate([0,-25,0]) mirror([1,0,0]) ear(h=3.5);
        translate([0,-105,0]) mirror([1,0,0]) ear(h=3.5);
    }
}

//thin_base1();

module base2() {
    union() {
        translate([-100+38.36,-0.5,-0.19]) {
            rotate([22.5+135,0,]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_BASE_2.stl", convexity=10);
            }
        }

        translate([w_1kg,25,0]) ear(h=4.5);
        translate([w_1kg,105,0]) ear(h=4.5);

        translate([0,25,0]) mirror([1,0,0]) ear(h=4.5);
        translate([0,105,0]) mirror([1,0,0]) ear(h=4.5);
    }
}

//base2();

module thin_base2() {
    union() {
        translate([3+38.36,38.65,51.08]) {
            rotate([22.5+225,0,180]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v4_Small_Volume_BASE_2.stl", convexity=10);
            }
        }

        translate([w_thin,25,0]) ear(h=4.5);
        translate([w_thin,105,0]) ear(h=4.5);

        translate([0,25,0]) mirror([1,0,0]) ear(h=4.5);
        translate([0,105,0]) mirror([1,0,0]) ear(h=4.5);
    }
    
}

//thin_base2();

module lid1() {
    union() {
        translate([140+38.36,154.01, 170.05]) {
            rotate([-22.5-90,0,180]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_LID_1.stl", convexity=10);
            }
        }
        translate([w_1kg,25,0]) ear(h=3.5);
        translate([w_1kg,105,0]) ear(h=3.5);

        translate([0,25,0]) mirror([1,0,0]) ear(h=3.5);
        translate([0,105,0]) mirror([1,0,0]) ear(h=3.5);
    }
}

//lid1();

module thin_lid1() {
    union() {
        translate([3+38.36,38.65, 51.08]) {
            rotate([-22.5-90,0,180]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v4_Small_Volume_LID_1.stl", convexity=10);
            }
        }
        translate([w_thin,25,0]) ear(h=3.5);
        translate([w_thin,105,0]) ear(h=3.5);

        translate([0,25,0]) mirror([1,0,0]) ear(h=3.5);
        translate([0,105,0]) mirror([1,0,0]) ear(h=3.5);
    }
}

//thin_lid1();

module lid2() {
    union() {
        translate([-100+38.36,-65.77,142.055]) {
            rotate([-22.5-90,0,0]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_LID_2.stl", convexity=10);
            }
        }

        translate([w_1kg,-25,0]) ear(h=4.5);
        translate([w_1kg,-105,0]) ear(h=4.5);

        translate([0,-25,0]) mirror([1,0,0]) ear(h=4.5);
        translate([0,-105,0]) mirror([1,0,0]) ear(h=4.5);
    }
}

//lid2();

module thin_lid2() {
    union() {
        translate([3+38.36,-38.65,51.08]) {
            rotate([-22.5-90,0,0]) {
                import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v4_Small_Volume_LID_2.stl", convexity=10);
            }
        }

        translate([w_thin,-25,0]) ear(h=4.5);
        translate([w_thin,-105,0]) ear(h=4.5);

        translate([0,-25,0]) mirror([1,0,0]) ear(h=4.5);
        translate([0,-105,0]) mirror([1,0,0]) ear(h=4.5);
    }
}

//thin_lid2();

module base_bracket() {
    color("grey")
    translate([0,0,12.25]) 
    import ("v5_Small_Volume_1kg_BASE_Bracket.stl", convexity=10);

}

module lid_bracket() {
    color("grey")
    translate([0,-140,54.2]) 
    import ("v5_Small_Volume_1kg_LID_Bracket.stl", convexity=10);
}

module clasp_bracket() {
    color("grey")
    translate([0,0,10.064]) 
    import ("CLASP_BRACKET_v2_0.stl", convexity=10);
}


module ptfe_nozle() {
    color("grey")
    translate([0,0,-2.67])
    rotate([90,0,0]) 
    import ("Version_2_small_pfte_nozzle_175mm.STL", convexity=10);
}

module bearing_mount() {
    color("grey")
    translate([0,0,6.3])
    rotate([0,0,0]) 
    import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/608_BEARING_MOUNT_v2_0.stl", convexity=10);
}

module new_base1() {
    rotate([112.5,0,0]) difference() {
        base1();
        translate([w_1kg+1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,-25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([w_1kg+1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,-105,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-105,3.5]) cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_thin_base1() {
    rotate([112.5,0,0]) difference() {
        thin_base1();
        translate([w_thin+1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,-25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([w_thin+1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,-105,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-105,3.5]) cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_base2() {
    translate([0,0,9.8]) rotate([-90,0,0]) difference() {
        union() {
            intersection() {
                base2();
                //cube([50,200,200]);
            }
            translate([8,119.8,0]) difference() {
                translate([0,-60,0]) cube([100.7,60,86]);
                rotate([22.5,0,0]) translate([-0.05,-60.5,0]) cube([100.8,60,110]);
                translate([-0.5,0,70]) rotate([67.5,0,0]) cube([101.7,60,60]);
            }
        }
        
        translate([9.73,77.5,39]) difference() {
            cube([97.26,40,50]);
            translate([0,-8,50]) rotate([-22.5,0,0]) cube([97.25,70,30]); 
        }
        
        translate([7,113.5,-12.4]) rotate([45,0,0]) cube([105,10,10]);
        
        translate([w_1kg+1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,25,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([w_1kg+1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,105,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([-1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,25,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([-1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,105,2.5]) rotate([0,0,90]) M3_nut();

    }
}

module new_thin_base2() {
    translate([0,0,10]) rotate([-90,0,0]) difference() {
        union() {
            thin_base2();
            translate([8,119.8,0]) difference() {
                translate([0,-60,0]) cube([66.7,60,86]);
                rotate([22.5,0,0]) translate([-0.05,-60.5,0]) cube([66.8,60,110]);
                translate([-0.5,0,70]) rotate([67.5,0,0]) cube([101.7,60,60]);
            }
        }
        
        translate([9.73,77.5,39]) difference() {
            cube([63.25,40,50]);
            translate([0,-8,50]) rotate([-22.5,0,0]) cube([63.25,70,30]); 
        }
        
        translate([7,113.5,-12.4]) rotate([45,0,0]) cube([69.5,10,10]);
        
        translate([w_thin+1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,25,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([w_thin+1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,105,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([-1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,25,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([-1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,105,2.5]) rotate([0,0,90]) M3_nut();

    }
}


module new_lid1() {
    rotate([-22.5-90,0,0]) 
    difference() {
        lid1();
        translate([w_1kg+1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([w_1kg+1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,105,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,105,3.5]) cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_thin_lid1() {
    rotate([-22.5-90,0,0]) 
    difference() {
        thin_lid1();
        translate([w_thin+1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([w_thin+1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,105,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-1,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,105,3.5]) cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_lid2() {
    rotate([22.5+90,0,0])
    difference() {
        lid2();
        translate([w_1kg+1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,-25,2]) rotate([0,0,90]) M3_nut();
        
        translate([w_1kg+1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_1kg+1,-105,2]) rotate([0,0,90]) M3_nut();
        
        translate([-1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-25,2]) rotate([0,0,90]) M3_nut();
        
        translate([-1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-105,2]) rotate([0,0,90]) M3_nut();
    }
}

module new_thin_lid2() {
    rotate([22.5+90,0,0])
    difference() {
        thin_lid2();
        translate([w_thin+1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,-25,2]) rotate([0,0,90]) M3_nut();
        
        translate([w_thin+1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([w_thin+1,-105,2]) rotate([0,0,90]) M3_nut();
        
        translate([-1,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-25,2]) rotate([0,0,90]) M3_nut();
        
        translate([-1,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-1,-105,2]) rotate([0,0,90]) M3_nut();
    }
}

module _bolt_head() {
    union() {
        cylinder(d1=3,d2=6.5,h=2, $fn=30);
        translate([0,0,2]) cylinder(d=6.5,h=10, $fn=30);
    }
}

module new_lid2_window() {
    module bolt_head() {
        union() {
            cylinder(d1=3,d2=6.5,h=2, $fn=30);
            translate([0,0,2]) cylinder(d=6.5,h=10, $fn=30);
        }
    }

    difference() {
        new_lid2();
        translate([w_1kg/2-25,-25,-111.1]) cylinder(d=3,h=5, $fn=30);
        translate([w_1kg/2-25,-25,-110]) _bolt_head();
        translate([w_1kg/2+25,-25,-111.1]) cylinder(d=3,h=5, $fn=30);
        translate([w_1kg/2+25,-25,-110]) _bolt_head();
        translate([w_1kg/2-25,25,-111.1]) cylinder(d=3,h=9, $fn=30);
        translate([w_1kg/2-25,25,-110]) _bolt_head();
        translate([w_1kg/2+25,25,-111.1]) cylinder(d=3,h=9, $fn=30);
        translate([w_1kg/2+25,25,-110]) _bolt_head();

        translate([w_1kg/2,0,-111.1]) cube([42,42,10],center=true);
    }
}

module new_thin_lid2_window() {

    difference() {
        new_thin_lid2();
        translate([w_thin/2-25,-25,-111.1]) cylinder(d=3,h=5, $fn=30);
        translate([w_thin/2-25,-25,-110]) _bolt_head();
        translate([w_thin/2+25,-25,-111.1]) cylinder(d=3,h=5, $fn=30);
        translate([w_thin/2+25,-25,-110]) _bolt_head();
        translate([w_thin/2-25,25,-111.1]) cylinder(d=3,h=9, $fn=30);
        translate([w_thin/2-25,25,-110]) _bolt_head();
        translate([w_thin/2+25,25,-111.1]) cylinder(d=3,h=9, $fn=30);
        translate([w_thin/2+25,25,-110]) _bolt_head();

        translate([w_thin/2,0,-111.1]) cube([42,42,10],center=true);
    }
}

module window_frame() {
    union() {
        difference() {
            translate([0,0,1/2]) hull() {
                cube([58,58,1], center=true);
                translate([0,0,3.4-0.4/2-1/2]) cube([63,63,0.4], center=true);
            }
            translate([-25,-25,2]) cylinder(d=3.2,h=4, $fn=20);
            translate([25,-25,2]) cylinder(d=3.2,h=4, $fn=20);
            translate([25,25,2]) cylinder(d=3.2,h=4, $fn=20);
            translate([-25,25,2]) cylinder(d=3.2,h=4, $fn=20);
            
            translate([-25,-25,-0.2]) M3_nut(2, cone=false);
            translate([25,-25,-0.2]) M3_nut(2, cone=false);
            translate([25,25,-0.2]) M3_nut(2, cone=false);
            translate([-25,25,-0.2]) M3_nut(2, cone=false);
            
            cube([42,42,10], center=true);
            translate([0,0,10/2+2.4]) cube([47,47,10], center=true);
        }
    }
}

module nut_cylinder(d1=11, d2=9, h=2.6) {
    difference() {
        cylinder(d1=d1, d2=d2, h=h, $fn=30);
        //cylinder(d=3, h=h, $fn=30);
        M3_nut(h+1);
    }
}

module new_base_bracket() {
    base_bracket();
 
    translate([22.35,6.05,2.98]) nut_cylinder();
    translate([22.35,-18.45,2.98]) nut_cylinder();
    translate([28.35,-48.95,2.98]) nut_cylinder();
    
    translate([-22.35,6.05,2.98]) nut_cylinder();
    translate([-22.35,-18.45,2.98]) nut_cylinder();
    translate([-28.35,-48.95,2.98]) nut_cylinder();
}

module new_lid_bracket() {
    lid_bracket();
 
    translate([0,-3.3,2.9]) nut_cylinder(d1=10);
    translate([0,-23.2,2.9]) nut_cylinder();
    translate([22.85,-44.3,2.9]) nut_cylinder(d1=10);
    
    translate([-22.85,-44.3,2.9]) nut_cylinder(d1=10);
    
    module block() {
        difference() {
            cube([10.5,11,6]);
            translate([0,4,-2]) rotate([-45,0,0]) cube([10.5,5,15]);
        }
    }
    translate([-27.85,42,0]) block();
    translate([27.85-10.5,42,0]) block();
}

module new_clasp_bracket() {
    clasp_bracket();
    translate([16.5,19,0]) nut_cylinder(d1=9, h=5.6);
    translate([16.5,-14,0]) nut_cylinder(d1=9, h=5.6);
    translate([-16.5,19,0]) nut_cylinder(d1=9, h=5.6);
    translate([-16.5,-14,0]) nut_cylinder(d1=9, h=5.6);
}

module new_base() {
    rotate([-90,0,0]) {
        rotate([-112.5,0,0]) new_base1();
        rotate([22.5+135+180,0,0]) new_base2();
    }
}

module new_lid() {
    rotate([90,0,0]) {
        rotate([22.5+90,0,0]) new_lid1();
        rotate([-22.5-90-180,0,0]) new_lid2();
    }
}

module new_ptfe_nozle() {
    difference() {
        union() {
            ptfe_nozle();
            translate([(37.3+4)/2,-26.5,6.5]) rotate([45,0,0]) difference() {
                cylinder(d=7, h=7.07, $fn=40);
                cylinder(d=4, h=10, $fn=40);
            }
        }
        translate([(37.3+4)/2,-26.5,6.5]) rotate([45,0,0]) cylinder(d1=7, d2=0, h=7, $fn=40);
        translate([37.3,-36.65,3]) M3_nut();
        translate([4,-36.65,3]) M3_nut();
        
        translate([(37.3+4)/2,-25,-0.05]) cylinder(d1=20,d2=0,h=10, $fn=60);
    }
    translate([37.3,-3.35,0]) nut_cylinder(d1=9, h=5.6);
    translate([37.3,-36.65,0]) nut_cylinder(d1=9, h=5.6);
    translate([4,-3.35,0]) nut_cylinder(d1=9, h=5.6);
    translate([4,-36.65,0]) nut_cylinder(d1=9, h=5.6);
}

module nut() {
    difference() {
        M8_nut(h=15, cone=false);
        translate([0,0,5]) threads(d=8, h=20, z_step=1.8, depth=0.5, direction=0);
    }
}

module bolt() {
    l = 83-2*8+2*11;
    d = 8-4*0.15;
    difference() {
        intersection() {
            translate([0,l/2,8/2-1.1]) rotate([90,0,0]) {
                threads(d=d, h=11, z_step=1.8, depth=0.5, direction=0);
                translate([0,0,l-11]) threads(d=d, h=11, z_step=1.8, depth=0.5, direction=0);
                translate([0,0,11-0.1]) cylinder(d=d, h=l-2*11+0.2, $fn=40);
            }
            translate([0,0,8/2]) cube([10,l,8], center=true);
        }
        translate([0,0,d/2]) rotate([90,0,0]) cylinder(d=0.1,h=l+2,center=true);
    }
}

core_wall = 1.8;

module new_core_750g_50mm() {
    roll(55, 50, wall=core_wall, edges=false, dent=true);
}

module new_core_750g_51mm() {
    roll(55, 51, wall=core_wall, edges=false, dent=true);
}

module new_core_750g_52mm() {
    roll(55, 52, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_50mm() {
    roll(87.50, 50, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_51mm() {
    roll(87.50, 51, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_52mm() {
    roll(87.50, 52, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_53mm() {
    roll(87.50, 53, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_54mm() {
    roll(87.50, 54, wall=core_wall, edges=false, dent=true);
}

ball_size = 5.92+0.05;

module small_core_bearing() {
    // bearing
    difference() {
        union() {
            scale([1,1,1.05]) intersection() {
                bearing_mount();
                cylinder(d=50,h=5);
            }
            union() {
                translate([0,0,5*1.05+sqrt(ball_size*ball_size*2)/2]) cube_donut(30,ball_size);
                translate([0,0,5*1.05]) difference() {
                    cylinder(d=30,h=sqrt(ball_size*ball_size*2),$fn=100);
                    cylinder(d=26,h=sqrt(ball_size*ball_size*2)+1,$fn=100);
                }
                translate([0,0,5*1.05]) cylinder(d=12,h=sqrt(ball_size*ball_size*2)/2-7/2-0.1);
            }
        }
        translate([0,0,5*1.05 + sqrt(ball_size*ball_size*2)/2]) ball_path(ball_size,dent=true);
        %translate([0,0,5*1.05+sqrt(ball_size*ball_size*2)/2-7/2]) center_circle_hole(dent=true);
    }
}

module small_core_axle() {
    intersection() {
        translate([0,0,7.9/2-0.6]) rotate([-90,0,0]) cylinder(d=7.6, h=26.5, $fn=50);
        translate([-8/2,0,0]) cube([8,26.5,8]);
    }
}

small_core_h = 89.5 - sqrt(ball_size*ball_size*2) - 7 + 0.5;

module _small_core(diameter) {
    // core
    difference() {
        cylinder(d=diameter,h=small_core_h,$fn=50);
        cylinder(d=8,h=20,$fn=50);
        translate([0,0,small_core_h-20]) cylinder(d=8,h=20,$fn=50);

        translate([0,0,20+1]) cylinder(d=diameter-3, h=small_core_h-42, $fn=50);
    }
}

module _core_universal(h=89) {
    
    module _wing() {
        wall = 1;
        intersection() {
            difference() {
                cylinder(d=50,h=h,$fn=50);
                cylinder(d=50-wall*2,h=h,$fn=50);
            }
            cube([26,26,h]);
        }
    }
    
    module _core() {
        inner_d = 22.5;
        
        union() {
            difference() {
                cylinder(d=inner_d+3,h=h,$fn=80);
                cylinder(d=22.5,h=h,$fn=80);
            }
            translate([0,0,7+sqrt(2)/2]) cube_donut(inner_d,2);
            translate([0,0,h-(7+sqrt(2)/2)]) cube_donut(inner_d,2);
            for(i=[0:3]) {
                rotate([0,0,360/4*i]) {
                    translate([0,inner_d/2+0.2,7/2]) cube([1,1,7],center=true);
                    translate([0,inner_d/2+0.2,h-7/2]) cube([1,1,7],center=true);
                }
            }
        }
    }
    wings = 6;
    intersection() {
        union() {
            _core();
            for(i = [0:wings-1]) {
                rotate([0,0,360/wings*i]) translate([1.4,-12.5,0]) _wing();
            }
        }
        rounded_cylinder(58,h,7,$fn=50);
    }
}

module core_1kg_20mm() {
    _small_core(20);
}

module core_1kg_16mm() {
    _small_core(16);
}

module core_1kg_universal() {
    _core_universal();
}

module core_750g_universal() {
    _core_universal(55.1);
}

module _lip(h) {
    difference() {
        union() {
            cylinder(d=2,h=h,center=true,$fn=30);
            //translate([0,100/2,0]) cube([2,100,h], center=true);
            intersection () {
                translate([280/2-1,0,0]) difference() {
                    cylinder(d=280,h=h,center=true,$fn=100);
                    cylinder(d=280-4,h=h+2,center=true,$fn=100);
                }
                translate([0,80/2,0]) rounded_cube_side(52,80,h,2,center=true);
            }
            rotate([0,0,-164.5]) translate([0,20/2,0]) difference() {
                cube([2,20,h],center=true);
                translate([0,0,-22.3]) rotate([0,90,0]) cylinder(d=3.2,h=10,center=true,$fn=30);
                translate([0,0,22.3]) rotate([0,90,0]) cylinder(d=3.2,h=10,center=true,$fn=30);
            }
        }
        
    }
}

module lip() {
    _lip(96);
}

module lip_thin() {
    _lip(62);
}

module debug_core_1kg() {
    translate([0,0,5.7]) new_core_1kg_50mm();
    bearing_mount();
    translate([0,0,87.5+2*5.7]) rotate([180,0,0]) bearing_mount();
}

module debug_small_core() {
    intersection() {
        union() {
            h = 5*1.05+sqrt(ball_size*ball_size*2)/2 + 7/2;
            translate([0,0,h]) core_1kg_20mm();
            small_core_bearing();
            translate([0,0,small_core_h+2*h]) rotate([180,0,0]) small_core_bearing();
        }
        cube([40,40,200]);
    }
    //translate([0,0,-8]) rotate([0,-90,0]) new_lid1();
}

module debug_core_universal() {
    intersection() {
        union() {
            translate([0,0,5.7]) core_1kg_universal();
            bearing_mount();
            translate([0,0,89.2+2*5.7]) rotate([180,0,0]) bearing_mount();
        }
        cube([100,100,200]);
    }
    translate([0,0,-8]) rotate([0,-90,0]) new_lid1();
}

module debug_core_universal_small() {
    intersection() {
        union() {
            translate([0,0,5.7]) core_750g_universal();
            bearing_mount();
            translate([0,0,55.4+2*5.7]) rotate([180,0,0]) bearing_mount();
        }
        cube([100,100,200]);
    }
    translate([0,0,-8]) rotate([0,-90,0]) new_thin_lid1();
}

module debug_small_core_bearing() {
    intersection() {
        small_core_bearing();
        cube([60,60,60]);
    }
}

module debug() {
    intersection() {
        union() {
            translate([0,-1,119.8]) rotate([-22.5,0,0]) new_base1();
            translate([0,1,110]) rotate([0,0,0]) new_base2();
            translate([0,-1,121.8]) rotate([202.5,0,0]) new_lid1();
            translate([0,1,121.8]) rotate([180-22.5,0,0]) new_lid2_window();
        }
        //translate([30,-250/2,0]) cube([100,250,250]);
        translate([0,-250/2,0]) cube([140,250,70]);
    }
    %translate([13,0,202/2+20]) rotate([0,90,0]) difference() {
        cylinder(d=202,h=90,$fn=100);
        cylinder(d=10,h=190,$fn=100,center=true);
    }
    translate([8+100.7/2,100,80]) rotate([-7,0,0]) rotate([90,0,-90]) lip();
    //translate([8,0,0]) cube([100.7,200,1]);
}

module debug_thin() {
    intersection() {
        union() {
            translate([0,-1,119.8]) rotate([-22.5,0,0]) new_thin_base1();
            translate([0,1,110]) rotate([0,0,0]) new_thin_base2();
            translate([0,-1,121.8]) rotate([202.5,0,0]) new_thin_lid1();
            translate([0,1,121.8]) rotate([180-22.5,0,0]) new_thin_lid2_window();
        }
        //translate([30,-250/2,0]) cube([100,250,250]);
        translate([0,-250/2,0]) cube([100,250,70]);
    }
    %translate([13,0,202/2+20]) rotate([0,90,0]) difference() {
        cylinder(d=202,h=60,$fn=100);
        cylinder(d=10,h=130,$fn=100,center=true);
    }
    translate([8+66.7/2,100,80]) rotate([-10,0,0]) rotate([90,0,-90]) lip_thin();
    
    //translate([8,0,0]) cube([66.7,200,1]);
}

//debug_core_1kg();
//translate([40,0,0]) debug_small_core();
//debug_small_core_bearing();
//debug_core_universal();
//debug_core_universal_small();
//debug();
//debug_thin();

//new_base();
//new_lid();

// print
//translate([0,0,110]) new_base1();
//translate([0,0,110]) new_base2();
//translate([0,0,110]) new_lid1();
//translate([0,0,110]) new_lid2();
//translate([0,0,110]) new_lid2_window();

//translate([0,0,110]) new_thin_base1();
//translate([0,0,110]) new_thin_base2();
//translate([0,0,110]) new_thin_lid1();
//translate([0,0,110]) new_thin_lid2();
//translate([0,0,110]) new_thin_lid2_window();
//nut();
//bolt();

//window_frame();

//new_base_bracket();
//new_lid_bracket();
//new_clasp_bracket();
//new_ptfe_nozle();

//new_core_750g_50mm();
//new_core_750g_51mm();
//new_core_750g_52mm();
//new_core_1kg_50mm();
//new_core_1kg_51mm();
//new_core_1kg_52mm();
//new_core_1kg_53mm();
//new_core_1kg_54mm();
//core_1kg_20mm();
//core_1kg_16mm();

//core_1kg_universal();
//core_750g_universal();

//small_core_bearing();
//small_core_axle();

//lip();
//lip_thin();