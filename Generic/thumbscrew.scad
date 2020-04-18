
include <../Dollo/NEW_long_ties/include.scad>;

$fn=30;

module rib(rib_size, rib_pos, height, top_cone) {
    if (top_cone) {
        hull() {
            translate([rib_pos,0,0])
            cylinder(d=rib_size, h=height/2, $fn=30);

            translate([rib_pos,0,height/2])
            cylinder(d=rib_size/2, h=height/2, $fn=30);
        }
    } else {
        translate([rib_pos,0,0])
        cylinder(d=rib_size, h=height, $fn=30);
    }
}

module thumbscrew(ribs=8,
            rib_size=5,
            size=15,
            height=4,
            top_cone=false,
            rounding=0,
            nut_size="M3",
            nut_indent=true) {

    rib_angle = 360/ribs;
    rib_pos = size/2 - rib_size/4;
    difference() {
        intersection () {
            union() {
                if (top_cone) {
                    hull() {
                        cylinder(d=size, h=height-height/3, $fn=30);

                        translate([0,0,height-height/5])
                        cylinder(d=size-size/8, h=height/5, $fn=60);
                    }
                } else {
                    cylinder(d=size, h=height, $fn=30);
                }
                for(pos=[0:ribs-1]) {
                    rotate([0,0,pos*rib_angle])
                    rib(rib_size, rib_pos, height, top_cone);
                }
            }
            if (rounding > 0) {
                rounded_cylinder(rib_pos*2+rib_size,
                                 height, rounding, $fn=60);
            }
        }

        if (nut_size == "M4") {
            translate([0,0,-0.5])
            cylinder(d=4.3, h=height+1,$fn=40);
            if (nut_indent) M4_nut(cone=false, bridging=true);
        } else if (nut_size == "M3") {
            translate([0,0,-0.5])
            cylinder(d=3.3, h=height+1,$fn=40);
            if (nut_indent) M3_nut(cone=false, bridging=true);
        }
    }
}

module thumbscrew_with_body(ribs=8,
                            rib_size=5,
                            size=15,
                            height=4,
                            top_cone=false,
                            rounding=0,
                            nut_size="M3",
                            nut_indent=true,
                            body_h=15,
                            body_d=6) {
    union() {
        thumbscrew(ribs=ribs,
                   rib_size=rib_size,
                   size=size,
                   height=height,
                   top_cone=false,
                   rounding=rounding,
                   nut_size=nut_size,
                   nut_indent=nut_indent);
        translate([0,0,height-0.1])
        difference() {
            cylinder(d=body_d, h=body_h+0.1,$fn=40);

            if (nut_size == "M3")
                cylinder(d=3.3, h=body_h+1,$fn=40);
            if (nut_size == "M4")
                cylinder(d=4.3, h=body_h+1,$fn=40);
        }
    }
}

//thumbscrew();
//thumbscrew(ribs=20,
//     rib_size=2,
//     size=12,
//     height=7,
//     top_cone=false,
//     rounding=3,
//     nut_size="M4");
//thumbscrew_with_body();
//thumbscrew_with_body(ribs=20,
//                     rib_size=3,
//                     size=17,
//                     height=7,
//                     top_cone=false,
//                     rounding=2,
//                     nut_size="M4",
//                     nut_indent=true,
//                     body_h=2,
//                     body_d=9);

thumbscrew_with_body(ribs=13,
                     rib_size=3,
                     size=12,
                     height=5,
                     top_cone=false,
                     rounding=1.5,
                     nut_size="M3",
                     nut_indent=true,
                     body_h=2,
                     body_d=7);