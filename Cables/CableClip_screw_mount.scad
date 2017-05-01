
height = 8;

module frame() {
    union() {
        cube([30,height+1.5,10]);
        translate([(30-41)/2,-2,0]) cube([41,2,10]);
    }
}

difference() {
    frame();
    translate([(30-27)/2,0,0]) cube([27,height,11]);
    translate([30/2, height,20/2-5]) rotate([0,45,0]) cube([3,5,20], center=true);
    translate([-3.5/2-1, -5/2, 10/2]) rotate([-90,0,0]) cylinder(d=3.5, h=5, $fn=30);
    translate([3.5/2+1+30, -5/2, 10/2]) rotate([-90,0,0]) cylinder(d=3.5, h=5, $fn=30);
}