
$fn=60;

module clip(clip_d=10, h=8) {
    wall = clip_d/10;
    difference() {
        cylinder(d=clip_d+2*wall, h=h);
        cylinder(d=clip_d, h=h);
        translate([0,clip_d/2,h/2]) rotate([0,45,0]) cube([wall, clip_d, 25], center=true);
    }
}

module cable_clip_small(clip_d=10, h=8) {
    union() {
        clip(clip_d, h);
        difference() {
            translate([0,-clip_d/1.9,(10+h)/2]) cube([10,2,10+h], center=true);
            translate([0,0,(10+h)-5]) rotate([90,0,0]) cylinder(d=3.5,h=20);
        }
    }
}

module cable_screw_collar() {
    wall = 1.5;
    d = 12;
    outer_d = d + 2*wall;
    h = 12;
    
    module _arm(rotation) {
        rotate([0,0,rotation]) difference() {
            cube([wall,10,h], center=true);
            translate([0,1,0]) rotate([0,90,0]) cylinder(d=3.8,h=5,center=true,$fn=6);
        }
    }
    
    union() {
        difference() {
            cylinder(d=outer_d, h=h, $fn=30);
            cylinder(d=d, h=h+1, $fn=30);
            translate([-7/2,4,0]) cube([7,4,h+1]);
        }
        rotate([0,0,-25]) translate([0,12/2-0.2,0]) translate([0,10/2,h/2]) _arm(17);
        rotate([0,0,25]) translate([0,12/2-0.2,0]) translate([0,10/2,h/2]) _arm(-17);
    }
}

//cable_clip_small(10, 8);
//cable_clip_small(12, 10);

cable_screw_collar();