$fn = 40;

intersection() {
    union() {
        difference() {
            cylinder(d=15, h=1);
            cylinder(d=7, h=2);
        }

        #translate([0,10,1/2]) cube([2.3, 8, 1],center=true);
        rotate([0,0,360/3]) translate([0,10,1/2]) cube([2.3, 8, 1],center=true);
        rotate([0,0,360/3*2]) translate([0.5,10,1/2]) rotate([0,0,10]) cube([2.3, 8, 1],center=true);
    }
    cylinder(d=27, h=2);
}