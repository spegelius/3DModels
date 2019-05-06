include<../../lib/includes.scad>;
include<../../Dollo/NEW_long_ties/mockups.scad>;
use<../../PSUCover/PSUCover.scad>;
use <Single_z_remix.scad>;
use <z_support_remix.scad>;
use <../../S-240-12/cover_2020.scad>;

module X5S_frame_mockup() {
    color("darkgrey") translate([0,0,570/2]) difference() {
        cube([530,500,570],center=true);
        cube([490,600,530],center=true);
        cube([600,440,530],center=true);
        cube([490,460,600],center=true);
    }
    
    color("silver") translate([-530/2+10,65,21]) cylinder(d=8,h=528,$fn=30);
    color("silver") translate([-530/2+10,-65,21]) cylinder(d=8,h=528,$fn=30);
}

module debug_z_support() {
    translate([-530/2+10,0,520]) rotate([180,0,-90]) new_z_support(final_render=false);
}

module debug_PSUs() {
    // PSU1
    translate([205,255,129]) {
        rotate([0,90,90]) mock_PSU_240W();
        translate([59,-2.25,-55.5]) rotate([0,-90,0]) cover_240W_with_2020_ear();
        translate([-187,-5,-55.5]) rotate([0,90,90]) bottom_bracket2();
    }
    
    // PSU2
    translate([-50,255,132]) {
        rotate([0,90,90]) mock_PSU_600W();
        translate([35,-2,-53.5]) rotate([0,-90,0]) cover2_360W_with_2020_ear();
        translate([-182.5,-5,-57]) rotate([0,90,90]) bottom_bracket1();
    }
}

module debug_single_z() {
    
    translate([-530/2+10,0,20]) intersection() {
        z_bottom();
        translate([-100,-0,0]) cube([200,200,35]);
    }
    translate([-530/2+10,0,570-20]) rotate([180,0,180]) z_top();
    color("white") translate([-530/2+10,65,570-25]) rotate([180,0,180]) rod_clip();
    color("white") translate([-530/2+10,0,570-25]) rotate([180,0,180]) z_screw_clip();
    
    %translate([-530/2+10,0,30]) color("white") 625zz();
    
    //translate([-530/2+10,0,36]) import("../../_downloaded/Parametric_pulley/GT2_40teeth.stl");
    
    // axle
    translate([-530/2+10,0,30]) cylinder(d=5,h=45,$fn=20);
    
    translate([-530/2+10,0,51.5]) rotate([180,0,0]) z_pulley_40t();
    translate([-530/2+10,0,43.5]) rotate([180,0,0]) z_pulley_40t_retainer();
    
    translate([0,160,0]) rotate([0,0,90]) z_motor_mount();
    
    // belt
    %translate([0,-12.5,47]) cube([510,1,6],center=true);
    %translate([-262,10.5,44]) rotate([0,0,23]) cube([278,1,6]);
    %translate([-8,120,44]) rotate([0,0,-2.6]) cube([1,41,6]);
    
    // belt length:
    // - 510: across
    // - 278: from pulley to motor idler
    // - 41: from idler to motor pulley
    // - 16: motor pulley
    // - 0.90*80: pulley
    echo(510+278*2+41*2+0.90*80+16);
    
    // center beam, 10mm threaded rod
    translate([0,0,10]) rotate([0,90,0]) cylinder(d=10,h=475,center=true,$fn=40);
    
    // center beam mounts
    translate([-490/2,0,10]) rotate([90,0,90]) center_rod_mount();
    translate([490/2,0,10]) rotate([90,0,-90]) center_rod_mount();
    
    // z rod support
    translate([-490/2+15,0,57]) rotate([90,0,0]) z_rod_support();

}

X5S_frame_mockup();

debug_z_support();
//debug_PSUs();
debug_single_z();
