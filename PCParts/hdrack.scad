
include <common.scad>;
use <Antec.scad>;

antec_hd_w = hd_width + 2*6.4 + 0.6;
antec_ssd_w = 70 + 2*4.5 + 0.6;


//debug();
//debug_ssd_rack();
//debug_rack_antec_ssd_fan();

//rotate([90, 0, 0])
//hd_rack(6, spacing=1.5, closed=true);
//rotate([90, 0, 0])
//ssd_rack(8, spacing=1.5, closed=true);
//rotate([90, 0, 0])
//ssd_enterprise_rack(8, spacing=1.5, closed=true);

//hd_rack_fan_adapter(6, 92, spacing=1.5);
//hd_rack_fan_adapter(6, 120, spacing=1.5);
//ssd_rack_fan_adapter(8, 60, spacing=1.5);
ssd_enterprise_rack_fan_adapter(8, 80, spacing=1.5);

//rack_antec(8);
//rack_antec(10);

//rack_antec_ssd(8);
//rack_antec_ssd_fan_mount_80mm();


module debug() {
    hd_rack(6, spacing=1.5, closed=true);

//    translate([(hd_width + 4)/2, 177.2, 84.5])
//    rotate([90, 0, 0])
//    hd_rack_fan_adapter(6, 92, spacing=1.5);

    translate([(hd_width + 4)/2, 163.4, 84.5])
    rotate([90, 0, 0])
    hd_rack_fan_adapter(6, 120, spacing=1.5);
}

module debug_ssd_rack() {
    ssd_enterprise_rack(8, spacing=1.5, closed=true);

    translate([(ssd_width + 4)/2, 129.8, 66.5])
    rotate([90, 0, 0])
    ssd_enterprise_rack_fan_adapter(
        8, 80, spacing=1.5
    );
}


module debug_rack_antec_ssd_fan() {
    rotate([90, 0, 0])
    rack_antec_ssd(8, mockssd=true);

    translate([0, 20/2, 0])
    rotate([90, 0, 0])
    rack_antec_ssd_fan_mount_80mm();

    %translate([0, 30, 80/2 + 1/2])
    rotate([90, 0, 0])
    mock_fan_80mm();

    %translate([0, 30, -80/2 + -1/2])
    rotate([90, 0, 0])
    mock_fan_80mm();
}

module hoole(d=screw_dia, h=5) {
    hull() {
        translate([0, -1, 0])
        rotate([0, 90, 0])
        cylinder(d=d, h=h, $fn=30);

        translate([0, 1, 0])
        rotate([0, 90, 0])
        cylinder(d=d, h=h, $fn=30);
    }
}

function get_height(
    disks, d_h, spacing, wall) = disks * d_h + disks * spacing + 2*wall;

function get_hole_z(
    i, d_h, spacing, wall) = i * (d_h + spacing) + (d_h - 6.40) + wall + spacing/2;


module _side_cut() {
    hull() {
        cube([500, 5, 17.5], center=true);

        translate([0, 0, 13])
        rotate([0, 90, 0])
        cylinder(d=2, h=500, center=true, $fn=20);

        translate([0, 0, -13])
        rotate([0, 90, 0])
        cylinder(d=2, h=500, center=true, $fn=20);

    }
}

module _side_cuts(disks) {

        _offset = -(disks - 1) * 30 / 2 + 9;

        // side cuts
        for(i = [0:disks - 2]) {
            translate([0, _offset + i*30, 28])
            _side_cut();
        }

        for(i = [0:disks - 2]) {
            translate([0, _offset + i*30, 65])
            _side_cut();
        }

        for(i = [0:disks - 2]) {
            translate([0, _offset + i*30, 102])
            _side_cut();
        }
}

module _end_cut() {
    rotate([0, 0, 90])
    scale([1, 2, 1.5])
    _side_cut();
}

module _end_cuts(width=antec_hd_w) {
    // top/bottom cuts
    translate([-width/4, 0, 35])
    _end_cut();

    translate([width/4, 0, 35])
    _end_cut();

    translate([0, 0, 67])
    _end_cut();

    translate([-width/4, 0, 95])
    _end_cut();

    translate([width/4, 0, 95])
    _end_cut();
}

module _disk_rack(
    disks, d_w=hd_width, d_h=hd_height, d_l=hd_length,
    spacing=3, closed=false, wall=1.8
) {
   
    w = d_w + 0.2 + 2*wall;
    
    height = get_height(disks, d_h, spacing, wall);

    difference() {
        
        cube([w, d_l - 16, height]);

        translate([wall, -1, wall])
        cube([
            d_w + 0.2, 160,
            height - 2*wall
        ]);
    }
}

module hd_rack(disks, spacing=3, closed=false) {

    wall = 1.8;
    hoole_d = 7;

    difference() {
        _disk_rack(
            disks, d_w=hd_width, d_h=hd_height, d_l=hd_length,
            spacing=spacing, closed=closed, wall=wall
        );

        for (i = [0:disks - 1]) {
            z = get_hole_z(i, hd_height, spacing, wall);

            translate([0, 18.3, z])
            hoole();

            translate([-4.2, 18.3, z])
            hoole(d=hoole_d);

            translate([0, 59.8, z])
            hoole();

            translate([-4.2, 59.8, z])
            hoole(d=hoole_d);

            translate([0, 119.8, z])
            hoole();

            translate([-4.2, 119.8, z])
            hoole(d=hoole_d);

            translate([hd_width, 18.3, z])
            hoole();

            translate([hd_width + 3.1, 18.3, z])
            hoole(d=hoole_d);

            translate([hd_width, 59.8, z])
            hoole();

            translate([hd_width + 3.1, 59.8, z])
            hoole(d=hoole_d);

            translate([hd_width, 119.8, z])
            hoole();

            translate([hd_width + 3.1, 119.8, z])
            hoole(d=hoole_d);
        }
    }

    %for (i = [0:disks - 1]) {
        z = i * (hd_height + spacing) + (hd_height - 6.40) + wall + spacing/2;
    
        translate([102 + 2, -10, z + 6.5])
        rotate([0, 180, 0])
        mock_hd();
    }
}

module ssd_rack(disks, spacing=3, closed=false) {

    wall = 1.8;
    hoole_d = 6;

    difference() {
        _disk_rack(
            disks, d_w=ssd_width, d_h=ssd_height,
            d_l=ssd_length + 10, spacing=spacing,
            closed=closed, wall=wall
        );

        for (i = [0:disks - 1]) {
            z = get_hole_z(i, ssd_height, spacing, wall);

            translate([0, 7.5, 3.5 + z])
            hoole(d=3.3);

            translate([-4.2, 7.5, 3.5 + z])
            hoole(d=hoole_d);

            translate([0, 84.1, 3.5 + z])
            hoole(d=3.3);

            translate([-4.2, 84.1, 3.5 + z])
            hoole(d=hoole_d);

            translate([ssd_width, 7.5, 3.5 + z])
            hoole(d=3.3);

            translate([ssd_width + 3.1, 7.5, 3.5 + z])
            hoole(d=hoole_d);

            translate([ssd_width, 84.1, 3.5 + z])
            hoole(d=3.3);

            translate([ssd_width + 3.1, 84.1, 3.5 + z])
            hoole(d=hoole_d);
        }
    }

    %for (i = [0:disks - 1]) {
        z = i * (ssd_height + spacing) + (ssd_height - 6.40) + wall + spacing/2;
    
        translate([70 + 2, -6.5, z + 6.5])
        rotate([0, 180, 0])
        mock_ssd();
    }
}

module ssd_enterprise_rack(disks, spacing=3, closed=false) {

    wall = 1.8;
    hoole_d = 6;

    difference() {
        _disk_rack(
            disks, d_w=ssd_width, d_h=ssd_height_enterprise,
            d_l=ssd_length + 10, spacing=spacing,
            closed=closed, wall=wall
        );

        for (i = [0:disks - 1]) {
            z = get_hole_z(
                i, ssd_height_enterprise, spacing, wall
            );

            translate([0, 7.5, 3.5 + z])
            hoole(d=3.3);

            translate([-4.2, 7.5, 3.5 + z])
            hoole(d=hoole_d);

            translate([0, 84.1, 3.5 + z])
            hoole(d=3.3);

            translate([-4.2, 84.1, 3.5 + z])
            hoole(d=hoole_d);

            translate([ssd_width, 7.5, 3.5 + z])
            hoole(d=3.3);

            translate([ssd_width + 3.1, 7.5, 3.5 + z])
            hoole(d=hoole_d);

            translate([ssd_width, 84.1, 3.5 + z])
            hoole(d=3.3);

            translate([ssd_width + 3.1, 84.1, 3.5 + z])
            hoole(d=hoole_d);
        }
    }

    %for (i = [0:disks - 1]) {
        z = i * (ssd_height_enterprise + spacing) + (ssd_height_enterprise - 6.40) + wall + spacing/2;
    
        translate([70 + 2, -6.5, z + 6.5])
        rotate([0, 180, 0])
        mock_ssd_enterprise();
    }
}

module _adapter_ear(d=screw_dia) {
    difference() { 
        cube(
            [2, 12, 22],
            center=true
        );

        translate([-2, 0, 5])
        rotate([90, 0, 0])
        hoole(d=d);
    }
}

module _disk_rack_fan_adapter(
    disks, fan_d, d_w, d_h, eo=0, spacing=3
) {

    wall = 1.8;
    w = d_w + 4 + 4;
    b_w = fan_d + 2*wall;
    l = get_height(disks, d_h, spacing, wall);
    h = (l - fan_d + 1)/2;
    echo(l, h);

   
    module _body_top() {
        hull() {
            translate([-w/2 + wall/2, -l/2 + wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);

            translate([w/2 - wall/2, -l/2 + wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true);
        }

        hull() {
            translate([-w/2 + wall/2, l/2 - wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);

            translate([w/2 - wall/2, l/2 - wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);
        }

        hull() {
            translate([-w/2 + wall/2, l/2 - wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);

            translate([-w/2 + wall/2, -l/2 + wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);
        }

        hull() {
            translate([w/2 - wall/2, l/2 - wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);

            translate([w/2 - wall/2, -l/2 + wall/2, h + 8/2])
            cylinder(d=wall, h=8, center=true, $fn=20);
        }
    }

    module _body_bottom() {
        hull() {
            translate([b_w/2, b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([-b_w/2, b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([b_w/2, -b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([-b_w/2, -b_w/2, wall/2])
            sphere(d=wall, $fn=20);
        }
    }

    module _body_end() {
        hull() {
            translate([b_w/2, b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([-b_w/2, b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([w/2 - wall/2, l/2 - wall/2, h])
            sphere(d=wall, $fn=20);

            translate([-w/2 + wall/2, l/2 - wall/2, h])
            sphere(d=wall, $fn=20);
        }
    }

    module _body_side() {
        hull() {
            translate([b_w/2, b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([b_w/2, -b_w/2, wall/2])
            sphere(d=wall, $fn=20);

            translate([w/2 - wall/2, -l/2 + wall/2, h])
            sphere(d=wall, $fn=20);

            translate([w/2 - wall/2, l/2 - wall/2, h])
            sphere(d=wall, $fn=20);
        }
    }

    module _body() {
        union() {
            _body_top();
            _body_bottom();
            _body_end();

            rotate([0, 0, 180])
            _body_end();

            _body_side();

            rotate([0, 0, 180])
            _body_side();
        }
    }

    ez_end = get_hole_z(
        disks - 1, d_h, spacing, wall
    ) + eo;

    ez = get_hole_z(
        0, d_h, spacing, wall
    ) + eo;

    difference() {
        union() {
            difference() {
                _body();

                // fan hole
                cylinder(
                    d=fan_d, h=5, $fn=100,
                    center=true
                );

                fan_mount_holes(fan_d, h=20);
            }

            // side mounts
            translate([
                w/2 - 2/2, -l/2 + ez,
                h + 13.5
            ])
            _adapter_ear();

            translate([
                w/2 - 2/2, -l/2 + ez_end,
                h + 13.5
            ])
            _adapter_ear();

            translate([
                -w/2 + 2/2, -l/2 + ez,
                h + 13.5
            ])
            _adapter_ear();

            translate([
                -w/2 + 2/2, -l/2 + ez_end,
                h + 13.5
            ])
            _adapter_ear();
        }
    }
}

module hd_rack_fan_adapter(disks, fan_d, spacing=3) {
    _disk_rack_fan_adapter(
        disks, fan_d, hd_width, hd_height,
        spacing=spacing
    );
}

module ssd_rack_fan_adapter(disks, fan_d, spacing=3) {
    _disk_rack_fan_adapter(
        disks, fan_d, ssd_width, ssd_height,
        eo=3.6, spacing=spacing
    );
}

module ssd_enterprise_rack_fan_adapter(
    disks, fan_d, spacing=3
) {
    _disk_rack_fan_adapter(
        disks, fan_d, ssd_width, ssd_height_enterprise,
        eo=3.6, spacing=spacing
    );
}

module _mock_hd_antec() {
    mock_hd();

    translate([-3.2, 84, 6.25])
    rotate([180, 180, 0])
    elevenhundred_hdd_rail();

    translate([hd_width + 3.2, 84, 6.25])
    rotate([180, 0, 0])
    elevenhundred_hdd_rail();
}

module _mock_ssd_antec() {
    mock_ssd_enterprise();

    translate([70 + 4.5/2, 57.25, 4])
    rotate([180, 0, 0])
    elevenhundred_ssd_rail_right();

    translate([-4.5/2, 57.25, 4])
    rotate([180, 0, 0])
    elevenhundred_ssd_rail_left();
}


module _rack_antec(w, d_h, l, b_o, s_o, wall, disks) {

    h1 = d_h * disks + 0.2;
    h2 = h1 + 2*wall;
    w1 = w;
    w2 = w1 + 2*wall;

    echo(d_h, h2);

    module _slide() {
        rotate([90, 0, 0])
        intersection() {
            chamfered_cube_side(
                17, 30, 3.5, 6, center=true
            );

            chamfered_cube(
                17, 40, 3.5, 1.3, center=true
            );
        }
    }

    module _cutout() {
        difference() {
            union() {
                cube(
                    [w1, h1, 800],
                    center=true
                );
                // locking nub hole
                for (i = [0:disks - 1]) {
                    translate([
                        0, b_o + s_o/2 + i*d_h,
                        7.9
                    ])
                    cube(
                        [w2 - 1.6, 7, 5],
                        center=true
                    );
                }
            }

            // left slides
            for (i = [0:disks - 1]) {
                translate([
                    -w2/2 - 3,
                    b_o + -3.55/2 + i*d_h,
                    30
                ])
                _slide();

                translate([
                    -w2/2 - 3,
                    b_o + -3.55/2 + i*d_h,
                    110
                ])
                _slide();

                translate([
                    -w2/2 - 3,
                    b_o + 3.55/2 + s_o + i*d_h,
                    30
                ])
                _slide();

                translate([
                    -w2/2 - 3,
                    b_o + 3.55/2 + s_o + i*d_h,
                    110
                ])
                _slide();
            }

            // right slides
            for (i = [0:disks - 1]) {
                translate([
                    w2/2 + 3,
                    b_o + -3.55/2 + i*d_h,
                    30
                ])
                _slide();

                translate([
                    w2/2 + 3,
                    b_o + -3.55/2 + i*d_h,
                    110
                ])
                _slide();

                translate([
                    w2/2 + 3,
                    b_o + 3.55/2 + s_o + i*d_h,
                    30
                ])
                _slide();

                translate([
                    w2/2 + 3,
                    b_o + 3.55/2 + s_o + i*d_h,
                    110
                ])
                _slide();
            }

            // just cuts
            for (i = [1:disks - 1]) {
                translate([
                    0, b_o + i*d_h - 2, 12/2
                ])
                hull() {
                    cube(
                        [w2, 2, 10],
                        center=true
                    );

                    cube(
                        [w2, 0.1, 12],
                        center=true
                    );
                }
            }
        }
    }

    difference() {
        union() {
            translate([0, 0, l/2])
            cube([w2, h2, l], center=true);

            translate([0, 0, 13/2])
            chamfered_cube(
                w2 + 4, h2 + 4,
                13, 2, center=true
            );

            translate([0, 0, l - 13/2])
            chamfered_cube(
                w2 + 4, h2 + 4,
                13, 2, center=true
            );

            translate([
                w2/2 - 13/2 + 2,
                h2/2 - 13/2 + 2, l/2
            ])
            chamfered_cube(
                13, 13,
                l, 2, center=true
            );

            translate([
                -w2/2 + 13/2 - 2,
                h2/2 - 13/2 + 2, l/2
            ])
            chamfered_cube(
                13, 13,
                l, 2, center=true
            );

            translate([
                w2/2 - 13/2 + 2,
                -h2/2 + 13/2 - 2, l/2
            ])
            chamfered_cube(
                13, 13,
                l, 2, center=true
            );

            translate([
                -w2/2 + 13/2 - 2,
                -h2/2 + 13/2 - 2, l/2
            ])
            chamfered_cube(
                13, 13,
                l, 2, center=true
            );

            translate([
                w2/2 - 13/2 + 2,
                2, l/2
            ])
            chamfered_cube(
                13, 10,
                l, 2, center=true
            );

            translate([
                -w2/2 + 13/2 - 2,
                2, l/2
            ])
            chamfered_cube(
                13, 10,
                l, 2, center=true
            );
        }

        _cutout();
    }
}

module rack_antec(disks, spacing=3.9, mockhdd=true) {
    wall = 1.8;
    d_h = hd_height + spacing;
    h1 = d_h * disks + 0.2;
    h2 = h1 + 2*wall;
    l = 130;

    echo(d_h, h2);

    b_o = -h2/2 + wall + spacing/2;

    _rack_antec(antec_hd_w, d_h, l, b_o, 12.7, wall, disks);

    if (mockhdd) {
        %for (i = [0:disks - 1]) {
            translate([
                -hd_width/2,
                b_o + i * d_h,
                150
            ])
            rotate([-90, 0, 0])
            _mock_hd_antec();
        }
    }
}

module rack_antec_ssd(disks, spacing=3.9, mockssd=true) {
    wall = 1.8;
    d_h = 16.32 + spacing;
    h1 = d_h * disks + 0.2;
    h2 = h1 + 2*wall;
    l = 90;

    echo(d_h, h2);

    b_o = -h2/2 + wall + spacing/2;

    _rack_antec(antec_ssd_w, d_h, l, b_o, 8.2, wall, disks);

    if (mockssd) {
        %for (i = [0:disks - 1]) {
            translate([
                -70/2,
                b_o + i * d_h,
                109
            ])
            rotate([-90, 0, 0])
            _mock_ssd_antec();
        }
    }
}

module rack_antec_ssd_fan_mount_80mm() {
    module _main() {
        difference() {
            cube([antec_ssd_w + 3, 165, 20], center=true);

            translate([0, 0, 2])
            cube([antec_ssd_w, 162, 20], center=true);

            translate([0, 41, 0])
            cylinder(d=80, h=40, center=true, $fn=60);

            translate([0, -41, 0])
            cylinder(d=80, h=40, center=true, $fn=60);

            translate([0, 41, 0])
            fan_mount_holes(80);

            translate([0, -41, 0])
            fan_mount_holes(80);
            
        }
    }

    module _inner_peg() {
        hull() {
            cube([3, 6, 5], center=true);

            translate([-1, 0, 8/2])
            cube([1, 6, 4], center=true);

            translate([3/2, 0, -8/2])
            cube([1, 6, 4], center=true);
        }
    }

    module _clip() {
        difference() {
            hull() {
                cube([0.11, 6, 10], center=true);

                translate([3, 0, 9.5])
                cube([2, 6, 13], center=true);
            }

            translate([-10/2 + 2.6, 0, 9.5])
            chamfered_cube(
                10, 20, 15.1, 3, center=true
            );

            translate([1.2, 0, 15])
            rotate([0, 10, 0])
            cube([2, 10, 10], center=true);
        }
    }

    difference() {
        union() {
            _main();

            translate([39, 35, 20/2])
            _inner_peg();

            translate([39, -45, 20/2])
            _inner_peg();

            translate([-39, 35, 20/2])
            rotate([0, 0, 180])
            _inner_peg();

            translate([-39, -45, 20/2])
            rotate([0, 0, 180])
            _inner_peg();

            translate([0, -80.2, 20/2])
            rotate([0, 0, -90])
            _inner_peg();

            translate([0, 80.2, 20/2])
            rotate([0, 0, 90])
            _inner_peg();

            translate([41, 35, 20/2 - 3])
            _clip();

            translate([41, -45, 20/2 - 3])
            _clip();

            translate([-41, 35, 20/2 - 3])
            rotate([0, 0, 180])
            _clip();

            translate([-41, -45, 20/2 - 3])
            rotate([0, 0, 180])
            _clip();
        }

        translate([0, 0, 20/2])
        rack_antec_ssd(8, mockssd=false);
    }
}