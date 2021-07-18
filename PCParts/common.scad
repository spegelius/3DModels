use <../lib/includes.scad>;

atx_psu_width = 150;
atx_psu_height = 86;

card_spacing = 20.32;

fan_connector_width = 6.1;
fan_connector_length = 7.9;

fan_92mm = 92;
fan_92mm_bolt_offset = 82.5/2;

atx_mobo_w = 12*25.4;
atx_mobo_l = 9.6*25.4;

switch_height = 12.9;
switch_width = 19.2;


//mock_mobo();
//mock_card();
//mock_mobo_card();
//mock_hd();
//mock_ssd();
//mock_atx_psu();
//mock_fan_connector_male();
//mock_fan_80mm();
//mock_USB_HDD_Seagate_5T();
//mock_USB_HDD_Seagate_2T();
//mock_USB_HDD_Toshiba_4T();
//mock_USB_hub_Dlink();
//mock_stepdown_converter();


atx_mobo_holes = [
    [atx_mobo_w-0.65*25.4, 0.4*25.4],
    [atx_mobo_w-0.65*25.4, 6.5*25.4],
    [atx_mobo_w-0.65*25.4, 9.35*25.4],
    [atx_mobo_w-3.75*25.4, 0.4*25.4],
    [atx_mobo_w-5.55*25.4, 0.4*25.4],
    [atx_mobo_w-5.55*25.4, 6.5*25.4],
    [atx_mobo_w-5.55*25.4, 9.35*25.4],
    [atx_mobo_w-11.75*25.4, 1.3*25.4],
    [atx_mobo_w-11.75*25.4, 6.5*25.4],
    [atx_mobo_w-11.75*25.4, 9.35*25.4]];

module mock_mobo() {
    $fn=50;
    difference() {
        cube([atx_mobo_w, atx_mobo_l, 2]);
        
        for(xy = atx_mobo_holes) {
            translate([xy[0],xy[1],-0.1])
            cylinder(d=4, h=3);
        }
    }
}

module mock_card(h=107, l=200) {
    $fn=50;

    cube([l, 2, h]);

    translate([-12.3, -15.8+22-19.4, -18.8+119.2]) difference() {
        cube([12.3, 19.4, 1]);

        translate([6.3, 19.4 -1 - 4.8/2, -1])
        hull() {
            cylinder(d=4.8, h=3, $fn=40);

            translate([0, 5, 0])
            cylinder(d=4.8, h=3, $fn=40);
        }
    }
    difference() {
        translate([-1, -15.8, -18.8])
        cube([1, 22, 120.2]);

        translate([-1.3, -15.8, -18.8])
        cube([2, (18.8 - 10.6)/2, 11.2]);

        translate(
            [-1.3,
             -15.8 + 10.6 + (18.8 - 10.6)/2,
             -18.8]) 
        cube([2, (18.8 - 10.6)/2, 11.2]);

        translate([-1.3, -15.8 + 18.8, -18.8])
        cube([2, 5, 116.2]);

        translate([-1.3, -15.8, -18.8 + 116.2])
        cube([2, 22 - 18.8, 5]);
    }
}

module mock_mobo_card() {
    
    mock_mobo();

    // big card, max should be 111.15 × 312.00, but this is bigger
    translate([304.8-142,-1.2,18.8-10.4])
    rotate([0,0,90])
    mock_card(h=140,l=312);

    translate([304.8-142+card_spacing,-1.2,18.8-10.4]) 
    rotate([0,0,90])
    mock_card();

    translate([304.8-142+2*card_spacing,-1.2,18.8-10.4]) 
    rotate([0,0,90])
    mock_card();

    translate([304.8-142+3*card_spacing,-1.2,18.8-10.4]) 
    rotate([0,0,90])
    mock_card();

    translate([304.8-142+4*card_spacing,-1.2,18.8-10.4]) 
    rotate([0,0,90])
    mock_card();

    translate([304.8-142+5*card_spacing,-1.2,18.8-10.4]) 
    rotate([0,0,90])
    mock_card();

    translate([304.8-142+6*card_spacing,-1.2,18.8-10.4]) 
    rotate([0,0,90])
    mock_card();
}

module mock_ssd() {
    difference() {
        cube([70, 100, 9.1]);

        translate([9.4, -1, 6.5])
        cube([41.4, 8, 1]);

        translate([10.4, -1, -1])
        cube([39.4, 8, 3]);
    }
    translate([0, 13.6, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([0, 100 - 9.2, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([70 + 5, 13.6, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([70 + 5, 100 - 9.2, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);
}

hd_width = 102;
hd_height = 26.1;

screw_dia = 3.6;

module mock_hd() {
    color("white")
    difference() {
        cube([hd_width, 146, 26]);

        translate([-1, 28.3, 6.40])
        rotate([0, 90, 0])
        cylinder(d=screw_dia, h=6, $fn=30);

        translate([-1, 69.8, 6.40])
        rotate([0, 90, 0])
        cylinder(d=screw_dia, h=6, $fn=30);

        translate([-1, 129.8, 6.40])
        rotate([0, 90, 0])
        cylinder(d=screw_dia, h=6, $fn=30);

        translate([hd_width - 5, 28.3, 6.40])
        rotate([0, 90, 0])
        cylinder(d=screw_dia, h=6, $fn=30);

        translate([hd_width - 5, 69.8, 6.40])
        rotate([0, 90, 0])
        cylinder(d=screw_dia, h=6, $fn=30);

        translate([hd_width - 5, 129.8, 6.40])
        rotate([0, 90, 0])
        cylinder(d=screw_dia, h=6, $fn=30);

        translate([12 + 21/2, 0])
        cube([21, 10, 4], center=true);

        translate([38 + 11/2, 0])
        cube([11, 10, 4], center=true);

        translate([12 + 37/2, 0, 5 - 2/2])
        cube([37, 10, 2], center=true);

        translate([12 + 2/2, 0, 0])
        cube([2, 10, 10], center=true);

        translate([49 - 2/2, 0, 0])
        cube([2, 10, 10], center=true);

        translate([34.3 + 2.5/2, 0, 0])
        cube([2.5, 10, 10], center=true);

        translate([100/2, 0, 8.5 + 2/2])
        cube([200, 5, 2], center=true);
    }
}

module atx_psu_holes(hole=3.2, h=5) {
    translate([-138/2, 0, 6])
    rotate([-90, 0, 0])
    cylinder(d=hole, h=h);

    translate([138/2, 0, 6])
    rotate([-90, 0, 0])
    cylinder(d=hole, h=h);

    translate([138/2, 0, 6 + 64])
    rotate([-90, 0, 0])
    cylinder(d=hole, h=h);

    translate(
        [-atx_psu_width/2 + 30,
         0, atx_psu_height - 6])
    rotate([-90, 0, 0])
    cylinder(d=hole, h=h);
}

module minus_atx_psu_holes(hole=3.2, h=5) {
    difference() {
        children();
        atx_psu_holes(hole=hole, h=h);
    }
}

module atx_psu_back_cutout(screw_hole=3.2, thickness=3) {
    d = 13;
    w = atx_psu_width - 3;
    h = atx_psu_height - 3;
    x_off = w/2-d/2;
    y_off = h/2-d/2;

    union() {
        difference() {
            translate([0, 0, h/2 + 3/2])
            rotate([90, 0, 0])
            rounded_cube_side(
                w, h, thickness, d, center=true);

            translate([0, -(thickness + 1)/2, 0])
            atx_psu_holes(
                hole=d, h=thickness+1, $fn=60);

            translate([-39.8, 0, h + 3/2])
            rotate([0, 48, 0])
            cube([10, 15, 12], center=true);

            translate([-atx_psu_width/2, 0, h])
            cube([60, 15, 19], center=true);

            translate([-w/2, 0, h - 9])
            rotate([0, 45, 0])
            cube([10, 15, 12], center=true);

            translate([-w/2, 0, 10.9])
            rotate([0, -39, 0])
            cube([10, 15, 15], center=true);

            translate([-w/2 + 11.3, 0, 0])
            rotate([0, -48, 0])
            cube([10, 15, 15], center=true);

            translate([w/2 - 11.3, 0, 0])
            rotate([0, 48, 0])
            cube([10, 15, 15], center=true);

            translate([w/2, 0, 10.9])
            rotate([0, 39, 0])
            cube([10, 15, 15], center=true);

            translate([w/2, 0, h - 18.1])
            rotate([0, -41, 0])
            cube([10, 15, 15], center=true);

            translate([atx_psu_width/2, 0, h])
            cube([25, 15, d*2], center=true);

            translate([138/2 - 4.43, 0, h])
            rotate([0, -45, 0])
            cube([10, 15, 15], center=true);
        }
        translate(
            [-atx_psu_width/2 + 30 + d - 0.2,
             0, h + 3/2 - d/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([-w/2 + d/2, 0, h - 9.5 - d/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([-w/2 + d/2, 0, d/2 + 12.3])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([-w/2 + d/2 + 10.8, 0, d/2 + 3/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([w/2 - d/2 - 10.8, 0, d/2 + 3/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([w/2 - d/2, 0, d/2 + 12.3])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([w/2 - d/2, 0, h - d/2 - 19.3])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([138/2 - d, 0, h - d/2 + 3/2])
        rotate([-90, 0, 0])
        cylinder(d=d, h=thickness, center=true, $fn=60);

        translate([0, -thickness/2, 0])
        atx_psu_holes(
            hole=screw_hole, h=thickness, $fn=20);
    }
}

//atx_psu_back_cutout();

module mock_atx_psu(holes=true, slop=0) {
    w = atx_psu_width + 2*slop;
    h = atx_psu_height + 2*slop;

    difference() {
        if (holes) {
            translate([0, -0.1, 0])
            minus_atx_psu_holes() {
                translate([-w/2, 0.1, 0])
                cube([w, 140, h]);
            }
        } else {
            translate([-w/2, 0, 0])
            cube([w, 140, h]);
        }

        translate([0, 140/2, 0])
        cylinder(d=120, h=10, center=true, $fn=80);
    }
}


module mock_fan_connector_male(slop=0.2) {
    
    module pin() {
        color("grey")
        cube([0.75, 0.75, 14.3], center=true);
    }
    
    w = fan_connector_width + slop;
    l = fan_connector_length + slop;
    
    pin_offset = (5.8 - 0.75)/2;
    union() {
        color("white") {
            translate([0, 0, 3.2/2])
            cube([w, l, 3.2], center=true);

            translate([-w/2 + 0.9/2, 0, 3.2 + 8.5/2])
            cube([0.9, 5, 8.5], center=true);

            translate([-w/2 + 0.9 + 0.3/2, 0, 1.7/2 + 5.7])
            cube([0.3, 5, 1.7], center=true);
        }
        
        translate([-w/2 + 2.4, 0, 14.3/2 - 3.6])
        pin();

        translate([-w/2 + 2.4, pin_offset, 14.3/2 - 3.6])
        pin();

        translate([-w/2 + 2.4, -pin_offset, 14.3/2 - 3.6])
        pin();
    }
}

module connector_pin(center=false) {
    cube([0.6, 0.6, 11.5], center=center);
}

module pin_header(pins_x, pins_y=1) {
    color("silver") {
        for (j = [0:pins_y - 1]) {
            for (i = [0:pins_x - 1]) {
                translate([i*2.54, j*2.54, 0])
                connector_pin();
            }
        }
    }

    translate([0, 0, 3])
    pin_connector(pins_x, pins_y, h=2.45);
}

module pin_connector(pins_x, pins_y=1, h=14, center=false) {
    module _block() {
        translate([0, 0, h/2])
        cube([2.54, 2.54, h], center=true);
    }

    module _form() {
        color("black")
        translate([0.3, 0.3, 0])
        hull() {
            _block();

            translate([pins_x*2.54 - 2.54, 0])
            _block();

            translate([0, pins_y*2.54 - 2.54])
            _block();

            translate([pins_x*2.54 - 2.54, pins_y*2.54 - 2.54])
            _block();
        }
    }
    
    if (center) {
        translate(
            [-(pins_x*2.54)/2 + 2.54/2 - 0.3,
             -(pins_y*2.54)/2 + 2.54/2 - 0.3])
        _form();
    } else {
        _form();
    }
}

module pin_connector_hole(
    pins_x, pins_y, h=14, center=false) {

    holee(0.2, h)
    pin_connector(pins_x, pins_y, h=h, center=center);
}

module pcb_with_holes(w,l,h=1.6) {
    pins_x = ceil(w/2.54);
    pins_y = ceil(l/2.54);
    
    color("lightyellow")
    difference() {
        cube([w, l, h]);
        for (x=[0:pins_x - 1]) {
            for (y = [0:pins_y - 1]) {
                translate([x*2.54, y*2.54, 0])
                connector_pin(center=true);
            }
        }
    }
}

module mock_fan_80mm() {
    difference() {
        cube([80, 80, 25], center=true);
        cylinder(d=79, h=55, center=true, $fn=90);
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([72/2, 72/2, 0]) {
                cylinder(d=4, h=55, center=true, $fn=30);
            }
        }
    }
}

module mock_fan_92mm() {
    difference() {
        cube([92, 92, 25], center=true);
        cylinder(d=91, h=55, center=true, $fn=90);
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([82.5/2, 82.5/2,0]) {
                cylinder(d=4, h=55, center=true, $fn=30);
            }
        }
    }
}

module mock_fan_120mm() {
    difference() {
        cube([120, 120, 25], center=true);
        cylinder(d=118, h=55, center=true, $fn=90);
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([105/2, 105/2,0]) {
                cylinder(d=4, h=55, center=true, $fn=30);
            }
        }
    }
}

module mock_fan_140mm() {
    difference() {
        cube([140, 140, 25], center=true);
        cylinder(d=139, h=55, center=true, $fn=90);
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([124.5/2, 124.5/2,0]) {
                cylinder(d=4, h=55, center=true, $fn=30);
            }
        }
    }
}

module mock_USB_HDD_Seagate_5T() {
    difference() {
        intersection() {
            rounded_cube_side(
                80.2, 117.2, 21, 5, center=true, $fn=30);

            translate([0, 0, 5/2])
            rounded_cube(84, 121, 26, 10, center=true);
        }

        translate([80.2/2 - 14/2 - 27.5,
                   -117.2/2, 1])
        cube([14, 4, 4], center=true);
    }
}

module mock_USB_HDD_Seagate_2T() {
    difference() {
        intersection() {
            rounded_cube_side(
                80.2, 117.2, 14.7, 5, center=true, $fn=30);

            translate([0, 0, 5/2])
            rounded_cube(84, 121, 19.7, 10, center=true);
        }

        translate([80.2/2 - 14/2 - 27.5,
                   -117.2/2, 14.7/2 - 4/2 - 7])
        cube([14, 4, 4], center=true);
    }
}

module mock_USB_HDD_Toshiba_4T() {
    difference() {
        intersection() {
            rounded_cube_side(
                77.3, 108, 20, 6, center=true, $fn=30);

            translate([0, 0, 5/2])
            rounded_cube(80, 111, 25, 13, center=true);
        }

        translate([-80.2/2 + 14/2 + 24,
                   -108/2, 20/2 - 4/2 - 11])
        cube([14, 4, 4], center=true);
    }
}

module mock_USB_hub_Dlink() {
    // DUB-H7

    spacing = (98.5 - 22.2 - 7) / 6;
    echo(spacing);

    difference() {
        translate([0, 0, 23/2 + 2.6])
        union() {
            rounded_cube_side(98.5, 57, 23, 20, center=true);

            translate([0, 0, -2.6])
            rounded_cube_side(94, 52.5, 23, 20 - 4.5, center=true);
        }

        translate([-98.5/2 + 19, -57/2, 23 + 2.6 - 11.2])
        rotate([90, 0, 0])
        cylinder(d=6, h=10, center=true);

        translate([-98.5/2 + 32 + 8.5/2, -57/2, 9 + 6/2])
        hull() {
            cube([8.5, 10, 6], center=true);

            translate([0, 0, (8.2 - 6)/2])
            cube([5, 10, 8.2], center=true);
        }

        translate([-98.5/2 + 11.1 + 7/2, 57/2, 7.5 + 14/2])
        for(i = [0:6]) {
            translate([i * spacing, 0, 0])
            cube([7, 10, 14], center=true);
        }
    }
}

module cord_socket_hole() {
    w = 27.3;
    l = 19.2;

    hull() {
        translate([-w/2 + 5/2, -l/2 + 5/2, 0])
        cylinder(d=5, h=10, $fn=30);

        translate([w/2 - 5/2, -l/2 + 5/2, 0])
        cylinder(d=5, h=10, $fn=30);

        translate([-w/2 + 1/2, -l/2 + 13, 0])
        cylinder(d=1, h=10, $fn=20);

        translate([w/2 - 1/2, -l/2 + 13, 0])
        cylinder(d=1, h=10, $fn=20);

        translate([-15/2 + 1/2, l/2 - 1/2, 0])
        cylinder(d=1, h=10, $fn=20);

        translate([15/2 - 1/2, l/2 - 1/2, 0])
        cylinder(d=1, h=10, $fn=20);
    }

    translate([40/2, 0, 0])
    cylinder(d=3.2, h=10, $fn=20);

    translate([-40/2, 0, 0])
    cylinder(d=3.2, h=10, $fn=20);
}

module mains_switch_hole() {
    hull() {
        translate([0, 0, 3])
        cube([switch_height, switch_width + 2, 1], center=true);

        translate([0, 0, 0.5])
        cube([switch_height, switch_width, 1], center=true);
    }
    translate([0, 0, 1 + 3/2])
    cube([switch_height + 1, switch_width + 3, 3], center=true);
}

module mock_stepdown_converter() {
    translate([0, 0, 1.6/2])
    cube([11, 20, 1.6], center=true);

    translate([11/2 - 6.5/2 - 0.5, 0, 4.5/2])
    cube([6.5, 6.5, 4.5], center=true);
}
