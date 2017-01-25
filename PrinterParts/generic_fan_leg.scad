
side = 82;
nut_holes = 71;
$fn=60;

slop = 0.10;
angle = 10;

nozzle = 0.6;

difference() {
    cube([side,20,3]);
    translate([side/2, 45, -0.1]) cylinder(d=80,h=4);
    translate([(side-80)/2 + (80-nut_holes)/2, 5+(80-nut_holes)/2,0]) cylinder(d=2.9, h=5);
    translate([side-((side-80)/2 + (80-nut_holes)/2), 5+(80-nut_holes)/2,0]) cylinder(d=2.9, h=5);
}

translate([0,0,0]) rotate([angle,0,0]) cube([8,3,40]);
translate([side-8,0,0]) rotate([angle,0,0]) cube([8,3,40]);

module leg() {
    
    module body() {
        union() {
            cube([12,14,3]);
            translate([0,8.5,1]) rotate([-angle,0,0]) cube([12,3+4*nozzle+2*slop,6]);
        }
    }
    
    difference() {
        body();
        translate([6, 5, 0]) cylinder(d=3.2, h=4);
        translate([2-slop,8.5+2*nozzle,1]) rotate([-angle,0,0]) cube([8+2*slop,3+2*slop,10]);
    }
}

//translate([-2, -16.9, -40]) leg();
//translate([side-10, -16.9, -40]) leg();

translate([25, 13, 0]) leg();
translate([40, 13, 0]) leg();
