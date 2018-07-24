m3_nut_side = 5.65;
m3_nut_height = 2.3;
m3_bolt_dia = 3.2;
m4_nut_side = 6.85;
m4_nut_height = 3.1;
m4_bolt_dia = 4.2;

use <../_downloaded/ISOThreads/uploads_6f_12_f1_10_d2_ISOThread.scad>;

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

module rounded_cube(x,y,z,corner) {
    fn=50;
    module rcube(x,y,z,corner) {
        translate([corner/2,corner/2,corner/2]) hull() {
            sphere(d=corner, $fn=fn);
            if (x>corner) translate([x-corner,0,0]) sphere(d=corner, $fn=fn);
            if (x>corner && y>corner) translate([x-corner,y-corner,0]) sphere(d=corner, $fn=fn);
            if (y>corner) translate([0,y-corner,0]) sphere(d=corner, $fn=fn);
            if (z>corner) translate([0,0,z-corner]) sphere(d=corner, $fn=fn);
            if (z>corner && x>corner) translate([x-corner,0,z-corner]) sphere(d=corner, $fn=fn);
            if (z>corner && x>corner && y>corner) translate([x-corner,y-corner,z-corner]) sphere(d=corner, $fn=fn);
            if (z>corner && y>corner)translate([0,y-corner,z-corner]) sphere(d=corner, $fn=fn);
        }
    }
    
    diff_x = x<corner ? (corner-x)/2 : 0;
    diff_y = y<corner ? (corner-y)/2 : 0;
    diff_z = z<corner ? (corner-z)/2 : 0;
    
    translate([-diff_x,-diff_y,-diff_z]) intersection() {
        rcube(x,y,z,corner);
        translate([diff_x,diff_y,diff_z]) cube([x,y,z]);
    }
}

module rounded_cube_side(x,y,z,corner) {
    intersection() {
        cube([x,y,z]);
        translate([0,0,-corner]) rounded_cube(x,y,z+2*corner,corner);
    }
}

module donut(d, h, angle=360, rotation=45) {
    rotate([0,0,rotation]) rotate_extrude(angle=angle, convexity=10) translate([d/2,0,0]) circle(d=h);
}

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

module beweled_cylinder(d, h, b) {
    hull() {
        cylinder(d=d-2*b, h=h);
        translate([0,0,b]) cylinder(d=d, h=h-2*b);
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

module fitting_thread_M6(fitting_h=6) {
    translate([0,0,-1]) intersection() {
        union() {
            thread_out(6,fitting_h+2,thr=20);
            cylinder(d=5.16, h=fitting_h+2,$fn=50);
        }
        translate([0,0,1]) cylinder(d=6.2,h=fitting_h,$fn=50);
    }
}

//dovetail(7, 5, 4, 10);
//M8_nut();

//chamfered_cube(10,10,10,2, false);
//chamfered_cube_side(10,10,10,2, true);