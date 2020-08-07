module pin() {
    difference() {
        cylinder(d=3.1,h=20,$fn=40);
        translate([1.7,0,6.5]) rotate([90,0,0]) cylinder(d=3,h=5,center=true,$fn=40);
        translate([5/2+0.2,0,20/2+6.5]) cube([5,5,20],center=true);
        translate([-1.3,0,20]) difference() {
            cube([5,5,5],center=true);
            translate([0,0,-5/2]) rotate([90,0,0]) cylinder(d=3,h=5,center=true,$fn=40);
        }
    }
}

//pin();

dia = 12;

module head() {
    difference() {
        intersection() {
            hull() {
                translate([0,0,dia/3]) sphere(d=dia,$fn=40);
                translate([0,0,40-dia/2]) sphere(d=dia,$fn=40);
            }
            cylinder(d=dia+1,h=40,$fn=40);
        }
        pin();
    }
}

head();