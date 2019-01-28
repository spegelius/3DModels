include <../Dollo/NEW_long_ties/include.scad>;

module saw_blade_150mm() {
    color("grey") {
        intersection() {
            hull() {
                translate([-150/2,0,0]) cylinder(d=9,h=0.5,$fn=30);
                translate([150/2,0,0]) cylinder(d=9,h=0.5,$fn=30);
            }
            cube([160,6,4],center=true);
        }
        translate([-150/2,0,0.5/2]) cylinder(d=1,h=5,$fn=10,center=true);
        translate([150/2,0,0.5/2]) cylinder(d=1,h=5,$fn=10,center=true);
    }
}

module saw_body() {
    //%translate([-125,-105,0]) import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_Body_solid.stl", convexity=3);
    
//    difference() {
//        translate([0,0,12.99/2]) cube([200,200,12.99],center=true);
//        difference() {
//            translate([0,0,12.99/2]) cube([200,200,12.99],center=true);
//            translate([0,0,0]) import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_Body_solid2.stl", convexity=3);
//            translate([-54,-41.98]) difference() {
//                cube([5,5,13]);
//                translate([0,3.7,0]) rotate([0,0,12]) cube([10,,10,14]);
//            }
//        }
//    }
    scl = 3.282;
    scale([scl,scl,scl]) import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_Body_sketchup1.stl", convexity=3);
    
    //import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_Body_mm.stl", convexity=3);
}

module saw_body_left() {
    import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_Body_left.stl", convexity=3);
}

module saw_body_right() {
    import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_Body_right.stl", convexity=3);
}

module saw_clamp() {
    import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_ClampBlk.stl", convexity=3);
}

module saw_tensioner() {
    import("../_downloaded/Fretsaw_Hacksaw_Coping_saw/Fretsaw_V1_TensionBlk.stl", convexity=3);
}

module saw_body_150mm() {
    module extension_side() {
        intersection() {
            rounded_cube(22,5,13,0.65);
            cube([22,3.025,13]);
        }
    }
    
    module extension() {
        translate([-22/2,43.71,0]) extension_side();
        translate([22/2,58.74,0]) rotate([0,0,180]) extension_side();
        
        translate([5,51,13/2]) rotate([0,0,45]) cube([15,3,13],center=true);
        translate([-5,51,13/2]) rotate([0,0,-45]) cube([15,3,13],center=true);
    }
    
    module _body() {
    
        //union() {
            translate([-10,0,0]) difference() {
                saw_body();
                translate([200/2,0,0]) cube([200,200,200],center=true);
            }
            translate([10,0,0]) difference() {
                saw_body();
                translate([-200/2,0,0]) cube([200,200,200],center=true);
            }
            extension();

        //}
    }
    
    //extension();
    difference() {
        //_body();
        saw_body();
        //translate([-5,-44,5.8+10/2]) cube([150,6.2,10],center=true);
    }
}

module saw_clamp_150mm() {
    difference() {
        rotate([90,0,0]) intersection() {
            hull() {
                saw_clamp();
            }
            translate([0,0,12/2]) cube([50,50,12],center=true);
        }
        translate([-9,-5.7,-4.3]) hull() {
            cube([11,0.8,20]);
            translate([0,0,10]) cube([21,1,20]);
        }
        translate([-3.1,-8.3,-1.6]) rotate([0,45,0]) cube([1,6,20]);
    }
}

module saw_tensioner_150mm() {
    difference() {
        union() {
            translate([-1,-5.5,0]) cylinder(d=7.5,h=15,$fn=50);
            translate([-1,5.5,0]) cylinder(d=7.5,h=15,$fn=50);
            translate([-7.5,-7.5,0]) cube([13,15,15]);
        }
        translate([-1,-5.3,0]) cylinder(d=3.2,h=15,$fn=50);
        translate([-1,5.3,0]) cylinder(d=3.2,h=15,$fn=50);

        translate([-1,-5.3,0]) nut();
        translate([-1,5.3,0]) nut();

        
        translate([0.75,0,-4.4]) hull() {
            cube([0.8,6.3,20],center=true);
            translate([0,20,0]) cube([0.8,6.3,42],center=true);
        }

        translate([0.75,21,14.1]) rotate([-60,0,0]) cube([6,1.3,50],center=true);
        translate([0,4.5,0]) cube([1,1.5,10.5]);
        translate([0.58,6,6.1]) rotate([30,0,0]) intersection() {
            rotate([0,45,0]) cube([4,15,4], center=true);
            translate([-5,0,0]) cube([5,15,5]);
        }
    }
}

module debug() {
    saw_body_150mm();
    %translate([-8,-44,8]) saw_blade_150mm();
    %translate([68.8,-42.8, 3]) intersection() {  
        rotate([-90,0,0]) saw_clamp_150mm();
        translate([0,0,-30/2+5]) cube([30,30,30],center=true);
    }
    %translate([-81,-44,7.5]) intersection() {
        rotate([0,-90,0]) saw_tensioner_150mm();
        translate([0,0,-30/2+1]) cube([30,30,30],center=true);
    }
}

//debug();

//saw_body();
//saw_body_150mm();
//saw_clamp_150mm();
saw_tensioner_150mm();
