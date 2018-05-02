use <../Bearings/bearing2.scad>;

slop = 0.15;

washer = 2;

nozzle = 0.45;

// frame
depth = 7;

module threads(d=8, multiple=10) {
    z_step = 1.8;
    for (i = [0:multiple-1]) {
        translate([0,0,i*z_step]) linear_extrude(height=z_step, center=true, convexity = 10, twist = -360, $fn = 30) translate([0.5, 0, 0]) circle(d=d-0.5);
    }
}

module axle() {
    length = depth+9.6+washer-1;
    cube([7-2*slop, length, 7-2*slop]);
    intersection() {
        translate([(7-2*slop)/2,0,(7-2*slop)/2]) rotate([90,0,0]) threads(multiple=8);
        translate([0,-20,0]) cube([7-2*slop, 20, 7-slop]);
    }
    intersection() {
        translate([(7-2*slop)/2,length,0]) rotate([-90,0,0]) cylinder(d=20,h=2); 
        translate([-6+(7-2*slop)/2,length,0]) cube([12,5,12]);
    }
}

module washer() {
    $fn=90;
    difference() {
        hull() {
            cylinder(d=16, h=0.4);
            cylinder(d=12, h=washer);
        }
        cube([7,7,5],center=true);
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

module nut() {
    _nut(d=8, d2=18, h=8);
}

module big_nut() {
    _nut(d=11, d2=22, h=8, indents=25);
}

module foot() {
    
    module knob() {
        hull () {
            cylinder(d=40,h=2);
            translate([0,0,8]) cylinder(d=30,h=1);
        }
    }
    
    module tooth() {
        intersection() {
            knob();
            translate([0,(depth+slop)/2,7+slop]) rotate([45,0,0]) cube([41,2,2],center=true);
        }
    }
    difference() {
        knob(); 
        translate([0,0,8]) cube([40,depth+slop,6],center=true);
    }
    tooth();
    mirror([0,1,0]) tooth();
}

module foot_dampener() {
    $fn=60;
    difference() {
        cylinder(d=38+4*nozzle,h=2);
        cylinder(d=31,h=3);
    }
    translate([0,0,2]) difference() {
        cylinder(d=38+4*nozzle,h=2.5);
        cylinder(d=38,h=6);

    }
    
}

module frame(with_knob=true) {
    
    module hole() {
        for (i = [0:3]) {
            translate([i*13,i*3+11,0]) cube([7,17,16],center=true);
        }
        translate([30,-6,0]) cube([7,7,16],center=true);
        translate([15,-6,0]) cube([7,7,16],center=true);
        translate([0,-6,0]) cube([7,7,16],center=true);
    }
    
    $fn=90;
    difference() {
        union() {
            hull() {
                translate([-65,25,0]) cylinder(d=20,h=depth);
                translate([65,25,0]) cylinder(d=20,h=depth);
                translate([-55,0,0]) cylinder(d=20,h=depth);
                translate([55,0,0]) cylinder(d=20,h=depth);
            }
            if (with_knob) {
                translate([0,5,depth]) cylinder(d=15.7,h=1);
                translate([0,5,depth+5.8]) inner();
            }
        }

        translate([27,10,0]) hole();
        mirror([1,0,0]) translate([27,10,0]) hole();
        translate([0,145,0]) cylinder(d=250,h=depth+1);
        
        // feet indents
        translate([-42,-8,depth]) rotate([45,0,0]) cube([45,2,2],center=true);
        translate([-42,-8,0]) rotate([45,0,0]) cube([45,2,2],center=true);
        translate([42,-8,depth]) rotate([45,0,0]) cube([45,2,2],center=true);
        translate([42,-8,0]) rotate([45,0,0]) cube([45,2,2],center=true);

        translate([0,5,0]) cube([10,10,42], center=true);
    }
    //%translate([-40,-13,2.5]) rotate([-90,0,0]) foot();
}


module shaft(width=10, length=160, long_threads=true, double_ends=false) {
    
    module end(mirror=false) {
        // plate
        intersection() {
            translate([side/2,-2,0]) rotate([-90,0,0]) cylinder(d=width*2.5,h=2); 
            translate([-(width+5)/2+side/2,-2,0]) cube([width+5,5,15]);
        }
        // end threads
        intersection() {
            cube([side, 14, side]);
            translate([side/2,0,side/2]) rotate([-90,0,0]) threads(d=width+1,multiple=20);
        }
    }
    
    side = width-2*slop;
    // long shaft
    intersection() {
        if (double_ends) {
            translate([0,14,0]) cube([side, 160-2*14, side]);
        } else {
            cube([side, 160-14, side]);
        }
        if (long_threads && ! double_ends) {
            translate([side/2,0,side/2]) rotate([-90,0,0]) threads(d=width+1,multiple=50);
        }
    }
    translate([0,160-14,0]) end();
    if (double_ends) {
        translate([width-2*slop, 14,0]) rotate([0,0,180]) end();
    }
}

module shaft2(length=160, width=10, length=160) {
    
    module end(mirror=false) {

        // end threads
        intersection() {
            translate([1,0,0]) cube([side-2, 14, side-2]);
            translate([side/2,0,(side-2)/2]) rotate([-90,0,0]) threads(d=width-1,multiple=20);
        }
    }
    
    side = width-2*slop;
    // long shaft
    intersection() {
        if (double_ends) {
            translate([0,14,0]) cube([side, length-2*14, side]);
        } else {
            cube([side, length-14, side]);
        }
    }
    translate([0,length-14,0]) end();
    if (double_ends) {
        translate([width-2*slop, 14,0]) rotate([0,0,180]) end();
    }
}

module frame_nut() {
    difference() {
        _nut(d=11, d2=36, h=16.6, indents=49);
        translate([0,0,7]) cylinder(d=30,h=17,$fn=100);
    }
    
    intersection() {
        translate([0,0,7+4.8]) difference() {
            outer(nozzle);
            translate([0,0,-4.8]) for(i=[0:5]) {
                rotate([0,0,i*(360/6)]) for (j = [0:5]) {
                    translate([-5.3+j*2,10,0]) cube([1,19,1], center=true);
                }

            }
        }
        cylinder(d=32, h=45);
    }
}

module tire() {
    $fn=60;
    difference() {
        cylinder(d=34+4*nozzle, h=7);
        cylinder(d=34, h=8);
    }
}

filament_guide_rod_dia = 8;
filament_guide_rod_hole_dia = filament_guide_rod_dia +3*slop;

module filament_quide() {
    $fn=60;
    difference() {
        //cube([12, 50, 2]);
        hull() {
            cylinder(d=14,h=3);
            translate([0,55,0]) cylinder(d=14,h=2);
        }
        translate([0,2,0]) rotate([0,0,10]) cube([7,7,16],center=true);
        translate([0,55,0]) cylinder(d=filament_guide_rod_hole_dia,h=3);
    }
}

module filament_guide_rod() {
    $fn=60;
    
    intersection() {
        union() {
            translate([0,0,filament_guide_rod_dia/2-0.5]) rotate([-90,0,0]) cylinder(d=filament_guide_rod_dia, h=136);
            intersection() {
                translate([0,80+54,0]) rotate([-90,0,0]) cylinder(d=17,h=2); 
                translate([-13/2,80+54,0]) cube([13,5,13]);
            }
            translate([0,136,0]) intersection() {
                translate([0,0,filament_guide_rod_dia/2-0.5]) rotate([-90,0,0]) cylinder(d=filament_guide_rod_dia, h=8);
                translate([0,0,filament_guide_rod_dia/2-0.5]) rotate([-90,0,0]) threads(d=filament_guide_rod_dia,multiple=20);
            }
        }
        translate([-15,0,0]) cube([30,200,30]);
    }
}

module filament_guide_nut() {
    _nut(d=filament_guide_rod_dia, d2=filament_guide_rod_dia+6, h=6, indents=25);
}


module filament_guide_roller() {
    $fn=60;
    module cone(d1, d2, h) {
        hull() {
            translate([0,0,-h+0.01]) cylinder(d=d1,h=0.01);
            translate([0,0,-0.01]) cylinder(d=d2,h=0.01);;
        }
    }

    translate([0,0,15]) difference() {
        union() {
            cone(30, 15, 15);
            mirror([0,0,1]) cone(30, 15, 15);
        }
        translate([0,0,-35]) cylinder(d=filament_guide_rod_hole_dia, h=70);
        hull() {
            translate([0,0,-11]) cone(filament_guide_rod_dia, filament_guide_rod_dia+2, 2);
            translate([0,0,11]) mirror([0,0,1]) cone(filament_guide_rod_dia, filament_guide_rod_dia+2, 2);
        }
    }
}

module axles(){
    translate([-21,0,0]) axle();
    translate([-7,0,0]) axle();
    translate([7,0,0]) axle();
    translate([21,0,0]) axle();
}

module nuts() {
    translate([-30,0,0]) nut();
    translate([-10,0,0]) nut();
    translate([10,0,0]) nut();
    translate([30,0,0]) nut();
}

module washers() {
    translate([-30,0,0])washer();
    translate([-10,0,0])washer();
    translate([10,0,0])washer();
    translate([30,0,0])washer();
}

module frame_parts() {
    translate([0,-20,0]) frame(false);
    translate([0,27,0]) frame(true);
}

module feet() {
    translate([0,65,0]) foot();
    translate([0,22,0]) foot();
    translate([0,-21,0]) foot();
    translate([0,-64,0]) foot();
}

module holder_parts_all() {
    translate([21,-20,0]) axles();
    
    translate([-30,-45,0]) nuts();

    translate([-30,-65,0]) washers();
    
    translate([0,40,0]) frame_parts();

    translate([-89,-70,0]) shaft();
    translate([-60,-15,0]) big_nut();
    translate([-25,-15,0]) frame_nut();
    
    translate([-115,15,0]) feet();
}

module drill_axle() {
    
    translate([0,0,(7-2*slop)/2]) rotate([-90,0,0]) {
        cylinder(d=7.75, h=30, $fn=6);
        translate([0,0,40]) cube([7-2*slop, 7-2*slop, 20], center=true);
    }
    
}

//holder_parts_all();
//foot();
//frame_nut();
//shaft();
//big_nut();
//frame_parts();
//washer();
//nut();
//axle();
//shaft(width=7, long_threads=false);
//shaft(width=7, double_ends=true);
//shaft2(length=174, width=9, double_ends=true);
//shaft2(length=160, width=9, double_ends=true);

frame(with_knob=false);
//%translate([20, -25, 0]) rotate([0,0,90]) frame();

//tire();
//foot_dampener();
//translate([0,-7,0]) filament_quide();
//translate([0,67,0]) filament_quide();
//translate([20,0,0]) filament_guide_rod();
//translate([40,0,0]) filament_guide_nut();
