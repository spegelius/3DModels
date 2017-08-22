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
    rotate_extrude(angle=angle, convexity=10, $fn=100) translate([d/2,0,0]) rotate([0,0,rotation]) circle(d=h);
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