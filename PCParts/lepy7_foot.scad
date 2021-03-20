use <../Dollo/NEW_long_ties/include.scad>;

lepy7_foot_core();
//lepy7_foot_dampener();

module _core_form() {
    intersection() {
        hull() {
            translate([-25/2+7,-50/2+6,0])
            sphere(d=7,$fn=40);

            translate([25/2-7,-50/2+6,0])
            sphere(d=7,$fn=40);

            translate([-25/2+7,50/2-6,0])
            sphere(d=7,$fn=40);

            translate([25/2-7,50/2-6,0])
            sphere(d=7,$fn=40);
        }
        cube([50,60,3.2],center=true);
    }
}

module lepy7_foot_core() {

    module _screw_hole() {
        union() {
            translate([0,0,3.21-0.8])
            cylinder(d=7.05,h=0.8,$fn=30);

            translate([0,0,3.21-3.79])
            cylinder(d2=7.05,d1=3.1,h=3,$fn=30);

            cylinder(d=3.2,h=15,center=true,$fn=30);
        }
    }
    difference() {
        translate([0,0,3.2/2])
        _core_form();

        translate([0,13,0])
        _screw_hole();

        translate([0,-13,0])
        _screw_hole();

        translate([0,0,3/2+1])
        rotate([0,0,45])
        cube([0.1,15,3],center=true);

        translate([0,3,3/2+1])
        rotate([0,0,45])
        cube([0.1,15,3],center=true);

        translate([0,-3,3/2+1])
        rotate([0,0,45])
        cube([0.1,15,3],center=true);

        translate([0,6,3/2+1])
        rotate([0,0,45])
        cube([0.1,15,3],center=true);

        translate([0,-6,3/2+1])
        rotate([0,0,45])
        cube([0.1,15,3],center=true);
    }
}

module lepy7_foot_dampener() {
    difference() {
        rounded_cube_side(25,50,5,7,center=true,$fn=50);

        translate([0,0,5/2-3.2/2+0.01])
        _core_form();
    }
}