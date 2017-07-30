
depth = 8;

pellet = 5.92+0.05;

$fn=30;

bearing_d = 22;
bearing_inner_d = 8;
bearing_h = 7;

module donut(d, h) {
    rotate_extrude(convexity=10, $fn=100) translate([d/2-h/2,0,0]) circle(d=h);
}

module cube_donut(d, h) {
    rotate_extrude(convexity=10, $fn=100) translate([d/2-h/2,0,0]) rotate([0,0,45]) square([h,h]);
}

module extended_donut(d,h,h2){
    translate([0,0,h/2]) union() {
        donut(d,h);
        translate([0,0,h2-h]) donut(d,h);
        difference() {
            cylinder(d=d, h=h2-h, $fn=100);
            cylinder(d=h*2, h=h2-h, $fn=100);
        }
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

module nut(d=14.8, h=8) {
    cylinder(d=d, h=h, $fn=6);
    //cylinder(d=12.75, h=7, $fn=40);
}

module wing(w1=30, w2=20, nut_size=14.8) {
    difference() {
        hull() {
            translate([-2,-w1/2+5.5,0]) cube([0.1,w1,depth]);
            translate([30,0,0]) cylinder(d=w2,h=depth);
        }
        translate([30,0,0]) nut(d=nut_size);
    }
    
}

module wing2(nut_size=14.8) {
    difference() {
        hull() {
            translate([0,-10,0]) rounded_cube(0.1,30,depth,3) cube([0.1,30,depth]);
            translate([30,0,0]) extended_donut(d=20,h=3,h2=depth);
        }
        translate([30,0,0]) nut(d=nut_size);
    }
    
}

module body() {
    difference() {
        for (i=[0:2]) {
            rotate([0,0,360/3*i]) wing();
        }
        cylinder(d=22, h=depth, $fn=40);
        translate([0,0,depth/2]) donut(25, pellet);
    }
}

module body2(){
    difference() {
        for (i=[0:2]) {
            rotate([0,0,360/3*i]) translate([-2,0,0]) wing2();
        }
        cylinder(d=22, h=depth, $fn=40);
        translate([0,0,depth/2-sqrt(2*pellet*pellet)/2]) cube_donut(25, pellet);
    }

}

module body3_inner() {
    difference() {
        union() for (i=[0:2]) {
           rotate([0,0,360/3*i]) translate([-2,0,0]) wing(w1=21, w2=12, nut_size=20);
        }
        cylinder(d=bearing_d + 4, h=depth, $fn=60);
    }
}

module body3(){
    difference() {
        for (i=[0:2]) {
            rotate([0,0,360/3*i]) translate([-2,0,0]) wing2();
        }
        body3_inner();
        cylinder(d=bearing_d, h=depth, $fn=60);
        hull() {
            translate([0,0,-0.1]) cylinder(d=bearing_d+1, h=0.1, $fn=60);
            cylinder(d=bearing_d, h=(depth-bearing_h)/2, $fn=60);
        }
        hull() {
            translate([0,0,bearing_h+(depth-bearing_h)/2]) cylinder(d=bearing_d, h=0.1, $fn=60);
            translate([0,0,depth]) cylinder(d=bearing_d+1, h=0.1, $fn=60);
        }
    }
}

module _center() {
    difference() {
        cylinder(d=20,h=depth/2+1, $fn=40);
        translate([0,0,depth/2+1]) donut(25, pellet);
    }
}

module _center_2() {
    difference() {
        union() {
            cylinder(d=20,h=1, $fn=40);
            cylinder(d=19.05,h=depth/2+1, $fn=40);
        }
        translate([0,0,1]) cube_donut(25, pellet);
    }
}

module center1() {
    difference() {
        _center();
        translate([0,0,1]) cylinder(d=7,h=depth-1);
    }
}


module center2() {
    _center();
    translate([0,0,1]) cylinder(d=6.9,h=depth-1);
}

module center1_2() {
    difference() {
        _center_2();
        translate([0,0,1]) cylinder(d=7,h=depth-1);
    }
}


module center2_2() {
    _center_2();
    translate([0,0,1]) cylinder(d=6.9,h=depth-1);
}

module center3() {
    cylinder(d=bearing_d+2, h=0.4, $fn=100);
    translate([0,0,0.4]) hull() {
        translate([0,0,-0.1]) cylinder(d=bearing_d+2, h=0.1, $fn=100);
        cylinder(d=bearing_d-1, h=(depth-bearing_h)/2+1, $fn=100);
    }
    cylinder(d=bearing_inner_d+0.2, h=depth/2+(depth-bearing_h)/2+1, $fn=60);
}

module nub() {
    hull() {
        cylinder(d=13, h=0.1, $fn=40);
        translate([0,0,2]) cylinder(d=16, h=0.6, $fn=40);
    }
    translate([0,0,2.6]) nut(d=14.7, h=0.8);
    translate([0,0,3.4]) hull() {
        cylinder(d=7.1, h=0.1);
        cylinder(d=7, h=2);
    }
}


module test_nut() {
    difference() {
        translate([-10,-10,0]) cube([20,20,5]);
        nut();
    }
}

module test_center() {
    difference() {
        cylinder(d=30,h=depth);
        cylinder(d=21,h=depth, $fn=40);
        translate([0,0,depth/2]) hull() {
            donut(25, pellet);
        }
    }
}


intersection() {
    //body();
    //cube([50,50,50]);
}

module plate1() {
    body();
    translate([10,30,0]) center1();
    center2();
    translate([30,25,0]) nub();
    translate([25,-20,0]) nub();
    translate([12,-32,0]) nub();
    translate([-35,-30,0]) nub();
    translate([-30,-12,0]) nub();
    translate([-32,8,0]) nub();
}

//body2();

//center1_2();
//center2_2();

//translate([50,0,0]) cube_donut(25,5);
//translate([50,0,sqrt(2*5*5)/2]) donut(25,5);
//test_nut();
//test_center();

//body3_inner();
//body3();
center3();
