
use <../Dollo/NEW_long_ties/include.scad>;


small_handle_upgrade();


module small_handle_upgrade() {
    h = 43;

    difference() {
        rounded_cylinder(20, h, 7, $fn=40);

        for(i = [0:5]) {
            rotate([0, 0, i*360/6])
            translate([20/2 + 0.8, 0, 0])
            cylinder(d=5, h=200, center=true, $fn=30);
        }

        difference() {
            translate([0, 0, 1])
            cylinder(d=8, h=50, $fn=40);
            
            for(i = [0:3]) {
                rotate([0, 0, i*360/4])
                translate([3/2 + 5.5/2, 0, 0])
                cylinder(d=3, h=200, center=true, $fn=30);
            }
        }

        translate([0, 0, h - 14])
        donut(46, 30, $fn=60);
    }
}