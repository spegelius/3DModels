include <../lib/includes.scad>;

////// VARIABLES //////
slop = 0.10;
slot_count = 6;

////// CONSTANTS //////
box_depth = 15;
box_h = 172.5;
box_w = 137.5;
angle = 20;
edge = 1.6;
interval =  box_depth + edge;
dove_min = 4;
dove_max = 6;
dove_depth = 4;
dove_minus_min = dove_min + slop;
dove_minus_max = dove_max + slop;
dove_minus_depth = dove_depth + slop/2;
beam_width = 18;
back_beam_slot_w = 10;

// slot_conf
// 0 = left
// 1 = right
// 2 = both
// 3 = none

////// VIEW //////
//mock_assembly();
view_proper();
//plate();

//foot_middle();
//foot_left();
//foot_right();

// Left
//translate([0, 0, 30/2 - 5])
//rotate([-90, 0, 0])
//side_beam(slot_count, 0, brim=true);

// Right
//translate([0, 0, 30/2-5])
//rotate([-90, 0, 0])
//side_beam(slot_count, 1, brim=true);

// Both (middle)
//translate([0, 0, 30/2 - 5])
//rotate([-90, 0, 0])
//side_beam(slot_count, 2, brim=true);

// Back beam
//translate([0, 0, 35/2])
//rotate([0, 90, 0])
//back_beam(slot_count, brim=true);

//plate_middle();
//plate_left();
//plate_right();

//end_cap_back();
//end_cap();

//test_parts();


////// MODULES //////

module _dovetail_minus(h) {
    dovetail(dove_minus_max, dove_minus_min, dove_minus_depth, h);
}

module _dovetail(h) {
    dovetail(dove_max, dove_min, dove_depth, h);
}


module mock_bluray_box(texti=false) {
    cube([box_depth, box_w, box_h]);
    if (texti) {
        color("black")
        translate([3,0,box_h-40])
        rotate([90, 90,0])
        text("Testi Testi Testi");
    }
}

module mock_assembly() {
    for (i = [0:15]) {
        translate([0,0,i*(interval+8)])
        rotate([-45,0,0])
        rotate([0,-90,0])
        mock_bluray_box();
    }
}

module long_sphere(d, h) {
    intersection() {
        scale([1.5,1,0.4])
        sphere(d=d, $fn=80);

        cube([h,d*2,d*2], center=true);
    }
}

module side_clip_male() {
    intersection(){
        translate([0,0,edge/2])
        difference() {
            long_sphere(d=8, h=5, $fn=40);
            cube([5,2,4], center=true);
        }
        translate([-20/2,-20/2,0])
        cube([20,20,edge]);
    }
}

module side_clip_female() {
    translate([0,0,edge/2])
    long_sphere(d=8, h=5+slop, $fn=40);
}

module side_beam_beam(h) {
    intersection() {
        translate([0,0,h/2])
        rotate([0,0,45])
        cube([30,30,h], center=true);

        translate([0,-5,h/2])
        cube([beam_width,30,h], center=true);
    }
}

// slot_conf
// 0 = left
// 1 = right
// 2 = both
// 3 = none
module side_beam(count, slot_conf=0, brim=false) {
    h = (count+2)*interval;
    
    base = box_depth+2;
    
    module slots() {
        rotate([-angle,0,0])
        for (i=[0:count-1]) {
            translate([0, -5, base+i*interval])
            cube([10,500,box_depth+0.01], center=true);
        }
    }

    difference() {
        side_beam_beam(h);
        
        if (slot_conf != 3 && slot_conf != 0) {
            translate([beam_width/2-4+10/2,0,0]) slots();
        }
        
        if (slot_conf != 3 && slot_conf != 1) {
            translate([-beam_width/2+4-10/2,0,0]) slots();
        }

        rotate([-angle,0,0])
        translate([0,-5,base-40/2-box_depth/2])
        cube([30,500,40], center=true);

        rotate([-angle,0,0])
        translate([0,-5,base-box_depth/2-edge+count*interval+40/2])
        cube([30,500,40], center=true);
        
        rotate([-angle,0,0]) {
            translate([0,30/2-3-5/2+cos(angle)*edge,base-box_depth/2]) {
                rotate([90,0,0])
                _dovetail_minus(30);
            }
        }
    }
    
    z_pos = base-(box_depth/2)/cos(angle)-edge/cos(angle)+(count*interval)/cos(angle)+cos(angle)*3-0.05;
    intersection () {
        translate([0,0,z_pos])
        rotate([-angle,0,0])
        translate([0,25/2-3,0]) {
            rotate([90,0,0])
            _dovetail(25);

            translate([0,-25/2,-edge/2])
            cube([dove_max,25,edge],center=true);
        }

        translate([0,
                   -5,
                   base-box_depth/2-edge+count*interval+10])
        cube([12,30,200], center=true);
    }

    if (brim) {
        translate([0,10,z_pos-2])
        rotate([90,0,0])
        cylinder(d=10,h=0.2);
    }
}

module back_beam_beam(h) {
    intersection() {
        rotate([0,0,45])
        cylinder(d=40,h=h, $fn=40);

        translate([0,-5,h/2])
        cube([35,31,h], center=true);
    }
}

module back_beam(count, slots=true, brim=false) {
    h = (count+2)*interval;
    
    base = cos(angle)*14+4;
    intersection () {
        difference() {
            back_beam_beam(h);
            if (slots) {
                for (i=[0:count-1]) {
                    translate([0,-15.5,base+i*interval/cos(angle)])
                    rotate([-angle,0,0])
                    cube([50,25,box_depth+0.01], center=true);
                }
            }
            translate([0,-15.5,base-(box_depth/2)/cos(angle)]) {
                rotate([-angle,0,0]) {
                    translate([0,15.5+4.5,0]) {
                        translate([-35/2,0,0])
                        rotate([90,0,90])
                        _dovetail_minus(35);
                    }
                }
            }
        }
        translate([0,-15.5,base-(box_depth/2)/cos(angle)])
        rotate([-angle,0,0])
        translate([0,0,(count*interval-edge)/2])
        cube([50,500,count*interval-edge], center=true);
    }
    translate([0,
               -15.5,
               base-(box_depth/2)/cos(angle)+count*interval/cos(angle)]) {
        rotate([-angle,0,0]) {
            translate([0,15.5+4.5,0]) {
                translate([-35/2+4,0,0])
                rotate([90,0,90])
                _dovetail(10);

                translate([-35/2+4,-dove_max/2,-edge-0.01])
                cube([back_beam_slot_w,dove_max,edge+0.01]);

                translate([35/2-14,0,0])
                rotate([90,0,90])
                _dovetail(10);

                translate([35/2-14,-dove_max/2,-edge-0.01])
                cube([back_beam_slot_w,dove_max,edge+0.01]);
            }
            // brim
            if (brim) {
                translate([35/2,20,2])
                rotate([0,-90,0])
                cylinder(d=10,h=0.2);
            }
        }
    }
}

module plate_back_hole() {
    cube([back_beam_slot_w+slop,dove_minus_max+0.05,edge+0.1]);

    translate([-0.2,-0.2,0])
    cube([back_beam_slot_w+slop+0.4,dove_minus_max+0.05+0.4,0.2]);
}

module plate_front_hole() {
    cube([dove_minus_max+0.05,25+slop,edge+0.01],center=true);

    translate([0,0,-(edge+0.01)/2+0.1])
    cube([dove_minus_max+0.05+0.4,25+slop+0.4,0.2],center=true);
}

module plate() {
    h = 50;
    
    center = 60;
    difference() {
        intersection() {
            translate([0,-10.5,0]) union() {
                hull() {
                    translate([0,0,0])
                    back_beam_beam(h);

                    translate([0,-center,0])
                    cylinder(d=35, h=h);
                }

                hull() {
                    translate([-box_h/2-5,-95.5,0])
                    side_beam_beam(h);

                    translate([0,-center,0])
                    cylinder(d=35, h=h);
                }

                hull() {
                    translate([box_h/2+5,-95.5,0])
                    side_beam_beam(h);

                    translate([0,-center,0])
                    cylinder(d=35, h=h);
                }
            }
            translate([0,0,edge/cos(angle)/2])
            rotate([-angle,0,0])
            cube([box_h+60, 400,edge], center=true);
        }
        
        offset = cos(angle)*(15.5+4.5);
        z_pos = sin(angle)*(15.5+4.5)+tan(angle)*(26-offset)+(edge)/cos(angle)-0.01;
        echo(offset);

        translate([0,-15.5-10.5,z_pos])
        rotate([-angle,0,0])
        translate([0,15.5+4.5,0]) {
            translate([-35/2+4,-dove_minus_max/2,-edge])
            plate_back_hole();

            translate([35/2-14,-dove_minus_max/2,-edge])
            plate_back_hole();
        }

        z_pos_2 = tan(angle)*(10.5+95.5)+edge/cos(angle);

        translate([-box_h/2-5,-95.5-10.5,z_pos_2])
        rotate([-angle,0,0])
        translate([0,-3,-edge/2])
        cube([dove_minus_max+0.05,25+slop,edge+0.01],center=true);

        translate([box_h/2+5,-95.5-10.5,z_pos_2])
        rotate([-angle,0,0])
        translate([0,-3,-edge/2])
        plate_front_hole();
    }
}

module split_plate() {
    intersection() {
        rotate([angle,0,0])
        plate();

        translate([0,-200,0])
        cube([200,200,edge+1]);
    }
}


module plate_right() {
    union() {
        split_plate();

        translate([-5/2,-80,0])
        side_clip_male();

        translate([-5/2,-55,0])
        side_clip_male();

        translate([-5/2,-30,0])
        side_clip_male();
    }
}

module plate_left() {
    difference() {
        mirror([1,0,0])
        split_plate();

        translate([-5/2,-80,0])
        side_clip_female();

        translate([-5/2,-55,0])
        side_clip_female();

        translate([-5/2,-30,0])
        side_clip_female();
    }
}


module plate_middle() {
    
    union() {
        translate([-box_h/2-5,0,0])
        plate_right();

        translate([box_h/2+5,0,0])
        plate_left();
    }
}

module test_parts() {
    
//    intersection() {
//        translate([0,15,0])
//        plate_right();
//
//        cube([20,20,2]);
//    }
//
//    translate([24,20,0])
//    intersection() {
//        translate([-83,132,0])
//        plate_right();
//
//        cube([20,32,2]);
//    }

    translate([20,0,0])
    intersection() {
        translate([10,87,0])
        plate_right();

        cube([20,15,2]);
    }

    translate([45,0,0])
    intersection() {
        translate([10,87,0])
        plate_left();

        cube([20,15,2]);
    }

    translate([-20,0,0])
    intersection () {
        translate([-30,3,35/2])
        rotate([0,90,0])
        back_beam(2);

        cube([15,20,18]);
    }

    translate([-38,0,0])
    intersection() {
        translate([5,3,35/2])
        rotate([0,90,0])
        back_beam(2);

        cube([15,20,18]);
    }
    
//    translate([15,15,30/2-5])
//    intersection() {
//        translate([0,-5,-10])
//        rotate([-90,0,0])
//        side_beam(2, true);
//
//        cube([20,40,20], center=true);
//    }
//    
//    translate([-5,18,30/2-5])
//    intersection() {
//        translate([0,-35,-10])
//        rotate([-90,0,0])
//        side_beam(2, true);
//
//        translate([0,10,0])
//        cube([20,20,20], center=true);
//    }
}

module foot() {
    count = 4;

    translate([0,0,-110+42])
    intersection() {
        union() {
            translate([0,95.5,0])
            back_beam(count, false);

            translate([box_h/2+5,0,interval/cos(angle)+10.55])
            side_beam(count, 3, brim=false);

            translate([-box_h/2-5,0,interval/cos(angle)+10.55])
            side_beam(count, 3, brim=false);
        }
        translate([0,0,118])
        cube([200,220,100],center=true);
    }

    h = 7;
    center = 60;

    translate([0,95.5,0])
    intersection() {
        union() {
            hull() {
                translate([0,-12.5,0])
                back_beam_beam(h);

                translate([0,-center,0])
                cylinder(d1=35, h=10);
            }

            hull() {
                translate([-box_h/2-5,-95.5,0])
                side_beam_beam(h);

                translate([0,-center,0])
                cylinder(d1=35, h=10);
            }

            hull() {
                translate([box_h/2+5,-95.5,0])
                side_beam_beam(h);

                translate([0,-center,0])
                cylinder(d1=35, h=10);
            }
        }
        difference() {
            cube([box_h+60, 300,14], center=true);

            translate([0,30])
            rotate([-angle,0,0])
            cube([box_h+60, 400,14], center=true);
        }
    }
    
}

module _split_foot() {
    intersection() {
        foot();

        translate([0,-80,0])
        cube([200,200,200]);
    }
}

module foot_right() {
    union() {
        _split_foot();

        translate([-5/2,30,0])
        side_clip_male();

        translate([-5/2,55,0])
        side_clip_male();

        translate([-5/2,80,0])
        side_clip_male();
    }
}

module foot_left() {
    difference() {
        mirror([1,0,0])
        _split_foot();

        translate([-5/2,30,0])
        side_clip_female();

        translate([-5/2,55,0])
        side_clip_female();

        translate([-5/2,80,0])
        side_clip_female();
    }
}

module foot_middle() {
    
    union() {
        translate([-box_h/2-5,0,0])
        foot_right();

        translate([box_h/2+5,0,0])
        foot_left();
    }
}


module end_cap_back() {
    intersection() {
        translate([-1,-2,35/2])
        rotate([0,90,0])
        back_beam(2);

        cylinder(d=20,h=35, $fn=40);
    }
}

module end_cap() {
    intersection() {
        translate([0,-6,10])
        rotate([-90,0,0])
        side_beam(2, slot_conf=3);

        rotate([-angle,0,0])
        cylinder(d=20,h=35, $fn=40);
    }
}

module view_proper() {
    count = 18;

    foot();

    translate([0, 95.5, 2.65])
    back_beam(count);

    translate([
        box_h/2 + 5, 0, interval/cos(angle) + 13.15
    ])
    side_beam(count, 0);

    translate([
        -box_h/2 - 5, 0, interval/cos(angle) + 13.15
    ])
    side_beam(count, 1);
    
    %translate([-box_h/2, -35, 104.9])
    rotate([-angle, 0, 0])
    rotate([0, 90, 0])
    mock_bluray_box();

    translate([0, 95.5 + 10.4, 0.7])
    plate();

    translate([
        0, 95.5 + 10.4, 0.7 + interval/cos(angle) * count
    ])
    plate();

    translate([
        0, 97.5, 3.65 + interval/cos(angle) * count
    ])
    rotate([0, -90, 0])
    end_cap_back();

    translate([
        -box_h/2 - 5, 10,
        interval/cos(angle) * count + 36.9
    ])
    rotate([90, 0, 0])
    end_cap();

    translate([
        box_h/2 + 5, 10,
        interval/cos(angle) * count + 36.9
    ])
    rotate([90, 0, 0])
    end_cap();

    %cylinder(d=200, h=376);
}


