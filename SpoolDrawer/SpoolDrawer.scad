//rotate([90,0,180]) import("Drawer_200_105_45.stl");

// space around drawer
slop = 0.3;

// hinge
hinge_d = 5.5;

use <../Dollo/NEW_long_ties/include.scad>;

module _drawer_form(outer_d, inner_d, height, wall) {
    corner_d = 2*wall + hinge_d;
    module _form(offset=0) {
        linear_extrude(height)
        offset(r=(corner_d-2*offset)/2,$fn=50)
        intersection() {
            difference() {
                circle(d=outer_d-corner_d,$fn=200);
                circle(d=inner_d+corner_d+slop,$fn=200);
            }
            translate([(corner_d-2*offset)/2+slop+offset,(corner_d-2*offset)/2+offset, offset])
            square([outer_d/2, outer_d/2]);
        }
        translate([offset+slop,outer_d/2-10,height-2])
        rotate([0,90,0])
          cylinder(d=6,h=wall,$fn=40);
    }
    
    corner_angle = asin((corner_d/2)/(outer_d/2-corner_d/2));
    echo(corner_angle);

    difference() {
        _form();
        difference() {
            translate([0,0,wall])
              _form(wall);
            rotate([0,0,corner_angle])
            translate([outer_d/2-corner_d/2,0])
              cylinder(d=corner_d,h=height,$fn=50);
        }
        rotate([0,0,corner_angle])
        translate([outer_d/2-corner_d/2,0]) {
            cylinder(d=hinge_d,h=height,$fn=50);
            translate([0,0,height/2])
            rotate([90,0,45])
              cylinder(d=2,h=20,center=true,$fn=30);
        }
    }
}

module _info_slot(outer_d, height) {
    wall = 1.5;
    corner = 2;
    slot = 57-corner;
    slot_2 = slot-1;
    slot_3 = slot_2-4;
    function h() = height < 35 ? height : 35;
    
    x_pos = slot/2/sin(atan(slot/2/(outer_d/2)));
    x_pos_2 = slot_2/2/sin(atan(slot_2/2/(outer_d/2)));
    x_pos_3 = slot_3/2/sin(atan(slot_3/2/(outer_d/2)));
    
    rotate([0,0,45]) difference() {
        linear_extrude(h()) offset(r=corner/2,$fn=20) intersection() {
            difference() {
                circle(d=outer_d+2*wall+corner/2,$fn=200);
                circle(d=outer_d,$fn=200);
            }
            hull() {
                circle(d=1,$fn=20);
                translate([x_pos,slot/2]) circle(d=1,$fn=20);
                translate([x_pos,-slot/2]) circle(d=1,$fn=20);
            }
        }
        translate([0,0,wall]) intersection() {
            difference() {
                cylinder(d=outer_d+2*wall,h=h(),$fn=200);
                cylinder(d=outer_d-4*wall,h=h(),$fn=200);
            }
            hull() {
                cylinder(d=1,h=h(),$fn=20);
                translate([x_pos_2,slot_2/2]) cylinder(d=1,h=h(),$fn=20);
                translate([x_pos_2,-slot_2/2]) cylinder(d=1,h=h(),$fn=20);
            }
        }
        translate([0,0,2*wall]) intersection() {
            difference() {
                cylinder(d=outer_d+6*wall,h=h(),$fn=200);
                cylinder(d=outer_d-4*wall,h=h(),$fn=200);
            }
            hull() {
                cylinder(d=1,h=h(),$fn=20);
                translate([x_pos_3,slot_3/2]) cylinder(d=1,h=h(),$fn=20);
                translate([x_pos_3,-slot_3/2]) cylinder(d=1,h=h(),$fn=20);
            }
        }
    }
}

module _handle(outer_d,wall) {
    h = 25;
    d = 35;
    translate([slop,outer_d/2,0]) union() {
        intersection() {
            translate([d/2,0,0]) difference() {
                cylinder(d=d,h=h,$fn=100);
                cylinder(d=d-wall*2,h=h,$fn=100);
            }
            cube([d/2,d/2,h]);
        }
        translate([0,-5,0]) cube([wall,5.01,h]);
        translate([d/2,d/2-wall/2,0]) cylinder(d=wall,h=h,$fn=20);
    }
}

module _lock_cutout(outer_d,height,wall) {
    w = wall + 1;
    h = 7;
    module _form() {
        hull() {
            cube([1,1,1]);
            translate([0,20-1,0]) cube([1,1,2]);
        }
    }
    
    module _slope_form() {
        hull() {
            _form();
            translate([wall,0,0]) scale([1,1,2]) _form();
        }
    }
    
    translate([slop+wall/2,outer_d/2-20-10+6/2,height-h]) union() {
        translate([-0.5/2,0]) mirror([1,0,0]) _slope_form();
        translate([0.5/2,0]) _slope_form();

        translate([-w/2,20,0]) cube([w,0.5,h]);
    }
}

//_drawer_form(200, 105, 46, 9);
//_info_slot(200, 36);
//_handle();
//_lock_cutout(200,46,1.5);

module drawer(outer_d, inner_d, height, wall) {
    difference() {
        union() {
            _drawer_form(outer_d, inner_d, height, wall);
            _info_slot(outer_d);
            _handle(outer_d, wall);
        }
        _lock_cutout(outer_d,height,wall);
    }
}

module bolt(height) {
    h = height + 5;
    
    // debug
//    translate([-10,(height+5)/2,-0.2])
//    rotate([90,0,0])
//    import("Bolt_45.stl");
    
    intersection() {
        translate([0,0,5/2-0.5])
        rotate([90,0,0])
        cylinder(d=5,h=h,center=true,$fn=50);
        
        translate([0,0,5/2])
        difference() {
            cube([10,h,5],center=true);
            cylinder(d=1.9,h=10,center=true,$fn=30);
        }
    }
}

min_center_d = 45;
stand_screw_d = min_center_d - 10;

module stand_bottom() {
    difference() {
        union() {
            cylinder(d=200,h=4,$fn=100);
            cylinder(d=min_center_d,h=50,$fn=50);
            for(i=[0:7]) {
                rotate([0,0,360/8*i])
                hull() {
                    translate([0,-2/2,0])
                    cube([1,2,30]);
                    translate([200/2-1,-2/2,0])
                    cube([1,2,5]);
                }
            }
        }
        v_screw(h=51,
                screw_d=stand_screw_d,
                pitch=4,
                direction=0,
                steps=100);
    }
}

//drawer(200, 105, 45, 1.5);
//bolt(45);
stand_bottom();
