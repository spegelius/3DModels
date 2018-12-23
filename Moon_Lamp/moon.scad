use <../Dollo/NEW_long_ties/include.scad>;
use <../lib/includes.scad>;

module to_the_moon() {
    difference() {
        union() {
            intersection() {
                translate([0,0,250/2-25]) import("../_downloaded/Moon_lamp/moon_lamp_10_inches_refinement_level_360.stl", convexity=3);
                translate([0,0,254/2]) cube([254,254,254],center=true);
            }
            cylinder(d=138,h=10,$fn=80);
        }
        cylinder(d=134,h=25,$fn=80,center=true);
        cube([138.1,5,25],center=true);
        translate([0,0,7+5/2]) rotate([0,0,6]) cube([139,10,5],center=true);
    }
}

//to_the_moon();

module bottom_thread() {
    difference() {
        cylinder(d=117,h=10,$fn=100);
        translate([0,0,-1]) v_screw(h=13, screw_d=107, pitch=3, direction=0, steps=100);
    }
}

module moon_stand(){
    difference() {
        union() {
            cylinder(d1=135,d2=120,h=15,$fn=100);
            translate([0,0,14.99]) v_screw(h=10.02, screw_d=106.4, pitch=3, direction=0, steps=100);
        }
        //cylinder(d=15,h=25,$fn=30);
        translate([0,0,-0.1]) difference() {
            cylinder(d1=131,d2=116,h=13.6,$fn=100);
            cylinder(d=80,h=28,center=true,$fn=100);
        }
        
        difference() {
            cylinder(d=76,h=27,center=true,$fn=100);
            cylinder(d=40,h=27,center=true,$fn=100);
        }
        
        cylinder(d=36,h=27,center=true,$fn=100);
        
        translate([0,0,15]) cylinder(d=100,h=11,$fn=100);
        
        translate([0,0,13.7]) cylinder(d=20,h=11,$fn=100);
        
        translate([0,0,8]) rotate([95,0,0]) cylinder(d=6,h=100,$fn=20);
    }
    
    translate([0,0,13.6]) g9_lamp_socket(h=41);
}

//scaling = 1/0.8;
//scale(scaling) bottom_thread();

moon_stand();

//difference() {
//    v_screw(h=5, screw_d=106.5, pitch=3, direction=0, steps=100);
//    cylinder(d=100,h=10,$fn=100);
//}