
module washer() {
    difference() {
        union() {
            translate([0,3/2,20/2])
            cube([22,3,20],center=true);

            translate([0,7/2,3/2])
            cube([22,7,3],center=true);

            translate([0,0,6+6/2])
            rotate([90,0,0])
            hull() {
                cylinder(d=6,h=3,$fn=40);

                translate([0,10-6,0])
                cylinder(d=6,h=3,$fn=40);
            }
        }
        translate([0,0,6+6/2])
        rotate([90,0,0])
        cylinder(d=6.2,h=7,center=true,$fn=40);

        hull() {
            translate([0,0,6+6/2+0.8])
            rotate([45,0,0])
            translate([-7/2,-4,0])
            cube([7,4,5]);

            translate([-7/2,-6.01,0])
            cube([7,6,1]);
        }
    }
}

washer();