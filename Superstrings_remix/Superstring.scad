
module p1() {
    translate([0,0,61.9]) rotate([-135,0,0]) import("../_downloaded/Superstrings_puzzle/Superstrings_628_03_003_S1.stl",convexity=5);
}

module solublock(x) {
    hull() {
        translate([0,0,1/2]) cube([x,2.4,0.1],center=true);
        translate([0,0,0.1/2+1.9]) cube([x,4.4,0.1],center=true);
    }
}

module hollow_cube(x,y,z,wall,center=false,cup=true) {
    
    module _hollow_cube() {
        difference() {
            union() {
                cube([x,y,z],center=true);
                if (cup) {
                    translate([0,0,z/2-2]) hull() {
                        cube([x,y,0.1],center=true);
                        translate([0,0,3.8]) cube([x,y+4,0.1],center=true); 
                    }
                }
            }
            translate([wall,0,-wall]) cube([x-2*wall,y-2*wall,z-2*wall],center=true);
            if (cup) {
                translate([0,0,z/2]) solublock(x);
            }
        }
    }
    
    if (center) {
        _hollow_cube();
    } else {
        translate([x/2,y/2,z/2]) _hollow_cube();
    }
}

module p1_supports() {
    p1();
    
    color("white") {
        translate([6.3,-8.8,8/2]) hollow_cube(12,2,8,0.5,center=true);
        translate([2*6.3,8.8,8/2]) hollow_cube(12,2,8,0.5,center=true);
        translate([34.5,2*-8.8,17/2]) hollow_cube(18,2,17,0.5,center=true);
        translate([34.5,2*8.8,17/2]) hollow_cube(18,2,17,0.5,center=true);
        translate([37.6,3*-8.8,26/2]) hollow_cube(12,2,26,0.5,center=true);
        translate([31.4,3*8.8,26/2]) hollow_cube(12,2,26,0.5,center=true);
        translate([40.9,-4.5,21.5/2]) hollow_cube(8,2,21.5,0.5,center=true);
        translate([40.9,8.8,26/2]) hollow_cube(8,2,26,0.5,center=true);
        
        translate([34.6,2*8.8,34.5-3/2]) hollow_cube(5.8,2,3,0.5,center=true);
        
        hull() {
            translate([34.6,2*8.8,34.5-3-1/2]) cube([5.8,2.4,1],center=true);
            translate([34.6,3*8.8-2/2,21]) cube([5.8,0.5,3],center=true);
        }
        
        translate([31.2,-2*8.85,34.5-3/2]) hollow_cube(12,2,3,0.5,center=true);
        
        hull() {
            translate([31.2-3.5,-2*8.85,34.5-2.5]) cube([5,2,1],center=true);
            translate([22,-2*7,25]) cube([5,2,1],center=true);
        }
        
        hull() {
            translate([31.2+3.5,-2*8.85,34.5-2.5]) cube([5,2,1],center=true);
            translate([35,-3*8.8,22]) cube([5,2,1],center=true);
        }
        
        translate([18.8,-2*6.7,38.5-12/2]) hollow_cube(12,2,12,0.5,center=true);
        translate([18.8,-2*8,20/2]) hollow_cube(12,2,20,0.5,center=true,cup=false);
        
        hull() {
            translate([18.8,-2*6.7,38.5-12-1/2]) cube([12,2,1],center=true);
            translate([18.8,-2*8,20]) cube([12,2,1],center=true);
        }
        
        translate([12/2,-2*4.5,43-12/2]) hollow_cube(12,2,12,0.5,center=true);
        translate([12/2,-2*8,24/2]) hollow_cube(12,2,24,0.5,center=true,cup=false);
        
        hull() {
            translate([12/2,-2*4.5,43-12]) cube([12,2,1],center=true);
            translate([12/2,-2*8,24]) cube([12,2,1],center=true);
        }
        
        translate([12/2+6.5,2*4.5,43-18/2]) hollow_cube(12,2,18,0.5,center=true);
        translate([12/2+6.5,2*7.5,17/2]) hollow_cube(12,2,17,0.5,center=true,cup=false);
        
        hull() {
            translate([12/2+6.5,2*4.5,43-18]) cube([12,2,1],center=true);
            translate([12/2+6.5,2*7.5,17]) cube([12,2,1],center=true);
        }
        
        translate([6.5+5/2,0,52-4/2]) hollow_cube(5,2,4,0.5,center=true);
        
        hull() {
            translate([6.5+5/2,0,52-4]) cube([5,2,1],center=true);
            translate([6.5+5/2,2*4,38]) cube([5,0.5,3],center=true);
        }
        
        translate([35,18.2,0]) cube([0.5,7.5,16]);
        translate([38,9.3,0]) cube([0.5,7.5,16]);
        
        translate([38,-17,0]) cube([0.5,12,16]);
        
        translate([32,-25.8,0]) cube([0.5,7.5,16]);
        
        translate([24,-17,0]) cube([2,0.5,16]);
        translate([11,-17,0]) cube([2,0.5,18]);
        
        translate([11,-13,26]) cube([2,0.5,3]);
        
        translate([8,-25,0]) cube([0.5,8,16]);
        translate([8,16,0]) cube([0.5,8,18]);
        
        translate([8,-15,0]) cube([0.5,5.5,7]);
        translate([8,9.5,0]) cube([0.5,5,7]);
        
    }
}

module p1_solubles() {
    
    difference() {
        color("grey") union() {
            translate([6.3,-8.8,8]) solublock(12);
            translate([2*6.3,8.8,8]) solublock(12);
            translate([34.5,2*-8.8,17]) solublock(18);
            translate([34.5,2*8.8,17]) solublock(18);
            translate([37.6,3*-8.8,26]) solublock(12);
            translate([31.4,3*8.8,26]) solublock(12);
            translate([40.9,-4.5,21.5]) solublock(8);
            translate([40.9,8.8,26]) solublock(8);
            
            translate([34.6,2*8.8,34.5]) solublock(5.8);
            translate([31.2,-2*8.85,34.5]) solublock(12);
            translate([18.8,-2*6.7,38.5]) solublock(12);
            
            translate([12/2,-2*4.5,43]) solublock(12);
            translate([12/2+6.5,2*4.5,43]) solublock(12);
            translate([6.5+5/2,0,52]) solublock(5);
        }
        p1();
    }
}
p1_supports();
p1_solubles();