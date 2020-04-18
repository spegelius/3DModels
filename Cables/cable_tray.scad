
use <../Dollo/NEW_long_ties/include.scad>;

wall = 1.3;
hole_interval = 100;

module cable_tray(h=100, hole_offset=10) {
    h_o = -h/2 + hole_offset;
    
    module _edge() {
        union() {
            cube([3,5,h+1],center=true);

            translate([0,-5/2+wall/2,0])
            hull() {
                cube([5,wall,h+1],center=true);
                translate([5/2,-0.5/2,0])
                cube([1,wall+0.5,h+1],center=true);
            }
        }
    }

    module _screw_hole() {
        rotate([90,0,0])
        hull() {
            translate([0,4/2,0])
            cylinder(d=4,h=20,center=true,$fn=40);

            translate([0,-4/2,0])
            cylinder(d=4,h=20,center=true,$fn=40);
        }
    }
    
    translate([0,0,h/2])
    difference() {
        // main form
        union() {
            rounded_cube_side(30,13,h,1,center=true,$fn=20);

            // top guides
            translate([30/4,0,h/2+1])
            rotate([0,45,0])
            cube([4,13,4],center=true);

            translate([-30/4,0,h/2+1])
            rotate([0,45,0])
            cube([4,13,4],center=true);
        }

        // tray opening
        translate([0,-13/2+7.5/2+wall,0])
        hull() {
            cube([30-2*wall,7.5,h+10],center=true);
            translate([0,8/2,0])
            cube([10,1,h+1],center=true);
        }

        // center opening
        translate([0,13/2])
        cube([22,10,h+10],center=true);

        // clipping edges
        translate([30/2,13/2,0])
        _edge();

        translate([-30/2,13/2,0])
        mirror([1,0,0])
        _edge();

        // bottom guides
        translate([30/4,0,-h/2+1])
        rotate([0,45,0])
        cube([4.1,14,4.1],center=true);

        translate([-30/4,0,-h/2+1])
        rotate([0,45,0])
        cube([4.1,14,4.1],center=true);

        // screw holes
        for(i=[0:100]) {
            translate([0,0,h_o+i*hole_interval])
            _screw_hole();
        }
    }   
}

module cable_tray_cover(h=100) {
    translate([0,0,h/2])
    difference() {
        rounded_cube_side(30,4,h,1,center=true,$fn=20);

        translate([0,(4-wall-1)/2-4/2+wall])
        cube([30-2*wall,4-wall-1,h+1],center=true);

        translate([0,4/2,0])
        cube([25.2,4,h+1],center=true);
    }
}

//cable_tray(20);
cable_tray_cover();
