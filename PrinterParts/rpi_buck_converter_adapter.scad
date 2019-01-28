
w = 14;

module adapter() {
    difference() {
        cube([w,64,2.2]);
        translate([3,3,-0.1]) cylinder(d=3.2,h=5,$fn=20);
        translate([3,3+58,-0.1]) cylinder(d=3.2,h=5,$fn=20);
        translate([0,0,1]) cube([w/2,64,2]);

        translate([w-4,4,-0.1]) {
            cylinder(d=3.2,h=5,$fn=20);
            cylinder(d1=6,d2=3.2,h=1.9,$fn=20);
        }
        translate([w-4,4+(61.7-2*2.8),-0.1]) {
            cylinder(d=3.2,h=5,$fn=20);
            cylinder(d1=6,d2=3.2,h=1.9,$fn=20);
        }

    }
}

adapter();