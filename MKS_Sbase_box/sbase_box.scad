
include <../Dollo/NEW_long_ties/include.scad>;

module original_bottom() {
    translate([0,100,0])
    rotate([90,0,0])
    import("../_downloaded/MKS_Sbase/sbasebot.stl", convexity=10);
}

module original_top() {
    translate([0,0,3])
    rotate([-90,0,0])
    import("../_downloaded/MKS_Sbase/sbasetop.stl", convexity=10);
}

module new_bottom() {
    difference() {
        union() {
            intersection() {
                original_bottom();
                cube([157,110,8]);
            }
            translate([167,100,0]) rotate([0,0,180]) intersection() {
                original_bottom();
                cube([10,110,8]);
            }
            translate([157,1,1]) cube([2,98,7]);
        }
        translate([4.5,4.5,7]) {
            cylinder(d=2.7,h=100,center=true,$fn=20);
            cylinder(d1=4.4,d2=5.4,h=1,$fn=20);
        }
        translate([4.5,100-4.5,7]) {
            cylinder(d=2.7,h=100,center=true,$fn=20);
            cylinder(d1=4.4,d2=5.4,h=1,$fn=20);
        }
        translate([162.5,4.5,7]) {
            cylinder(d=2.7,h=100,center=true,$fn=20);
            cylinder(d1=4.4,d2=5.4,h=1,$fn=20);
        }
        translate([162.5,100-4.5,7]) {
            cylinder(d=2.7,h=100,center=true,$fn=20);
            cylinder(d1=4.4,d2=5.4,h=1,$fn=20);
        }
    }
    %translate([33,17.5,0]) cylinder(d=2,h=5,$fn=20);
    %translate([33,65+17.5,0]) cylinder(d=2,h=5,$fn=20);
}

module new_top_40mm_fan() {
    
    module _top() {
        union() {
            intersection() {
                original_top();
                cube([152,110,5]);
            }
            translate([0,100,35.99]) rotate([180,0,0]) intersection() {
                original_bottom();
                translate([0,0,9]) cube([152,110,38]);
            }
            translate([167,100,0]) rotate([0,0,180]) {
                intersection() {
                    original_top();
                    cube([15,110,5]);
                }
                translate([0,100,35.99]) rotate([180,0,0]) intersection() {
                    original_bottom();
                    translate([0,0,9]) cube([15,110,38]);
                }
            }
            translate([157,1,0.99]) cube([2,98,26]);
            
            translate([4.5,4.5,27]) cylinder(d1=5.3,d2=4.3, h=1,$fn=20);
            translate([4.5,100-4.5,27]) cylinder(d1=5.3,d2=4.3, h=1,$fn=20);
            translate([162.5,4.5,27]) cylinder(d1=5.3,d2=4.3, h=1,$fn=20);
            translate([162.5,100-4.5,27]) cylinder(d1=5.3,d2=4.3, h=1,$fn=20);
        }
    }
    
    difference() {
        union() {
            intersection() {
                _top();
                cube([180,110,12]);
            }
            translate([0,0,8]) intersection() {
                _top();
                translate([0,0,4]) cube([180,110,35]);
            }
            translate([3,98,2]) cube([100,2,13]);
            translate([100,10,0]) cube([30,80,3]);
        }
        
        translate([59,97,15]) cube([25,5,30]);

        translate([4.5,4.5,0]) {
            cylinder(d=3.3,h=100,center=true,$fn=20);
            cylinder(d1=6.3,d2=3.3,h=1.5,$fn=20);
        }
        translate([4.5,100-4.5,0]) {
            cylinder(d=3.3,h=100,center=true,$fn=20);
            cylinder(d1=6.3,d2=3.3,h=1.5,$fn=20);
        }
        translate([162.5,4.5,0]) {
            cylinder(d=3.3,h=100,center=true,$fn=20);
            cylinder(d1=6.3,d2=3.3,h=1.5,$fn=20);
        }
        translate([162.5,100-4.5,0]) {
            cylinder(d=3.3,h=100,center=true,$fn=20);
            cylinder(d1=6.3,d2=3.3,h=1.5,$fn=20);
        }
        linear_extrude(0.4)
        translate([130,10,0]) rotate([180,0,90]) text("MKS SBASE");
    }
}

module new_top_80mm_fan() {
    union() {
        difference() {
            union() {
                new_top_40mm_fan();
                translate([20,20,0]) cube([60,60,3]);
            }
            translate([60,50,0]) {
                cylinder(d=80,h=10,center=true,$fn=50);
                for (i = [0:3]) {
                    rotate([0,0,i*360/4]) translate([72/2, 72/2,0]) cylinder(d=2.7,h=10,center=true,$fn=30);
                }
            }
        }
        
        translate([60,50,0]) {
            cylinder(d=20,h=2,$fn=30);
            translate([0,0,2/2]) cube([2,90,2],center=true);
            rotate([0,0,45]) translate([0,0,2/2]) cube([2,90,2],center=true);
            rotate([0,0,90]) translate([0,0,2/2]) cube([2,90,2],center=true);
            rotate([0,0,135]) translate([0,0,2/2]) cube([2,90,2],center=true);
            
            tube(66,2,2,$fn=70);
            tube(50,2,2,$fn=55);
            tube(35,2,2,$fn=40);
        }
    }
}

module fan_shroud_80mm() {
    
    fins = 12;
    
    union() {
        difference() {
            union() {
                translate([0,0,2/2]) rounded_cube_side(82,82,2,4,center=true);
                cylinder(d=86,h=2,$fn=50);
            }
            tube(d=80,h=5,center=true,wall=30,$fn=50);
            for (i = [0:3]) {
                rotate([0,0,i*360/4])
                translate([72/2, 72/2,0]) {
                    cylinder(d=4.5,h=10,center=true,$fn=30);
                    translate([0,0,1]) cylinder(d2=6,d1=4.5,h=1,$fn=30);
                }
            }
        }
        
        intersection() {
            for(j=[0:fins-1]) {
                translate([0,0,2/2])
                rotate([0,45,j*360/fins])
                translate([0,41/2,0]) cube([1.5,41,6],center=true);
            }
            translate([0,0,2/2]) cube([100,100,2],center=true);
        }
    } 
}

module debug() {
    new_bottom();
    translate([0,100,43]) rotate([180,0,0]) {
        //new_top_40mm_fan();
        new_top_80mm_fan();
    }
    
    translate([60,50,0]) {
        %translate([0,0,43+25/2]) cube([80,80,25],center=true);
        translate([0,0,43+27]) rotate([180,0,0]) fan_shroud_80mm();
    }
}

//debug();

original_bottom();
//original_top();
//new_bottom();
//new_top_40mm_fan();
//new_top_80mm_fan();
//fan_shroud_80mm();
