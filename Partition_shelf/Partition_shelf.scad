
include<../Dollo/NEW_long_ties/include.scad>;

height = 220;
partition_w = 40;
slop = 0.2;

plate_w = 240;
plate_l = 150;
plate_corner = 10;

$fn = 50;

//debug_plate();
//debug();
debug_corner();

//side();
//mirror([1,0,0]) side();
//corner();
//center();
//plate();
//plate_corner();
//plate_corner_2();
//tie();


module _dove_shape(height=30) {
    union() {
        dovetail_3d(
            max_width=11, min_width=5, depth=3, height=height
        );

        translate([0, 3 + 1/2 - 0.05, height/2])
        cube([11, 1.1, height], center=true);

        translate([0, -0.4/2, height/2])
        cube([5, 0.4, height], center=true);
    }
}

module debug_plate() {
    intersection() {
        plate();

        translate([0, 0, -1.5])
        cube([100, 100, 20]);
    }
    //cube([2, 2, 4], center=true);
}

module debug() {
    translate([240/2 + 15.2 - 4, -3, 0])
    rotate([90, 0, -90])
    side();

    mirror([1, 0, 0])
    translate([240/2 + 15.2 - 4, -3, 0])
    rotate([90, 0, -90])
    side();

    translate([0, -150/2, 6/2])
    plate();
}

module debug_corner() {
    rotate([90, 0, -90])
    corner();

    translate([
        -plate_w/2 - 5.8, -plate_l/2 + 3.6, 3
    ])
    plate_corner();

    translate([
        -plate_l/2 + 3.6, -plate_w/2- 5.8, 3
    ])
    rotate([0, 0, -90])
    plate_corner_2();
}


module dove_cutout(height) {
    scale_x = (11 + slop)/11;
    scale_y = (3 + slop)/3;

    union() {
        rotate([-90, 0, -90])
        scale([scale_x, scale_y, 1])
        _dove_shape(height);

        translate([height/2, 0, 0])
        cube([height, 5.6, 0.9], center=true);
    }
}

//dove_cutout(20);

module _hook_form() {
    difference() {
        union() {
            chamfered_cube(25, height, 15, 4);

            translate([-partition_w - 10, height - 20, 0]) 
            chamfered_cube(partition_w + 35, 20, 15, 4);
        }
        
        translate([-partition_w, height - 20, 0])
        cube([partition_w, 10, 21]);

        // custom infill
        translate([25/2, height/2, 15/2])
        cube([0.1, height + 1, 0.2] ,center=true);

        translate([
            -(partition_w + 35)/2 + 25, height-5, 15/2
        ])
        cube([partition_w + 36, 0.1, 0.2], center=true);
    }
}

module _dove_cutouts() {
    y_pos = [12, height - 50, height/2];

    // custom infill
    for (y = y_pos) {
        translate([-1, y, 15])
        dove_cutout(30);

        translate([5, y - 5, 15])
        rotate([-45, 0, 0])
        cube([0.1, 0.1, 10], center=true);

        translate([25/2, y - 5, 15])
        rotate([-45, 0, 0])
        cube([0.1, 0.1, 10], center=true);

        translate([25 - 5, y - 5, 15])
        rotate([-45, 0, 0])
        cube([0.1, 0.1, 10], center=true);

        translate([5, y + 5, 15])
        rotate([45, 0, 0])
        cube([0.1, 0.1, 10], center=true);

        translate([25/2, y + 5, 15])
        rotate([45, 0, 0])
        cube([0.1, 0.1, 10], center=true);

        translate([25 - 5, y + 5, 15])
        rotate([45, 0, 0])
        cube([0.1, 0.1, 10], center=true);
    }
}

module side() {
    difference() {
        _hook_form();
        _dove_cutouts();
    }
}

module center() {
    difference() {
        translate([25, 0, 15])
        rotate([0, 180,0])
        side();

        _dove_cutouts();
    }
}

module corner() {
    difference() {
        union() {
            translate([
                sqrt(15*15/2), 0, -sqrt(4*4/2)
            ])
            rotate([0, -45, 0])
            chamfered_cube(25, height, 15, 4);

            translate([-partition_w - 10, height - 20, 0]) 
            chamfered_cube(
                partition_w + 10 + sqrt(15*15/2) + sqrt(4*4/2),
                20, 15, 4
            );
        }
        
        translate([-partition_w, height - 20, 0])
        cube([partition_w, 10, 21]);

        // custom infill
        #translate([25/2, height/2, 15/2 + 3])
        cube([0.1, height + 1, 0.2], center=true);

        translate([
            -(partition_w + 35)/2 + 25, height - 5, 15/2
        ])
        cube([partition_w + 36, 0.1, 0.2], center=true);

        translate([sqrt(15*15/2), 0, -sqrt(4*4/2)])
        rotate([0, -45, 0])
        _dove_cutouts();

        translate([sqrt(15*15/2), 0, -sqrt(4*4/2)])
        rotate([0, -45, 0])
        translate([0, 0, 15])
        mirror([0, 0, 1])
        _dove_cutouts();
    }
}

module bottom_indents1(w, l) {
    i_size = 12;
    
    temp_x = (w - 5)/i_size;
    temp_y = (l - 5)/i_size;
    
    indents_x = floor(temp_x);
    indents_y = floor(temp_y);
    
    gap_x = i_size + ((temp_x - indents_x)*i_size)/indents_x;
    gap_y = i_size + ((temp_y - indents_y)*i_size)/indents_y;

    echo(temp_x, gap_x);
    echo(gap_y);
    
    x = -w/2 + gap_x/2 + 2.5;
    y = -l/2 + gap_y/2 + 2.5;

    for(i = [0:indents_x - 1]) {
        for(j = [0:indents_y - 1]) {
            translate([x + i*gap_x, y + j*gap_y, -1.5])
            chamfered_cube(
                i_size  -1, i_size - 1, 5, 2,center=true
            );
        }
    }
}

module bottom_indents2(w, l) {
    gap_x = 30;
    indents = w/gap_x * 2;

    difference() {
        intersection() {
            for(i = [0:indents]) {
                translate([-w + i*gap_x, 0, -30/2 + 1.5])
                rotate([0, 45, 45])
                cube([30, l*2, 30], center=true);
            }

            translate([0, 0, -20/2 + 1])
            chamfered_cube(w - 6, l - 6, 20, 3, center=true);
        }
        translate([0, l/5, 30/2 - 1.5])
        rotate([0, 45, 90])
        cube([25, l*2, 25], center=true);

        translate([0, -l/5, 30/2 - 1.5])
        rotate([0, 45, 90])
        cube([25, l*2, 25], center=true);
    }
}

//bottom_indents2(240, 150);

function plate_offset(val) = val/2 - plate_corner/2 - 3/2;

module plate(right_clamp=true) {
    w = plate_w;
    l = plate_l;
    corner = plate_corner;
    offset_x = plate_offset(w);
    offset_y = plate_offset(l);
    
    module _plate() {
        hull() {
            translate([offset_x, offset_y, 0])
            rounded_cylinder(corner, 6, 3);

            translate([-offset_x, offset_y, 0])
            rounded_cylinder(corner, 6, 3);

            translate([offset_x, -offset_y, 0])
            rounded_cylinder(corner, 6, 3);

            translate([-offset_x, -offset_y, 0])
            rounded_cylinder(corner, 6, 3);
        }
    }

    module _main() {
        difference() {
            union() {
                difference() {
                    _plate();

                    translate([0, 0, 20/2 + 2])
                    chamfered_cube(
                        w - 6, l - 6, 20, 3, center=true
                    );

                    //bottom_indents1(w, l);
                    bottom_indents2(w, l);
                }
                if (right_clamp) {
                    translate([offset_x + 1, offset_y + 1, 0])
                    hull() {
                        rounded_cylinder(corner, 18, 3);

                        translate([0, -20, 0])
                        rounded_cylinder(corner, 18, 3);
                    }
                }
                translate([-offset_x - 1, offset_y + 1, 0])
                hull() {
                    rounded_cylinder(corner, 18, 3);

                    translate([0, -20, 0])
                    rounded_cylinder(corner, 18, 3);
                }
            }

            if (right_clamp) {
                translate([w/2 - 4, l/2]) {
                    translate([15/2, -25/2 - 3])
                    chamfered_cube(
                        15, 25 + slop, 55, 4, center=true
                    );

                    translate([0, -28, 18/2])
                    rotate([90, 0, 90])
                    dove_cutout(30);

                    translate([0, -28, 18/2])
                    rotate([-90, 0, 90])
                    dove_cutout(30);
                }

                
                // custom infill
                translate([
                    offset_x + 2, offset_y + 3, 18/2
                ])
                cube([0.1, 0.1, 50], center=true);

                translate([
                    offset_x + 2, offset_y - 23, 18/2
                ])
                cube([0.1, 0.1, 50], center=true);

                translate([
                    offset_x - 3.5, offset_y, 18/2
                ])
                cube([0.1, 0.1, 50], center=true);

                translate([
                    offset_x - 3.5, offset_y - 9, 18/2
                ])
                cube([0.1, 0.1, 50], center=true);

                translate([
                    offset_x - 3.5, offset_y - 18, 18/2
                ])
                cube([0.1, 0.1, 50], center=true);
            }

            translate([-w/2 + 4, l/2]) {
                translate([-15/2, -25/2 - 3, 0])
                chamfered_cube(
                    15, 25 + slop, 55, 4, center=true
                );

                translate([0, -28, 18/2])
                rotate([90, 0, 90])
                dove_cutout(30);

                translate([0, -28, 18/2])
                rotate([-90, 0, 90])
                dove_cutout(30);
            }

            // custom infill
            translate([
                -offset_x - 2, offset_y + 3, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                -offset_x - 2, offset_y - 23, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);
            
            translate([
                -offset_x + 3.5, offset_y, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                -offset_x + 3.5, offset_y - 9, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                -offset_x + 3.5, offset_y - 18, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);
        }

        // supports
        if (right_clamp) {
            translate([w/2 - 4, l/2 - 27.5/2, 18/2])
            cube([0.5, 27.5, 7], center=true);
        }

        translate([-w/2 + 4, l/2 - 27.5/2, 18/2])
        cube([0.5, 27.5, 7], center=true);
    }

    intersection() {
        _main();
        cube([w, l, 40], center=true);
    }
}

module plate_corner() {
    w = plate_w - plate_corner - 3;
    l = plate_l - plate_corner - 3;
    offset_x = plate_offset(plate_w);
    offset_y = plate_offset(plate_l);
    
    inner_w = w - 6;
    inner_l = l - 3;
    
    intersection() {
        difference() {
            union() {
                difference() {
                    union() {
                        difference() {
                            plate(right_clamp=false);

                            translate([
                                plate_w/2 + 4.6, plate_l/2,0
                            ])
                            rotate([0, 0, -45])
                            translate([200/2, 0, 0])
                            cube([200, 900, 40],center=true);
                        }

                        translate([w/2, l/2, 0])
                        intersection() {
                            hull() {
                                rounded_cylinder(
                                    plate_corner, 6, 3
                                );

                                translate([1, 1, 0])
                                rounded_cylinder(
                                    plate_corner, 6, 3
                                );

                                translate([-tan(45)*l, -l, 0]) 
                                rounded_cylinder(
                                    plate_corner, 6, 3
                                );

                                translate([-tan(45)*l - 6, -l, 0]) 
                                rounded_cylinder(
                                    plate_corner, 6, 3
                                );
                            }

                            rotate([0, 0, -45])
                            translate([10/2, 0, 0])
                            difference() {
                                cube([10, 1000, 20], center=true);

                                translate([-2.5, 0, -8])
                                rotate([0, -45, 0])
                                cube([10, 1000, 20], center=true);
                            }
                        }
                    }
                    translate([inner_w/2, inner_l/2, 2])
                    hull() {
                        chamfered_cylinder(
                            plate_corner, 49, 3
                        );

                        translate([-4, 0, 0])
                        chamfered_cylinder(
                            plate_corner, 49, 3
                        );

                        translate([
                            -tan(45)*inner_l, -inner_l, 0
                        ])
                        chamfered_cylinder(
                            plate_corner, 49, 3
                        );

                        translate([
                            -tan(45)*inner_l - 6, -inner_l, 0
                        ])
                        chamfered_cylinder(
                            plate_corner, 49, 3
                        );
                    }
                }
                translate([offset_x + 1, offset_y + 1, 0])
                hull() {
                    rounded_cylinder(
                        plate_corner, 18, 3
                    );

                    translate([
                        -sqrt(20*20/2), -sqrt(20*20/2), 0
                    ])
                    rounded_cylinder(
                        plate_corner, 18, 3
                    );
                }
            }
            translate([
                plate_w/2 - sqrt(4*4/2), plate_l/2-sqrt(4*4/2)
            ])
            rotate([0, 0, -45]) {
                translate([15/2 + 1, -25/2, 0])
                chamfered_cube(
                    15, 25 + slop, 55, 4, center=true
                );

                translate([1, -27, 18/2])
                rotate([90, 0, 90])
                dove_cutout(31);

                translate([1, -27, 18/2])
                rotate([-90, 0, 90])
                dove_cutout(31);
            }

            // custom infill
            translate([
                offset_x + 2, offset_y + 3, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                offset_x - 14, offset_y - 16.5, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                offset_x - 4.5, offset_y + 1, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                offset_x - 10, offset_y - 4.5, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);

            translate([
                offset_x - 15.5, offset_y - 10, 18/2
            ])
            cube([0.1, 0.1, 50], center=true);
        }
        cube([plate_w, plate_l, 40], center=true);
    }

    translate([
        plate_w/2 - 10.5, plate_l/2 - 28.5/2 + 2.3, 18/2
    ])
    rotate([0, 0, -45])
    cube([0.5, 28.5, 7], center=true);
}

module plate_corner_2() {
    mirror([1, 0, 0])
    plate_corner();
}

module tie() {
    l = 27;
    difference() {
        intersection() {
            union() {
                _dove_shape(height=l);

                rotate([0, 0, 180])
                _dove_shape(height=l);
            }
            translate([0, 0, l/2])
            cube([11, 7.7, l], center=true);
        }
        cylinder(d=2.5, h=l, $fn=20);
    }
}


