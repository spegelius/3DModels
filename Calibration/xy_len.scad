union() {
    cube([3,150,5]);
    cube([150,3,5]);

    translate([0,150-4,0])
    cube([10,4,5]);

    translate([150-4,0,0])
    cube([4,10,5]);
}