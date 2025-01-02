use <../Dollo/NEW_long_ties/extention.scad>;

use <case_230_430_480.scad>;
use <case_models.scad>;
use <frame_parts.scad>;
use <psu.scad>;
use <motherboard.scad>;
use <fans.scad>;
use <cover.scad>;
use <hdd.scad>;


//dimensions();
//orientation();
//frame_corners();
//frame_extention_t();
//frame_d_beams();
//frame_final();
//frame_reinforcements();

//psu_plate_mounts();
//psu_backplate();
//psu_bottom_support();

//motherboard_mounts();
//motherboard_tray();
//motherboard_plate_clips();
//motherboard_plate();

//fans();

//hdds();
//hdd_joiners();
hdd_cable_support();

//bottom_clips();
//bottom_cover();
//cover_clips();

//cover_ends();


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
    translate([100, 53.5, 6])
    rotate([-90, 0, 0])
    PSU_bottom_support(230);

    color("Red")
    render()
    translate([185, 58, 0])
    rotate([180, 0, 180])
    PSU_bottom_support_long_tie();
}

module motherboard_mounts() {
    psu_bottom_support();

    render()
    translate([200, 185, 480 - 304])
    rotate([0, -90, 90])
    motherboard_tray_mount_2();

    render()
    translate([
        200, -45, 480 - 304
    ])
    rotate([0, 90, 90])
    motherboard_tray_mount_1();

    render()
    translate([200, 185, 480 - 89])
    rotate([0, -90, 90])
    motherboard_tray_mount_top_2();

    render()
    translate([200, -45, 480 - 89])
    rotate([0, 90, 90])
    motherboard_tray_mount_top_1();

    color("Red")
    render()
    translate([200, 185, 386])
    rotate([90, 0, 90])
    motherboard_tray_long_bow_tie_half();

    color("Red")
    render()
    translate([200, 185, 386])
    rotate([90, 0, -90])
    motherboard_tray_long_bow_tie_half();

    color("Red")
    render()
    translate([200, 160, 435])
    rotate([0, 90, 0])
    motherboard_tray_long_bow_tie_half();

    color("Red")
    render()
    translate([200, 160, 435])
    rotate([0, -90, 0])
    motherboard_tray_long_bow_tie_half();
}

module motherboard_tray() {
    motherboard_mounts();

    color("SlateGray")
    render()
    translate([188, 182, 420])
    rotate([0, 90, 180])
    motherboard_tray_atx(430, render_threads=false);

    color("Red")
    render()
    translate([213.7, 173, 376])
    rotate([0, -90, 0])
    motherboard_tray_screw(render_threads=false);

    color("Red")
    render()
    translate([213.7, -33, 376])
    rotate([0, -90, 0])
    motherboard_tray_screw(render_threads=false);

    color("Red")
    render()
    translate([213.7, 173, 161])
    rotate([0, -90, 0])
    motherboard_tray_screw(render_threads=false);

    color("Red")
    render()
    translate([213.7, -33, 161])
    rotate([0, -90, 0])
    motherboard_tray_screw(render_threads=false);
}

module motherboard_plate_clips() {
    motherboard_mounts();

    render()
    translate([100, 200, 435])
    rotate([90, 90, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([100, 200, 435])
    rotate([90, 90, 180])
    motherboard_back_plate_clip_long_tie_half();

    render()
    translate([15, 200, 385])
    rotate([90, 0, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([15, 200, 385])
    rotate([90, 180, 180])
    motherboard_back_plate_clip_long_tie_half();    

    render()
    translate([15, 200, 304])
    rotate([90, 0, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([15, 200, 304])
    rotate([90, 180, 180])
    motherboard_back_plate_clip_long_tie_half(); 

    render()
    translate([15, 200, 220])
    rotate([90, 0, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([15, 200, 220])
    rotate([90, 180, 180])
    motherboard_back_plate_clip_long_tie_half(); 

    render()
    translate([15, 200, 130])
    rotate([90, 0, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([15, 200, 130])
    rotate([90, 180, 180])
    motherboard_back_plate_clip_long_tie_half(); 

    render()
    translate([185, 200, 385])
    rotate([90, 180, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([185, 200, 385])
    rotate([90, 0, 180])
    motherboard_back_plate_clip_long_tie_half(); 

    render()
    translate([185, 200, 304])
    rotate([90, 180, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([185, 200, 304])
    rotate([90, 0, 180])
    motherboard_back_plate_clip_long_tie_half(); 

    render()
    translate([185, 200, 220])
    rotate([90, 180, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([185, 200, 220])
    rotate([90, 0, 180])
    motherboard_back_plate_clip_long_tie_half(); 

    render()
    translate([185, 200, 130])
    rotate([90, 180, 0])
    motherboard_back_plate_clip();

    color("Red")
    render()
    translate([185, 200, 130])
    rotate([90, 0, 180])
    motherboard_back_plate_clip_long_tie_half(); 
}

module motherboard_plate() {
    motherboard_plate_clips();

    color("SlateGray")
    render()
    translate([185, 185, 435])
    rotate([-90, 90, 0])
    motherboard_back_plate(230, 480);
}

module fans() {
    motherboard_plate();

    render()
    translate([100, -200, 50])
    rotate([90, 0, 0])
    fan_mount_140mm(230);

    render()
    translate([100, -200, 196.5])
    rotate([90, 0, 0])
    fan_mount_dual_140mm(230);

    render()
    translate([100, -200, 343])
    rotate([90, 180, 0])
    fan_mount_140mm(230);

    render()
    translate([100, -150, 450])
    fan_mount_140mm(230);
    
    render()
    translate([100, -3.5, 450])
    fan_mount_dual_140mm(230);

    render()
    translate([100, 143, 450])
    rotate([0, 0, 180])
    fan_mount_140mm(230);

    color("Red")
    render()
    translate([15, -200, 60])
    rotate([-90, 0, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([15, -200, 196.5])
    rotate([-90, 0, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([15, -200, 333])
    rotate([-90, 0, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([185, -200, 60])
    rotate([-90, 180, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([185, -200, 196.5])
    rotate([-90, 180, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([185, -200, 333])
    rotate([-90, 180, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([15, -140, 450])
    rotate([180, 0, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([15, -3.5, 450])
    rotate([180, 0, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([15, 133, 450])
    rotate([180, 0, 0])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([185, -140, 450])
    rotate([180, 0, 180])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([185, -3.5, 450])
    rotate([180, 0, 180])
    fan_mount_long_tie_half();

    color("Red")
    render()
    translate([185, 133, 450])
    rotate([180, 0, 180])
    fan_mount_long_tie_half();
}

module hdds() {
    motherboard_plate();

    render()
    translate([77, -125.5, 100])
    rotate([0, 0, -90])
    hdd_mount_rails(230);

    color("Red")
    render()
    translate([0, -185, 100])
    rotate([-90, 0, 90])
    hdd_mount_long_tie_half();

    color("Red")
    render()
    translate([200, -185, 100])
    rotate([90, 0, 90])
    hdd_mount_long_tie_half();

    color("Red")
    render()
    translate([200, -75, 100])
    rotate([-90, 0, -90])
    hdd_mount_long_tie_half();

    render()
    translate([77, -125.5, 130])
    rotate([0, 0, -90])
    hdd_mount_rails(230);

    color("Red")
    render()
    translate([0, -185, 130])
    rotate([-90, 0, 90])
    hdd_mount_long_tie_half();

    color("Red")
    render()
    translate([200, -185, 130])
    rotate([90, 0, 90])
    hdd_mount_long_tie_half();

    color("Red")
    render()
    translate([200, -75, 130])
    rotate([-90, 0, -90])
    hdd_mount_long_tie_half();

    render()
    translate([77, -125.5, 160])
    rotate([0, 0, -90])
    hdd_mount_rails(230);

    color("Red")
    render()
    translate([0, -185, 160])
    rotate([-90, 0, 90])
    hdd_mount_long_tie_half();

    color("Red")
    render()
    translate([200, -185, 160])
    rotate([90, 0, 90])
    hdd_mount_long_tie_half();

    color("Red")
    render()
    translate([200, -75, 160])
    rotate([-90, 0, -90])
    hdd_mount_long_tie_half();
}

module hdd_joiners() {
    hdds();

    color("lightgrey")
    render()
    translate([7, -66, 100])
    hdd_mount_joiner();

    color("lightgrey")
    render()
    translate([7, -66, 130.1])
    hdd_mount_joiner();
}

module hdd_cable_support() {
    hdd_joiners();

    color("SlateGray")
    render()
    translate([187.5, -130, 160])
    rotate([0, 0, -90])
    hdd_mount_cable_support();
}

module bottom_clips() {
    fans();

    render()
    translate([100, 185, 0])
    rotate([90, 0, -90])
    bottom_mount_clip();

    color("Red")
    render()
    translate([100, 185, 0])
    rotate([0, 0, -90])
    bottom_mount_clip_long_tie_half();

    render()
    translate([100, -185, 0])
    rotate([90, 0, 90])
    bottom_mount_clip();

    color("Red")
    render()
    translate([100, -185, 0])
    rotate([0, 0, 90])
    bottom_mount_clip_long_tie_half();

    render()
    translate([185, 0, 0])
    rotate([90, 0, 180])
    bottom_mount_clip();

    color("Red")
    render()
    translate([185, 0, 0])
    rotate([0, 0, 180])
    bottom_mount_clip_long_tie_half();

    render()
    translate([185, 110, 0])
    rotate([90, 0, 180])
    bottom_mount_clip();

    color("Red")
    render()
    translate([185, 110, 0])
    rotate([0, 0, 180])
    bottom_mount_clip_long_tie_half();

    render()
    translate([185, -110, 0])
    rotate([90, 0, 180])
    bottom_mount_clip();

    color("Red")
    render()
    translate([185, -110, 0])
    rotate([0, 0, 180])
    bottom_mount_clip_long_tie_half();

    render()
    translate([15, 0, 0])
    rotate([90, 0, 0])
    bottom_mount_clip();

    color("Red")
    render()
    translate([15, 0, 0])
    bottom_mount_clip_long_tie_half();

    render()
    translate([15, 110, 0])
    rotate([90, 0, 0])
    bottom_mount_clip();

    color("Red")
    render()
    translate([15, 110, 0])
    bottom_mount_clip_long_tie_half();

    render()
    translate([15, -110, 0])
    rotate([90, 0, 0])
    bottom_mount_clip();

    color("Red")
    render()
    translate([15, -110, 0])
    bottom_mount_clip_long_tie_half();

}

module bottom_cover() {
    bottom_clips();

    color("SlateGray")
    render()
    translate([100, 0, -15])
    rotate([0, 0, 180])
    bottom(230, 430);
}

module cover_clips() {
    bottom_cover();

    render()
    translate([0, -215, 50])
    rotate([0, 0, 180])
    front_cover_snap_clip_left();

    render()
    translate([200, -215, 50])
    rotate([0, 0, 180])
    front_cover_snap_clip_right();

    render()
    translate([0, -215, 200])
    rotate([0, 0, 180])
    front_cover_snap_clip_left();

    render()
    translate([200, -215, 200])
    rotate([0, 0, 180])
    front_cover_snap_clip_right();

    render()
    translate([0, -215, 300])
    rotate([0, 0, 180])
    front_cover_snap_clip_left();

    render()
    translate([200, -215, 300])
    rotate([0, 0, 180])
    front_cover_snap_clip_right();
}

module cover_ends() {
    cover_clips();

    translate([100, -215, 75])
    rotate([0, 180, 0])
    front_cover_end(230, 80, brim=false);
}