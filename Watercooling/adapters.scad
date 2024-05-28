use <../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;


g3_8_d = 16.6;
g1_4_d = 13.3;

thread_slop = 0.4;


//debug_fitting_adapter_Eheim();
//debug_g1_2_nut();
//debug_adapter_g1_2_12mm();

//adapter_g1_2_g1_4();
//adapter_g1_2_g1_4(threads=false);
adapter_g1_2_12mm();

//fitting_adapter_Eheim();

//g1_2_flange_nut();
//g1_2_flange_nut(12);
//g1_2_nut();


module debug_fitting_adapter_Eheim() {
    intersection() {
        fitting_adapter_Eheim();

        translate([0, 30/2, 0])
        cube([30, 30, 60], center=true);
    }
}

module debug_g1_2_nut() {
    intersection() {
        g1_2_nut();

        translate([0, 30/2, 0])
        cube([30, 30, 60], center=true);
    }
}

module debug_adapter_g1_2_12mm() {

    intersection() {
        adapter_g1_2_g1_4();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

    translate([0, 0, 12])
    intersection() {
        rotate([0, 0, -80])
        g1_2_flange_nut(12);

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);

    }

    translate([0, 0, 37.1])
    rotate([180, 0, 60])
    adapter_g1_2_12mm();
    
}

module adapter_g1_2_g1_4(threads=true) {

    // G1/2 outer, G1/4 inner
    difference() {
        union() {
            if (threads) {
                translate([0, 0, 5])
                g1_2_thread(
                    14.5, slop=0
                );
            } else {
                translate([0, 0, 5])
                cylinder(
                    d=20.9,
                    h=14.5,
                    $fn=40
                );
            }

            hexagon(22, height=5.7);
        }

        if (threads) {
            translate([0, 0, -1])
            g1_4_thread(
                12, slop=thread_slop
            );
        } else {
            translate([0, 0, -1])
            cylinder(
                d=13.5,
                h=12,
                $fn=40
            );
        }

        translate([0, 0, 10.9])
        cylinder(d=11.5, h=20, $fn=60);

        // chamfer
        translate([0, 0, -0.1])
        cylinder(d1=14.2, d2=12, h=1.1, $fn=40);
    }
}

module adapter_g1_2_12mm() {
    difference() {
        union() {
            //tube(tube1_outer_dia, 30, 1, $fn=80);
            cylinder(
                d=tube1_outer_dia, h=15, $fn=60
            );

            cylinder(
                d=11.3, h=33.2, $fn=60
            );

            translate([0, 0, 5])
            donut(11, 2, $fn=60);

            intersection() {
                translate([0, 0, 10])
                g1_2_thread(
                    13, slop=0
                );

                translate([0, 0, 10])
                cylinder(d1=12, d2=27, h=7.5, $fn=60);
            }
        }

        cylinder(d=9, h=100, center=true, $fn=60);
    }
}

module g1_2_flange_nut(h=3, threads=true) {
    difference() {
        union() {
            hexagon(24, height=h);

            cylinder(d=30, h=1.4, $fn=40);
        }

        translate([0, 0, -0.1])
        g1_2_thread(
            h + 2, slop=thread_slop
        );
    }
}

module g1_2_nut(h=3, threads=true) {
    difference() {
        hexagon(27, height=h);

        translate([0, 0, -0.1])
        g1_2_thread(
            h + 2, slop=thread_slop + 0.15
        );
    }
}

module fitting_adapter_Eheim() {
    // G3/8 outer, G1/4 inner
    difference() {
        union() {
            cylinder(d=17.5, h=6, $fn=50);

            translate([0, 0, 5])
            g3_8_thread(
                10, slop=-thread_slop
            );

            cylinder(d=21, h=4, $fn=6);
        }

        intersection() {
            g1_4_thread(
                6, slop=thread_slop
            );

            cylinder(
                d1=11 + 2*6, d2=11,
                h=6, $fn=60
            );
        }
        cylinder(d=11, h=20, $fn=60);
    }
}
