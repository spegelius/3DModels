
include <../lib/includes.scad>;

offset = 8;
clip_offset = 3.95;
wall_1 = 0.9;
wall_2 = 1.4;
part_offset = 4.5;

unit_h = 20.2 + 2*wall_1;
unit_w = 45.2 + 2*wall_1;

magn_hole_d = 8.3;

module house_1x1_v6() {

    difference() {
        translate([-125,-89.86,0]) import("../_downloaded/Bigger_Mini_Drawers/House_1x1_v5.stl", convexity=10);
        translate([0,-6.0452,offset+35/2]) chamfered_cube(60,20,35, 5, center=true);
        translate([0,42-6.0451,offset+35/2]) chamfered_cube(60,20,35, 5, center=true);

        translate([0,-6.0452,90-offset-35/2]) chamfered_cube(60,20,35, 5, center=true);
        translate([0,42-6.0451,90-offset-35/2]) chamfered_cube(60,20,35, 5, center=true);


        translate([-33.3149,20,offset+35/2]) chamfered_cube(20,60,35, 5, center=true);
        translate([33.6852,20,offset+35/2]) chamfered_cube(20,60,35, 5, center=true);

        translate([-33.3149,20,90-offset-35/2]) chamfered_cube(20,60,35, 5, center=true);
        translate([33.6852,20,90-offset-35/2]) chamfered_cube(20,60,35, 5, center=true);

        translate([-22.4149,4.85487,wall_1]) difference() {
            cube([45.2,20.2,10]);
            translate([45.2/2, 20.2/2,-0.1]) cylinder(d=13,h=5, $fn=40);
        }
    }
}

module drawer_1x1_v6() {
    h = unit_h-0.9-2*wall_1;
    w = unit_w-4*wall_1-1.02;

    difference() {
        translate([-125,-76.6125,0]) import("../_downloaded/Bigger_Mini_Drawers/Drawer_1x1_v5.stl", convexity=10);;
        translate([-21.19,-6.215,0.91]) rounded_cube_side(w, 83, h,2);
    }
    translate([0,77,h/2-0.05]) rotate([90,0,0]) difference() {
        hull() {
            translate([0,8,0]) cylinder(d=2, h=0.5, $fn=30);
            cylinder(d=13, h=3.2, $fn=50);
            translate([0,-8,0]) cylinder(d=3, h=0.5, $fn=30);
        }
        translate([0,0,-0.1]) cylinder(d=magn_hole_d, h=2.2, $fn=50);
    }
}

module house_2x2_v6() {
    difference() {
        translate([-125,-76.6125,0]) import("../_downloaded/Bigger_Mini_Drawers/House_2x2_v5.stl", convexity=10);
        translate([0,-6.0501,offset+35/2]) chamfered_cube(120,20,35, 5, center=true);
        translate([0,68.5-6.0499,offset+35/2]) chamfered_cube(120,20,35, 5, center=true);

        translate([0,-6.0501,90-offset-35/2]) chamfered_cube(120,20,35, 5, center=true);
        translate([0,68.5-6.0499,90-offset-35/2]) chamfered_cube(120,20,35, 5, center=true);


        translate([-59.0626,26,offset+35/2]) chamfered_cube(20,65,35, 5, center=true);
        translate([59.4376,26,offset+35/2]) chamfered_cube(20,66,35, 5, center=true);
        
        translate([-59.0626,26,90-offset-35/2]) chamfered_cube(20,65,35, 5, center=true);
        translate([59.4376,26,90-offset-35/2]) chamfered_cube(20,66,35, 5, center=true);
        
        translate([-47.6625,5.35,wall_2]) difference() {
            cube([95.7,45.7,10]);
            translate([95.7/2, 45.7/2,-0.1]) cylinder(d=13,h=5, $fn=40);
        }
    }
}

module drawer_2x2_v6() {
    h = 44.5;
    w = 2*unit_w + part_offset-4*wall_2-1.2;

    difference() {
        _drawer_2x2_v5();
        translate([-45.84,-6.215,0.9]) rounded_cube_side(w-0.01, 83, h,2);
    }
    translate([0,77,h/2]) rotate([90,0,0]) difference() {
        hull() {
            translate([0,10,0]) cylinder(d=1, h=0.5);
            cylinder(d=13, h=3.2, $fn=50);
            translate([0,-10,0]) cylinder(d=1, h=0.5);
        }
        translate([0,0,-0.1]) cylinder(d=magn_hole_d, h=2.2, $fn=50);
    }
}

module house_2x3_v6() {
    hole = (3*unit_h+2*part_offset-2*wall_2)/2+clip_offset+wall_2;
    union() {
        difference() {
            union() {
                difference() {
                    house_2x2_v6();
                    translate([-130/2,46.5,-1]) cube([130,40,95]);
                }
                translate([0,26.5,0]) difference() {
                    house_2x2_v6();
                    translate([-130/2,0,-1]) cube([130,20,95]);
                }
                translate([-20,20,0]) cube([40,40,wall_2]);
            }
            translate([-20,20,wall_2]) cube([40,50,4]);
            translate([0,hole,-0.1]) cylinder(d=magn_hole_d,h=2.1, $fn=50);
        }
        difference() {
            translate([0,hole,wall_2]) cylinder(d=13,h=3, $fn=40);
            translate([0,hole,-0.1]) cylinder(d=magn_hole_d,h=3, $fn=50);
        }
    }
}

module _drawer_2x2_v5() {
    translate([-125,-76.6125,0]) import("../_downloaded/Bigger_Mini_Drawers/Drawer_2x2_v5.stl", convexity=10);
}

module drawer_2x3_v6() {
    
    h = 44.5;
    new_h = h + unit_h + part_offset;
    
    w = 2*unit_w + part_offset-4*wall_2-1.2;

    module slice() {
        translate([0,0,-30]) difference() {
            _drawer_2x2_v5();
            translate([-50,-40,-0.1]) cube([100,140,30.1]);
        }
    }

    difference() {
        union() {
            difference() {
                _drawer_2x2_v5();
                translate([-50,-40,15]) cube([100,140,40]);
            }

            middle_h = new_h/2-15/2;
            translate([0,0,middle_h-15]) difference() {
                _drawer_2x2_v5();
                translate([-50,-40,-0.1]) cube([100,140,15.1]);
                translate([-50,-40,30]) cube([100,140,15]);
            }
            
            top_pos = new_h - (h - 30);
            
            scaling_1 = (middle_h - 15) / (h - 30);
            translate([0,0,15]) scale([1,1,scaling_1]) slice();
            
            scaling_2 = (new_h - middle_h - 15) / (h - 30);
            translate([0,0,middle_h+15]) scale([1,1,scaling_2]) slice();
        }
        translate([-45.84,-6.215,0.9]) rounded_cube_side(w-0.01, 83, new_h,2);
    }
    translate([0,77,new_h/2-0.25]) rotate([90,0,0]) difference() {
        hull() {
            translate([0,10,0]) cylinder(d=1, h=0.5);
            cylinder(d=13, h=3.2, $fn=50);
            translate([0,-10,0]) cylinder(d=1, h=0.5);
        }
        translate([0,0,-0.1]) cylinder(d=magn_hole_d, h=2.2, $fn=50);
    }
}

module house_3x3_v6() {
    hole_x = -47.65 + (3*unit_w+2*part_offset-2*wall_2)/2;
    hole_y = (3*unit_h+2*part_offset-2*wall_2)/2+clip_offset+wall_2;
    difference() {
        union() {
            translate([0,0,0]) difference() {
                house_2x3_v6();
                translate([0,0,-1]) cube([60,90,95]);
            }
            
            translate([0,0,0]) intersection() {
                house_2x3_v6();
                translate([0,0,-1]) cube([48,90,95]);
            }

            translate([51.5,0,0]) difference() {
                house_2x3_v6();
                translate([-133.5,0,-1]) cube([130,90,95]);
            }
            translate([-20,20,0]) cube([80,40,wall_2]);
            }
        translate([-20,20,wall_2]) cube([80,50,4]);
        translate([hole_x,hole_y,-0.1]) cylinder(d=magn_hole_d,h=2.1, $fn=50);
    }
    difference() {
        translate([hole_x,hole_y,wall_2]) cylinder(d=13,h=3, $fn=40);
        translate([hole_x,hole_y,-0.1]) cylinder(d=magn_hole_d,h=3, $fn=50);
    }
}

module drawer_3x3_v6() {
    
    h = 44.5;
    new_h = h + unit_h + part_offset;
    new_w = 3*unit_w + 2*part_offset-2*wall_2-1.2;
    old_w = 2*unit_w + part_offset-2*wall_2-1.2;
    scaling_x = new_w / old_w;
   
    difference() {
        union() {
            scale([scaling_x, 1, 1]) drawer_2x3_v6();
            translate([-20,76.784,30]) cube([40,1.6,40]);
        }
        translate([-71.5,-6.215,0.9]) cube([new_w-2*wall_2, 90-9.41, 3*unit_h+2*part_offset-3*wall_2]);
        translate([-71.5,-6.215,0.9]) rounded_cube_side(new_w-2*wall_2, 90-6.91, 3*unit_h+2*part_offset-3*wall_2, 4);

        translate([0,75.39,new_h/2]) rotate([-90,0,0]) cylinder(d=magn_hole_d, h=3, $fn=50);
    }
    translate([0,77,new_h/2]) rotate([90,0,0]) difference() {
        hull() {
            translate([0,10,0]) cylinder(d=1, h=0.5);
            cylinder(d=13, h=3.2, $fn=50);
            translate([0,-10,0]) cylinder(d=1, h=0.5);
        }
        translate([0,0,-0.1]) cylinder(d=magn_hole_d, h=2.2, $fn=50);
    }
}

// measurements
//translate([13.1,0,0]) cube([2,3.95,1]);
//translate([0,clip_offset+wall_2,90]) cube([2, 3*unit_h+2*part_offset-2*wall_2,2]);
//translate([-15,clip_offset+0.1125,90]) cube([2, 1.4,2]);

//translate([-47.65,20,90]) cube([3*unit_w+2*part_offset-2*wall_2, 2,2]);

intersection() {
    //house_1x1_v6();
    //cube([30,30,10]);
}
//translate([0.18,14.95,0]) cylinder(d=8.3,h=1, $fn=50);
//translate([0,unit_h+part_offset,0]) house_1x1_v6();
//translate([77.2,-0.1,0]) house_2x2_v6();
//translate([unit_w+part_offset,0,0]) house_1x1_v6();
intersection() {
    //house_2x2_v6();
    //cube([30,40,10]);
}
//translate([0,6,90]) rotate([-90,0,0]) _drawer_2x2_v5();

intersection() {
    //house_2x3_v6();
    //cube([30,50,10]);
}
//translate([103, unit_h+part_offset,0]) house_2x2_v6();      

intersection() {
    house_3x3_v6();
    //cube([25,50,10]);
}
//translate([51.5, -53,0]) house_2x2_v6();

//drawer_1x1_v6();
//drawer_2x2_v6();

//drawer_2x3_v6();
//translate([0,6,90]) rotate([-90,0,0]) drawer_2x3_v6();

//drawer_3x3_v6();
//translate([26,6,90]) rotate([-90,0,0]) drawer_3x3_v6();