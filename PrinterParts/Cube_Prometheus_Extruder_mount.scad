slop = 0.15;



module frame() {
    translate([0,0,4/2]) cube([66,30,4], center=true);
    translate([-66/2,-30/2+3,4]) rotate([90,0,0]) linear_extrude(3) polygon(points=[[66-2,0], [66-2,40], [0,0]]);
    translate([(66-2*2)/2,-30/2,0]) cube([3,30/2,40+4]);
    translate([(66-2*2)/2,0,0]) cube([18+3,3,40+4]);
}

difference() {
    frame();
    cylinder(d=20,h=5, $fn=40);
    translate([25,0,0]) cylinder(d=4+2*slop,h=5, $fn=40);
    translate([-25,0,0]) cylinder(d=4+2*slop,h=5, $fn=40);
    
    translate([(66-2*2+3*2)/2+18/2,-2,6]) rotate([-90,0,0]) cylinder(d=4,h=5,$fn=40);
    translate([(66-2*2+3*2)/2+18/2,-2,34+4]) rotate([-90,0,0]) cylinder(d=4,h=5,$fn=40);
    
    translate([66/2,30/2,0]) rotate([0,0,45]) cube([15,15,10],center=true);
    translate([-66/2,30/2,0]) rotate([0,0,-45]) cube([15,15,10],center=true);
}