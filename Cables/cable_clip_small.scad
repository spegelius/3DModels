
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

//cable_clip_small(10, 8);
cable_clip_small(12, 10);