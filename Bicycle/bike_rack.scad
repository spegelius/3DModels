use <../Dollo/NEW_long_ties/include.scad>;


module bike_rack_dampener() {
    difference() {
        union() {
            
            translate([0,0,60])
            hull() {
                rounded_cube_side(35,35,1,8,center=true,$fn=30);

                sphere(d=25,$fn=30);
            }

            translate([0,0,60/2])
            rounded_cube_side(35,35,60,8,center=true,$fn=30);
        }
        hull() {
            translate([0,0,55/2-0.01])
            cube([25.2,25.2,55],center=true);

            cylinder(d=5,h=67.5);
        }
    }
}

bike_rack_dampener();
