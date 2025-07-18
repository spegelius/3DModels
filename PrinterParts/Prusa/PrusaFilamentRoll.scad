
$fn=60;

slop = 0.15;

frame_width = 65.5;
filament_guide_rod_length = frame_width;
filament_guide_rod_dia = 10;
filament_guide_rod_hole_dia = filament_guide_rod_dia+2*slop;

arm_height=20.8;

module threads(d=8, multiple=10) {
    z_step = 1.8;
    for (i = [0:multiple-1]) {
        translate([0,0,i*z_step]) linear_extrude(height=z_step, center=true, convexity = 10, twist = -360, $fn = 30) translate([0.5, 0, 0]) circle(d=d-0.5);
    }
}

module _nut(d=8, d2=18, h=7, indents=20) {
    $fn=60;
    sphere_dia=d2+h/1.8;
    intersection() {
        difference() {
            cylinder(d=d2,h=h);
            threads(d=d+4*slop, multiple=h);
            for (i = [0:indents-1]) {
                rotate([0,20,i*360/indents]) translate([-2,d2/2+2,0]) rotate([0,0,45]) cube([4,4,35], center=true);
            }
        }
        translate([0,0,h-sphere_dia/3]) sphere(d=sphere_dia);
        translate([0,0,sphere_dia/3]) sphere(d=sphere_dia);
    }
}

module filament_guide_rod() {
    $fn=60;
    
    intersection() {
        union() {
            translate([0,0,filament_guide_rod_dia/2-0.5]) rotate([-90,0,0]) cylinder(d=filament_guide_rod_dia, h=filament_guide_rod_length);
            intersection() {
                translate([0,0,3]) rotate([-90,0,0]) cylinder(d=17,h=2); 
                translate([-13/2,-2,0]) cube([13,5,13]);
            }
            translate([0,filament_guide_rod_length,0]) intersection() {
                translate([0,0,filament_guide_rod_dia/2-0.5]) rotate([-90,0,0]) cylinder(d=filament_guide_rod_dia, h=8);
                translate([0,0,filament_guide_rod_dia/2-0.5]) rotate([-90,0,0]) threads(d=filament_guide_rod_dia,multiple=20);
            }
        }
        translate([-15,0,0]) cube([30,200,30]);
    }
}

module filament_guide_roller() {
    $fn=60;
    
    module cone(d1, d2, h) {
        hull() {
            translate([0,0,-h+0.01]) cylinder(d=d1,h=0.01);
            translate([0,0,-0.01]) cylinder(d=d2,h=0.01);;
        }
    }
    
    module body(d1, d2, h) {
        difference() {
            cylinder(d=d1,h=h);
            translate([0,0,h/2]) rotate_extrude(convexity=7) translate([h/1.4,0,0]) circle(d=h);
        }
    }

    difference() {
        intersection() {
            body(30, 15, 35);
            translate([0,0,-4.4]) sphere(d=80);
            translate([0,0,39.4]) sphere(d=80);
        }
        translate([0,0,-35]) cylinder(d=filament_guide_rod_hole_dia, h=70);
        hull() {
            translate([0,0,5]) cone(filament_guide_rod_dia, filament_guide_rod_dia+2, 2);
            translate([0,0,35-5]) mirror([0,0,1]) cone(filament_guide_rod_dia, filament_guide_rod_dia+2, 2);
        }
    }
}

module arm_indent() {
    rotate([0,90,0]) cylinder(d=25+3*slop, h=5);
    rotate([45,0,0]) translate([2.5,0,20]) cube([5,arm_height, 40], center=true);
    
}

module _frame() {
    
    
    
    difference() {
        cube([frame_width,65,35]);
        translate([15, 20, -1]) cube([35.5,37,37]);
        translate([-1, 41.7, 35/2]) rotate([0,90,0]) cylinder(d=filament_guide_rod_hole_dia, h=80);

        translate([-1, 15, 35/2]) rotate([0,90,0]) cylinder(d=16+2*slop, h=70);
        
        translate([-1, 15, 35/2]) arm_indent();
        translate([frame_width-4, 15, 35/2]) arm_indent();
        
        hull() {
            translate([frame_width/2-8,0,0]) rotate([0,0,45]) cube([20,20,72], center=true);
            translate([frame_width/2+8,0,0]) rotate([0,0,45]) cube([20,20,72], center=true);
        }
    }
    
}

module frame() {
    intersection() {
        _frame();
        hull() {
            translate([0,46,35/2]) rotate([0,90,0]) cylinder(d=40,h=80);
            cube([80,10,60]);
        }
    }
}

intersection() {
    //translate([35,31.7,35/2]) rotate([0,90,0]) filament_guide_roller();
    filament_guide_roller();
    //cube([50,50,50]);
}

translate([-25,0,0]) filament_guide_rod();
translate([0,40,0]) _nut(d=10, d2=20);

translate([20,0,0]) frame();

