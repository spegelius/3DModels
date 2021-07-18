union() {
    hull() {
        cube([15,5,20]);

        translate([5/2,0,0])
        cube([10,5,25]);
    }

    translate([5/2,0,0])
    cube([10,5,50]);

    translate([0,0,40])
    hull() {
        cube([15,5,20]);

        translate([5/2,0,-5])
        cube([10,5,25]);
    }
}