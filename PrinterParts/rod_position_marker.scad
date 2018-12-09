
module rod_position_marker() {
    wall = 1.5;
    rod_d = 7.9;
    outer_d = rod_d + 2*wall;
    h = 10;

    difference() {
        union() {
            cylinder(d=outer_d, h=h, $fn=40);
            translate([-wall/2,-7-rod_d/2,0]) cube([wall,7,h]);
        }
        cylinder(d=rod_d, h=h, $fn=40);
        translate([-(rod_d-1)/2,0,0]) cube([rod_d-1,10,h]);
    }
    
}

rod_position_marker();
