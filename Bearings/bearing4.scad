
slop = 0.08;

$fn=60;

width = 40;

center_width = 17.3;

ball_top_side = 6;

ball_count=12;
ball_notch = ball_top_side - ball_top_side*0.7;
ball_center_width = ball_top_side*0.7-2*slop;

ball_position = center_width/2+ball_top_side/2;

outer_position = center_width/2+ball_top_side;
outer_side = width/2-outer_position;

bewel = 0.4;

center_cube_side = 7;

//intersection() {
//    bearing4();
//    cube([100,100,100]);
//}
bearing4();
//top(10,5);


module beweled_cylinder(d, h, b) {
    hull() {
        cylinder(d=d-2*b, h=h);
        translate([0,0,b]) cylinder(d=d, h=h-2*b);
    }
}

module ball_path() {

    rotate_extrude(convexity=7) {
        translate([ball_position, -slop, 0]) circle(d=ball_top_side);
        translate([ball_position, slop, 0]) circle(d=ball_top_side);
    }
}

module cone(d1, d2, h) {
    hull() {
        cylinder(d=d1, h=0.01);
        translate([0,0,h-0.01]) cylinder(d=d2, h=0.01);
    }
}

module center() {
    difference() {
        union() {
            difference() {
                beweled_cylinder(d=center_width+ball_notch, h=10, b=bewel);
                translate([0,0,ball_top_side/3]) ball_path();
                translate([0,0,10-ball_top_side/3]) ball_path();
            }
        }
        translate([0,0,3]) cube([center_cube_side,center_cube_side,19], center=true);
    }
}

module ball() {
    module ball() {
        intersection() {
            translate([0,0,ball_top_side/3]) sphere(d=ball_top_side-slop);
            translate([0,0,ball_top_side/2]) cube([ball_top_side,ball_top_side,ball_top_side],center=true);
        }
    }
    
    union() {
        cylinder(d=ball_center_width , h=10);
        ball();
        translate([0,0,10]) mirror([0,0,1]) ball();
    }
}

module outer() {
    intersection() {
        union() {
            difference() {
                beweled_cylinder(d=width, h=10, b=bewel);
                cylinder(d=center_width+ball_notch+2*ball_center_width+4*slop, h=11);
                translate([0,0,-1+bewel]) beweled_cylinder(d=center_width+ball_notch+2*ball_center_width+4*slop+1, h=1, b=bewel);
                translate([0,0,10-bewel]) beweled_cylinder(d=center_width+ball_notch+2*ball_center_width+4*slop+1, h=1, b=bewel);
                translate([0,0,ball_top_side/3]) ball_path();
                translate([0,0,10-ball_top_side/3]) ball_path();
            }
        }
        //cube([30,30,30]);
        //translate([0,0,7]) cube_path(5, 5, center_width+10, 3, steps=360, inner=false);
    }
}

module bearing4() {
    center();

    for (i=[0:ball_count-1]) {
        rotate([0,0,360/ball_count*i]) translate([ball_position,0,0]) ball();
    }

    difference() {
        outer();
        rotate_extrude(convexity=10, $fn=80) {
            translate([23, 5, 0]) rotate() rotate(45) square(9.5, center=true);
            //translate([23, 5, 0]) circle(d=10);
        }
    }
}



