
width = 30;
length = 120;
leg = 18;
leg_h = 17;
body_h = 8;
bolt_dia = 5.5;
bolt_head_dia = 9;
bolt_distance = 49;

$fn = 50;

module body() {
    module head() {
        
        head_l = length/2-30;
        
        hull() {
            hull() {
                translate([3/2,1/2,body_h/2]) cube([width,1,body_h], center=true);
                translate([3/2,head_l,0]) cylinder(d=width,h=body_h);
                translate([0,length/2-13/2,0]) cylinder(d=10,h=body_h-2);
            }
            hull() {
                translate([3/2,1/2,(body_h-3)/2+3/2]) cube([width+3,1,body_h-3], center=true);
                translate([3/2,head_l,3/2]) cylinder(d=width+3,h=body_h-3);
                translate([0,length/2-13/2,3/2]) cylinder(d=13,h=body_h-5);
            }
        }
    }
    
    union() {
        head();
        mirror([0,1,0]) head();
    }
}

module hook() {
    
    module notch() {
        _min = 3.5;
        _max = 5;
        
        _scale = 4/6;
        
        pos_x = 13;
        pos_y = 11;
        
        
        union() {
            hull() {
                cylinder(d1=_max,d2=_min,h=2);
                translate([pos_x,pos_y,0]) cylinder(d1=_max+2,d2=_min+2,h=2);
            }
            translate([0,0,2]) hull() {
                cylinder(d=_min,h=body_h-4);
                translate([pos_x,pos_y,0]) cylinder(d=_min+2,h=body_h-4);
            }
            translate([0,0,body_h-2]) hull() {
                cylinder(d1=_min,d2=_max,h=2);
                translate([pos_x,pos_y,0]) cylinder(d1=_min+2,d2=_max+2,h=2);
            }
            translate([pos_x-3,2.2,0]) difference() {
                translate([-1.2,0,0]) cube([5,5,body_h]);
                cylinder(d1=_min,d2=_max,h=2);
                translate([0,0,2]) cylinder(d=_max,h=body_h-4);
                translate([0,0,body_h-2]) cylinder(d1=_max,d2=_min,h=2);
            }
        }
    }

    difference() {
        union() {
            body();
            translate([0,bolt_distance/2,0]) cylinder(d=leg, h=body_h+leg_h);
            translate([0,-bolt_distance/2,0]) cylinder(d=leg, h=body_h+leg_h);
        }
        translate([0,bolt_distance/2,0]) cylinder(d=bolt_head_dia, h=2.4);
        translate([0,-bolt_distance/2,0]) cylinder(d=bolt_head_dia, h=2.4);
        
        translate([0,bolt_distance/2,2.7]) cylinder(d=bolt_dia, h=body_h+leg_h);
        translate([0,-bolt_distance/2,2.7]) cylinder(d=bolt_dia, h=body_h+leg_h);
        
        translate([0,bolt_distance/2,body_h+leg_h-6]) cylinder(d=12.5, h=body_h+leg_h);
        translate([0,-bolt_distance/2,body_h+leg_h-6]) cylinder(d=12.5, h=body_h+leg_h);

        translate([7,10,0]) notch();
        translate([7,-10,0]) notch();
    }
}

module pole_clip() {
    difference() {
        intersection() {
            union() {
                rotate([90,0,0]) cylinder(d=12,h=4);
                rotate([-90,0,0]) cylinder(d=10,h=2);
                translate([0,2,0]) rotate([-90,0,0]) cylinder(d=11,h=5);
            }
            cube([13,20,9.5],center=true);
        }
        translate([0,8,0]) cube([2,20,20],center=true);
        rotate([90,0,0]) cylinder(d=5,h=5);
        rotate([-90,0,0]) hull() {
            cylinder(d=4.5, h=1);
            translate([0,0,10]) scale([1,1.2,1]) cylinder(d=3.6,h=1);
        }
    }
}

module test_notch() {
    intersection() {
        hook();
        cube([30,30,body_h]);
    }
}

//test_notch();
//hook();
pole_clip();
