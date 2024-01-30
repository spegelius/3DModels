use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../Watercooling/common.scad>;

res = 100;
res_d = 10;
h_inner = res + 5.7;
h_outer = h_inner + 4;
h_lip = h_outer + 5;


//debug();
//debug_radiator_mount();

reservoir_support_beam(230);
//reservoir_holder();

//radiator_mount(230);
//radiator_mount(230, hole=33);


module debug() {
    echo(h_outer, h_inner);

    render()
    intersection() {
        union() {
            translate([0, h_outer/2 + 6, 0])
            rotate([90, 0, 0])
            reservoir_support_beam(230);

            translate([0, -h_outer/2 - 6, 0])
            rotate([90, 0, 180])
            reservoir_support_beam(230);
        }

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }

    translate([0, 0, 2.1])
    reservoir_holder();

    %rounded_cube_side(
        res, res, 50, res_d, center=true, $fn=40
    );
}

module debug_radiator_mount() {
    mock_radiator_360();

    translate([0, -202.5, 19])
    rotate([-90, 0, 0])
    radiator_mount(230);

    translate([0, 202.5, 19])
    rotate([-90, 0, 180])
    radiator_mount(230, hole=33);
}

module reservoir_support_beam(width) {
    w = width - 60;

    difference() {
        intersection() {
            union() {
                translate([-w/2, 0, 20/2])
                rotate([-90, 0, 0])
                long_bow_tie_half(20);

                translate([w/2, 0, 20/2])
                rotate([-90, 0, 0])
                long_bow_tie_half(20);

                translate([0, 15/2, 20/2])
                cube([
                    w - 0.4,
                    15, 20
                ], center=true);

            }
            translate([0, 0, 20/2])
            rotate([-90, 0, 0])
            cylinder(
                d=width - 50.5, h=20, $fn=100
            );
            
        }
        // chamfers
        translate([-w/2, 31, 0])
        rotate([0, 0, 45])
        cube([40, 40, 50], center=true);

        translate([w/2, 31, 0])
        rotate([0, 0, 45])
        cube([40, 40, 50], center=true);

        translate([0, 20/2 + 2, h_outer/2 + 6])
        rotate([-90, 0, 0])
        rounded_cube_side(
            h_outer + 0.4, h_outer + 0.4,
            20, h_outer - res + res_d,
            center=true, $fn=30
        );

        translate([h_outer + 3, 20/2 + 6, h_outer/2 + 6])
        rotate([-90, 0, 0])
        rounded_cube_side(
            h_outer + 0.4, h_outer + 0.4,
            20, h_outer + 0.4 - res + res_d,
            center=true, $fn=30
        );

        translate([-h_outer - 3, 20/2 + 6, h_outer/2 + 6])
        rotate([-90, 0, 0])
        rounded_cube_side(
            h_outer + 0.4, h_outer + 0.4,
            20, h_outer + 0.4 - res + res_d,
            center=true, $fn=30
        );

        translate([0, 2.3/2 + 2, h_outer/2 + 6])
        rotate([-90, 0, 0])
        rounded_cube_side(
            h_lip + 0.4, h_lip + 0.4,
            2.3, h_lip +0.4 - res + res_d,
            center=true, $fn=30
        );
    }
}

module reservoir_holder() {
    
    difference() {
        // main form
        union() {
            translate([0, 0, 2/2])
            rounded_cube_side(
                h_lip, h_lip, 2,
                h_lip - res + res_d,
                center=true, $fn=30
            );

            translate([0, 0, 15/2])
            rounded_cube_side(
                h_outer, h_outer, 15,
                h_outer - res + res_d,
                center=true, $fn=30
            );
        }

        // reservoir cutout (tapering)
        translate([0, 0, 1.6])
        hull() {
            translate([0, 0, 1/2])
            rounded_cube_side(
                h_inner, h_inner, 1,
                h_inner - res + res_d,
                center=true, $fn=30
            );

            translate([0, 0, 15])
            rounded_cube_side(
                h_inner + 1, h_inner + 1, 1,
                h_inner + 1 - res + res_d,
                center=true, $fn=30
            );
        }
    }
}

module radiator_mount(width, hole=25) {
    w = width - 60;

    difference() {
        intersection() {
            union() {
                translate([-w/2, 0, 30/2])
                rotate([-90, 0, 0])
                long_bow_tie_half(30);

                translate([w/2, 0, 30/2])
                rotate([-90, 0, 0])
                long_bow_tie_half(30);

                hull() {
                    translate([0, 5/2, 30/2])
                    cube([
                        w - 8,
                        5, 30
                    ], center=true);

                    translate([0, 2/2, 30/2])
                    cube([
                        w - 0.4,
                        2, 30
                    ], center=true);
                }

                hull() {
                    translate([0, 41/2, 5/2])
                    cube(
                        [135, 41, 5],
                        center=true
                    );

                    translate([0, 3/2, 5/2])
                    cube(
                        [w - 1, 3, 5],
                        center=true
                    );
               }

                translate([0, 41.5/2, (hole + 5)/2])
                cube(
                    [135, 41.5, hole + 5],
                    center=true
                );
            }
            translate([0, 0, 30/2])
            rotate([-90, 0, 0])
            cylinder(
                d=width - 50.5, h=50, $fn=100
            );
        }

        translate([0, 41.5/2 - 2, 50/2 + 2])
        cube([131.5, 41.5, 50], center=true);

        difference() {
            union() {
                translate([0, 0, 50/2 + 7])
                rounded_cube(
                    97, 100, 50, 7,
                    center=true, $fn=30
                );

                translate([0, 0, 40/3 + hole])
                cube([130, 100, 40], center=true);
            }

            translate([-60/2 - 97/2, 0, 0])
            rounded_cube(
                60, 100, (hole + 5) * 2,
                7, center=true, $fn=30
            );

            translate([60/2 + 97/2, 0, 0])
            rounded_cube(
                60, 100, (hole + 5) * 2,
                7, center=true, $fn=30
            );

        }

        translate([-105/2, 0, hole])
        rotate([-90, 0, 0])
        cylinder(d=4, h=50, $fn=30);

        translate([105/2, 0, hole])
        rotate([-90, 0, 0])
        cylinder(d=4, h=50, $fn=30);
    }
    
}