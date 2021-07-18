use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../PCParts/common.scad>;
use <../PCParts/case_profile.scad>;

stl_base_path = "../_downloaded/";
raspi_stl_path = str(
    stl_base_path, "Raspberry_pi_3_reference/");

2U_h = 44.45 * 2;
h = 2U_h - 20;
f_h = 30;

rod_d = 8.3;

side_d = 40 + 73 + 83.5 + 68 - 20 + 54 + 45 + 4 * 20;

slop = 0.2;

echo(side_d);


//mock_5V_transformer();
//mockup();
//debug_hdd_pieces();
//debug_bottom_joiner();
//debug_D_link_clips();
//debug_side();
//debug_top();

//front_1();
//front_2();
//back_1();
//back_2();
//beam_1();
//beam_2();
//beam_middle();

//bottom_1();
//bottom_2();
//bottom_3();
//bottom_4();
//bottom_5();
//bottom_6();
//bottom_7();
//bottom_8();
//bottom_9();
//bottom_10();
//bottom_joiner();

//hdd_piece();
//hdd_piece_end();
//hdd_piece_clip();
//hdd_piece_clip_end();
//pi_mount();
//adapter_USB_HDD_Toshiba_4T_bottom();
//adapter_USB_HDD_Toshiba_4T_top();
//adapter_USB_HDD_Seagate_2T_bottom();
//adapter_USB_HDD_Seagate_2T_top();
//adapter_USB_HDD_Seagate_5T_bottom();
//adapter_USB_HDD_Seagate_5T_top();
//cord_socket_mount();
//mains_switch_mount();
//5V_transformer_clip();
//7_5V_transformer_clip();

//D_link_hub_clip_back();
//D_link_hub_clip_front();

//side_1();
//side_2();
//side_3();
//side_4();
//side_joiner();

//top_1();
//top_2();
//top_3();
top_4();

//top_mount_left();
//top_mount_right();

//top_mount_front();
//top_mount_back();

module _transformer_form() {
    hull() {
        translate([0, 35.5/2 - 3/2, 0])
        cylinder(d=3, h=20, $fn=30);

        translate([0, -35.5/2 + 3/2, 0])
        cylinder(d=3, h=20, $fn=30);

        translate([-13.5/2 + 8/2, -10, 0])
        cylinder(d=8, h=20, $fn=30);

        translate([13.5/2 - 8/2, -10, 0])
        cylinder(d=8, h=20, $fn=30);

        translate([13.5/2 - 8/2, 10, 0])
        cylinder(d=8, h=20, $fn=30);

        translate([-13.5/2 + 8/2, 10, 0])
        cylinder(d=8, h=20, $fn=30);
    }
}

module mock_5V_transformer() {
    translate([0, 0, 55/2])
    cube([34.5, 74.6, 55], center=true);

    translate([0, 74.6/2 - 35.5/2 - 5, -20 + 2])
    _transformer_form();

    translate([0, 74.6/2 - 35.5/2 - 5 + 18.7/2, 0])
    cylinder(d=4, h=72, center=true, $fn=20);

    translate([0, 74.6/2 - 35.5/2 - 5 - 18.7/2, 0])
    cylinder(d=4, h=72, center=true, $fn=20);
}

module mock_7_5V_transformer() {
    translate([0, 0, 42.8/2])
    cube([51, 70, 42.8], center=true);

    translate([0, 70/2 - 14/2 - 8.5, -20 + 2])
    rotate([0, 0, 90])
    _transformer_form();

    translate([18.7/2, 70/2 - 14/2 - 8.5, 0])
    cylinder(d=4, h=72, center=true, $fn=20);

    translate([-18.7/2, 70/2 - 14/2 - 8.5, 0])
    cylinder(d=4, h=72, center=true, $fn=20);
}

module mockup() {
    // 2U
//    %translate([0, 0, 2U_h/2])
//    cube([440, 400, 2U_h], center=true);

    translate([-140, -161, 22])
    rotate([0, -90, 0])
    pi_mount();

    translate([-10, -160.3, 32.7])
    rotate([-90, 0, -90])
    D_link_hub_clip_back();

    translate([-10 + 64, -160.3, 32.7])
    rotate([-90, 0, 90])
    D_link_hub_clip_front();

    translate([110, -161, 30])
    rotate([12, 0, -90])
    mock_USB_hub_Dlink();

    translate([-203, -56.25, 23])
    rotate([90, 0, 90])
    hdd_piece_end();

    translate([-176, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-151, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-126, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-101, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-76, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-51, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-26, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([-1, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([24, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([49, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([74, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([99, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([124, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([149, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([174, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    translate([199, 71.75, 23])
    rotate([90, 0, -90])
    hdd_piece();

    // side rods
    translate([-440/2 + 8, 0, 2U_h - 8])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([-440/2 + 8, 0, 8])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([440/2 - 8, 0, 2U_h - 8])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([440/2 - 8, 0, 8])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([440/2 - 8, -400/2, 8])
    rotate([90, 0, 0])
    M8_nut(cone=false);

    // front and back parts
    translate([-220/2, -500/2 + 9, 2U_h/2])
    rotate([-90, 0, 0])
    front_1();

    translate([220/2, -500/2 + 9, 2U_h/2])
    rotate([-90, 0, 0])
    front_2();

    translate([-220/2, 500/2 - 7.5, 2U_h/2])
    rotate([90, 0, 0])
    back_1();

    translate([220/2, 500/2 - 7.5, 2U_h/2])
    rotate([90, 0, 0])
    back_2();

    translate([-440/2 + 40.1, 212.5, 2U_h - 2 - 10/2])
    rotate([90, 0, 0])
    top_mount_left();

    translate([440/2 - 40.1, -211, 2U_h - 2 - 10/2])
    rotate([90, 0, 180])
    top_mount_left();

    translate([440/2 - 40.1, 212.5, 2U_h - 2 - 10/2])
    rotate([90, 0, 0])
    top_mount_right();

    translate([-440/2 + 40.1, -211, 2U_h - 2 - 10/2])
    rotate([90, 0, 180])
    top_mount_right();

    translate([0, -206, 2U_h - 10 - 2])
    rotate([0, 0, 180])
    top_mount_front();

    translate([10, 207.5, 2U_h - 10 - 2])
    top_mount_back();

    // beam 1 (raspi and usb hubs)
    translate([-440/2 + 170/2 + 8, -161, 10])
    beam_1();

    translate([440/2 - 170/2 - 8, -161, 10])
    rotate([90, 0, 0])
    beam_2();

    translate([0, -171, 10])
    rotate([-90, 0, 0])
    rotate([0, 0, -90])
    beam_middle();

    // beam 2 (hdd)
    translate([-440/2 + 170/2 + 8, -68, 10])
    rotate([90, 0, 0])
    beam_1();

    translate([440/2 - 170/2 - 8, -68, 10])
    rotate([90, 0, 0])
    beam_2();

    translate([0, -78, 10])
    rotate([-90, 0, 0])
    rotate([0, 0, -90])
    beam_middle();

    // beam 3 (hdd)
    translate([-440/2 + 170/2 + 8, 83.5, 10])
    rotate([90, 0, 0])
    beam_1();

    translate([440/2 - 170/2 - 8, 83.5, 10])
    rotate([90, 0, 0])
    beam_2();

    translate([0, 73.5, 10])
    rotate([-90, 0, 0])
    rotate([0, 0, -90])
    beam_middle();

    // beam 4 (power)
    translate([-440/2 + 170/2 + 8, 157.5, 10])
    rotate([90, 0, 0])
    beam_1();

    translate([440/2 - 170/2 - 8, 157.5, 10])
    rotate([90, 0, 0])
    beam_2();

    translate([0, 147.5, 10])
    rotate([-90, 0, 0])
    rotate([0, 0, -90])
    beam_middle();

    translate([-220/2, -191, 0])
    bottom_1();

    translate([-220/2, -114.5, 0])
    bottom_3();

    translate([220/2, -114.5, 0])
    bottom_4();

    translate([-220/2, 7.8, 0])
    bottom_5();

    translate([-220/2, 120.5, 0])
    bottom_7();

    translate([-220/2, 190, 0])
    bottom_9();

    translate([-40, 500/2 - 9 + 3/2, 2U_h/2])
    rotate([90, 0, 0])
    cord_socket_mount();

    translate([40, 500/2 - 9 + 3/2, 2U_h/2])
    rotate([90, 0, 0])
    mains_switch_mount();

    translate([150, 163, 55])
    rotate([0, 0, 0])
    rotate([0, 110, 0])
    mock_5V_transformer();

    translate([35, 178, 64])
    rotate([110, 0, 90])
    5V_transformer_clip();

    translate([60, 163, 55])
    rotate([0, 0, 0])
    rotate([0, 110, 0])
    mock_5V_transformer();

    translate([125, 178, 64])
    rotate([110, 0, 90])
    5V_transformer_clip();

    translate([-150, 162.7, 45.5])
    rotate([0, -90, 0])
    mock_7_5V_transformer();

    translate([-125, 182, 45.7])
    rotate([90, 0, -90])
    7_5V_transformer_clip();

    translate([-440/2, -side_d/4 + 1.5/2, 2U_h/2 + 0.1])
    rotate([0, 90, 0])
    side_1();

    translate([-440/2, side_d/4 + 1.5/2, 2U_h/2 + 0.1])
    rotate([0, 90, 0])
    side_2();

    translate([440/2, -side_d/4 + 1.5/2, 2U_h/2 + 0.1])
    rotate([0, -90, 0])
    side_3();

    translate([5/2, 5/2 + 1.5/2, 2U_h])
    rotate([0, 180, 0])
    debug_top();
}

module debug_hdd_pieces() {
    hdd_piece();

    translate([0, 0, -25.1])
    hdd_piece();

    translate([128, 0, 27.1])
    rotate([0, 180, 0])
    hdd_piece_end();

    translate([1, 57, -3.5])
    rotate([0, 90, 0])
    hdd_piece_clip();

    translate([1, 57, 17.6])
    rotate([0, 90, 0])
    hdd_piece_clip_end();

    %translate([64, 23, 21/2 + 3])
    rotate([0, 0, 90])
    mock_USB_HDD_Seagate_5T();

    %translate([64, 23, 21/2 + 3 - 25.1])
    rotate([0, 0, 90])
    mock_USB_HDD_Toshiba_4T();

    translate([64, 53, 21/2 + 3 - 25.1])
    rotate([90, 0, 0])
    color("grey")
    adapter_USB_HDD_Toshiba_4T_top();

//    translate([10, 2U_h/2 - 23, 0])
//    cube([2, 2U_h, 70], center=true);
    echo(2U_h);
    echo(2U_h - 83 - 3);
}

module debug_bottom_joiner() {
    translate([0, 0, 3/2])
    bottom_joiner();

    translate([-220/2, 0, 0])
    bottom_1();
}

module debug_D_link_clips() {
    intersection() {
        union() {
            D_link_hub_clip_back();

            translate([0, 0, 35 + 29])
            rotate([0, 180, 0])
            D_link_hub_clip_front();
        }

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }
}

module debug_side() {

    translate([0, -side_d/4, 0])
    side_1();

    translate([0, side_d/4 + 0.1, 0])
    side_2();

    // rods
    translate([-2U_h/2 + 8, 0, 8])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=40);

    translate([2U_h/2 - 8, 0, 8])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=40);

    y_1 = -side_d/2 + 40/2;

    translate([2U_h/2, y_1, 220/2])
    rotate([0, -90, 0])
    bottom_1();

    y_2 = y_1 + 40/2 + 20/2;

    translate([2U_h/2 - 20/2, y_2, 170/2 + 8])
    rotate([0, -90, 90])
    beam_1();

    y_3 = y_2 + 20/2 + 73/2;

    translate([2U_h/2, y_3, 220/2])
    rotate([0, -90, 0])
    bottom_3();

    y_4 = y_3 + 73/2 + 20/2;

    translate([2U_h/2 - 20/2, y_4, 170/2 + 8])
    rotate([0, -90, 90])
    beam_1();

    y_5 = y_4 + 20/2 + 131.5/2;

    translate([2U_h/2, y_5, 220/2])
    rotate([0, -90, 0])
    bottom_5();

    y_6 = y_5 + 131.5/2 + 20/2;

    translate([2U_h/2 - 20/2, y_6, 170/2 + 8])
    rotate([0, -90, 90])
    beam_1();

    y_7 = y_6 + 20/2 + 54/2;

    translate([2U_h/2, y_7, 220/2])
    rotate([0, -90, 0])
    bottom_7();

    y_8 = y_7 + 54/2 + 20/2;

    translate([2U_h/2 - 20/2, y_8, 170/2 + 8])
    rotate([0, -90, 90])
    beam_1();

    y_9 = y_8 + 20/2 + 45/2;

    translate([2U_h/2, y_9, 220/2])
    rotate([0, -90, 0])
    bottom_9();
}

module debug_top() {
    translate([-210/2, -side_d/4 + 0.1, 0])
    top_1();

    translate([-210/2, side_d/4, 0])
    top_2();

    translate([210/2, -side_d/4 + 0.1, 0])
    top_3();

    translate([210/2, side_d/4, 0])
    top_4();
}

module M6_thread(h=50) {
    v_screw(h=h, screw_d=6.2, pitch=1, direction=0,
            steps=40, depth=0.1, chamfer=false);
}


module bottom_pattern() {
    size = 20 * 17 + 15;
    //%cube([size, size, 20], center=true);

    translate([-size / 2, -size/2, 0])
    for(i = [0:20]) {
        translate([i * 17, 0, 0])
        for(j = [0:20]) {
            translate(
                [15/2, 15/2 + j * 17, 15/2])
            chamfered_cube(
                15, 15, 15, 1.5, center=true);
        }
    }
}

module corner_1() {

    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, 84/2 + 6, 20/2])
            rotate([-90, 0, 0])
            _profile(84);

            translate([154/2 + 6, 0, 20/2])
            rotate([0, 90, 0])
            _profile(154);
        }

        translate([-20/2, 90, 20/2])
        _joint_form();

        translate([160, -20/2, 20/2])
        rotate([0, 0, 90])
        _joint_form();
    }
}

module corner_2() {

    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, 84/2 + 6, 20/2])
            rotate([-90, 0, 0])
            _profile(84);

            translate([-154/2 - 6, 0, 20/2])
            rotate([0, 90, 0])
            _profile(154);
        }

        translate([-20/2, 90, 20/2])
        rotate([0, 180,0])
        _joint_form();

        translate([-160, -20/2, 20/2])
        rotate([0, 0, 90])
        _joint_form();
    }
}

module center_1() {

    l = 180;
    difference() {
        union() {
            translate([0, 0, (h - 13)/2 + 13])
            _profile(h - 13);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, 0, 20/2])
            rotate([0, 90, 0])
            _profile(l);

            translate([0, 84/2 + 6, 20/2])
            rotate([-90, 0, 0])
            _profile(84);

        }

        translate([-l/2, 20/2, 20/2])
        rotate([0, 0, -90])
        _joint_form();

        translate([l/2, 20/2, 20/2])
        rotate([0, 0, -90])
        _joint_form();

        translate([-20/2, 90, 20/2])
        _joint_form();
    }
}

module center_2() {

    l = 180;
    difference() {
        union() {
            translate([0, 0, (h - 13)/2 + 13])
            _profile(h - 13);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, 0, 20/2])
            rotate([0, 90, 0])
            _profile(l);

            translate([0, -124/2 - 6, 20/2])
            rotate([-90, 0, 0])
            _profile(124);

        }

        translate([-l/2, -20/2, 20/2])
        rotate([0, 0, 90])
        _joint_form();

        translate([l/2, -20/2, 20/2])
        rotate([0, 0, 90])
        _joint_form();

        translate([-20/2, -130, 20/2])
        _joint_form();
    }
}

module middle_1() {

    difference() {
        union() {
            translate([0, 0, (h - 13)/2 + 13])
            _profile(h - 13);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, -20, 20/2])
            rotate([-90, 0, 0])
            _profile(140);

            translate([154/2 + 6, -20, 20/2])
            rotate([0, 90, 0])
            _profile(154);
        }

        translate([20/2, 140/2 - 20, 20/2])
        rotate([0, 0, 180])
        _joint_form();

        translate([20/2, -140/2 - 20, 20/2])
        rotate([0, 0, 180])
        _joint_form();

        translate([160, -20/2 - 20, 20/2])
        rotate([0, 0, 90])
        _joint_form();
    }
}

module middle_center() {

    l = 180;
    difference() {
        union() {
            translate([0, -20, 20/2])
            rotate([-90, 0, 0])
            _profile(140);

            translate([0, -20, 20/2])
            rotate([0, 90, 0])
            _profile(l);
        }

        translate([20/2, 140/2 - 20, 20/2])
        rotate([0, 0, 180])
        _joint_form();

        translate([20/2, -140/2 - 20, 20/2])
        rotate([0, 0, 180])
        _joint_form();

        translate([l/2, 20/2 - 20, 20/2])
        rotate([0, 0, -90])
        _joint_form();

        translate([-l/2, 20/2 - 20, 20/2])
        rotate([0, 0, -90])
        _joint_form();

    }
}

module middle_2() {

    difference() {
        union() {
            translate([0, 0, (h - 13)/2 + 13])
            _profile(h - 13);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, -20, 20/2])
            rotate([-90, 0, 0])
            _profile(140);

            translate([-154/2 - 6, -20, 20/2])
            rotate([0, 90, 0])
            _profile(154);
        }

        translate([20/2, 140/2 - 20, 20/2])
        rotate([0, 0, 180])
        _joint_form();

        translate([20/2, -140/2 - 20, 20/2])
        rotate([0, 0, 180])
        _joint_form();

        translate([-160, -20/2 - 20, 20/2])
        rotate([0, 0, 90])
        _joint_form();
    }
}

module corner_3() {

    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, -174/2 - 6, 20/2])
            rotate([-90, 0, 0])
            _profile(174);

            translate([154/2 + 6, 0, 20/2])
            rotate([0, 90, 0])
            _profile(154);
        }

        translate([-20/2, -180, 20/2])
        _joint_form();

        translate([160, 20/2, 20/2])
        rotate([0, 0, -90])
        _joint_form();
    }
}

module corner_4() {

    difference() {
        union() {
            translate([0, 0, h/2])
            _profile(h);

            translate([0, 0, h - 12/2 + 2])
            chamfered_cube(12, 12, 12, 2, center=true);

            translate([0, -124/2 - 6, 20/2])
            rotate([-90, 0, 0])
            _profile(124);

            translate([-154/2 - 6, 0, 20/2])
            rotate([0, 90, 0])
            _profile(154);
        }

        translate([-20/2, -130, 20/2])
        _joint_form();

        translate([-160, 20/2, 20/2])
        rotate([0, 0, -90])
        _joint_form();
    }
}

module _end_form() {
    union() {
        intersection() {
            difference() {
                translate([10/2, 0, f_h/2])
                chamfered_cube_side(230, 2U_h, f_h, 4.5, center=true, $fn=30);

                translate([10/2, 0, (f_h + 10)/2 + 2])
                chamfered_cube(226, 2U_h - 4, f_h + 10, 7, center=true);
            }

            cube([220, 2U_h * 2, 100], center=true);
        }
        translate([-220/2 + 8, 2U_h/2 - 8, 0])
        cylinder(d=16, h=f_h, $fn=30);

        translate([-220/2 + 8, -2U_h/2 + 8, 0])
        cylinder(d=16, h=f_h, $fn=30);

        translate([220/2 - 8/2, 0, f_h/2])
        cube([8, 2U_h - 1, f_h], center=true);

        translate([-50, 2U_h/2 - 20/2, f_h - 20/2])
        rotate([0, 90, 0])
        _profile_v2(15);

        translate([50, 2U_h/2 - 20/2, f_h - 20/2])
        rotate([0, 90, 0])
        _profile_v2(15);
    }
}

module front_1() {
    f_h = 30;

    difference() {
        union() {
            _end_form();

            translate([220/2, 2U_h/2 - 10, f_h/2])
            rotate([90, 0, 90])
            long_bow_tie(f_h, middle=true);

            translate([220/2, -2U_h/2 + 10, f_h/2])
            rotate([90, 0, 90])
            long_bow_tie(f_h, middle=true);
            
        }
        translate([-220/2 + 8, 2U_h/2 - 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([-220/2 + 8, -2U_h/2 + 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([220/2 - 9, 15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            cylinder(d=9, h=10, center=true, $fn=30);
        }

        translate([220/2 - 9, -15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            cylinder(d=9, h=10, center=true, $fn=30);
        }

        for(i = [0:22]) {
            translate([-220/2 + 25 + i * 8, 0, 1.5])
            difference() {
                cube([4, 2U_h - 20, 10], center=true);

                translate([-10/2 - 1.5, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=10, h=2U_h, center=true, $fn=80);

                translate([10/2 + 1.5, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=10, h=2U_h, center=true, $fn=80);
            }
        }

        translate([220/2, 0, f_h])
        cube([20, 2U_h - 34, 18], center=true);

        translate([0, 0, f_h])
        cube([150, 2U_h - 18.5, 41], center=true);

        translate([0, 0.5, 14])
        hull() {
            cube([150, 2U_h - 5, 10], center=true);

            translate([0, 0, 20])
            cube([150, 2U_h - 5 - 40, 10], center=true);
        }

        translate([220/2, 2U_h/2 - 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);

        translate([220/2, -2U_h/2 + 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);
    }
}

module front_2() {
    f_h = 30;

    difference() {
        mirror([1, 0, 0])
        _end_form();

        translate([220/2 - 8, 2U_h/2 - 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([220/2 - 8, -2U_h/2 + 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([-220/2 + 5, 15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            M4_nut(10, cone=false);
        }

        translate([-220/2 + 5, -15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            M4_nut(10, cone=false);
        }

        for(i = [0:22]) {
            translate([-220/2 + 20 + i * 8, 0, 1.5])
            difference() {
                cube([4, 2U_h - 20, 10], center=true);

                translate([-10/2 - 1.5, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=10, h=2U_h, center=true, $fn=80);

                translate([10/2 + 1.5, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=10, h=2U_h, center=true, $fn=80);
            }
        }

        translate([-220/2 - 0.01, 2U_h/2 - 10, -1])
        rotate([0, 0, -90])
        male_dovetail(f_h + 2);

        translate([-220/2 - 0.01, -2U_h/2 + 10, -1])
        rotate([0, 0, -90])
        male_dovetail(f_h + 2);

        translate([-220/2, 0, f_h])
        cube([20, 2U_h - 34, 18], center=true);

        translate([0, 0, f_h])
        cube([150, 2U_h - 18.5, 41], center=true);

        translate([0, 0.5, 14])
        hull() {
            cube([150, 2U_h - 5, 10], center=true);

            translate([0, 0, 20])
            cube([150, 2U_h - 5 - 40, 10], center=true);
        }

        translate([-220/2, 2U_h/2 - 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);

        translate([-220/2, -2U_h/2 + 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);
    }
}

module back_1() {
    f_h = 30;

    difference() {
        union() {
            mirror([0, 1, 0])
            _end_form();

            translate([220/2, 2U_h/2 - 10, f_h/2])
            rotate([90, 0, 90])
            long_bow_tie(f_h, middle=true);

            translate([220/2, -2U_h/2 + 10, f_h/2])
            rotate([90, 0, 90])
            long_bow_tie(f_h, middle=true);

            translate([70, 0, 0])
            for (i = [0:3]) {
                rotate([0, 0, 90 * i])
                translate([50/2 + 3, 50/2 + 3, 0])
                cylinder(d=10, h=5, $fn=6);
            }
        }
        translate([-220/2 + 8, 2U_h/2 - 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([-220/2 + 8, -2U_h/2 + 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([220/2 - 9, 15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            cylinder(d=9, h=10, center=true, $fn=30);
        }

        translate([220/2 - 9, -15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            cylinder(d=9, h=10, center=true, $fn=30);
        }

        translate([220/2, 0, f_h])
        cube([20, 2U_h - 34, 18], center=true);

        translate([70, 0, -1])
        rounded_cube(50, 50, 10, 2, center=true, $fn=30);

        translate([70, 0, -1])
        for (i = [0:3]) {
            rotate([0, 0, 90 * i])
            translate([50/2 + 3, 50/2 + 3, 3]) {
                cylinder(d=3.3, h=29, center=true, $fn=30);

                M3_nut(3);
            }
        }

        translate([-5, 0, 2 + 10/2])
        cube([81, 81, 10], center=true);

        translate([-5, 0, 0])
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([72/2, 72/2, 0])
            cylinder(d=5.3, h=55, center=true, $fn=30);
        }

        translate([-5, 0, 0])
        cylinder(d=80, h-20, center=true, $fn=60);

        translate([0, 0, f_h])
        cube([150, 2U_h - 18.5, 41], center=true);

        translate([0, -0.5, 14])
        hull() {
            cube([150, 2U_h - 5, 10], center=true);

            translate([0, 0, 20])
            cube([150, 2U_h - 5 - 40, 10], center=true);
        }

        translate([220/2, -2U_h/2 + 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);

        translate([220/2, 2U_h/2 - 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);

    }

    %translate([-5, 0, 25/2 + 2])
    mock_fan_80mm();
}

module back_2() {


    difference() {
        union() {
            mirror([0, 1, 0])
            mirror([1, 0, 0])
            _end_form();

            translate([-70, 0, 0])
            for (i = [0:3]) {
                rotate([0, 0, 90 * i])
                translate([50/2 + 3, 50/2 + 3, 0])
                cylinder(d=10, h=5, $fn=6);
            }
        }

        translate([220/2 - 8, 2U_h/2 - 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([220/2 - 8, -2U_h/2 + 8, 0])
        cylinder(d=rod_d, h=f_h * 3, center=true, $fn=30);

        translate([-220/2 + 5, 15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            M4_nut(10, cone=false);
        }

        translate([-220/2 + 5, -15, f_h/2])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=30, center=true, $fn=30);
            M4_nut(10, cone=false);
        }

        translate([-220/2 - 0.01, 2U_h/2 - 10, -1])
        rotate([0, 0, -90])
        male_dovetail(f_h + 2);

        translate([-220/2 - 0.01, -2U_h/2 + 10, -1])
        rotate([0, 0, -90])
        male_dovetail(f_h + 2);

        translate([-220/2, 0, f_h])
        cube([20, 2U_h - 34, 18], center=true);

        translate([-70, 0, -1])
        rounded_cube(50, 50, 10, 2, center=true, $fn=30);

        translate([-70, 0, -1])
        for (i = [0:3]) {
            rotate([0, 0, 90 * i])
            translate([50/2 + 3, 50/2 + 3, 3]) {
                cylinder(d=3.3, h=29, center=true, $fn=30);

                M3_nut(3);
            }
        }

        translate([5, 0, 2 + 10/2])
        cube([81, 81, 10], center=true);

        translate([5, 0, 0])
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([72/2, 72/2, 0])
            cylinder(d=5.3, h=55, center=true, $fn=30);
        }

        translate([5, 0, 0])
        cylinder(d=80, h-20, center=true, $fn=60);

        translate([0, 0, f_h])
        cube([150, 2U_h - 18.5, 41], center=true);

        translate([0, -0.5, 14])
        hull() {
            cube([150, 2U_h - 5, 10], center=true);

            translate([0, 0, 20])
            cube([150, 2U_h - 5 - 40, 10], center=true);
        }

        translate([-220/2, -2U_h/2 + 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);

        translate([-220/2, 2U_h/2 - 5.7, f_h])
        rotate([90, 0, 90])
        _profile_groove2(20);
    }

    %translate([5, 0, 25/2 + 2])
    mock_fan_80mm();
}

module beam_1() {
    l = 170;
    difference() {
        union() {
            rotate([0, 90, 0])
            _profile_v2(l);

            translate([-l/2, -2, 0])
            cylinder(d=12, h=20, center=true, $fn=40);

        }

        translate([l/2, -20/2, 0])
        rotate([0, 0, 90])
        _joint_form();

        translate([-l/2, -2, 0])
        cylinder(d=8, h=40, center=true, $fn=40);

        translate([-l/2 - 5, -2, 0])
        cube([6, 6.5, 30], center=true);

        translate([-l/2 - 10, -2, 0])
        cube([10, 10, 30], center=true);
    }
}

module beam_2() {
    
    l = 170;
    difference() {
        union() {
            rotate([0, 90, 0])
            _profile_v2(l);

            translate([l/2, -2, 0])
            cylinder(d=12, h=20, center=true, $fn=40);

        }

        translate([-l/2, -20/2, 0])
        rotate([0, 0, 90])
        _joint_form();

        translate([l/2, -2, 0])
        cylinder(d=8, h=40, center=true, $fn=40);

        translate([l/2 - 0.45, -7, 0])
        rotate([0, 0, -5])
        cube([7, 8.5, 30], center=true);

        translate([l/2 + 2, -12, 0])
        cube([10, 10, 30], center=true);
    }
}

module beam_middle() {
    l = 164;
    
    difference() {
        union() {
            translate([0, 0, 20/2])
            rotate([90, 0, 0])
            _profile_v2(l - 80 - 0.5);

            translate([-20/2, l/2 - 80/2, 20/2])
            intersection() {
                joint_block_v2();

                translate([0, 41/2 - 0.5, 0])
                cube([30, 41, 30], center=true);
            }

            translate([-20/2, -l/2 + 80/2, 20/2])
            intersection() {
                joint_block_v2();

                translate([0, -41/2 + 0.5, 0])
                cube([30, 41, 30], center=true);
            }
        }
    }
}

module _wall_clip() {
    difference() {
        union() {
            translate([0, 2/2, 9/2])
            cube([12, 2, 9], center=true);

            translate([0, 0.55, 5.5])
            rotate([0, 90, 0])
            _profile_groove2(11);
        }

        translate([0, 5/2 + 1.76, 7])
        cube([14, 5, 10], center=true);

        translate([0, -0.2, 12.3])
        rotate([-15, 0, 0])
        cube([14, 3, 10], center=true);

    }

//    translate([0, -20/2, 20/2])
//    rotate([0, 90, 0])
//    %_profile_v2(20);
}

module _joiner_end() {
    rotate([45, 0, 0])
    cube([30, 10, 10], center=true);
}

module _bottom(width, ends=[0], pattern=true) {
    difference() {
        intersection() {
            union() {
                translate([0, 0, 3/2])
                cube([220, width, 3], center=true);

                translate([-50, -width/2, 0])
                _wall_clip();

                translate([50, -width/2, 0])
                _wall_clip();

                translate([-50, width/2, 0])
                rotate([0, 0, 180])
                _wall_clip();

                translate([50, width/2, 0])
                rotate([0, 0, 180])
                _wall_clip();
            }
            translate([5, 0, 30/2])
            chamfered_cube(
                230, width * 2, 30, 4.5, center=true, $fn=30);
        }

        for (i = ends) {
            translate([220/2, i, 3/2])
            _joiner_end();
        }

        if (pattern) {
            translate([0.5, 0, 0])
            difference() {
                intersection() {
                    translate([0, 0, 1.2])
                    bottom_pattern();

                    translate([0, 0, 20/2 + 1.2])
                    chamfered_cube(
                        216, width - 3, 20, 3, center=true);

                    translate([0, 0, 3.1/2])
                    cube([400, width, 3.1], center=true);
                }

                for (i = ends) {
                    translate([220/2, i, 0])
                    chamfered_cube(37, 19, 6, 2, center=true);
                }
            }
        }
    }
}

module _bottom_clip() {

    intersection() {
        union() {
            difference() {
                hull() {
                    translate([-220/2 + 8, 0, 8])
                    rotate([90, 0, 0])
                    cylinder(d=12, h=10, center=true, $fn=30);

                    translate([-220/2 + 7, 0, 1/2])
                    cube([12, 10, 1], center=true);
                }

                translate([-220/2 + 8, 0, 8])
                rotate([90, 0, 0])
                cylinder(d=8, h=12, center=true, $fn=30);

                translate([-220/2 + 8, 0, 8 + 4])
                cube([7, 12, 5], center=true);
            }
            translate([-220/2 + 7, 0, 3/2])
            cube([14, 15, 3], center=true);
        }

        translate([5, 0, 30/2])
        chamfered_cube(230, 40, 30, 4.5, center=true, $fn=30);
    }
}

module bottom_1() {
    difference() {
        union() {
            _bottom(40 - slop);

            _bottom_clip();

        }

        translate([-220/2 + 8, -40/2, 8])
        rotate([90, 0, 0])
        cylinder(d=16, h=20, center=true, $fn=40);
    }
}

module bottom_2() {
    mirror([1, 0, 0])
    bottom_1();
}

module bottom_3() {
    difference() {
        union() {
            _bottom(73 - slop, ends=[18, -18]);

            translate([0, -73/2 + 15/2])
            _bottom_clip();

            translate([0, 73/2 - 15/2])
            _bottom_clip();
        }
    }
}

module bottom_4() {
    mirror([1, 0, 0])
    bottom_3();
}

module bottom_5() {
    d = 83.5 + 68 - 20 - slop;
    echo(d);

    difference() {
        union() {
            _bottom(d, ends=[45, 15, -15, -45],
                pattern=false);

            translate([0, -d/2 + 22])
            _bottom_clip();

            translate([0, d/2 - 22])
            _bottom_clip();
        }

        intersection() {
            for(i = [0:40]) {
                translate([-220/2 + i * 15, 0, 0])
                rotate([0, 0, 15])
                cube([8, 200, 20], center=true);
            }

            translate([-3, 0, 0])
            cube([180, d - 30, 20], center=true);
        }
    }
}

module bottom_6() {
    mirror([1, 0, 0])
    bottom_5();
}

module bottom_7() {
    d = 54 - slop;

    difference() {
        union() {
            _bottom(d, ends=[10, -10]);

            _bottom_clip();

        }

    }
}

module bottom_8() {
    mirror([1, 0, 0])
    bottom_7();
}

module bottom_9() {
    d = 45 - slop;

    difference() {
        union() {
            _bottom(d, ends=[0]);

            _bottom_clip();

        }

        translate([-220/2 + 8, 45/2, 8])
        rotate([90, 0, 0])
        cylinder(d=16, h=20, center=true, $fn=40);
    }
}

module bottom_10() {
    mirror([1, 0, 0])
    bottom_9();
}

module _joiner(h=3) {
    intersection() {
        rotate([45, 0, 0])
        cube([30 - slop, 10 - slop, 10 - slop], center=true);

        cube([30, 20, h], center=true);
    }
}


module bottom_joiner() {
    _joiner(h=3);
}

module side_joiner() {
    _joiner(h=2);
}


module hdd_piece() {

    h = 21 + 2 + 2;

    difference() {
        union() {
            rotate([0, 0, 180])
            scale([1, 1, 13/20])
            _frame_clip_v2();

            translate([151.5, 0, 0])
            rotate([0, 0, 180])
            scale([1, 1, 13/20])
            _frame_clip_v2();

            translate([2, -20, 0])
            cube([124, 83, h]);

            translate([-5 + 3, 83 - 20 - 15, 0])
            cube([5, 8, 18]);

            translate([125, 83 - 20 - 15, 0])
            cube([5, 8, 18]);

            translate([-3, -2, 0])
            cube([5, 2, 13]);

            translate([125, -2, 0])
            cube([5, 2, 13]);

            translate([125, -1, 0])
            hull() {
                cube([1, 23, 2]);
                cube([23, 1, 2]);
            }

            translate([2, -1, 0])
            hull() {
                cube([1, 23, 2]);

                translate([-22, 0, 0])
                cube([23, 1, 2]);
            }
        }
        translate([4, -18, 2])
        cube([120, 85, 24]);

        translate([0, 0, 2])
        cube([138, 48, 24]);

        translate([0, 20, 18])
        cube([138, 48, 24]);

        translate([25, -40, 6])
        cube([80, 48, 24]);

        translate([0, 83 - 20 - 16, 2])
        cube([2, 15, 6]);

        translate([0, 83 - 20 - 16, 10])
        cube([2, 15, 6]);

        translate([126, 83 - 20 - 16, 2])
        cube([2, 15, 6]);

        translate([126, 83 - 20 - 16, 10])
        cube([2, 15, 6]);

        for(i = [1:7]) {
            translate([15.5 * i + 2, -5, 0])
            hull() {
                cylinder(d=6, h=10, center=true, $fn=30);

                translate([0, 55, 0])
                cylinder(d=6, h=10, center=true, $fn=30);
            }
        }
        
    }

//
//    %translate([-10, 2U_h - 23 - 20/2, 0])
//    _profile_v2(30);
}

module hdd_piece_end() {

    difference() {
        union() {
            rotate([0, 0, 180])
            scale([1, 1, 14/20])
            _frame_clip_v2();

            translate([151.5, 0, 0])
            rotate([0, 0, 180])
            scale([1, 1, 14/20])
            _frame_clip_v2();

            translate([2, -20, 0])
            cube([124, 83, 2]);

            translate([-5 + 3, 83 - 20 - 15, 0])
            cube([6, 8, 9]);

            translate([124, 83 - 20 - 15, 0])
            cube([6, 8, 9]);

            translate([-3, -2, 0])
            cube([2, 8, 13]);

            translate([129, -2, 0])
            cube([2, 8, 13]);

            translate([125, -1, 0])
            hull() {
                cube([1, 23, 2]);
                cube([23, 1, 2]);
            }

            translate([2, -1, 0])
            hull() {
                cube([1, 23, 2]);

                translate([-22, 0, 0])
                cube([23, 1, 2]);
            }
        }

        translate([0, 83 - 20 - 16, 2])
        cube([2, 15, 5]);

        translate([126, 83 - 20 - 16, 2])
        cube([2, 15, 5]);

        for(i = [1:7]) {
            translate([15.5 * i + 2 , -5, 0])
            hull() {
                cylinder(d=6, h=10, center=true, $fn=30);

                translate([0, 55, 0])
                cylinder(d=6, h=10, center=true, $fn=30);
            }
        }
        
    }

    %translate([-10, 2U_h - 23 - 20/2, 0])
    _profile_v2(30);
}

module hdd_piece_clip() {
    difference() {
        cube([22.8, 12, 1.8], center=true);

        translate([0, -4, 0])
        cube([11.4, 10, 2.8], center=true);
    }
}

module hdd_piece_clip_end() {
    difference() {
        cube([14.8, 12, 1.8], center=true);

        translate([-0.5, -4, 0])
        cube([4.4, 10, 2.8], center=true);
    }
}


module pi_mount() {
    %translate([5, -60/2 + 0.5, 67.3])
    rotate([0, 90, 0])
    import(str(
        raspi_stl_path, 
        "Raspberry_Pi_3_Light_Version.STL"),
        convexity=10);

    %translate([-20/2, 0, 0])
    _profile_v2(100);

    difference() {
        union() {
            translate([3, -23.5/2, 0])
            rotate([0, 0, 90])
            _frame_clip_v2();

            translate([3/2, 0, 20/2])
            cube([3, 58, 20], center=true);

            translate([1, -49/2, 6/2])
            hull() {
                cube([1, 6, 6], center=true);

                rotate([0, 90, 0])
                cylinder(d=6, h=6, $fn=30);
            }

            translate([1, 49/2, 6/2])
            hull() {
                cube([1, 6, 6], center=true);

                rotate([0, 90, 0])
                cylinder(d=6, h=6, $fn=30);
            }
        }
        translate([0, -49/2, 6/2])
        rotate([0, 90, 0])
        cylinder(d=2, h=20, center=true, $fn=10);

        translate([0, 49/2, 6/2])
        rotate([0, 90, 0])
        cylinder(d=2, h=20, center=true, $fn=10);

        translate([0, -60/2, 30])
        rotate([45, 0, 0])
        cube([30, 30, 30],center=true);

        translate([0, 60/2, 30])
        rotate([45, 0, 0])
        cube([30, 30, 30],center=true);

    }
}

module adapter_USB_HDD_Toshiba_4T_bottom() {
    difference() {
        cube([119.7, 22.7, 15], center=true);

        translate([0, 0, 2])
        cube([108.2, 20.2, 15], center=true);

        cube([100, 10, 20], center=true);

        translate([-119.7/2, 0 , 0])
        cube([7, 15, 20], center=true);

        translate([119.7/2, 0 , 0])
        cube([7, 15, 20], center=true);

    }
}

module adapter_USB_HDD_Toshiba_4T_top() {
    difference() {
        cube([119.7, 22.7, 5], center=true);

        cube([108.2, 20.2, 10], center=true);
    }
}

module adapter_USB_HDD_Seagate_2T_bottom() {
    difference() {
        cube([119.7, 22.7, 15], center=true);

        translate([0, 0, 1])
        cube([117.4, 14.7, 15], center=true);

        cube([100, 10, 20], center=true);

        translate([0, 22.7/2, 0])
        cube([100, 4, 20], center=true);

        translate([0, -22.7/2, 0])
        cube([100, 4, 20], center=true);
    }
}

module adapter_USB_HDD_Seagate_2T_top() {
    difference() {
        cube([119.7, 22.7, 7], center=true);

        cube([117.4, 14.7, 10], center=true);

        translate([0, 22.7/2, 0])
        cube([100, 4, 10], center=true);

        translate([0, -22.7/2, 0])
        cube([100, 4, 10], center=true);
    }
}

module adapter_USB_HDD_Seagate_5T_bottom() {
    difference() {
        cube([119.7, 22.7, 15], center=true);

        translate([0, 0, 1])
        cube([117.4, 21, 15], center=true);

        cube([100, 10, 20], center=true);
    }
}

module adapter_USB_HDD_Seagate_5T_top() {
    difference() {
        cube([119.7, 22.7, 7], center=true);

        cube([117.4, 21, 10], center=true);
    }
}

module cord_socket_mount() {
    difference() {
        union() {
            rounded_cube_side(
                63, 63, 3, 6, center=true, $fn=30);
            
            translate([0, 0, 3/2 + 2/2 - 0.2])
            rounded_cube_side(
                49.7, 49.7, 2, 2, center=true, $fn=30);
        }
        
        for (i = [0:3]) {
            rotate([0, 0, 90 * i])
            translate([50/2 + 3, 50/2 + 3, 3])
            cylinder(d=3.3, h=29, center=true, $fn=30);
        }

        difference() {
            translate([0, 0, 3/2 + 3/2])
            cube([46, 46, 3], center=true);

            translate([-40/2, 0, 0])
            cylinder(d=10, h=20, center=true, $fn=6);

            translate([40/2, 0, 0])
            cylinder(d=10, h=20, center=true, $fn=6);
        }

        translate([0, 0, -2])
        cord_socket_hole();

        translate([-40/2, 0, 3/2])
        M3_nut();

        translate([40/2, 0, 3/2])
        M3_nut();
    }
}

module mains_switch_mount() {
    difference() {
        union() {
            rounded_cube_side(
                63, 63, 3, 6, center=true, $fn=30);
            
            translate([0, 0, 3/2 + 2/2 - 0.2])
            rounded_cube_side(
                49.7, 49.7, 2, 2, center=true, $fn=30);
        }
        
        for (i = [0:3]) {
            rotate([0, 0, 90 * i])
            translate([50/2 + 3, 50/2 + 3, 3])
            cylinder(d=3.3, h=29, center=true, $fn=30);
        }

        translate([0, 0, 3/2 + 3/2])
        cube([46, 46, 3], center=true);

        translate([0, 0, -3/2 - 0.01])
        mains_switch_hole();
    }
}

module 5V_transformer_clip() {
    difference() {
        intersection() {
            union() {
                translate([-6, -44, -4])
                rotate([-20, 0, 0])
                rotate([0, 0, 180])
                scale([1, 1, 1.2])
                _frame_clip_v2();

                rotate([0, 0, 90])
                scale([1.235, 1.14, 1])
                _transformer_form();

                hull() {
                    intersection() {
                        translate([-6 - 12, -44 + 1, 6])
                        rotate([-20, 0, 0])
                        cube([10, 1, 15], center=true);

                        translate([0, 0, 12/2])
                        cube([200, 200, 12], center=true);
                    }

                    translate([0, -8, 12/2])
                    cube([10, 1, 12], center=true);
                }
            }

            translate([0, 0, 100/2])
            cube([200, 200, 100], center=true);
        }

        translate([0, 0, 6.6])
        rotate([0, 0, 90])
        scale([1.025, 1.02, 1])
        _transformer_form();

        translate([-18.7/2, 0, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);

        translate([18.7/2, 0, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);
    }
}

module 7_5V_transformer_clip() {
    difference() {
        union() {
            translate([33.6, -22.6, 0])
            rotate([0, 0, 180])
            _frame_clip_v2();

            rotate([0, 0, 0])
            scale([1.235, 1.14, 1])
            _transformer_form();

            intersection() {
                translate([5, 0, 12/2])
                rotate([0, 0, 30])
                cube([12, 72, 12], center=true);

                translate([50/2, -5, 12/2])
                cube([50, 40, 12], center=true);
            }
        }

        translate([0, 0, 6.6])
        rotate([0, 0, 0])
        scale([1.025, 1.02, 1])
        _transformer_form();

        translate([0, -18.7/2, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);

        translate([0, 18.7/2, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);
    }
}

module D_link_hub_clip_back() {
    %translate([0, 0, 35])
    rotate([102, 0, 0])
    mock_USB_hub_Dlink();

    difference() {
        intersection() {
            union() {
                translate([-11, 10, 0])
                rotate([0, 0, 0])
                _frame_clip_v2();

                rotate([12, 0, 0])
                translate([0, -5.5, 12])
                cube([103, 30, 29], center=true);

                translate([0.7, 9, 3/2])
                cube([15, 5, 3], center=true);

                translate([0.7, 8, 20/2])
                cube([3, 7, 20], center=true);
            }

            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }

        rotate([12, 0, 0])
        translate([0, -5.5, 18.2])
        cube([99, 26, 25], center=true);

        rotate([12, 0, 0])
        translate([0, -5.5, 10])
        cube([90, 18, 25], center=true);

        translate([0, -25.5, -0.1])
        rotate([45, 0, 0])
        cube([120, 10, 10], center=true);
    }
}

module D_link_hub_clip_front() {
    %translate([0, 0, 29])
    rotate([-90 + 12, 0, 180])
    mock_USB_hub_Dlink();

    difference() {
        intersection() {
            union() {
                translate([-12.5, 10, 0])
                rotate([0, 0, 0])
                _frame_clip_v2();

                rotate([-12, 0, 0])
                translate([0, -18.8, 6])
                cube([103, 30, 29], center=true);

                translate([-0.7, 3, 3/2])
                cube([15, 15, 3], center=true);

                translate([-0.7, 3, 20/2])
                cube([3, 15, 20], center=true);
            }
            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }
        rotate([-12, 0, 0])
        translate([0, -18.8, 12.2])
        cube([99, 26, 25], center=true);

        rotate([-12, 0, 0])
        translate([0, -20.7, 5])
        cube([85, 18, 35], center=true);

        translate([0, -37.5, -0.1])
        rotate([35, 0, 0])
        cube([120, 10, 10], center=true);
    }
}

module _side_clip() {
    intersection() {
        difference() {
            hull() {
                translate([0, 0, 8])
                rotate([90, 0, 0])
                cylinder(d=12, h=10, center=true, $fn=30);

                translate([0, 0, 1/2])
                cube([12, 10, 1], center=true);
            }

            translate([0, 0, 8])
            rotate([90, 0, 0])
            cylinder(d=8, h=12, center=true, $fn=30);

            translate([-0.75, 0, 8 + 4])
            cube([7.5, 12, 8], center=true);

            translate([-3, 0, 8 + 2.8])
            cube([7.5, 12, 8], center=true);

            translate([3, 0, 8 + 7.4])
            cube([7.5, 12, 8], center=true);

        }

        translate([30/2 - 4.7, 0, 30/2])
        chamfered_cube(30, 40, 30, 1.5, center=true, $fn=30);
    }
}

module _side_cable_mount() {
    intersection() {
        translate([0, 0, -1])
        rotate([90, 0, 0])
        tube(12, 5, 1.5, $fn=30);

        translate([0, 0, 10/2])
        cube([20, 20, 10], center=true);
    }
}

module side_1() {
    union() {
        difference() {

            intersection() {
                translate([0, 0, 20/2])
                rotate([90, 0, 0])
                chamfered_cube_side(
                    2U_h, 20, side_d / 2 - slop,
                    4.5, center=true);

                translate([0, 0, 12/2])
                cube([2U_h, side_d, 12], center=true);
            }

            translate([-2U_h/2 + 1.7/2 - slop, 0, 20/2 + 10])
            cube([1.7, 300, 20], center=true);

            translate([100/2 - 2U_h/2 + 3, 0, 30/2 + 2])
            chamfered_cube(100, 300, 30, 2.2, center=true);

            translate([2U_h/2 + 10/2 - 3, 0, 0])
            cube([10, 300, 30], center=true);
            
            translate([2U_h/2, -side_d/4 + 40/2, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([2U_h/2, -side_d/4 + 40 + 20 + 15/2, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([2U_h/2, -side_d/4 + 40 + 20 + 73 - 15/2, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([2U_h/2, -side_d/4 + 40 + 20 + 73/2, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([2U_h/2, 69.25, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([0, side_d/4, 2/2])
            rotate([0, 0, 90])
            _joiner_end();

            translate([0.5, 0, 0])
            difference() {
                intersection() {
                    translate([0, 0, 1])
                    bottom_pattern();

                    translate([0, 0, 20/2 + 1])
                    chamfered_cube(
                        2U_h - 7, side_d / 2 - 3,
                        20, 3, center=true);

                    translate([0, 0, 3/2])
                    difference() {
                        cube([400, side_d / 2 - 2, 3],
                             center=true);

                        translate([0, side_d/4, 0])
                        cube([20, 36, 4], center=true);
                    }
                }
            }

            translate([-2U_h/2 + 8, -side_d/4, 8])
            rotate([90, 0, 0])
            cylinder(d=16, h=20, center=true, $fn=40);

            translate([2U_h/2 - 8, -side_d/4, 8])
            rotate([90, 0, 0])
            cylinder(d=16, h=20, center=true, $fn=40);
        }
        translate([-2U_h/2 + 8, -side_d/4 + 16, 0])
        _side_clip();

        translate([-2U_h/2 + 8, 0, 0])
        _side_clip();

        translate([-2U_h/2 + 8, side_d/4 - 6, 0])
        _side_clip();

        translate([2U_h/2 - 8, -side_d/4 + 33, 0])
        rotate([0, 0, 180])
        _side_clip();

        translate([2U_h/2 - 8, 1.5, 0])
        rotate([0, 0, 180])
        _side_clip();

        translate([2U_h/2 - 8, 90, 0])
        rotate([0, 0, 180])
        _side_clip();

        translate([0, 0, 0.8])
        _side_cable_mount();

        translate([0, 70, 0.8])
        _side_cable_mount();

        translate([0, -70, 0.8])
        _side_cable_mount();

        translate([-2U_h/2 + 1.7 - slop + 1.5/2,
                   -side_d/4 + 18, 12])
        cube([1.5, 10, 6], center=true);

        translate([-2U_h/2 + 1.7 - slop + 1.5/2,
                   0, 12])
        cube([1.5, 10, 6], center=true);

        translate([-2U_h/2 + 1.7 - slop + 1.5/2,
                   side_d/4 - 6, 12])
        cube([1.5, 10, 6], center=true);
    }
}

module side_2() {
    union() {
        difference() {

            intersection() {
                translate([0, 0, 20/2])
                rotate([90, 0, 0])
                chamfered_cube_side(
                    2U_h, 20, side_d / 2 - slop,
                    4.5, center=true);

                translate([0, 0, 12/2])
                cube([2U_h, side_d, 12], center=true);
            }

            translate([-2U_h/2 + 1.7/2 - slop, 0, 20/2 + 10])
            cube([1.7, 300, 20], center=true);

            translate([100/2 - 2U_h/2 + 3, 0, 30/2 + 2])
            chamfered_cube(100, 300, 30, 2.2, center=true);

            translate([2U_h/2 + 10/2 - 3, 0, 0])
            cube([10, 300, 30], center=true);
            
            translate([2U_h/2, -side_d/4 + 50.5, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([2U_h/2, 13.8, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([2U_h/2, 83.3, 5/2 + 1.2])
            cube([20, 11, 5], center=true);

            translate([0, -side_d/4, 2/2])
            rotate([0, 0, 90])
            _joiner_end();

            translate([0.5, 0, 0])
            intersection() {
                translate([0, 0, 1])
                bottom_pattern();

                translate([0, 0, 20/2 + 1])
                chamfered_cube(
                    2U_h - 7, side_d / 2 - 3,
                    20, 3, center=true);

                translate([0, 0, 3/2])
                difference() {
                    cube([400, side_d / 2 - 2, 3],
                         center=true);

                    translate([0, -side_d/4, 0])
                    cube([20, 36, 4], center=true);
                }
            }

            translate([-2U_h/2 + 8, side_d/4, 8])
            rotate([90, 0, 0])
            cylinder(d=16, h=20, center=true, $fn=40);

            translate([2U_h/2 - 8, side_d/4, 8])
            rotate([90, 0, 0])
            cylinder(d=16, h=20, center=true, $fn=40);
        }
        translate([-2U_h/2 + 8, -side_d/4 + 6, 0])
        _side_clip();

        translate([-2U_h/2 + 8, 0, 0])
        _side_clip();

        translate([-2U_h/2 + 8, side_d/4 - 16, 0])
        _side_clip();

        translate([2U_h/2 - 8, -side_d/4 + 6, 0])
        rotate([0, 0, 180])
        _side_clip();

        translate([2U_h/2 - 8, 1.5, 0])
        rotate([0, 0, 180])
        _side_clip();

        translate([2U_h/2 - 8, side_d/4 - 34, 0])
        rotate([0, 0, 180])
        _side_clip();

        translate([0, 0, 0.8])
        _side_cable_mount();

        translate([0, 70, 0.8])
        _side_cable_mount();

        translate([0, -70, 0.8])
        _side_cable_mount();

        translate([-2U_h/2 + 1.7 - slop + 1.5/2,
                   -side_d/4 + 10, 12])
        cube([1.5, 10, 6], center=true);

        translate([-2U_h/2 + 1.7 - slop + 1.5/2,
                   0, 12])
        cube([1.5, 10, 6], center=true);

        translate([-2U_h/2 + 1.7 - slop + 1.5/2,
                   side_d/4 - 18, 12])
        cube([1.5, 10, 6], center=true);
    }
}

module side_3() {
    mirror([1, 0, 0])
    side_1();
}

module side_4() {
    mirror([1, 0, 0])
    side_2();
}

module top_1() {

    top_d = side_d/2 + 4.8;    
    top_w = (440 - 20)/2 - 5.2;

    union() {
        difference() {
            union() {
                translate([0, 0, 2.8/2])
                cube([top_w, top_d, 2.8], center=true);

                intersection() {
                    translate([top_w/2, -top_d/2 + 15, 2.8/2])
                    for(i = [0:9]) {
                        translate([0, i * 21, 0])
                        rotate([45, 0, 0])
                        cube([9.8, 9.8, 9.8], center=true);
                    }

                    translate([0, 0, 2.8/2])
                    cube([400, 400, 2.8], center=true);
                }
            }

            translate([-top_w/2, 0, 5/2 + 1.6])
            cube([10, side_d, 5], center=true);

            translate([-top_w/2 + 15, top_d/2, 2.8/2])
            for(i = [0:9]) {
                translate([i * 21, 0, 0])
                rotate([0, 45, 0])
                cube([10, 10, 10], center=true);
            }

            intersection() {
                translate([0, 0, 0.6])
                bottom_pattern();

                difference() {
                    translate([2, -2, 20/2 + 0.6])
                    chamfered_cube(
                        top_w - 10, top_d - 10,
                        20, 3, center=true);

                    translate([-top_w/2 + 30, -top_d/2, 0])
                    cube([10, 20, 10], center=true);
                }
            }

            translate([-top_w/2 + 30, -top_d/2 + 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }
        }

        translate([5, -top_d/2 + 12, 6/2 + 0.4])
        cube([top_w, 2, 6], center=true);

        translate([5, 32, 6/2 + 0.4])
        cube([top_w, 2, 6], center=true);

        translate([-top_w/2 + 5 + 2/2, 5, 6/2 + 0.4])
        cube([2, top_d - 10, 6], center=true);

    }
}

module top_2() {
    top_d = side_d/2 - 5.2;    
    top_w = (440 - 20)/2 - 5.2;

    union() {
        difference() {
            union() {
                translate([0, 0, 2.8/2])
                cube([top_w, top_d, 2.8], center=true);

                intersection() {
                    translate([-top_w/2 + 15, -top_d/2, 2.8/2])
                    for(i = [0:9]) {
                        translate([i * 21, 0, 0])
                        rotate([0, 45, 0])
                        cube([9.8, 9.8, 9.8], center=true);
                    }

                    translate([0, 0, 2.8/2])
                    cube([top_w, top_d + 10, 2.8], center=true);
                }

                intersection() {
                    translate([top_w/2, -top_d/2 + 15, 2.8/2])
                    for(i = [0:9]) {
                        translate([0, i * 21, 0])
                        rotate([45, 0, 0])
                        cube([9.8, 9.8, 9.8], center=true);
                    }

                    translate([5/2, 0, 2.8/2])
                    cube([top_w + 5, top_d, 2.8], center=true);
                }
            }

            translate([-top_w/2, 0, 5/2 + 1.6])
            cube([10, side_d, 5], center=true);

            intersection() {
                translate([0, 0, 0.6])
                bottom_pattern();

                difference() {
                    translate([2, -2, 20/2 + 0.6])
                    chamfered_cube(
                        top_w - 10, top_d - 5,
                        20, 3, center=true);

                    translate([-top_w/2 + 30, top_d/2, 0])
                    cube([10, 20, 10], center=true);

                    translate([top_w/2 - 5, top_d/2, 0])
                    cube([10, 20, 10], center=true);
                }
            }

            translate([-top_w/2 + 30, top_d/2 - 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }

            translate([top_w/2 - 5, top_d/2 - 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }
        }
        translate([5/2, top_d/2 - 12, 6/2 + 0.4])
        cube([top_w - 5, 2, 6], center=true);

        translate([5, -28, 6/2 + 0.4])
        cube([top_w, 2, 6], center=true);

        translate([-top_w/2 + 5 + 2/2, -5, 6/2 + 0.4])
        cube([2, top_d - 10, 6], center=true);

    }
}

module top_3() {
    top_d = side_d/2 + 4.8;    
    top_w = (440 - 20)/2 + 4.8;

    union() {
        difference() {
            translate([0, 0, 2.8/2])
            cube([top_w, top_d, 2.8], center=true);

            translate([top_w/2, 0, 5/2 + 1.6])
            cube([10, side_d, 5], center=true);

            translate([top_w/2 - 13, top_d/2, 2.8/2])
            for(i = [0:9]) {
                translate([-i * 21, 0, 0])
                rotate([0, 45, 0])
                cube([10, 10, 10], center=true);
            }

            translate([-top_w/2, -top_d/2 + 15, 2.8/2])
            for(i = [0:9]) {
                translate([0, i * 21, 0])
                rotate([45, 0, 0])
                cube([10, 10, 10], center=true);
            }

            intersection() {
                translate([0, 0, 0.6])
                bottom_pattern();

                difference() {
                    translate([2, -2, 20/2 + 0.6])
                    chamfered_cube(
                        top_w - 10, top_d - 10,
                        20, 3, center=true);

                    translate([top_w/2 - 30, -top_d/2, 0])
                    cube([10, 20, 10], center=true);

                    translate([-top_w/2 + 5, -top_d/2, 0])
                    cube([10, 20, 10], center=true);
                }
            }

            translate([top_w/2 - 30, -top_d/2 + 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }

            translate([-top_w/2 + 5, -top_d/2 + 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }
        }

        translate([0, -top_d/2 + 12, 6/2 + 0.4])
        cube([top_w - 10, 2, 6], center=true);

        translate([0, 32, 6/2 + 0.4])
        cube([top_w - 10, 2, 6], center=true);

        translate([top_w/2 - 5 - 2/2, 5, 6/2 + 0.4])
        cube([2, top_d - 10, 6], center=true);
    }
}

module top_4() {
    top_d = side_d/2 - 5.2;    
    top_w = (440 - 20)/2 + 4.8;

    union() {
        difference() {
            union() {
                translate([0, 0, 2.8/2])
                cube([top_w, top_d, 2.8], center=true);

                intersection() {
                    translate([top_w/2 - 13, -top_d/2, 2.8/2])
                    for(i = [0:9]) {
                        translate([-i * 21, 0, 0])
                        rotate([0, 45, 0])
                        cube([9.8, 9.8, 9.8], center=true);
                    }

                    translate([0, 0, 2.8/2])
                    cube([top_w, top_d + 10, 2.8], center=true);
                }
            }

            translate([top_w/2, 0, 5/2 + 1.6])
            cube([10, side_d, 5], center=true);

            translate([-top_w/2, -top_d/2 + 15, 2.8/2])
            for(i = [0:9]) {
                translate([0, i * 21, 0])
                rotate([45, 0, 0])
                cube([10, 10, 10], center=true);
            }

            intersection() {
                translate([0, 0, 0.6])
                bottom_pattern();

                difference() {
                    translate([2, -2, 20/2 + 0.6])
                    chamfered_cube(
                        top_w - 10, top_d - 5,
                        20, 3, center=true);

                    translate([top_w/2 - 30, top_d/2, 0])
                    cube([10, 20, 10], center=true);
                }
            }
            translate([top_w/2 - 30, top_d/2 - 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }
        }
        translate([-5/2, top_d/2 - 12, 6/2 + 0.4])
        cube([top_w - 5, 2, 6], center=true);

        translate([0, -28, 6/2 + 0.4])
        cube([top_w - 10, 2, 6], center=true);

        translate([top_w/2 - 5 - 2/2, -5, 6/2 + 0.4])
        cube([2, top_d - 10, 6], center=true);
    }
}

module top_mount_left() {

//    %translate([220/2 - 40, -2U_h/2 + 10/2 + 2, -30])
//    back_1();

    difference() {
        union() {
            cube([10, 10, 20], center=true);

            translate([-30/2, 0, -10/2])
            cube([30, 10, 10], center=true);
        }

        translate([-40.2 + 16/2, -1, 0])
        cylinder(d=16.2, h=50, center=true, $fn=40);

        translate([0, -5, -10])
        rotate([45, 0, ])
        cube([44, 10, 20], center=true);

        translate([0, 0, 5.1])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=40, center=true, $fn=30);

        translate([-35, 0, 0])
        cube([20, 40, 40], center=true);

        translate([0, 10/2, 11/2])
        cube([20, 1.6, 11], center=true);
    }
}

module top_mount_right() {
    mirror([1, 0, 0])
    top_mount_left();
}

module top_mount_front() {

//    %translate([220/2, 35, -2U_h/2 + 10 + 2])
//    rotate([-90, 0, 180])
//    front_1();

    difference() {
        union() {
            translate([13/2 - 10/2, 0, 10/2])
            cube([13, 10, 10], center=true);

            translate([10/2 + 8, 10/2, 10/2])
            cube([10, 20, 10], center=true);
        }


        translate([17, 0, 0])
        rotate([0, 45, 0])
        cube([10, 32, 20], center=true);

        translate([17, -9, 0])
        rotate([0, 0, 45])
        cube([30, 20, 40], center=true);

        translate([0, -0.2, 0])
        cylinder(d=2.8, h=40, center=true, $fn=30);

        translate([0, -1/2, 10])
        cube([40, 11, 1.6], center=true);
    }
}

module top_mount_back() {

//    %translate([220/2 - 10, 35, -2U_h/2 + 10 + 2])
//    rotate([-90, 0, 180])
//    front_1();

    difference() {
        union() {
            translate([13/2 - 10/2, 0, 10/2])
            cube([13, 10, 10], center=true);

            translate([10/2 - 2, 10/2, 10/2])
            cube([10, 20, 10], center=true);
        }


        translate([11, 0, 0])
        rotate([0, 45, 0])
        cube([10, 32, 20], center=true);

        translate([12, -9, 0])
        rotate([0, 0, 45])
        cube([30, 20, 40], center=true);

        translate([0, -0.1, 0])
        cylinder(d=2.8, h=40, center=true, $fn=30);

        translate([0, -1/2, 10])
        cube([40, 11, 1.6], center=true);
    }
}
