use <../Dollo/NEW_long_ties/include.scad>;

lepy7_PSU_clip();

module lepy7_PSU_clip() {
    difference() {
        union() {
            translate([5/2,0,0])
            rotate([90,0,0])
            rounded_cube_side(15,20,2.5,3,center=true,$fn=30);

            translate([12/2+4,8.5/2,0])
            rotate([90,0,0])
            rounded_cube_side(12,20,8.5+2.5,3,center=true,$fn=30);
        }

        translate([10/2+8-1,0,0])
        rotate([90,0,0])
        cylinder(d=4,h=20,center=true,$fn=40);

        translate([10/2+8-1,0,0])
        rotate([90,0,0])
        cylinder(d1=8.5, d2=15,h=13,center=true,$fn=40);

        translate([-0.5,0,6])
        rotate([90,0,0]) {
            cylinder(d=3.5,h=10,center=true,$fn=40);
            cylinder(d1=3.5,d2=6,h=2,$fn=40);
        }

        translate([-0.5,0,-6])
        rotate([90,0,0]) {
            cylinder(d=3.5,h=10,center=true,$fn=40);
            cylinder(d1=3.5,d2=6,h=2,$fn=40);
        }

        translate([29.8,-8,0])
        rotate([0,0,45])
        cube([40,40,40],center=true);

        translate([32,0,17])
        rotate([0,45,0])
        cube([40,40,40],center=true);

        translate([32,0,-17])
        rotate([0,-45,0])
        cube([40,40,40],center=true);
    }
}