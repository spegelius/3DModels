include <../../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;

w = 380;
d = z_plate_len + 10;
h = 16;

bed_nut_d = 10;
chamfer = 4;

ear_positions = [
    [-w/2 + 9, z_plate_len/2 - 10/2],
    [w/2 - 9, z_plate_len/2 - 10/2],
    [-w/2 + 9, -z_plate_len/2 + 10/2],
    [w/2 - 9, -z_plate_len/2 + 10/2],
    [-w/6, z_plate_len/2 - 10/2],
    [w/6, z_plate_len/2 - 10/2],
    [-w/6, -z_plate_len/2 + 10/2],
    [w/6, -z_plate_len/2 + 10/2]
];


//debug_X5S_bed_carriage();

X5S_bed_carriage();
//X5S_bed_carriage_beam_cap();
//X5S_bed_carriage_drill();


module debug_X5S_bed_carriage() {
    render()
    X5S_bed_carriage();

    render()
    translate([0, -d/2, h])
    rotate([0, 180, 0])
    X5S_bed_carriage_beam_cap();

    render()
    rotate([0, 0, 180])
    translate([0, -d/2, h])
    rotate([0, 180, 0])
    X5S_bed_carriage_beam_cap();
}

module _X5S_bed_carriage_base(jig=false, ears=true) {

    module _ear() {
        hull() {
            translate([0, 10, 0])
            cylinder(d=11, h=h, $fn=6);

            translate([0, -10, 0])
            cylinder(d=11, h=h, $fn=6);
        }
    }

    module _bed_mount_hole() {
        if (jig) {
            cylinder(
                d=1, h=40, center=true, $fn=20
            );
        } else {
            cylinder(
                d1=bed_nut_d + 2,
                d2=bed_nut_d,
                h=h + 3, $fn=40
            );
        }
    }

    module _main_body() {
        difference() {
            intersection() {
                translate([0, 0, h/2])
                chamfered_cube(
                    w, d + 6, h,
                    chamfer, center=true
                );

                translate([0, 0, h/2])
                cube(
                    [w, d, h],
                    center=true
                );
            }
 
            intersection() {
                translate([-235, -450, 0])
                for(j = [0:39]) {
                    translate([0, j*45])
                    rotate([0, 0, -60])
                    for (i = [0:39]) {
                        translate([0, i*45])
                        cylinder(
                            d=40, h=60,
                            center=true, $fn=6
                        );
                    }
                }
                rounded_cube(
                    w - 45, d - 65, 60,
                    15, center=true, $fn=30
                );
            }
        }
    }

    difference() {

        if (ears) {
            _main_body();

            for (i = ear_positions) {
                translate([i[0], i[1], 0])
                _ear();
            }
        }

        // bed beams
        translate([
            0, z_plate_len/2 - 10/2, 10/2 + 4
        ])
        cube([500, 10.2, 10], center=true);

        translate([
            0, -z_plate_len/2 + 10/2, 10/2 + 4
        ])
        cube([500, 10.2, 10], center=true);

        // bed mount holes
        translate([0, -z_plate_len/2 + 10/2, -1])
        _bed_mount_hole();

        translate([
            bed_x/2 - 5, -z_plate_len/2 + 10/2, -1
        ])
        _bed_mount_hole();

        translate([
            -bed_x/2 + 5, -z_plate_len/2 + 10/2, -1
        ])
        _bed_mount_hole();

        translate([0, z_plate_len/2 - 10/2, -1])
        _bed_mount_hole();

        translate([
            bed_x/2 - 5, z_plate_len/2 - 10/2, -1
        ])
        _bed_mount_hole();

        translate([
            -bed_x/2 + 5, z_plate_len/2 - 10/2, -1
        ])
        _bed_mount_hole();
    }
}

module X5S_bed_carriage(cap_cuts=true) {
    module _ear_holes() {
        translate([0, 10, -0.1])
        M3_nut_tapering(
            4.1, cone=false, bridging=true
        );

        translate([0, 10, 0])
        cylinder(d=3.2, h=50, center=true, $fn=20);

        translate([0, 10, h - 2.7])
        cylinder(d2=7.2, d1=3.2, h=2.8, $fn=20);

        translate([0, -10, -0.1])
        M3_nut_tapering(
            4.1, cone=false, bridging=true
        );

        translate([0, -10, 0])
        cylinder(d=3.2, h=50, center=true, $fn=20);

        translate([0, -10, h - 2.7])
        cylinder(d2=7.2, d1=3.2, h=2.8, $fn=20);
    }

    difference() {
        _X5S_bed_carriage_base(jig=false);

        for (i = ear_positions) {
            translate([i[0], i[1], 0])
            _ear_holes();
        }

        if (cap_cuts) {
            translate([0, -d/2, h])
            cube([400, 50, 8.4], center=true);

            translate([0, d/2, h])
            cube([400, 50, 8.4], center=true);
        }
    }
}

module X5S_bed_carriage_beam_cap() {
    translate([0, d/2, h])
    rotate([0, 180, 0])
    intersection() {
        X5S_bed_carriage(cap_cuts=false);

        translate([0, -d/2, h])
        cube([400, 49.6, 8], center=true);
    }
}

module X5S_bed_carriage_drill(jig=false) {

    module _beam_mount_hole() {
        if (jig) {
            cylinder(
                d=1, h=50, center=true, $fn=20
            );
            
        } else {
            union() {
                cylinder(d1=7.2, d2=3.2, h=2.8, $fn=20);
                cylinder(d=3.2, h=50, $fn=20);
            }
        }
    }

    difference() {
    
        _X5S_bed_carriage_base(jig=jig);

        // beam side holes
        translate([-w/2 + 16, -d/2 - 0.2, h - 10/2])
        rotate([-90, 0, 0])
        _beam_mount_hole();

        translate([w/2 - 16, -d/2 - 0.2, h - 10/2])
        rotate([-90, 0, 0])
        _beam_mount_hole();

        translate([-w/6, -d/2 - 0.2, h - 10/2])
        rotate([-90, 0, 0])
        _beam_mount_hole();

        translate([w/6, -d/2 - 0.2, h - 10/2])
        rotate([-90, 0, 0])
        _beam_mount_hole();

        translate([-w/2 + 16, d/2 + 0.2, h - 10/2])
        rotate([90, 0, 0])
        _beam_mount_hole();

        translate([w/2 - 16, d/2 + 0.2, h - 10/2])
        rotate([90, 0, 0])
        _beam_mount_hole();

        translate([-w/6, d/2 + 0.2, h - 10/2])
        rotate([90, 0, 0])
        _beam_mount_hole();

        translate([w/6, d/2 + 0.2, h - 10/2])
        rotate([90, 0, 0])
        _beam_mount_hole();

        // beam bottom holes
        translate([-w/2 + 9, -z_plate_len/2 + 10/2, -0.2])
        _beam_mount_hole();

        translate([w/2 - 9, -z_plate_len/2 + 10/2, -0.2])
        _beam_mount_hole();

        translate([-w/6 + 7, -z_plate_len/2 + 10/2, -0.2])
        _beam_mount_hole();

        translate([w/6 - 7, -z_plate_len/2 + 10/2, -0.2])
        _beam_mount_hole();

        translate([-w/2 + 9, z_plate_len/2 - 10/2, -0.2])
        _beam_mount_hole();

        translate([w/2 - 9, z_plate_len/2 - 10/2, -0.2])
        _beam_mount_hole();

        translate([-w/6 + 7, z_plate_len/2 - 10/2, -0.2])
        _beam_mount_hole();

        translate([w/6 - 7, z_plate_len/2 - 10/2, -0.2])
        _beam_mount_hole();

        // beam side mount nut holes
        translate([-w/2 + 16, -d/2 + 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([w/2 - 16, -d/2 + 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([-w/6, -d/2 + 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([w/6, -d/2 + 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([-w/2 + 16, d/2 - 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([w/2 - 16, d/2 - 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([-w/6, d/2 - 25, h/2 + 8])
        cube([6, 2, h], center=true);

        translate([w/6, d/2 - 25, h/2 + 8])
        cube([6, 2, h], center=true);
    }
}