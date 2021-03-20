
use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/extention.scad>;
use <../Dollo/NEW_long_ties/corner.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
include <common.scad>;



height = 480;
width = 230;
depth = 430;

// 30mm units per axis
e_units_w = (width-30-90)/30;
e_units_h = (height-30-90)/30;
e_units_d = (depth-30-90)/30;

// count of 
e_count_w = 1;
e_count_h = 2;
e_count_d = 2;

// single printable beam lengths
e_length_w = e_units_w*30/e_count_w;
e_length_h = e_units_h*30/e_count_h;
e_length_d = e_units_d*30/e_count_d;

echo("Extention lengths (total, pieces)");
echo("w: ", e_units_w*30, e_length_w);
echo("h: ", e_units_h*30, e_length_h);
echo("d: ", e_units_d*30, e_length_d);

t_length = depth-155-90-30;
units1 = t_length/30;
t_offset = (t_length-120)/2;
echo("Extention_t: ", t_length, t_offset);

mount_screw_d = 10;

//debug();
//debug_PSU_plate();
//debug_foot();

//test_PSU_plate();

//extention_100();
//extention_110();
//extention_310();
//extention_360();
//extention_155();
//extention_t_155();
//PSU_backplate();
//PSU_plate_mount_1();
//PSU_plate_mount_2();
//PSU_bottom_support();
//PSU_plate_long_tie();
//PSU_bottom_support_long_bow_tie();
//foot();
//foot_dampener();
motherboard_tray();
//mobo_tray_mount();

module debug() {
    %translate([26,18,420])
    rotate([0,90,0])
    mock_mobo_card();

    translate([15,18,420])
    rotate([0,90,0])
    motherboard_tray();

    translate([0,15,176.2])
    rotate([0,-90,-90])
    mirror([1,0,0])
    mobo_tray_mount();

    translate([0,15,391])
    rotate([0,-90,-90])
    mirror([1,0,0])
    mobo_tray_mount();

    translate([0,245,176.2])
    rotate([0,90,-90])
    mobo_tray_mount();

    translate([0,245,391])
    rotate([0,90,-90])
    mobo_tray_mount();

    translate([100,5/2+3,17])
    mock_atx_psu(holes=true, slop=0);

    // corners
    rotate([-45,0,0])
    rotate([0,35,0])
    render()
    full_corner(support=false);

    translate([200,0,0])
    rotate([0,0,-45])
    rotate([0,35-90,0])
    render()
    full_corner(support=false);

    translate([0,depth-30,0])
    rotate([45,0,0])
    rotate([0,35,0])
    render()
    full_corner(support=false);

    translate([width-30,depth-30,0])
    rotate([0,0,45])
    rotate([0,35-90,0])
    render()
    full_corner(support=false);

    translate([0,0,height-30])
    rotate([-135,0,0])
    rotate([0,35,0])
    render()
    full_corner(support=false);

    translate([width-30,0,height-30])
    rotate([0,0,135])
    rotate([0,35+90,0])
    render()
    full_corner(support=false);

    translate([0,depth-30,height-30])
    rotate([135,0,0])
    rotate([0,35,0])
    render()
    full_corner(support=false);

    translate([width-30,depth-30,height-30])
    rotate([0,0,-135])
    rotate([0,35+90,0])
    render()
    full_corner(support=false);

    // w beams
    translate([45,0,0])
    rotate([0,90,0])
    render()
    for(i=[0:e_count_w-1]) {
        translate([0,0,e_length_w/2+i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false);
    }

    translate([45,400,0])
    rotate([0,90,0])
    render()
    for(i=[0:e_count_w-1]) {
        translate([0,0,e_length_w/2+i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false);
    }

    translate([45,0,0+height-30])
    rotate([0,90,0])
    render()
    for(i=[0:e_count_w-1]) {
        translate([0,0,e_length_w/2+i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false);
    }

    translate([45,400,height-30])
    rotate([0,90,0])
    render()
    for(i=[0:e_count_w-1]) {
        translate([0,0,e_length_w/2+i*e_length_w])
        extention(
            units=e_units_w/e_count_w,
            support=false);
    }

    // h beams
    translate([0,0,45])
    render()
    for(i=[0:e_count_d-1]) {
        translate([0,0,e_length_h/2+i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false);
    }

    translate([width-30,0,45])
    render()
    for(i=[0:e_count_d-1]) {
        translate([0,0,e_length_h/2+i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false);
    }

    translate([0,depth-30,45])
    render()
    for(i=[0:e_count_d-1]) {
        translate([0,0,e_length_h/2+i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false);
    }

    translate([width-30,depth-30,45])
    render()
    for(i=[0:e_count_d-1]) {
        translate([0,0,e_length_h/2+i*e_length_h])
        extention(
            units=e_units_h/e_count_h,
            support=false);
    }

    // d beams

    translate([0,45+155+t_length/2,-15])
    extention_t(
        units1=units1, _offset=-t_offset,
        supports=false);

    translate([0,45,0])
    rotate([-90,0,0])
    translate([0,0,e_length_d/2])
    extention(units=155/30,support=false);

    translate([width-30,45,0])
    rotate([-90,0,0])
    render()
    for(i=[0:e_count_d-1]) {
        translate([0,0,e_length_d/2+i*e_length_d])
        extention(
            units=e_units_d/e_count_d,
            support=false);
    }

    translate([0,45+155+t_length/2,height-15])
    rotate([0,180,0])
    extention_t(
        units1=units1, _offset=-t_offset,
        supports=false);

    translate([0,45,height-30])
    rotate([-90,0,0])
    translate([0,0,e_length_d/2])
    extention(units=155/30,support=false);

//    translate([0,45,height-30])
//    rotate([-90,0,0])
//    render()
//    for(i=[0:e_count_d-1]) {
//        translate([0,0,e_length_d/2+i*e_length_d])
//        extention(units=e_units_d/e_count_d,support=false);
//    }

    translate([width-30,45,height-30])
    rotate([-90,0,0])
    render()
    for(i=[0:e_count_d-1]) {
        translate(
            [0,0,e_length_d/2+i*e_length_d])
        extention(
            units=e_units_d/e_count_d,
            support=false);
    }

    translate([0,260,300/2+60+15])
    extention(units=300/30,support=false);

    translate([30,370,15])
    rotate([0,0,-90])
    mock_hd();

    translate([30,370,45])
    rotate([0,0,-90])
    mock_hd();

    translate([30,370,75])
    rotate([0,0,-90])
    mock_hd();

    translate([30,370,105])
    rotate([0,0,-90])
    mock_hd();

    translate([30,370,135])
    rotate([0,0,-90])
    mock_hd();

    translate([30,370,165])
    rotate([0,0,-90])
    mock_hd();

    translate([width/2-30/2,5/2+3,17])
    rotate([90,0,0])
    PSU_backplate();

    translate([(width-30)/2,144,6])
    rotate([-90,0,180])
    PSU_bottom_support();

    translate([15,0,(atx_psu_height+6)/2+15])
    PSU_plate_mount_1();

    translate([-6,60-15,-30/2-10])
    rotate([0,0,0]) {
        foot();

        translate([0,0,-0.05])
        foot_dampener();
    }
}

module test_PSU_plate() {
    translate([150/2,-10,0])
    intersection() {
        PSU_backplate();

        translate([-160/2,10,0])
        cube([20,20,5]);
    }
}

module debug_PSU_plate() {
    rotate([90,0,0])
    PSU_backplate();

    translate(
        [-atx_psu_width/2-9.75,-8+3-3/2,
         (atx_psu_height+6)/2])
    PSU_plate_mount_1();
}

module debug_foot() {
    intersection() {
        union() {
            foot();

            translate([0,0,-0.05])
            foot_dampener();
        }
        translate([0,50/2-14,0])
        cube([40,50,60],center=true);
    }
}

module extention_100() {
    extention(100/30);
}

module extention_110() {
    extention(110/30);
}

module extention_155() {
    extention(155/30);
}

module extention_310() {
    extention(310/30);
}

module extention_360() {
    extention(360/30);
}

module extention_t_155() {
    extention_t(
        units1=units1, _offset=-t_offset,
        supports=true);
}

module PSU_backplate() {
    w = atx_psu_width + 10;
    h = atx_psu_height + 6;

    translate([0,0,3])
    rotate([-90,0,0])
    difference() {
        union() {
            translate([0,3/2,h/2-2])
            rotate([90,0,0])
            cube([w,h,3],center=true);

            hull() {
                translate([0,1/2,h-6/2-2])
                cube(
                    [atx_psu_width,1,6],
                    center=true);

                translate([0,-3+1/2,h-3/2-2])
                cube(
                    [atx_psu_width,1,3],
                    center=true);
            }

            hull() {
                translate([0,1/2,4/2-2])
                cube(
                    [atx_psu_width,1,4],
                    center=true);

                translate([0,-5-1,3/2-2])
                cube(
                    [atx_psu_width,1,3],
                    center=true);
            }
        }
        atx_psu_back_cutout(thickness=17);

        translate([0,-17+1,0])
        atx_psu_holes(hole=8,h=17,$fn=30);

        translate([-w/2+2,0,0])
        rotate([0,0,45])
        cube([1.1,1.1,3*h],center=true);

        translate([-w/2+2,3,0])
        rotate([0,0,45])
        cube([1.1,1.1,3*h],center=true);

        translate([w/2-2,0,0])
        rotate([0,0,45])
        cube([1.1,1.1,3*h],center=true);

        translate([w/2-2,3,0])
        rotate([0,0,45])
        cube([1.1,1.1,3*h],center=true);

        translate([0,-5+3/2,-2])
        rotate([45,0,0])
        cube([w+1,2,2],center=true);
    }
}

module PSU_plate_mount_1() {
    h = atx_psu_height + 6;
    x_off = (width - 60 - (atx_psu_width+0.5))/2;
    echo (x_off);

    module _joint() {
        difference() {
            cube([10.2,3.2,h+1],center=true);

            difference() {
                union() {
                    translate(
                        [-10.2/2+2.1,-3.2/2,0])
                    rotate([0,0,45])
                    cube([1,1,h+1],center=true);

                    translate([-10.2/2+2.1,3.2/2,0])
                    rotate([0,0,45])
                    cube([1,1,h+1],center=true);
                }
                chamfered_cube(
                    10,5,h/2,2,center=true);
            }
        }
    }

    difference() {
        union() {
            hull() {
                translate([1/2,10/2,0])
                cube([1,10,h],center=true);

                translate([x_off-1/2-0.1,10/2,0])
                cube([1,7,h],center=true);
            }
            rotate([-90,0,0])
            long_tie_half(h);

            translate([0,2.5/2,0])
            cube([0.1,2.5,h],center=true);
        }
        translate([x_off,8-6/2,0])
         _joint();

        translate([-30/2,0,0])
        chamfered_cube(30,30,h/2,6,center=true);
    }
}

module PSU_plate_mount_2() {
    mirror([1,0,0])
    PSU_plate_mount_1();
}

module PSU_bottom_support() {
    difference() {
        intersection() {
            union() {
                cube([width-40,30,10],center=true);

                translate(
                    [-(width-60)/2+20/2,6,10/2-1/2])
                hull() {
                    cube([20,18,1],center=true);

                    translate([-6,0,10])
                    cube([8,18,1],center=true);
                }

                translate(
                    [(width-60)/2-20/2,6,10/2-1/2])
                hull() {
                    cube([20,18,1],center=true);

                    translate([6,0,10])
                    cube([8,18,1],center=true);
                }
            }

            rotate([0,0,45])
            cube([145,145,200],center=true);
        }

        translate([-(width-30)/2,6,0])
        cube([30,30,30],center=true);

        translate([(width-30)/2,6,0])
        cube([30,30,30],center=true);

        translate([(width-60)/2,6,-20/2])
        rotate([0,0,90])
        male_dovetail(40);

        translate([-(width-60)/2,6,-20/2])
        rotate([0,0,-90])
        male_dovetail(40);

        translate([0,25,0])
        chamfered_cube(
            width-85,50,60,20,center=true);

        translate([0,-10/2-11,10/2-2])
        cube(
            [atx_psu_width+0.5,10,10],center=true);
    }
}

module PSU_bottom_support_long_bow_tie() {
    long_bow_tie_half(length=20);
}

module PSU_plate_long_tie() {
    intersection() {
        union() {
            long_tie_half(length=40);

            rotate([0,45,0])
            cube([1.9,40,1.9],center=true);
        }
        translate([0,0,10/2])
        cube([10,50,10],center=true);
    }
}

module foot() {
    difference() {
        intersection() {
            scale([1,45/30,1.5])
            sphere(d=36,$fn=80);

            cylinder(d=100,h=55);
        }

        translate([6,0,10+100/2])
        cube([30,60,100],center=true);

        translate([6,-60/2,10])
        rotate([-90,0,0])
        male_dovetail(60);

        translate([10,14,2])
        sphere(d=6, $fn=40);

        translate([-10,14,2])
        sphere(d=6, $fn=40);

        translate([10,-14,2])
        sphere(d=6, $fn=40);
        
        translate([-10,-14,2])
        sphere(d=6, $fn=40);
    }
}

module foot_dampener() {
    difference() {
        union() {
            difference() {
                intersection() {
                    scale([1,45/30,1.5])
                    sphere(d=36,$fn=80);

                    translate([0,0,-1.6])
                    cylinder(d=100,h=1.6);
                }

                intersection() {
                    scale([1,45/30,1.5])
                    sphere(d=20,$fn=80);

                    translate([0,0,-3])
                    cylinder(d=100,h=4);
                }
            }
            translate([10,14,2])
            sphere(d=5.5, $fn=40);

            translate([-10,14,2])
            sphere(d=5.5, $fn=40);

            translate([10,-14,2])
            sphere(d=5.5, $fn=40);
            
            translate([-10,-14,2])
            sphere(d=5.5, $fn=40);
        }
        translate([10,14,1])
        cylinder(d=2, h=10, $fn=10);

        translate([-10,14,1])
        cylinder(d=2, h=10, $fn=10);

        translate([10,-14,1])
        cylinder(d=2, h=10, $fn=10);
        
        translate([-10,-14,1])
        cylinder(d=2, h=10, $fn=10);
    }
}

module motherboard_tray() {
    h = 8;

    module _mount_thread() {
        v_screw(
            h=h+2, screw_d=mount_screw_d+0.3, pitch=1,
            direction=0, steps=100, depth=0.1, chamfer=false);
    }

    module _mount_stud() {
        cylinder(d=7, h=3.1,$fn=20);
    }

    module _mounts() {
        difference() {
            union() {
                children();

                for(xy = atx_mobo_holes) {
                    translate([xy[0],xy[1],h-0.1])
                    _mount_stud();
                }
            }
            for(xy = atx_mobo_holes) {
                translate([xy[0],xy[1],-0.1]) {
                    cylinder(
                        d=3.5,h=h*4,
                        center=true,$fn=30);
                    M3_nut(
                        h=h-3,cone=false,
                        bridging=true);
                }
            }
        }
    }

    render()
    difference() {
        union() {
            difference() {
                _mounts()
                translate([0,5,0])
                rounded_cube_side(
                    atx_mobo_w-8,atx_mobo_l-6,h,10,$fn=40);

                translate([25,atx_mobo_l-11,0])
                difference() {
                    union() {
                        rounded_cube_side(120,30,h+2,10,$fn=40);

                        translate([-10,5,0])
                        cube([140,20,h+2]);
                    }
                    translate([-50,-30+10,0])
                    rounded_cube_side(50,30,h+2,10,$fn=40);
         
                    translate([120,-30+10,0])
                    rounded_cube_side(50,30,h+2,10,$fn=40);
                }

                translate([atx_mobo_w-30-90,atx_mobo_l-11,0])
                difference() {
                    union() {
                        rounded_cube_side(90,30,h+2,10,$fn=40);

                        translate([-10,5,0])
                        cube([110,20,h+2]);
                    }
                    translate([-50,-30+10,0])
                    rounded_cube_side(50,30,h+2,10,$fn=40);
         
                    translate([90,-30+10,0])
                    rounded_cube_side(50,30,h+2,10,$fn=40);
                }
                translate([25,25,0])
                rounded_cube_side(125,120,h+2,10,$fn=40);
                
                translate([25,atx_mobo_l-70,0])
                rounded_cube_side(125,40,h+2,10,$fn=40);

                translate([atx_mobo_w-30-95,25,0])
                rounded_cube_side(95,120,h+2,10,$fn=40);
                
                translate([atx_mobo_w-30-95,atx_mobo_l-70,0])
                rounded_cube_side(95,40,h+2,10,$fn=40);

                // forced infill
                #translate([13,-1,2])
                cube([0.1,atx_mobo_l+2,1]);

                #translate([170,-1,2])
                cube([0.1,atx_mobo_l+2,1]);

                #translate([atx_mobo_w-22,-1,2])
                cube([0.1,atx_mobo_l+2,1]);

                #translate([-1,18,2])
                cube([atx_mobo_w+2,0.1,1]);

                #translate([-1,159,2])
                cube([atx_mobo_w+2,0.1,1]);

                #translate([-1,atx_mobo_l-20,2])
                cube([atx_mobo_w+2,0.1,1]);
            }

            // mount hole bodies
            translate([45,9,0])
            cylinder(d=21,h=h);

            translate([atx_mobo_w-45,9,0])
            cylinder(d=21,h=h);

            translate([45,atx_mobo_l-29,0])
            cylinder(d=21,h=h);

            translate([atx_mobo_w-45,atx_mobo_l-29,0])
            cylinder(d=21,h=h);
        }
        // mount holes
        translate([45,9,0]) {
            _mount_thread();
            cylinder(d1=18,d2=8,h=5,$fn=40);
        }

        translate([atx_mobo_w-45,9,0]) {
            _mount_thread();
            cylinder(d1=18,d2=8,h=5,$fn=40);
        }

        translate([45,atx_mobo_l-29,0]) {
            _mount_thread();
            cylinder(d1=18,d2=8,h=5,$fn=40);
        }

        translate([atx_mobo_w-45,atx_mobo_l-29,0]) {
            _mount_thread();
            cylinder(d1=16,d2=8,h=4,$fn=40);
        }
    }
}

module mobo_tray_mount(support=true) {
    difference() {
        union() {
            hull() {
                translate([0,0,10/2])
                cube([50,15,10],center=true);

                translate([50/2-18/2,0,18/2+3])
                rotate([90,0,0])
                cylinder(d=18,h=15,center=true,$fn=40);
            }
            translate([50/2-18/2,0,18/2+3])
            rotate([-90,0,0]) {
                cylinder(d=18,h=15,$fn=40);

                translate([0,0,14.99])
                cylinder(d1=16,d2=10,h=3,$fn=40);
            }
        }
        translate([-30,0,0])
        rotate([90,0,90])
        male_dovetail(60,bridge_extra=0.2);

        translate([50/2-18/2,0,18/2+3])
        rotate([-90,30,0])
        cylinder(d=10.5,h=50,center=true,$fn=40);
    }

    if (support) {
        translate([50/2-18/2,15/2+0.2,0])
        difference() {
            translate([0,7.5/2,6/2])
            cube([11,7.5,6],center=true);

            translate([0,0,18/2+3])
            rotate([90,0,0])
            cylinder(d=18.4,h=17,center=true,$fn=40);
        }
    }
}