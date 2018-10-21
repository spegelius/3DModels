
use <../Dollo/NEW_long_ties/include.scad>;

leg_offset = 33.4;
body_d = 100;
head_d = body_d * 0.45;
screw_d = body_d * 0.6;

module _body_screw() {
    v_screw(h=13, screw_d=screw_d, pitch=4, direction=0, steps=100);
}

module _body_half() {
    difference() {
        intersection() {
            translate([0,0,-5]) resize([body_d,body_d,body_d/2]) sphere(d=body_d/2,$fn=80);
            translate([0,0,40/2]) cube([100,100,40],center=true);
        }
        translate([0,0,-13/2]) _body_screw();
    }
}

module _leg_body() {
    difference() {
        union() {
            sphere(d=10,$fn=30);
            hull() {
                cylinder(d=8,h=1,$fn=30);
                translate([0,0,15]) sphere(d=6,$fn=30);
            }
        }
    }
}

module leg() {
    difference() {
        _leg_body();
        translate([-10/2,3.7,-10/2]) cube([10,5,10]);
        translate([-10/2,-8.7,-10/2]) cube([10,5,10]);
        translate([-10/2,-5,-14]) cube([10,10,10]);
        cube([1.5,15,10], center=true);
    }
    %rotate([90,0,90]) leg_peg();
}

module leg_peg() {
    cube([2*3.7,4,1.5],center=true);
}

module body_bottom() {
    difference() {
        _body_half();
        for(i=[0:3]) {
            rotate([0,0,360/4*i+45]) translate([leg_offset,0,12]) _leg_body();
        }
        translate([0,0,13/2-0.01]) cylinder(d1=head_d-5+19,d2=head_d-11,h=21/2,$fn=80);
    }
}

module body_top() {
    difference() {
        _body_half();
        translate([0,0,15]) _head_body();
        cylinder(d=head_d-5,h=100,$fn=80);
        translate([0,0,13/2-0.01]) cylinder(d1=head_d-5+17,d2=head_d-5,h=15/2,$fn=80);
    }
}

module _head_body() {
    hull() {
        cylinder(d=head_d,h=1,$fn=80);
        translate([0,0,25]) sphere(d=head_d,$fn=80);
    }
}

module pupil() {
    intersection() {
        difference() {
            scale([1,1.005,1]) _head_body();
            translate([0,0,-0.7]) scale([0.96,0.96,1]) _head_body();
        }
        translate([0,-20,25]) rotate([90,0,0]) cylinder(d=10,h=5,$fn=40);
    }
}

module eye() {
    intersection() {
        difference() {
            scale([1,1.005,1]) _head_body();
            translate([0,0,-0.7]) scale([0.96,0.96,1]) _head_body();
        }
        difference() {
            hull() {
                translate([0,-10,0]) cube([30,50,1], center=true);
                translate([0,0,25]) rotate([90,0,0]) cylinder(d=30,h=30,$fn=60);
            }
            translate([0,0,25]) rotate([90,0,0]) cylinder(d=20,h=50,$fn=40);
        }
    }
}

module head() {
    horizontal_scale = (head_d-5)/head_d;
    vertical_scale = (head_d+10-5/2)/(head_d+10);
    difference() {
        _head_body();
        scale([horizontal_scale,horizontal_scale,vertical_scale]) _head_body();
        pupil();
        eye();
    }
}

module body_screw() {
    horizontal_scale = (screw_d - 0.4)/screw_d;
    difference() {
        intersection() {
            translate([0,0,-0.1]) scale([horizontal_scale,horizontal_scale,1]) _body_screw();
            cylinder(d=100,h=12.8);
        }
        cylinder(d=54,h=30,center=true,$fn=80);
    }
}

module view_assembly() {
    color("purple") rotate([180,0,0]) body_bottom();
    color("purple") body_top();
    translate([0,0,10]) {
        color("white") head();
        //color("DarkTurquoise") eye();
        //color("black") pupil();
    }
    color("purple") rotate([180,0,0]) for(i=[0:3]) {
        rotate([0,0,360/4*i+45]) translate([leg_offset,0,12]) scale([1.01,1.01,1.01]) rotate([0,20,0]) leg();
    }
}

module debug() {
    intersection() {
        //body_bottom();
        //body_top();
        body_screw();
        cube([100,100,100]);
    }
}

module debug2() {
    intersection() {
        union() {
            //body_bottom();
            body_top();
            translate([0,0,-13/2+0.1]) body_screw();
        }
        cube([100,100,100]);
    }
}

//debug();
//debug2();

//view_assembly();

//_body_thread();
//_body_half();
//_leg_body();
//body_bottom();
//body_top();
//head();
//pupil();
//eye();
//body_screw();
//leg();
leg_peg();
