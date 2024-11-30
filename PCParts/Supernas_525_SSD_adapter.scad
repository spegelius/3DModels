use <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


//debug();

//525_adapter_side_1();
525_adapter_side_2();
//525_adapter_case_slide_bottom();
//525_adapter_case_slide_top();
//SAS_lock_clamp();


module debug() {
    module _case_525_bay() {
        // case 5.25 bay
        %difference() {
            cube([151, 149, 135], center=true);
            cube([142, 151, 133], center=true);

            for (i = [0:2]) {
                translate([
                    0, -186/2 + 149/2 + 34, -65 + i*43
                ])
                rotate([0, 0, 180])
                mock_dvdrom();
            }

            for (i = [0:2]) {
                translate([0, 56, -43 + i*43])
                rotate([0, 90, 0])
                cylinder(
                    d=3.1, h=200, center=true, $fn=30
                );

                translate([0, 56, -54.5 + i*43])
                rotate([0, 90, 0])
                cylinder(
                    d=3.1, h=200, center=true, $fn=30
                );

                translate([0, -23, -43 + i*43])
                rotate([0, 90, 0])
                cylinder(
                    d=3.1, h=200, center=true, $fn=30
                );

                translate([0, -23, -54.5 + i*43])
                rotate([0, 90, 0])
                cylinder(
                    d=3.1, h=200, center=true, $fn=30
                );
            }
        }
    }

    // disks
    //translate([0, 0, -25])
    
//    translate([-50, -60, -64])
//    for (i = [0:7]) {
//        translate([i*16.5, 0, 0])
//        rotate([0, -90, 0])
//        mock_ssd_enterprise(connector=true);
//    }

//    translate([-50, -80, 10])
//    mock_hd();
//
//    translate([-50, -80, 38])
//    mock_hd();

    translate([-70/2 + 10, -60, -64])
    for (i = [0:7]) {
        translate([0, 0, i*16.2])
        mock_ssd_enterprise(connector=true);
    }

    %translate([55, -70, 9])
    rotate([0, 90, 0])
    mock_ssd();

    //_case_525_bay();

//    %for (i = [0:2]) {
//        translate([0, -186/2 + 149/2 + 34, -65 + i*43])
//        rotate([0, 0, 180])
//        mock_dvdrom();
//    }

    translate([10, 75, 0])
    rotate([90, 0, 0])
    mock_fan_120mm();

    translate([-70/2 + 4, -20, -3.1])
    rotate([0, 90, 0])
    525_adapter_side_1();

    translate([61.3, -7, -2])
    rotate([-90, 0, 0])
    525_adapter_side_2();

    translate([-147.8/2, -3, -44])
    rotate([0, 90, 0])
    525_adapter_case_slide_bottom();

    translate([-147.8/2, -3, -44 + 86])
    rotate([0, 90, 0])
    525_adapter_case_slide_top();

    translate([0, -76.25, -3.6 + 16.2])
    rotate([-90, 0, 0])
    SAS_lock_clamp();

    translate([0, -76.25, -3.6])
    rotate([-90, 0, 0])
    SAS_lock_clamp();
}

module _ssd_screw_hole() {
    cylinder(d=3.2, h=30, center=true, $fn=20);

    hull() {
        translate([0, 0, -30])
        cylinder(d=3.2, h=35, $fn=20);

        translate([0, 0, -30])
        cylinder(d=6, h=33.6, $fn=20);
    }
}

module 525_adapter_side_1() {

    module _side_mount_hole() {
        cylinder(d=4.3, h=20, center=true, $fn=40);

        M4_nut(5);
    }

    module _infill() {
        intersection() {
            union() {
                translate([0, 0, 1.5])
                rounded_cube_side(
                    113, 110, 4, 5,
                    center=true, $fn=40
                );

                translate([0, 4.5, 0])
                rounded_cube(
                    112, 48, 30, 7, center=true
                );
            }

            difference() {
                translate([-235, -235, 0])
                for(j = [0:39]) {
                    translate([0, j*15.5])
                    rotate([0, 0, -60])
                    for (i = [0:39]) {
                        translate([0, i*15.5])
                        cylinder(
                            d=15, h=60,
                            center=true, $fn=6
                        );
                    }
                }

                translate([0, 120/2 - 9.5, 0])
                cube([120, 5, 4], center=true);

                translate([0, -26, 0])
                cube([120, 5, 4], center=true);
            }
        }
    }

    difference() {
        union() {
            difference() {
                rounded_cube_side(
                    123, 120, 4, 15,
                    center=true, $fn=40
                );

                _infill();
            }

            translate([-123/2 + 3.4, -40, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([-123/2 + 3.4, 37, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([-123/2 + 29.4, -40, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([-123/2 + 29.4, 37, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([123/2 - 7.9, -40, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([123/2 - 7.9, 37, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([123/2 - 33.9, -40, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            translate([123/2 - 33.9, 37, 1])
            cylinder(d=15, h=6, center=true, $fn=40);

            for (i = [0:7]) {
                translate([-56 + i*16.2, 48.5, 0])
                hull() {
                    cylinder(d=8, h=6, $fn=30);

                    translate([0, 4, 0])
                    cylinder(d=8, h=6, $fn=30);
                }

                translate([-56 + i*16.2, -28, 0])
                hull() {
                    cylinder(d=8, h=6, $fn=30);

                    translate([0, 4, 0])
                    cylinder(d=8, h=6, $fn=30);
                }

            }
        }

        for (i = [0:7]) {
            translate([-55.5 + i*16.2, -26, 0])
            _ssd_screw_hole();

            translate([-55.5 + i*16.2, 50.5, 0])
            _ssd_screw_hole();
        }

        translate([-123/2 + 3.4, -40, 1])
        _side_mount_hole();

        translate([-123/2 + 3.4, 37, 1])
        _side_mount_hole();

        translate([-123/2 + 29.4, -40, 1])
        _side_mount_hole();

        translate([-123/2 + 29.4, 37, 1])
        _side_mount_hole();

        translate([123/2 - 7.9, -40, 1])
        _side_mount_hole();

        translate([123/2 - 7.9, 37, 1])
        _side_mount_hole();

        translate([123/2 - 33.9, -40, 1])
        _side_mount_hole();

        translate([123/2 - 33.9, 37, 1])
        _side_mount_hole();

        // SAS lock mount holes
        for (i = [0:6]) {
            translate([
                -120/2 + 12 + i*16.2, -126/2 + 7 ,
                0
            ])
            cylinder(d=5, h=30, center=true, $fn=20);
        }
    }
}

module 525_adapter_side_2() {
    module _ssd_mount_peg() {
        hull() {
            cube([0.1, 8, 14], center=true);

            translate([-3.75, 0, 0])
            cube([0.1, 8, 7], center=true);
        }
    }

    module _slit() {
        hull() {
            cube([40, 1, 25], center=true);
            cube([40, 7, 15], center=true);
        }
    }

    h = 132;

    difference() {
        union() {
            cube([25, 126, h], center=true);

            hull() {
                translate([-25/2, 2, -h/2 + 2])
                cube([16, 116, 4], center=true);

                translate([-25/2, 2, -h/2 + 9])
                cube([4, 116, 1], center=true);
            }

            for (i = [0:7]) {
                translate([-25/2, 59 - i*16.2, -39])
                _ssd_mount_peg();

                translate([-25/2, 59 - i*16.2, 37.6])
                _ssd_mount_peg();
            }

            translate([1.2, 50.5, h/2 - 1])
            cylinder(d=11, h=4.4, $fn=30);

            translate([1.2, -54.5, h/2 - 1])
            cylinder(d=11, h=4.4, $fn=30);
        }

        // slides
        translate([25/2, -22.5, 0])
        cube([8.1, 1.2, 200], center=true);

        translate([25/2, 20.5, 0])
        cube([8.1, 1.2, 200], center=true);

        difference() {
            rounded_cube_side(
                21, 122, 140, 2, center=true
            );

            translate([25/2 - 3, 126/2 - 7, h/2])
            rotate([0, 0, -45])
            cube([50, 30, 10], center=true);

            translate([25/2 - 3, -126/2 + 7, h/2])
            rotate([0, 0, 45])
            cube([50, 30, 10], center=true);

            translate([25/2, -22.5, 0])
            chamfered_cube(
                12.1, 7.2, 200, 2.2, center=true
            );

            translate([25/2, 20.5, 0])
            chamfered_cube(
                12.1, 7.2, 200, 2.2, center=true
            );

            translate([0, -12, 0])
            cube([25, 2, 200], center=true);

            translate([0, -11, -66])
            cube([25, 3, 212], center=true);

            translate([-1.8, 126/2 - 3, -67])
            cube([13, 5, 212], center=true);

            hull() {
                translate([-25/2 + 1, -126/2, 0])
                cylinder(
                    d=1.2, h=200,
                    center=true, $fn=20
                );

                translate([25/2 - 1, -12, 0])
                cylinder(
                    d=1.2, h=200,
                    center=true, $fn=20
                );
            }

            hull() {
                translate([25/2 - 1, -126/2, 0])
                cylinder(
                    d=1.2, h=200,
                    center=true, $fn=20
                );

                translate([-25/2 + 1, -12, 0])
                cylinder(
                    d=1.2, h=200,
                    center=true, $fn=20
                );
            }
        }

        // ssd hole
        translate([-1.8, 24, -62])
        union() {
            cube([9.2, 70.3, 200], center=true);
            cube([11.2, 67, 200], center=true);
        }

        translate([-1.8, 96, -85])
        cube([9.2, 70, 80], center=true);

        translate([-1.8, 96, -0.5])
        cube([9.2, 70, 65], center=true);

        // ssd screw holes
        for (i = [0:7]) {
            translate([-10.1, 59 - i*16.2, -39])
            rotate([0, -90, 0])
            _ssd_screw_hole();

            translate([-10.1, 59 - i*16.2, 37.6])
            rotate([0, -90, 0])
            _ssd_screw_hole();
        }

        // SAS lock mount holes
        #for (i = [0:6]) {
            translate([
                -25/2 - 4, -126/2 + 16 + i*16.2,
                -120/2
            ])
            cylinder(d=2.8, h=30, center=true, $fn=20);
        }

        // 5.25 mount holes
        for (i = [0:2]) {
            translate([25/2, 41 - i*43, -16])
            rotate([0, 90, 0])
            cylinder(d=2.8, h=20, center=true, $fn=20);

            translate([25/2, 52.5 - i*43, -16])
            rotate([0, 90, 0])
            cylinder(d=2.8, h=20, center=true, $fn=20);

            translate([25/2, 41 - i*43, 63])
            rotate([0, 90, 0])
            cylinder(d=2.8, h=20, center=true, $fn=20);

            translate([25/2, 52.5 - i*43, 63])
            rotate([0, 90, 0])
            cylinder(d=2.8, h=20, center=true, $fn=20);
        }

        // fan mount holes
        translate([1.2, 50.5, h/2 - 4.7])
        cylinder(d=3, h=100, $fn=30);

        translate([1.2, -54.5, h/2 - 4.7])
        cylinder(d=3, h=100, $fn=30);

        // slits

        translate([0, 35, 18])
        _slit();

        translate([0, 0, 18])
        _slit();

        translate([0, -35, 18])
        _slit();

        translate([-30, 25, -18])
        _slit();

        translate([-30, -25, -18])
        _slit();

    }
}

module _525_adapter_case_slide() {
    module _infill() {
        intersection() {
            difference() {
                translate([0, 0, 4/2 + 1.5])
                rounded_cube_side(
                    33.5, 122, 4, 7,
                    center=true, $fn=40
                );

                translate([-1, 59, 0])
                cylinder(
                    d=7, h=20, center=true, $fn=20
                );

                translate([10.5, 59, 0])
                cylinder(
                    d=7, h= 20, center=true, $fn=20
                );

                translate([-1, -20, 0])
                cylinder(
                    d=7, h= 20, center=true, $fn=20
                );

                translate([10.5, -20, 0])
                cylinder(
                    d=7, h= 20, center=true, $fn=20
                );
            }

            translate([-235, -235, 0])
            for(j = [0:39]) {
                translate([0, j*9.2])
                rotate([0, 0, -60])
                for (i = [0:39]) {
                    translate([0, i*9.2])
                    cylinder(
                        d=9, h=60,
                        center=true, $fn=6
                    );
                }
            }
        }
    }

    difference() {
        union() {
            difference() {
                translate([0, 0, 4/2])
                rounded_cube_side(
                    41.5, 130, 4, 15,
                    center=true, $fn=40
                );

                _infill();
            }

            translate([-13, -57, 0])
            cylinder(d=15, h=41, $fn=40);

            translate([13, -57, 0])
            cylinder(d=15, h=41, $fn=40);

            translate([0, -57, 35/2])
            cube([20, 5, 35], center=true);

            translate([-13, 20, 0])
            cylinder(d=15, h=41, $fn=40);

            translate([13, 20, 0])
            cylinder(d=15, h=41, $fn=40);

            translate([0, 20, 35/2])
            cube([20, 5, 35], center=true);
        }

        translate([-13, -57, 0])
        cylinder(d=4.3, h=131, center=true, $fn=40);

        translate([-13, -57, 0])
        hull() {
            cylinder(d=9, h=61, center=true, $fn=40);

            cylinder(d=4.3, h=68, center=true, $fn=40);
        }

        translate([13, -57, 0])
        cylinder(d=4.3, h=131, center=true, $fn=40);

        translate([13, -57, 0])
        hull() {
            cylinder(d=9, h=61, center=true, $fn=40);

            cylinder(d=4.3, h=68, center=true, $fn=40);
        }

        translate([-13, 20, 0])
        cylinder(d=4.3, h=131, center=true, $fn=40);

        translate([-13, 20, 0])
        hull() {
            cylinder(d=9, h=61, center=true, $fn=40);

            cylinder(d=4.3, h=68, center=true, $fn=40);
        }

        translate([13, 20, 0])
        cylinder(d=4.3, h=131, center=true, $fn=40);

        translate([13, 20, 0])
        hull() {
            cylinder(d=9, h=61, center=true, $fn=40);

            cylinder(d=4.3, h=68, center=true, $fn=40);
        }

        translate([-1, 59, 0])
        cylinder(d=2.8, h= 20, center=true, $fn=20);

        translate([10.5, 59, 0])
        cylinder(d=2.8, h= 20, center=true, $fn=20);

        translate([-1, -20, 0])
        cylinder(d=2.8, h= 20, center=true, $fn=20);

        translate([10.5, -20, 0])
        cylinder(d=2.8, h= 20, center=true, $fn=20);
    }
}

module 525_adapter_case_slide_bottom() {
    difference() {
        union() {
            _525_adapter_case_slide();

            hull() {
                translate([5, 130/2 - 3, 4])
                cube([20, 4, 1], center=true);

                translate([9, 130/2 - 1.6, 32])
                cube([10, 4, 14], center=true);
            }

            hull() {
                translate([6, 130/2 - 8, 4])
                cube([3, 13, 1], center=true);

                translate([6, 130/2 - 1.6, 32])
                cube([3, 4, 14], center=true);
            }

            translate([8.5, 130/2 - 3.5, 31.5])
            rotate([90, 0, 0])
            cylinder(
                d1=11, d2=6, h=7, center=true, $fn=30
            );
        }

        translate([8.5, 130/2, 31.5])
        rotate([90, 0, 0])
        cylinder(d=3, h=30, center=true, $fn=30);
    }
}

module 525_adapter_case_slide_top() {
    difference() {
        union() {
            _525_adapter_case_slide();

            hull() {
                translate([-5, 130/2 - 3, 4])
                cube([20, 4, 1], center=true);

                translate([-11, 130/2 - 1.6, 32])
                cube([10, 4, 14], center=true);
            }

            hull() {
                translate([-7.5, 130/2 - 8, 4])
                cube([3, 13, 1], center=true);

                translate([-7.5, 130/2 - 1.6, 32])
                cube([3, 4, 14], center=true);
            }

            translate([-10.5, 130/2 - 3.5, 31.5])
            rotate([90, 0, 0])
            cylinder(
                d1=11, d2=6, h=7, center=true, $fn=30
            );
        }

        translate([-10.5, 130/2, 31.5])
        rotate([90, 0, 0])
        cylinder(d=3, h=30, center=true, $fn=30);
    }
}

module SAS_lock_clamp() {
    difference() {
        union() {
            translate([-29, 0, 0.5/2])
            rotate([0, 90, 0])
            cylinder(d=4.5, h=8, center=true, $fn=40);

            translate([8.25, 0, 0])
            cube([73.5, 8, 4], center=true);

            translate([44.75, 0, 1.25/2])
            cylinder(d=8, h=5.25, center=true, $fn=40);

            translate([-16, 0, 1.4/2])
            cube([5, 15.6, 5.4], center=true);

            translate([26, 0, 1.4/2])
            cube([5, 15.6, 5.4], center=true);

        }

        translate([44.75, 0, 0])
        cylinder(d=3.7, h=40, center=true, $fn=40);

        translate([-34, 0, 2.8])
        rotate([0, -20, 0])
        cube([10, 10, 4], center=true);
    }
}