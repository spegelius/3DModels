include <../../Dollo/NEW_long_ties/globals.scad>;
include <../../Dollo/NEW_long_ties/include.scad>;

pitch = 3;
dia_adjustable_inner =
    sqrt(30*30*2) + pitch + 0.5 - 2*slop;
screw_steps = 100;
pylon_dia = dia_adjustable_inner - 4;

echo("Thread inner dia", dia_adjustable_inner);

//fast = true;
fast = false;


//_pylon();

//leg();
leg(130);
//leg_130_dc_1();
//leg_130_dc_2();

//peg();
//peg_slot();


module _pylon(height=200) {
    intersection() {
        difference() {
            cylinder(d=pylon_dia, h=400, $fn=50);

            if (!fast) {
                for (i=[0:15]) {

                    rotate([0, 0, 360/16*i])
                    linear_extrude(
                        height=400,
                        convexity=10,
                        twist=360 * 2,
                        slices=100
                    )
                    translate([pylon_dia/2 + 0.5, 0])
                    circle(d=3, $fn=20);
                }
            }
        }

        cylinder(d=pylon_dia * 2, h=height);
    }
}

module _dove_groove(height) {
    union() {
        dovetail_3d(
            max_width=9.2, min_width=6.2,
            depth=3, height=height
        );

        translate([-9.2/2, 3, 0])
        cube([9.2, 0.3, height]);
    }
}

module _leg_pylon(height=200) {
    difference() {
        union() {
            intersection() {
                render()
                translate([0, 0, 15])
                rotate([180, 0, 0])
                v_screw(
                    h=15,
                    screw_d=dia_adjustable_inner,
                    pitch=pitch,
                    direction=0,
                    steps=screw_steps,
                    chamfer=true
                );

                cylinder(
                    d1=pylon_dia + 30,
                    d2=pylon_dia,
                    h=15,
                    $fn=100
                );
            }

            translate([0, 0, 2])
            _pylon(height=height - 2);
        }

        translate([0, 0, -1])
        cylinder(
            d=pylon_dia - 12, h=height - 6, $fn=80
        );

        _leg_dovetails(height);
    }
}

module _leg_base(height=200) {
    difference() {
        union() {
            intersection() {
                translate([-9, 70/2 - 2, height - 17/2 + 2])
                chamfered_cube(
                    20, 70, 17, 2, center=true
                );

                translate([0, 0, height - 100/2])
                cube([200, 200, 100], center=true);
            }

            intersection() {
                translate([70/2 - 2, -9, height - 17/2 + 2])
                chamfered_cube(
                    70, 20, 17, 2, center=true
                );

                translate([0, 0, height - 100/2])
                cube([200, 200, 100], center=true);
            }

            intersection() {
                translate([76, -19, height])
                rotate([0, -150, 0])
                chamfered_cube_side(22, 20, 170, 2);

                translate([100/2 + 4, 0, height/2])
                cube([100, 48, height], center=true);
            }

            intersection() {
                translate([1, 76, height])
                rotate([0, -150, 90])
                chamfered_cube_side(22, 20, 170, 2);

                translate([0, 100/2 + 4, height/2])
                cube([48, 100, height], center=true);
            }

            intersection() {
                hull() {
                    translate([0, 0, height - 15])
                    chamfered_cylinder(
                        pylon_dia + 3, 17, 2, $fn=90
                    );

                    translate([-17, -17, height - 15])
                    chamfered_cylinder(
                        6, 17, 2, $fn=90
                    );

                }
                cylinder(d=100, h=height);
            }
        }

        // beam forming cuts
        translate([-16.5, -16.5, height - 100])
        cube([50, 50, 100], center=true);

        translate([0, 0, height - 100/2 - 113])
        cube([60, 60, 100], center=true);

        // pylon internal cuts
        translate([0, 0, -1])
        cylinder(
            d=pylon_dia - 5, h=height - 46, $fn=80
        );

        translate([0, 0, -1])
        cylinder(
            d=pylon_dia - 12, h=height - 6, $fn=80
        );

        _leg_dovetails(height);

        translate([50, -9, height - 65 - 5]) {
            cylinder(d=4.3, h=80, $fn=40);
            cylinder(d=8.7, h=65, $fn=40);
        }

        translate([-9, 50, height - 65 - 5]) {
            cylinder(d=4.4, h=80, $fn=40);
            cylinder(d=8.8, h=65, $fn=40);
        }
    }
}

module _leg_support(height=200) {
    // support legs
    translate([10.4, -9, height - 2.9/2])
    cube([64, 1, 2.9], center=true);

    translate([66.6, -9, height - 2.9/2])
    cube([18, 1, 2.9], center=true);

    translate([-9, 10.4, height - 2.9/2])
    cube([1, 64, 2.9], center=true);

    translate([-9, 66.6, height - 2.9/2])
    cube([1, 18, 2.9], center=true);

    // brim
    translate([-12, -12, height - 0.2])
    cylinder(d=30, h=0.2);

    translate([70, -10, height - 0.2])
    cylinder(d=24, h=0.2);

    translate([-10, 70, height - 0.2])
    cylinder(d=24, h=0.2);
}

module _leg_dovetails(height) {
    translate([-9, -23, height])
    rotate([-90, 0, 0])
    _dove_groove(66);

    translate([-9, 57, height])
    rotate([-90, 0, 0])
    _dove_groove(64);

    translate([-23, -9, height])
    rotate([-90, 0, -90])
    _dove_groove(66);

    translate([57, -9, height])
    rotate([-90, 0, -90])
    _dove_groove(64);
}

module leg(height=200) {

    translate([0, 0, height])
    rotate([180, 0, 0])
    difference() {
        union() {
            _leg_pylon(height=height);
            _leg_base(height=height);
            _leg_support(height=height);
        }
    }
}

module leg_130_dc_1() {
    color("black")
    render()
    translate([0, 0, 130])
    rotate([180, 0, 0])
    difference() {
        _leg_pylon(height=130);

        _leg_base(height=130);
    }
}

module leg_130_dc_2() {
    color("white")
    translate([0, 0, 130])
    rotate([180, 0, 0])
    union() {
        _leg_base(height=130);

        _leg_support(height=130);
    }
}

module peg() {
    union() {
        dovetail_3d(
            max_width=9, min_width=6,
            depth=3, height=15
        );

        translate([0, -4/2, 15/2])
        cube([6, 4, 15], center=true);
    }
}

module peg_slot() {
    union() {
        peg();

        translate([0, -2 - 2/2, 15/2])
        cube([10, 2, 15], center=true);
    }
}
