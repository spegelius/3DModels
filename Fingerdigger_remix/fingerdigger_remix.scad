use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
fd_stl_path = str(
    stl_base_path, "Fingerdigger/"
);

screw_d = 6;
screw_hole = screw_d + 0.2;

//_orig_arm_left();
//_orig_arm_lower();
//_orig_arm_right();
//_orig_axle();
//_orig_axle_1();
//_orig_base();
//_orig_bucket();
//_orig_pegs();

//original_assemby();
//new_assembly();
new_assembly_dc();

//debug_pegs();
//debug_axle();
//debug_base();

// For the original fingerdigger
//male_peg_small();
//male_peg_big();
//female_peg_small();
//female_peg_big();
//peg_plate();

// New models
//new_axle();
//new_axle_mount_screw();
//new_base();
//new_arm_top();
//new_arm_right();
//new_arm_left();
//new_bucket();

//new_axle_screw();
//new_bucket_screw();
//new_nut();
//new_washer();
//new_screws_nuts_plate();

//new_base_dc_black();
//new_base_dc_yellow();

//new_bucket_black();
//new_bucket_yellow();


module _orig_arm_left() {
    translate([-46.75, -182.65, 0])
    import(str(fd_stl_path, "Arm_Left.stl"));
}

module _orig_arm_lower() {
    translate([-76, -237, 0])
    import(str(fd_stl_path, "Arm_Lower.stl"));
}

module _orig_arm_right() {
    translate([-40, -120, 0])
    import(str(fd_stl_path, "Arm_Right.stl"));
}

module _orig_axle() {
    translate([-107.4, -154.3, 0])
    import(str(fd_stl_path, "Axle.stl"));
}

module _orig_axle_1() {
    translate([-105.35, -159.825, 0])
    import(str(fd_stl_path, "Axle-1.stl"));
}

module _orig_base() {
    translate([-76.03, -187.42, 0])
    import(str(fd_stl_path, "Base.stl"));
}

module _orig_bucket() {
    translate([-86, -118, 0])
    import(str(fd_stl_path, "Bucket.stl"));
}

module _orig_pegs() {
    translate([-78.8, -220.8, 0])
    import(
        str(fd_stl_path, "pegs.stl"),
        convexity=10
    );
}

module original_assemby() {
    color("darkgrey")
    _orig_base();

    translate([0, 0, 6])
    rotate([0, 0, 180])
    _orig_axle();

    translate([-8.5, 14, 95.5])
    rotate([180, 0, 90])
    _orig_arm_left();

    translate([22, 25.7, 41.5])
    _orig_arm_right();

    translate([-2, 54, 71.5])
    rotate([90, 0, 90])
    _orig_arm_lower();

    translate([3.5, 99.5, 45.5])
    rotate([0, 90, -90])
    _orig_bucket();
}

module new_assembly() {
    rotate([0, 0, 180])
    translate([0, 0, 6.2])
    new_axle();

    new_base();

    translate([0, 66.5, 70])
    rotate([0, 180, 0])
    new_arm_top();

//    %translate([-11.5, 11.5, 95.5])
//    rotate([180, 0, 90])
//    _orig_arm_left();

    translate([0, 13.7, 57.3])
    rotate([79.5, 0, 0])
    new_arm_left();

    translate([0, 64.3, 44.5])
    new_arm_right();

    translate([0, 117.3, 42])
    rotate([-90, 0, 180])
    new_bucket();

    translate([11.6, 11.3, 44.55])
    rotate([0, -90, 0])
    new_axle_screw();

    translate([8.6, 11.3, 44.55])
    rotate([0, -90, 0])
    new_washer();

    translate([-8, 11.3, 44.55])
    rotate([0, -90, 0])
    new_washer();

    translate([-8.6, 11.3, 44.55])
    rotate([0, -90, 0])
    new_nut();

    translate([11.2, 16, 70.1])
    rotate([0, -90, 0])
    new_axle_screw();

    translate([8.6, 117, 70.1])
    rotate([0, -90, 0])
    new_bucket_screw();

    translate([8.6, 117, 44.5])
    rotate([0, -90, 0])
    new_bucket_screw();
}

module new_assembly_dc() {
    color("yellow")
    render()
    rotate([0, 0, 180])
    translate([0, 0, 6.2])
    new_axle();

    color("black")
    render()
    new_base_dc_black();

    color("yellow")
    render()
    new_base_dc_yellow();

    color("black")
    render()
    translate([0, 66.5, 70])
    rotate([0, 180, 0])
    new_arm_top();

//    %translate([-11.5, 11.5, 95.5])
//    rotate([180, 0, 90])
//    _orig_arm_left();

    color("yellow")
    render()
    translate([0, 13.7, 57.3])
    rotate([79.5, 0, 0])
    new_arm_left();

    color("yellow")
    render()
    translate([0, 64.3, 44.5])
    new_arm_right();

//    translate([0, 117.3, 42])
//    rotate([-90, 0, 180])
//    new_bucket();

    color("black")
    render()
    translate([0, 117.3, 42])
    rotate([-90, 0, 180])
    new_bucket_black();

    color("yellow")
    render()
    translate([0, 117.3, 42])
    rotate([-90, 0, 180])
    new_bucket_yellow();

    color("yellow")
    render()
    translate([11.6, 11.3, 44.55])
    rotate([0, -90, 0])
    new_axle_screw();

    color("yellow")
    render()
    translate([8.6, 11.3, 44.55])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-8, 11.3, 44.55])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-8.6, 11.3, 44.55])
    rotate([0, -90, 0])
    new_nut();

    color("yellow")
    render()
    translate([11.6, 16, 70.1])
    rotate([0, -90, 0])
    new_axle_screw();

    color("yellow")
    render()
    translate([8.6, 16, 70.1])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-8, 16, 70.1])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-8.6, 16, 70.1])
    rotate([0, -90, 0])
    new_nut();

    color("yellow")
    render()
    translate([8.75, 117, 70.1])
    rotate([0, -90, 0])
    new_bucket_screw();

    color("yellow")
    render()
    translate([5.75, 117, 70.1])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-5.15, 117, 70.1])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-5.8, 117, 70.1])
    rotate([0, -90, 0])
    new_nut();

    color("yellow")
    render()
    translate([8.6, 117, 44.5])
    rotate([0, -90, 0])
    new_bucket_screw();

    color("yellow")
    render()
    translate([5.75, 117, 44.5])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-5.15, 117, 44.5])
    rotate([0, -90, 0])
    new_washer();

    color("yellow")
    render()
    translate([-5.8, 117, 44.5])
    rotate([0, -90, 0])
    new_nut();
}

module debug_pegs() {

    intersection() {
        female_peg_small();

        translate([0, 10/2, 0])
        cube([20, 10, 30], center=true);
    }

    intersection() {
        translate([10, 0, 0])
        female_peg_big();

        translate([10, 10/2, 0])
        cube([20, 10, 30], center=true);
    }
    
    intersection() {
        translate([0, 0, 10.6])
        rotate([180, 0, 0])
        male_peg_small();

        translate([0, 10/2, 0])
        cube([20, 10, 30], center=true);
    }

    intersection() {
        translate([10, 0, 14.6])
        rotate([180, 0, 0])
        male_peg_big();

        translate([10, 10/2, 0])
        cube([20, 10, 30], center=true);
    }
}

module debug_axle() {
    intersection() {
        new_axle();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    translate([0, 0, -5.2])
    rotate([0, 0, 180])
    new_axle_screw();
}

module debug_base() {
    intersection() {
        new_base();

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    translate([0, 0, 6.2])
    new_axle();

    translate([0, 0, 1])
    new_axle_screw();
}

module male_peg_small() {

    union() {
        translate([5.39, -5.26, 0])
        intersection() {
            _orig_pegs();

            translate([-5.39, 5.26, 0])
            cylinder(d=10, h=25, $fn=30);
        }

        cylinder(d=3.4, h=9.4, $fn=40);
    }

//    color("black")
//    cylinder(d=9, h=0.5, $fn=60);
}

module male_peg_big() {

    union() {
        translate([-5.41, -5.26, 0])
        intersection() {
            _orig_pegs();

            translate([5.41, 5.26, 0])
            cylinder(d=10, h=25, $fn=30);
        }

        cylinder(d=3.4, h=13.4, $fn=40);
    }

//    color("black")
//    cylinder(d=9, h=0.5, $fn=60);
}

module female_peg_small() {

    translate([5.39, 5.14, 0])
    intersection() {
        _orig_pegs();

        translate([-5.39, -5.14, 0])
        cylinder(d=10, h=25, $fn=30);
    }

//    color("black")
//    cylinder(d=9, h=0.5, $fn=60);
}

module female_peg_big() {

    translate([-5.61, 5.14, 0])
    intersection() {
        _orig_pegs();

        translate([5.61, -5.14, 0])
        cylinder(d=10, h=25, $fn=30);
    }

//    color("black")
//    cylinder(d=9, h=0.5, $fn=60);
}

module peg_plate() {

    translate([-5.5, 6, 0])
    male_peg_small();

    translate([-5.5, -6, 0])
    female_peg_small();

    translate([-16.5, 6, 0])
    male_peg_small();

    translate([-16.5, -6, 0])
    female_peg_small();

    translate([5.5, 6, 0])
    male_peg_big();

    translate([5.5, -6, 0])
    female_peg_big();

    translate([16.5, 6, 0])
    male_peg_big();

    translate([16.5, -6, 0])
    female_peg_big();
}

module new_axle() {
    module _axle_hook() {
        translate([-5/2, 0.15, 48])
        rotate([0, 90, 0])
        difference() {
            union() {
                intersection() {
                    tube(42, 5, 12, $fn=70);

                    union() {
                        rotate([0, 0, -42])
                        cube([50, 50, 50]);

                        rotate([0, 0, -50])
                        cube([50, 50, 50]);
                    }
                }
                rotate([0, 0, -50])
                translate([42/2 - 12/2, 0, 0])
                cylinder(d=12, h=5, $fn=70);

                rotate([0, 0, 48])
                translate([42/2 - 12/2, 0, 5/2])
                cube([12, 34, 5], center=true);

                rotate([0, 0, -50])
                translate([42/2 - 12/2, 10/2, 5/2])
                cube([12, 10, 5], center=true);
            }

            translate([-5, 24, 0])
            rotate([0, 0, -20])
            cube([10, 20, 20], center=true);

            rotate([0, 0, -50])
            translate([42/2 - 12/2, 0, 0])
            cylinder(d=screw_hole, h=25, center=true, $fn=70);
        }
    }

    difference() {
        union() {
            chamfered_cylinder(19, 30, 2, $fn=70);

            translate([0, 0, 30 - 7])
            chamfered_cylinder(25, 7, 3, $fn=70);

            _axle_hook();

            hull() {
                translate([0, 28, 60])
                sphere(d=24, $fn=70);

                translate([-5/2, 0.15, 48])
                rotate([0, 90, 0])
                rotate([0, 0, 48])
                translate([42/2 - 12/2, 12, 5/2])
                cube([12, 1, 5], center=true);
            }
        }

        translate([0, 28, 60])
        rotate([-30, 0, 0])
        translate([0, 0, 20/2])
        cube([40, 40, 20], center=true);

        translate([0, 28, 60])
        sphere(d=20, $fn=70);

        translate([0, 33.1, 69])
        sphere(d=30, $fn=70);

        translate([0, 0, -1])
        intersection() {
            v_screw(
                h=25, screw_d=13, pitch=1.5,
                direction=0, steps=50,
                depth=0, chamfer=true
            );

            hull() {
                cylinder(d=0.1, h=25, $fn=30);

                cylinder(d=50, h=0.1, $fn=30);
            }
        }
    }
}

module _new_base_leg() {
    translate([0, -43.4, 6/2])
    cube([10, 9, 6], center=true);    

    difference() {
        hull() {
            translate([0, -13 - 2/2, 20.6/2])
            cube([9, 2, 20.6], center=true);

            translate([0, -47.4, 6/2])
            cube([9, 1, 6], center=true);
        }

        hull() {
            translate([0, -17, 18])
            cube([4, 1, 5], center=true);

            translate([0, -44, 7.8])
            cube([4, 1, 5], center=true);
        }

        translate([0, -24.57, 7.51])
        rotate([0, 90, 0])
        cylinder(d=6, h=20, center=true, $fn=40);

        translate([3, -24.57, 7.51])
        rotate([0, 90, 0])
        cylinder(d=8.5, h=20, $fn=40);

        translate([-3, -24.57, 7.51])
        rotate([0, -90, 0])
        cylinder(d=8.5, h=20, $fn=40);
    }
}

module _new_base_leg_pad() {
    difference() {
        hull() {
            translate([0, -49, 0])
            cylinder(d=30, h=3, $fn=70);

            translate([0, -49, 0])
            cylinder(d=23, h=6, $fn=70);
        }

        translate([0, -49, 0])
        cylinder(d=20, h=20, center=true, $fn=70);
    }
}

module _new_base_body() {
    difference() {
        union() {
            cylinder(d=30, h=28, $fn=70);

            hull() {
                cylinder(d=23, h=30.5, $fn=70);

                cylinder(d=25.5, h=28, $fn=70);
            }
        }
        translate([0, 0, 29])
        chamfered_cylinder(25, 7, 3, $fn=70);

        translate([0, 0, 6])
        chamfered_cylinder(19.4, 30, 2.1, $fn=70);

        translate([0, 0, -13.9])
        chamfered_cylinder(19.4, 20, 2.1, $fn=70);

        cylinder(d=16, h=20, center=true, $fn=70);
    }
}

module new_base() {

    union() {
        _new_base_body();

        for(i = [0:2]) {
            rotate([0, 0, i*120])
            union() {
                _new_base_leg();
                _new_base_leg_pad();
            }
        }
    }
}

module new_axle_mount_screw() {
    difference() {
        union() {
            intersection() {
                translate([0, 0, -15])
                chamfered_cylinder(19, 20, 2, $fn=70);

                cylinder(d=100, h=20);
            }

            cylinder(d=15, h=5.2, $fn=70);

            translate([0, 0, 5])
            v_screw(
                h=18, screw_d=12.6, pitch=1.5,
                direction=0, steps=50,
                depth=0, chamfer=true
            );
        }

        hull() {
            translate([0, 0, -1])
            hexagon(6.9, 1);

            hexagon(6.2, 2);
        }

        hexagon(6.2, 30);
    }
}

module _arm(w, l) {
    difference() {
        hull() {
            translate([0, l/2, 0])
            rotate([0, 90, 0])
            cylinder(d=12, h=w, center=true, $fn=30);

            translate([0, -l/2, 0])
            rotate([0, 90, 0])
            cylinder(d=12, h=w, center=true, $fn=30);
        }

        translate([0, l/2, 0])
        rotate([0, 90, 0])
        cylinder(d=screw_hole, h=25, center=true, $fn=70);

        translate([0, -l/2, 0])
        rotate([0, 90, 0])
        cylinder(d=screw_hole, h=25, center=true, $fn=70);
    }
}

module new_arm_top() {
    _arm(5, 101);
}

module new_arm_right() {
    difference() {
        union() {
            _arm(10.3, 106);

            translate([20, -40, 47])
            sphere(d=24, $fn=70);

            translate([18/2, -37, 0])
            cube([11, 6, 12], center=true);

            translate([13, -37, -12/2 - 1])
            rotate([4, 9, 0])
            cylinder(d=9, h=45, $fn=70);
        }

        translate([0, 106/2, 0])
        rotate([45, 0, 0])
        cube([5.1, 12.2, 30], center=true);

        translate([0, 106/2, 0])
        rotate([-45, 0, 0])
        cube([5.1, 12.2, 30], center=true);

        translate([0, -106/2, 0])
        rotate([45, 0, 0])
        cube([5.1, 12.2, 30], center=true);

        translate([20, -40, 47])
        cylinder(d=26, h=20);

        translate([20, -40, 47])
        sphere(d=20, $fn=70);

        translate([20, -40, 57.2])
        sphere(d=30, $fn=70);

        translate([13, -40, -12/2 - 5])
        cylinder(d=20, h=5);
    }
}

module new_arm_left() {
    difference() {
        union() {
            _arm(16, 26);

            translate([-19, 36, 2])
            sphere(d=24, $fn=70);

            translate([
                -16/2 + 5.4/2, 25/2 + 10/2, 0
            ])
            cube([5.4, 10, 12], center=true);

            
            translate([
                -16/2 + 5.4, 25/2 + 10, 0
            ])
            rotate([0, 0, 45])
            translate([-5.4/2, 15/2, 0])
            cube([5.4, 15, 12], center=true);
        }

        translate([0, -26/2, 0])
        rotate([-35, 0, 0])
        cube([10.5, 12.2, 30], center=true);

        translate([0, -26/2, 0])
        rotate([40, 0, 0])
        cube([10.5, 12.2, 30], center=true);

        translate([0, 26/2, 0])
        rotate([-35, 0, 0])
        cube([5.2, 12.2, 30], center=true);

        translate([0, 26/2, 0])
        rotate([0, 90, 0])
        cylinder(d=screw_hole, h=25, center=true, $fn=70);

        translate([-20, 36, 2])
        rotate([10, 0, 0])
        translate([0, 20/2, 0])
        cube([30, 20, 30], center=true);

        translate([-19, 36, 2])
        sphere(d=20, $fn=70);

        translate([-19, 46.1, 3.9])
        sphere(d=30, $fn=70);
   }
}

module _new_bucket_arm() {
    union() {
        difference() {
            _arm(10.3, 56);

            translate([-15/2 - 5/2, 100/2 - 19, 0])
            chamfered_cube(
                15, 100, 30, 5, center=true
            );

            translate([15/2 + 5/2, 100/2 - 19, 0])
            chamfered_cube(
                15, 100, 30, 5, center=true
            );

            translate([0, -56/2, 0])
            rotate([-30, 0, 0])
            cube([5.2, 12.2, 30], center=true);

            translate([0, -2.5, 0])
            rotate([0, 90, 0])
            cylinder(d=screw_hole, h=25, center=true, $fn=70);

            translate([0, 29.1, 3/2])
            chamfered_cube(
                35, 15, 15, 1.2, center=true
            );        
        }

        translate([0, 17, 0])
        rotate([0, 90, 0])
        cylinder(d=screw_hole, h=12, center=true, $fn=70);
    }
}

module _new_bucket_bucket() {
    difference() {
        union() {
            hull() {
                translate([0, 24, 3/2])
                chamfered_cube(
                    35, 5, 15, 1.2, center=true
                );

                translate([0, 32, 18/2 - 12/2])
                rotate([0, 90, 0])
                chamfered_cylinder(
                    18, 35, 1.2, center=true, $fn=70
                );

                translate([0, 42, 20])
                cube([39, 0.1, 0.1], center=true);
            }

            hull() {
                translate([0, 17, 0])
                rotate([0, 90, 0])
                cylinder(d=12, h=10.3, center=true, $fn=40);

                translate([0, 25, 0])
                cube([10.3, 1, 12], center=true);
            }
            
        }

        hull() {
            translate([0, 25.5, 3.5])
            chamfered_cube(
                32, 5, 16, 0.2, center=true
            );

            translate([0, 32, 18/2 - 12/2])
            rotate([0, 90, 0])
            chamfered_cylinder(
                15, 32, 0.2, center=true, $fn=70
            );

            translate([0, 41, 21.5])
            cube([36, 0.1, 0.1], center=true);
        }
    }
}

module new_bucket() {
    union() {
        _new_bucket_arm();
        _new_bucket_bucket();
    }

//    %translate([0, 0, -5.5])
//    rotate([0, 0, 90])
//    _orig_bucket();
}

module _screw(l) {
    union() {
        hexagon(9.9, 3);

        cylinder(d=screw_d, h=l - 1, $fn=30);

        translate([0, 0, l - 1])
        v_screw(
            h=4.1, screw_d=screw_d + 0.1, pitch=0.8,
            direction=0, steps=40,
            depth=0.2, chamfer=true
        );
    }
}

module new_axle_screw() {
    _screw(20);
}

module new_bucket_screw() {
    _screw(14.3);
}

module new_washer() {
    difference() {
        cylinder(d=11, h=0.6, $fn=20);

        cylinder(
            d=screw_hole + 0.2, h=5,
            center=true, $fn=20
        );
    }
}

module new_nut() {
    difference() {
        cylinder(d=11, h=3, $fn=6);

        translate([0, 0, -1])
        v_screw(
            h=5, screw_d=screw_d + 0.4, pitch=0.8,
            direction=0, steps=40,
            depth=0.2, chamfer=true
        );
    }
}

module new_base_dc_black() {
    for(i = [0:2]) {
        rotate([0, 0, i*120])
        difference() {
            _new_base_leg();
            _new_base_leg_pad();
        }
    }
}

module new_base_dc_yellow() {
    union () {
        difference() {
            _new_base_body();

            for(i = [0:2]) {
                rotate([0, 0, i*120])
                _new_base_leg();
            }
        }

        for(i = [0:2]) {
            rotate([0, 0, i*120])
            _new_base_leg_pad();
        }
    }
}

module new_bucket_black() {
    difference() {
        _new_bucket_bucket();
        _new_bucket_arm();
    }
}

module new_bucket_yellow() {
    _new_bucket_arm();
}

module new_screws_nuts_plate() {
    translate([-17, -12, 0])
    new_axle_screw();

    translate([-4, -12, 0])
    new_axle_screw();

    translate([-17, 0, 0])
    new_bucket_screw();

    translate([-4, 0, 0])
    new_bucket_screw();

    translate([9, -12, 0])
    new_nut();

    translate([22, -12, 0])
    new_nut();

    translate([9, 0, 0])
    new_nut();

    translate([22, 0, 0])
    new_nut();

    translate([-17, 12, 0])
    new_washer();

    translate([-4, 12, 0])
    new_washer();

    translate([9, 12, 0])
    new_washer();

    translate([22, 12, 0])
    new_washer();

    translate([-17, 24, 0])
    new_washer();

    translate([-4, 24, 0])
    new_washer();

    translate([9, 24, 0])
    new_washer();

    translate([22, 24, 0])
    new_washer();

}