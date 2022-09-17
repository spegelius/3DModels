use <../Dollo/NEW_long_ties/include.scad>;


//clothes_drier_part()
clothes_drier_t_part();


module debug_part() {
    intersection() {
        clothes_drier_part();
        //cube([20, 20, 50]);
    }
}


module clothes_drier_part() {
    difference() {
        hull() {
            cylinder(d=20.5, h=22, $fn=50);

            intersection() {
                cylinder(d=20.5, h=32, $fn=50);

                translate([0, 0, 22 + 3])
                rotate([90, 0, 0])
                cylinder(
                    d=9, h=22, center=true, $fn=30
                );
            }
        }

        cylinder(d=16.25, h=40.8, center=true, $fn=50);

        translate([0, 0, 24])
        rotate([90, 0, 0])
        cylinder(d=4.3, h=30, center=true, $fn=30);
    }

    // support
    tube(9, 20.2, 0.5, $fn=30);
}


module clothes_drier_t_part() {
    difference() {
        union() {
            translate([0, 0, 21/2])
            hull() {
                cylinder(d=21, h=50, $fn=50);

                translate([0, 0, 50/2])
                cube([25, 7, 50], center=true);
            }

            translate([0, 0, 21/2])
            rotate([0, 90, 0])
            hull() {
                cylinder(d=21, h=60, center=true, $fn=50);

                translate([-1, 0, 0])
                cube([23, 7, 60], center=true);
            }
        }

        translate([0, 0, 21/2])
        cylinder(d=16.7, h=70, $fn=50);

        translate([0, 0, 21/2])
        rotate([0, 90, 0])
        cylinder(d=16.7, h=70, center=true, $fn=50);

        translate([22, 0, -1])
        cylinder(d=3.3, h=10, $fn=20);

        translate([-22, 0, -1])
        cylinder(d=3.3, h=10, $fn=20);

        translate([22, 0, (21 - 16.7)/2 + 16.8])
        cylinder(d=3.3, h=10, $fn=20);

        translate([-22, 0, (21 - 16.7)/2 + 16.8])
        cylinder(d=3.3, h=10, $fn=20);

        translate([22, 0, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=20);

        translate([-22, 0, -0.1])
        cylinder(d1=6.7, d2=3.3, h=2, $fn=20);

        translate([22, 0, 21])
        M3_nut();

        translate([-22, 0, 21])
        M3_nut();

        translate([0, 0, 30])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=40, center=true, $fn=20);

        translate([0, 0, 53])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=40, center=true, $fn=20);

        translate([-25/2 - 0.1, 0, 30])
        rotate([0, 90, 0])
        cylinder(d1=7.2, d2=3.3, h=3, $fn=20);

        translate([-25/2 - 0.1, 0, 53])
        rotate([0, 90, 0])
        cylinder(d1=7.2, d2=3.3, h=3, $fn=20);

        translate([21/2, 0, 30])
        rotate([0, 90, 0])
        M3_nut();

        translate([21/2, 0, 53])
        rotate([0, 90, 0])
        M3_nut();

    }
}