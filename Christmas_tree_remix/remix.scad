use <../lib/electric.scad>;
use <../Dollo/NEW_long_ties/include.scad>;


//_orig_tree_trunk_texture();
//_orig_short_base_set();
//_orig_short_base_arm();
//_orig_short_base_center();
//_orig_xmas_tree();

//debug_trunk_stand();

//stand();
//center();
//screw_cap();
//screw_washer();
//trunk_stand_g9();
trunk_stand_bottom_lid();
//trunk_center();
//new_xmas_tree();
//xmas_tree_star();
//xmas_tree_ornament_big();
//xmas_tree_ornament_big(support=true);
//xmas_tree_ornament_medium();
//xmas_tree_ornament_medium(support=true);
//xmas_tree_ornament_small();
//xmas_tree_ornament_small(support=true);



stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Christmas_tree/"
);

module _orig_tree_trunk_texture() {
    translate([0, 0, 65.74])
    import(
        str(spath, "tree_trunk_texture.stl"),
        convexity=10
    );
}

module _orig_short_base_set() {
    translate([-70, -90, 0])
    import(
        str(spath, "short_base_set.stl"),
        convexity=10
    );
}

module _orig_short_base_arm() {
    translate([-70, -70, 0])
    import(
        str(spath, "short_base_arm.stl"),
        convexity=10
    );
}

module _orig_short_base_center() {
    translate([-72.5, -73.42, 0])
    import(
        str(spath, "short_base_center.stl"),
        convexity=10
    );

    //%cylinder(d=27, h=1, $fn=40);
}

module _orig_xmas_tree() {
    translate([0, 0, 155])
    import(
        str(spath, "xmas_tree_idig3d.stl"),
        convexity=10
    );

    //%cylinder(d=27, h=1, $fn=40);
}

module debug_trunk_stand() {
    render()
    intersection() {
        trunk_stand_g9();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    rotate([0, 0, 45])
    trunk_stand_bottom_lid();

    intersection() {
        rotate([0, 0, 35])
        translate([0, 0, 64 + 2.5])
        rotate([180, 0, 0])
        trunk_center();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    translate([-5, -49.5, 64 + 1.2])
    rotate([30.7, 0, 180])
    rotate([0, -90, 0])
    _orig_short_base_arm();

    %translate([0, 0, 52.8])
    mock_g9_lamp_socket();

    %translate([0, 0, 73])
    rotate([0, 0, 80])
    mock_g9_lamp();

    %translate([0, 0, 71])
    rotate([0, 0, -18])
    new_xmas_tree();

    translate([0, 0, 346])
    rotate([90, 0, 0])
    xmas_tree_star();

    for(i = [0:4]) {
        translate([0, 0, 71 - 17])
        rotate([-45, 0, i*360/5])
        translate([0, -71, 0])
        rotate([55, 180, 0])
        xmas_tree_ornament_big();
    }

    for(i = [0:4]) {
        translate([0, 0, 71 + 25.7])
        rotate([-55, 0, 36 + i*360/5])
        translate([0, -65, 0])
        rotate([55, 180, 0])
        xmas_tree_ornament_medium();
    }

    for(i = [0:4]) {
        translate([0, 0, 71 + 101.2])
        rotate([-55, 0, i*360/5])
        translate([0, -55, 0])
        rotate([55, 180, 0])
        xmas_tree_ornament_small();
    }
}

module stand() {
    
    module leg() {
        intersection() {
            translate([-70, 0, -3])
            rotate([0, 45, 0])
            cylinder(d=15, h=100, $fn=10);

            translate([0, 0, 200/2])
            cube([200, 200, 200], center=true);
        }
        
    }
    difference() {
        union() {
            for(i = [0:2]) {
                rotate([0, 0, 120*i])
                leg();
            }
            translate([0, 0, 57])
            cylinder(d1=17, d2=27, h=10, $fn=40);

            translate([0, 0, 66])
            cylinder(d=23, h=11, $fn=40);

            translate([0, 0, 66.9])
            v_screw(h=10.1, screw_d=26.5, pitch=3, direction=0, steps=50);

            translate([0, 0, 63])
            g9_lamp_socket_diy(54);
            
        }
        //translate([0, 0, 47])
        //cylinder(d1=8, d2=15, h=30, $fn=30);

        translate([14/2 -3.3/2, 1.15, 47])
        cylinder(d=3.3, h=30, $fn=30);

        translate([-14/2 + 3.3/2, 1.15, 47])
        cylinder(d=3.3,h=30,$fn=30);
    }
}

module center() {
    difference() {
        union() {
            translate([-72.5, -73.4, 0])
            import(
                "../_downloaded/Christmas_tree/short_base_center.stl"
            );

            cylinder(d=31.5, h=10, $fn=40);
        }
        translate([0, 0, -1])
        v_screw(h=13, screw_d=27, pitch=3, direction=0, steps=50);
    }
}

module screw_cap() {
    h = 8;
    d = 7;

    difference() {
        intersection() {
            union() {
                cylinder(d=d, h=h, $fn=30);
                for(i = [0:9]) {
                    rotate([0, 0, 360/10*i])
                    translate([d/2, 0, 0])
                    cylinder(d=3, h=h, $fn=20);
                }
            }
            chamfered_cylinder(d + 3, h, 0.8, $fn=30);
        }
        M3_nut(3.4, cone=false, bridging=true);
        cylinder(d=3.3, h=h + 1, $fn=20);

        translate([0, 0, 4.6])
        cylinder(d=6.5, h=h, $fn=30);
    }
}

module screw_washer() {
    difference() {
        cylinder(d=6.2, h=3, $fn=40);
        cylinder(d=2.9, h=3, $fn=40);
    }
}

module trunk_stand_g9() {
    difference() {
        union() {
            intersection() {
                _orig_tree_trunk_texture();

                union() {
                    cylinder(d=200, h=55);

                    chamfered_cylinder(
                        53, 60, 5, $fn=50
                    );
                }
            }
            cylinder(d=42, h=60);

            translate([0, 0.3, -19])
            intersection() {
                rotate([0, 0, -2])
                _orig_tree_trunk_texture();

                translate([0, -20, 48])
                rounded_cube(27, 15, 22, 3, center=true, $fn=30);
            }
        }

        translate([0, 0, 60 + 13.5 - 7.2])
        rotate([180, 0, 0])
        v_screw(
            h=13.5, screw_d=32.6, pitch=2,
            depth=0.6, direction=0, steps=80, chamfer=true
        );

        rotate([0, 0, 40])
        translate([0, 17/2, 0])
        cylinder(d=2.7, h=200, center=true, $fn=30);

        rotate([0, 0, 40])
        translate([0, -17/2, 0])
        cylinder(d=2.7, h=200, center=true, $fn=30);

        rotate([0, 0, -40])
        translate([0, 17/2, 20])
        cylinder(d=7.1, h=40, $fn=30);

        rotate([0, 0, -40])
        translate([0, -17/2, 20])
        cylinder(d=7.1, h=40, $fn=30);

        difference() {
            chamfered_cylinder(
                38, 91, 18.8, center=true, $fn=50
            );

            rotate([0, 0, 45])
            translate([0, 38/2, 12/2 + 3.4])
            rounded_cube_side(
                8, 16, 12, 8, center=true, $fn=30
            );

            rotate([0, 0, 45])
            translate([0, -38/2, 12/2 + 3.4])
            rounded_cube_side(
                8, 16, 12, 8, center=true, $fn=30
            );
        }

        rotate([0, 0, 45])
        translate([0, 38/2 - 4, 0])
        cylinder(d=2.7, h=15, $fn=30);

        rotate([0, 0, 45])
        translate([0, -38/2 + 4, 0])
        cylinder(d=2.7, h=15, $fn=30);

        translate([0, -15, 5])
        rotate([97, 0, 0])
        cylinder(d=6.5, h=20, $fn=30);

        translate([0, -20, 0])
        cube([4, 20, 5], center=true);
    }
}

module trunk_stand_bottom_lid() {
    difference() {
        cylinder(d=37.5, h=2.8, $fn=50);

        translate([0, 38/2 - 4, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, -38/2 + 4, 0])
        cylinder(d=3.2, h=20, center=true, $fn=30);

        translate([0, 38/2 - 4, -4])
        chamfered_cylinder(6.3, 6.4, 1.6, $fn=30);

        translate([0, -38/2 + 4, -4])
        chamfered_cylinder(6.3, 6.4, 1.6, $fn=30);

        rotate([0, 0, -45])
        translate([0, -20, 2.3])
        rotate([30, 0, 0])
        cube([9, 10, 4], center=true);
    }
}

module trunk_center() {
    difference() {
        union() {
            hull() {
                translate([-72.5, -73.4, 0])
                import(
                    "../_downloaded/Christmas_tree/short_base_center.stl"
                );

                cylinder(d=43, h=6.5, $fn=80);
            }

            v_screw(
                h=13.5, screw_d=32, pitch=2,
                depth=0.6, direction=0, steps=80, chamfer=true
            );
        }
        cylinder(d=27, h=50, center=true, $fn=50);

        translate([0, 0, -8.5])
        chamfered_cylinder(
            31, 10, 3, $fn=50
        );

        for(i = [0:4]) {
            rotate([0, 0, i*360/5])
            translate([0, 19.722, 0])
            cube([11, 2.4, 10], center=true);

            rotate([0, 0, i*360/5])
            translate([0, 19.722, 10/2 + 2.1])
            chamfered_cube(12, 3.4, 10, 0.5, center=true);

            rotate([0, 0, i*360/5])
            translate([0, 19.722, -10/2 + 0.4])
            chamfered_cube(12, 3.4, 10, 0.5, center=true);

            rotate([0, 0, i*360/5])
            translate([0, 23.722, 10/2 + 2.5])
            cube([12, 13.4, 10], center=true);
        }
    }
}

module new_xmas_tree() {
    difference() {
        scale([1.025, 1.025, 1])
        _orig_xmas_tree();
        
        translate([0, 0, -1])
        cylinder(d1=45, d2=12.4, h=242, $fn=30);

        translate([0, 0, 240])
        cylinder(d=12.4, h=50, $fn=30);

        translate([0, 0, 260])
        cylinder(d=100, h=50);

        for(i = [0:4]) {
            translate([0, 0, -17])
            rotate([45, 0, 18 + i*360/5])
            cylinder(d=8, h=300, $fn=30);
        }

        for(i = [0:4]) {
            translate([0, 0, 25.7])
            rotate([35, 0, -18 + i*360/5])
            cylinder(d=6, h=300, $fn=30);
        }

        for(i = [0:4]) {
            translate([0, 0, 101.2])
            rotate([35, 0, 18 + i*360/5])
            cylinder(d=3.5, h=300, $fn=30);
        }
    }
}

module xmas_tree_star() {
    angle = 360/5;
    h1 = 5;
    h2 = 10;

    union() {
        for(i = [0:4])
        rotate([0, 0, i*angle])
        hull() {
            cylinder(d=10, h=h1, center=true, $fn=30);
            cylinder(d=8, h=h2, center=true, $fn=30);

            translate([0, 22, 0])
            cylinder(d=2, h=h1, center=true,  $fn=20);

            translate([0, 20, 0])
            cylinder(d=1, h=h2, center=true,  $fn=20);

            rotate([0, 0, angle*2])
            translate([0, 22, 0])
            cylinder(d=2, h=h1, center=true,  $fn=20);

            rotate([0, 0, angle*2])
            translate([0, 20, 0])
            cylinder(d=1, h=h2, center=true,  $fn=20);
        }

        intersection() {
            translate([0, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=12, h=40, $fn=30);

            cube([100, 100, 10], center=true);
        }
    }
}

module xmas_tree_ornament_big(support=false) {
    intersection() {
        rotate([35, 0, 0])
        union() {
            translate([0, 0, -2])
            cylinder(d=7.5, h=50, $fn=30);

            translate([0, 1.3, 50])
            sphere(d=12, $fn=30);
        }

        cylinder(d=2000, h=200);
    }

    if(support) {
        difference() {
            translate([0, -33, 36/2])
            cube([10, 8, 36], center=true);

            translate([0, -33.5, 0])
            cube([9, 8, 100], center=true);

            translate([0, -44, 0])
            rotate([-12, 0, 0])
            cube([20, 10, 100], center=true);
        }
    }
}

module xmas_tree_ornament_medium(support=false) {
    intersection() {
        rotate([35, 0, 0])
        union() {
            translate([0, 0, -2])
            cylinder(d=5.5, h=50, $fn=30);

            translate([0, 2, 50])
            sphere(d=10, $fn=30);
        }

        cylinder(d=2000, h=200);
    }

    if(support) {
        difference() {
            translate([0, -33, 38/2])
            cube([10, 8, 38], center=true);

            translate([0, -33.5, 0])
            cube([9, 8, 100], center=true);

            translate([0, -44, 0])
            rotate([-12, 0, 0])
            cube([20, 10, 100], center=true);
        }
    }    
}

module xmas_tree_ornament_small(support=false) {
    intersection() {
        rotate([35, 0, 0])
        union() {
            translate([0, 0, -2])
            cylinder(d=3, h=30, $fn=30);

            translate([0, 1.6, 29.8])
            sphere(d=7, $fn=30);
        }

        cylinder(d=2000, h=200);
    }

    if(support) {
        difference() {
            translate([0, -20.8, 22.2/2])
            cube([10, 8, 22.2], center=true);

            translate([0, -21.3, 0])
            cube([9, 8, 100], center=true);

            translate([0, -30, 0])
            rotate([-12, 0, 0])
            cube([20, 10, 100], center=true);
        }
    } 
}