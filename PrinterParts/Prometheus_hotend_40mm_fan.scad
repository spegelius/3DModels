
$fn=40;
fan_side=40;
bolt_hole_distance=32;

bolt_hole_offset = (35-bolt_hole_distance)/2;
bolt_hole_position = 35/2 - bolt_hole_offset;

wall = 1.5;

module hotend() {
    scale([10,10,10]) import("../_downloaded/Prometheus_Hot_End/Aluminium_Heat_Sink_V2_5mm.stl");
}

module hotend_body() {
    hull() intersection() {
        hotend();
        cube([35,35,48],center=true);
    }
}

module arms() {
    x_scale = (29.5+2*wall)/30;
    echo(x_scale*30);
    y_scale = (15+wall)/15;
    difference() {
        intersection() {
            scale([x_scale, y_scale, 1.03]) hotend_body();
            translate([0,-1,0]) cube([34, 14, 46], center=true);
        }
        scale([29.5/30,1,1]) hotend_body();
    }
}

module arms_extension() {
    rotate([-90,0,0]) {
        linear_extrude(1) {
            projection(cut=true) {
                translate([0,0,7.99]) {
                    rotate([90,0,0]) {
                        arms();
                    }
                }
            }
        }
    }
}

module _body() {
    hull() {
        translate([0,21,0]) arms_extension();
        translate([5,0,(fan_side+2)/2]) cube([fan_side+2,4, fan_side+2], center=true);
    }
}

scale_val = (40-2*wall)/40;

module _body_scaled() {
    hull() {
        translate([0,21,0]) scale([(27-2*wall)/27, 1, 20.5/22.5]) arms_extension();
        translate([5,0,(fan_side+2)/2*scale_val]) scale([scale_val,1,scale_val]) cube([fan_side+2,4, fan_side+2], center=true);
    }
}


module body() {
    
    difference() {
        union() {
            _body();
            translate([0,22,0]) arms_extension();
            translate([0,22,1/2]) cube([26,2,1], center=true);
            translate([0,31,0]) arms();
        }
        translate([0,-0.6,1]) _body_scaled();
        translate([0,24,1]) {
            rotate([90,0,0]) {
                linear_extrude(7) {
                    projection(cut=true) {
                        translate([0,0,22]) {
                            rotate([-90,0,0]) {
                                scale([1,1,1.01]) {
                                    _body_scaled();
                                }
                            }
                        }
                    }
                }
            }
        }

    }
}

module fan_shroud() {
    union() {
        body();
        translate([5,0,(fan_side+2)/2]) rotate([90,0,0]) difference() {
            cube([fan_side+2,fan_side+2,4], center=true);
            translate([0,0,-2.5]) cylinder(d=fan_side-1, h=8);
            translate([bolt_hole_position, bolt_hole_position, -2.5]) cylinder(d=2.5, h=5);
            translate([-bolt_hole_position, bolt_hole_position, -2.5]) cylinder(d=2.5, h=5);
            translate([-bolt_hole_position, -bolt_hole_position, -2.5]) cylinder(d=2.5, h=5);
            translate([bolt_hole_position, -bolt_hole_position, -2.5]) cylinder(d=2.5, h=5);
        }
    }
}

module debug() {
    intersection() {
        fan_shroud();
        translate([-50,-10,0]) cube([100,100,15]);
        //translate([-50,-10,0]) cube([100,20,100]);
    }
}

//debug();

rotate([90,0,0]) fan_shroud();
