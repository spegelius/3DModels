
use <../ColorBlend/ColorBlend.scad>;

logo = "logo_bittium.png";

//surface(file=logo, invert=true, convexity = 5);
module logo3d() {
    difference() {
        scale([1,15,1]) translate([0,-4,0]) rotate([90,0,0]) intersection() {
            scale([0.10,0.10,2]) surface(file=logo, invert=true, convexity = 5);
            translate([0,0,-5]) cube([140,30,1]);
        }
        rod();
    }
}

module slice(even=false) {
    slices = 16/0.2/2;
    depth=20;
    difference() {
        logo3d();
        for (i=[0:slices]) {
            if (even) {
                translate([0,0,i*0.4+0.2]) cube([82,depth,0.2]);
            } else {
                translate([0,0,i*0.4]) cube([82,depth,0.2]);
            }
            
        }
    }
}

module rod() {
    
    dia = 7;
    
    translate([-8, 15/2, 4.5]) difference() {
        rotate([0,90,0]) {
            union() {
                hull() {
                    cylinder(d=dia-2,h=1, $fn=50);
                    translate([0,0,1.5]) cylinder(d=dia,h=3.5, $fn=50);
                }
                translate([0,0,5]) cylinder(d=dia,h=55, $fn=50);
                translate([0,0,60])  hull() {
                    cylinder(d=dia,h=1,$fn=50);
                    translate([0,0,5]) sphere(d=3,$fn=50);
                }
                translate([-3.5,0,4.5]) rotate([0,90,0]) cylinder(d=6, h=7, $fn=30);
            }
        }
        translate([4.5,0,-5]) cylinder(d=3.5, h=10, $fn=30);
    }
    
}

module part1() {
    slice(even=true);
}

module part2() {
    slice(even=false);
}
//logo3d();

//rod();

//part1();
part2();
