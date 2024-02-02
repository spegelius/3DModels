use <../Dollo/New_long_ties/include.scad>;


bolt_threading_helper_base();
//bolt_threading_helper_top();
//bolt_threading_helper_top(4);


module bolt_threading_helper_base() {
    difference() {
        union() {
            chamfered_cylinder(
                33, 16.2, 2, $fn=40
            );

            hull() {
                translate([0, -8, 2 + 9/2])
                rotate([90, 0, 0])
                cylinder(d=10, h=15, $fn=30);

                translate([0, -8 - 15/2, 1/2])
                cube(
                    [10, 15, 1],
                    center=true
                );
            }
        }

        translate([0, 0, 3])
        cylinder(d=23, h=20);

        translate([0, 0, -1])
        cylinder(d=20, h=20, $fn=40);

        translate([0, 0, 2])
        tube(25.3, 15, 4.2, $fn=40);

        translate([0, 0, 2 + 8.6])
        v_screw(
            h=10, screw_d=27,
            pitch=1.5, direction=0,
            steps=100, depth=0,
            chamfer=false
        );

        translate([0, -15, 2 + 9/2])
        rotate([90, 0, 0])
        cylinder(
            d=3.3, h=20,
            center=true, $fn=30
        );

        translate([
            0, -19, 2 + 9/2 + 10/2 - 3
        ])
        cube([6, 2, 10], center=true);

        // grip
        rotate([0, 0, -150])
        for (i = [0:34]) {
            rotate([0, 0, i * 360/41])
            translate([0, 33/2, 0])
            cylinder(
                d=1.5, h=40,
                center=true, $fn=20
            );
        }
    }
}

module bolt_threading_helper_top(dia=3) {
    difference() {
        union() {
            translate([0, 0, 5])
            rotate([180, 0, 0])
            v_screw(
               h=5, screw_d=26.6,
               pitch=1.5, direction=0,
               steps=100, depth=0,
               chamfer=true
            );

            hull() {
                translate([-6, 0, 0])
                cylinder(d=10, h=15, $fn=30);

                translate([6, 0, 0])
                cylinder(d=10, h=15, $fn=30);

            }
        }

        cylinder(d=dia + 0.3, h=70, center=true, $fn=30);
    }
}