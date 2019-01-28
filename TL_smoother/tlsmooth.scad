use <../PCParts/common.scad>;
include <../Dollo/New_long_ties/globals.scad>;
use <../Dollo/New_long_ties/include.scad>;

module diode_1N5404() {
    color("black") translate([0,0,-1.5/2]) cylinder(d=5.3, h=7.5,$fn=20,center=true);
    color("grey") translate([0,0,-1.5/2+9/2]) cylinder(d=5.3, h=1.5,$fn=20,center=true);
    color("grey") cylinder(d=1, h=16,$fn=20,center=true);
}

module assembly() {
    offset = 8;
    translate([-8,0,0]) {
        translate([-3,offset,0]) rotate([90,0,0]) diode_1N5404();
        translate([-3,-offset,0]) rotate([90,0,0]) diode_1N5404();
        translate([3,offset,0]) rotate([90,0,0]) diode_1N5404();
        translate([3,-offset,0]) rotate([90,0,0]) diode_1N5404();
    }

    translate([8,0,0]) {
        translate([-3,offset,0]) rotate([90,0,0]) diode_1N5404();
        translate([-3,-offset,0]) rotate([90,0,0]) diode_1N5404();
        translate([3,offset,0]) rotate([90,0,0]) diode_1N5404();
        translate([3,-offset,0]) rotate([90,0,0]) diode_1N5404();
    }

    translate([-4,21,0]) rotate([-90,0,0]) pin_header(4);
}

w = 32;
l = 54;
h = 7;

module base() {

    module longhole() {
        hull() {
            translate([0,13,0]) cylinder(d=3,h=h+1,center=true,$fn=20);
            translate([0,-13,0]) cylinder(d=3,h=h+1,center=true,$fn=20);
        }
    }

    difference() {
        union() {
            rounded_cube_side(w,l,h,6,center=true);
            translate([0,l/2,0]) cube([12.5,11,h],center=true);
        }
        difference() {
            translate([0,0,1.5]) rounded_cube_side(w-3,l-3,h,3,center=true);

            translate([w/2-3,l/2-3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            translate([-w/2+3,l/2-3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            translate([w/2-3,-l/2+3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            translate([-w/2+3,-l/2+3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            
            cube([4,l-18,h],center=true);
            translate([0,7,-h/2]) cube([w,2,h],center=true);
            translate([0,-7,-h/2]) cube([w,2,h],center=true);
            translate([0,0,-h/2+1.5]) cube([w,4,h],center=true);

            translate([0,-l/2+6/2,0]) cube([10,6,h+1],center=true);
            translate([0,l/2-4.4/2,-1]) cube([10,4.4,3.9],center=true);
        }
        translate([0,l/2-2.2/2-1,-h/2+5/2+4]) cube([10.5,2.5,5],center=true);
        translate([0,l/2+6/2,h/2+5/2-2.5]) cube([10.5,6,5],center=true);
        translate([0,0,1.5]) cube([2,l-18,h],center=true);

        translate([0,-l/2,2]) rotate([90,0,0]) cylinder(d=5,h=17,center=true);
        translate([0,-l/2+3,4]) cube([12,2,5],center=true);

        x_offset = -10.5/2 + 2.54/2+0.2;
        for (i=[0:4-1]) {
            translate([x_offset+i*2.54,l/2,h/2-2.5/2]) rotate([-90,0,0]) cube([0.8,0.8, 11.5],center=true);
        }
        
        translate([w/2-3,l/2-3,-0.1]) cylinder(d=2.8,h=h+2,$fn=30,center=true);
        translate([-w/2+3,l/2-3,-0.1]) cylinder(d=2.8,h=h+2,$fn=30,center=true);
        translate([w/2-3,-l/2+3,-0.1]) cylinder(d=2.8,h=h+2,$fn=30,center=true);
        translate([-w/2+3,-l/2+3,-0.1]) cylinder(d=2.8,h=h+2,$fn=30,center=true);
        
        translate([-11,0,0]) longhole();
        translate([-5,0,0]) longhole();
        
        translate([11,0,0]) longhole();
        translate([5,0,0]) longhole();

        translate([0,l/2+6,-h/2]) rotate([45,0,0]) cube([20,6,6],center=true);
    }
}

module lid() {
    
    lh = 4;
    
    module longhole() {
        hull() {
            translate([-w/10,0,0]) cylinder(d=3,h=h+1,center=true,$fn=20);
            translate([w/10,0,0]) cylinder(d=3,h=h+1,center=true,$fn=20);
        }
    }
    
    difference() {
        union() {
            rounded_cube_side(w,l,lh,6,center=true);
            translate([0,0,lh/2+1.5/2]) rounded_cube_side(w-3.2,l-3.2,1.5,2.8,center=true);
            translate([0,l/2,0]) cube([12.5,11,lh],center=true);
        }
        difference() {
            translate([0,0,1.5]) rounded_cube_side(w-5.2,l-5.2,lh,.8,center=true);
            translate([0,0,1.5]) cube([1.8,l-18,h],center=true);
            translate([0,-l/2+3,0]) cube([12,1.8,h],center=true);
            
            translate([w/2-3,l/2-3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            translate([-w/2+3,l/2-3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            translate([w/2-3,-l/2+3,0]) cylinder(d=6,h=h,$fn=30,center=true);
            translate([-w/2+3,-l/2+3,0]) cylinder(d=6,h=h,$fn=30,center=true);
        }
        
        translate([0,l/2+4/2,2/2+lh/2]) cube([11,4,2],center=true);
        translate([0,l/2-4/2,2/2+lh/2+(h/2-(-h/2+5/2+4))]) cube([11,4,2.5],center=true);
        translate([0,-l/2+2.2/2,2/2+lh/2]) cube([10.5,2.2,2],center=true);
        
        translate([0,-l/2,3/2+3.5]) rotate([90,0,0]) cylinder(d=5,h=17,center=true);
        
        translate([w/2-3,l/2-3,lh/2]) cylinder(d=6.2,h=4,$fn=30);
        translate([-w/2+3,l/2-3,lh/2]) cylinder(d=6.2,h=4,$fn=30);
        translate([w/2-3,-l/2+3,lh/2]) cylinder(d=6.2,h=4,$fn=30);
        translate([-w/2+3,-l/2+3,lh/2]) cylinder(d=6.2,h=4,$fn=30);
        
        translate([w/2-3,l/2-3,-2]) cylinder(d=3.2,h=4,$fn=30);
        translate([-w/2+3,l/2-3,-2]) cylinder(d=3.2,h=4,$fn=30);
        translate([w/2-3,-l/2+3,-2]) cylinder(d=3.2,h=4,$fn=30);
        translate([-w/2+3,-l/2+3,-2]) cylinder(d=3.2,h=4,$fn=30);
        
        translate([w/2-3,l/2-3,-lh/2]) cylinder(d1=5, d2=3.2, h=1,$fn=30);
        translate([-w/2+3,l/2-3,-lh/2]) cylinder(d1=5, d2=3.2, h=1,$fn=30);
        translate([w/2-3,-l/2+3,-lh/2]) cylinder(d1=5, d2=3.2, h=1,$fn=30);
        translate([-w/2+3,-l/2+3,-lh/2]) cylinder(d1=5, d2=3.2, h=1,$fn=30);
        
        h_x = w/4;
        
        translate([-h_x,0]) longhole();
        translate([h_x,0]) longhole();
        
        translate([-h_x,5]) longhole();
        translate([h_x,5]) longhole();
        
        translate([-h_x,10]) longhole();
        translate([h_x,10]) longhole();

        translate([-h_x,15]) longhole();
        translate([h_x,15]) longhole();
       

        translate([-h_x,-5]) longhole();
        translate([h_x,-5]) longhole();
        
        translate([-h_x,-10]) longhole();
        translate([h_x,-10]) longhole();

        translate([-h_x,-15]) longhole();
        translate([h_x,-15]) longhole();
        
        translate([0,l/2+6,-lh/2]) rotate([45,0,0]) cube([20,5,5],center=true);
    }
}

base();
//lid();
//translate([40,0,0]) lid();
//translate([0,0,5.5]) rotate([0,180,0]) lid();

%translate([0,-0.3,2]) assembly();
