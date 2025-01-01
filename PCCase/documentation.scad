use <../Dollo/NEW_long_ties/extention.scad>;

use <case_230_430_480.scad>;
use <case_models.scad>;
use <frame_parts.scad>;
use <psu.scad>;


//dimensions();
//orientation();
//frame_corners();
//frame_extention_t();
//frame_d_beams();
//frame_final();
//frame_reinforcements();

//psu_plate_mounts();
//psu_backplate();
psu_bottom_support();


module dimensions() {
    mockup();

    translate([0, -100, 0])
    //rotate([0, 0, 90])
    text(
        text = "Width >", size=40,
        font="Arial:style=Bold"
    );

    translate([300, 100, 0])
    rotate([0, 0, 90])
    text(
        text = "Depth >", size=40,
        font="Arial:style=Bold"
    );

    translate([300, 400, 0])
    rotate([90, -90, 0])
    text(
        text = "Height >", size=40,
        font="Arial:style=Bold"
    );
}

module orientation() {

    mockup();

    translate([-190, 20, 0])
    text(
        text = "Left", size=40,
        font="Arial:style=Bold"
    );

    translate([270, 20, 0])
    text(
        text = "Right", size=40,
        font="Arial:style=Bold"
    );
}

module frame_corners() {

    render()
    _back_bottom_corners(230);

    color("lightgrey")
    render()
    translate([110/2 + 45, 0, 0])
    rotate([0, 90, 0])
    extention(units=110/30, support=false);
}

module _ft() {
    frame_corners();

    color("lightgrey")
    render()
    translate([200, 115, -15])
    rotate([0, 0, 180])
    extention_t_140(supports=false);
}

module frame_extention_t() {
    translate([0, 20, 0])
    _ft();

    mirror([0, 1, 0])
    translate([0, 20, 0])
    _ft();
}

module _frame_d_beams() {
    translate([0, -200, 0])
    _ft();

    translate([200, 200, 0])
    rotate([0, 0, 180])
    frame_corners();

    color("lightgrey")
    render()
    translate([200, 70, 0])
    rotate([90, 0, 0])
    extention(units=170/30, support=false);

    color("lightgrey")
    render()
    rotate([90, 0, 0])
    extention(units=310/30, support=false);
}

module frame_d_beams() {
    translate([20, 0, 0])
    _frame_d_beams();

    mirror([1, 0, 0])
    translate([20, 0, 0])
    _frame_d_beams();
}

module frame_final() {

    _frame_d_beams();

    translate([0, 0, 450])
    mirror([0, 0, 1])
    _frame_d_beams();

    color("lightgrey")
    render()
    translate([0, -200, 360/2 + 45])
    extention(units=360/30, support=false);

    color("lightgrey")
    render()
    translate([200, -200, 360/2 + 45])
    extention(units=360/30, support=false);

    color("lightgrey")
    render()
    translate([200, -60, 360/2 + 45])
    extention(units=360/30, support=false);

    color("lightgrey")
    render()
    translate([0, 200, 360/2 + 45])
    extention(units=360/30, support=false);

    color("lightgrey")
    render()
    translate([200, 200, 360/2 + 45])
    extention(units=360/30, support=false);    
}

module frame_reinforcements() {
    frame_final();

    color("lightgrey")
    translate([0, -200])
    cylinder(d=8, h=442, $fn=30);

    color("lightgrey")
    translate([0, -200, 436])
    cylinder(d=16, h=5, $fn=6);

    color("lightgrey")
    translate([0, 4, 450])
    rotate([90, 0, 0])
    cylinder(d=8, h=392, center=true, $fn=30);

    color("lightgrey")
    translate([0, -186, 450])
    rotate([90, 0, 0])
    cylinder(d=16, h=5, $fn=6);
}

module psu_plate_mounts() {
    color("lightgrey")
    frame_final();

    color("RoyalBlue")
    render()
    translate([100, 200, 15])
    rotate([0, -90, 90])
    PSU_plate_long_tie_bottom();

    color("RoyalBlue")
    render()
    translate([100, 200, 15])
    rotate([0, -90, -90])
    PSU_plate_long_tie_bottom();

    render()
    translate([185, 200, 61])
    rotate([180, 0, 0])
    PSU_plate_mount_2();

    render()
    translate([15, 200, 61])
    rotate([180, 0, 0])
    PSU_plate_mount_1();

    color("Red")
    render()
    translate([15, 200, 27])
    rotate([-90, 0, 0])
    PSU_plate_long_tie();
    
    color("Red")
    render()
    translate([15, 200, 93])
    rotate([-90, 0, 0])
    PSU_plate_long_tie();

    color("Red")
    render()
    translate([185, 200, 27])
    rotate([90, 0, 180])
    PSU_plate_long_tie();
    
    color("Red")
    render()
    translate([185, 200, 93])
    rotate([90, 0, 180])
    PSU_plate_long_tie();
}

module psu_backplate() {
    psu_plate_mounts();

    color("SlateGray")
    translate([100, 193.5, 17.5])
    rotate([90, 0, 180])
    PSU_backplate(230);
}

module psu_bottom_support() {
    psu_backplate();

    color("SlateGray")
    render()
    translate([100, 63.5, 6])
    rotate([-90, 0, 0])
    PSU_bottom_support(230);

    color("Red")
    render()
    translate([185, 68, 0])
    rotate([180, 0, 180])
    PSU_bottom_support_long_tie();
}
