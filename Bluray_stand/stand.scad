module rounded_cube(x,y,z,corner) {

    module rcube(x,y,z,corner) {
        translate([corner/2,corner/2,corner/2]) hull() {
            sphere(d=corner);
            if (x>corner) translate([x-corner,0,0]) sphere(d=corner);
            if (x>corner && y>corner) translate([x-corner,y-corner,0]) sphere(d=corner);
            if (y>corner) translate([0,y-corner,0]) sphere(d=corner);
            if (z>corner) translate([0,0,z-corner]) sphere(d=corner);
            if (z>corner && x>corner) translate([x-corner,0,z-corner]) sphere(d=corner);
            if (z>corner && x>corner && y>corner) translate([x-corner,y-corner,z-corner]) sphere(d=corner);
            if (z>corner && y>corner)translate([0,y-corner,z-corner]) sphere(d=corner);
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

box_depth = 16;
box_h = 175;
box_w = 137.5;

angle = 20;

//interval = sqrt(box_depth*box_depth*2) + 1;
interval =  box_depth + 1;
echo(interval);

module mock_bluray_box(texti=false) {
    cube([box_depth, box_w, box_h]);
    if (texti) {
        color("black") translate([3,0,box_h-40]) rotate([90, 90,0]) text("Testi Testi Testi");
    }
}

module mock_assembly() {
    for (i = [0:15]) {
        translate([0,0,i*interval]) rotate([-45,0,0]) rotate([0,-90,0]) mock_bluray_box();
    }
}

module stick(length=30) {
    linear_extrude(height=length) polygon(points=[[0,8], [8,0], [0,0]]);
}

module frame(count) {
    
    h = interval * count + 1;
    height = h+100;
    
    width = box_h + 2;
    module corner() {
        translate([-25/2, -25/2, 0]) rounded_cube(30,30,height,3, $fn=20);
    }
    
    module sticks(length=30) {
        z = h / cos(angle) - length;
        translate([0,0,-2]) stick(length+2);
        translate([0,0,z]) stick(length+2);
    }

    module body() {
        intersection() {
            translate([0,0,-1]) rotate([-angle,0,0]) intersection() {
                union() {
                    translate([-width/2,0,0]) rounded_cube(width, 110, height, 3, $fn=20);
                    translate([-box_h/2+10, 100,0]) rotate([0,0,45]) corner();
                    translate([box_h/2-10, 100,0]) rotate([0,0,45]) corner();
                    translate([-box_h/2+10, 5,0]) rotate([0,0,45]) corner();
                    translate([box_h/2-10, 5,0]) rotate([0,0,45]) corner();
                }
                translate([-(box_h+20)/2, 0,1]) cube([box_h+20, 110, height]);
            }
            translate([0,100,h/2]) cube([box_h+20, 400, h], center=true);
        }
    }
    
    translate([0,0,-sin(angle)*1]) rotate([90+angle,0,0]) difference() {
        body();
        intersection() {
            rotate([-angle,0,0]) translate([-(box_h-6)/2,1.3,0]) cube([box_h-6, 130,height]);
            translate([0,100,h/2-1]) cube([box_h+20, 400, h], center=true);
        }

        for (i = [0:4]) {
            translate([-15/2,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
            translate([-15/2+25,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
            translate([-15/2+50,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
            translate([-15/2+75,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
            translate([-15/2-25,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
            translate([-15/2-50,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
            translate([-15/2-75,i*22+6,0]) rotate([-angle,0,0]) cube([15,15,2*h]);
        }

        y_step = sin(angle+0.1) * (interval+1);
        echo(y_step);
        for (i = [0:count-1]) {
            translate([box_h/2,7.65+i*y_step,i*interval+1]) rotate([0,-90,0]) mock_bluray_box();
        }

        ratio = (h - 10)/(30+10);
        slot = floor(ratio);
        cube_h = (30+10) * (ratio/slot) - 5;
        echo(ratio, cube_h);
        if (slot > 0) {
            offset = cube_h/2 + 10;
            #for (i = [0:slot-1]) {
                rotate([-angle,0,0]) translate([20,5,i*(cube_h+10) + offset]) cube([15,15,cube_h], center=true);
                rotate([-angle,0,0]) translate([-20,5,i*(cube_h+10) + offset]) cube([15,15,cube_h], center=true);
                rotate([-angle,0,0]) translate([60,5,i*(cube_h+10) + offset]) cube([15,15,cube_h], center=true);
                rotate([-angle,0,0]) translate([-60,5,i*(cube_h+10) + offset]) cube([15,15,cube_h], center=true);
            }
        }

        translate([box_h/2+8,9.5,0]) rotate([-angle,0,0]) rotate([0,0,135]) sticks(30/2);
        translate([-(box_h/2+8),9.5,0]) rotate([-angle,0,0]) rotate([0,0,-45]) sticks(30/2);
        
        translate([box_h/2+8,110.5,0]) rotate([-angle,0,0]) rotate([0,0,135]) sticks(30/2);
        translate([-(box_h/2+8),110.5,0]) rotate([-angle,0,0]) rotate([0,0,-45]) sticks(30/2);
    }
}

//%mock_bluray_box();

//mock_assembly();

//cube([box_h + 4, 100, 200]);

module test_pieces() {
//    translate([0,0,-2]) intersection() {
//        frame(2);
//        translate([box_h/2-2,-20,2]) cube([20,20,13]);
//    }
    translate([0,0,-6]) intersection() {
        frame(1);
        translate([-17.5,-40,6]) cube([80,20,31]);
    }
    translate([-17.5,-26,0]) cube([80,10,1]);
    
    translate([60,-10,0]) rotate([0,-90,0]) scale([0.92,0.92,1]) stick(30-1);
}

frame(8);

//translate([0,10,0]) rotate([0,-90,0]) scale([1,0.98,0.98]) stick(30-1);
//test_pieces();

