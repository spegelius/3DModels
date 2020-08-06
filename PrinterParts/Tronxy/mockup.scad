include<../../lib/includes.scad>;
include<../../Dollo/NEW_long_ties/mockups.scad>;
use<../../Dollo/NEW_long_ties/extention.scad>;
use<../../Dollo/NEW_long_ties/corner.scad>;
use<../../PSUCover/PSUCover.scad>;
use <Single_z_remix.scad>;
use <z_support_remix.scad>;
use <Mega_gantry_remix.scad>;
use <Tronxy_X5S.scad>;
use <Motor_mount_remix.scad>;
use <common.scad>;
use <Top_frame.scad>;
use <Purge_bucket.scad>;


////// VIEW \\\\\\
X5S_frame_mockup();

//debug_z_support();
//debug_PSUs();
//debug_single_z();
//debug_gantry_plates();
//debug_corner_bearing_mounts();
//debug_motor_mount_remix();
debug_top_frame();
//debug_purge_bucket();


////// MODULES \\\\\\
module X5S_frame_mockup() {
    color("darkgrey") translate([0,0,570/2]) difference() {
        cube([530,500,570],center=true);
        cube([490,600,530],center=true);
        cube([600,440,530],center=true);
        cube([490,460,600],center=true);
    }
    
    color("silver") translate([-530/2+10,65,21]) cylinder(d=8,h=528,$fn=30);
    color("silver") translate([-530/2+10,-65,21]) cylinder(d=8,h=528,$fn=30);
    
    // bed
    color("lightgrey")
    translate([0,0,480])
    cube([330,330,3],center=true);
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
        //translate([-100,-0,0]) cube([200,200,35]);
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

module debug_gantry_plates() {
    translate([-530/2+45.9,0,579]) rotate([0,180,90]) tronxy_mega_gantry_left();
    translate([530/2-41.45,0,579]) rotate([0,180,90]) tronxy_mega_gantry_right();
    
    %translate([-530/2+30,-23,580]) mock_bearing();
    %translate([-530/2+30,-23,592]) mock_bearing();
}

module debug_corner_bearing_mounts() {
    translate([-530/2,-460/2-20,570]) tronxy_corner_bearing_mount_left();
    
    translate([530/2,-460/2-20,570]) tronxy_corner_bearing_mount_right();
    
    %translate([-530/2+30,-460/2+6,580]) mock_bearing();
    %translate([-530/2+30,-460/2+6,592]) mock_bearing();
    %translate([-530/2+20,0,585]) cube([2,600,6],center=true);

    %translate([530/2-30,-460/2+6,580]) mock_bearing();
    %translate([530/2-30,-460/2+6,592]) mock_bearing();
    %translate([530/2-20,0,585]) cube([2,600,6],center=true);
}

module debug_motor_mount_remix() {
    //translate([-530/2+45,500/2-20,530]) rotate([0,0,90]) import("../../_downloaded/Tronxy_X5S_nema_mounting/equerre_moteur_X.STL");
    //translate([530/2-45,500/2-20,575]) rotate([0,180,-90]) import("../../_downloaded/Tronxy_X5S_nema_mounting/Sym_equerre_moteur_X.STL");
    translate([-530/2+13,500/2+34,575]) rotate([0,180,90]) new_mount_Y();
    translate([530/2-13,500/2+34,575]) rotate([0,180,-90]) new_mount_X();
    
    %translate([-530/2+13,500/2+22,575]) cylinder(d=12,h=10,$fn=30);
    %translate([530/2-13,500/2+22,585]) cylinder(d=12,h=10,$fn=30);
}

module debug_top_frame() {
    translate([0,0,570-20-7]) top_frame_assembly();
}

module debug_purge_bucket() {
    translate([0,-500/2+57,570-100/2-20-35])
    bucket();
    translate([0,-500/2+20/2,570-20-5/2])
    rotate([180,0,0])
    bucket_mount();
    translate([0,-500/2+20/2+3.5,570-28.5-10/2])
    rotate([0,90,0])
    bucket_arm();
}

//39, 43

translate([70,-500/2+20])
cube([10,39+24,600]);