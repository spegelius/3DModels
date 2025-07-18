use <../Dollo/NEW_long_ties/include.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/mockups.scad>;
use <../PCParts/common.scad>;
use <../PCParts/case_profile.scad>;
use <../Stepdown_box/Stepdown_box.scad>;


stl_base_path = "../_downloaded/";
raspi_stl_path = str(
    stl_base_path, "Raspberry_pi_3_reference/");

2U_h = 44.45 * 2;
h = 2U_h - 20;
f_h = 30;

rod_d = 8.3;

cover_d = 40 + 73 + 83.5 + 68 - 20 + 54 + 45 + 4 * 20;

slop = 0.2;

cover_joiner_positions_x = [
    0, 40, 80, -40, -80
];

cover_joiner_positions_y = [
    22, -22
];

bottom_joiner_positions = [
    0, cover_d/4 - 20, -cover_d/4 + 20,
    cover_d/4 - 60, -cover_d/4 + 60
];

echo(cover_d);


//mock_5V_transformer();
//mock_5V_transformer_2();
//mock_5V_transformer_3();
//mock_5V_USB_transformer();
//mock_12V_transformer();
//mock_itec_psu();
//mock_raspberry_pi();
//mockup();

//_chia_logo();
//_raspi_logo_1();
//_raspi_logo_2();
//_bitcoin_logo_1();
//_bitcoin_logo_2();
//_hdd_logo();

//debug_beam();
//debug_hdd_pieces();
//debug_joiners();
//debug_D_link_clips();
//debug_Targus_clips();
//debug_Belkin_clips();
//debug_5V_transformer_2_clip();
//debug_side();
//debug_bottom();
//debug_top();
//debug_transformers();
//debug_stepdown_box_side_clip();
//debug_stepdown_box_clip();
//debug_ac_cover();
//debug_adapter_WD_E_5T();
//debug_box4();
//debug_raspberry_pi_clips();
//debug_connector_clips();
//debug_stepdown_converter_2_clip();

//front_1();
//front_2();
//back_1();
//back_2();

//bottom_1();
//bottom_2();
//bottom_3();
//bottom_4();

//side_1();
//side_2();
//side_3();
//side_4();

//top_1();
//top_2();
//top_3();
//top_4();

//top_1_dc();
//top_1_dc_chia_logo();

//top_2_dc();
//top_2_dc_raspi_green();
//top_2_dc_raspi_red();

//top_3_dc();
//top_3_dc_bitcoin_orange();
//top_3_dc_bitcoin_black();

//top_4_dc();
//top_4_dc_hdd_logo();

//end_joiner();
//cover_joiner();

//beam_1();
//beam_2();
//beam_middle();

//hdd_piece();
//hdd_piece_big();
//hdd_piece_end();
//hdd_piece_clip();
//hdd_piece_clip_big_1();
//hdd_piece_clip_big_2();
//hdd_piece_clip_end();

//pi_mount();

//adapter_USB_HDD_Toshiba_4T_bottom();
//adapter_USB_HDD_Toshiba_4T_top();
//adapter_USB_HDD_Seagate_2T_bottom();
//adapter_USB_HDD_Seagate_2T_top();
//adapter_USB_HDD_Seagate_5T_bottom();
//adapter_USB_HDD_Seagate_5T_top();
//adapter_USB_HDD_Seagate_5T_2_bottom();
//adapter_USB_HDD_Seagate_5T_2_top();
//adapter_USB_HDD_Intenso_5T_bottom();
//adapter_USB_HDD_Intenso_5T_top();
//adapter_USB_HDD_WD_5T_top();
//adapter_USB_HDD_WD_5T_bottom();
//adapter_USB_HDD_WD_E_5T_top();
//adapter_USB_HDD_WD_E_5T_bottom();
//cord_socket_mount();
//mains_switch_mount();
//5V_transformer_clip();
//5V_transformer_2_clip();
//5V_transformer_3_clip();
//5V_transformer_2_clip_cover();
//7_5V_transformer_clip();
//double_transformer_clip();

//D_link_hub_clip_back();
//D_link_hub_clip_front();

//Targus_hub_clip_back();
//Targus_hub_clip_front();

//Belkin_hub_clip_back();
//Belkin_hub_clip_front();

//itec_hub_clip_back();
//itec_hub_clip_front();

//itec_hub_psu_clip_1();
//itec_hub_psu_clip_2();

//cable_clip();

//connector_clip_medium();
//connector_clip_small();

//fan_connector_pcb_clip();

//stepdown_box_side_clip();
//stepdown_box_clip();
//stepdown_converter_2_clip();

//dummy_hdd();

//ac_cover();
//ac_cover_2();

//psu_100w_clip_1();
psu_100w_clip_2();


module _transformer_form(h=20) {
    hull() {
        translate([0, 35.5/2 - 3/2, 0])
        cylinder(d=3, h=h, $fn=30);

        translate([0, -35.5/2 + 3/2, 0])
        cylinder(d=3, h=h, $fn=30);

        translate([-13.5/2 + 8/2, -10, 0])
        cylinder(d=8, h=h, $fn=30);

        translate([13.5/2 - 8/2, -10, 0])
        cylinder(d=8, h=h, $fn=30);

        translate([13.5/2 - 8/2, 10, 0])
        cylinder(d=8, h=h, $fn=30);

        translate([-13.5/2 + 8/2, 10, 0])
        cylinder(d=8, h=h, $fn=30);
    }
}

module _chia_logo() {
    intersection() {
        translate([0, 2, 0])
        scale([2.2, 2.2, 10])
        import("chia_logo.stl", convexity=10);

        cube([200, 200, 2], center=true);
    }
}

module _raspi_logo_1() {
    intersection() {
        difference() {
            translate([0, 0, 1/2])
            cube([100, 100, 1], center=true);

            translate([-0.31, 0, -0.1])
            scale([0.4, 0.4, 0.4])
            import("../_downloaded/Raspberry Pi logo/RPi_Logo_1.stl",
                convexity=10);
        }

        union() {

            hull() {
                translate([5.5, 21, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([8, 22, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([12, 23, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([17.5, 23.5, 0])
                cylinder(d=5, h=10, center=true, $fn=20);

                translate([12, 18, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([8, 17, 0])
                cylinder(d=10, h=10, center=true, $fn=20);
            }

            mirror([1, 0, 0])
            hull() {
                translate([5.5, 21, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([8, 22, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([12, 23, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([17.5, 23.5, 0])
                cylinder(d=5, h=10, center=true, $fn=20);

                translate([12, 18, 0])
                cylinder(d=10, h=10, center=true, $fn=20);

                translate([8, 17, 0])
                cylinder(d=10, h=10, center=true, $fn=20);
            }
        }
    }
}

module _raspi_logo_2() {
    intersection() {
        difference() {
            translate([0, 0, 1/2])
            cube([100, 100, 1], center=true);

            translate([-0.31, 0, -0.1])
            scale([0.4, 0.4, 0.4])
            import("../_downloaded/Raspberry Pi logo/RPi_Logo_1.stl",
                convexity=10);
        }

        union() {

            union() {
                translate([0, 6, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([9, 5, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([14, -4, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([11, -14, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([0, -20, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([-9.5, 5, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([-14, -4, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([-11, -14, 0])
                cylinder(d=15, h=10, center=true, $fn=20);

                translate([0, -8, 0])
                cylinder(d=20, h=10, center=true, $fn=20);

            }
        }
    }
}

module _bitcoin_logo_1() {
    difference() {
        cylinder(d=80, h=1, $fn=80);

        translate([0, 0, -1])
        rotate([0, 0, -12])
        import("../_downloaded/Bitcoin Sign/Bitcoin.stl",
                convexity=10);
    }
}

module _bitcoin_logo_2() {
    intersection() {
        translate([0, 0, -1])
        rotate([0, 0, -12])
        import("../_downloaded/Bitcoin Sign/Bitcoin.stl",
                convexity=10);

        cylinder(d=200, h=1);
    }
}

module _hdd_logo() {
    union() {
        difference() {
            translate([0, 0, 1/2])
            rounded_cube_side(60, 85, 1, 20, center=true);

            rounded_cube_side(50, 75, 15, 10, center=true);
        }

        difference() {
            translate([0, 12.5, 0])
            tube(40, 1, 13, $fn=50);

            hull() {
                translate([8, 0, 0])
                cylinder(d=6, h=5, center=true, $fn=20);

                translate([-8, -15, 0])
                cylinder(d=14, h=5, center=true, $fn=20);

            }
        }

        difference() {
            hull() {
                translate([8, 0, 0])
                cylinder(d=2.5, h=1, $fn=20);

                translate([-8, -15, 0])
                cylinder(d=10.5, h=1, $fn=20);
            }

            translate([-8, -15, 0])
            cylinder(d=5.5, h=5, center=true, $fn=20);
        }

        translate([20, 32.5, 0])
        cylinder(d=3, h=1, $fn=20);

        translate([-20, 32.5, 0])
        cylinder(d=3, h=1, $fn=20);

        translate([20, -32.5, 0])
        cylinder(d=3, h=1, $fn=20);

        translate([-20, -32.5, 0])
        cylinder(d=3, h=1, $fn=20);
    }
    
}

module mock_raspberry_pi() {
    import(str(
        raspi_stl_path, 
        "Raspberry_Pi_3_Light_Version.STL"),
        convexity=10);
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

module mock_5V_transformer_2() {
    translate([0, 0, 55/2])
    cube([34.5, 74.6, 55], center=true);

    difference() {
        union() {
            translate([0, 74/2 - 15 - 1.5/2])
            cube([6.3, 1.5, 34], center=true);

            translate([0, 74/2 - 27.5 - 1.5/2])
            cube([6.3, 1.5, 34], center=true);
        }

        translate([0, 15, -12])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=30, center=true, $fn=20);
    }
}

module mock_5V_transformer_3() {
    translate([0, 0, 34.5/2])
    cube([43.2, 79.7, 34.5], center=true);

    translate([0, -(37.5 - 13.5/2)/2 + 79.9/2 - 8 - 13.5/2, 0])
    cube([37.5 - 13.5/2, 31, 11.8], center=true);

    translate([0, 79.7/2 - 13.5/2 - 8, -25 + 1])
    rotate([0, 0, 90])
    _transformer_form(25);

    translate([18.7/2, 79.7/2 - 13.5/2 - 8, -24])
    cylinder(d=4, h=38, center=true, $fn=20);

    translate([-18.7/2, 79.7/2 - 13.5/2 - 8, -24])
    cylinder(d=4, h=38, center=true, $fn=20);
}

module mock_5V_USB_transformer() {
    difference() {
        union() {
            intersection() {
                scale([4.5, 1, 1])
                cylinder(d=22.7, h=48.5, $fn=40);

                cube([45, 30, 200], center=true);
            }

            translate([0, 0, -19 + 0.5])
            rotate([0, 0, 90])
            _transformer_form(19);

            translate([18.7/2, 0, -19 + 0.5])
            cylinder(d=4, h=38, center=true, $fn=20);

            translate([-18.7/2, 0, -19 + 0.5])
            cylinder(d=4, h=38, center=true, $fn=20);
        }

        translate([0, 2, 48.5])
        cube([14, 7, 10], center=true);
    }
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

module mock_12V_transformer() {
    translate([0, 0, 42/2])
    cube([26.5, 75, 42], center=true);

    translate([0, 75/2 - 35.5/2 - 7.4, -19 + 0.5])
    _transformer_form(19);

    translate([0, 74.6/2 - 35.5/2 - 7.4 + 18.7/2, -19 + 0.5])
    cylinder(d=4, h=35, center=true, $fn=20);

    translate([0, 74.6/2 - 35.5/2 - 7.4 - 18.7/2, -19 + 0.5])
    cylinder(d=4, h=35, center=true, $fn=20);
}

module mock_itec_psu() {
    difference() {
        union() {
            rounded_cube(
                61, 141, 35.8, 5, center=true, $fn=30
            );

            translate([
                61/2 - 4.7 - 4/2, 141/2 - 5.7 - 4/2,
                -35.8/2 - 1
            ])
            rounded_cylinder(4, 2, 0.8, $fn=20);

            translate([
                -61/2 + 4.7 + 4/2, 141/2 - 5.7 - 4/2,
                -35.8/2 - 1
            ])
            rounded_cylinder(4, 2, 0.8, $fn=20);

            translate([
                61/2 - 4.7 - 4/2, -141/2 + 5.7 + 4/2,
                -35.8/2 - 1
            ])
            rounded_cylinder(4, 2, 0.8, $fn=20);

            translate([
                -61/2 + 4.7 + 4/2, -141/2 + 5.7 + 4/2,
                -35.8/2 - 1
            ])
            rounded_cylinder(4, 2, 0.8, $fn=20);
        }

        translate([
            61/2 - 13 - 17/2, -141/2,
            -35.8/2 + 15 + 8/2
        ])
        rotate([90, 0, 0])
        hull() {
            translate([-(17 - 8)/2, 0, 0])
            cylinder(d=8, h=15, center=true, $fn=20);

            translate([(17 - 8)/2, 0, 0])
            cylinder(d=8, h=15, center=true, $fn=20);
        }
    }
}

module _mockup_box(beams=1) {
    // side rods
    translate([-440/2 + 10, 0, 2U_h - 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([-440/2 + 10, 0, 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([440/2 - 10, 0, 2U_h - 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([440/2 - 10, 0, 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=500, center=true, $fn=30);

    translate([440/2 - 10, -400/2, 10])
    rotate([90, 0, 0])
    M8_nut(cone=false);

    // front and back parts
    render() {
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

        translate([0, 500/2 - 7.5 - 5, 2U_h/2])
        rotate([180, 0, 0])
        ac_cover();
    }

    translate([0, 1.5/2, 0])
    render()
    debug_bottom();

    translate([0, 1.5/2, 0])
    render()
    debug_side();

    // beam 1 (raspi and usb hubs)
    translate([0, -161, 10])
    rotate([90, 0, 0])
    debug_beam();

    if (beams == 1) {
        // beam 2 (hdd)
        translate([0, -68, 10])
        rotate([90, 0, 0])
        debug_beam();

        // beam 3 (hdd)
        translate([0, 83.5, 10])
        rotate([90, 0, 0])
        debug_beam();
    } else {
        // beam 2 (hdd)
        translate([0, -105, 10])
        rotate([90, 0, 0])
        debug_beam();

        // beam 3 (hdd)
        translate([0, 104, 10])
        rotate([90, 0, 0])
        debug_beam();
    }

    // beam 4 (power)
    translate([0, 157.5, 10])
    rotate([90, 0, 0])
    debug_beam();

    translate([-40, 500/2 - 9 + 3/2, 2U_h/2])
    rotate([90, 0, 0])
    cord_socket_mount();

    translate([40, 500/2 - 9 + 3/2, 2U_h/2])
    rotate([90, 0, 0])
    mains_switch_mount();
}

module mockup() {
    // 2U
//    %translate([0, 0, 2U_h/2])
//    cube([440, 400, 2U_h], center=true);

    _mockup_box();

    translate([-140, -161, 22])
    rotate([0, -90, 0])
    pi_mount();
//
//    translate([-70 + 64, -161.7, 32.7])
//    rotate([-90, 0, 90])
//    D_link_hub_clip_back();
//
//    translate([-70, -161.7, 32.7])
//    rotate([-90, 0, -90])
//    D_link_hub_clip_front();
//
//    translate([15 + 67.3, -161.7, 32.7])
//    rotate([-90, 0, 90])
//    Targus_hub_clip_back();
//
//    translate([15, -161.7, 32.7])
//    rotate([-90, 0, -90])
//    Targus_hub_clip_front();

//    translate([110, -161, 30])
//    rotate([15, 0, 90])
//    mock_USB_hub_Dlink();

    translate([204, -161, 10])
    rotate([90, 0, -90])
    itec_hub_clip_back();

    translate([-20, -161, 10])
    rotate([-90, 0, -90])
    itec_hub_clip_front();

//    %translate([70, -190, 40])
//    rotate([0, -40, -90])
//    mock_USB_hub_itec_16();

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

//    translate([150, 163, 55])
//    rotate([0, 110, 0])
//    mock_5V_transformer();
//
//    translate([125, 178, 64])
//    rotate([110, 0, 90])
//    #5V_transformer_clip();
//
//    translate([60, 163, 55])
//    rotate([0, 110, 0])
//    mock_5V_transformer();
//
//    translate([35, 178, 64])
//    rotate([110, 0, 90])
//    5V_transformer_clip();

    translate([170, 157.5, 10])
    rotate([90, 0, -90])
    itec_hub_psu_clip_1();

    translate([170 - 145, 157.5, 10])
    rotate([90, 0, 90])
    itec_hub_psu_clip_2();

//    %translate([100, 160, 40])
//    rotate([0, 0, 90])
//    mock_itec_psu();

    translate([-100, 175, 34])
    rotate([90, 0, 90])
    double_transformer_clip();

//    translate([-150, 162.7, 45.5])
//    rotate([0, -90, 0])
//    mock_7_5V_transformer();
//
//    translate([-125, 182, 45.7])
//    rotate([90, 0, -90])
//    7_5V_transformer_clip();

//    translate([5/2, 5/2 + 1.5/2, 2U_h])
//    rotate([0, 180, 0])
//    debug_top();
}

module debug_beam() {
    translate([-220 + 168/2 + 10, 0, 0])
    beam_1();

    rotate([0, 90, 90])
    beam_middle();

    translate([220 - 168/2 - 10, 0, 0])
    beam_2();

    %translate([-220 + 10, 0, 0])
    cylinder(d=8, h=100, $fn=30);

    %translate([220 - 10, 0, 0])
    cylinder(d=8, h=100, $fn=30);
}

module debug_hdd_pieces() {

    translate([0, 0, -50.2])
    hdd_piece_big();

    hdd_piece();

    translate([0, 0, -25.1])
    hdd_piece();

    translate([128, 0, 27.1])
    rotate([0, 180, 0])
    hdd_piece_end();

    translate([-2.75, 57, -28.6])
    rotate([0, 90, 0])
    hdd_piece_clip_big_2();

    translate([130.75, 57, -28.6])
    rotate([0, -90, 0])
    hdd_piece_clip_big_1();

    translate([1, 57, -3.5])
    rotate([0, 90, 0])
    hdd_piece_clip();

    translate([1, 57, 17.6])
    rotate([0, 90, 0])
    hdd_piece_clip_end();

    %translate([64, 22, -50.2 + 13.5])
    rotate([0, 0, 90])
    mock_USB_HDD_Intenso_5T();

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

module debug_joiners() {
    translate([0, 0, 2/2])
    end_joiner();

    translate([-220/2, 0, 0])
    front_1();

    translate([-30, 2U_h/2 - 3/2, f_h])
    rotate([0, 90, 90])
    cover_joiner();

    translate([-220/2 + 3, 2U_h/2,  cover_d/4 + 30.1])
    rotate([90, 0, 0])
    bottom_1();

    translate([-220, 0,  cover_d/4 + 30.1])
    rotate([90, 0, 90])
    side_1();
}

module debug_D_link_clips() {
    intersection() {
        union() {
            D_link_hub_clip_back();

            translate([0, 0, 35.5 + 29])
            rotate([0, 180, 0])
            D_link_hub_clip_front();
        }

//        translate([200/2, 0, 0])
//        cube([200, 200, 200], center=true);
    }
}

module debug_Targus_clips() {
    intersection() {
        union() {
            Targus_hub_clip_back();

            translate([0, 0, 35.5 + 32])
            rotate([0, 180, 0])
            Targus_hub_clip_front();
        }

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }
}

module debug_Belkin_clips() {
    intersection() {
        union() {
            Belkin_hub_clip_back();

            translate([0, 0, 22.5 + 32])
            rotate([0, 180, 0])
            Belkin_hub_clip_front();
        }

        translate([200/2, 0, 0])
        cube([200, 200, 200], center=true);
    }
}

module debug_5V_transformer_2_clip() {
    intersection() {
        union() {
            5V_transformer_2_clip();

            translate([0, 0, 8 - 0.1])
            rotate([180, 0, 0])
            5V_transformer_2_clip_cover();
        }

        translate([0, 100/2, 0])
        cube([100, 100, 100], center=true);
    }
}

module debug_side() {

    translate([-220, -cover_d/4, 2U_h/2])
    rotate([0, 90, 0])
    side_1();

    translate([220, -cover_d/4, 2U_h/2])
    rotate([0, -90, 0])
    side_2();

    translate([-220, cover_d/4, 2U_h/2])
    rotate([0, 90, 0])
    side_3();

    translate([220, cover_d/4, 2U_h/2])
    rotate([0, -90, 0])
    side_4();

    translate([-220 + 3/2, 0, 22.5])
    rotate([90, 0, 90])
    bottom_joiner();

    translate([-220 + 3/2, 0, 66.5])
    rotate([90, 0, 90])
    bottom_joiner();

    translate([220 - 3/2, 0, 22.5])
    rotate([90, 0, 90])
    bottom_joiner();

    translate([220 - 3/2, 0, 66.5])
    rotate([90, 0, 90])
    bottom_joiner();
}

module debug_bottom() {
    render()
    translate([-220/2 + 3, -cover_d/4 + 0.1, 0])
    bottom_1();

    render()
    translate([-220/2 + 3, cover_d/4, 0])
    bottom_3();

    render()
    translate([220/2 - 3, -cover_d/4 + 0.1, 0])
    bottom_2();

    render()
    translate([220/2 - 3, cover_d/4, 0])
    bottom_4();

    render()
    translate([30, 0, 3/2])
    rotate([0, 0, 90])
    bottom_joiner();

    render()
    translate([0, 20, 3/2])
    bottom_joiner();
}

module debug_top() {
    translate([-210/2, -cover_d/4 + 0.1, 0])
    top_1_dc();

    translate([-210/2, cover_d/4, 0])
    top_2_dc();

    translate([210/2, -cover_d/4 + 0.1, 0])
    top_3_dc();

    translate([210/2, cover_d/4, 0])
    top_4_dc();
}

module debug_transformers() {
    rotate([90, 0, 0])
    debug_beam();

    translate([90, 17.7, 53])
    rotate([110, 0, 90])
    5V_transformer_clip();

    translate([20, 17.7, 53])
    rotate([110, 0, 90])
    5V_transformer_2_clip();

    translate([-60, 21.9, 35.65])
    rotate([90, 0, 90])
    5V_transformer_3_clip();

    translate([-29, -3.3, 35.5])
    rotate([0, 90, 0])
    mock_5V_transformer_3();
}

module debug_stepdown_box_side_clip() {
    stepdown_box_side_clip();

    translate([0, 3, -25])
    rotate([0, 0, -90])
    pi_mount();

    translate([40, -5/2, 5])
    rotate([90, 0, 0])
    box_bottom();

    translate([40, -5/2 - 5, 5])
    rotate([90, 0, 180])
    box_top();
}

module debug_stepdown_box_clip() {
    stepdown_box_clip();

    translate([0, 5/2, 10])
    rotate([0, 90, 0]) {
        rotate([-90, 0, 0])
        box_bottom();

//        translate([0, 5, 0])
//        rotate([-90, 0, 180])
//        box_top();
    }
}

module debug_ac_cover() {
    %translate([-220/2, 0, 0])
    back_1();

    %translate([220/2, 0, 0])
    back_2();

    translate([0, 0, 5/2 + 2])
    rotate([90, 0, 0])
    ac_cover();
}

module debug_adapter_WD_E_5T() {
    translate([0, 0, 82.5/2])
    rotate([0, 90, 90])
    mock_USB_HDD_WD_E_5T();

    intersection() {
        translate([0, 0, 15/2])
        adapter_USB_HDD_WD_E_5T_bottom();

        translate([200/2, 0, 0])
        cube([200, 100, 60], center=true);
    }

    translate([0, 0, 75])
    rotate([0, 180, 0])
    adapter_USB_HDD_WD_E_5T_top();
}

module debug_box4() {

    // not viable probably

    module _seagate_usb() {
        union() {
            cube([35, 176, 121], center=true);

            translate([-35/2 + 9, -176/2, -121/2 + 23])
            rotate([90, 0, 0])
            cylinder(d=10, h=40, center=true);

            translate([-35/2 + 6.5, -176/2, -121/2 + 42])
            cube([4.5, 40, 16], center=true);
        }
    }

    module _hdds() {
        // WD 8T
        translate([-134, 0, 49/2 + 5.55])
        union() {
            rotate([0, 90, 90])
            cube([49, 139.7, 171], center=true);

            translate([139.7/2, -171/2 + 30, 49/2 - 10])
            rotate([0, 90, 0])
            cylinder(d=10, h=40, center=true);
        }

        // Seagates
        translate([142, 0, 2U_h - 35/2 - 4])
        rotate([0, 90, 0])
        _seagate_usb();

        translate([2, 0, 35/2 + 3.5])
        rotate([0, 90, 0])
        _seagate_usb();

        translate([142, 0, 35/2 + 4])
        rotate([0, 90, 0])
        _seagate_usb();

        // other usb box
        translate([4, 0, 2U_h - 32/2 - 4])
        rotate([0, 90, 0])
        cube([31.7, 182, 117], center=true);

        // usb ssds
        translate([8, -10, 45.75])
        rotate([0, 90, 0])
        cube([12.5, 123, 77], center=true);

        translate([72, 0, 45])
        rotate([0, 0, 0])
        cube([12.5, 123, 77], center=true);

        translate([-150, -10, 62])
        rotate([0, 90, 0])
        cube([13, 126, 75.5], center=true);

        translate([-150, -10, 77])
        rotate([0, 90, 0])
        cube([13, 130, 78], center=true);

        translate([-90, -10, 60])
        rotate([0, 90, 0])
        cube([9, 102, 32], center=true);
    }

    %_mockup_box(beams=2);

    _hdds();

    // hubs
    translate([-70 + 64, -161.7, 32.7])
    rotate([-90, 0, 90])
    D_link_hub_clip_back();

    translate([-70, -161.7, 32.7])
    rotate([-90, 0, -90])
    D_link_hub_clip_front();

//    translate([15 + 67.3, -161.7, 32.7])
//    rotate([-90, 0, 90])
//    Targus_hub_clip_back();
//
//    translate([15, -161.7, 32.7])
//    rotate([-90, 0, -90])
//    Targus_hub_clip_front();

//    translate([110, -161, 30])
//    rotate([15, 0, 90])
//    mock_USB_hub_Dlink();
    translate([0, 100, 24])
    rotate([0, 0, 90])
    mock_PSU_240W();
}

module debug_raspberry_pi_clips() {

    pi_mount();

    translate([0, 0, 64])
    rotate([180, 0, 0])
    pi_mount();

    %translate([5, -60/2 + 0.5, 67.3])
    rotate([0, 90, 0])
    mock_raspberry_pi();

    %translate([-20/2, 0, 20])
    _profile_v2(100);
}

module debug_connector_clips() {
    connector_clip_small();

    translate([0, -3, 22])
    rotate([90, 90, 0])
    mock_liitinrima_small(6);
}

module debug_stepdown_converter_2_clip() {
    stepdown_converter_2_clip();

    translate([12, -2, 11])
    rotate([90, 0, 0])
    mock_stepdown_converter_2();
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

module _joiner_form(l=30) {
    rotate([45, 0, 0])
    cube([l - slop, 10 - slop, 10 - slop], center=true);
}

module _joiner_2_form(l=30) {
    difference() {
        cube([l, 13, 5], center=true);

        translate([0, 13/2 + 10/2 + 1, 0])
        rotate([45, 0, 0])
        cube([l + 1, 10, 10], center=true);

        translate([0, -13/2 - 10/2 - 1, 0])
        rotate([45, 0, 0])
        cube([l + 1, 10, 10], center=true);
    }
}

module bottom_joiner() {
    intersection() {
        scale([1, 0.98, 1])
        _joiner_form();

        cube([9.5, 40, 3], center=true);
    }
}

module end_joiner(l=14.5) {
    scale([1, 0.98, 1])
    intersection() {
        _joiner_2_form(l);

        cube([100, 100, 2], center=true);
    }
}

module cover_joiner(l=9.5) {
    scale([1, 0.98, 1])
    intersection() {
        _joiner_form(l);

        cube([100, 100, 3], center=true);
    }
}

module _end_joiner_support(l, h=11, d=2) {
    cube([l, 0.6, h], center=true);
}

module _cover_joiners() {
    for (i = cover_joiner_positions_x) {
        translate([i, 2U_h/2 - 3/2, 0])
        rotate([0, 90, 90])
        cover_joiner();
    }

   for (i = cover_joiner_positions_y) {
        translate([-220/2 + 3/2, i, 0])
        rotate([0, 90, 0])
        cover_joiner();
   }
}

module _end_form(middle_top_mount=true) {
    union() {
        intersection() {
            difference() {
                translate([10/2, 0, f_h/2])
                chamfered_cube_side(
                    230, 2U_h, f_h, 4.5,
                    center=true, $fn=30);

                translate([10/2 + 1/2, -1/2,
                           (f_h + 10)/2 + 2])
                chamfered_cube(
                    225, 2U_h - 5, f_h + 10,
                    7, center=true);

                translate([10/2, 0,
                           (f_h - 1)/2 + 2])
                chamfered_cube(
                    226, 2U_h - 4, f_h - 1,
                    7, center=true);

                translate([220/2, 30, 2/2])
                _joiner_2_form(15);

                translate([220/2, -30, 2/2])
                _joiner_2_form(15);

                translate([220/2, 0, 2/2])
                _joiner_2_form(15);

                translate([220/2, 2U_h/2 - 2/2,
                           f_h - 12])
                rotate([90, 0, 0])
                _joiner_2_form(15);

                translate([220/2, -2U_h/2 + 2/2,
                           f_h - 12])
                rotate([90, 0, 0])
                _joiner_2_form(15);

            }

            cube([220, 2U_h * 2, 100], center=true);
        }

        translate([0, 0, f_h])
        _cover_joiners();

        translate([-220/2 + 10, 2U_h/2 - 10, 0])
        cylinder(d=17, h=f_h, $fn=30);

        translate([-220/2 + 10, -2U_h/2 + 10, 0])
        cylinder(d=17, h=f_h, $fn=30);

        translate([-220/2 + 40, -2U_h/2 + 1.8, f_h - 2])
        _top_mount();

        if (middle_top_mount) {
            translate([220/2 - 14/2, -2U_h/2 + 1.8,
                       f_h - 2])
            difference() {
                _top_mount();

                translate([4.5, 0, -8.6])
                cube([10, 1, 10], center=true);

                translate([10, 0, -5])
                rotate([0, 45, 0])
                cube([10, 20, 30], center=true);
            }
        }
    }
    
    // supports
    translate([220/2 -7.2/2, 2U_h/2 - 2/2, f_h - 12])
    _end_joiner_support(7.2);

    translate([220/2 -7.2/2, -2U_h/2 + 2/2, f_h - 12])
    _end_joiner_support(7.2);
}

module _top_mount() {
    difference() {
        hull() {
            translate([0, 10/2, 10/2 + 2])
            cube([10, 10, 10], center=true);

            translate([0, 0.1/2, 0])
            cube([10, 0.1, 24], center=true);
        }
        translate([0.1, 0, 12 - 4.8])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=30, center=true, $fn=20);

        translate([0, 0, 11/2 + 2])
        cube([20, 2, 11], center=true);
    }
}

module front_1(middle_top_mount=true) {
    f_h = 30;

    difference() {
         _end_form(middle_top_mount=middle_top_mount);

        translate([-220/2 + 10, 2U_h/2 - 10, 0])
        cylinder(d=rod_d, h=f_h * 3,
            center=true, $fn=30);

        translate([-220/2 + 10, 2U_h/2 - 10, -0.1])
        M8_nut(cone=false, bridging=true);

        translate([-220/2 + 10, -2U_h/2 + 10, 0])
        cylinder(d=rod_d, h=f_h * 3,
            center=true, $fn=30);

        translate([-220/2 + 10, -2U_h/2 + 10, -0.1])
        M8_nut(cone=false, bridging=true);

        for(i = [0:22]) {
            translate([-220/2 + 25 + i * 8, 0, 1.5])
            difference() {
                cube([4, 2U_h - 20, 10], center=true);

                translate([-10/2 - 1.5, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=10, h=2U_h, center=true,
                    $fn=80);

                translate([10/2 + 1.5, 0, 0])
                rotate([90, 0, 0])
                cylinder(d=10, h=2U_h, center=true,
                    $fn=80);
            }
        }
    }
}

module front_2() {
    mirror([1, 0, 0])
    front_1(middle_top_mount=false);
}

module back_1(middle_top_mount=false) {
    f_h = 30;

    difference() {
        union() {
            mirror([0, 1, 0])
            _end_form(middle_top_mount=middle_top_mount);

            translate([70, 0, 0])
            for (i = [0:3]) {
                rotate([0, 0, 90 * i])
                translate([50/2 + 3, 50/2 + 3, 0])
                rotate([0, 0, i*90 + 30])
                cylinder(d=10, h=5, $fn=6);
            }
        }
        translate([-220/2 + 10, 2U_h/2 - 10, 0])
        cylinder(d=rod_d, h=f_h * 3,
            center=true, $fn=30);

        translate([-220/2 + 10, -2U_h/2 + 10, 0])
        cylinder(d=rod_d, h=f_h * 3,
            center=true, $fn=30);

        translate([220/2, 0, f_h])
        cube([20, 2U_h - 34, 18], center=true);

        translate([70, 0, -1])
        rounded_cube(50, 50, 10, 2, center=true, $fn=30);

        translate([70, 0, -1])
        for (i = [0:3]) {
            rotate([0, 0, 90 * i])
            translate([50/2 + 3, 50/2 + 3, 3]) {
                cylinder(d=3.3, h=29,
                    center=true, $fn=30);

                rotate([0, 0, i*90 + 30])
                M3_nut(3);
            }
        }

        translate([-5, 0, 2 + 10/2])
        cube([82, 82, 10], center=true);

        translate([-5, 0, 0])
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([72/2, 72/2, 0])
            cylinder(d=5.3, h=55, center=true, $fn=30);
        }

        translate([-5, 0, 0])
        cylinder(d=80.5, h-20, center=true, $fn=60);
    }

    %translate([-5, 0, 25/2 + 2])
    mock_fan_80mm();
}

module back_2() {
    mirror([1, 0, 0])
    back_1(middle_top_mount=true);
}

module _cable_mount() {
    intersection() {
        translate([0, 0, -1])
        rotate([90, 0, 0])
        tube(14, 5, 1.5, $fn=30);

        translate([10/2 , 0, 0])
        cube([10, 20, 20], center=true);
    }
}

module _cover_mount_stud() {
    cylinder(d1=12, d2=8, h=3, $fn=20);
}

module _bottom_form(h) {
    w = 220 - 6;

    intersection() {
        difference() {

            translate([0, 0, 3/2])
            cube([w, h, 3], center=true);

            for(i = bottom_joiner_positions) {
                translate([w/2, i, 3/2])
                _joiner_form(10);

                translate([-w/2, i, 3/2])
                _joiner_form(10);
            }

            for (i = cover_joiner_positions_x) {
                translate([i - 3, h/2, 3/2])
                rotate([0, 0, 90])
                _joiner_form(10);

                translate([i - 3, -h/2, 3/2])
                rotate([0, 0, 90])
                _joiner_form(10);

            }

            translate([0, 0, 0.6])
            intersection() {
                bottom_pattern();

                translate([0, 0, 10/2])
                difference() {
                    chamfered_cube(
                        w - 4, h - 4, 10, 3, center=true);

                    for(i = bottom_joiner_positions) {
                        translate([w/2, i, 3/2])
                        cube([14, 18, 20], center=true);

                        translate([-w/2, i, 3/2])
                        cube([14, 18, 20], center=true);
                    }

                    for (i = cover_joiner_positions_x) {
                        translate([i - 3, h/2, 3/2])
                        cube([18, 14, 20], center=true);

                        translate([i - 3, -h/2, 3/2])
                        cube([18, 14, 20], center=true);
                    }
                }
            }

            translate([-220/2 + 10 - 6/2, -h/2, 10])
            rotate([90, 0, 0])
            cylinder(d=16.2, h=20, center=true, $fn=40);
        }

    }
    %translate([-220/2 + 10 - 3, h/2, 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=h, $fn=20);
}


module _cover_rod_hole() {
    difference() {
        union() {
            cylinder(d=11, h=16, $fn=30);

            translate([0, 10/2, 16/2])
            cube([3, 10, 16], center=true);

            translate([-10/2, 0, 16/2])
            cube([10, 3, 16], center=true);
        }

        cylinder(d=8, h=50, center=true, $fn=30);

        translate([0, 0, -9])
        rotate([0, 45, -45])
        cube([20, 20, 60], center=true);
    }
}

module bottom_1() {
    h = cover_d/2;

    difference() {
        union() {
            _bottom_form(h);

            translate([-49, -h/2 + 50, 0])
            _cover_mount_stud();

            translate([-49, -h/2 + 143, 0])
            _cover_mount_stud();

            translate([220/2 - 33, -h/2 + 50, 0])
            _cover_mount_stud();

            translate([220/2 - 33, -h/2 + 143, 0])
            _cover_mount_stud();

        }

        translate([-49, -h/2 + 50, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }

        translate([220/2 - 33, -h/2 + 50, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }

        translate([-49, -h/2 + 143, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }

        translate([220/2 - 33, -h/2 + 143, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }
    }
}

module bottom_2() {
    mirror([1, 0, 0])
    bottom_1();
}

module bottom_3() {
    h = cover_d/2;

    difference() {
        union() {
            mirror([0, 1, 0])
            _bottom_form(h);

            translate([-49, -h/2 + 82.5, 0])
            _cover_mount_stud();

            translate([-49, -h/2 + 156.5, 0])
            _cover_mount_stud();

            translate([220/2 - 33, -h/2 + 82.5, 0])
            _cover_mount_stud();

            translate([220/2 - 33, -h/2 + 156.5, 0])
            _cover_mount_stud();

        }

        translate([-49, -h/2 + 82.5, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }

        translate([220/2 - 33, -h/2 + 82.5, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }

        translate([-49, -h/2 + 156.5, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }

        translate([220/2 - 33, -h/2 + 156.5, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=20);

            cylinder(d1=9.7, d2=3.3, h=3.2,
                center=true, $fn=20);
        }
    }
}

module bottom_4() {
    mirror([1, 0, 0])
    bottom_3();
}

module _rod_clip() {

    intersection() {
        union() {
            difference() {
                hull() {
                    translate([0, 0, 10])
                    rotate([90, 0, 0])
                    cylinder(d=12, h=10, center=true, $fn=30);

                    translate([1, 0, 1/2])
                    cube([12, 10, 1], center=true);
                }

                translate([0, 0, 10])
                rotate([90, 0, 0])
                cylinder(d=8, h=12, center=true, $fn=30);

                translate([0, 0, 10 + 4])
                cube([7, 12, 5], center=true);
            }
            translate([3, 0, 3/2])
            cube([13, 13, 3], center=true);
        }

//        translate([5, 0, 30/2])
//        chamfered_cube(30, 40, 30, 4.5, center=true, $fn=30);
    }
}

module _side_form() {

    union() {
        difference() {

            intersection() {
                translate([0, 0, 20/2])
                rotate([90, 0, 0])
                chamfered_cube_side(
                    2U_h, 20, cover_d / 2,
                    4.5, center=true);

                translate([0, 0, (6 + 15/2)/2])
                cube([2U_h, cover_d, 6 + 15/2],
                    center=true);
            }

            translate([-2U_h/2 + 1.7/2 - slop,
                0, 20/2 + 10])
            cube([1.7, 300, 20], center=true);

            translate([0, 0, 30/2 + 3])
            chamfered_cube(2U_h - 6, 300, 30,
                2.2, center=true);

            translate([2U_h/2, 0, 20/2 + 6])
            cube([10, 300, 20], center=true);

            translate([0.5, 0, 0.6])
            difference() {
                intersection() {
                    translate([0, 0, 0])
                    bottom_pattern();

                    translate([0, 0, 20/2 + 0.6])
                    chamfered_cube(
                        2U_h - 7, cover_d / 2 - 3,
                        20, 3, center=true);

                    difference() {
                        translate([0, 0, 4/2])
                        cube([400, cover_d / 2 - 2, 4],
                        center=true);

                        for(i = cover_joiner_positions_y) {
                            translate([i, cover_d / 4, 3/2])
                            cube([19, 14, 10], center=true);
                        }

                        for(i = cover_joiner_positions_y) {
                            translate([i, -cover_d / 4, 3/2])
                            cube([19, 14, 10], center=true);
                        }
                    }
                }
            }

            for(i = cover_joiner_positions_y) {
                translate([i, -cover_d / 4, 3/2])
                rotate([0, 0, 90])
                _joiner_form(10);
            }

            for(i = cover_joiner_positions_y) {
                translate([i, cover_d / 4, 3/2])
                rotate([0, 0, 90])
                _joiner_form(10);
            }

            translate([-2U_h/2 + 10, -cover_d/4, 10])
            rotate([90, 0, 0])
            cylinder(d=16.2, h=20, center=true, $fn=40);

            translate([2U_h/2 - 10, -cover_d/4, 10])
            rotate([90, 0, 0])
            cylinder(d=16.2, h=20, center=true, $fn=40);
        }

        translate([0, 0, 0.8])
        rotate([0, -90, 0])
        _cable_mount();

        translate([0, 70, 0.8])
        rotate([0, -90, 0])
        _cable_mount();

        translate([0, -70, 0.8])
        rotate([0, -90, 0])
        _cable_mount();

        for(i = bottom_joiner_positions) {
            translate([2U_h/2 - 3/2, i, 6])
            intersection() {
                rotate([0, 90, 0])
                cover_joiner();

                translate([0, 0, 15/2 -0.1])
                cube([10, 30, 15], center=true);
            }
        }
    }

    %translate([-2U_h/2 + 10, 0, 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=cover_d, center=true, $fn=20);

    %translate([2U_h/2 - 10, 0, 10])
    rotate([90, 0, 0])
    cylinder(d=8, h=cover_d, center=true, $fn=20);
}

module side_1() {
    union() {
        _side_form();

        translate([-2U_h/2 + 10, -cover_d/4 + 20, 0])
        _rod_clip();

        translate([2U_h/2 - 10, -cover_d/4 + 20, 0])
        rotate([0, 0, 180])
        _rod_clip();

        translate([-2U_h/2 + 10, 0, 0])
        _rod_clip();

        translate([2U_h/2 - 10, 0, 0])
        rotate([0, 0, 180])
        _rod_clip();

        translate([-2U_h/2 + 10, cover_d/4 - 20, 0])
        _rod_clip();

        translate([2U_h/2 - 10, cover_d/4 - 20, 0])
        rotate([0, 0, 180])
        _rod_clip();
    }
}

module side_2() {
    mirror([1, 0, 0])
    side_1();
}

module side_3() {
    union() {
        mirror([0, 1, 0])
        _side_form();

        translate([-2U_h/2 + 10, -cover_d/4 + 20, 0])
        _rod_clip();

        translate([2U_h/2 - 10, -cover_d/4 + 20, 0])
        rotate([0, 0, 180])
        _rod_clip();

        translate([-2U_h/2 + 10, 0, 0])
        _rod_clip();

        translate([2U_h/2 - 10, 0, 0])
        rotate([0, 0, 180])
        _rod_clip();

        translate([-2U_h/2 + 10, cover_d/4 - 20, 0])
        _rod_clip();

        translate([2U_h/2 - 10, cover_d/4 - 20, 0])
        rotate([0, 0, 180])
        _rod_clip();
    }
}

module side_4() {
    mirror([1, 0, 0])
    side_3();
}

module top_1() {

    top_d = cover_d/2 + 4.8;    
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
            cube([10, cover_d, 5], center=true);

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

module top_1_dc() {
    difference() {
        top_1();

        translate([5, 0, -0.2])
        scale([2, 2, 3])
        mirror([1, 0, 0])
        _chia_logo();
    }
}

module top_1_dc_chia_logo() {
    intersection() {
        translate([0, 0, 2.8/2])
        cube([400, 400, 2.8], center=true);

        translate([5, 0, -0.2])
        scale([2, 2, 3])
        mirror([1, 0, 0])
        _chia_logo();
    }
}

module top_2() {
    top_d = cover_d/2 - 5.2;    
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
            cube([10, cover_d, 5], center=true);

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

                    translate([top_w/2 - 1.8, top_d/2, 0])
                    cube([10, 20, 10], center=true);
                }
            }

            translate([-top_w/2 + 30, top_d/2 - 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }

            translate([top_w/2 - 1.8, top_d/2 - 10/2, 0]) {
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

module top_2_dc() {
    difference() {
        top_2();

        translate([0, 0, -0.2])
        scale([2, 2, 3])
        _raspi_logo_1();

        translate([0, 0, -0.2])
        scale([2, 2, 3])
        _raspi_logo_2();
    }
}

module top_2_dc_raspi_green() {
    intersection() {
        translate([0, 0, 2.8/2])
        cube([400, 400, 2.8], center=true);

        translate([0, 0, -0.2])
        scale([2, 2, 3])
        _raspi_logo_1();
    }
}

module top_2_dc_raspi_red() {
    intersection() {
        translate([0, 0, 2.8/2])
        cube([400, 400, 2.8], center=true);

        translate([0, 0, -0.2])
        scale([2, 2, 3])
        _raspi_logo_2();
    }
}

module top_3() {
    top_d = cover_d/2 + 4.8;    
    top_w = (440 - 20)/2 + 4.8;

    union() {
        difference() {
            translate([0, 0, 2.8/2])
            cube([top_w, top_d, 2.8], center=true);

            translate([top_w/2, 0, 5/2 + 1.6])
            cube([10, cover_d, 5], center=true);

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

                    translate([-top_w/2 + 11.8, -top_d/2, 0])
                    cube([10, 20, 10], center=true);
                }
            }

            translate([top_w/2 - 30, -top_d/2 + 10/2, 0]) {
                cylinder(d=3.3, h= 10, center=true, $fn=20);
                cylinder(d1=9.7, d2=3.3, h=3.2,
                    center=true, $fn=20);
            }

            translate([-top_w/2 + 11.8, -top_d/2 + 10/2, 0]) {
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

module top_3_dc() {
    difference() {
        top_3();

        translate([0, 0, -0.2])
        scale([1.5, 1.5, 3])
        mirror([1, 0, 0])
        _bitcoin_logo_1();

        translate([0, 0, -0.2])
        scale([1.5, 1.5, 3])
        mirror([1, 0, 0])
        _bitcoin_logo_2();
    }
}

module top_3_dc_bitcoin_orange() {
    intersection() {
        translate([0, 0, 2.8/2])
        cube([400, 400, 2.8], center=true);

        translate([0, 0, -0.2])
        scale([1.5, 1.5, 3])
        mirror([1, 0, 0])
        _bitcoin_logo_1();
    }
}

module top_3_dc_bitcoin_black() {
    intersection() {
        translate([0, 0, 2.8/2])
        cube([400, 400, 2.8], center=true);

        translate([0, 0, -0.2])
        scale([1.5, 1.5, 3])
        mirror([1, 0, 0])
        _bitcoin_logo_2();
    }
}

module top_4() {
    top_d = cover_d/2 - 5.2;    
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
            cube([10, cover_d, 5], center=true);

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

module top_4_dc() {
    difference() {
        top_4();

        translate([0, 0, -0.2])
        scale([1.5, 1.5, 3])
        mirror([1, 0, 0])
        _hdd_logo();
    }
}

module top_4_dc_hdd_logo() {
    intersection() {
        translate([0, 0, 2.8/2])
        cube([400, 400, 2.8], center=true);

        translate([0, 0, -0.2])
        scale([1.5, 1.5, 3])
        mirror([1, 0, 0])
        _hdd_logo();
    }
}

module beam_1() {
    l = 168;
    difference() {
        intersection() {
            union() {
                rotate([0, 90, 0])
                _profile_v2(l);

                translate([-l/2, 0, 0])
                cylinder(d=12, h=20,
                    center=true, $fn=40);

            }
            translate([0, 3, 0])
            cube([2 * l, 20, 20], center=true);
        }

        translate([l/2, 0, 20/2 - 0.2])
        rotate([0, 90, 90])
        _joint_form();

        translate([-l/2, 0, 0])
        cylinder(d=8, h=40, center=true, $fn=40);

        translate([-l/2 - 5, 0, 0])
        cube([6, 6.5, 30], center=true);

        translate([-l/2 - 10, 0, 0])
        cube([10, 10, 30], center=true);

        #translate([-30, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=40, center=true, $fn=10);
    }
}

module beam_2() {
    
    l = 168;

    difference() {
        intersection() {
            union() {
                rotate([0, 90, 0])
                _profile_v2(l);

                translate([l/2, 0, 0])
                cylinder(d=12, h=20,
                    center=true, $fn=40);

            }
            translate([0, 3, 0])
            cube([2 * l, 20, 20], center=true);
        }

        translate([-l/2, 0, 20/2 - 0.2])
        rotate([0, 90, 90])
        _joint_form();

        translate([l/2, 0, 0])
        cylinder(d=8, h=40, center=true, $fn=40);

        translate([l/2 - 0.45, -5, 0])
        rotate([0, 0, -5])
        cube([7, 8.5, 30], center=true);

        translate([l/2 + 2, -10, 0])
        cube([10, 10, 30], center=true);

        #translate([30, 0, 0])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=40, center=true, $fn=10);
    }
}

module beam_middle() {
    l = 164;
    
    intersection() {
        union() {
            translate([0, 0, 0])
            rotate([90, 0, 0])
            _profile_v2(l - 80 - 0.5);

            translate([-20/2, l/2 - 80/2, 0])
            intersection() {
                joint_block_v2();

                translate([0, 41/2 - 0.5, 0])
                cube([30, 41, 30], center=true);
            }

            translate([-20/2, -l/2 + 80/2, 0])
            intersection() {
                joint_block_v2();

                translate([0, -41/2 + 0.5, 0])
                cube([30, 41, 30], center=true);
            }
        }

        difference() {
            translate([0, 0, 3])
            cube([20, 2 * l, 20], center=true);

            #translate([0, -30, 0])
            cylinder(d=2.8, h=40, center=true, $fn=10);

            #translate([0, 30, 0])
            cylinder(d=2.8, h=40, center=true, $fn=10);
        }
    }
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

module hdd_piece_big() {

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

            translate([-1.5, -20, 0])
            cube([131, 83, h]);

            translate([-8.5 + 3, 83 - 20 - 15, 0])
            cube([5, 8, 18]);

            translate([128.5, 83 - 20 - 15, 0])
            cube([5, 8, 18]);

            translate([-6.5, -2, 0])
            cube([5, 2, 13]);

            translate([128.55, -2, 0])
            cube([5, 2, 13]);

            translate([126, -1, 0])
            hull() {
                cube([1, 23, 2]);
                cube([23, 1, 2]);
            }

            translate([1, -1, 0])
            hull() {
                cube([1, 23, 2]);

                translate([-22, 0, 0])
                cube([23, 1, 2]);
            }
        }
        translate([0, -18, 2])
        cube([128, 85, 24]);

        translate([-3, 0, 2])
        cube([138, 48, 24]);

        translate([-3, 20, 18])
        cube([138, 48, 24]);

        translate([22, -40, 6])
        cube([87, 48, 24]);

        translate([-3.75, 83 - 20 - 16, 2])
        cube([2, 15, 6]);

        translate([-3.75, 83 - 20 - 16, 10])
        cube([2, 15, 6]);

        translate([129.75, 83 - 20 - 16, 2])
        cube([2, 15, 6]);

        translate([129.75, 83 - 20 - 16, 10])
        cube([2, 15, 6]);

        for(i = [1:7]) {
            translate([16 * i, -5, 0])
            hull() {
                cylinder(d=6, h=10, center=true, $fn=30);

                translate([0, 55, 0])
                cylinder(d=6, h=10, center=true, $fn=30);
            }
        }

        translate([-5/2 - 2, -12, 0])
        cube([5, 15, 50], center=true);

        translate([131 + 5/2 - 1, -12, 0])
        cube([5, 15, 50], center=true);
    }

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

module hdd_piece_clip_big_1() {
    union() {
        translate([-22.8/2 + 11.4/4, 0, 0])
        cube([11.4/2, 12, 1.8], center=true);

        translate([22.8/2 - 11.4/4, 0, 3.75])
        cube([11.4/2, 12, 1.8], center=true);

        translate([22.8/2 - 11.4/4, 12/2 - 5/2, (3.75 + 1.8)/2 - 1.8/2])
        cube([11.4/2, 5, 3.75 + 1.8], center=true);

        translate([0, 12/2 - 5/2, 0])
        cube([14.8, 5, 1.8], center=true);
    }
}

module hdd_piece_clip_big_2() {
    mirror([1, 0, 0])
    hdd_piece_clip_big_1();
}

module pi_mount() {

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
        rounded_cube_side(
            119.7, 22.7, 15, 3, center=true, $fn=30
        );

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
        rounded_cube_side(
            119.7, 22.7, 8, 3, center=true, $fn=30
        );

        cube([108.2, 20.2, 10], center=true);

        translate([107.2/2 + 10/2 + 3, 0, 0])
        rounded_cube_side(
            10, 14, 10, 3, center=true, $fn=30
        );

        translate([-107.2/2 - 10/2 - 3, 0, 0])
        rounded_cube_side(
            10, 14, 10, 3, center=true, $fn=30
        );
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
        cube([119.7, 22.7, 8], center=true);

        cube([117.4, 21, 10], center=true);
    }
}

module adapter_USB_HDD_Seagate_5T_2_bottom() {
    difference() {
        cube([119.7, 22.7, 15], center=true);

        translate([0, 0, 1])
        cube([115.6, 21, 15], center=true);

        cube([100, 10, 20], center=true);
    }
}

module adapter_USB_HDD_Seagate_5T_2_top() {
    difference() {
        cube([119.7, 22.7, 8], center=true);

        cube([115.6, 21, 10], center=true);
    }
}

module adapter_USB_HDD_Intenso_5T_bottom() {
    difference() {
        cube([127.7, 22.7, 15], center=true);

        translate([0, 0, 1.4])
        cube([126.4, 20.4, 15], center=true);

        cube([105, 10, 20], center=true);
    }
}

module adapter_USB_HDD_Intenso_5T_top() {
    difference() {
        cube([127.7, 22.7, 8], center=true);

        cube([126.4, 21, 10], center=true);
    }
}

module adapter_USB_HDD_WD_5T_top() {
    difference() {
        rounded_cube_side(
            119.7, 22.7, 8, 3, center=true, $fn=30
        );

        cube([107.2, 19.2, 10], center=true);

        translate([107.2/2 + 10/2 + 2.5, 0, 0])
        rounded_cube_side(
            10, 14, 10, 3, center=true, $fn=30
        );

        translate([-107.2/2 - 10/2 - 2.5, 0, 0])
        rounded_cube_side(
            10, 14, 10, 3, center=true, $fn=30
        );

    }
}

module adapter_USB_HDD_WD_5T_bottom() {
    difference() {
        rounded_cube_side(
            119.7, 22.7, 15, 3, center=true, $fn=30
        );

        translate([0, 0, 1.6])
        cube([107.2, 19.2, 15], center=true);

        cube([100, 10, 20], center=true);

        translate([-119.7/2, 0 , 0])
        cube([7.4, 15, 20], center=true);

        translate([119.7/2, 0 , 0])
        cube([7.4, 15, 20], center=true);

    }
}

module adapter_USB_HDD_WD_E_5T_bottom() {
    difference() {
        rounded_cube_side(
            119.7, 22.7, 15, 3, center=true, $fn=30
        );

        
        hull() {
            translate([0, 0.5, -15/2 + 1/2])
            rotate([-5, 0, 0])
            cube([110.2, 17.2, 1], center=true);

            translate([0, 0.3, 0])
            cube([110.2, 21, 1], center=true);

            translate([0, 0, 15/2])
            cube([110.2, 23.2, 1], center=true);
        }

        translate([0, 0, 15/2])
        cube([110.2, 26, 10], center=true);

        cube([100, 10, 20], center=true);

        translate([-119.7/2, 0 , 0])
        cube([6, 15, 20], center=true);

        translate([119.7/2, 0 , 0])
        cube([6, 15, 20], center=true);

    }
}

module adapter_USB_HDD_WD_E_5T_top() {
    intersection() {
        adapter_USB_HDD_WD_E_5T_bottom();

        translate([0, 0, -2])
        cube([200, 100, 5], center=true);
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

module 5V_transformer_2_clip() {
    difference() {
        intersection() {
            union() {
                translate([-6, -44, -4])
                rotate([-20, 0, 0])
                rotate([0, 0, 180])
                scale([1, 1, 1.2])
                _frame_clip_v2();

                translate([0, 0, 8/2])
                rounded_cube_side(27, 15, 8, 4, center=true);

                hull() {
                    intersection() {
                        translate([-6 - 12, -44 + 1, 6])
                        rotate([-20, 0, 0])
                        cube([10, 1, 15], center=true);

                        translate([0, 0, 8/2])
                        cube([200, 200, 8], center=true);
                    }

                    translate([0, -7, 8/2])
                    cube([10, 1, 8], center=true);
                }

                hull() {
                    translate([-6 - 12, -44 + 1, 6])
                    rotate([-20, 0, 0])
                    cube([3, 0.01, 18], center=true);

                    translate([-8.8, -25, 8/2])
                    cube([3, 0.01, 8], center=true);
                }
            }

            translate([0, 0, 100/2])
            cube([200, 200, 100], center=true);
        }

        translate([-12.5/2, 0, 0])
        cube([1.8, 6.7, 20], center=true);

        translate([12.5/2, 0, 0])
        cube([1.8, 6.7, 20], center=true);

        translate([27.2/2 + 0.7, 0, 8/2 - 0.1])
        sphere(d=3.2, $fn=30);

        translate([-27.2/2 - 0.7, 0, 8/2 - 0.1])
        sphere(d=3.2, $fn=30);
    }

    %translate([-15, 0, 8])
    rotate([0, 0, -90])
    mock_5V_transformer_2();
}

module 5V_transformer_2_clip_cover() {
    union() {
        difference() {
            translate([0, 0, 20/2])
            rounded_cube_side(27 + 2.7, 15 + 2.7,
                20, 4 + 2.7, center=true);

            translate([0, 0, 20/2])
            rounded_cube_side(27 + 0.2, 15 + 0.2,
                22, 4 + 0.2, center=true);

            translate([-0.5, 8, 0])
            rotate([0, 0, 26])
            cube([10, 8, 16.8], center=true);
        }

        translate([0, 0, 20])
        difference() {
            hull() {
                rounded_cube_side(27 + 2.7, 15 + 2.7,
                    0.2, 4 + 2.7, center=true);

                translate([0, 0, 14 - 0.1/2])
                rounded_cube_side(10, 6.3, 0.1, 1.4, center=true);
            }
            hull() {
                translate([0, 0, -0.2/2])
                rounded_cube_side(27 + 0.2, 15 + 0.2,
                    0.2, 4 + 0.2, center=true);

                translate([0, 0, 14])
                rounded_cube_side(10 - 2.58, 6.3 - 2.56, 0.1,
                    0.2, center=true);
            }
        }

        translate([0, 0, 34 + 6/2])
        difference() {
            rounded_cube_side(10, 6.3, 6, 1.4, center=true);

            rounded_cube_side(10 - 2.5, 6.3 - 2.5, 7,
                0.2, center=true);
        }

        intersection() {
            union() {
                translate([27.2/2 + 0.7, 0, 8/2])
                sphere(d=3, $fn=30);

                translate([-27.2/2 - 0.7, 0, 8/2])
                sphere(d=3, $fn=30);
            }
            cube([28, 6, 20], center=true);
        }

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

module 5V_transformer_3_clip() {

    mirror([1, 0, 0])
    7_5V_transformer_clip();
}

module double_transformer_clip() {

    %translate([-12.2, 0, 24])
    rotate([0, 0, -90])
    mock_12V_transformer();

    %translate([-38, 27, 24])
    mock_5V_USB_transformer();

    difference() {
        union() {
            translate([-6, -11, 0])
            rotate([0, 0, 180])
            _frame_clip_v2();

            rotate([0, 0, 90])
            scale([1.235, 1.14, 1])
            _transformer_form();

            translate([-38, 27, 0])
            rotate([0, 0, 90])
            scale([1.235, 1.14, 1])
            _transformer_form();

            hull() {
                translate([-20, -12, 0])
                cylinder(d=2, h=12, $fn=10);

                translate([-10, -12, 0])
                cylinder(d=2, h=12, $fn=10);

                translate([-40, 20, 0])
                cylinder(d=2, h=12, $fn=10);

                translate([-30, 20, 0])
                cylinder(d=2, h=12, $fn=10);
            }

            hull() {
                translate([-8, -12, 0])
                cylinder(d=4, h=12, $fn=10);

                translate([-19, 0, 0])
                cylinder(d=16, h=12, $fn=20);
            }
        }
        translate([0, 0, 6.6])
        rotate([0, 0, 90])
        scale([1.025, 1.02, 1])
        _transformer_form();

        translate([-18.7/2, 0, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);

        translate([18.7/2, 0, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);

        translate([-38, 27, 6.6])
        rotate([0, 0, 90])
        scale([1.025, 1.02, 1])
        _transformer_form();

        translate([-38 -18.7/2, 27, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);

        translate([-38 + 18.7/2, 27, 0])
        cylinder(d=4.8, h=40, center=true, $fn=40);
    }
}

module D_link_hub_clip_back() {
    %translate([0, 0, 35.5])
    rotate([105, 0, 0])
    mock_USB_hub_Dlink();

    difference() {
        intersection() {
            union() {
                translate([-11, 10, 0])
                _frame_clip_v2();

                rotate([15, 0, 0])
                translate([0, -3.6, 12])
                cube([103, 30, 29], center=true);

                translate([0.7, 9, 3/2])
                cube([15, 5, 3], center=true);

                translate([0.7, 8, 20/2])
                cube([3, 7, 20], center=true);
            }

            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }

        rotate([15, 0, 0])
        translate([0, -3.6, 18.2])
        cube([99, 26, 25], center=true);

        rotate([15, 0, 0])
        translate([0, -3.6, 10])
        cube([90, 18, 25], center=true);

        translate([0, -25.5, -0.1])
        rotate([45, 0, 0])
        cube([120, 10, 10], center=true);
    }
}

module D_link_hub_clip_front() {
    %translate([0, 0, 29])
    rotate([-90 + 15, 0, 180])
    mock_USB_hub_Dlink();

    difference() {
        intersection() {
            union() {
                translate([-12.5, 10, 0])
                _frame_clip_v2();

                rotate([-15, 0, 0])
                translate([0, -19.2, 6])
                cube([103, 32, 29], center=true);

                translate([-0.7, 3, 3/2])
                cube([15, 15, 3], center=true);

                translate([-0.7, 3, 20/2])
                cube([3, 15, 20], center=true);
            }
            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }
        rotate([-15, 0, 0])
        translate([0, -20.3, 11.9])
        cube([99, 26, 25], center=true);

        rotate([-15, 0, 0])
        translate([0, -21.7, 5])
        cube([85, 18, 35], center=true);

        translate([0, -38.8, -0.1])
        rotate([35, 0, 0])
        cube([120, 10, 10], center=true);
    }
}

module Targus_hub_clip_back() {
    %translate([0, -25.4, 30.2])
    rotate([-90 + 15, 0, 0])
    mock_USB_hub_Targus();

    difference() {
        intersection() {
            union() {
                translate([-11, 10, 0])
                _frame_clip_v2();

                rotate([15, 0, 0])
                translate([0, -3.6, 12])
                cube([107.4, 32, 29], center=true);

                translate([0.7, 9, 3/2])
                cube([15, 5, 3], center=true);

                translate([0.7, 8, 20/2])
                cube([3, 7, 20], center=true);
            }

            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }

        translate([0, -25.4, 30.2])
        rotate([-90 + 15, 0, 0])
        scale([1.01, 1.01, 1.01])
        mock_USB_hub_Targus();

        translate([103/2 - 4.5 - 7/2, -22, 17])
        cube([7, 10, 15], center=true);

        translate([-103/2 + 4.5 + 7/2, -22, 17])
        cube([7, 10, 15], center=true);

        rotate([15, 0, 0])
        translate([0, -3.6, 10])
        cube([90, 18, 25], center=true);

        translate([0, -25.5, -0.1])
        rotate([45, 0, 0])
        cube([120, 10, 10], center=true);
    }
}

module Targus_hub_clip_front() {
    %translate([0, -25.4, 37.2])
    rotate([90 + 15, 0, 180])
    mock_USB_hub_Targus();

    difference() {
        intersection() {
            union() {
                translate([-12.5, 10, 0])
                _frame_clip_v2();

                rotate([-15, 0, 0])
                translate([0, -21, 6])
                cube([107.4, 32, 29], center=true);

                translate([-0.7, 2.7, 3/2])
                cube([15, 16, 3], center=true);

                translate([-0.7, 2.7, 20/2])
                cube([3, 16, 20], center=true);
            }
            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }

        translate([0, -25.4, 37.2])
        rotate([90 + 15, 0, 180])
        scale([1.01, 1.01, 1.01])
        mock_USB_hub_Targus();

        translate([0, -25.4, 37.2])
        rotate([90 + 15, 0, 180])
        mock_USB_hub_Targus();

        rotate([-15, 0, 0])
        translate([0, -19.7, 5])
        cube([97, 18, 35], center=true);

        translate([0, -38.8, -0.1])
        rotate([35, 0, 0])
        cube([120, 10, 10], center=true);
    }
}

module Belkin_hub_clip_back() {
    %translate([0, -5.5, 27])
    rotate([-90 + 15, 0, 0])
    mock_USB_hub_Belkin();

    difference() {
        intersection() {
            union() {
                translate([-11, 10, 0])
                _frame_clip_v2();

                rotate([15, 0, 0])
                translate([0, 1.6, 12])
                cube([91.4, 16.4, 29], center=true);

                translate([0.7, 9, 3/2])
                cube([15, 5, 3], center=true);

                translate([0.7, 8, 20/2])
                cube([3, 7, 20], center=true);
            }

            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }

        translate([0, -2.9, 30/2 + 2])
        rotate([15, 0, 0])
        cube([87.3, 12.3, 30], center=true);

        rotate([15, 0, 0])
        translate([0, 1.6, 10])
        cube([81, 11, 25], center=true);

        translate([0, -25.5, -0.1])
        rotate([45, 0, 0])
        cube([120, 10, 10], center=true);

        translate([-87/2 + 10, 3, 0])
        rotate([15, 0, 0])
        cylinder(d=10, h=10, center=true, $fn=30);
    }
}

module Belkin_hub_clip_front() {
    %translate([0, -5.5, 27.5])
    rotate([90 + 15, 0, 180])
    mock_USB_hub_Belkin();

    difference() {
        intersection() {
            union() {
                translate([-12.5, 10, 0])
                _frame_clip_v2();

                rotate([-15, 0, 0])
                translate([0, -12.6, 6])
                cube([91.4, 16.4, 29], center=true);

                translate([-0.7, 2.7, 3/2])
                cube([15, 16, 3], center=true);

                translate([-0.7, 2.7, 20/2])
                cube([3, 16, 20], center=true);
            }
            translate([0, 0, 20/2])
            cube([200, 100, 20], center=true);
        }

        translate([0, -8.15, 30/2 + 2.55])
        rotate([-15, 0, 0])
        cube([87.3, 12.3, 30], center=true);

        rotate([-15, 0, 0])
        translate([0, -12.4, 5])
        cube([81, 11, 35], center=true);

        translate([0, -22.8, -0.1])
        rotate([35, 0, 0])
        cube([120, 10, 10], center=true);
    }

    //support
    translate([0, -18, 1.8/2])
    cube([80, 2, 1.8], center=true);
}

module dummy_hdd() {

    difference() {
        cube([119.7, 22.7, 80], center=true);

        translate([0, 20/2 + 0.8, 1.2])
        cube([117, 20, 80], center=true);

        translate([0, -20/2 - 0.8, 1.2])
        cube([117, 20, 80], center=true);
    }
}

module cable_clip() {

    module _cable_hole() {
        difference() {
            union() {
                rounded_cube_side(
                    14 - 3, 12 - 3, 11, 2,
                    center=true, $fn=20
                );

                translate([
                    -(16 - 3)/2,
                    6/2 -(12 - 3)/2, 0
                ])
                cube([5, 6, 11], center=true);
            }
            
            translate([-14/2 + 2/2, 25/2 - 3, 0])
            rotate([0, 90, 0])
            donut(25, 2, $fn=60);

            translate([-14/2 + 1.5/2, 25/2 - 3, 0])
            rotate([0, 90, 0])
            cylinder(d=25, h=1.5, center=true, $fn=40);
        }
    }

    difference() {
        union() {
            translate([-11.75, 0, 0])
            scale([1, 1, 0.5])
            _frame_clip_v2();

            translate([23, 12/2, 10/2])
            rounded_cube_side(
                14, 12, 10, 5, center=true, $fn=20
            );

            translate([-23, 12/2, 10/2])
            rounded_cube_side(
                14, 12, 10, 5, center=true, $fn=20
            );

            translate([0, 1.5/2, 10/2])
            cube([40, 1.5, 10], center=true);
        }

        translate([23, 12/2, 10/2])
        _cable_hole();

        mirror([1, 0, 0])
        translate([23, 12/2, 10/2])
        _cable_hole();


    }
}

module connector_clip_medium() {
    difference() {
        union() {
            translate([-11.75, 0, 0])
            scale([1, 1, 1.5])
            _frame_clip_v2();

            translate([0, 0, 30/2])
            cube([13, 6, 30], center=true);
        }

        translate([0, 20/2 + 4.3, 30/2])
        chamfered_cube(40, 20, 22, 7, center=true);

        translate([0, 0, 30/2 - 19.5/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);

        translate([0, 0, 30/2 + 19.5/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);
    }
}

module connector_clip_small() {
    difference() {
        union() {
            translate([-11.75, 0, 0])
            scale([1, 1, 2.2])
            _frame_clip_v2();

            translate([0, 0, 44/2])
            cube([13, 6, 44], center=true);
        }

        translate([0, 20/2 + 4.3, 45/2])
        chamfered_cube(40, 20, 32, 7, center=true);

        translate([0, 0, 5.65])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);

        translate([0, 0, 44 - 5.65])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);

        translate([0, 0, 44/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);
    }
}

module fan_connector_pcb_clip() {
    difference() {
        union() {
            translate([-11.75, 0, 0])
            _frame_clip_v2();

            translate([0, -1, 20/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                31.5, 20, 7, 4, center=true
            );
        }

        translate([-25.4/2, -1, 20/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, 7.1, center=true, $fn=10);

        translate([25.4/2, -1, 20/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, 7.1, center=true, $fn=10);

        translate([0, -5/2, 20/2])
        cube([20, 5, 30], center=true);
    }
}

module stepdown_box_side_clip() {
    union() {
        translate([-11.75, 0, 0])
        scale([1, 1, 15/20])
        _frame_clip_v2();

        translate([50/2, 2/2, 15/2])
        cube([50, 2, 15], center=true);

        translate([30, -7/2 + 2, 15/2])
        cube([1.8, 7, 15], center=true);

        translate([30 + 20, -7/2 + 2, 15/2])
        cube([1.8, 7, 15], center=true);

        translate([30 + 0.15, -5, 0])
        cylinder(d=2.1, h=15, $fn=20);

        translate([30 + 20 - 0.15, -5, 0])
        cylinder(d=2.1, h=15, $fn=20);
    }
}

module stepdown_box_clip() {
    difference() {
        union() {
            translate([11.75, 0, 0])
            rotate([0, 0, 180])
            scale([1, 1, 1])
            _frame_clip_v2();

            translate([0, -3/2, 20/2])
            rotate([90, 0, 0])
            chamfered_cube_side(32, 20, 3, 3, center=true);
        }

        translate([-12.5, -3, 4.5])
        rotate([-90, 0, 0])
        cylinder(d=2, h=20, $fn=10);

        translate([-12.5, -3, 20 - 4.5])
        rotate([-90, 0, 0])
        cylinder(d=2, h=20, $fn=10);

        translate([12.5, -3, 4.5])
        rotate([-90, 0, 0])
        cylinder(d=2, h=20, $fn=10);

        translate([12.5, -3, 20 - 4.5])
        rotate([-90, 0, 0])
        cylinder(d=2, h=20, $fn=10);
    }
}

module stepdown_converter_2_clip() {
    difference() {
        intersection() {
            union() {
                translate([-11.75, 0, 0])
                //scale([1, 1, 1.2])
                _frame_clip_v2();

                translate([12, 1, 22/2])
                //cube([56, 4, 24], center=true);
                rotate([90, 0, 0])
                chamfered_cube_side(
                   58, 22, 3, 5, center=true
                );

                translate([-3, 0, 19.1])
                rotate([90, 0, 0])
                cylinder(d1=8, d2=6, h=2, $fn=20);

                translate([27.1, 0, 2.9])
                rotate([90, 0, 0])
                cylinder(d1=8, d2=6, h=2, $fn=20);
            }

            translate([0, 0, 22/2])
            cube([100, 100, 22], center=true);
        }

        translate([-3, 0, 19.1])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);

        translate([27.1, 0, 2.9])
        rotate([90, 0, 0])
        cylinder(d=2.8, 15, center=true, $fn=10);

        // zip tie cuts
        translate([-13.5, 0, 15])
        cube([2.2, 10, 1.6], center=true);

        translate([-13.5, 0, 8])
        cube([2.2, 10, 1.6], center=true);

        translate([37.5, 0, 15])
        cube([2.2, 10, 1.6], center=true);

        translate([37.5, 0, 8])
        cube([2.2, 10, 1.6], center=true);
    }
}

module itec_hub_clip_back() {
    %translate([36, 24, 220/2 + 2])
    rotate([-90, 0, 40])
    mock_USB_hub_itec_16();

    difference() {
        union() {
            translate([11.75, 13, 0])
            rotate([0, 0, 180])
            scale([1, 1, 1.2])
            _frame_clip_v2();

            translate([36, 24, 20/2])
            rotate([0, 0, 40])
            rounded_cube_side(
                56.5, 26.8, 20, 12.5, center=true, $fn=30
            );

            translate([10/2 + 10, 10/2 + 3, 2/2])
            cube([10, 10, 2], center=true);

            hull() {
                translate([0, 12, 2/2])
                cube([20, 1, 2], center=true);

                translate([10, 15, 2/2])
                cube([1, 5, 2], center=true);
            }
        }

        translate([36, 24, 45/2 + 2])
        rotate([0, 0, 40])
        rounded_cube_side(
            53.3, 23.6, 45, 9, center=true, $fn=30
        );

        translate([36, 24, 45/2 - 1])
        rotate([0, 0, 40])
        rounded_cube_side(
            49, 19, 45, 9, center=true, $fn=30
        );

        translate([36, 24, 45/2 + 5])
        rotate([0, 0, 40])
        translate([0, 23/2, 0])
        cube([49, 10, 45], center=true);
    }
}

module itec_hub_clip_front() {
    %translate([36, -24, 220/2 + 2])
    rotate([90, 0, -40])
    mock_USB_hub_itec_16();

    difference() {
        union() {
            translate([-11.75, -13, 0])
            scale([1, 1, 1.2])
            _frame_clip_v2();

            translate([36, -24, 15/2])
            rotate([0, 0, -40])
            rounded_cube_side(
                56.5, 26.8, 15, 12.5, center=true, $fn=30
            );

            translate([10/2 + 10, -10/2 - 3, 2/2])
            cube([10, 10, 2], center=true);

            hull() {
                translate([0, -12, 2/2])
                cube([20, 1, 2], center=true);

                translate([10, -15, 2/2])
                cube([1, 5, 2], center=true);
            }
        }

        translate([36, -24, 45/2 + 2])
        rotate([0, 0, -40])
        rounded_cube_side(
            53.3, 23.6, 45, 9, center=true, $fn=30
        );

        translate([36, -24, 0])
        rotate([0, 0, -40])
        rounded_cube_side(
            51, 23, 25, 8, center=true, $fn=30
        );
    }
}

module itec_hub_psu_clip_1() {
    %translate([10, 32, 141/2 + 2])
    rotate([-90, 0, 0])
    mock_itec_psu();

    difference() {
        union() {
            translate([11.75, 13, 0])
            rotate([0, 0, 180])
            scale([1, 1, 1.2])
            _frame_clip_v2();

            translate([10, 31.75, 15/2])
            rounded_cube_side(
                64.5, 39.8, 15, 7.5, center=true, $fn=30
            );
        }

        translate([10, 32, 15/2 + 2])
        rounded_cube_side(
            61.3, 36.1, 15, 5.3, center=true, $fn=30
        );

        translate([10, 32, 15/2 - 2])
        rounded_cube_side(
            55, 30, 15, 5.3, center=true, $fn=30
        );

        translate([
            10 -61/2 + 4.7 + 4/2,
            32 - 35.8/2,
            2 + 5 + 4/2
        ])
        rotate([90, 0, 0])
        hull() {
            cylinder(d=4.3, h=2.3, center=true, $fn=30);

            translate([0, 10, 0])
            cylinder(d=4.3, h=2.3, center=true, $fn=30);
        }

        translate([
            10 + 61/2 - 4.7 - 4/2,
            32 - 35.8/2,
            2 + 5 + 4/2
        ])
        rotate([90, 0, 0])
        hull() {
            cylinder(d=4.3, h=2.3, center=true, $fn=30);

            translate([0, 10, 0])
            cylinder(d=4.3, h=2.3, center=true, $fn=30);
        }
    }
}

module itec_hub_psu_clip_2() {
    mirror([1, 0, 0])
    itec_hub_psu_clip_1();
}

module ac_cover() {
    wall = 1.75;

    difference() {
        union() {
            difference() {
                // side lips
                union() {
                    translate([0, 5/2, 0])
                    rotate([90, 0, 0])
                    chamfered_cube_side(
                        145, 65, 5, 2, center=true
                    );

                    translate([0, 7/2 - 2, 0])
                    rotate([0, 90, 0])
                    chamfered_cube_side(
                        40, 7, 145, 3, center=true
                    );
        
                }
                translate([0, 15/2, 0])
                chamfered_cube(
                    170, 15, 40, 6, center=true
                );
            }

            // main cover
            intersection() {
                translate([0, 0, 8/2])
                chamfered_cube(
                    130, 80, 65 + 8, 4, center=true
                );

                translate([0, 40/2, 0])
                cube([150, 40, 65], center=true);
                
            }

            translate([0, 7/2 - 2, -65/2 + 2/2])
            chamfered_cube_side(
                122, 7, 2, 3, center=true
            );
        }

        // inside
        translate([0, 0, wall + 8/2])
        chamfered_cube(
            130 - 2*wall, 76.5,
            65 + 8, 4 - 3.5/4, center=true
        );
        

        // nuts an bolt holes
        translate([-145/2 + 4.5, 2, 66/2 - 5]) {
            rotate([-90, 30, 0])
            M3_nut(5);

            rotate([90, 0, 0])
            cylinder(d=3.3, h=15, center=true, $fn=30);
        }

        translate([-145/2 + 4.5, 2, -66/2 + 5]) {
            rotate([-90, 30, 0])
            M3_nut(5);

            rotate([90, 0, 0])
            cylinder(d=3.3, h=15, center=true, $fn=30);
        }

        translate([145/2 - 4.5, 2, 66/2 - 5]) {
            rotate([-90, 30, 0])
            M3_nut(5);

            rotate([90, 0, 0])
            cylinder(d=3.3, h=15, center=true, $fn=30);
        }

        translate([145/2 - 4.5, 2, -66/2 + 5]) {
            rotate([-90, 30, 0])
            M3_nut(5);

            rotate([90, 0, 0])
            cylinder(d=3.3, h=15, center=true, $fn=30);
        }

        // cable hole
        translate([145/2, 40/2 + 8, 10])
        rotate([0, 90, 0])
        cylinder(d=15, h=20, center=true, $fn=30);

        translate([145/2, 40/2 + 8, 10 + 40/2])
        cube([20, 4, 40], center=true);

        // nut holder holes
        translate([-10/2 - 7, 0, -65/2])
        cube([10, 5, 10], center=true);

        translate([10/2 + 7, 0, -65/2])
        cube([10, 5, 10], center=true);


        // indents back
        translate([0, 40 + 10/2 - wall + 0.9, -18])
        chamfered_cube(120, 10, 20, 2, center=true);

        translate([0, 40 + 10/2 - wall + 0.9, 2])
        chamfered_cube(120, 10, 20, 2, center=true);

        translate([0, 40 + 10/2 - wall + 0.9, 22])
        chamfered_cube(120, 10, 20, 2, center=true);

        // indents bottom
        translate([0, 40/2 + 18/2 - 3, -65/2 + 20/2 + 0.9])
        chamfered_cube(120, 18, 20, 2, center=true);

        translate([0, 40/2 - 18/2 - 3, -65/2 + 20/2 + 0.9])
        chamfered_cube(120, 18, 20, 2, center=true);

        // indents sides
        translate([-130/2 - 20/2 + wall - 0.9, 40/2, -18])
        chamfered_cube(20, 29, 20, 2, center=true);

        translate([-130/2 - 20/2 + wall - 0.9, 40/2, 2])
        chamfered_cube(20, 29, 20, 2, center=true);

        translate([-130/2 - 20/2 + wall - 0.9, 40/2, 22])
        chamfered_cube(20, 29, 20, 2, center=true);

        translate([130/2 + 20/2 - wall + 0.9, 40/2, -18])
        chamfered_cube(20, 29, 20, 2, center=true);
    }
}

module ac_cover_2() {
    difference() {
        ac_cover();

        cube([15, 60, 100], center=true);
    }
}

module psu_100w_clip_1() {
    %translate([-35, 12, 30])
    rotate([-90, 0, 0])
    mock_PSU_100W();

    difference() {
        union() {
            translate([11.75, 0, 0])
            rotate([0, 0, 180])
            scale([1, 1, 1.1])
            _frame_clip_v2();

            hull() {
                translate([0, 0, 15/2])
                cube([23.5, 4, 15], center=true);

                translate([4, 10, 15/2])
                cube([4, 4, 15], center=true);

                translate([28, 10, 0])
                cylinder(d=4, h=15, $fn=40);
            }

            hull() {
                translate([4, 10, 15/2])
                cube([4, 4, 15], center=true);

                translate([65, 10, 0])
                cylinder(d=4, h=15, $fn=40);
            }

            hull() {
                translate([65, 36, 0])
                cylinder(d=4, h=15, $fn=40);

                translate([65, 10, 0])
                cylinder(d=4, h=15, $fn=40);
            }
        }

        translate([30, 10, 6])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([30, 7, 6])
        rotate([90, 0, 0])
        chamfered_cylinder(7, 7, 2, center=true, $fn=30);

        translate([65, 32, 8])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([67, 32, 8])
        rotate([0, 90, 0])
        chamfered_cylinder(7, 5, 2, center=true, $fn=30);

        translate([2, 4])
        cylinder(d=8, h=50, center=true);

        translate([12.5, 6.5])
        cylinder(d=8, h=50, center=true);
    }
}

module psu_100w_clip_2() {
    %translate([-35, 12, 147])
    rotate([-90, 0, 0])
    mock_PSU_100W();

    difference() {
        union() {
            translate([11.75, 0, 0])
            rotate([0, 0, 180])
            scale([1, 1, 1.1])
            _frame_clip_v2();

            hull() {
                translate([0, 0, 15/2])
                cube([23.5, 4, 15], center=true);

                translate([4, 10, 15/2])
                cube([4, 4, 15], center=true);

                translate([28, 10, 0])
                cylinder(d=4, h=15, $fn=40);
            }

            hull() {
                translate([4, 10, 15/2])
                cube([4, 4, 15], center=true);

                translate([65, 10, 0])
                cylinder(d=4, h=15, $fn=40);
            }

            hull() {
                translate([65, 27, 0])
                cylinder(d=4, h=15, $fn=40);

                translate([65, 10, 0])
                cylinder(d=4, h=15, $fn=40);
            }

            hull() {
                translate([30, 10, 1/2])
                cube([15, 4, 1], center=true);

                translate([30, 10, 45])
                rotate([90, 0, 0])
                cylinder(d=15, h=4, center=true, $fn=40);
            }
        }

        translate([30, 10, 45])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([30, 7, 45])
        rotate([90, 0, 0])
        chamfered_cylinder(7, 7, 2, center=true, $fn=30);

        translate([65, 23, 8])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([67, 23, 8])
        rotate([0, 90, 0])
        chamfered_cylinder(7, 5, 2, center=true, $fn=30);

        translate([2, 4])
        cylinder(d=8, h=50, center=true);

        translate([12.5, 6.5])
        cylinder(d=8, h=50, center=true);
    }
}
