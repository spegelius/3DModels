include <../Dollo/New_long_ties/globals.scad>;
use <../Dollo/New_long_ties/include.scad>;

////// VARIABLES //////
// M24 metric bolt
bolt_d = 24;
nut_d = 24+0.7;
thread_steps = 80;


////// VIEW //////
//debug_v2();
//2020_motor_mount();
//mount_v2_2020_frame_clip();
//mount_v2_dollo_frame_clip();
//mount_v2_arm();
//mount_v2_bolt();
mount_v2_nut();
//mount_v2_head_airtrippers();
//mount_v2_motor_beam(160);
//spanner();

////// MODULES //////
module 2020_motor_mount() {
    h = 20;
    d = 199.7;
    
    difference() {
        union() {
            difference() {
                intersection() {
                    translate([d/2-25,d/3+25,0])
                    difference() {
                        cylinder(d=d,h=h,$fn=100);
                        cylinder(d=d-50,h=h*2.1,$fn=100,center=true);
                    }
                    translate([-28,0,0])
                    cube([d/2+10,210,h]);
                }
                translate([87,205,0])
                rotate([0,0,-40])
                cube([40,40,h*2.1],center=true);
            }
            chamfered_cube_side(28,35,h,3);
            translate([87,200,7.6/2])
            rotate([0,0,-40]) hull() {
                rounded_cube_side(42,50,7.6,8, center=true);
                translate([-2,-45,0])
                cube([5,1,7.6],center=true);
            }
             
        }
        translate([8,7,-0.1])
        cube([25,20.2,h+1]);

        translate([28,-0.1,-0.1])
        cube([70,50,h+1]);

        translate([0,7+20.2/2,h/2])
        rotate([0,90,0])
        cylinder(d=4.4,h=10,$fn=40);

        translate([57,204,7.6])
        rotate([45,0,-40])
        cube([50,40,40]);

        translate([69,125.9,-0.1])
        rotate([0,0,8.6])
        cube([40,40,40]);
        
        translate([87,200,-0.1])
        rotate([0,0,-40])
        translate([0,4.5,0])
        motor_plate_holes(8, center_chamfer=false);
    }
}

module _v2_joint_teeth(extra=0) {
    teeth = 44;
    step = 360/teeth;

    for (i=[0:teeth-1]) {
        rotate([45,0,step*i])
        cube([60,2+extra,2+extra],center=true);
    }
}

module _v2_joint_1(height=20) {
    h = height + sqrt(2*2*2)/2;

    difference() {
        cylinder(d=50,h=h,$fn=40);
        cylinder(d=25,h=h*3,center=true,$fn=40);

        translate([0,0,h])
        _v2_joint_teeth(extra=0.1);
    }
}

module _v2_joint_2(height=20) {

    difference() {
        union() {
            cylinder(d=50,h=height,$fn=40);

            translate([0,0,height])
            intersection() {
                _v2_joint_teeth();
                cylinder(d=50,h=height+5,$fn=40);
            }
        }
        translate([0,0,-1/2])
        v_screw(h=height+4,
                screw_d=nut_d,
                pitch=3,
                direction=0,
                steps=thread_steps,
                depth=0.4,
                chamfer=true);

        translate([0,0,height+1-13])
        cylinder(d2=27,d1=0,h=13.5,$fn=30);
        
    }
}

module mount_v2_2020_frame_clip() {
    h = 40;
    
    difference() {
        union() {
            chamfered_cube_side(28,35,h,3);

            translate([24,0,0])
            cube([15,35,20]);

            translate([55,35/2,0])
            _v2_joint_1();
        }

        translate([0,7,-0.1])
        cube([20,20.2,h+1]);

        translate([20/2,0,h/2])
        rotate([90,0,0])
        cylinder(d=4.4,h=80,center=true,$fn=40);
    }
}

module mount_v2_dollo_frame_clip() {
    h = 40;
    
    difference() {
        union() {
            difference() {
                translate([10/2,0,h/2])
                chamfered_cube_side(45,35,h,3,center=true);

                translate([45,0,20])
                cylinder(d=50.8,h=h,$fn=40);
            }

            translate([22,0,20/2])
            cube([15,35,20],center=true);

            translate([45,0,0])
            _v2_joint_1();
        }

        translate([-7,-7,h/2])
        cube([30,30.2,h+1],center=true);

        translate([-7,15-7])
        male_dovetail(h+1);

        translate([15-7,-7])
        rotate([0,0,-90])
        male_dovetail(h+1);

    }
}

module mount_v2_arm(length=120) {
    beam_l = length - 25;

    union() {
        _v2_joint_2();

        difference() {
            translate([beam_l/2+25/2,0,25/2])
            intersection() {
                union() {
                    difference() {
                        cube([beam_l,35,25],center=true);
                        cube([beam_l-10,23,26],center=true);
                    }
                    translate([-(4*25)/2,0,0])
                    for(i=[0:3]) {
                        translate([i*25,0,0])
                        rotate([0,0,-45])
                        cube([4,38,25],center=true);

                        translate([i*25,0,0])
                        rotate([0,0,45])
                        cube([4,38,25],center=true);

                    }
                }
                cube([beam_l,35,25],center=true);
            }

            translate([0,0,20])
            cylinder(d=50.8,h=20,$fn=40);

            translate([length,0,20])
            cylinder(d=50.8,h=20,$fn=40);
        }

        translate([120,0,0])
        _v2_joint_1();
    }
}

module _hex_head() {
    translate([0,0,13/2])
    hull() {
        // M24 corner to corner dia
        cylinder(d=41.57,h=10,center=true,$fn=6);
        cylinder(d=41.57-3,h=13,center=true,$fn=6);
    }
}

module mount_v2_bolt() {
    difference() {
        union() {
            cylinder(d=24.4, h=13+20-2,$fn=50);
            translate([0,0,13+20-2])
            v_screw(h=20+2+1,
                screw_d=bolt_d,
                pitch=3,
                direction=0,
                steps=thread_steps,
                depth=0.4,
                chamfer=true);
            
            _hex_head();
        }
        cylinder(d=2,h=200,center=true,$fn=10);

        step = 360/6;
        for(i=[0:5]) {
            rotate([0,0,i*step])
            translate([25/2-5,0,0])
            cylinder(d=1,h=200,center=true,$fn=10);
        }
    }
}

module mount_v2_nut() {
    difference() {
        _hex_head();
        v_screw(h=14,
                screw_d=nut_d,
                pitch=3,
                direction=0,
                steps=thread_steps,
                depth=0.4,
                chamfer=true);
        cylinder(d1=nut_d+9,d2=nut_d-8,h=16/2,center=true,$fn=40);

        translate([0,0,13])
        cylinder(d2=nut_d+9,d1=nut_d-8,h=16/2,center=true,$fn=40);
    }
}

module mount_v2_head_airtrippers() {

    difference() {
        union() {
            translate([0,0,10/2])
            hull() {
                translate([-25,0,0])
                cube([1,7,10],center=true);

                translate([20,0,0])
                cube([1,30,10],center=true);
            }
            
            translate([40,0,0])
            _v2_joint_2();
        }
        translate([-20.5,0,0]) {
            cylinder(d=4.4,h=12,$fn=40);

            translate([0,0,-0.01])
            M4_nut();

            translate([0,0,7])
            M4_nut();
        }

        translate([-29+8.5,0,0])
        rotate([0,0,15])
        translate([29,0,0]) {
            cylinder(d=4.4,h=12,$fn=40);

            translate([0,0,-0.01])
            M4_nut();

            translate([0,0,7])
            M4_nut();
        }

        translate([-29+8.5,0,0])
        rotate([0,0,-15])
        translate([29,0,0]) {
            cylinder(d=4.4,h=12,$fn=40);

            translate([0,0,-0.01])
            M4_nut();

            translate([0,0,7])
            M4_nut();
        }

    }
}

module mount_v2_motor_beam(length=200) {
    holes_x = (length - 50) / 10;
    holes_y = 4;
    x_offset = -(length - 50) / 2 + 10/2;
    y_offset = -40/2 + (40 - 30)/2 - 3;

    rotate([90,0,0])
    difference() {
        intersection() {
            union() {
                translate([-length/2,0,10])
                rotate([180,0,0])
                _v2_joint_1(height=10);

                translate([0,-3,10/2])
                cube([length-26,40,10],center=true);

                translate([0,-40/2-3+10/2,10/2])
                cube([length-15,10,10],center=true);

                translate([length/2,0,0])
                _v2_joint_1(height=10);
            }
            translate([0,60/2-40/2-3])
            cube([length+100,60,30],center=true);
        }

        for(i = [0:holes_x-1]) {
            for(j = [0:holes_y-1]) {
                translate([x_offset+i*10,y_offset+j*10,0])
                cylinder(d=4,h=30,center=true,$fn=40);
            }
        }
    }
}

module spanner() {
    difference() {
        union() {
            rounded_cylinder(55,12,3,$fn=90);

            hull() {
                translate([15,0,12/2])
                rotate([0,90,0])
                rounded_cube_side(12,40,1,3,center=true,$fn=45);

                translate([35,0,12/2])
                rotate([0,90,0])
                rounded_cube_side(12,25,1,3,center=true,$fn=45);
            }
            
            hull() {
                translate([35,0,12/2])
                rotate([0,90,0])
                rounded_cube_side(12,25,1,3,center=true,$fn=45);

                translate([120,0,0])
                rounded_cylinder(30,12,3,$fn=45);
            }
        }
        translate([0,0,-4])
        scale([1.01,1.01,2])
        _hex_head();

        translate([35,0,10]) {
            hull() {
                cylinder(d=17,h=5,$fn=30);

                translate([-35+120,0,0])
                cylinder(d=22,h=5,$fn=30);
            }
        }
    }
}

module debug_v2() {
    mount_v2_dollo_frame_clip();

    translate([45,0,41.5])
    rotate([180,0,0])
    mount_v2_arm();

    translate([45,0,-13])
    mount_v2_bolt();
}
