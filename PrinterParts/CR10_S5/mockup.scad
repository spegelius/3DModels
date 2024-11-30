include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/mockups.scad>;
use <mockups.scad>;
use <Bondtech_Style_Extruder.scad>;
use <../Tronxy/common.scad>;
use <CR-10_S5_Y-reinforcement/CR-10_S5_Y-reinforcement.scad>;
use <CR-10_S5_Y_Axis_motor_bracket/CR-10_S5_Y_Axis_motor_bracket.scad>;
use <CR-10_S5_bed_insulation_retainers/bed_insulation_retainers.scad>;

use <raspi_mount.scad>;


w = 600;
d = 700;
h = 690;

z_y_pos = -d/2 + 380 + 20/2;
x_beam_y_pos = z_y_pos - 26.5;
x_beam_z_pos = h - 570 - 20/2;
echo(x_beam_y_pos);

// x carriage position for debugging
x_pos = 0;
x_z_pos = 500;

y_pos = 170;


CR10_S5_frame();
CR10_S5_bed();
CR10_S5_hotend();
//CR10_S5_hotend_e3d();
CR10_S5_x_carriage();
//CR10_S5_x_carriage_bondtech();
CR10_S5_x_carriage_bondtech_e3d();
CR10_S5_drag_chain_arm();
CR10_S5_drag_chain_mount();
CR10_S5_drag_chain_support();
CR10_S5_control_box();

debug_y_reinforcement();

translate([0, 0, -9])
debug_y_motor_bracket();

translate([-469.9, 130.3, 115])
rotate([0, 90, 180])
debug_raspi_mount();


module CR10_S5_frame() {

    // sides
    translate([-w/2 + 40/2, 0, 20/2])
    cube([40, d, 20], center=true);

    translate([w/2 - 40/2, 0, 20/2])
    cube([40, d, 20], center=true);

    // front and back
    translate([0, -d/2 + 20/2, 20/2])
    cube([w, 20, 20], center=true);

    translate([0, d/2 - 20/2, 20/2])
    cube([w, 20, 20], center=true);

    // z
    translate([-w/2 + 40/2, z_y_pos, h/2])
    cube([40, 20, h], center=true);

    translate([w/2 - 40/2, z_y_pos, h/2])
    cube([40, 20, h], center=true);

    // z top
    translate([0, z_y_pos, h - 20/2])
    cube([w, 20, 20], center=true);

    // x beam
    translate([
        0, x_beam_y_pos, x_beam_z_pos + x_z_pos
    ])
    cube([w, 20, 20], center=true);

    // y beams
    translate([-300/2 + 40/2, 0, 20/2 + 20])
    cube([40, d, 20], center=true);

    translate([300/2 - 40/2, 0, 20/2 + 20])
    cube([40, d, 20], center=true);

    // z screws
    translate([
        -w/2 + 40/2,
        z_y_pos + 35.5 - 8/2,
        20
    ])
    cylinder(d=8, h=h, $fn=20);

    translate([
        w/2 - 40/2,
        z_y_pos + 35.5 - 8/2,
        20
    ])
    cylinder(d=8, h=h, $fn=20);

    // right z plate
    translate([
        w/2 - 40/2,
        z_y_pos + 35.5 - 8/2,
        x_beam_z_pos + x_z_pos + 31
    ])
    cube([17, 28, 2.5], center=true);

    // motor plate
    translate([
        -w/2 + 40 + 10,
         //-d/2 + 380 - 26 + 54 + 20,
         z_y_pos + 64 - motor_side_length/2,
         x_beam_z_pos + x_z_pos + 45 - 2.5
    ])
    motor_plate(h=2.5, bolt_head_cones=false);
    
    translate([
        -w/2 + 40 + 6,
        z_y_pos + 20/2 + 4 + 2.5/2,
        x_beam_z_pos + x_z_pos + 45 - 50/2,
    ])
    cube([50, 2.5, 50], center=true);

    translate([
        -w/2 + 40 + 6,
        z_y_pos + 20/2 + 4 + 15/2,
        x_beam_z_pos + x_z_pos + 45 - 2.5/2,
    ])
    cube([50, 15, 2.5], center=true);
}

module CR10_S5_bed() {
    translate([0, y_pos,  44 + 20 - 15])
    union() {
        translate([0, 0, 15 + 3.2/2])
        cube([510, 510, 3.2], center=true);

        color("lightgrey")
        render()
        translate([0, 0, 15/2])
        difference() {
            cube([510 - 60, 510 - 60, 15], center=true);
            cube([510 - 120, 510 - 120, 16], center=true);
        }

        for(i = [0:3]) {
            rotate([0, 0, i*360/4])
            translate([510/2 - 85, 510/2 - 85, 0])
            cylinder(d=4, h=15, $fn=20);
        }

        // heater
        color("darkgrey")
        translate([0, 0, 15 + 3.2/2 - 2])
        cube([310, 310, 3.2], center=true);
    }

    color("darkgrey")
    render()
    translate([0, y_pos, 44 + 20 - 15])
    debug_bed_insulation_retainers();
}

module CR10_S5_hotend() {
    y = x_beam_y_pos - 26.5;
    z = x_beam_z_pos + x_z_pos - 39.7;

    translate([
        -w/2 + 64/2 + 2 + x_pos + 16.7,
        y, z
    ])
    mock_creality_hotend();
}

module CR10_S5_hotend_e3d() {

    z = x_beam_z_pos + x_z_pos - 39.7;

    translate([
        -w/2 + 64/2 + 2 + x_pos + 16.7,
        -18, z
    ])
    rotate([0, 0, 180])
    e3d_Volcano();
}

module CR10_S5_x_carriage() {
    y = x_beam_y_pos - 16;
    z = x_beam_z_pos + x_z_pos + 8.5;
    
    translate([
        -w/2 + 64/2 + 2 + x_pos,
        y, z
    ])
    mock_creality_x_carriage();

    translate([
        -w/2 + 64/2 - 18 + x_pos, y + 16,
        z + 11.5
    ])
    rotate([90, 0, 0])
    roller();

    translate([
        -w/2 + 64/2 + 22 + x_pos, y + 16,
        z + 11.5
    ])
    rotate([90, 0, 0])
    roller();

    translate([
        -w/2 + 64/2 + 2 + x_pos, y + 16,
        z - 28.5
    ])
    rotate([90, 0, 0])
    roller();
}

module CR10_S5_x_carriage_bondtech() {
    y = x_beam_y_pos - 13;
    z = x_beam_z_pos + x_z_pos + 20;

    translate([
        -w/2 + 64/2 + 40 + x_pos, y,
        z
    ])
    rotate([0, -90, 0])
    cr_extruder_carriage_mount();
}

module CR10_S5_x_carriage_bondtech_e3d() {
    y = x_beam_y_pos - 14.25;
    z = x_beam_z_pos + x_z_pos + 20;

    translate([
        -w/2 + 64/2 + 40 + x_pos, y,
        z
    ])
    rotate([0, -90, 0])
    cr_extruder_carriage_mount_e3d();
}

module CR10_S5_drag_chain_arm() {
    y = x_beam_y_pos - 7;
    z = x_beam_z_pos + x_z_pos + 70;

    translate([
        -w/2 + 64/2 + 10 + x_pos, y,
        z
    ])
    rotate([90, 0, 90])
    drag_chain_arm();
}

module CR10_S5_drag_chain_mount() {
    z = x_beam_z_pos + x_z_pos;
    translate([-w/2 + 30.5, 100, z + 1])
    rotate([90, 0, 90])
    drag_chain_mount();
}

module CR10_S5_drag_chain_support() {
    y = x_beam_y_pos + 20/2 + 5/2;
    z = x_beam_z_pos + x_z_pos - 10/2;

    translate([-w/2 + 100, y, z])
    rotate([0, 0, 90])
    drag_chain_support();

    translate([-w/2 + 100 + 133, y, z])
    rotate([0, 0, 90])
    drag_chain_support();

    translate([-w/2 + 100 + 2*133, y, z])
    rotate([0, 0, 90])
    drag_chain_support();

    translate([-w/2 + 100 + 3*133, y, z])
    rotate([0, 0, 90])
    drag_chain_support();

    translate([17.5, y + 87, z + 6.5])
    rotate([-90, 0, 180])
    drag_chain_support_level();
}

module CR10_S5_control_box() {
    translate([-400, 0, 120/2])
    difference() {
        hull() {
            cube([125.5, 300, 118], center=true);
        }

        translate([-125.5/2 + 13, 300/2 - 24, 118/2 - 5])
        cylinder(d=3, h=10, $fn=20);

        translate([
            -125.5/2 + 13 + 22.75, 300/2 - 24, 118/2 - 5
        ])
        cylinder(d=3, h=10, $fn=20);

    }
}
