use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
ss_stl_path = str(
    stl_base_path,
    "Superstrings_puzzle/"
);


//p1_angled();
//p1_angled_supports();
//p1_angled_solubles();

p1();
//p1_supports();
//p1_solubles();

//p2();
//p2_supports();
//p2_solubles();

module p1_angled() {
    translate([0, 0, 61.914])
    rotate([-135, 0, 0])
    import(str(
        ss_stl_path,
        "Superstrings_628_03_003_S1.stl"
    ), convexity=5);
}

module solublock(x) {
    hull() {
        translate([0, 0, 0.1/2])
        cube([x, 2.5, 0.1], center=true);

        translate([0, 0,1/2 + 2])
        cube([x, 8.5, 1], center=true);
    }
}

module hollow_cube(
    x, y, z, wall, center=false, cup=true,
    brim=4, extra=6) {
    
    module _hollow_cube() {
        difference() {
            union() {
                cube([x, y, z], center=true);
                if (extra > 0) {
                    if (x > y) {
                        cube(
                            [1, extra, z], center=true);
                    } else {
                        cube(
                            [extra, 1, z], center=true);
                    }
                }

                if (cup) {
                    translate([0, 0, z/2 - 5])
                    hull() {
                        cube([x, y, 0.1], center=true);

                        translate([0, 0, 5 + 2/2])
                        cube([x, y + 8, 2],
                             center=true); 
                    }
                }
                if (brim > 0) {
                    translate([0, 0, -z/2 + 0.2/2])
                    cube(
                        [x + brim, y + brim * 2, 0.2],
                        center=true
                    );
                }
            }
            translate([0, 0, -wall])
            cube([x - 2 * wall, y - 2 * wall,
                  z - 2 * wall], center=true);

            if (cup) {
                translate([0, 0, z/2])
                solublock(x);
            }
        }
    }
    
    if (center) {
        _hollow_cube();
    } else {
        translate([x/2, y/2, z/2])
        _hollow_cube();
    }
}

module p1_angled_supports(brim=7) {
    
    color("white") {
        translate([5.3, -8.8, 8/2])
        hollow_cube(
            14, 2, 8, 0.5, center=true, brim=brim
        );

        translate([2 * 6.8, 8.8, 8/2])
        hollow_cube(
            14, 2, 8, 0.5, center=true, brim=0
        );

        translate([34.5, 2 * -8.8, 17/2])
        hollow_cube(
            20, 2, 17, 0.5, center=true, brim=brim
        );

        translate([34.5, 2 * 8.8, 17/2])
        hollow_cube(
            20, 2, 17, 0.5, center=true, brim=brim
        );

        translate([38.6, 3 * -8.8, 26/2])
        hollow_cube(
            14, 2, 26, 0.5, center=true, brim=brim
        );

        translate([30.4, 3 * 8.8, 26/2])
        hollow_cube(
            14, 2, 26, 0.5, center=true, brim=brim
        );

        translate([40.9, -4.5, 21.5/2])
        hollow_cube(
            10, 2, 21.5, 0.5, center=true, brim=brim
        );

        translate([40.9, 8.8, 26/2])
        hollow_cube(
            10, 2, 26, 0.5, center=true, brim=brim
        );

        translate([34.6, 2 * 8.8, 34.5 - 3/2])
        hollow_cube(
            5.8, 2, 3, 0.5, center=true, brim=0
        );

        hull() {
            translate([
                34.6, 2 * 8.8 - 0.5, 34.5 - 3 - 1/2
            ])
            cube([5.8, 2.4, 1], center=true);

            translate([34.6, 3 * 8.8 - 1/2, 21])
            cube([5.8, 0.5, 3], center=true);
        }

        translate([31.2, -2 * 8.85, 34.5 - 3/2])
        hollow_cube(
            12, 2, 3, 0.5, center=true, brim=0
        );

        hull() {
            translate([
                31.2 - 3.5, -2 * 8.85, 34.5 - 3.5
            ])
            cube([5, 2, 1], center=true);

            translate([22, -2 * 7, 25])
            cube([5, 2, 1], center=true);
        }

        hull() {
            translate([
                31.2 + 3.5, -2 * 8.5, 34.5 - 3.5
            ])
            cube([5, 2, 1], center=true);

            translate([35, - 3 * 8.8, 22])
            cube([5, 2, 1], center=true);
        }

        translate([18.8, -2 * 6.7, 38.5 - 12/2])
        hollow_cube(
            12, 2, 12, 0.5, center=true, brim=0
        );

        translate([18.8, -2 * 8, 20/2])
        hollow_cube(
            12, 2, 20, 0.5, center=true,
            cup=false, brim=brim
        );

        hull() {
            translate([
                18.8, -2 * 6.7, 38.5 - 12 - 1/2
            ])
            cube([12, 2, 1], center=true);

            translate([18.8, -2 * 8, 20])
            cube([12, 2, 1], center=true);
        }

        translate([12/2, -2 * 4.5, 43 - 12/2])
        hollow_cube(
            12, 2, 12, 0.5, center=true, brim=0
        );

        translate([12/2, -2 * 8, 24/2])
        hollow_cube(
            12, 2, 24, 0.5, center=true, cup=false,
            brim=brim, extra=5
        );

        hull() {
            translate([12/2, -2 * 4.5, 43 - 12])
            cube([12, 2, 1], center=true);

            translate([12/2, -2 * 8, 24])
            cube([12, 2, 1], center=true);
        }

        translate([12/2 + 6.5, 2 * 4.5, 43 - 18/2])
        hollow_cube(
            12, 2, 18, 0.5, center=true, brim=0
        );

        translate([12/2 + 6.5, 2 * 7.5, 17/2])
        hollow_cube(
            12, 2, 17, 0.5, center=true, cup=false,
            brim=brim, extra=3
        );

        hull() {
            translate([12/2 + 6.5, 2*4.5, 43 - 18])
            cube([12, 2, 1], center=true);

            translate([12/2 + 6.5, 2*7.5, 17])
            cube([12, 2, 1], center=true);
        }

        translate([6.5 + 5/2, 0, 52 - 4/2])
        hollow_cube(
            5, 2, 4, 0.5, center=true, brim=0
        );

        hull() {
            translate([6.5 + 5/2, 0, 52 - 5])
            cube([5, 2, 1], center=true);

            translate([6.5 + 5/2, 2 * 4, 38])
            cube([5, 0.5, 3], center=true);
        }

        translate([35, 18.2, 0])
        cube([0.5, 7.5, 16]);

        translate([38, 9.3, 0])
        cube([0.5, 7.5, 16.2]);

        translate([38, -17, 0])
        cube([0.5, 12, 16.5]);

        translate([32, -25.8, 0])
        cube([0.5, 7.5, 16.5]);

        translate([24, -17, 0])
        cube([2, 0.5, 16]);

        translate([11, -17, 0])
        cube([2, 0.5, 18]);

        translate([11, -13, 26])
        cube([2, 0.5, 3]);

        translate([18.8, -16, 20])
        hull() {
            cube([1, 6, 0.1], center=true);

            translate([0, 2.6, 6.5])
            cube([1, 6, 0.1], center=true);
        }

        translate([8, -25, 0])
        cube([0.5, 8, 24.5]);

        translate([8, -25, 24.5])
        hull() {
            cube([0.5, 8, 0.1]);

            translate([0, 7, 6.9])
            cube([0.5, 8, 0.1]);
        }

        translate([8, -25 + 7, 24.5 + 7])
        cube([0.5, 8, 10]);

        translate([6, -16, 24])
        hull() {
            cube([1, 5, 0.1], center=true);

            translate([0, 7, 7])
            cube([1, 6, 0.1], center=true);
        }

        translate([8, 16, 0])
        cube([0.5, 8, 17.5]);

        translate([8, 16, 17.5])
        hull() {
            cube([0.5, 8, 0.1]);

            translate([0, -6.1, 8])
            cube([0.5, 8, 0.1]);
        }
        translate([8, 9.9, 17.5 + 8])
        cube([0.5, 8, 16.5]);

        translate([8, -15, 0])
        cube([0.5, 5.5, 7]);

        translate([8, 9.5, 0])
        cube([0.5, 5, 7]);

        translate([12.5, 15, 17])
        hull() {
            cube([1, 3, 0.1], center=true);

            translate([0, -6, 8])
            cube([1, 6, 0.1], center=true);
        }

        if (brim > 0) {
            translate([
                (20 + brim)/2 - brim/2, 0, 0.2/2
            ])
            cube(
                [20 + brim, brim * 2, 0.2],
                center=true
            );
        }

        translate([38, -3.6, 0])
        cube([0.5, 11.5, 21.2]);
    }
}

module p1_angled_solubles() {
    
    difference() {
        color("grey")
        union() {
            translate([5.3, -8.8, 8])
            solublock(14);

            translate([2 * 6.8, 8.8, 8])
            solublock(14);

            translate([35, 2 * -8.8, 17])
            solublock(20);

            translate([34.5, 2 * 8.8, 17])
            solublock(20);

            translate([38.6, 3 * -8.8, 26])
            solublock(14);

            translate([30.4, 3 * 8.8, 26])
            solublock(14);

            translate([40.9, -4.5, 21.5])
            solublock(10);

            translate([40.9, 8.8, 26])
            solublock(10);

            translate([34.6, 2 * 8.8, 34.5])
            solublock(5.8);

            translate([31.2, -2 * 8.85, 34.5])
            solublock(12);

            translate([18.8, -2 * 6.7, 38.5])
            solublock(12);

            translate([12/2, -2 * 4.5, 43])
            solublock(12);

            translate([12/2 + 6.5, 2 * 4.5, 43])
            solublock(12);

            translate([6.5 + 5/2, 0, 52])
            solublock(5);

            translate([18.1/2 + 0.4, 0, 2.8/2 + 0.2])
            cube([18.1, 8, 2.8], center=true);
        }
        p1_angled();
    }
}

block = 18.8/3;

module _infill() {
    module _infill_shape(h) {
        translate([0, 0, h/2])
        cube([0.1, 0.1, h], center=true);
    }

    //infill
    translate([
        3 * block - block/2, block/2, -1
    ])
    _infill_shape(20);

    translate([
        block/2, 3 * block - block/2,
         2 * block - 1
    ])
    _infill_shape(15);

    translate([
        block/2, 5 * block - block/2,
        3 * block - 1
    ])
    _infill_shape(15);

    translate([
        3 * block - block/2,
        5 * block - block/2, 4 * block - 1
    ])
    _infill_shape(20);

    translate([
        3 * block - block/2,
        7 * block - block/2, 4 * block - 1
    ])
    _infill_shape(20);

    translate([
        7 * block - block/2,
        5 * block - block/2, 2 * block - 1
    ])
    _infill_shape(15);

    translate([
        7 * block - block/2,
        3 * block - block/2, 3 * block - 1
    ])
    _infill_shape(15);

    translate([
        5 * block - block/2,
        3 * block - block/2, 4 * block - 1
    ])
    _infill_shape(20);

    translate([
        5 * block - block/2,
        block - block/2, 4 * block - 1
    ])
    _infill_shape(20);

    translate([
        5 * block - block/2,
        44 - block/2, -1
    ])
    _infill_shape(20);
}


module p1(infill=true) {
    difference() {
        translate([-0.03, -0.03, -0.03])
        import(str(
            ss_stl_path,
            "Superstrings_628_03_003_S1.stl"
        ), convexity=10);

        if (infill) {
            #_infill();
        }
    }
}

module p2(infill=true) {
    
    difference() {
        translate([-0.03, -0.03, -0.03])
        import(str(
            ss_stl_path,
            "Superstrings_628_03_003_S2.stl"
        ), convexity=10);

        if (infill) {
            #_infill();
        }
    }
}

module p1_supports() {
    _p_supports(one=true);
}

module p2_supports() {
    _p_supports(one=false);
}

s_block = block - 0.45;
module _p_supports(one=true) {

    module _support(x, y, z) {
        rotate([90, 0, 0])
        difference() {
            cube([x, z, y], center=true);

            chamfered_cube_side(
                x - 1, z - 1, y + 1, 1, center=true
            );
        }
    }

    // bottom right
    difference() {
        union() {
            translate([
                11.5/2 + 0.5, block/2, 1.5 * block
            ])
            rotate([0, 0, 90])
            _support(s_block, 11.5, block - 1.2);

            translate([
                block/2, 19/2 + 0.5, 1.5 * block
            ])
            _support(s_block, 19, block - 1.2);

            translate([
                block/2, 13/2 + 3 * block + 0.4,
                (3 * block - 0.6)/2
            ])
            _support(s_block, 13, 3 * block - 0.6);

            translate([
                block/2, 11.5/2 + 5 * block + 0.4,
                (4 * block - 0.6)/2
            ])
            _support(s_block, 11.5, 4 * block - 0.6);

            translate([
                18.5/2 + 0.5, -block/2 + 7 * block,
                ( 4 * block - 0.6)/2
            ])
            rotate([0, 0, 90])
            _support(s_block, 18.5, 4 * block - 0.6);
        }
        translate([
            block/2, 50/2 - 1, 1.5 * block
        ])
        cube([0.1, 50, 0.2], center=true);
    }

    // bottom left
    difference() {
        union() {
            translate([
                11.5/2 + 5 * block + 0.5,
                6 * block + block/2, 1.5 * block
            ])
            rotate([0, 0, 90])
            _support(s_block, 11.5, block - 1.2);

            translate([
                6 * block + block/2,
                4 * block + 18.5/2 - 0.3,
                1.5 * block
            ])
            _support(s_block, 18.5, block - 1.2);

            translate([
                6 * block + block/2,
                12.6/2 + 2 * block - 0.3,
                (3 * block - 0.6)/2
            ])
            _support(s_block, 12.6, 3 * block - 0.6);

            translate([
                6 * block + block/2, 12/2 + 0.3,
                (4 * block - 0.6)/2
            ])
            _support(s_block, 12, 4 * block - 0.6);

            translate([
                7 * block - 18.5/2 - 0.4, block/2,
                (4 * block - 0.6)/2
            ])
            rotate([0, 0, 90])
            _support(s_block, 18.5, 4 * block - 0.6);
        }
        translate([
            6.5 * block, 50/2 - 1, 1.5 * block
        ])
        cube([0.1, 50, 0.2], center=true);
    }

    // towers
    if (one) {
        union() {
            translate([2.5 * block + 0.2, 5 * block, 0])
            intersection() {
                rotate([7.7, 0, 0])
                tube(
                    d=10, h=100, wall=0.55,
                    center=true, $fn=40
                );

                translate([0, 0, (4 * block - 0.6)/2])
                cube(
                    [40, 40, 4 * block - 0.6],
                    center=true
                );
            }
            translate([
                2.5 * block + 0.2, 4.5 * block,
                4 * block - 0.6 - 1
            ])
            cylinder(d=10, h=1, $fn=40);
        }
        // brim
        translate([
            3 * block - 3, 5.3 * block, 0.2/2
        ])
        cube([5, 14, 0.2], center=true);

        translate([
            2.4 * block - 3, 5 * block, 0.2/2
        ])
        cube([19, 5, 0.2], center=true);
    } else {
        union() {
            translate([2.5 * block - 3, 4.5 * block, 0])
            intersection() {
                rotate([0, 7.5])
                tube(
                    d=10, h=100, wall=0.55,
                    center=true, $fn=40
                );

                translate([0, 0, (4 * block - 0.6)/2])
                cube(
                    [40, 40, 4 * block - 0.6],
                    center=true
                );
            }
            translate([
                2.5 * block + 0.2, 4.5 * block,
                4 * block - 0.6 - 1
            ])
            cylinder(d=10, h=1, $fn=40);
        }

        // brim
        translate([
            2.5 * block - 3, 5 * block, 0.2/2
        ])
        cube([5, 19, 0.2], center=true);

        translate([
            2.1 * block - 3, 4.5 * block, 0.2/2
        ])
        cube([15, 5, 0.2], center=true);
    }
    if (one) {
        union() {
            translate([4.5 * block, 2 * block, 0])
            intersection() {
                rotate([-7.7, 0])
                tube(
                    d=10, h=100, wall=0.55,
                    center=true, $fn=40
                );

                translate([0, 0, (4 * block - 0.6)/2])
                cube(
                    [40, 40, 4 * block - 0.6],
                    center=true
                );
            }
            translate([
                4.5 * block, 2.5 * block,
                4 * block - 0.6 - 1
            ])
            cylinder(d=10, h=1, $fn=40);
        }
        // brim
        translate([
            5 * block - 3, 1.8 * block, 0.2/2
        ])
        cube([5, 14, 0.2], center=true);

        translate([
            4.7 * block + 2, 2 * block, 0.2/2
        ])
        cube([19, 5, 0.2], center=true);
    } else {
        union() {
            translate([4.5 * block + 3.2, 2.5 * block, 0])
            intersection() {
                rotate([0, -7.5])
                tube(
                    d=10, h=100, wall=0.55,
                    center=true, $fn=40
                );

                translate([0, 0, (4 * block - 0.6)/2])
                cube(
                    [40, 40, 4 * block - 0.6],
                    center=true
                );
            }
            translate([
                4.5 * block, 2.5 * block,
                4 * block - 0.6 - 1
            ])
            cylinder(d=10, h=1, $fn=40);
        }
        // brim
        translate([
            5.5 * block - 3, 2 * block, 0.2/2
        ])
        cube([5, 19, 0.2], center=true);

        translate([
            5.1 * block + 2, 2.5 * block, 0.2/2
        ])
        cube([15, 5, 0.2], center=true);
    }

    // top left
    difference() {
        union() {
            translate([
                12/2 + 0.2, 6.5 * block,
                5.5 * block
            ])
            rotate([0, 0, 90])
            _support(s_block, 12, block - 1.2);

            translate([
                block/2, 7 * block - 18/2 - 0.5,
                5.5 * block
            ])
            _support(s_block, 18, block - 1.2);

            translate([
                1.5 * block - 0.5, 4.5 * block,
                6 * block - 1
            ])
            cube([block, s_block, 0.8], center=true);

            hull() {
                translate([
                    2 * block - 0.5/2 - 0.7,
                    4.5 * block, 6 * block - 1.1
                ])
                cube([0.5, s_block, 1], center=true);

                translate([
                    block, 4.5 * block,
                    5 * block+1.1
                ])
                cube([0.5, s_block, 1], center=true);
            }
        }
        translate([
            0.5 * block, 50/2 - 1, 5.5 * block
        ])
        cube([0.1, 50, 0.2], center=true);
    }

    // top right
    difference() {
        union() {
            translate([
                7 * block - 12/2 - 0.2,
                0.5 * block, 5.5 * block
            ])
            rotate([0, 0, 90])
            _support(s_block, 12, block - 1.2);

            translate([
                6.5 * block, 18/2 + 0.5,
                5.5 * block
            ])
            _support(s_block, 18, block - 1.2);

            translate([
                5.5 * block + 0.5, 2.5 * block,
                6 * block - 1
            ])
            cube([block, s_block, 0.8], center=true);

            hull() {
                translate([
                    5 * block + 0.5/2 + 0.7,
                    2.5 * block, 6 * block - 1.1
                ])
                cube([0.5, s_block, 1], center=true);

                translate([
                    6 * block, 2.5 * block,
                    5 * block + 1.1
                ])
                cube([0.5, s_block, 1], center=true);
            }
        }
        translate([6.5 * block, 50/2 - 1, 5.5 * block])
        cube([0.1, 50, 0.2], center=true);
    }
}

module p1_solubles() {
    _p_solubles(one=true);
}

module p2_solubles() {
    _p_solubles(one=false);
}

module _p_solubles(one=true) {
    color("grey")
    difference() {
        union() {
            // bottom left
            translate([
                11.5/2 + 0.6, block/2,
                block + 0.65/2 - 0.05
            ])
            cube([11.5, s_block, 0.65], center=true);

            translate([
                11.5/2 + 0.5, block/2,
                2 * block - 0.7/2 + 0.1
            ])
            cube([11.5, s_block, 0.7], center = true);

            translate([
                block/2, 18/2 + 0.4,
                block + 0.65/2 - 0.05
            ])
            cube([s_block, 18, 0.65], center=true);

            translate([
                block/2, 18.5/2 + 0.3,
                2 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 18.5, 0.7], center=true);

            translate([
                block/2, 12/2 + 3 * block + 0.35,
                3 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 12, 0.7], center=true);

            translate([
                block/2, 12/2 + 5 * block + 0.4,
                4 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 12, 0.7], center=true);

            translate([
                18/2 + 0.5, 6.5 * block,
                4 * block - 0.7/2 + 0.1
            ])
            cube([18, s_block, 0.7], center=true);

            // bottom right
            translate([
                7 * block - 11.5/2 - 0.6,
                6.5 * block, block + 0.65/2 - 0.05
            ])
            cube([11.5, s_block, 0.65], center=true);

            translate([
                7 * block - 11.5/2 - 0.5,
                6.5 * block, 2 * block - 0.7/2 + 0.1
            ])
            cube([11.5, s_block, 0.7], center=true);

            translate([
                6.5 * block, 7 * block - 18/2 - 0.3,
                block + 0.65/2 - 0.05
            ])
            cube([s_block, 18, 0.65], center=true);

            translate([
                6.5 * block, 7 * block - 18/2 - 0.3,
                2 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 18, 0.7], center=true);

            translate([
                6.5 * block,
                12/2 + 2 * block + 0.15,
                3 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 12, 0.7], center=true);

            translate([
                6.5 * block, 12/2 + 0.2,
                4 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 12, 0.7], center=true);

            translate([
                7 * block - 18/2 - 0.5,
                0.5 * block,
                4 * block - 0.7/2 + 0.1
            ])
            cube([18, s_block, 0.7], center=true);


            // top left
            translate([
                12/2 + 0.2, 6.5 * block,
                5 * block + 0.65/2 - 0.05
            ])
            cube([12, s_block, 0.65], center=true);

            translate([
                12/2 + 0.2, 6.5 * block,
                6 * block - 0.7/2 + 0.1
            ])
            cube([12, s_block, 0.7], center=true);

            translate([
                block/2, 7 * block - 18/2 - 0.5,
                5 * block + 0.65/2 - 0.05
            ])
            cube([s_block, 18, 0.65], center=true);

            translate([
                block/2, 7 * block - 18/2 - 0.5,
                6 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 18, 0.7], center=true);

            translate([
                11.5/2 + 0.5, 4.5 * block,
                6 * block - 0.7/2 + 0.1
            ])
            cube([11.7, s_block, 0.7], center=true);


            // top right
            translate([
                7 * block - 12/2 - 0.2,
                0.5 * block,
                5 * block + 0.65/2 - 0.05
            ])
            cube([12, s_block, 0.65], center=true);

            translate([
                7 * block - 12/2 - 0.2,
                0.5 * block,
                6 * block - 0.7/2 + 0.1
            ])
            cube([12, s_block, 0.7], center=true);

            translate([
                6.5 * block, 18/2 + 0.5,
                5 * block + 0.65/2 - 0.05
            ])
            cube([s_block, 18, 0.65], center=true);

            translate([
                6.5 * block, 18/2 + 0.5,
                6 * block - 0.7/2 + 0.1
            ])
            cube([s_block, 18, 0.7], center=true);

            translate([
                7 * block - 11.7/2 - 0.5,
                2.5 * block,
                6 * block - 0.7/2 + 0.1
            ])
            cube([11.7, s_block, 0.7], center=true);


            // towers
            translate([
                2.5 * block + 0.1, 4.5 * block,
                4 * block - 0.6 + 1/2
            ])
            chamfered_cube_side(
                8, 8, 1, 0.7, center=true
            );

            translate([
                4.5 * block, 2.5 * block,
                4 * block - 0.6 + 1/2
            ])
            chamfered_cube_side(
                8, 8, 1, 0.7, center=true
            );
        }

        if (one) {
            p1(infill=false);
        } else {
            p2(infill=false);
        }
    }
}
