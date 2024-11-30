use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Stackable Box V4/"
);


//_orig_stackable_vox_v4();
//_orig_stackable_vox_v4_half();
//debug();

//stackable_box_v4_remix();
//stackable_box_half_v4_remix();

//stackable_box_v4_remix_125_percent();
stackable_box_half_v4_remix_125_percent();

//stackable_box_v4_remix_150_percent();
//stackable_box_half_v4_remix_150_percent();

//stackable_box_v4_remix_200_percent();


module _orig_stackable_vox_v4() {
    translate([60, 0, 20])
    rotate([0, 0, -90])
    import(
        str(
            spath,
            "stack_box.stl"
        ),
        convexity=10
    );
}

module _orig_stackable_vox_v4_half() {
    translate([60, 0, 20])
    rotate([0, 0, -90])
    import(
        str(
            spath,
            "stack_box_half.stl"
        ),
        convexity=10
    );
}

module debug() {
    wall = 1;

    //%_orig_stackable_vox_v4();
    %_orig_stackable_vox_v4_half();

    intersection() {
        _stackable_box(wall=wall, half=true);

//        translate([100/2, 0, 0])
//        cube([100, 100, 100], center=true);
    }
    //cylinder(d=10, h=1);

    // positioning aids
//    translate([-40, 27, 0])
//    cylinder(d=0.1, h=1, $fn=50);

//    translate([-40 + wall/2, 112.2, 17.425])
//    sphere(d=0.1, $fn=50);
//
//    translate([-40 + wall/2, 112.2, 22.575])
//    sphere(d=0.1, $fn=50);

//    translate([-17.296, -1.7, 45])
//    sphere(d=0.1, $fn=50);
//    translate([
//        -14.296, 1.3, 45
//    ])
//    sphere(d=0.1, $fn=50);
//    translate([
//        -41.7, 27.704, 45
//    ])
//    sphere(d=0.1, $fn=50);
//    translate([
//        -41.7 + wall/2, 95, 48
//    ])
//    sphere(d=0.1, $fn=50);
}


module _stackable_box(h=48, wall=1, bottom=1, half=false) {
    h1 = h - 7.80;
    h2 = h - 4.85;
    h3 = h - 1;

    module _box_half_walls_bottom() {
        union() {
            // back wall
            hull() {
                translate([-40 + wall/2, wall/2, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-40 + wall/2, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([-18 - wall*0.205, wall/2, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-18 - wall*0.205, wall/2, h1])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([-18 - wall*0.205, wall/2, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-18 - wall*0.205, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([-15 - wall*0.205, wall/2 + 3, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -15 - wall*0.205, wall/2 + 3, h1
                ])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([0, wall/2 + 3, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([0, wall/2 + 3, h1])
                sphere(d=wall, $fn=50);

                translate([-15 - wall*0.205, wall/2 + 3, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-15 - wall*0.205, wall/2 + 3, h1])
                sphere(d=wall, $fn=50);
            }

            // side back wall
            hull() {
                translate([-40 + wall/2, wall/2, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-40 + wall/2, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([-40 + wall/2, 27 - wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -40 + wall/2, 27 - wall*0.205, h1
                ])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([-40 + wall/2, 27 - wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-40 + wall/2, 27 - wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-37 + wall/2, 30 - wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-37 + wall/2, 30 - wall*0.205, h1])
                sphere(d=wall, $fn=50);
            }

            // side middle wall
            hull() {
                translate([-37 + wall/2, 30 - wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-37 + wall/2, 30 - wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-37 + wall/2, 80 + wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-37 + wall/2, 80 + wall*0.205, h1])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([-37 + wall/2, 80 + wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-37 + wall/2, 80 + wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-40 + wall/2, 83 + wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-40 + wall/2, 83 + wall*0.205, h1])
                sphere(d=wall, $fn=50);
            }

            // side front wall
            hull() {
                translate([-40 + wall/2, 83 + wall*0.205, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-40 + wall/2, 83 + wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-40 + wall/2, 100 - wall/2, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([-40 + wall/2, 100 - wall/2, h1])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([-40 + wall/2, 100 - wall/2, 0])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -40 + wall/2, 99.6 - wall*0.26,
                    h1 - wall/2 + 0.44
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -40 + wall/2, 112.21 - wall/2,
                    17.55 + wall*0.05
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -40 + wall/2, 112.21 - wall/2,
                    22.45 - wall*0.05
                ])
                sphere(d=wall, $fn=50);
            }

            // front wall
            intersection() {
                hull() {
                    translate([
                        -40 + wall/2, 112.21 - wall/2,
                        17.55 + wall*0.05
                    ])
                    sphere(d=wall, $fn=50);

                    translate([
                        0, 112.21 - wall/2,
                        17.55 + wall*0.05
                    ])
                    sphere(d=wall, $fn=50);

                    translate([-40 + wall/2, 99.9 - wall/2, 0])
                    rotate([-35, 0, 0])
                    cylinder(d=wall, h=2, center=true, $fn=50);

                    translate([0, 99.9 - wall/2, 0])
                    rotate([-35, 0, 0])
                    cylinder(d=wall, h=2, center=true, $fn=50);
                }

                cylinder(d=250, h=h);
            }
            
            hull() {
                translate([
                    -40 + wall/2, 112.21 - wall/2,
                    17.55 + wall*0.05
                ])
                sphere(d=wall, $fn=50);

                translate([
                    0, 112.21 - wall/2,
                    17.55 + wall*0.05
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -40 + wall/2, 112.21 - wall/2,
                    22.45 - wall*0.05
                ])
                sphere(d=wall, $fn=50);

                translate([
                    0, 112.21 - wall/2,
                    22.45 - wall*0.05
                ])
                sphere(d=wall, $fn=50);
            }
        }
    }

    module _box_half_walls_slope() {
        union() {
            // back wall
            hull() {
                translate([-40 + wall/2, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([-18 - wall*0.21, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([-41.7 + wall/2, wall/2 - 1.7, h2])
                sphere(d=wall, $fn=50);

                translate([
                    -17.296 - wall*0.21, wall/2 - 1.7, h2
                ])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([-18 - wall*0.205, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -17.296 - wall*0.205, wall/2 - 1.7, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -15 - wall*0.205, wall/2 + 3, h1
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -14.296 - wall*0.205, wall/2 + 1.3, h2
                ])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([0, wall/2 + 3, h1])
                sphere(d=wall, $fn=50);

                translate([-15 - wall*0.205, wall/2 + 3, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -14.296 - wall*0.205, wall/2 + 1.3, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    0, wall/2 + 1.3, h2
                ])
                sphere(d=wall, $fn=50);
            }

            // side back wall
            hull() {
                translate([-40 + wall/2, wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -40 + wall/2, 27 - wall*0.205, h1
                ])
                sphere(d=wall, $fn=50);

                translate([-41.7 + wall/2, wall/2 - 1.7, h2])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);
            }

            hull() {
                translate([-40 + wall/2, 27 - wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-37 + wall/2, 30 - wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);
            }

            // side middle wall
            hull() {
                translate([-37 + wall/2, 30 - wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-37 + wall/2, 80 + wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);
            }

            hull() {

                translate([-37 + wall/2, 80 + wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-40 + wall/2, 83 + wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);
            }

            // side front wall
            hull() {
                translate([-40 + wall/2, 83 + wall*0.205, h1])
                sphere(d=wall, $fn=50);

                translate([-40 + wall/2, 100 - wall/2, h1])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 100 - wall/2, h2
                ])
                sphere(d=wall, $fn=50);
            }
        }
    }

    module _box_half_walls_top() {
        union() {
            // back wall
            hull() {
                translate([-41.7 + wall/2, wall/2 - 1.7, h2])
                sphere(d=wall, $fn=50);

                translate([
                    -17.296 - wall*0.21, wall/2 - 1.7, h2
                ])
                sphere(d=wall, $fn=50);

                translate([-41.7 + wall/2, wall/2 - 1.7, h3])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -17.296 - wall*0.21, wall/2 - 1.7, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

            }

            hull() {
                translate([
                    -17.296 - wall*0.205, wall/2 - 1.7, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -14.296 - wall*0.205, wall/2 + 1.3, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -17.296 - wall*0.205, wall/2 - 1.7, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -14.296 - wall*0.205, wall/2 + 1.3, h3
                ])
                cylinder(d=wall, h=1, $fn=50);
            }

            hull() {
                translate([
                    -14.296 - wall*0.205, wall/2 + 1.3, h2
                ])
                sphere(d=wall, $fn=50);

                translate([0, wall/2 + 1.3, h2])
                sphere(d=wall, $fn=50);

                translate([
                    -14.296 - wall*0.205, wall/2 + 1.3, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

                translate([0, wall/2 + 1.3, h3])
                cylinder(d=wall, h=1, $fn=50);
            }

            // side back wall
            hull() {
                translate([-41.7 + wall/2, wall/2 - 1.7, h2])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([-41.7 + wall/2, wall/2 - 1.7, h3])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);               
            }

            hull() {
                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);
            }

            // side middle wall
            hull() {
                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);
            }

            hull() {
                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);
            }

            // side front wall
            hull() {
                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 100 - wall/2, h2
                ])
                sphere(d=wall, $fn=50);

                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h3
                ])
                cylinder(d=wall, h=1, $fn=50);

                translate([
                    -41.7 + wall/2, 95.5 - wall/2, h3
                ])
                cylinder(d=wall, h=1, $fn=50);
            }
        }
    }

    module _noses_half() {
        union() {
            // front
            hull() {
                translate([-40 + wall/2, 83 + wall*0.205, h1])
                cylinder(d=wall, h=0.1, $fn=50);

                translate([-40 + wall/2, 100 - wall/2, h1])
                cylinder(d=wall, h=0.1, $fn=50);

                translate([
                    -41.7 + wall/2, 82.296 + wall*0.205, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -41.7 + wall/2, 100 - wall/2, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -38.7 + wall/2, 100 - wall/2, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -38.7 + wall/2, 79.296 + wall*0.205, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);
            }

            // back
            hull() {
                translate([-40 + wall/2, wall/2, h1])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -40 + wall/2, 27 - wall*0.205, h1
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([-41.7 + wall/2, wall/2 - 1.7, h2])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -41.7 + wall/2, 27.704 - wall*0.205, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -38.7 + wall/2, 30.704 - wall*0.205, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);

                translate([
                    -38.7 + wall/2, wall/2 - 1.7, h2
                ])
                cylinder(d=wall, h=0.1, center=true, $fn=50);
            }
        }
    }

    module _divider() {
        union() {
            hull() {
                translate([
                    0, wall/2 + 3, 0
                ])
                cylinder(d=wall, h=h1, $fn=50);

                translate([
                    0, 100 - wall/2, 0
                ])
                cylinder(d=wall, h=h1, $fn=50);

                translate([
                    0, 112.21 - wall/2,
                    17.55 + wall*0.05
                ])
                sphere(d=wall, $fn=50);

                translate([
                    0, 112.21 - wall/2,
                    22.45 - wall*0.05
                ])
                sphere(d=wall, $fn=50);
            }
        }
    }

    module _bottom() {
        linear_extrude(bottom)
        fill()
        projection(cut=true)
        intersection() {
            union() {
                _box_half_walls_bottom();

                mirror([1, 0, 0])
                _box_half_walls_bottom();
            }

            cylinder(d=1000, h=bottom);
        }
    }

    module _main() {
        union() {
            _box_half_walls_bottom();

            mirror([1, 0, 0])
            _box_half_walls_bottom();

            _box_half_walls_slope();

            mirror([1, 0, 0])
            _box_half_walls_slope();

            _box_half_walls_top();

            mirror([1, 0, 0])
            _box_half_walls_top();

            _noses_half();

            mirror([1, 0, 0])
            _noses_half();

            _bottom();

            if (half) {
                _divider();
            }
        }
    }

    _main();
}

module _pattern(h) {
    step = h*2 + 1;
    size = sqrt(h*h*2);

    translate([0, step*50])
    for(i = [0:99]) {
        translate([0, step/2 + i*step, 0])
        rotate([45, 0, 0])
        cube([500, size, size], center=true);

        translate([0, -step/2 - i*step, 0])
        rotate([45, 0, 0])
        cube([500, size, size], center=true);
    }
}

module _scaled_box(scaling, wall, bottom, half=false) {
    scale([scaling, scaling, scaling])
    _stackable_box(
        wall=wall/scaling, bottom=bottom/scaling,
        half=half
    );
}

module _bottom_pattern(h) {
    _pattern(h);
}

module stackable_box_v4_remix() {
    _stackable_box(wall=1, bottom=1, half=false);
}

module stackable_box_half_v4_remix() {
    _stackable_box(wall=1, bottom=1, half=true);
}

module stackable_box_v4_remix_150_percent(half=false) {

    difference() {
        _scaled_box(1.5, 1.2, 1.5, half=half);

        intersection() {
            _bottom_pattern(0.75);

            translate([0, 0, -1])
            linear_extrude(5)
            offset(-3)
            projection(cut=true)
            _scaled_box(1.5, 1.2, 1.5);
        }
    }
}

module stackable_box_v4_remix_125_percent(half=false) {

    difference() {
        _scaled_box(1.25, 1.1, 1.25, half=half);

        intersection() {
            _bottom_pattern(0.5);

            translate([0, 0, -1])
            linear_extrude(5)
            offset(-3)
            projection(cut=true)
            _scaled_box(1.25, 1.1, 1.25);
        }
    }
}

module stackable_box_half_v4_remix_125_percent() {
    stackable_box_v4_remix_125_percent(half=true);
}

module stackable_box_half_v4_remix_150_percent() {
    stackable_box_v4_remix_150_percent(half=true);
}


module stackable_box_v4_remix_200_percent(half=false) {

    difference() {
        _scaled_box(2, 1.7, 2, half=half);

        intersection() {
            _bottom_pattern(1.25);

            translate([0, 0, -1])
            linear_extrude(5)
            offset(-4)
            projection(cut=true)
            _scaled_box(2, 1.7, 2, half=half);
        }
    }
}