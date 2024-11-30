//use <../lib/includes.scad>;
use <../Dollo/NEW_long_ties/include.scad>;

atx_psu_width = 150;
atx_psu_height = 86;

card_spacing = 20.32;

fan_connector_width = 6.1;
fan_connector_length = 7.9;

atx_mobo_w = 305; //12 * 25.4;
atx_mobo_l = 244; //9.6 * 25.4;
ee_atx_mobo_w = 347; //13.68 * 25.4;
ee_atx_mobo_l = 332; //13 * 25.4;

switch_height = 12.9;
switch_width = 19.2;

hd_width = 102;
hd_length = 146;
hd_height = 26.1;

ssd_width = 70;
ssd_length = 100.5;
ssd_height = 9.1;
ssd_height_enterprise = 14.7;

screw_dia = 3.6;

atx_mobo_holes = [
    [atx_mobo_w - 0.65*25.4, 0.4*25.4],
    [atx_mobo_w - 0.65*25.4, 6.5*25.4],
    [atx_mobo_w - 0.65*25.4, 9.35*25.4],
    [atx_mobo_w - 3.75*25.4, 0.4*25.4],
    [atx_mobo_w - 5.55*25.4, 0.4*25.4],
    [atx_mobo_w - 5.55*25.4, 6.5*25.4],
    [atx_mobo_w - 5.55*25.4, 9.35*25.4],
    [atx_mobo_w - 11.75*25.4, 1.3*25.4],
    [atx_mobo_w - 11.75*25.4, 6.5*25.4],
    [atx_mobo_w - 11.75*25.4, 9.35*25.4]
];

ee_atx_mobo_holes = [
    [ee_atx_mobo_w - 0.65*25.4, 0.4*25.4],
    [ee_atx_mobo_w - 0.65*25.4, 187.5],
    [ee_atx_mobo_w - 0.65*25.4, 237.5],
    [ee_atx_mobo_w - 10.5, 322.5],
    [ee_atx_mobo_w - 5.55*25.4, 0.4*25.4],
    [ee_atx_mobo_w - 95, 187.5],
    [ee_atx_mobo_w - 95, 322.5],
    [10.2, 0.4*25.4],
    [68.5, 168.2],
    [10.2, 187.5],
    [110.2, 322.5],
    [10.2, 322.5]
];

atx_card_x_0 = atx_mobo_w - 16.5 - 8.8/2;
ee_atx_card_x_0 = ee_atx_mobo_w - 16.5 - 8.8/2;

mb_datum_0 = atx_mobo_holes[0];
ee_mb_datum_0 = ee_atx_mobo_holes[0];

io_x_pos = -158.75/2 + mb_datum_0[0] - 5.196 * 25.4;
ee_io_x_pos = -158.75/2 + ee_mb_datum_0[0] - 5.196 * 25.4;
io_y_pos = -1/2 + mb_datum_0[1] - 0.483 * 25.4;
io_z_pos = 44.45/2 - 0.088 * 25.4;

//echo(atx_mobo_w, atx_mobo_l);
//echo(io_y_pos);


//mock_mobo();
//mock_mobo_ee_atx();
//mock_pci_slot();
//mock_pcie_slot();
//mobo_card_plate();
//mobo_backplate();
//mock_card();
//mock_mobo_card();
//mock_mobo_card_ee_atx();
//mock_hd();
//mock_dvdrom();
//mock_ssd();
//mock_ssd_enterprise();
//atx_psu_holes();
//atx_psu_back_cutout();
//mock_atx_psu();
//mock_fan_connector_male();
//mock_fan_40mm();
//mock_fan_60mm();
//mock_fan_80mm();
//mock_fan_92mm();
//mock_fan_120mm();
//mock_fan_140mm();
//mock_fan_160mm();
//mock_USB_HDD_Seagate_5T();
//mock_USB_HDD_Seagate_5T_2();
//mock_USB_HDD_Seagate_2T();
//mock_USB_HDD_Toshiba_4T();
//mock_USB_HDD_Intenso_5T();
//mock_USB_HDD_WD_5T();
//mock_USB_HDD_WD_E_5T();
//mock_USB_hub_Dlink();
//mock_USB_hub_Targus();
//mock_USB_hub_Belkin();
//mock_USB_hub_itec_16();
//mock_stepdown_converter();
//mock_stepdown_converter_2();
//mock_stepdown_converter_3();
//mock_buck_converter();
//mock_liitinrima_small();
//mock_liitinrima_big();
//fan_mount_holes(80);
//mock_am4_cpu();


module mock_pci_slot() {
    color("darkgrey")
    difference() {
        cube([8.8, 84.5, 15.4], center=true);

        translate([0, -84.5/2 + 2 + 64/2, 0])
        cube([2, 64, 20], center=true);

        translate([0, 84.5/2 - 2 -15.5/2, 0])
        cube([2, 15.5, 20], center=true);

    }
}

module mock_pcie_slot() {
    color("darkgrey")
    difference() {
        cube([8.8, 89, 10.6], center=true);

        translate([0, -89/2 + 2 + 11.5/2, 0])
        cube([2, 11.5, 20], center=true);

        translate([0, 89/2 - 2 -71.5/2, 0])
        cube([2, 71.5, 20], center=true);

    }
}

module mock_mobo() {
    $fn=50;
    difference() {
        cube([atx_mobo_w, atx_mobo_l, 2]);
        
        for(xy = atx_mobo_holes) {
            translate([xy[0], xy[1], -0.1])
            cylinder(d=4, h=3);
        }
    }

    // I/O
    %translate([io_x_pos, io_y_pos - 1/2, io_z_pos])
    cube([158.75, 1, 44.45], center=true);

    // card slots
    translate([
        atx_card_x_0, 37.7 + 84.5/2,
        15.4/2 + 2])
    mock_pci_slot();

    translate([
        atx_card_x_0 - card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        atx_card_x_0 - 2*card_spacing,
        37.7 + 84.5/2, 15.4/2 + 2])
    mock_pci_slot();

    translate([
        atx_card_x_0 - 3*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        atx_card_x_0 - 4*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        atx_card_x_0 - 5*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        atx_card_x_0 - 6*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();
}

module mock_mobo_ee_atx() {
    $fn=50;
    difference() {
        cube([ee_atx_mobo_w, ee_atx_mobo_l, 2]);
        
        for(xy = ee_atx_mobo_holes) {
            translate([xy[0], xy[1], -0.1])
            cylinder(d=4, h=3);
        }
    }

    // I/O
    %translate([ee_io_x_pos, io_y_pos - 1/2, io_z_pos])
    cube([158.75, 1, 44.45], center=true);

    // card slots
    translate([
        ee_atx_card_x_0, 37.7 + 84.5/2,
        15.4/2 + 2])
    mock_pci_slot();

    translate([
        ee_atx_card_x_0 - card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        ee_atx_card_x_0 - 2*card_spacing,
        37.7 + 84.5/2, 15.4/2 + 2])
    mock_pci_slot();

    translate([
        ee_atx_card_x_0 - 3*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        ee_atx_card_x_0 - 4*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        ee_atx_card_x_0 - 5*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();

    translate([
        ee_atx_card_x_0 - 6*card_spacing,
        42.8 + 89/2, 10.6/2 + 2])
    mock_pcie_slot();
}


module mobo_card_plate() {
    rotate([-90, 0, 0])
    difference() {
        union() {
            translate([0, -2, 0])
            cube([152, 2, 113.8]);

            translate([0, -10, 112.4])
            cube([152, 10, 4]);

            translate([0, -10, 0])
            cube([152, 10, 4]);

            for (i = [0:7]) {
                translate(
                    [0 + i * card_spacing,
                     -6, 0])
                cube([2.5, 6, 115]);
            }
        }

        for (i = [0:6]) {
            translate(
                [5.5 + i * card_spacing, -8.5, 12.2]
            )
            cube([14, 12, 100.2]);

            translate(
                [12.5 + i * card_spacing, 0, 110.6]
            )
            rotate([45, 0, 0])
            cube([10, 10, 10], center=true);

            translate(
                [12.5 + i * card_spacing, 0, 118]
            )
            rotate([45, 0, 0])
            cube([10, 10, 10], center=true);

        }

        for (i = [0:7]) {
            translate(
                [4 + i * card_spacing, -5, 116 - 6])
            cylinder(d=2.8, h=7, $fn=30);
        }
    }
}

module mobo_backplate() {

    difference() {
        union() {
            cube([168, 60, 12]);

            translate([166, 0, 0])
            mobo_card_plate();
        }

        translate([7.1, 5.1, -1])
        rounded_cube_side(158.75, 44.45, 20, 1);

        translate([2.1, 0.1, 8])
        chamfered_cube(168.75, 54.45, 20, 5.1);

    }
}

module _card_endplate() {

    color("silver")
    union() {
        // top bracket
        translate([
            -12.3, -19.4 + 6.2,
            -18.8 + 119.2
        ])
        difference() {
            cube([12.3, 19.4, 1]);

            translate([
                6.5, 19.4 - 5.3 + 4.3/2, -1
            ])
            hull() {
                cylinder(d=4.8, h=3, $fn=40);

                translate([0, 5, 0])
                cylinder(d=4.8, h=3, $fn=40);
            }
        }

        // end plate
        difference() {
            translate([-1, -15.8, -18.8])
            cube([1, 22, 120.2]);

            // bottom cuts
            translate([-1.3, -15.9, -19])
            cube([2, (19 - 10.6)/2, 11.4]);

            translate([
                -1.3,
                -15.8 + 10.6 + (18.8 - 10.6)/2,
                -19
            ]) 
            cube([2, (19 - 10.6)/2, 11.4]);

            // side cuts
            translate([-1.3, -15.8 + 18.8, -19])
            cube([2, 5, 116.4]);

            translate([-1.3, -16, -18.8 + 116.2])
            cube([2, 22 - 18.6, 5]);
        }
    }
}

module mock_card(h=107, l=200) {
    $fn=50;

    // main pcb
    cube([l, 2, h]);

    _card_endplate();
}

module mock_hdmi_female_connector() {
    color("silver")
    union() {
        translate([-32.5/2, 0, 0])
        cylinder(d=5, h=5, $fn=6);

        translate([32.5/2, 0, 0])
        cylinder(d=5, h=5, $fn=6);

        hull() {
            translate([-24/2 + 2/2, 7.8/2 - 2/2, 0])
            cylinder(d=2, h=5.5, $fn=15);

            translate([24/2 - 2/2, 7.8/2 - 2/2, 0])
            cylinder(d=2, h=5.5, $fn=15);

            translate([
                -24/2 + 4/2, -7.8/2 + 4/2, 0
            ])
            cylinder(d=4, h=5.5, $fn=15);

            translate([
                24/2 - 4/2, -7.8/2 + 4/2, 0
            ])
            cylinder(d=4, h=5.5, $fn=15);
        }
    }
}

module mock_vga_female_connector() {
    color("silver")
    union() {
        translate([-25/2, 0, 0])
        cylinder(d=5, h=5, $fn=6);

        translate([25/2, 0, 0])
        cylinder(d=5, h=5, $fn=6);

        hull() {
            translate([-16.3/2 + 3/2, 7.8/2 - 3/2, 0])
            cylinder(d=3, h=5.5, $fn=15);

            translate([16.3/2 - 3/2, 7.8/2 - 3/2, 0])
            cylinder(d=3, h=5.5, $fn=15);

            translate([
                -15.2/2 + 3/2, -7.8/2 + 3/2, 0
            ])
            cylinder(d=3, h=5.5, $fn=15);

            translate([
                15.2/2 - 3/2, -7.8/2 + 3/2, 0
            ])
            cylinder(d=3, h=5.5, $fn=15);
        }
    }
}

module mock_card_pcie() {
    // Radeon X1300PRO
    $fn=50;

    // main pcb
    difference() {
        translate([0.5, 0, 0])
        cube([170, 1.7, 113]);

        translate([-0.5, -1, -1])
        cube([46, 5, 5.8]);

        translate([0.5 + 46 + 11.2, -1, -1])
        cube([1.9, 5, 9.5]);

        translate([0.5 + 46 + 84.5, -1, -1])
        cube([2.4, 5, 9.5]);

        translate([0.5 + 46 + 85, -1, -1])
        cube([46, 5, 4]);

        translate([
            0.5 + 46 + 84.5 + 2.4 + 12.8,
            -1, -1
        ])
        cube([46, 5, 14]);

        translate([
            0.5 + 46 + 84.5 + 2.4 + 7.7,
            -1, 8
        ])
        cube([46, 5, 4.8]);
    }

    // connectors
    translate([0, 3.2 - 8, -14.4 + 39.5])
    rotate([0, -90, 0])
    mock_hdmi_female_connector();

    translate([0, 3.2 - 9.4, -14.4 + 94])
    rotate([180, 90, 0])
    mock_vga_female_connector();

    translate([0, 0, 18.8 - 14.4])
    _card_endplate();
}

module mock_mobo_card() {

    card_y = -1.3;
    card_z_pci = 18.8 - 10;
    card_z_pcie = 14.4 - 10;

    mock_mobo();

    translate([-9.4, io_y_pos, -7.4])
    rotate([90, 0, 0])
    mobo_backplate();

    translate([
        atx_card_x_0 - 6*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        atx_card_x_0 - 5*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        atx_card_x_0 - 4*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        atx_card_x_0 - 3*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    // big card, max should be 111.15 × 312.00, but this is bigger
    translate([
        atx_card_x_0 - 2*card_spacing + 2/2,
        card_y, card_z_pci])
    rotate([0, 0, 90])
    mock_card(h=140, l=312);

    translate([
        atx_card_x_0 - card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        atx_card_x_0 + 2/2,
        card_y, card_z_pci])
    rotate([0, 0, 90])
    mock_card();
}

module mock_mobo_card_ee_atx() {

    card_y = -1.3;
    card_z_pci = 18.8 - 10;
    card_z_pcie = 14.4 - 10;

    mock_mobo_ee_atx();

    translate([-9.4 + 42, io_y_pos, -7.4])
    rotate([90, 0, 0])
    mobo_backplate();

    translate([
        ee_atx_card_x_0 - 6*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        ee_atx_card_x_0 - 5*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        ee_atx_card_x_0 - 4*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        ee_atx_card_x_0 - 3*card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    // big card, max should be 111.15 × 312.00, but this is bigger
    translate([
        ee_atx_card_x_0 - 2*card_spacing + 2/2,
        card_y, card_z_pci])
    rotate([0, 0, 90])
    mock_card(h=140, l=312);

    translate([
        ee_atx_card_x_0 - card_spacing + 2/2,
        card_y, card_z_pcie])
    rotate([0, 0, 90])
    mock_card_pcie();

    translate([
        ee_atx_card_x_0 + 2/2,
        card_y, card_z_pci])
    rotate([0, 0, 90])
    mock_card();
}

module mock_ssd() {
    holx_1 = 4.07;
    holx_2 = holx_1 + 61.71;
    holy_1 = 14;
    holy_2 = 90.60;

    difference() {
        cube([ssd_width, ssd_length, ssd_height]);

        translate([9.4, -1, 6.5])
        cube([41.4, 8, 1]);

        translate([10.4, -1, -1])
        cube([39.4, 8, 3]);
    }

    translate([0, holy_1, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([0, holy_2, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([70 + 5, holy_1, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([70 + 5, holy_2, 3])
    rotate([0, -90, 0])
    cylinder(d=2.5, h=5, $fn=30);

    translate([holx_1, holy_1, -4])
    cylinder(d=2.5, h=5, $fn=30);

    translate([holx_1, holy_2, -4])
    cylinder(d=2.5, h=5, $fn=30);

    translate([holx_2, holy_1, -4])
    cylinder(d=2.5, h=5, $fn=30);

    translate([holx_2, holy_2, -4])
    cylinder(d=2.5, h=5, $fn=30);
}

module mock_ssd_enterprise(connector=false) {
    // HGST Ultrastar SS200 SXHLL
    union() {
        mock_ssd();

        translate([0, 0, 9])
        cube([
            ssd_width, ssd_length,
            ssd_height_enterprise - 9
        ]);
    }

    // SAS cable connector
    translate([47/2 + 6.3, -13/2, 8/2 - 1])
    union() {
        cube([47, 13, 8], center=true);

        translate([0, -2, 0])
        cube([34, 13, 5.4], center=true);
    }
}

module _sata_connector_cutout() {
    translate([21/2, 0, 2/2])
    cube([21, 10, 2.01], center=true);

    translate([26 + 11/2, 0, 2/2])
    cube([11, 10, 2.01], center=true);

    translate([37/2, 0, 5 - 2/2])
    cube([37, 10, 2], center=true);

    translate([2/2, 0, 5/2])
    cube([2, 10, 5.01], center=true);

    translate([37 - 2/2, 0, 5/2])
    cube([2, 10, 5.01], center=true);

    translate([22.3 + 2.5/2, 0, 5/2])
    cube([2.5, 10, 5.01], center=true);

    translate([22.3, 0, 1/2])
    cube([8, 10, 1.01], center=true);
}

module mock_hd() {
    color("white")
    difference() {
        cube([hd_width, hd_length, hd_height]);

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

        translate([12, 0, 0])
        _sata_connector_cutout();

        translate([100/2, 0, 8.5 + 2/2])
        cube([200, 5, 2], center=true);
    }
}

module mock_dvdrom() {
    difference() {
        translate([0, 0, 42/2])
        cube([148, 186, 42], center=true);

        translate([148/2, -186/2 + 52.5, 10.5])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([148/2, -186/2 + 52.5, 22])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([-148/2, -186/2 + 52.5, 10.5])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([-148/2, -186/2 + 52.5, 22])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([148/2, -186/2 + 52.5 + 79, 10.5])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([148/2, -186/2 + 52.5 + 79, 22])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([-148/2, -186/2 + 52.5 + 79, 10.5])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([-148/2, -186/2 + 52.5 + 79, 22])
        rotate([0, 90, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([148/2 - 30, 186/2, 7])
        rotate([0, 0, 180])
        _sata_connector_cutout();
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

    translate([
        -atx_psu_width/2 + 30,
        0, atx_psu_height - 6
    ])
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

            translate([
                pins_x*2.54 - 2.54,
                pins_y*2.54 - 2.54
            ])
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
    pins_x, pins_y, h=14, center=false
) {

    holee(0.2, h)
    pin_connector(pins_x, pins_y, h=h, center=center);
}

module pcb_with_holes(w, l, h=1.6) {
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

module fan_mount_holes(fan_d, h_d=4.4, h=100) {

    module _fan_mount_holes(spacing) {
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate([spacing/2, spacing/2, 0])
            cylinder(
                d=h_d, h=h, center=true,
                $fn=30
            );
        }
    }

    if (fan_d == 40) {
        _fan_mount_holes(32);
    } else if (fan_d == 60) {
        _fan_mount_holes(50);
    } else if (fan_d == 80) {
        _fan_mount_holes(72);
    } else if (fan_d == 92) {
        _fan_mount_holes(82.5);
    } else if (fan_d == 100) {
        _fan_mount_holes(90.5);
    } else if (fan_d == 120) {
        _fan_mount_holes(105);
    } else if (fan_d == 140) {
        _fan_mount_holes(124.5);
    } else if (fan_d == 160) {
        _fan_mount_holes(144.5);
    }
}

module mock_fan_40mm(h=10) {
    difference() {
        rounded_cube_side(
            40, 40, h, 6, center=true, $fn=20
        );

        cylinder(d=38, h=55, center=true, $fn=90);

        fan_mount_holes(40, h_d=4);
    }
}


module mock_fan_60mm(h=25) {
    difference() {
        rounded_cube_side(60, 60, h, 6, center=true, $fn=20);

        cylinder(d=58, h=55, center=true, $fn=90);

        fan_mount_holes(60);
    }
}


module mock_fan_80mm() {
    difference() {
        cube([80, 80, 25], center=true);
        cylinder(d=79, h=55, center=true, $fn=90);

        fan_mount_holes(80);
    }
}

module mock_fan_92mm() {
    difference() {
        cube([92, 92, 25], center=true);
        cylinder(d=91, h=55, center=true, $fn=90);

        fan_mount_holes(92);
    }
}

module mock_fan_120mm() {
    difference() {
        cube([120, 120, 25], center=true);
        cylinder(
            d=118, h=55, center=true, $fn=90
        );

        fan_mount_holes(120);
    }
}

module mock_fan_140mm() {
    difference() {
        cube([140, 140, 25], center=true);
        cylinder(d=139, h=55, center=true, $fn=90);

        fan_mount_holes(140);
    }
}

module mock_fan_160mm() {
    difference() {
        cube([160, 160, 25], center=true);
        cylinder(d=159, h=55, center=true, $fn=90);

        fan_mount_holes(160);
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

module mock_USB_HDD_Seagate_5T_2() {
    // One touch
    difference() {
        rounded_cube(
            80, 115.4, 21, 2, center=true, $fn=30);

        translate([80/2 - 14/2 - 33,
                   -115.4/2, -21/2 + 4/2 + 4.7])
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

module mock_USB_HDD_Intenso_5T() {
    difference() {
        rounded_cube_side(
            78, 126.2, 20.2,
            14, center=true, $fn=30);

        translate([78/2 - 14/2 - 32,
                   -126.2/2, -20.2/2 + 5 + 4/2])
        cube([14, 4, 4], center=true);
    }
}

module mock_USB_HDD_WD_5T() {
    difference() {
        rounded_cube_side(
            75, 107, 19, 5, center=true, $fn=30);

        translate([75/2 - 14/2 - 20.5,
                   -107/2, -19/2 + 4/2 + 5])
        cube([14, 4, 4], center=true);
    }
}

module mock_USB_HDD_WD_E_5T() {
    // WD Elements

    bottom_d = 160;
    bottom_offset = bottom_d/2 - 22/2;

    top_d = 200;
    top_offset = -top_d/2 + 22/2;

    module _nub() {
        intersection() {
            cylinder(d=4.5, h=5, center=true, $fn=20);

            translate([0, 0, 4.5])
            sphere(d=10, $fn=40);
        }
    }

    difference() {
        intersection() {
            hull() {
                translate([0, 0, 22/2 - 1/2])
                rounded_cube_side(
                    82.5, 110, 1, 15, center=true, $fn=30
                );

                translate([0, 0, -22/2 + 1/2])
                rounded_cube_side(
                    80.5, 109, 1, 14, center=true, $fn=30
                );
            }

            hull() {
                translate([23, 37, bottom_offset])
                rotate([0, 0, -45])
                scale([0.5, 1, 1])
                sphere(d=bottom_d, $fn=80);

                translate([-23, 37, bottom_offset])
                rotate([0, 0, 45])
                scale([0.5, 1, 1])
                sphere(d=bottom_d, $fn=80);

                translate([23, -37, bottom_offset])
                rotate([0, 0, 45])
                scale([0.5, 1, 1])
                sphere(d=bottom_d, $fn=80);

                translate([-23, -37, bottom_offset])
                rotate([0, 0, -45])
                scale([0.5, 1, 1])
                sphere(d=bottom_d, $fn=80);

            }

            hull() {
                translate([25, 38, top_offset])
                rotate([0, 0, -45])
                scale([0.5, 1, 1])
                sphere(d=top_d, $fn=80);

                translate([-25, 38, top_offset])
                rotate([0, 0, 45])
                scale([0.5, 1, 1])
                sphere(d=top_d, $fn=80);

                translate([25, -38, top_offset])
                rotate([0, 0, 45])
                scale([0.5, 1, 1])
                sphere(d=top_d, $fn=80);

                translate([-25, -38, top_offset])
                rotate([0, 0, -45])
                scale([0.5, 1, 1])
                sphere(d=top_d, $fn=80);

            }
        }

        translate([75/2 - 14/2 - 20.5,
                   -107/2, -19/2 + 4/2 + 5])
        cube([14, 4, 4], center=true);
    }
    translate([-57.5/2, 86.5/2, -22/2])
    _nub();

    translate([-57.5/2, -86.5/2, -22/2])
    _nub();

    translate([57.5/2, 86.5/2, -22/2])
    _nub();

    translate([57.5/2, -86.5/2, -22/2])
    _nub();    
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

module mock_USB_hub_Targus() {
    // ACH82EU

    spacing = (64 - 7) / 6;
    echo(spacing);

    module _main_form_1() {
        hull() {
            intersection() {
                union() {
                    translate([0, -850/2 - 6/2 + 31, 6/2])
                    donut(850, 6, $fn=100);

                    translate([0, -850/2 - 6/2 + 31,
                        24.5 - 6/2])
                    donut(850, 6, $fn=100);
                }

                translate([0, 0, 24.5/2])
                cube([103, 62, 24.5], center=true);
            }

            union() {
                translate([0, -62/2 + 3/2, 3/2])
                rotate([0, 90, 0])
                cylinder(d=3, h=103, center=true, $fn=30);

                translate([0, -62/2 + 3/2, 24.5 - 3/2])
                rotate([0, 90, 0])
                cylinder(d=3, h=103, center=true, $fn=30);
            }
        }
    }

    module _main_form_2() {
        hull() {
            intersection() {
                union() {
                    translate([0, -850/2 - 6/2 + 31, 6/2])
                    donut(850.5, 6, $fn=100);

                    translate([0, -850/2 - 6/2 + 31,
                        24.5 - 6/2])
                    donut(850.5, 6, $fn=100);

                    translate([0, -850/2 - 6/2 + 31,
                        24.5 - 6/2 + 3])
                    donut(834, 6, $fn=100);
                }

                translate([0, 10, 27.5/2])
                rounded_cube_side(82, 62, 27.5,
                    6, center=true);
            }

            translate([0, -62/2 + 20/2 + 10, 27.5/2])
            rounded_cube_side(82, 20, 27.5,
                6, center=true);

        }
    }

    module _main_form() {
        difference() {
            union() {
                _main_form_1();
                _main_form_2();

                translate([103/2 - 6/2 - 5,
                    -62/2 + 6/2 + 10])
                cylinder(d=6, h=6, center=true, $fn=20);

                translate([103/2 - 6/2 - 5,
                    -62/2 + 10 + 6 + 29 + 6/2])
                cylinder(d=6, h=6, center=true, $fn=20);

                translate([-103/2 + 6/2 + 5,
                    -62/2 + 6/2 + 10])
                cylinder(d=6, h=6, center=true, $fn=20);

                translate([-103/2 + 6/2 + 5,
                    -62/2 + 10 + 6 + 29 + 6/2])
                cylinder(d=6, h=6, center=true, $fn=20);

                translate([103/2 - 11 + 3/2, 0, -6/2])
                hull() {
                    translate([0, 15/2, 0])
                    cylinder(d=3, h=6, $fn=20);

                    translate([0, -15/2, 0])
                    cylinder(d=3, h=6, $fn=20);
                }

                translate([-103/2 + 11 - 3/2, 0, -6/2])
                hull() {
                    translate([0, 15/2, 0])
                    cylinder(d=3, h=6, $fn=20);

                    translate([0, -15/2, 0])
                    cylinder(d=3, h=6, $fn=20);
                }

                translate([0, -62/2 + 11.2 + 3/2, 0])
                sphere(d=3, $fn=20);
            }

            translate([103/2 - 2/2 - 1.7, -62/2, 24.5])
            cube([2, 65, 2.2], center=true);

            translate([103/2 - 2/2 - 1.7, -62/2, 0])
            cube([2, 65, 2.2], center=true);

            translate([-103/2 + 2/2 + 1.7, -62/2, 24.5])
            cube([2, 65, 2.2], center=true);

            translate([-103/2 + 2/2 + 1.7, -62/2, 0])
            cube([2, 65, 2.2], center=true);

            translate([103/2 - 10/2 - 9.5, 0, -1.72/2])
            cube([10, 40, 1.7], center=true);

            translate([-103/2 + 10/2 + 9.5, 0, -1.72/2])
            cube([10, 40, 1.7], center=true);
        }
    }

    difference() {
        _main_form();

        translate([103/2 - 7.5 - 3/2, -62/2,
            24.5 - 8 - 3])
        rotate([90, 0, 0])
        cylinder(d=6, h=10, center=true);

        translate([-103/2 + 8 + 8.5/2, -62/2,
            24.5 - 8 - 8.2/2])
        hull() {
            cube([8.5, 10, 6], center=true);

            translate([0, 0, (8.2 - 6)/2])
            cube([5, 10, 8.2], center=true);
        }

        translate([-103/2 + 21 + 7/2, -62/2,
            24.5 - 14/2 - 3])
        for(i = [0:6]) {
            translate([i * spacing, 0, 0])
            cube([7, 10, 14], center=true);
        }
    }
}

module mock_USB_hub_Belkin() {

    spacing_back = (48.5 - 14) / 2;
    spacing_front = (69 - 14) / 3;

    difference() {
        rotate([90, 0, 0])
        rounded_cube_side(87, 12, 50.5, 4, center=true, $fn=30);

        translate([-87/2 + 10, 50.5/2, 12/2 - 4.8])
        rotate([90, 0, 0])
        cylinder(d=4, h=10, center=true, $fn=20);

        translate([-87/2 + 20.5, 50.5/2, 12/2 - 3 - 3])
        union() {
            translate([0, 0, 3/2])
            cube([5.6, 10, 3], center=true);

            translate([0, 0, 3 - 1.6/2])
            cube([7, 10, 1.6], center=true);
        }

        translate([-87/2 + 36, 50.5/2, 0])
        for(i = [0:2]) {
            translate([i * spacing_back, 0, 0])
            cube([14, 10, 7], center=true);
        }

        translate([-87/2 + 15.5, -50.5/2, 0])
        for(i = [0:3]) {
            translate([i * spacing_front, 0, 0])
            cube([14, 10, 7], center=true);
        }
    }
}

module mock_USB_hub_itec_16() {

    spacing = (187.5 - 8.5)/15;
    echo(spacing);

    difference() {
        union() {
            rotate([90, 0, 0])
            rounded_cube_side(
                53, 23.3, 220, 9, center=true, $fn=30
            );

            // buttons
            for (i = [0:15]) {
                translate([
                    53/2 - 8.5/2 - 7.5,
                    i*spacing - 220/2 + 27 + 8.5/2,
                    23.3/2
                ])
                color("black")
                rounded_cube_side(
                    8.5, 8.5, 2, 0.5, center=true, $fn=10
                );
            }
        }
        // usb slots
        for (i = [0:15]) {
            translate([
                -53/2 + 12.5/2 + 7.5,
                i*spacing - 220/2 + 27 + 8.5/2,
                23.3/2
            ])
            cube([12.5, 5, 10], center=true);
        }

        translate([53/2 - 18 - 6/2, -220/2, 0])
        rotate([90, 0, 0])
        cylinder(d=6, h= 15, center=true, $fn=20);

        translate([-53/2 + 10, -220/2, 23.3/2 - 10/2 - 4])
        cube([6.5, 15, 10], center=true);

        translate([-53/2 + 10, -220/2, 23.3/2 - 6/2 - 8])
        cube([8.5, 15, 6], center=true);

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
        cube([
            switch_height, switch_width + 2, 1
        ], center=true);

        translate([0, 0, 0.5])
        cube([
            switch_height, switch_width, 1
        ], center=true);
    }
    translate([0, 0, 1 + 30/2])
    cube([
        switch_height + 1, switch_width + 3, 30
    ], center=true);
}
//mains_switch_hole();

module mock_stepdown_converter() {
    translate([0, 0, 1.6/2])
    cube([11, 20, 1.6], center=true);

    translate([11/2 - 6.5/2 - 0.5, 0, 4.5/2])
    cube([6.5, 6.5, 4.5], center=true);
}

module _potentiometer() {
    translate([0, 0, 11.5/2])
    cube([9.5, 4.5, 11.5], center=true);

    translate([-9.5/2 + 2.4/2, 4.5/2 - 2.4/2, 0])
    cylinder(d=2.3, h=13, $fn=20);
}

module mock_stepdown_converter_2() {
    // LM2596 DC-DC
    difference() {
        union() {
            color("green")
            translate([0, 0, 1.6/2])
            cube([43.2, 21.2, 1.6], center=true);

            translate([43.2/2 - 8/2 - 0.2, 0, 0])
            cylinder(d=8, h=12, $fn=30);

            translate([-43.2/2 + 8/2 + 0.5, 0, 0])
            cylinder(d=8, h=12, $fn=30);

            translate([
                43.2/2 - 19 + 9.5/2,
                21.2/2 - 4.5/2 - 1.8,
                0
            ])
            _potentiometer();

            translate([
                43/2 - 22 + 12/2, -21.2/2 + 12/2 + 1.3,
                9/2
            ])
            cube([12, 12, 9], center=true);

            translate([
                -43/2 + 20 - 9.5/2, 21.2/2 - 8.5/2 - 2.5,
                6/2
            ])
            cube([9.5, 8.5, 6], center=true);
        }

        translate([43.2/2 - 1.7, 21.2/2 - 1.7, 0])
        cylinder(d=1, h=10, center=true, $fn=10);

        translate([43.2/2 - 1.7, -21.2/2 + 1.7, 0])
        cylinder(d=1, h=10, center=true, $fn=10);

        translate([-43.2/2 + 1.7, 21.2/2 - 1.7, 0])
        cylinder(d=1, h=10, center=true, $fn=10);

        translate([-43.2/2 + 1.7, -21.2/2 + 1.7, 0])
        cylinder(d=1, h=10, center=true, $fn=10);

        translate([43.2/2 - 6.5, -21.2/2 + 2.5])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([-43.2/2 + 6.6, 21.2/2 - 2.5])
        cylinder(d=3, h=10, center=true, $fn=20);

    }
}

module mock_stepdown_converter_3() {
    // max 10A DC-DC
    module _terminal() {
        difference() {
            translate([0, 0, 12/2])
            cube([7.9, 10.4, 12], center=true);

            translate([0, 5/2, 10])
            cylinder(d=3.5, h=4, $fn=20);

            translate([0, -5/2, 10])
            cylinder(d=3.5, h=4, $fn=20);
        }
    }

    difference() {
        union() {
            color("green")
            translate([0, 0, 1.6/2])
            cube([76, 22.7, 1.6], center=true);

            translate([76/2 - 7.9/2 + 0.5, 0, 0])
            _terminal();

            translate([-76/2 + 7.9/2, 0, 0])
            _terminal();

            translate([
                76/2 - 21.5 + 4.5/2,
                0, 0
            ])
            rotate([0, 0, -90])
            _potentiometer();

            translate([76/2 - 12.5, -4.2, 0])
            cylinder(d=8, h=14, $fn=30);

            translate([76/2 - 12.5, 4.2, 0])
            cylinder(d=8, h=14, $fn=30);

            translate([-76/2 + 12.5, -4.2, 0])
            cylinder(d=8, h=14, $fn=30);

            translate([-76/2 + 12.5, 4.2, 0])
            cylinder(d=8, h=14, $fn=30);

            translate([-76/2 + 22, -4.5, 18/2 + 2])
            rotate([0, 80, 7])
            tube(18, 8.5, 5, $fn=30);
        }

        translate([76/2 - 3, 22.7/2 - 2.5, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([76/2 - 3, -22.7/2 + 2.5, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([-76/2 + 3, 22.7/2 - 2.5, 0])
        cylinder(d=4, h=10, center=true, $fn=30);

        translate([-76/2 + 3, -22.7/2 + 2.5, 0])
        cylinder(d=4, h=10, center=true, $fn=30);
    }
}

module mock_buck_converter() {
    difference() {
        // PCB
        cube([26.2, 61.7, 1.6], center=true);

        // M3 holes
        translate([26.2/2 - 2.6, 61.7/2 - 2.8, 0])
        cylinder(d=3, h=5, center=true, $fn=20);

        translate([-26.2/2 + 2.5, 61.7/2 - 2.8, 0])
        cylinder(d=3, h=5, center=true, $fn=20);

        translate([26.2/2 - 2.6, -61.7/2 + 2.8, 0])
        cylinder(d=3, h=5, center=true, $fn=20);

        translate([-26.2/2 + 2.5, -61.7/2 + 2.8, 0])
        cylinder(d=3, h=5, center=true, $fn=20);
    }

    // connector legs
    translate([5/2, 61.7/2 - 3, -1])
    cylinder(d=0.7, h=1.8, center=true, $fn=10);

    translate([-5/2, 61.7/2 - 3, -1])
    cylinder(d=0.7, h=1.8, center=true, $fn=10);

    translate([5/2, -61.7/2 + 3, -1])
    cylinder(d=0.7, h=1.8, center=true, $fn=10);

    translate([-5/2, -61.7/2 + 3, -1])
    cylinder(d=0.7, h=1.8, center=true, $fn=10);

    // connectors
    translate([0, 61.7/2 - 7.5/2, 10/2 + 1.6/2])
    cube([10, 7.5, 10], center=true);

    translate([0, -61.7/2 + 7.5/2, 10/2 + 1.6/2])
    cube([10, 7.5, 10], center=true);

    // potentiometers
    translate([
        26.2/2 - 0.8 - 4.4/2, 9.5/2 + 2.5, 10/2 + 1.6/2
    ]) {
        cube([4.4, 9.5, 10], center=true);

        translate([4.4/2 - 1.2, 9.5/2 - 1.2, 10/2])
        cylinder(d=2.2, h=2, $fn=20);
    }
    translate([
        26.2/2 - 0.8 - 4.4/2, -9.5/2 + 1.5, 10/2 + 1.6/2
    ]) {
        cube([4.4, 9.5, 10], center=true);

        translate([4.4/2 - 1.2, 9.5/2 - 1.2, 10/2])
        cylinder(d=2.2, h=2, $fn=20);
    }

    // coil
    translate([0, -2, 1.6/2 + 15/2])
    rotate([90, 0, 0])
    cylinder(d=15, h=7.5, $fn=40);

    //wires
    translate([-3/2, 61.7/2, 3])
    rotate([-90, 0, 0])
    cylinder(d=1, h=20);

    translate([3/2, 61.7/2, 3])
    rotate([-90, 0, 0])
    cylinder(d=1,h=20);

    translate([-3/2, -61.7/2, 3])
    rotate([90, 0, 0])
    cylinder(d=1, h=20);

    translate([3/2, -61.7/2, 3])
    rotate([90, 0, 0])
    cylinder(d=1, h=20);
}

module mock_led_3mm() {
    hull() {
        translate([0, 0, 4.6 - 2.8/2])
        sphere(d=2.8, $fn=30);

        cylinder(d=2.8, h=1, $fn=30);
    }

    cylinder(d=3.2, h=1.2, $fn=30);
}

module mock_led_5mm() {
    hull() {
        translate([0, 0, 8.6 - 4.9/2])
        sphere(d=4.9, $fn=30);

        cylinder(d=4.9, h=1, $fn=30);
    }

    cylinder(d=5.6, h=1.2, $fn=30);

    translate([3/2 - 0.5/2, 0, -10/2])
    cube([0.5, 0.5, 10], center=true);

    translate([-3/2 + 0.5/2, 0, -10/2])
    cube([0.5, 0.5, 10], center=true);
}

module _liitinrima(
    w=6, l=16.3, h=7.5, d=5.5, dh=12.8,
    dspacing=1, count=2, spacing=2, sd=2.8
) {

    module _liitin() {
        union() {
            translate([0, 0, h/2])
            cube([w, l, h], center=true);

            translate([0, d/2 + dspacing/2, 0])
            cylinder(d=d, h=12.8, $fn=20);

            translate([0, -d/2 - dspacing/2, 0])
            cylinder(d=d, h=12.8, $fn=20);
        }
    }

    color("lightgrey")
    translate([-(count - 1) * (w + spacing)/2, 0, 0])
    difference() {
        union() {
            for (i = [0:count - 1]) {
                translate([i*(spacing + w), 0, 0])
                _liitin();
            }

            if (count > 1) {
                for (i = [0:count - 2]) {
                    translate([
                        i*(spacing + w) + (w + spacing)/2,
                        0, h/2
                    ])
                    cube([
                        spacing + 1, sd + 1.7, h
                    ], center=true);
                }
            }
        }

        if (count > 1) {
            for (i = [0:count - 2]) {
                translate([
                    i*(spacing + w) + (w + spacing)/2,
                    0, 0
                ])
                cylinder(d=sd, h=20, center=true, $fn=20);
            }
        }
    }
}

module mock_liitinrima_small(count=2) {
    _liitinrima(
        w=6, l=16.3, h=7.5, d=5.5, dh=12.8,
        dspacing=1, count=count,
        spacing=2.167, sd=2.8
    );
}

module mock_liitinrima_big(count=2) {
    _liitinrima(
        w=7.3, l=23.1, h=9.4, d=6.2, dh=17.2,
        dspacing=3.8, count=count,
        spacing=4.12, sd=3.7
    );
}

module mock_am4_cpu() {
    // Package Height (IHS + PCB): .180" or 4.57mm (+.005" or .013mm for pin base/solder)
    // PCB Height : .050" or 1.27mm
    // IHS Width: 1.474" or 37.44
    // PCB Width: 1.575" or 40.01

    // Deducted IHS Height: .130" or 3.30mm
    // Deducted Margin either side of IHS : .0505" or 1.283
    // (Not touching the pins because I don't want to risk damage)
    // https://en.wikichip.org/wiki/amd/packages/socket_am4

    h = 2.11 + 4.56;

    union() {
        translate([0, 0, h - 1.3/2 - 3.35])
        cube([40.2, 40.2, 1.3], center=true);

        translate([0, 0, 2.11 + 4.56/2])
        rounded_cube_side(
            37.6, 37.6, 4.56, 4, center=true, $fn=30
        );

        difference() {
            translate([0, 0, 2.2/2])
            cube([39, 39, 2.2], center=true);

            translate([-39/2, 39/2, 0])
            cube([3.5, 3.5, 6], center=true);

            for (i = [0:2]) {
                rotate([0, 0, i*-90])
                translate([39/2, 39/2, 0])
                rotate([0, 0, 45])
                cube([3.5, 3.5, 6], center=true);
            }
        }
    }
}
