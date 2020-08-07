
use <../Dollo/NEW_long_ties/include.scad>;

wall = 1.3;
hole_interval = 100;

module _screw_hole() {
    rotate([90,0,0])
    hull() {
        translate([0,4/2,0])
        cylinder(d=4,h=20,center=true,$fn=40);

        translate([0,-4/2,0])
        cylinder(d=4,h=20,center=true,$fn=40);
    }
}

module _tray(h=100) {
    module _edge() {
        union() {
            cube([3,5,h+1],center=true);

            translate([0,-5/2+wall/2,0])
            hull() {
                cube([5,wall,h+1],center=true);

                translate([5/2,0.4,0])
                cube([1,wall+1.5,h+1],center=true);
            }
        }
    }

    translate([0,0,h/2])
    difference() {
        // main form
        rounded_cube_side(30,13,h,1,center=true,$fn=20);

        // tray opening
        translate([0,-13/2+7.1/2+wall,0])
        hull() {
            cube([30-2*wall,7.1,h+10],center=true);

            translate([0,1/2+6,0])
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
    }
}

module cable_tray(h=100, hole_offset=10, top_guides=true, bottom_guides=true) {
    h_o = hole_offset;
    
    difference() {
        union() {
            _tray(h=h);

            if (top_guides) {
                // top guides
                translate([30/4,-13/2+wall/2,h+1])
                rotate([0,45,0])
                cube([4,wall,4],center=true);

                translate([-30/4,-13/2+wall/2,h+1])
                rotate([0,45,0])
                cube([4,wall,4],center=true);
            }
        }

        if (bottom_guides) {
            // bottom guides
            translate([30/4,0,1])
            rotate([0,45,0])
            cube([4.1,14,4.1],center=true);

            translate([-30/4,0,1])
            rotate([0,45,0])
            cube([4.1,14,4.1],center=true);
        }

        // screw holes
        for(i=[0:100]) {
            translate([0,0,h_o+i*hole_interval])
            _screw_hole();
        }
    }
}

module _chamfer(length=50, both_ends=false) {
    difference() {
        children();

        translate([-30/2,-50/2,length+.01])
        rotate([0,90/4,0])
        cube([100,50,50]);

        if(both_ends) {
            translate([-30/2,-50/2-0.01,0])
            rotate([0,-90/4,0])
            translate([0,0,-length])
            cube([100,50,50]);
        }
    }
}

module _cornerize(len1, len2) {
    union() {
        children(0);

        translate([-30/2,0,len1])
        rotate([0,90/4*2,0])
        translate([30/2,0,0])
        union() {
            children(1);

            translate([-30/2,0,50])
            rotate([0,90/2,0])
            translate([30/2,0,len2])
            mirror([0,0,1])
            children(2);
        }
    }
}

module corner_tray(len1=50, len2=50) {
    l1 = len1 - 35.35;
    l2 = len2 - 35.35;

    translate([30/2,l1+30+5.35,0])
    rotate([90,0,0])
    _cornerize(l1, l2) {
        // tray with quide holes
        difference() {
            _chamfer(l1)
            _tray(l1);

            // bottom guides
            translate([30/4,0,1])
            rotate([0,45,0])
            cube([4.1,14,4.1],center=true);

            translate([-30/4,0,1])
            rotate([0,45,0])
            cube([4.1,14,4.1],center=true);

            translate([0,0,l1/2])
            _screw_hole();
        }

        // middle tray
        _chamfer(50, both_ends=true)
        _tray(50);

        // tray with quides
        union() {
            difference() {
                _chamfer(l2)
                _tray(l2);

                translate([0,0,l2/2])
                _screw_hole();
            }

            // top guides
            translate([-30/4,-13/2+wall/2,-1])
            rotate([0,45,0])
            cube([4.1,wall,4.1],center=true);

            translate([30/4,-13/2+wall/2,-1])
            rotate([0,45,0])
            cube([4.1,wall,4.1],center=true);
        }
    }
}

module corner_tray_cover(len1, len2) {
    l1 = len1 - 35.35;
    l2 = len2 - 35.35;

    mirror([1,0,0])
    translate([30/2,l1+30+5.35,0])
    rotate([90,0,0])
    _cornerize(l1, l2) {
        _chamfer(l1)
        cable_tray_cover(h=l1);

        _chamfer(50, both_ends=true)
        cable_tray_cover(h=50);

        _chamfer(l2)
        cable_tray_cover(h=l2);
    }
}

module cable_tray_cover(h=100) {
    translate([0,0,h/2])
    difference() {
        rounded_cube_side(30,4,h,1,center=true,$fn=20);

        hull() {
            translate([0,(4-wall-1.3)/2-4/2+wall])
            cube([30-2*wall,4-wall-1.3,h+1],center=true);

            translate([0,3.7,0])
            cube([5,1,h+1],center=true);
        }

        translate([0,4/2,0])
        cube([25.2,4,h+1],center=true);
    }
}

module cable_clip() {
    difference() {
        union() {
            hull() {
                cylinder(d=8,h=1.5);

                translate([0,10/2,1.5/2])
                cube([1.5,10,1.5],center=true);
            }
            translate([0,6/2+4,3.5/2])
            cube([2.5,6,3.5],center=true);
        }
        cylinder(d=4.4,h=5,$fn=20);

        translate([0,7,1.5/2+1])
        cube([5,2.4,1.5],center=true);
    }
}

//cable_tray(130, top_guides=false, bottom_guides=false);
//cable_tray_cover(140);

//corner_tray();
//corner_tray_cover();

//corner_tray(150, 100);
corner_tray_cover(150, 100);

//cable_clip();
