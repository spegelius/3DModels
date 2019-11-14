include <../Dollo/NEW_long_ties/globals.scad>;
include <../Dollo/NEW_long_ties/include.scad>;

PTFE_tube_d = 4.3;
screw_d = 14;
render_thread = true;

module _holder_form() {
    union() {
        cylinder(d=7, h=20,$fn=50);
        translate([0,0,10])
          cube_donut(7,2,$fn=40);
        hull() {
            translate([0,0,20+11/2])
              rounded_cylinder(18-2,9,2, $fn=60);
            translate([0,0,19.99])
              cylinder(d=7,h=1, $fn=50);
        }
        translate([0,0,20+13/2+8])
          rotate([90,0,0])
          hull() {
              translate([-14.5-7/2+2/2,0,0])
                cylinder(d=2,h=3,center=true,$fn=20);
              translate([14.5+7/2-2/2,0,0])
                cylinder(d=2,h=3,center=true,$fn=20);
              translate([-20/2+2,-8,0])
                cylinder(d=2,h=2,center=true,$fn=20);
              translate([20/2-2,-8,0])
                cylinder(d=2,h=2,center=true,$fn=20);
          }
    }
}

module tube_holder() {
    t = sqrt(PTFE_tube_d*PTFE_tube_d/2)+0.2;
    difference() {
        union() {
            _holder_form();
            if (render_thread) {
                translate([0,0,20+13/2+7.99])
                  v_screw(h=20,
                          screw_d=screw_d,
                          pitch=2,
                          direction=0,
                          steps=70);
            } else {
                translate([0,0,20+13/2+7.99])
                  cylinder(h=20, d=screw_d);
            }
        }
        translate([0,0,20+13/2+8+20/2+2/2]) {
            cube([1,20,20],center=true);
            cube([20,1,20],center=true);
        }
        
        for(i=[0:9]) {
            rotate([0,0,360/10*i]) cube([t,t,160],center=true);
        }
    }
}

module tube_holder_nut() {
    inner_d = screw_d+3*slop;
    nut_d = screw_d+3;
    difference() {
        translate([0,0,2/2])
          union() {
              rounded_cylinder(nut_d,20-2,2, $fn=60);
              translate([0,0,15])
                rotate([90,0,0])
                hull() {
                    translate([-14.5-7/2+2/2,0,0])
                      cylinder(d=4,h=3,center=true,$fn=20);
                    translate([14.5+7/2-2/2,0,0])
                      cylinder(d=4,h=3,center=true,$fn=20);
                    translate([-20/2+2,-10,0])
                      cylinder(d=2,h=2,center=true,$fn=20);
                    translate([20/2-2,-10,0])
                      cylinder(d=2,h=2,center=true,$fn=20);
            }
          }
        translate([0,0,-0.1])
          intersection() {
            if (render_thread) {
                v_screw(h=21,
                        screw_d=inner_d,
                        pitch=2,
                        direction=0,
                        steps=70);
            } else {
                cylinder(d=inner_d,h=21);
            }
            cylinder(d1=inner_d,
                     d2=inner_d-1,
                     h=21,
                     $fn=60);
        }
        cylinder(d1=14,d2=12, h=2, $fn=60);
    }
}

module beveler_body() {
    h = 7+3.3;
    f_scale = 7.2/7;
    difference() {
        union() {
            translate([0,-3,(h)/2])
              rotate([90,0,0])
              cylinder(d=h, h=25, center=true, $fn=60);
            translate([-18/2,-24,0])
              cube([18,12,h]);
            difference() {
                translate([0,0,h/2])
                  rotate([0,0,45])
                  cube([30,30,h], center=true);
                translate([0,7,h])
                  rotate([0,0,45])
                  cube([30,30,h], center=true);
            }
        }
        
        translate([0,7,10/2+5])
          rotate([0,0,45])
          cube([30,30,10],center=true);
        
        translate([0,-13,5])
          rotate([-90,0,0])
          scale([f_scale,f_scale,1])
          _holder_form();
        translate([0,0,(h)/2])
          rotate([90,0,0])
          cylinder(d=PTFE_tube_d, h=145, center=true, $fn=60);

        translate([-20/2,-17.5,h/2-PTFE_tube_d/2])
          cube([20,0.5,20]);
        translate([-30/2,10,-1])
          cube([30,15,20]);
        
        translate([0,-2.5,h/2+7.3/2-1/2])
          cube([4,24,1],center=true);
        
        translate([-15,-2.75,h/2+10/2])
          rotate([0,0,45])
          cube([0.5,75,10], center=true);
        translate([15,-2.75,h/2+10/2])
          rotate([0,0,-45])
          cube([0.5,75,10], center=true);
        
        translate([9,3,0]) {
            if (render_thread) {
                v_screw(h=10,
                        screw_d=7+3*slop,
                        pitch=1.2,
                        direction=0,
                        steps=70);
            } else {
                cylinder(d=7+3*slop,h=10,$fn=30);
            }
        }
        translate([-9,3,0]) {
            if (render_thread) {
                v_screw(h=10,
                        screw_d=7+3*slop,
                        pitch=1.2,
                        direction=0,
                        steps=70);
            } else {
                cylinder(d=7+3*slop,h=10,$fn=30);
            }
        }    
    }
}

module beveler_body_top() {
    f_scale = 7.2/7;
    difference() {
        intersection() {
            translate([0,7,5/2])
              rotate([0,0,45])
              cube([30-slop,30-slop,5],center=true);
            translate([1.5,0,5/2])
              cube([60,20,5],center=true);
            translate([0,0,5/2])
              rotate([0,0,45])
              cube([30,30,5],center=true);
        }
        translate([9,3,0]) {
          cylinder(d=7.5,h=6,$fn=40);
          cylinder(d1=10,d2=7.5,h=1.25,$fn=40);
        }
        translate([-9,3,0]) {
          cylinder(d=7.5,h=6,$fn=40);
          cylinder(d1=10,d2=7.5,h=1.25,$fn=40);
        }
        translate([0,-13,5])
          rotate([-90,0,0])
          scale([f_scale,f_scale,1])
          _holder_form();
    }
}

module top_screw() {
    difference() {
        union() {
            hull() {
                rounded_cylinder(12,5,2,$fn=60);
                cylinder(d=7.4,h=7+2.25,$fn=50);
            }
            translate([0,0,9.2])
              v_screw(h=10-1.3,
                      screw_d=7,
                      pitch=1.2,
                      direction=0,
                      steps=70);
        }
        cylinder(d=1,h=20);
        for(i=[0:15]) {
            rotate([0,0,360/16*i])
              translate([14/2,0,0])
              rotate([0,0,45])
              cube([1,1,160],center=true);
        }
    }
}

module debug() {
    beveler_body();
    translate([0,0,10])
      rotate([0,180,0])
      beveler_body_top();
    translate([0,-13,5])
      rotate([-90,0,0])
      tube_holder();
}

//debug();

//tube_holder();
//tube_holder_nut();
//beveler_body();
beveler_body_top();
//top_screw();
