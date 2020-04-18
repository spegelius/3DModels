include <../Dollo/NEW_long_ties/include.scad>;


module medialepy_panel() {
    
    difference() {
        union() {
            rounded_cube_side(62,62,4,4,center=true);
            translate([0,0,2]) rounded_cube_side(43,58,8,4,center=true);
            hull() {
                translate([-3,0,20]) rotate([90,0,0]) cylinder(d=2,h=56,center=true,$fn=10);
                translate([-3,0,2]) cube([36,56,1],center=true);
            }
            translate([15.5,-10,6]) cube([6,20,4]);
        }
        translate([-55/2,40/2+3,-4/2-0.1]) {
            cylinder(d=3.5,h=9,$fn=20);
            cylinder(d1=5.6,d2=3.5,h=1.1,$fn=30);
        }
        translate([-55/2,-40/2+3,-4/2-0.1]) {
            cylinder(d=3.5,h=9,$fn=20);
            cylinder(d1=5.6,d2=3.5,h=1.1,$fn=30);
        }
        translate([55/2,40/2+3,-4/2-0.1]) {
            cylinder(d=3.5,h=9,$fn=20);
            cylinder(d1=5.6,d2=3.5,h=1.1,$fn=30);
        }
        translate([55/2,-40/2+3,-4/2-0.1]) {
            cylinder(d=3.5,h=9,$fn=20);
            cylinder(d1=5.6,d2=3.5,h=1.1,$fn=30);
        }
        
        translate([-5,0,-2]) rotate([0,45,0]) cube([24,54,24],center=true);
        
        translate([7,25,11]) rotate([0,45,0]) cylinder(d=2.8,h=11,center=true,$fn=20);
        translate([7,15,11]) rotate([0,45,0]) cylinder(d=10.5,h=12,center=true,$fn=20);
        translate([7,5,11]) rotate([0,45,0]) cylinder(d=2.8,h=11,center=true,$fn=20);
        
        translate([7,-2,11]) rotate([0,45,0]) cylinder(d=5.1,h=12,center=true,$fn=20);
        translate([7,-10,11]) rotate([0,45,0]) cylinder(d=5.1,h=12,center=true,$fn=20);
        
        translate([18.5,-7,6]) cylinder(d=2.8,h=10,$fn=20);
        translate([18.5,7,6]) cylinder(d=2.8,h=10,$fn=20);
        translate([15,0,13]) rotate([0,90,0]) cylinder(d=10,h=10,$fn=40);
    }
}

module medialepy_panel_wire_clamp() {
    difference() {
        cube([6,20,5]);
        translate([3,3,0]) cylinder(d=3.2,h=10,center=true,$fn=20);
        translate([3,20-3,0]) cylinder(d=3.2,h=10,center=true,$fn=20);
    }
}


module _medialepy_radiator_fan_shroud_base() {
    
    module attach_hole() {
        cylinder(d1=5.5,d2=3.2,h=1.2,$fn=20);
        cylinder(d=3.2,h=h+1,$fn=20);
    }
    
    h = 6;
    clip_h = 13;
    difference() {
        union() {
            difference() {
                rounded_cube_side(390,194,h,25,center=true);
                rounded_cube_side(370,174,h+1,15,center=true);
            }
            translate([-390/2+56,194/2-clip_h/2-1,0]) rounded_cube_side(30,clip_h,h,3,center=true);
            translate([390/2-110,194/2-clip_h/2-1,0]) rounded_cube_side(30,clip_h,h,3,center=true);
            translate([-390/2+58,-194/2+clip_h/2+1,0]) rounded_cube_side(30,clip_h,h,3,center=true);
            translate([390/2-106,-194/2+clip_h/2+1,0]) rounded_cube_side(30,clip_h,h,3,center=true);
            
            translate([0,194/2-clip_h/2-1,0]) rounded_cube_side(15,clip_h,h,3,center=true);
            translate([0,-194/2+clip_h/2+1,0]) rounded_cube_side(15,clip_h,h,3,center=true);
        }
        translate([-390/2+56,194/2-8,h-1]) {
            cube([30,14,h],center=true);
            cube([15,14,h*4],center=true);
            translate([-23.5/2,2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
            translate([23.5/2,2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
        }
        translate([390/2-110,194/2-8,h-1]) {
            cube([30,14,h],center=true);
            cube([15,14,h*4],center=true);
            translate([-23.5/2,2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
            translate([23.5/2,2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
        }
        translate([-390/2+58,-194/2+10,h-1]) {
            cube([30,14,h],center=true);
            cube([15,14,h*4],center=true);
            translate([-23.5/2,-2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
            translate([23.5/2,-2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
        }
        translate([390/2-106,-194/2+10,h-1]) {
            cube([30,14,h],center=true);
            cube([15,14,h*4],center=true);
            translate([-23.5/2,-2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
            translate([23.5/2,-2.5,-2*h]) cylinder(d=2.8,h=2*h,$fn=20);
        }
        

        
        translate([390/2-8,194/2-8,-h/2]) attach_hole();
        
        translate([390/2-8,-194/2+8,-h/2]) attach_hole();

        translate([-390/2+8,194/2-8,-h/2]) attach_hole();

        translate([-390/2+8,-194/2+8,-h/2]) attach_hole();

        translate([-390/2+5,0,-h/2]) attach_hole();
        translate([390/2-5,0,-h/2]) attach_hole();
        
        translate([-60,194/2-5,-h/2]) attach_hole();
        translate([60,194/2-5,-h/2]) attach_hole();
        
        translate([-60,-194/2+5,-h/2]) attach_hole();
        translate([60,-194/2+5,-h/2]) attach_hole();

    }
}

fin_d = 20;
fin_h = 20;

module _fin_base(length) {
    fin_offset_y = (length-fin_d)/2;
    translate([0,0,-3]) rotate([0,-45,0]) difference() {
    hull() {
        translate([0,fin_offset_y,0]) cylinder(d=fin_d,h=fin_h,center=true,$fn=50);
        translate([0,-fin_offset_y,0]) cylinder(d=fin_d,h=fin_h,center=true,$fn=50);
    }
    hull() {
        translate([0,fin_offset_y,0]) cylinder(d=fin_d-2,h=fin_h+1,center=true,$fn=50);
        translate([0,-fin_offset_y,0]) cylinder(d=fin_d-2,h=fin_h+1,center=true,$fn=50);
    }
    }
}

fins_l = 168;

module _medialepy_radiator_fan_shroud() {
    
    
    module fin(length) {
        intersection() {
            _fin_base(length);
            translate([0,0,20/2]) cube([100,length,20],center=true);
        }
    }
    
    corner = 20;
    h = 5;
    
    difference() {
        union() {
            translate([0,0,-corner/2+h]) intersection() {
                difference() {
                    rounded_cube(400,199,corner,corner,center=true);
                    cube([350,160,corner+5],center=true);
                }
                translate([0,0,h/2+corner/2-h]) cube([410,200,h],center=true);
            }
            offset_x = -350/2;
            step_x = 12;
            steps = 350/step_x;
            for (i=[0:steps]) {
                translate([offset_x+i*step_x,0,0]) fin(fins_l);
            }
        }
        translate([-390/2+56,194/2-8,-1]) {
            translate([-23.5/2,2.5,0]) cylinder(d=6,h=2.5,$fn=20);
            translate([23.5/2,2.5,0]) cylinder(d=6,h=2.5,$fn=20);
        }
        translate([390/2-110,194/2-8,-1]) {
            translate([-23.5/2,2.5,0]) cylinder(d=6,h=2.5,$fn=20);
            translate([23.5/2,2.5,0]) cylinder(d=6,h=2.5,$fn=20);
        }
        translate([-390/2+58,-194/2+10,-1]) {
            translate([-23.5/2,-2.5,0]) cylinder(d=6,h=2.5,$fn=20);
            translate([23.5/2,-2.5,0]) cylinder(d=6,h=2.5,$fn=20);
        }
        translate([390/2-106,-194/2+10,-1]) {
            translate([-23.5/2,-2.5,0]) cylinder(d=6,h=2.5,$fn=20);
            translate([23.5/2,-2.5,0]) cylinder(d=6,h=2.5,$fn=20);
        }
        
        translate([390/2-8,194/2-8,-1]) cylinder(d=2.8,h=5,$fn=20);
        
        translate([390/2-8,-194/2+8,-1]) cylinder(d=2.8,h=5,$fn=20);

        translate([-390/2+8,194/2-8,-1]) cylinder(d=2.8,h=5,$fn=20);

        translate([-390/2+8,-194/2+8,-1]) cylinder(d=2.8,h=5,$fn=20);

        translate([-390/2+5,0,-1]) cylinder(d=2.8,h=5,$fn=20);
        translate([390/2-5,0,-1]) cylinder(d=2.8,h=5,$fn=20);
        
        translate([-60,194/2-5,-1]) cylinder(d=2.8,h=5,$fn=20);
        translate([60,194/2-5,-1]) cylinder(d=2.8,h=5,$fn=20);
        
        translate([-60,-194/2+5,-1]) cylinder(d=2.8,h=5,$fn=20);
        translate([60,-194/2+5,-1]) cylinder(d=2.8,h=5,$fn=20);
    }
}

module medialepy_radiator_fan_shroud_left() {
    difference() {
        intersection() {
            _medialepy_radiator_fan_shroud();
            union() {
                translate([-200/2-2,0,0]) cube([200,200,40],center=true);
                translate([-7,0,0]) hull() _fin_base(fins_l);
            }
        }
        translate([-2,194/2-9,0]) rotate([0,0,90]) male_dovetail(4);
        translate([-2,-194/2+9,0]) rotate([0,0,90]) male_dovetail(4);
    }
}

module medialepy_radiator_fan_shroud_right() {
    union() {
        intersection() {
            _medialepy_radiator_fan_shroud();
            difference() {
                translate([200/2-2,0,0]) cube([200,200,40],center=true);
                translate([-6.8,0,0]) hull() _fin_base(fins_l);
            }
        }
        translate([-2,194/2-9,0]) rotate([0,0,90]) scale([0.98,1,1]) male_dovetail(3.7);
        translate([-2,-194/2+9,0]) rotate([0,0,90]) scale([0.98,1,1]) male_dovetail(3.7);
    }
}

module medialepy_radiator_fan_shroud_base_left() {
    union() {
        intersection() {
            _medialepy_radiator_fan_shroud_base();
           translate([-200/2,0,0]) cube([200,200,40],center=true);
        }
        translate([0,194/2-7,-3]) rotate([0,0,-90]) scale([0.97,1,1]) male_dovetail(4.7);
        translate([0,-194/2+7,-3]) rotate([0,0,-90]) scale([0.97,1,1]) male_dovetail(4.7);
    }
}

module medialepy_radiator_fan_shroud_base_right() {
    difference() {
        intersection() {
            _medialepy_radiator_fan_shroud_base();
           translate([200/2,0,0]) cube([200,200,40],center=true);
        }
        translate([0,194/2-7,-3]) rotate([0,0,-90]) male_dovetail(5);
        translate([0,-194/2+7,-3]) rotate([0,0,-90]) male_dovetail(5);
    }
}

module medialepy_power_knob() {
    difference() {
        cylinder(d1=12,d2=10,h=10.5,$fn=40);
        cube([3.7,3.7,18],center=true);
        translate([0,0,10.5+40/2-1]) sphere(d=40,$fn=200);
    }
}

module debug() {
    translate([0,0,5]) {
        //_medialepy_radiator_fan_shroud();
        medialepy_radiator_fan_shroud_left();
        medialepy_radiator_fan_shroud_right();
    }
    //_medialepy_radiator_fan_shroud_base();
    //medialepy_radiator_fan_shroud_base_left();
    //medialepy_radiator_fan_shroud_base_right();
}

//debug();

//medialepy_panel();
//medialepy_panel_wire_clamp();

//medialepy_radiator_fan_shroud_base();
//medialepy_radiator_fan_shroud();

//medialepy_radiator_fan_shroud_base_left();
//medialepy_radiator_fan_shroud_base_right();

//medialepy_radiator_fan_shroud_left();
medialepy_radiator_fan_shroud_right();

//medialepy_power_knob();
