
use <../lib/includes.scad>;
use <../Bearings/bearing5.scad>;

module ear(h=3) {
    difference() {
        intersection(){
            cylinder(d=11, h=h, $fn=50);
            translate([-2,-11/2,0]) cube([11,11,h]);
        }
    }
}

module base1() {
    translate([-100,-165.5, -9.761]) {
        rotate([-112.5,0,0]) {
            import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_BASE_1.stl");
        }
    }
    translate([78,-25,0]) ear(h=3.5);
    translate([78,-105,0]) ear(h=3.5);

    translate([-38,-25,0]) mirror([1,0,0]) ear(h=3.5);
    translate([-38,-105,0]) mirror([1,0,0]) ear(h=3.5);
}

module base2() {
    rotate([22.5+135,0,0]) {
        translate([-100,0,0.216]) {
            import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_BASE_2.stl");
        }
    }

    translate([78,25,0]) ear(h=4.5);
    translate([78,105,0]) ear(h=4.5);

    translate([-38,25,0]) mirror([1,0,0]) ear(h=4.5);
    translate([-38,105,0]) mirror([1,0,0]) ear(h=4.5);

}

module lid1() {
    translate([140,154.3, 170.05]) {
        rotate([-22.5-90,0,180]) {
            import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_LID_1.stl");
        }
    }
    translate([78,25,0]) ear(h=3.5);
    translate([78,105,0]) ear(h=3.5);

    translate([-38,25,0]) mirror([1,0,0]) ear(h=3.5);
    translate([-38,105,0]) mirror([1,0,0]) ear(h=3.5);
}

module lid2() {
    translate([-100,-66,142.055]) {
        rotate([-22.5-90,0,0]) {
            import ("../_downloaded/SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/files/v5_Small_Volume_1kg_LID_2.stl");
        }
    }

    translate([78,-25,0]) ear(h=4.5);
    translate([78,-105,0]) ear(h=4.5);

    translate([-38,-25,0]) mirror([1,0,0]) ear(h=4.5);
    translate([-38,-105,0]) mirror([1,0,0]) ear(h=4.5);
}



module base_bracket() {
    color("grey")
    translate([0,0,12.25]) 
    import ("v5_Small_Volume_1kg_BASE_Bracket.stl");

}

module lid_bracket() {
    color("grey")
    translate([0,-140,54.2]) 
    import ("v5_Small_Volume_1kg_LID_Bracket.stl");
}

module clasp_bracket() {
    color("grey")
    translate([0,0,10.064]) 
    import ("CLASP_BRACKET_v2_0.stl");
}


module ptfe_nozle() {
    color("grey")
    translate([0,0,-2.67])
    rotate([90,0,0]) 
    import ("Version_2_small_pfte_nozzle_175mm.STL");
}

module new_base1() {
    rotate([112.5,0,0]) difference() {
        base1();
        translate([79,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,-25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([79,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,-105,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-39,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,-25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-39,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,-105,3.5]) cylinder(d=6.5, h=5, $fn=30);

    }
}

module new_base2() {
    translate([0,0,10]) rotate([-90,0,0]) difference() {
        union() {
            base2();
            translate([-30.35,119.8,0]) difference() {
                translate([0,-60,0]) cube([100.7,60,85]);
                rotate([22.5,0,0]) translate([0,-60,0]) cube([100.7,60,110]);
                translate([0,0,49.75]) rotate([45,0,0]) cube([100.7,60,60]);
            }
        }
        
        translate([-28.625,87.5,39]) difference() {
            cube([97.25,30,30]);
            translate([0,0,40]) rotate([-45,0,0]) cube([97.25,60,30]); 
        }
        
        translate([-32.5,113.5,-12.4]) rotate([45,0,0]) cube([105,10,10]);
        
        translate([79,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,25,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([79,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,105,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([-39,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,25,2.5]) rotate([0,0,90]) M3_nut();
        
        translate([-39,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,105,2.5]) rotate([0,0,90]) M3_nut();

    }
}

module new_lid1() {
    rotate([-22.5-90,0,0]) 
    difference() {
        lid1();
        translate([79,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([79,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,105,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-39,25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,25,3.5]) cylinder(d=6.5, h=5, $fn=30);
        
        translate([-39,105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,105,3.5]) cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_lid2() {
    rotate([22.5+90,0,0])
    difference() {
        lid2();
        translate([79,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,-25,2]) rotate([0,0,90]) M3_nut();
        
        translate([79,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([79,-105,2]) rotate([0,0,90]) M3_nut();
        
        translate([-39,-25,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,-25,2]) rotate([0,0,90]) M3_nut();
        
        translate([-39,-105,-0.2]) cylinder(d=3.3, h=5, $fn=30);
        translate([-39,-105,2]) rotate([0,0,90]) M3_nut();
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
    intersection() {
        translate([0,l/2,8/2-1.1]) rotate([90,0,0]) {
            threads(d=8-4*0.15, h=11, z_step=1.8, depth=0.5, direction=0);
            translate([0,0,l-11]) threads(d=8-4*0.15, h=11, z_step=1.8, depth=0.5, direction=0);
            translate([0,0,11-0.1]) cylinder(d=8-4*0.15, h=l-2*11+0.2, $fn=40);
        }
        translate([0,0,8/2]) cube([10,l,8], center=true);
    }
}

core_wall = 1.8;

module new_core_750g_52mm() {
    roll(55, 52, wall=core_wall, edges=false);
}

module new_core_1kg_50mm() {
    roll(87.50, 50, wall=core_wall, edges=false);
}

module new_core_1kg_52mm() {
    roll(87.50, 52, wall=core_wall, edges=false);
}

module new_core_1kg_54mm() {
    roll(87.50, 54, wall=core_wall, edges=false);
}

//new_base();
//new_lid();

// print
//translate([0,0,110]) new_base1();
//translate([0,0,110]) new_base2();
//translate([0,0,110]) new_lid1();
//translate([0,0,110]) new_lid2();
//nut();
//bolt();

//new_base_bracket();
//new_lid_bracket();
//new_clasp_bracket();
//new_ptfe_nozle();

//new_core_750g_52mm();
//new_core_1kg_50mm();
//new_core_1kg_52mm();
//new_core_1kg_54mm();
