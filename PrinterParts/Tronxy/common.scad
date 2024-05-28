use <../../Dollo/New_long_ties/include.scad>;

frame_x = 530;
frame_y = 500;
frame_z = 570;
bed_x = 330.1;
bed_y = 330.1;

z_plate_len = 330.8;

//mock_idler();
//mock_idler_24();
//roller();
//2020_vslot();
//2040_vslot();


module mock_idler() {
    d = 18;
    h = 11;
    $fn = 40;

    difference() {
        union() {
            cylinder(d=d + 3, h=1);

            cylinder(d=d, h=h);
            translate([0, 0, h - 1])
            cylinder(d=d + 3, h=1);
        }
        cylinder(d=5, h=h * 3, center=true);
    }
}

module mock_idler_24() {
    d = 24;
    h = 11;
    $fn = 40;

    difference() {
        union() {
            cylinder(d=d + 3, h=1);

            cylinder(d=d, h=h);
            translate([0, 0, h - 1])
            cylinder(d=d + 3, h=1);
        }
        cylinder(d=5, h=h * 3, center=true);
    }
}

module roller() {
    color("DarkSlateGray")
    render()
    difference() {
        hull() {
            cylinder(d=24, h=6, center=true, $fn=40);
            cylinder(d=20, h=11, center=true, $fn=40);
        }

        cylinder(d=5, h=15, center=true, $fn=40);
    }
}

module 2020_vslot(h=100, slots=4) {
    iw = 20 - 2*(4.3 + 1.8);
    iw2 = iw - sqrt((1.5 * 1.5)/2) * 2;

    ih = 4.3 - (11 - iw2)/2;
    //echo(iw, iw2, ih);

    difference() {
        rounded_cube_side(
            20, 20, h, .8, center=true, $fn=15
        );

        cylinder(d=4.2, h=h*2, center=true, $fn=30);
        for (i=[1:slots]) {
            rotate([0, 0, i * 90])
            translate([0, 20/2 + 10/2, 0])
            hull() {
                cube([
                    6.2, 10 + (9.55 - 6.2), h * 2
                ], center=true);

                cube([9.55, 10, h*2], center=true);
            }

            rotate([0, 0, i * 90])
            translate([0, 20/2, 0])
            cube([6.2, 5, h*2], center=true);

            rotate([0, 0, i * 90])
            hull() {
                translate([0, 20/2 - 1.8 - ih/2, 0])
                cube([11, ih, h*2], center=true);

                translate([0, iw/2 + 0.1/2, 0])
                cube([iw2, 0.1, h*2], center=true);
            }
        }
    }
}

module 2040_vslot(h=100) {
    union() {
        translate([-10, 0, 0])
        rotate([0, 0, -90])
        2020_vslot(h=h, slots=3);

        translate([10, 0, 0])
        rotate([0, 0, 90])
        2020_vslot(h=h, slots=3);

        cube([3, 20, h], center=true);
    }
}