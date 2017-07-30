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

difference() {
    rounded_cube(30,40,21,4);
    translate([30/2, 8, 0]) cylinder(d=7, h=50, $fn=30);

    difference() {
        translate([30/2, 0, 21]) rotate([-90,0,0]) cylinder(d=22.3, h=50, $fn=40);
        translate([30/2, 8, 3]) sphere(d=20);
    }
    
    split = 13;
    
    translate([30/2 - split/2, 0, 7]) hull() {
        translate([0,50/2,20]) cube([3.4, 50, 1], center=true);
        rotate([-90,0,0]) cylinder(d=3.4, h=50, $fn=30);
    }
    
    translate([30/2 + split/2, 0, 7]) hull() {
        translate([0,50/2,20]) cube([3.4, 50, 1], center=true);
        rotate([-90,0,0]) cylinder(d=3.4, h=50, $fn=30);
    }
    
    translate([30/2 - split/2, 8+7/2+1.5, 7]) hull() {
        translate([0,3/2,20]) cube([9, 3, 1], center=true);
        rotate([-90,0,0]) cylinder(d=9, h=3, $fn=30);
    }
    
    translate([30/2 + split/2, 8+7/2+1.5, 7]) hull() {
        translate([0,3/2,20]) cube([9, 3, 1], center=true);
        rotate([-90,0,0]) cylinder(d=9, h=3, $fn=30);
    }

    translate([30/2 - split/2, 8+7/2+1.5 + 3, 7]) hull() {
        translate([0,3/2,20]) cube([5, 3, 1], center=true);
        rotate([-90,0,0]) cylinder(d=5, h=3, $fn=30);
    }
    
    translate([30/2 + split/2, 8+7/2+1.5 + 3, 7]) hull() {
        translate([0,3/2,20]) cube([5, 3, 1], center=true);
        rotate([-90,0,0]) cylinder(d=5, h=3, $fn=30);
    }

    translate([30/2 + split/2, 8+7/2+1.5+3+1.8, 7]) hull() {
        translate([0,17.5/2,20]) cube([9.3, 17.5, 1], center=true);
        rotate([-90,0,0]) cylinder(d=9.3, h=17.5, $fn=30);
    }
    
    translate([30/2 - split/2, 8+7/2+1.5+3+1.8, 7]) hull() {
        translate([0,17.5/2,20]) cube([9.3, 17.5, 1], center=true);
        rotate([-90,0,0]) cylinder(d=9.3, h=17.5, $fn=30);
    }

    translate([30/2 + split/2, 8+7/2+1.5+3+1.8+17.5, 7]) hull() {
        translate([0,17.5/2,20]) cube([7.5, 17.5, 1], center=true);
        rotate([-90,0,0]) cylinder(d=7.5, h=17.5, $fn=30);
    }
    
    translate([30/2 - split/2, 8+7/2+1.5+3+1.8+17.5, 7]) hull() {
        translate([0,17.5/2,20]) cube([7.5, 17.5, 1], center=true);
        rotate([-90,0,0]) cylinder(d=7.5, h=17.5, $fn=30);
    }

}