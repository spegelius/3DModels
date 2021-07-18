
insulation_trap();

module insulation_trap() {
    difference() {
        union() {
            translate([0, 0, 5/2])
            cube([214, 214, 5], center=true);

            for(i = [0:3]) {
                rotate([0, 0, i * 360/4])
                translate([209/2, 209/2, 0]) {
                    cylinder(d=12, h=9.8, $fn=50);

                    hull() {
                        cylinder(d=12, h=5, $fn=50);

                        translate([-10, -10, 0])
                        cylinder(d=25, h=5, $fn=50);
                    }
                }
            }
        }

        for(i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([209/2, 209/2, 8])
            cylinder(d=3.6, h=33, $fn=50);
        }

        for(i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([209/2, 209/2, -1])
            cylinder(d=8.5, h=7.8, $fn=50);
        }

        for(i = [0:3]) {
            rotate([0, 0, i * 360/4])
            hull() {
                translate([85, 95, 1])
                cylinder(d=5, h=5, $fn=50);

                translate([7.5, 95, 1])
                cylinder(d=5, h=5, $fn=50);

                translate([7.5, 17.5, 1])
                cylinder(d=5, h=5, $fn=50);
            }
        }
        
        for(i = [0:3]) {
            rotate([0, 0, i * 360/4])
            hull() {
                translate([-85, 95, 1])
                cylinder(d=5, h=5, $fn=50);

                translate([-7.5, 95, 1])
                cylinder(d=5, h=5, $fn=50);

                translate([-7.5, 17.5, 1])
                cylinder(d=5, h=5, $fn=50);
            }
        }
        
        translate([0, 0, 1])
        cylinder(d=20, h=5);
    }
}