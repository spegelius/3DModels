use <../Dollo/New_long_ties/include.scad>;
use <../lib/bearings.scad>;
use <../_downloaded/Parametric_pulley/Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;

//gt2_idler_625zz();
//gt2_idler_625zz_retainer();
//gt2_idler_625zz_spacer();

//623zz_idler_pulley_13_8();
//623zz_idler_pulley_13_13();

//623zz_idler_pulley_tooth();

//debug_gt2_idler_625zz();
//debug_623zz_idler_pulley_13_13();
debug_623zz_idler_pulley_tooth();


module debug_gt2_idler_625zz() {
    intersection() {
        rotate([0, 0, 22])
        gt2_idler_625zz();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

    intersection() {
        translate([0, 0, 11.01])
        rotate([180, 0, 40])
        gt2_idler_625zz_retainer();

        translate([0, 50/2, 0])
        cube([50, 50, 50], center=true);
    }

    translate([0, 0, 5.4])
    gt2_idler_625zz_spacer();

    %translate([0, 0, 0.4])
    625zz();

    %translate([0, 0, 11 - 5.4])
    625zz();

    translate([30, 0, 0])
    gt2_idler_625zz_retainer();
}


module debug_623zz_idler_pulley_13_13() {
    intersection() {
        623zz_idler_pulley_13_13();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    %623zz();

    translate([0, 0, 13/2 - 4/2])
    %623zz();

    translate([0, 0, 13 - 4])
    %623zz();
}

module debug_623zz_idler_pulley_tooth() {
    intersection() {
        623zz_idler_pulley_tooth();

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }

    %623zz();

    translate([0, 0, 13.8/2 - 4/2])
    %623zz();    

    translate([0, 0, 13.8 - 4])
    %623zz();    
}

module gt2_idler_625zz() {

    d = 24;
    h = 11;

    union() {
        difference() {
            union() {
                // edge
                hull() {
                    cylinder(d=d + 4, h=0.8, $fn=100);
                    cylinder(d=d + 2.8, h=1.4, $fn=100);
                }

                // main idler
                cylinder(d=d, h=h - 1.4, $fn=100);

                // retainer locking part
                translate([0, 0, h - 1.4])
                cylinder(
                    d1=d - 4, d2=d - 2.2,
                    h=1, $fn=100
                );
            }
            translate([0, 0, 0.4])
            cylinder(d=16 + 0.2, h=h*3, $fn=100);

            translate([0, 0, -0.4])
            cylinder(d=14.2, h=2, $fn=100);

            for(i = [0:3]) {
                rotate([0, 0, 360/4*i])
                translate([
                    (d - 5)/2 + 2/2, 0,
                    h - 1.4 + 2/2
                ])
                cube([2, 6, 2], center=true);
            }
        }
        for(i = [0:6]) {
            rotate([0, 0, 360/7*i])
            translate([17/2, 0, 0])
            cylinder(d=1.2, h=h - 0.4, $fn=20);
        }

//        #translate([0, 0, h/2])
//        cube_donut(17, 2);
    }
}

module gt2_idler_625zz_retainer() {
    d = 24;
    h = 11;

    union() {
        difference() {
            // edge
            hull() {
                cylinder(d=d + 4, h=0.8, $fn=100);
                cylinder(d=d + 2.8, h=1.4, $fn=100);
            }

            translate([0, 0, 0.4])
            cylinder(d=d - 1.8, h=2, $fn=100);

            translate([0, 0, -0.4])
            cylinder(d=14.2, h=2, $fn=100);

            for (i = [0:3]) {
                rotate([0, 0, i*90 + 45])
                translate([9, 0, 0])
                cylinder(d=2, h=2, center=true, $fn=30);
            }
        }

        difference() {
            for (i = [0:3]) {
                rotate([0, 0, i*90 + 45])
                translate([
                    (d - 4.8)/2 + 2/2, 0, 1/2 + 0.4
                ])
                cube([2, 5.5, 1], center=true);
            }

            translate([0, 0, 0.4])
            cylinder(
                d2=d - 3.8, d1=d - 2, h=1, $fn=100
            );

            translate([0, 0, 1.2])
            cylinder(d=20.2, h=1.2, $fn=100);
        }
    }
}

module gt2_idler_625zz_spacer() {
   difference() {
       cylinder(d=15.9, h=0.2, $fn=50);
       cylinder(d=10, h=2, center=true, $fn=50);
   }
}

module 623zz_idler_pulley_13_8() {
    difference() {
        union() {
            cylinder(d=13, h=8, $fn=60);
            cylinder(d1=15.5, d2=13, h=1.25, $fn=60);

            translate([0, 0, 8 - 1.25])
            cylinder(d2=15.5, d1=13, h=1.25, $fn=60);
        }
        cylinder(d=10.1, h=50, center=true, $fn=60);
    }
}

module 623zz_idler_pulley_13_13() {
    difference() {
        union() {
            cylinder(d=13, h=13, $fn=60);
            cylinder(d1=15.5, d2=13, h=1.25, $fn=60);

            translate([0, 0, 13 - 1.25])
            cylinder(d2=15.5, d1=13, h=1.25, $fn=60);
        }
        cylinder(d=10.1, h=50, center=true, $fn=60);
    }
}

module 623zz_idler_pulley_tooth() {

    //teeth = 24;
    //profile = 12;
    //motor_shaft = 5.1;
    //motor_shaft_flat = 1;
    //motor_shaft_flat_offset = 0;
    //m3_dia = 0;
    //m3_nut_hex = 0;
    //m3_nut_flats = 0;
    //m3_nut_depth = 2;

    //retainer = 1;
    //retainer_ht = 1.5;
    //idler = 1;
    //idler_ht = 1.5;

    //pulley_t_ht = 10.8;
    //pulley_b_ht = 7.5;
    //pulley_b_dia = 0;
    //no_of_nuts = 2;
    //nut_angle = 180;
    //nut_shaft_distance = 1.2;
    //additional_tooth_width = 0.3;
    //additional_tooth_depth = 0.4;

    difference() {
        do_pulley();

        cylinder(d=10.1, h=50, center=true, $fn=60);
    }
}