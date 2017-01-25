
slop = 0.10;

$fn=60;

width = 25;

center_width = 10.1;

ball_top_side = 4;

ball_count=11;
ball_notch = ball_top_side - ball_top_side*0.7;
ball_center_width = ball_top_side*0.7-2*slop;

echo (ball_notch);

ball_position = center_width/2+ball_top_side/2;

outer_position = center_width/2+ball_top_side;
outer_side = width/2-outer_position;

bewel = 0.4;

center_cube_side = 4;

simple = true;

module beweled_cylinder(d, h, b) {
    hull() {
        cylinder(d=d-2*b, h=h);
        translate([0,0,b]) cylinder(d=d, h=h-2*b);
    }
}

module top(d,h) {
    difference() {
        translate([0,0,h/2]) cube([d,d,h],center=true);
        for (i = [0:3]) {
            rotate([0,0,i*360/4]) translate([d/1.1,0,0]) cylinder(d=d,h=h+1);
        }
    }
}

module cube_path(cube_side, circle_dia, diameter, height, steps=360, inner=true) {
    
    module rotation(cube_position, cube_rotate ) {
        for (i=[0:steps-1]) {
            rotate([0,0,i*(360/steps)]) translate([cube_position,0,height/2]) rotate([0,0,i*(360/steps)*cube_rotate]) top(cube_side,height);
            //%rotate([0,0,i*(360/steps)]) translate([diameter/2,0,0]) cylinder(d=circle_dia, h=6);
        }
    }

    circle_circumfence = circle_dia*PI;

    inner_diameter = diameter-circle_dia;

    circumfence = inner_diameter*PI;
    step_len = circumfence/steps;
    step_degrees = steps/(circle_circumfence/step_len);
    
    if (inner) {
        rotation(diameter/2+circle_dia/2, step_degrees);
    } else {
        rotation(diameter/2-circle_dia/2, -step_degrees);
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
                beweled_cylinder(d=center_width, h=10, b=bewel);
                if (!simple)
                    cube_path(ball_top_side, ball_top_side, center_width, 11, steps=360, inner=true);
            }
            hull() {
                translate([0,0,2*ball_notch]) cone(center_width-ball_notch,center_width+ball_notch,ball_notch);
                translate([0,0,4+2*ball_notch]) cone(center_width+ball_notch,center_width-ball_notch,ball_notch);
            }
        }
        translate([0,0,3]) cube([center_cube_side,center_cube_side,19], center=true);
    }
}

module ball() {
    module ball_cone() {
        hull() {
            if (simple) {
                beweled_cylinder(d=ball_top_side-slop, h=1, b=bewel);
                translate([0,0,2.5*ball_notch-slop/2]) cone(ball_top_side-slop, ball_center_width, ball_notch/2);
            } else {
                beweled_cylinder(d=ball_top_side-slop+2, h=1, b=bewel);
                translate([0,0,2*ball_notch-slop/2]) cone(ball_top_side-slop+2, ball_center_width, ball_notch);
            }
        }
    }
    
    module cube_cone() {
        intersection() {
            ball_cone();
            if (!simple)
                cube([ball_top_side-slop, ball_top_side-slop, 15], center=true);
        }
    }

    union() {
        cylinder(d=ball_center_width , h=10);
        cube_cone();
        translate([0,0,10]) mirror([0,0,1]) cube_cone();
    }
}

module outer() {
    intersection() {
        union() {
            difference() {
                beweled_cylinder(d=width, h=10, b=bewel);
                cylinder(d=center_width+ball_top_side*2, h=11);
                translate([0,0,-1+bewel]) beweled_cylinder(d=center_width+ball_top_side*2+0.6, h=1, b=bewel);
                translate([0,0,10-bewel]) beweled_cylinder(d=center_width+ball_top_side*2+0.6, h=1, b=bewel);
                if (!simple)
                    cube_path(ball_top_side, ball_top_side, center_width+2*ball_top_side, 11, steps=360, inner=false);
            }
            rotate_extrude(convexity=7) translate([outer_position,0,0]) polygon(points=[[-ball_notch/2,3*ball_notch],[2,1],[3,1],[3,9],[2,9],[-ball_notch/2,10-3*ball_notch]]);
        
        }
        //cube([30,30,30]);
        //translate([0,0,7]) cube_path(5, 5, center_width+10, 3, steps=360, inner=false);
    }
}

module bearing3() {
    center();

    for (i=[0:ball_count-1]) {
        rotate([0,0,360/ball_count*i]) translate([ball_position,0,0]) ball();
    }

    difference() {
        outer();
        rotate_extrude(convexity=7) {
            translate([23, 5, 0]) circle(d=10);
        }
    }
}

bearing3();

//top(10,5);

