include <common.scad>;

wall = 2;
slop = 0.3;
w = atx_psu_width + 2*wall + 2*slop;
h = atx_psu_height + wall + slop;

back_plate();
//front_plate();

module _plate(ears=true) {

    module ear() {
        difference() {
            hull() {
                cube([1, wall, 15]);

                translate([15/2,0,15/2])
                rotate([-90,0,0])
                cylinder(d=15,h=wall, $fn=40);
            }
            translate([15/2,0,15/2])
            rotate([-90,0,0])
            cylinder(d=4,h=5, $fn=40);
        }
    }

    union() {
        rotate([90,0,0])
        difference() {
            translate([0,0,wall])
            minus_atx_psu_holes() {
                translate([-w/2,0,-wall])
                cube([w, 15, h]);
            }
            if (ears) {
                translate([0,wall,wall])
                mock_atx_psu(holes=false, slop=slop);

                translate([0,0,wall])
                difference() {
                    minus_atx_psu_holes(hole=8) {
                        translate([-(atx_psu_width+2*slop)/2,0,0])
                        cube([atx_psu_width+2*slop,
                            wall+1,atx_psu_height+slop]);
                    }
                    translate([-(atx_psu_width+2*slop)/2,0,0])
                    cube([6,wall+1,8+2]);

                    translate([-(atx_psu_width+2*slop)/2,
                        0,atx_psu_height-6-8/2])
                    cube([30,wall+1,8]);

                    translate([(atx_psu_width+2*slop)/2-6,
                        0,6-8/2+64])
                    cube([6,wall+1,8]);

                    translate([(atx_psu_width+2*slop)/2-6,0,0])
                    cube([6,wall+1,8+2]);
                }
            } else {
                translate([0,0,wall])
                mock_atx_psu(holes=false, slop=slop);
            }
        }
        
        translate([-w/2+0.1,-h,0])
        mirror([1,0,0])
        ear();

        translate([w/2-0.1,-h,0])
        ear();
    }
    
}

module back_plate() {
    _plate();
}

module front_plate() {
    _plate(false);
}
