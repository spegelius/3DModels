use <../../../Dollo/NEW_long_ties/include.scad>;


//debug_bed_insulation_retainers();


//outer_retainer();
inner_retainer();


module debug_bed_insulation_retainers() {
    outer_retainer();
    inner_retainer();
}

module outer_retainer() {
    difference() {
        translate([0, 0, 5/2])
        rounded_cube_side(
            510 - 20, 510 - 20, 5, 22,
            center=true, $fn=40
        );

        rounded_cube_side(
            510 - 40, 510 - 40, 24, 2,
            center=true, $fn=40
        );

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([510/2 - 15, 0, 0.4])
            cylinder(d=2, h=10, $fn=20);

            rotate([0, 0, i*90])
            translate([510/2 - 15, 510/2 - 60, 0.4])
            cylinder(d=2, h=10, $fn=20);

            rotate([0, 0, i*90])
            translate([510/2 - 15, -510/2 + 60, 0.4])
            cylinder(d=2, h=10, $fn=20);
        }

        translate([-510/2, 510/2, 0])
        cube([60, 60, 60], center=true);

    }
}

module inner_retainer() {
    difference() {
        union() {
            translate([0, 0, 5/2])
            rounded_cube_side(
                510 - 150, 510 - 150, 5, 5, center=true
            );

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([510/2 - 85, 510/2 - 85, 0])
                cylinder(d=30, h=5, $fn=30);
            }
        }

        difference() {
            cube([510 - 170, 510 - 170, 20], center=true);

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([510/2 - 85, 510/2 - 85, 0])
                cylinder(d=30, h=20, center=true, $fn=30);
            }

            difference() {
                translate([0, 0, 2.5/2])
                chamfered_cube_side(
                    308, 308, 2.5, 20, center=true
                );

                chamfered_cube_side(
                    293, 293, 20, 16.25, center=true
                );
            }

            translate([320/2, 0, 2.5/2])
            cube([20, 10, 2.5], center=true);

            translate([-320/2, 0, 2.5/2])
            cube([20, 10, 2.5], center=true);

            translate([0, 320/2, 2.5/2])
            cube([10, 20, 2.5], center=true);

            translate([0, -320/2, 2.5/2])
            cube([10, 20, 2.5], center=true);

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([-305/2, -305/2, 2.5/2])
                rotate([0, 0, -45])
                cube([10, 25, 2.5], center=true);
           }

        }

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([510/2 - 85, 510/2 - 85, 0])
            cylinder(d=20, h=20, center=true, $fn=30);
        }

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([510/2 - 80, 0, 0.4])
            cylinder(d=2, h=10, $fn=20);

            rotate([0, 0, i*90])
            translate([510/2 - 80, 510/2 - 140, 0.4])
            cylinder(d=2, h=10, $fn=20);

            rotate([0, 0, i*90])
            translate([510/2 - 80, -510/2 + 140, 0.4])
            cylinder(d=2, h=10, $fn=20);
        }
    }
}