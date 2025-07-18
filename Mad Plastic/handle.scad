use <../Dollo/NEW_long_ties/include.scad>;

//_handle();
//debug();

//handle_insert_half();
//handle_axle_half();
handle_washer_jig();


module _handle() {
    tube(27, 120, 2.5, $fn=40);
}

module debug() {
    intersection() {
        handle_insert_half();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }

    intersection() {
        translate([0, 0, -1])
        handle_axle_half();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }
    
}

module handle_insert_half() {
    difference() {
        union() {
            cylinder(d=21.9, h=62, $fn=60);
            cylinder(d=28, h=2, $fn=60);
        }

        cylinder(d=17, h=200, center=true, $fn=60);
        cylinder(d1=24, d2=16, h=4, center=true, $fn=60);

        translate([0, 0, 13])
        chamfered_cylinder(
            17.5, 10, 1, center=true, $fn=60
        );

        translate([0, 0, 62 - 13])
        chamfered_cylinder(
            17.5, 10, 1, center=true, $fn=60
        );

        translate([0, 0, 62/2])
        chamfered_cylinder(
            17.5, 10, 1, center=true, $fn=60
        );

        // seam hideout
        translate([0, -21.9/2 - 1.1, 70/2 + 2])
        rotate([0, 0, 45])
        cube([2, 2, 70], center=true);

        translate([0, 17/2 - 1.1, 70/2])
        rotate([0, 0, 45])
        cube([2, 2, 70], center=true);

    }
}

module handle_axle_half() {
    difference() {
        union() {
            cylinder(d=16.7, h=63, $fn=60);

            hull() {
                cylinder(d=19.7, h=1, $fn=60);

                cylinder(d=16.7, h=2.5, $fn=60);
            }
        }
        // seam hideout
        translate([0, -16.7/2 - 1.1, 70/2 + 2])
        rotate([0, 0, 45])
        cube([2, 2, 70], center=true);

        // M12 thread
        translate([0, 0, -1])
        v_screw(
            h=65, screw_d=12.4, pitch=1.75, direction=0,
            steps=80, depth=0.3, chamfer=false
        );
    }
}

module handle_washer_jig() {
    union() {
        cylinder(d=26.8, h=3);

        v_screw(
            h=8, screw_d=11.8, pitch=1.75, direction=0,
            steps=80, depth=0.3, chamfer=true
        );
    }
}
