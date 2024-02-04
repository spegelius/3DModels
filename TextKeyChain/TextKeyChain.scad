
use <../ColorBlend/ColorBlend.scad>;

////// VARIABLES //////
logo = "logo_bittium.png";


////// VIEW DEV //////
//view();
//bittium_logo3d();


////// VIEW PRINT //////

//rod();
bittium_keychain_text();

//part1();
//part2();


////// MODULES //////
//surface(file=logo, invert=true, convexity = 5);
module bittium_logo3d(h=10) {

    logo_scale = 0.11;

    module middle(h=1) {
        scale([1,1,h*10])
        translate([0,0,0.1])
        intersection() {
            scale([logo_scale,logo_scale,1])
            surface(file=logo, invert=true, convexity = 5);

            translate([0,0,-0.1])
            cube([140,30,0.1]);
        }
    }

    module end() {
        intersection() {
            scale([logo_scale,logo_scale,1])
            surface(file=logo, invert=true, convexity = 5);

            cube([140,30,0.5]);
        }
    }

    translate([0,0,0.4])
    union() {
        mirror([0,0,1])
        end();

        middle(h-0.8);

        translate([0,0,h-0.8])
        end();

        translate([12,9,h/2])
        rotate([-90,0,0])
        intersection() {
            cylinder(d=2.4,h=4,$fn=20);

            translate([2/2,0,4/2])
            cube([2,3,4],center=true);
        }

        translate([29,9,h/2])
        rotate([-90,0,0])
        intersection() {
            cylinder(d=2.4,h=4,$fn=20);

            translate([2/2,0,4/2])
            cube([2,3,4],center=true);
        }
    }
}

module bittium_keychain_text() {
    difference() {
        bittium_logo3d(12);
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
                translate([0,0,i*0.4+0.2])
                cube([82,depth,0.2]);
            } else {
                translate([0,0,i*0.4])
                cube([82,depth,0.2]);
            }
            
        }
    }
}

module rod() {
    
    dia = 7;
    length = 65;
    
    translate([-8, 7/2+1, 12/2])
    difference() {
        rotate([0,90,0]) {
            union() {
                hull() {
                    cylinder(d=dia-2,h=1, $fn=50);

                    translate([0,0,1.5])
                    cylinder(d=dia,h=3.5, $fn=50);
                }
                translate([0,0,5])
                cylinder(d=dia,h=length-5, $fn=50);

                translate([0,0,length])
                hull() {
                    cylinder(d=dia,h=1,$fn=50);

                    translate([0,0,5])
                    sphere(d=3,$fn=50);
                }
                translate([-3.5,0,4.5])
                rotate([0,90,0])
                cylinder(d=6, h=7, $fn=30);
            }
        }

        // hole for chain
        translate([4.5,0,-5])
        cylinder(d=3.5, h=10, $fn=30);
    }
}

module part1() {
    slice(even=true);
}

module part2() {
    slice(even=false);
}

module view() {
    color("white")
    rod();

    color("DeepSkyBlue")
    bittium_keychain_text();
}