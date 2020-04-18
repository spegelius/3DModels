use <common.scad>;
use <../lib/includes.scad>;

wall = 0.8;

module _tube(d,w,h) {
    hull() {
        translate([-w/2,0,0]) cylinder(d=d,h=h,$fn=40);
        translate([w/2,0,0]) cylinder(d=d,h=h,$fn=40);
    }
}

module connector_shroud_form(pins_x, pins_y, tube_d, tube_w, tube_h) {
    
    union() {
        hull() {
            holee(wall,14)
                pin_connector_hole(pins_x, pins_y, h=14, center=true);
            _tube(tube_d+2*wall, tube_w, 14+tube_h);
        }
        translate([0,0,14+tube_h-1])
            _tube(tube_d+2*wall, tube_w, tube_h+1);
        translate([0,(pins_y*2.54)/2+wall,8/2]) cube([3,2,8],center=true);
    }
}

module connector_shroud(pins_x, pins_y, tube_d, tube_w, tube_h) {
    difference() {
        connector_shroud_form(pins_x, pins_y, tube_d, tube_w, tube_h);
        hull() {
            pin_connector_hole(pins_x, pins_y, h=13.8, center=true);
            _tube(tube_d,tube_w,14+tube_h);
        }
        translate([0,0,14+tube_h-1])
            _tube(tube_d,tube_w,tube_h+1);

    }
}

module connector_shroud_hole(pins_x, pins_y) {
    holee(0.2,14) connector_shroud_form(pins_x, pins_y, 3, 2,4);
}
//connector_shroud(3, 2);
//connector_shroud_hole(3, 2);

//connector_shroud(4,2,2.2,4,4);
//connector_shroud_hole(4, 2);