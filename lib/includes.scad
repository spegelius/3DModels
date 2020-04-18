m3_nut_side = 5.65;
m3_nut_height = 2.3;
m3_bolt_dia = 3.2;
m4_nut_side = 6.85;
m4_nut_height = 3.1;
m4_bolt_dia = 4.2;

//use <../_downloaded/ISOThreads/uploads_6f_12_f1_10_d2_ISOThread.scad>;
//http://dkprojects.net/openscad-threads/
use <../_downloaded/ISOThreads/threads.scad>;

module threads(d=8, h=10, z_step=1.8, depth=0.5, direction=0) {
    
    function get_twist(dir) = (direction == 0) ? -360 : 360;

    multiple = h/z_step+1;
    
    intersection() {
        for (i = [0:multiple]) {
        translate([0,0,i*z_step]) linear_extrude(height=z_step, center=true, convexity = 10, twist = get_twist(direction), $fn = 30) translate([depth, 0, 0]) circle(d=d-2*depth);
         
        }
        translate([0,0,h/2]) cube([d+depth*2,d+depth*2, h], center=true);
    }
}

module rounded_cube(x,y,z,corner,center=false) {
    fn=50;
    module rcube(x,y,z,corner) {
        translate([corner/2,corner/2,corner/2]) hull() {
            sphere(d=corner, $fn=fn);
            cube([x-corner,y-corner,z-corner]);
            if (x>corner) translate([x-corner,0,0]) sphere(d=corner, $fn=fn);
            if (x>corner && y>corner) translate([x-corner,y-corner,0]) sphere(d=corner, $fn=fn);
            if (y>corner) translate([0,y-corner,0]) sphere(d=corner, $fn=fn);
            if (z>corner) translate([0,0,z-corner]) sphere(d=corner, $fn=fn);
            if (z>corner && x>corner) translate([x-corner,0,z-corner]) sphere(d=corner, $fn=fn);
            if (z>corner && x>corner && y>corner) translate([x-corner,y-corner,z-corner]) sphere(d=corner, $fn=fn);
            if (z>corner && y>corner)translate([0,y-corner,z-corner]) sphere(d=corner, $fn=fn);
        }
    }

    module wrap() {
        diff_x = x<corner ? (corner-x)/2 : 0;
        diff_y = y<corner ? (corner-y)/2 : 0;
        diff_z = z<corner ? (corner-z)/2 : 0;
        
        translate([-diff_x,-diff_y,-diff_z]) intersection() {
            rcube(x,y,z,corner);
            translate([diff_x,diff_y,diff_z]) cube([x,y,z]);
        }
    }
    
    if (center) {
        translate([-x/2, -y/2, -z/2]) wrap();
    } else {
        wrap();
    }
}

module rounded_cube_side(x,y,z,corner,center=false) {
    intersection() {
        cube([x,y,z], center=center);
        if (!center) {
            translate([0,0,-corner]) rounded_cube(x,y,z+2*corner,corner,center);
        } else {
            rounded_cube(x,y,z+2*corner,corner,center);
        }
    }
}

module donut(d, h, angle=360, rotation=45) {
    rotate([0,0,rotation])
    rotate_extrude(angle=angle, convexity=10)
    intersection() {
        translate([d/2,0,0]) circle(d=h);
        translate([0,-h/2,0]) square([max([d,h])+1,h]);
    }
}
//donut(5,10,$fn=50);

module cube_donut(d, h, angle=360, rotation=45) {
    rotate_extrude(angle=angle, convexity=10, $fn=100) translate([d/2,0,0]) rotate([0,0,rotation]) square([h,h], center=true);
}

module rounded_cylinder(d, h, corner) {
    hull() {
        translate([0,0,corner/2]) donut(d-corner,corner);
        translate([0,0,h-corner/2]) donut(d-corner,corner);
    }
}

module rounded_tube(d,h,corner) {
    $fn=100;
    translate([0,0,corner/2]) union() {
        difference() {
            cylinder(d=d+corner, h=h-corner);
            cylinder(d=d-corner, h=h-corner+1);
        }
        donut(d=d, h=corner);
        translate([0,0,h-corner]) donut(d=d, h=corner);
    }
}

module M3_nut(h=2.4, cone=true) {
    hull() {
        cylinder(d = 6.5, h=h, $fn=6);
        if (cone) {
            translate([0,0,2.4]) cylinder(d=3.2, h=1.2, $fn=20);
        }
    }
}

module M4_nut(h=3.2, cone=true) {
    hull() {
        cylinder(d = 7.85, h=h, $fn=6);
        if (cone) {
            translate([0,0,2.4]) cylinder(d=4.2, h=1.2, $fn=20);
        }
    }
}

module M8_nut(h=6, cone=true) {
    hull() {
        cylinder(d = 14.9, h=h, $fn=6);
        if (cone) {
            translate([0,0,2.4]) cylinder(d=3.2, h=1.2, $fn=20);
        }
    }
}

module dovetail(max_width, min_width, depth, height) {
    angle=atan((max_width/2-min_width/2)/depth);
	linear_extrude(height=height, convexity=2)

	polygon(paths=[[0,1,2,3,0]], points=[[-min_width/2,0], [-max_width/2,depth], [max_width/2, depth], [min_width/2,0]]);

}

module beweled_cylinder(d, h, b, center=false) {
    module _beweled_cylinder() {
        hull() {
            cylinder(d=d-2*b, h=h);
            translate([0,0,b]) cylinder(d=d, h=h-2*b);
        }
    }
    
    if (center) {
        translate([0,0,-h/2]) _beweled_cylinder();
    } else {
        _beweled_cylinder();
    }
}

module chamfered_cube(x,y,z, chamfer, center=false) {
    
    hull() {
        if (center) {
            cube([x, y-2*chamfer,z-2*chamfer], center=center);
            cube([x-2*chamfer,y,z-2*chamfer], center=center);
            cube([x-2*chamfer,y-2*chamfer,z], center=center);
        } else {
            translate([0,chamfer,chamfer]) cube([x, y-2*chamfer,z-2*chamfer], center=center);
            translate([chamfer,0,chamfer]) cube([x-2*chamfer,y,z-2*chamfer], center=center);
            translate([chamfer,chamfer,0]) cube([x-2*chamfer,y-2*chamfer,z], center=center);
        }
    }
}

module chamfered_cube_side(x,y,z, chamfer, center=false) {
    
    hull() {
        if (center) {
            cube([x, y-2*chamfer,z], center=center);
            cube([x-2*chamfer,y,z], center=center);
        } else {
            translate([0,chamfer,0]) cube([x, y-2*chamfer,z], center=center);
            translate([chamfer,00]) cube([x-2*chamfer,y,z], center=center);
        }
    }
}

module U604zz() {
    difference() {
        cylinder(d=13,h=4, $fn=30);
        cylinder(d=4,h=5, $fn=20);
        translate([0,0,4/2]) donut(13,2.1);
    }
}

module 608zz() {
    difference() {
        cylinder(d=22,h=7,$fn=50);
        cylinder(d=8,h=8,$fn=50);
    }
}

module 623zz() {
    difference() {
        hull() {
            cylinder(d=9,h=4,$fn=40);
            translate([0,0,0.5]) cylinder(d=10,h=3,$fn=40);
        }
        cylinder(d=3,h=15,$fn=30,center=true);
    }
}

module MR105zz() {
    difference() {
        cylinder(d=10,h=4,$fn=40);
        translate([0,0,-1/2]) cylinder(d=5,h=5,$fn=30);
    }
}

module 625zz() {
    difference() {
        hull() {
            cylinder(d=15,h=5,$fn=40);
            translate([0,0,0.5]) cylinder(d=16,h=4,$fn=40);
        }
        cylinder(d=5,h=15,$fn=30,center=true);
    }
}

module mock_g9_lamp() {
    translate([0,0,-17.2/2]) difference() {
        union() {
            cube([14.2,5.2,17.2], center=true);
            translate([0,0,17.2/2]) cylinder(d=17,h=4.7,$fn=40);
            translate([0,0,17.2/2+4.7]) cylinder(d1=16.9, d2=15,h=25,$fn=40);
        }
        translate([0,2/2+1.85,0]) cube([10,2,17.2],center=true);
        translate([0,-2/2-1.85,0]) cube([10,2,17.2],center=true);
        
        translate([0,0,-17/2+(17.2-12.9)-5/2]) {
            cube([5,5,5],center=true);
            translate([0,3/2+1.2/2,0]) cube([25,3,5],center=true);
            translate([0,-3/2-1.2/2,0]) cube([25,3,5],center=true);
        }
    }
}

module g9_lamp_socket(h=30) {
    
    module _wire_hole(h) {
        hull() {
            cylinder(d=3.3,h=h,$fn=30);
            cylinder(d=0.1,h=h+4,$fn=30);
        }
    }
    
    bolt_z = h - 17.2 + 4.3/2;
    
    difference() {
        intersection() {
            union() {
                cylinder(d=22,h=h,$fn=50);
                translate([14/2-3/2,1,bolt_z]) rotate([-90,0,0]) cylinder(d=10,h=10,$fn=30);
                translate([-14/2+3/2,1,bolt_z]) rotate([-90,0,0]) cylinder(d=10,h=10,$fn=30);
            }
            translate([0,0,h/2]) cube([23,23,h],center=true);
        }
        translate([0,0,h]) mock_g9_lamp();

        translate([14/2-3.3/2,1.15,-0.1]) _wire_hole(h-12);
        translate([-14/2+3.3/2,1.15,-0.1]) _wire_hole(h-12);
        
        translate([14/2-3/2,1,bolt_z]) rotate([-90,0,0]) cylinder(d=2.7,h=10,$fn=20);
        translate([-14/2+3/2,1,bolt_z]) rotate([-90,0,0]) cylinder(d=2.7,h=10,$fn=20);
        
        translate([14/2-3/2,6,bolt_z]) rotate([-90,0,0]) cylinder(d=6.4,h=10,$fn=20);
        translate([-14/2+3/2,6,bolt_z]) rotate([-90,0,0]) cylinder(d=6.4,h=10,$fn=20);

    }
}

module tube(d=10,h=10,wall=1,center=false) {
    difference() {
        cylinder(d=d,h=h,center=center);
        translate([0,0,-1/2]) cylinder(d=d-2*wall,h=h+2,center=center);
    }
}

module holee(slop, h) {
    linear_extrude(h)
        offset(delta=slop)
        projection(cut=true)
        children();
}

//dovetail(7, 5, 4, 10);
//M8_nut();

//chamfered_cube(10,10,10,2, false);
//chamfered_cube_side(10,10,10,2, true);
//g9_lamp_socket(h=18);
