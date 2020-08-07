use <../Dollo/NEW_long_ties/include.scad>;

////// VARIABLES //////
// space around drawer
slop = 0.3;

// hinge
hinge_d = 5.5;
function corner_d(wall) = 2*wall + hinge_d;

////// VIEW //////
//debug_drawer();
//debug_jig();
//debug_bolt();

//drawer(200, 105, 45, 1.5);
//drawer(200, 105, 44.4, 1.5);

//drawer(199, 105, 58, 1.5);
//drawer(199, 105, 58/2, 1.5);
//drawer(199, 105, 58/2, 1.5, bottom_lock=true);

//drawer(160.5, 90.2, 38.6, 1.2);

//bolt(45);
//bolt(58);
//bolt(38.6);

//stand_bottom();
//lock_clip(200,45,1.5);

drill_jig();
//jig_drill_hole(200, 1.5);
//jig_drill_hole(199, 1.5);
//jig_drill_hole(160.5, 1.2);
//drill_jig_core(52.5);

////// MODULES //////
module _drawer_form(outer_d, inner_d, height, wall) {

    module _form(_offset=0) {
        linear_extrude(height)
        offset(r=(corner_d(wall)-2*_offset)/2,$fn=50)
        intersection() {
            difference() {
                circle(d=outer_d-corner_d(wall),$fn=200);
                circle(d=inner_d+corner_d(wall)+slop,$fn=200);
            }
            translate([(corner_d(wall)-2*_offset)/2+slop+_offset,
                       (corner_d(wall)-2*_offset)/2+_offset,
                       _offset])
            square([outer_d/2, outer_d/2]);
        }
    }
    
    corner_angle = asin((corner_d(wall)/2)/(outer_d/2-corner_d(wall)/2));
    echo(corner_angle);

    difference() {
        _form();
        difference() {
            translate([0,0,wall])
            _form(wall);

            rotate([0,0,corner_angle])
            translate([outer_d/2-corner_d(wall)/2,0])
            cylinder(d=corner_d(wall),h=height,$fn=50);
        }
        rotate([0,0,corner_angle])
        translate([outer_d/2-corner_d(wall)/2,0]) {
            cylinder(d=hinge_d,h=height*3,center=true,$fn=50);

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
    
    rotate([0,0,45])
    difference() {
        linear_extrude(h())
        offset(r=corner/2,$fn=20)
        intersection() {
            difference() {
                circle(d=outer_d+2*wall+corner/2,$fn=200);
                circle(d=outer_d,$fn=200);
            }
            hull() {
                circle(d=1,$fn=20);

                translate([x_pos,slot/2])
                circle(d=1,$fn=20);

                translate([x_pos,-slot/2])
                circle(d=1,$fn=20);
            }
        }
        translate([0,0,wall])
        intersection() {
            difference() {
                cylinder(d=outer_d+2*wall,h=h(),$fn=200);
                cylinder(d=outer_d-4*wall,h=h(),$fn=200);
            }
            hull() {
                cylinder(d=1,h=h(),$fn=20);

                translate([x_pos_2,slot_2/2])
                cylinder(d=1,h=h(),$fn=20);

                translate([x_pos_2,-slot_2/2])
                cylinder(d=1,h=h(),$fn=20);
            }
        }
        translate([0,0,2*wall])
        intersection() {
            difference() {
                cylinder(d=outer_d+6*wall,h=h(),$fn=200);
                cylinder(d=outer_d-4*wall,h=h(),$fn=200);
            }
            hull() {
                cylinder(d=1,h=h(),$fn=20);

                translate([x_pos_3,slot_3/2])
                cylinder(d=1,h=h(),$fn=20);

                translate([x_pos_3,-slot_3/2])
                cylinder(d=1,h=h(),$fn=20);
            }
        }
    }
}

//!_info_slot(200, 40);

module _handle(outer_d, height, wall) {
    function h() = height < 33 ? height - 8 : 25;
    d = 35;
    translate([slop,outer_d/2,0])
    union() {
        intersection() {
            translate([d/2,0,0])
            difference() {
                cylinder(d=d,h=h(),$fn=100);
                cylinder(d=d-wall*2,h=h()*3,center=true,$fn=100);
            }
            cube([d/2,d/2,h()]);
        }
        translate([0,-5,0])
        cube([wall,5.01,h()]);

        translate([d/2,d/2-wall/2,0])
        cylinder(d=wall,h=h(),$fn=20);
    }
}

module _lock_handle(outer_d,height,wall) {
    translate([slop+4/2,outer_d/2-12/2,height-7/2])
    difference() {
        hull() {
            translate([0,15/2-8/2,1/2+7/2-1])
            cube([4,15,1],center=true);

            cube([4,8,7],center=true);
        }
        translate([10/2-2+wall,0,0])
        chamfered_cube(10,18,20,3,center=true);
    }
}

module _lock_cutout(outer_d,height,wall) {
    w = wall + 1;
    h = 7;

    module _slope_form() {
        translate([-(1.5*wall)/2,0,0])
        intersection() {
            hull() {
                rotate([0,45,0])
                cube([wall,wall,wall],center=true);

                translate([0,26-1/2,1])
                rotate([0,45,0])
                cube([2*wall,1,2*wall],center=true);
            }
            translate([0,26/2,0])
            cube([1.5*wall,26,6],center=true);
        }
    }
    
    translate([slop,outer_d/2,height-h])
    union() {

        translate([wall-0.5,-24])
        _slope_form();

        translate([wall,-5,0.01])
        cube([0.5,5,h]);
    }
}

module _lock_nub(outer_d, height) {
    translate([slop+2.5/2,outer_d/2-10,height-4.5])
    intersection() {
        hull() {
            cylinder(d=.5,h=1,$fn=10);

            translate([0,0,6-2])
            cylinder(d=5,h=0.1,$fn=30);

            translate([0,0,6-0.1])
            intersection() {
                cylinder(d=5,h=3,$fn=30);

                translate([0,5/2,0])
                cube([5,5,1],center=true);
            }
        }

        translate([0,0,6/2])
        cube([2.5,5,6],center=true);
    }
}

module _bottom_lock_added(outer_d, wall) {
    translate([slop+2.5/2,outer_d/2-10,0])
    intersection() {
        cylinder(d1=8, d2=7, h=2.5+0.2+wall,$fn=30);

        translate([7/2-2.5/2,0,10/2])
        cube([7,8,10],center=true);
    }
}

module _bottom_lock_removed(outer_d, wall) {
    translate([slop+2.5/2,outer_d/2-10,0])
    cylinder(d=5, h=2.5+0.2,$fn=30);
}

//_drawer_form(200, 105, 46, 9);
//_info_slot(200, 36);
//_handle();
//_lock_cutout(200,46,1.5);

module drawer(outer_d, inner_d, height, wall, bottom_lock) {
    difference() {
        union() {
            _drawer_form(outer_d, inner_d, height, wall);
            _info_slot(outer_d, height);
            _handle(outer_d, height, wall);
            _lock_handle(outer_d,height,wall);
            _lock_nub(outer_d, height);
            if (bottom_lock) {
                _bottom_lock_added(outer_d, wall);
            }
        }
        _lock_cutout(outer_d,height,wall);
        if (bottom_lock) {
            _bottom_lock_removed(outer_d, wall);
        }
    }
}

module bolt(height) {
    h = height + 5;
    

    
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

// quickfix
module lock_clip(outer_d, height, wall) {
    difference() {
        translate([-height-3+20,-outer_d/2+20,0])
        rotate([0,90,0])
        intersection() {
            drawer(200, 105, 45, 1.5);

            translate([slop+wall/2,outer_d/2-10,height+3-20/2])
            cube([wall,50,20],center=true);
        }
        translate([0,25,0])
        cube([21,20,20],center=true);
    }
}

module drill_jig() {
    module _cutout() {
        intersection() {
            rotate([0,0,45])
            cube([145,145,200],center=true);

            difference() {
                translate([-3.3/2,12+3.3/2,-1])
                cube([200,200,50]);

                cylinder(d=50,h=100,center=true);
            }
        }

        hull() {
            translate([10/2-3.3/2,90,0])
            cylinder(d=10,h=30,center=true,$fn=30);

            translate([0,195/2,0])
            cylinder(d=3.3,h=30,center=true,$fn=30);
        }

        for(i=[45,60,75]) {
            translate([-3.3/2-12/2,i,0]) {
                cylinder(d=3.4,h=44,center=true,$fn=30);

                translate([0,0,10-2.8])
                M3_nut(3);
            }
        }

        translate([2.5/2+corner_d(1.5)/2,
                   200/2-corner_d(1.5)/2,0])
        cylinder(d=4,h=40,center=true,$fn=30);
    }

    difference() {
        union() {
            cylinder(d=40,h=60,$fn=50);

            translate([0,0,10/2])
            rotate([0,0,45])
            chamfered_cube_side(165,165,10,9,center=true);

            for(i=[0:3]) {
                rotate([0,0,90*i])
                translate([195/2,0,0])
                cylinder(d=14,h=7,$fn=40);
            }
        }
        for(i=[0:3]) {
            rotate([0,0,90*i])
            _cutout();
        }
        cylinder(d=30,h=200,center=true,$fn=50);
    }
}

module jig_drill_hole(outer_d, wall) {
    
    x1 = -12/2-3.3/2-corner_d(wall)/2-2.5/2;
    y1 = 50/2;

    x2 = -12/2-3.3/2;
    y2 = 50/2-10.1+corner_d(wall)/2;
    
    rotate([90,0,0])
    difference() {
        union() {
            hull() {
                translate([0,16.3,14/2])
                cube([20,15,14],center=true);

                translate([x1, y1, 0])
                cylinder(d=9,h=14,$fn=30);


                translate([x2, y2, 0])
                cylinder(d=9,h=14,$fn=30);
            }
            translate([0,6.3,14/2])
            cube([20,45,14],center=true);

            hull() {
                translate([x1,y1,0])
                cylinder(d=9,h=25,$fn=30);

                translate([x2, y2, 0])
                cylinder(d=9,h=25,$fn=30);
            }

            translate([-12/2-3.3/2,
                       50/2-10.1+corner_d(wall)/2,
                       0])
            hull() {
                translate([0,-3/2,-12/2+25])
                cylinder(d=6,h=12,center=true,$fn=20);

                translate([0,-13,13])
                cube([2,0.1,1],center=true);
            }
        }

        cube([12.2,80,20.4],center=true);

        translate([x1, y1, 0])
        cylinder(d=3,h=100,center=true,$fn=30);

        translate([x2, y2, 0])
        cylinder(d=3,h=100,center=true,$fn=30);

        translate([0,50/2+13,0])
        rotate([0,0,-45])
        cube([50,20,100],center=true);

        #translate([0,100+50/2+28.5-outer_d/2,0])
        rotate([0,0,45])
        cube([100,20,20],center=true);

        translate([0,-outer_d/2+corner_d(wall)/2+50/2,0])
        translate([0,45,10/2])
        cylinder(d=3.4,h=30,center=true,$fn=30);

        translate([0,-outer_d/2+corner_d(wall)/2+50/2,0])
        translate([0,60,10/2])
        cylinder(d=3.4,h=30,center=true,$fn=30);

        translate([0,-outer_d/2+corner_d(wall)/2+50/2,0])
        translate([0,75,10/2])
        cylinder(d=3.4,h=30,center=true,$fn=30);

        // text
        translate([20/2-0.4,-10,3])
        rotate([90,0,90])
        linear_extrude(0.5)
        text(str(outer_d), size=7);

        translate([-20/2+0.4,4,3])
        rotate([90,0,-90])
        linear_extrude(0.5)
        text(str(wall), size=7);

    }
}

module drill_jig_core(d) {
    difference() {
        union() {
            cylinder(d=60,h=2,$fn=50);
            cylinder(d=d,h=50,$fn=50);
        }
        cylinder(d1=44,d2=40,h=8,center=true,$fn=50);
        cylinder(d=40.3,h=120,center=true,$fn=50);

        translate([0,0,3])
        for(i=[0:3]) {
            rotate([0,0,i*90])
            hull() {
                cylinder(d=1,h=60);

                translate([40,0,0])
                cylinder(d=30,h=60);
            }
        }
    }
}

module debug_drawer() {
    //rotate([90,0,180])
    //import("Drawer_200_105_45.stl");

    drawer(200, 105, 45, 1.5);
}

module debug_jig() {
    render()
    translate([0,0,10])
    rotate([180,0,0])
    drill_jig();

    translate([0,0,-45])
    rotate([0,0,0.75]) {
        render()
        drawer(200, 105, 45, 1.5);

        rotate([0,0,90])
        render()
        drawer(200, 105, 45, 1.5);
    }

    translate([3.3/2+12/2,200/2-corner_d(1.5)/2-50/2])
    rotate([-90,0,0])
    jig_drill_hole(200, 1.5);

//    translate([0,0,-45])
//    rotate([0,0,0.9]) {
//        render()
//        drawer(160.5, 90.2, 38.6, 1.2);
//
//        rotate([0,0,90])
//        render()
//        drawer(160.5, 90.2, 38.6, 1.2);
//    }
//
//    translate([3.3/2+12/2,160.5/2-corner_d(1.2)/2-50/2])
//    rotate([-90,0,0])
//    jig_drill_hole(160.5, 1.2);
}

module debug_bolt() {
    translate([-6,0,-0.2])
    import("Bolt_45.stl");

    bolt(45);
}
