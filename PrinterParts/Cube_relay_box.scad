use <../lib/includes.scad>;
use <../PCParts/common.scad>;
use <../PCParts/connectors.scad>;

x_8 = 138.5;
y_8 = 56;
hole_offset_x_8 = (138.5-132)/2;
hole_offset_y_8 = (56-50)/2;

x_16 = 178.5;
y_16 = 90.3;

wall = 1.2;
lid_h = 1.5;

mount_stud_d = 7;
mount_stud_h = 4;

box_16_x = 200;
box_16_y = 105;


module _mock_relay_board(x, y, hole_offset_x, hole_offset_y) {
    difference() {
        cube([x, y, 1]);
        translate([hole_offset_x, hole_offset_y,0])
            cylinder(d=3, h=2, $fn=30);
        translate([x-hole_offset_x, hole_offset_y,0])
            cylinder(d=3, h=2, $fn=30);
        translate([x-hole_offset_x, y-hole_offset_y,0])
            cylinder(d=3, h=2, $fn=30);
        translate([hole_offset_x, y-hole_offset_y,0])
            cylinder(d=3, h=2, $fn=30);
    }
}

module mock_relay_board_8() {
    _mock_relay_board(x_8, y_8, hole_offset_x_8, hole_offset_y_8);
}

module mock_relay_board_16() {
    x = x_16;
    y = y_16;
    difference() {
        cube([x, y, 1]);
        translate([3.5, 3.6,0])
            cylinder(d=3, h=2, $fn=30);
        translate([x-4, 4,0])
            cylinder(d=3, h=2, $fn=30);
        translate([x-4, y-4,0])
            cylinder(d=3, h=2, $fn=30);
        translate([3.5, y-3.6,0])
            cylinder(d=3, h=2, $fn=30);
    }
}

module mock_connector_board_8() {
    difference() {
        pcb_with_holes(22.5,45,h=1.6);
        _connector_board_mount_holes_8();
    }
    translate([7.32,2.24,-1]) pin_header(3);
    translate([7.32,2.54+2.24,-1]) pin_header(3);
    
    translate([7.32,4*2.54+2.24,-1]) pin_header(4);
    translate([7.32,7*2.54+2.24,-1]) pin_header(4);
    translate([7.32,9*2.54+2.24,-1]) pin_header(4);
    translate([7.32,11*2.54+2.24,-1]) pin_header(4);
    translate([7.32,13*2.54+2.24,-1]) pin_header(4);
    translate([7.32,15*2.54+2.24,-1]) pin_header(4);
}
//mock_connector_board_8();

module mock_extruder_board_16() {
    difference() {
        pcb_with_holes(22.5,45.6,h=1.6);
        _extruder_board_mount_holes_16();
    }
    
    translate([2*2.54+2.24,2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,2*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,4*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,6*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,8*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,10*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,12*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,14*2.54+2.24,-1]) pin_header(4);
    translate([2*2.54+2.24,16*2.54+2.24,-1]) pin_header(4);
}

module mock_connector_board_16() {
    difference() {
        pcb_with_holes(22.5,43,h=1.6);
        _connector_board_mount_holes_16();
    }
    
    translate([3*2.54+2.24,2*2.54+2.24,-1]) pin_header(3,2);
    translate([2*2.54+2.24,6*2.54+2.24,-1]) pin_header(4);
    translate([4*2.54+2.24,9*2.54+2.24,-1]) pin_header(2,4);
}

module _connector_board_mount_holes_8(d=3.2,h=4) {
    translate([2.54, 2.54,0])  {
        cylinder(d=d,h=h,$fn=30);
        translate([0,16*2.54,0])
            cylinder(d=d,h=h,$fn=30);
        translate([7*2.54,0,0])
            cylinder(d=d,h=h,$fn=30);
        translate([7*2.54,16*2.54,])
            cylinder(d=d,h=h,$fn=30);
    }
}

module _extruder_board_mount_holes_16(d=3.2,h=4) {
    translate([2.54, 2.54,0]) {
        translate([0,2.54]) cylinder(d=d,h=h,$fn=30);
        translate([0,15*2.54,0])
            cylinder(d=d,h=h,$fn=30);
        translate([7*2.54,2.54,0])
            cylinder(d=d,h=h,$fn=30);
        translate([7*2.54,15*2.54,])
            cylinder(d=d,h=h,$fn=30);
    }
}

module _extruder_board_connector_holes() {
    translate([2*2.54+2.24,2.24,-1]) pin_connector_hole(4, 1, h=14);
    translate([2*2.54+2.24,2*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,4*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,6*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,8*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,10*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,12*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,14*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
    translate([2*2.54+2.24,16*2.54+2.24,-1]) pin_connector_hole(4,1,h=14);
}

module _connector_board_mount_holes_16(d=3.2,h=4) {
    translate([2.54, 2.54,0]) {
        translate([0,0]) cylinder(d=d,h=h,$fn=30);
        translate([0,15*2.54,0])
            cylinder(d=d,h=h,$fn=30);
        translate([7*2.54,0,0])
            cylinder(d=d,h=h,$fn=30);
        translate([7*2.54,15*2.54,])
            cylinder(d=d,h=h,$fn=30);
    }
}

module _connector_board_connector_holes_16() {
    translate([3*2.54+5.1,2*2.54+3.75,-1]) connector_shroud_hole(3, 2);
    translate([2*2.54+2.24,6*2.54+2.24,-1]) pin_connector_hole(4,h=14);
    translate([5*2.54+1.25,10*2.54+3.77,-1]) rotate([0,0,90]) connector_shroud_hole(4, 2);
}

module _box(x, y, h) {
    module lid_connector() {
        translate([7/2,7/2,0]) hull() {
            translate([0,0,7]) cylinder(d=7, h=7, $fn=50);
            translate([-2,-2,0])
                cylinder(d=0.5, h=0.5);
        }
    }
    
    module clip_hole() {
        translate([20/2,0,0]) hull() {
            cube([20,20,0.1], center=true);
            translate([0,0,3.9]) cube([20,24,0.1], center=true);
        }
        translate([20/2+20,0,0]) rounded_cube(21,23,4.5,1,center=true);
    }
    
    difference() {
        rounded_cube_side(x,y,h,7);
        difference() {
            translate([wall,wall,wall])
                rounded_cube(x-wall*2,y-wall*2,h+4+wall*2,4);
            // lid mount connectors
            translate([0,0,h-15])
                lid_connector();
            translate([x,0,h-15])
                rotate([0,0,90])
                lid_connector();
            translate([x,y,h-15])
                rotate([0,0,180])
                lid_connector();
            translate([0,y,h-15])
                rotate([0,0,-90])
                lid_connector();
            
            // clip hole reinforcements
            translate([x/2,y/2-12,2/2]) cube([x,6,2],center=true);
            translate([x/2,y/2+12,2/2]) cube([x,6,2],center=true);
            translate([52,y/2,2/2]) cube([6,y,2],center=true);
            translate([x-52,y/2,2/2]) cube([6,y,2],center=true);
        }
    
        // lid screw holes
        translate([7/2, 7/2, h-9])
            cylinder(d=2.8, h=9, $fn=30);
        translate([x-7/2, 7/2, h-9])
            cylinder(d=2.8, h=9, $fn=30);
        translate([7/2, y-7/2, h-9])
            cylinder(d=2.8, h=9, $fn=30);
        translate([x-7/2, y-7/2, h-9])
            cylinder(d=2.8, h=9, $fn=30);
        
        // clip holes
        translate([10, y/2, 0]) clip_hole();
        translate([x-50, y/2, 0]) clip_hole();
    }
}

module _stepdown_converter_mount() {
    difference() {
        union() {
            translate([-5-3,0,0])
                cube([3,6,27]);
            translate([5,0,0])
                cube([3,6,27]);
        }
        translate([-20/2,0,0])
            rotate([-45,0,0])
            cube([20,10,10]);
        translate([-11/2,3,7])
            cube([11,1.8,20]);
        translate([-5.5,3,12.5])
            cube([5,4,8]);
    }
}

module _mount_stud() {
    difference() {
        cylinder(d=mount_stud_d, h=mount_stud_h, $fn=30);
        cylinder(d=2.8, h=mount_stud_h, $fn=30);
    }
}

module box_8() {
    diff = 2.5;
    feet_h = 4;
    difference() {
        _box(155,70,35);
        translate([152,14.55,9.7+7*2.54]) {
            rotate([0,90,0]) {
                translate([-2.54,-2.54]) _connector_board_mount_holes_8();
                translate([2.8,-2.8,0])
                    cube([12.4,43.5,10]);
            }
        }
    }

    translate([3,7,1]) {
        translate([hole_offset_x_8, hole_offset_y_8,0])
            _mount_stud();
        translate([x_8-hole_offset_x_8, hole_offset_y_8,0])
            _mount_stud();
        translate([x_8-hole_offset_x_8, y_8-hole_offset_y_8,0])
            _mount_stud();
        translate([hole_offset_x_8, y_8-hole_offset_y_8,0])
            _mount_stud();
    }
}

module box_16() {
    feet_h = 4;
    union() {
        difference() {
            _box(box_16_x,box_16_y,35);
            translate([-1,27,31.5]) {
                rotate([0,90,0]) {
                    _extruder_board_mount_holes_16();
                    translate([5.2,0,0])
                        cube([12.4,45.5,10]);
                }
            }
            translate([box_16_x-2,30,32]) {
                rotate([0,90,0]) {
                    _connector_board_mount_holes_16();
                    translate([5.2,4,0])
                        cube([12.4,35,10]);
                }
            }
        }

        translate([8,7,1]) {
            translate([3.5, 3.6,0])
                _mount_stud();
            translate([x_16-4, 4,0])
                _mount_stud();
            translate([x_16-4, y_16-4,0])
                _mount_stud();
            translate([3.5, y_16-3.6,0])
                _mount_stud();
        }
        translate([box_16_x-1,17,2]) rotate([0,0,90]) _stepdown_converter_mount();
        translate([box_16_x-1,87,2]) rotate([0,0,90]) _stepdown_converter_mount();
    }
}

module _lid(x,y) {
    
    wall_offset = (wall*2 + 0.5)/2;

    module lid_screw_hole() {
        translate([0,0,lid_h+1]) cylinder(d=7.5, 20, $fn=30);
        hull() {
            cylinder(d=5.2, h=0.1, $fn=30);
            translate([0,0,0.9]) cylinder(d=3.2, h=0.1, $fn=30);
        }
        translate([0,0,1]) cylinder(d=3.2, h=2, $fn=30);
    }
    
    difference() {
        union() {
            rounded_cube_side(x,y,lid_h,7);
            difference() {
                translate([wall_offset,wall_offset,lid_h])
                    rounded_cube_side(x-wall_offset*2,
                                      y-wall_offset*2,
                                      1.6,
                                      7-wall_offset*2);
                translate([15/2,15/2,0])
                    rounded_cube_side(x-15,y-15,4,3);
            }
        }
        
        // screw holes
        translate([7/2, 7/2, 0])
            lid_screw_hole();
        translate([x-7/2, 7/2, 0])
            lid_screw_hole();
        translate([x-7/2, y-7/2, 0])
            lid_screw_hole();
        translate([7/2, y-7/2, 0])
            lid_screw_hole();
        
        // vents
        vents = 14;
        x_offset = (x-(2*25))/(vents-1);
        y_pos = (y-30)/2;
        for (i=[0:vents-1]) {
            translate([25+i*x_offset,y/2,0]) {
                hull() {
                    translate([7,y_pos,0]) cylinder(d=3,h=5, $fn=30);
                    translate([-7,-y_pos,0]) cylinder(d=3,h=5, $fn=30);
                }
            }
        }
    }
}

module lid_8() {
    _lid(185,70);
}

module lid_16() {
    _lid(box_16_x,box_16_y);
}

module connector_lid_8() {
    difference() {
        hull() {
            translate([0,0,0.1/2]) cube([21,50,0.1],center=true);
            translate([0,0,5-0.1/2]) cube([28,58,0.1],center=true);
        }
        translate([-(7*2.54)/2-2.54,-(17*2.54)/2-0.5,0]) {
            translate([0,0,1]) _connector_board_mount_holes_8(2.8,7);
            translate([7.3+2.54,2.5-0.35,0]) pin_connector_hole(3, 2, h=14);
            translate([4.75+2.54,4*2.54+2.5-0.35,0]) pin_connector_hole(4, 1, h=14);
            translate([4.75+2.54,7*2.54+2.5-0.35,0]) pin_connector_hole(4, 1, h=14);
            translate([4.75+2.54,9*2.54+2.5-0.35,0]) pin_connector_hole(4, 1, h=14);
            translate([4.75+2.54,11*2.54+2.5-0.35,0]) pin_connector_hole(4, 1, h=14);
            translate([4.75+2.54,13*2.54+2.5-0.35,0]) pin_connector_hole(4, 1, h=14);
            translate([4.75+2.54,15*2.54+2.5-0.35,0]) pin_connector_hole(4, 1, h=14);
        }
    }
}

module extruder_lid_16() {
    difference() {
        hull() {
            translate([0,0,0.1/2]) cube([28,58,0.1],center=true);
            translate([0,0,5-0.1/2]) cube([21,50,0.1],center=true);
        }
        translate([-(7*2.54)/2-2.54,-(17*2.54)/2-0.5,0]) {
            translate([0,0,-1]) _extruder_board_mount_holes_16(2.8,6);
            _extruder_board_connector_holes();
        }
    }
}

module connector_lid_16() {
    difference() {
        hull() {
            translate([0,0,0.1/2]) cube([28,58,0.1],center=true);
            translate([0,0,5-0.1/2]) cube([21,50,0.1],center=true);
        }
        translate([-(7*2.54)/2-2.54,-(17*2.54)/2-0.5,0]) {
            translate([0,0,-1]) _connector_board_mount_holes_16(2.8,5);
            _connector_board_connector_holes_16();
        }
    }
}

module _clip() {
    translate([0,0,0])
      hull() {
        translate([0,0,0.1/2]) rounded_cube_side(20,20,0.1,2,center=true);
        translate([0,0,2-0.1/2]) rounded_cube_side(20,22,0.1,2,center=true);
    }
}

module clip() {
    difference() {
        _clip();
        cylinder(d=3, h=2, $fn=30);
        translate([0,0,1]) cylinder(d1=3, d2=7,h=2, $fn=30);
    }
}

module clip_2020() {
    
    difference() {
        union() {
            translate([-3/2,0,20/2])
              rotate([0,90,0])
                rounded_cube_side(20,30,3,2,center=true);
            translate([-23/2,-20/2-3/2,20/2])
              rotate([90,0,0])
                rounded_cube_side(23,20,3,2,center=true);
            translate([0,0,20/2])
              rotate([0,90,0])
                _clip();
        }
        translate([-3-20/2,-20/2,20/2])
          rotate([90,0,0])
            cylinder(d=4.3,h=5,$fn=30);
        
        translate([2,0,12/2+4])
          rotate([45,0,0])
            cube([5,12,12],center=true);
    }
}

module debug_8() {
    //%translate([3,7,4]) mock_relay_board_8();
    %translate([151.8,12,30]) rotate([0,90,0]) mock_connector_board_8();
    box_8();
    translate([160,34.15,18.6]) rotate([0,-90,0]) connector_lid_8();
    //translate([0,0,37]) mirror([0,0,1]) lid_8();
    translate([20,36,0]) clip();
}

module debug_16() {
    intersection() {
        union() {
            %translate([8,7,4]) mock_relay_board_16();
            box_16();
            translate([3.15,20,8.6]) rotate([0,-90,0]) mock_extruder_board_16();
            translate([0,42.05,20.05]) rotate([0,-90,0]) extruder_lid_16();
            translate([box_16_x-3,30,32]) rotate([0,90,0]) mock_connector_board_16();
            translate([box_16_x,52.1,20.55]) rotate([0,90,0]) connector_lid_16();
            translate([0,box_16_y,37.1]) rotate([180,0,0]) lid_16();
        }
        translate([0,4,0]) cube([250,200,50]);
    }
}

//debug_8();
//debug_16();

//box_8();
//lid_8();
//connector_lid_8();

//box_16();
//lid_16();
//extruder_lid_16();
//connector_lid_16();

//clip();
clip_2020();