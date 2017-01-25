
$fn=40;

length = 130;
width = 12;
height=4;

middle = 26;

foot_dia = length/2-middle/2-7;

module foot() {
    difference() {
        cylinder(d=foot_dia, h=height);
        translate([length/2/2,0,height/2]) cube([length/2, length/2, height+1], center=true);
    }
}

difference() {
    // base
    cube([width, length, height]);
    
    // bolt hole
    hull() {
        translate([width/2, 7, 0]) cylinder(d=3.5, h=height);
        translate([width/2, length/2-middle/2, 0]) cylinder(d=3.5, h=height);
    }
    
    // bolt hole
    hull() {
        translate([width/2, length/2+middle/2, 0]) cylinder(d=3.5, h=height);
        translate([width/2, length-7, 0]) cylinder(d=3.5, h=height);
    }
    
    // bolt head hole
    hull() {
        translate([width/2, 7, height-2]) cylinder(d=5.8, h=height);
        translate([width/2, length/2-middle/2, height-2]) cylinder(d=5.8, h=height);
    }
    
    // bolt head hole
    hull() {
        translate([width/2, length/2+middle/2, height-2]) cylinder(d=5.8, h=height);
        translate([width/2, length-7, height-2]) cylinder(d=5.8, h=height);
    }

}

translate([0,foot_dia/2+7]) foot();
translate([0,length - foot_dia/2-7]) foot();