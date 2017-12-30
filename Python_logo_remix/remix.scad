
use <../lib/includes.scad>;
use <../ColorBlend/ColorBlend.scad>;

module logo() {
    scale([0.6, 0.6, 0.6]) {
        import("../_downloaded/Python_Logo_Assembly/T-PythonBOTTOM-yellow.stl");
        import("../_downloaded/Python_Logo_Assembly/T-PythonTOP-blue.stl");
    }
}

module main() {

    difference() {
        union() {
            difference() {
                intersection() {
                    cube([70,55,100]);
                    translate([0,0,-2]) rounded_cube(70,55,98,20);
                }
                translate([-1,-20,0]) rotate([-20,0,0]) cube([72,20,50]);
                rotate([-20,0,0]) translate([-0.5,-35,20]) cube([71,50,100]);
                translate([0,53,20]) back_curve();
            }
            translate([5, 31,28]) rotate([20,0,0]) cylinder(d=8, h=10, $fn=60);
            translate([70-5, 31,28]) rotate([20,0,0]) cylinder(d=8, h=10, $fn=60);
            translate([2.4,10,5]) intersection() {
                slice(false);
                translate([0,-7,0]) rotate([-20,0,0]) cube([70,3,40]);
            }
        }

        translate([-9,44.1,95]) rotate([70,0,0]) scale([1,1,1.05]) logo();
        translate([2.4,10,5]) intersection() {
            slice(true);
            translate([0,-7,0]) rotate([-20,0,0]) cube([70,3,40]);
        }
    }
}

module back_curve() {
    hull() {
        rotate([0,90,0]) cylinder(d=30,h=70, $fn=70);
        translate([0,134.5,-10]) intersection() {
            rotate([0,90,0]) cylinder(d=300,h=75, $fn=200);
            translate([0,-160,20]) cube([70,60,80]);
        }
    }
}

module front_text() {
    translate([2.4,10,5]) intersection() {
        slice(true);
        translate([0,-7,0]) rotate([-20,0,0]) cube([70,3,40]);
    }
}

//back_curve();
//main();
front_text();
