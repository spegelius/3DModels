use <../Dollo/NEW_long_ties/include.scad>;
use <../PCParts/common.scad>;


//debug();
//debug_2();
//debug_tykkilepy();

//cooler_stand();
//cooler_stand_right();
fan_mount_arm();
//fan_mount_92_80();
//fan_mount_80_80();
//fan_mount_140_120();
//fan_mount_140();
//fan_mount_120();

//tykkilepy_back_mount();
//tykkilepy_front_mount();

module cooler_stand() {

    module _main() {
        difference() {
            hull() {
                translate([260/2 - 10, 20/2, 0])
                cylinder(d=20, h=15, center=true, $fn=30);

                translate([-260/2 + 30, 20/2, 0])
                cylinder(d=20, h=15, center=true, $fn=30);

                translate([-270/2 + 10, 109, 0])
                cylinder(d=20, h=15, center=true, $fn=30);
            }

            hull() {
                translate([260/2 - 20, 5/2 + 10, 0])
                cylinder(d=5, h=25, center=true, $fn=20);
             
                translate([10 - 5/2, 5/2 + 10, 0])
                cylinder(d=5, h=25, center=true, $fn=20);

                translate([10 - 5/2, 44 + 10, 0])
                cylinder(d=5, h=25, center=true, $fn=20);   
            }

            hull() {

                translate([-260/2 + 32.5, 5/2 + 10, 0])
                cylinder(d=5, h=25, center=true, $fn=20);
             
                translate([-270/2 + 12.5, 107, 0])
                cylinder(d=5, h=25, center=true, $fn=20);

                translate([-10 + 5/2, 5/2 + 10, 0])
                cylinder(d=5, h=25, center=true, $fn=20);

                translate([-10 + 5/2, 60, 0])
                cylinder(d=5, h=25, center=true, $fn=20);   
            }
        }
    }

    difference() {
        union() {
            _main();

            hull() {
                translate([260/2 - 3, 20/2, -5/2])
                cylinder(d=8, h=10, center=true, $fn=30);

                translate([260/2 + 5.5, 29, -5/2])
                cylinder(d=8, h=10, center=true, $fn=30);
            }
            translate([260/2 - 10, 20/2, 0])
            cylinder(d=20, h=15, center=true, $fn=30);

            translate([-260/2 + 30, 20/2, 0])
            cylinder(d=20, h=15, center=true, $fn=30);

            translate([-270/2 + 10, 109, 0])
            cylinder(d=20, h=15, center=true, $fn=30);
        }
        translate([260/2 - 10, 20/2, 0])
        cylinder(d=8.4, h=25, center=true, $fn=30);

        translate([-260/2 + 30, 20/2, 0])
        cylinder(d=8.4, h=25, center=true, $fn=30);

        translate([-270/2 + 10, 109, 0])
        cylinder(d=8.4, h=25, center=true, $fn=30);

        translate([260/2 - 10, 20/2, 10])
        cylinder(d1=20.1, d2=30, h=15, center=true, $fn=30);

        translate([-260/2 + 30, 20/2, 10])
        cylinder(d1=20.1, d2=30, h=15, center=true, $fn=30);

        translate([-270/2 + 10, 109, 10])
        cylinder(d1=20.1, d2=30, h=15, center=true, $fn=30);
    }
}

module cooler_stand_right() {
    mirror([1, 0, 0])
    cooler_stand();
}

module fan_mount_arm() {
    difference() {
        union() {
            cylinder(d=13, h=10, $fn=30);

            translate([0, 102.2, 0])
            cylinder(d=13, h=10, $fn=30);

            hull() {
                cylinder(d=8, h=10, $fn=30);

                translate([0, 102.2, 0])
                cylinder(d=8, h=10, $fn=30);
            }

            hull() {
                cylinder(d=8, h=10, $fn=30);

                translate([-55, 20, 0])
                cylinder(d=8, h=10, $fn=30);
            }

            hull() {
                translate([0, 45, 0])
                cylinder(d=8, h=10, $fn=30);

                translate([-55, 20, 0])
                cylinder(d=8, h=10, $fn=30);
            }

        }

        cylinder(d=8, h=30, center=true, $fn=30);

        translate([0, 102.2, 0])
        cylinder(d=8, h=30, center=true, $fn=30);

        #translate([-50, 25, 10/2])
        rotate([90, 0, 25])
        cylinder(d=2.8, h=60, center=true, $fn=20);

        #translate([-15, 40, 10/2])
        rotate([90, 0, 25])
        cylinder(d=2.8, h=40, center=true, $fn=20);

        translate([0, 102.2 + 8/2, 0])
        cube([6, 5, 30], center=true);

        translate([8/2, 0, 0])
        cube([5, 6, 30], center=true);

    }
}

module fan_mount_92_80() {
    difference() {
        translate([0, 0, 10/2])
        union() {
            translate([40/2 - 0.01, 0, 0])
            cube([40, 97, 10], center=true);

            translate([-40/2 + 0.01, 0, 0])
            cube([40, 85, 10], center=true);
        }

        translate([92.5/2 + 16.7, 0, 20/2 + 2])
        cube([92.5, 92.5, 20], center=true);

        translate([-80.5/2 - 16.7, 0, 20/2 + 2])
        cube([80.5, 80.5, 20], center=true);

        translate([92.5/2 + 16.7, 0, -1])
        cylinder(d1=95, d2=91, h=4, $fn=80);

        translate([-80.5/2 - 16.7, 0, -1])
        cylinder(d1=83, d2=79, h=4, $fn=80);

        translate([92.5/2 + 16.7, 0, -1]) {
            translate([-82.5/2, 82.5/2, 0])
            cylinder(d=5.3, h=10, $fn=30);

            translate([-82.5/2, -82.5/2, 0])
            cylinder(d=5.3, h=10, $fn=30);
        }

        translate([-80.5/2 - 16.7, 0, -1]) {
            translate([72/2, 72/2, 0])
            cylinder(d=5.3, h=10, $fn=30);

            translate([72/2, -72/2, 0])
            cylinder(d=5.3, h=10, $fn=30);
        }

        translate([0, -4, 20/2 + 2])
        cube([30, 72, 20], center=true);

        translate([0, 20.5, 0])
        cylinder(d=3.6, h=50, center=true, $fn=20);

        translate([0, -17.5, 0])
        cylinder(d=3.6, h=50, center=true, $fn=20);

        translate([0, 42, 0])
        rotate([-25, 0, 0])
        cube([11, 17, 40], center=true);

    }
}

module fan_mount_140_120(gap=60) {
    offset_y_140 = -23.8;
    offset_x_140 = gap/2;

    offset_y_120 = -13.8;
    offset_x_120 = gap/2;
    
    difference() {
        translate([0, 0, 10/2])
        union() {
            translate([(gap/2 + 20)/2 - 0.01, offset_y_140, 0])
            cube([(gap/2 + 20), 145, 10], center=true);

            translate([-(gap/2 + 20)/2 + 0.01, offset_y_120, 0])
            cube([(gap/2 + 20), 125, 10], center=true);
        }

        translate([140.5/2 + offset_x_140, offset_y_140, 20/2 + 2])
        cube([140.5, 140.5, 20], center=true);

        translate([-120.5/2 - offset_x_120, offset_y_120, 20/2 + 2])
        cube([120.5, 120.5, 20], center=true);

        translate([140.5/2 + offset_x_140, offset_y_140, -1])
        cylinder(d1=143, d2=139, h=4, $fn=80);

        translate([-120.5/2 - offset_x_120, offset_y_120, -1])
        cylinder(d1=123, d2=119, h=4, $fn=80);

        translate([140.5/2 + offset_x_140, offset_y_140, -1]) {
            translate([-124.5/2, 124.5/2, 0])
            cylinder(d=5.3, h=10, $fn=30);

            translate([-124.5/2, -124.5/2, 0])
            cylinder(d=5.3, h=10, $fn=30);
        }

        translate([-120.5/2 - offset_x_120, offset_y_120, -1]) {
            translate([105/2, 105/2, 0])
            cylinder(d=5.3, h=10, $fn=30);

            translate([105/2, -105/2, 0])
            cylinder(d=5.3, h=10, $fn=30);
        }

        translate([0, -21.5, 20/2 + 2])
        cube([56, 105, 20], center=true);

        translate([0, 20.5, 0])
        cylinder(d=3.6, h=50, center=true, $fn=20);

        translate([0, -17.5, 0])
        cylinder(d=3.6, h=50, center=true, $fn=20);

        translate([0, 42, 0])
        rotate([-25, 0, 0])
        cube([11, 17, 40], center=true);
    }
}

module fan_mount_80_80() {
    difference() {
        translate([0, 0, 10/2])
        union() {
            translate([40/2 - 0.01, 0, 0])
            cube([40, 85, 10], center=true);

            translate([-40/2 + 0.01, 0, 0])
            cube([40, 85, 10], center=true);
        }

        translate([80.5/2 + 16.7, 0, 20/2 + 2])
        cube([80.5, 80.5, 20], center=true);

        translate([-80.5/2 - 16.7, 0, 20/2 + 2])
        cube([80.5, 80.5, 20], center=true);

        translate([80.5/2 + 16.7, 0, -1])
        cylinder(d1=83, d2=79, h=4, $fn=80);

        translate([-80.5/2 - 16.7, 0, -1])
        cylinder(d1=83, d2=79, h=4, $fn=80);

        translate([80.5/2 + 16.7, 0, -1]) {
            translate([-72/2, 72/2, 0])
            cylinder(d=5.3, h=10, $fn=30);

            translate([-72/2, -72/2, 0])
            cylinder(d=5.3, h=10, $fn=30);
        }

        translate([-80.5/2 - 16.7, 0, -1]) {
            translate([72/2, 72/2, 0])
            cylinder(d=5.3, h=10, $fn=30);

            translate([72/2, -72/2, 0])
            cylinder(d=5.3, h=10, $fn=30);
        }

        translate([0, -4, 20/2 + 2])
        cube([30, 72, 20], center=true);

        translate([0, 20.5, 0])
        cylinder(d=3.6, h=50, center=true, $fn=20);

        translate([0, -17.5, 0])
        cylinder(d=3.6, h=50, center=true, $fn=20);

        translate([0, 42, 0])
        rotate([-25, 0, 0])
        cube([11, 17, 40], center=true);

    }
}

module fan_mount_140() {
    intersection() {
        fan_mount_140_120(gap=20);

        translate([200/2 - 10/2, 0, 0])
        cube([200, 200, 100], center=true);
    }
}

module fan_mount_120() {
    intersection() {
        fan_mount_140_120(gap=20);

        translate([-200/2 + 10/2, -14, 0])
        cube([200, 125, 100], center=true);
    }
}
    
module tykkilepy_back_mount() {
    difference() {
        union() {
            cylinder(d=10, h=17, $fn=30);

            hull() {
                translate([1, -7.2, 27.7])
                rotate([0, -90, 0])
                cylinder(d=18, h=6.5, $fn=30);

                translate([0, 0, 10])
                cylinder(d=10, h=7, $fn=30);
            }
        }
        cylinder(d=3, h=60, center=true, $fn=20);

        translate([0, 0, 2])
        cylinder(d=6, h=40, $fn=20);

        translate([0, -7.2, 27.7])
        rotate([0, 90, 0])
        cylinder(d=8.5, h=50, center=true, $fn=40);

        translate([1, -7.2, 27.7])
        rotate([0, 90, 0])
        cylinder(d=18, h=10, $fn=40);
    }
}

module tykkilepy_front_mount() {
    difference() {
        union() {
            cylinder(d=10, h=17, $fn=30);

            hull() {
                translate([-4.5, 0.5, 27.7])
                rotate([0, 90, 0])
                cylinder(d=18, h=9, $fn=30);

                translate([0, 0, 10])
                cylinder(d=10, h=7, $fn=30);
            }
        }
        cylinder(d=3, h=60, center=true, $fn=20);

        translate([0, 0, 2])
        cylinder(d=6, h=40, $fn=20);

        translate([0, 0.5, 27.7])
        rotate([0, 90, 0])
        cylinder(d=8.5, h=50, center=true, $fn=40);

        translate([-4, 0, 27.7])
        rotate([0, -90, 0])
        cylinder(d=20, h=10, $fn=40);

        translate([10/2 + 5/2 - 0.5, 0, 20/2 + 10])
        cube([5, 20, 20], center=true);
    }
}

module debug() {
    // mock laptop
//    %translate([0, 0, 81])
//    rotate([22, 0, 0])
//    cube([390, 285, 20], center=true);
    
    translate([-370/2, -2, 0])
    rotate([90, 0, -90])
    cooler_stand();

    translate([370/2, -2, 0])
    rotate([90, 0, 90])
    cooler_stand_right();

    %translate([0, 260/2 - 32, 20/2])
    rotate([0, 90, 0])
    cylinder(d=8, h=400, center=true, $fn=20);

    %translate([0, 260/2 - 7, 109])
    rotate([0, 90, 0])
    cylinder(d=8, h=400, center=true, $fn=20);

    %translate([0, -260/2 + 8, 20/2])
    rotate([0, 90, 0])
    cylinder(d=8, h=400, center=true, $fn=20);

    translate([-120, 70, 66])
    rotate([10, 0, 0])
    mock_fan_92mm();

    translate([120, 70, 66])
    rotate([10, 0, 0])
    mock_fan_92mm();

    translate([0, 70, 66])
    rotate([10, 0, 0])
    mock_fan_80mm();

    translate([52, 98, 20/2])
    rotate([75.8, 0, 0])
    rotate([0, 90, 0])
    fan_mount_arm();

    translate([57, 72.5, 51])
    rotate([10, 0, 0])
    fan_mount_92_80();
}

module debug_2() {
    // mock laptop
//    %translate([0, 0, 81])
//    rotate([22, 0, 0])
//    cube([390, 285, 20], center=true);
    
    translate([-370/2, -2, 0])
    rotate([90, 0, -90])
    cooler_stand();

    translate([370/2, -2, 0])
    rotate([90, 0, 90])
    cooler_stand_right();

    %translate([0, 260/2 - 32, 20/2])
    rotate([0, 90, 0])
    cylinder(d=8, h=400, center=true, $fn=20);

    %translate([0, 260/2 - 7, 109])
    rotate([0, 90, 0])
    cylinder(d=8, h=400, center=true, $fn=20);

    %translate([0, -260/2 + 8, 20/2])
    rotate([0, 90, 0])
    cylinder(d=8, h=400, center=true, $fn=20);

    translate([-120, 70, 66])
    rotate([10, 0, 0])
    mock_fan_92mm();

    translate([114, 70, 66])
    rotate([10, 0, 0])
    mock_fan_80mm();

    translate([0, 70, 66])
    rotate([10, 0, 0])
    mock_fan_80mm();

    translate([52, 98, 20/2])
    rotate([75.8, 0, 0])
    rotate([0, 90, 0])
    fan_mount_arm();

    translate([57, 72.5, 51])
    rotate([10, 0, 0])
    fan_mount_80_80();

    translate([-62, 98, 20/2])
    rotate([75.8, 0, 0])
    rotate([0, 90, 0])
    fan_mount_arm();

    translate([-57, 72.5, 51])
    rotate([10, 0, 0])
    mirror([1, 0, 0])
    fan_mount_92_80();
}

module debug_tykkilepy() {
    translate([-402/2, 272/2, 0])
    cylinder(d=2.5, h=5);

    translate([402/2, 272/2, 0])
    cylinder(d=2.5, h=5);

    translate([-390/2, -272/2, 0])
    cylinder(d=2.5, h=5);
    
    translate([390/2, -272/2, 0])
    cylinder(d=2.5, h=5);

    translate([402/2 + 9, -28, 82])
    rotate([-90, 22, -90])
    cooler_stand();

    translate([402/2, 272/2, 0])
    tykkilepy_back_mount();

    translate([390/2, -272/2, 0])
    tykkilepy_front_mount();

    translate([-402/2 - 9, -28, 82])
    rotate([-90, -22, 90])
    cooler_stand_right();

    translate([-402/2, 272/2, 0])
    mirror([1, 0, 0])
    tykkilepy_back_mount();

    translate([-390/2, -272/2, 0])
    mirror([1, 0, 0])
    tykkilepy_front_mount();

    %translate([0, 272/2 - 7.2, 27.7])
    rotate([0, 90, 0])
    cylinder(d=8, h=440, center=true, $fn=20);

    %translate([0, 272/2 - 67.5, 110.2])
    rotate([0, 90, 0])
    cylinder(d=8, h=440, center=true, $fn=20);

    translate([10/2, 68.6, 110.2])
    rotate([-53.8, 0, 0])
    rotate([0, -90, 0])
    fan_mount_arm();

    translate([-180.2 + 10/2, 68.6, 110.2])
    rotate([-53.8, 0, 0])
    rotate([0, -90, 0])
    fan_mount_arm();

    translate([160.2 + 10/2, 68.6, 110.2])
    rotate([-53.8, 0, 0])
    rotate([0, -90, 0])
    fan_mount_arm();

    translate([90, 50, 44])
    rotate([11.5, 0, 0])
    mock_fan_120mm();

    translate([-100, 40, 44])
    rotate([11.5, 0, 0])
    mock_fan_140mm();

    translate([0, 60.5, 62.5])
    rotate([-11.5, 180, 0])
    fan_mount_140_120();

    translate([-180.2, 60.5, 62.5])
    rotate([-11.5, 180, 0])
    mirror([1, 0, 0])
    fan_mount_140();

    translate([160.2, 60.5, 62.5])
    rotate([-11.5, 180, 0])
    mirror([1, 0, 0])
    fan_mount_120();
}