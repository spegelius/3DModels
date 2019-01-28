use <../Dollo/NEW_long_ties/include.scad>;

slop = 0.15;

$fn=80;

simple = true;
//simple = false;

module top(d,h) {
    difference() {
        translate([0,0,h/2]) cube([d,d,h],center=true);
        for (i = [0:3]) {
            rotate([0,0,i*360/4]) translate([d/1.1,0,0]) cylinder(d=d,h=h+1);
        }
    }
}


// not working
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

module center(width, height, ball_notch, bevel) {
    union() {
        difference() {
            chamfered_cylinder(width, height, bevel);
            if (!simple)
                cube_path(ball_top_side, ball_top_side, width, height+1, steps=36, inner=true);
        }
        translate([0,0,height/2]) chamfered_cylinder(width+ball_notch,height/3+bevel*2-slop,bevel,center=true);
    }
}

module ball(ball_d, height, ball_notch, ball_center_width) {

    union() {
        cylinder(d=ball_center_width , h=height);
        chamfered_cylinder(ball_d-slop, height/3, ball_notch/2);
        translate([0,0,height]) mirror([0,0,1]) chamfered_cylinder(ball_d-slop, height/3, ball_notch/2);
    }
}

module outer(width, height, center_width, ball_notch, ball_d, bevel) {
    intersection() {
        union() {
            difference() {
                chamfered_cylinder(width, height, bevel);
                cylinder(d=center_width+ball_d*2-ball_notch, h=height+1);
                
                chamfered_cylinder(center_width+ball_d*2+ball_notch, bevel*2, bevel,center=true);
                translate([0,0,height]) chamfered_cylinder(center_width+ball_d*2+ball_notch, bevel*2, bevel,center=true);
                
                chamfered_cylinder(center_width+ball_d*2, height/3+slop/2, bevel);
                translate([0,0,height-height/3-slop/2]) chamfered_cylinder(center_width+ball_d*2, height/3+1, bevel);
                
                if (!simple)
                    cube_path(ball_d, ball_d, center_width+2*ball_d, height+1, steps=360, inner=false);
            }
        }
    }
}

module bearing3(d, h, center_width, balls, ball_d, print_aid=false) {

    ball_notch = ball_d * 0.25;
    ball_center_width = ball_d*0.75 - 2*slop;

    ball_position = center_width/2+ball_d/2;

    outer_position = center_width/2+ball_d;
    outer_side = d/2-outer_position;

    bevel = ball_notch/2;
    
    module _bearing(height) {
        center(center_width, height, ball_notch, bevel);
        for (i=[0:balls-1]) {
            rotate([0,0,360/balls*i]) translate([ball_position,0,0]) ball(ball_d, height, ball_notch, ball_center_width);
        }
        outer(d, height, center_width, ball_notch, ball_d, bevel);
    }
    
    if (bevel > 0.5) {
        echo(bevel);
        intersection() {
            translate([0,0,-(bevel-0.5)/2]) _bearing(h+bevel-0.5);
            cylinder(d=d+10,h=h);
        }
    } else {
        _bearing(h);
    }
    
    if (print_aid) {
        difference() {
            cylinder(d=ball_position*2+0.9,h=0.2);
            cylinder(d=ball_position*2-0.9,h=1,center=true);
        }
        difference() {
            cylinder(d=d+0.8,h=0.2);
            cylinder(d=d-1,h=1,center=true);
        }
    }

}

module key_8mm() {
    difference() {
        union() {
            chamfered_cube(40,8,10,2, center=true);
            cylinder(d=8,h=25,$fn=50);
            for (i = [0:5]) {
                rotate([0,0,360/6*i]) translate([8/2,0,25/2]) cube([0.8,0.8,25],center=true);
            }
        }
        cylinder(d=0.1,h=26,$fn=50);
    }
}

module drill_bit_8mm() {
    difference() {
        union() {
            cylinder(d=8,h=10,$fn=50);
            for (i = [0:5]) {
                rotate([0,0,360/6*i]) translate([8/2,0,10/2]) cube([0.8,0.8,10],center=true);
            }
            translate([0,0,9.99]) cylinder(d1=8,d2=13,h=2.51);
            translate([0,0,12.49]) cylinder(d=7,h=20,$fn=6);
        }
        cylinder(d=0.1,h=35);
    }
}

module debug() {
    intersection() {
        //bearing3(100, 20, 30, 10, 10);
        bearing3(22, 7, 10.5, 10, 4, print_aid=true);
        cube([100,100,100]);
    }
}

//debug();

//608
module bearing3_608() {
    difference() {
        bearing3(22, 7, 10.5, 10, 4.7, print_aid=true);
        translate([0,0,0.2]) cylinder(d=8+2*slop,h=20,$fn=50);
        for (i = [0:5]) {
            rotate([0,0,360/6*i]) translate([8/2,0,8/2+0.2]) cube([1,1,8],center=true);
        }
    }
}

//bearing3_608();
//key_8mm();
drill_bit_8mm();
