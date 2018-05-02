include <../lib/includes.scad>;

w = 65-1;
d = 25-1;

outer_w = w + 10;
outer_d = d + 10;

module foot(bottom_height=1) {
    rounded_cube_side(outer_w, outer_d, bottom_height, 13);
    translate([0,0,bottom_height]) difference() {
        hull() {
            rounded_cube_side(outer_w, outer_d, 0.1, 13);
            translate([(outer_w-w-2)/2,(outer_d-d-2)/2,0]) rounded_cube_side(w+2, d+2, 25, 5);
        }
        translate([(outer_w-w)/2,(outer_d-d)/2,0]) rounded_cube(w, d, 60, 3);
    }
}

module top_foot_bottom() {
    difference() {
        translate([(outer_w-w)/2,(outer_d-d)/2,-0.1]) rounded_cube_side(w, d, 7, 5);
        translate([(outer_w-w)/2+10/2,(outer_d-d)/2+10/2,-0.1]) rounded_cube(w-10, d-10, 9, 3);
        
        //translate([(outer_w-w)/2+15, (outer_d-d)/2-1.5, 4]) sphere(d=6, $fn=40);
        //translate([(outer_w-w)/2+15, d+6.5, 4]) sphere(d=6, $fn=40);

        //translate([w-10, (outer_d-d)/2-1.5, 4]) sphere(d=6, $fn=40);
        //translate([w-10, d+6.5, 4]) sphere(d=6, $fn=40);
        translate([(outer_w-w)/2, (outer_d-d)/2-1.5, 3.5]) rotate([0,90,0]) cylinder(d=6, h=w, $fn=40);
        translate([(outer_w-w)/2, d+6.5, 3.5]) rotate([0,90,0]) cylinder(d=6, h=w, $fn=40);
        
    }
    translate([0,0,-2.1]) rounded_cube_side(outer_w, outer_d, 2, 13);
}

module top_foot() {
    difference() {
        foot(23);
        top_foot_bottom();
    }
}

//foot();
top_foot();
//top_foot_bottom();