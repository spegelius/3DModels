// Based on: https://www.thingiverse.com/thing:831597

// Clone this somewhere: https://github.com/spegelius/Dollo.git
use <../Dollo/NEW_long_ties/include.scad>;

//translate([-50,30,0]) import("../_downloaded/100mm_Caliper/slider.stl");
//translate([-50,30,0]) import("../_downloaded/100mm_Caliper/body_mm.stl");
//translate([-50,30,0]) import("../_downloaded/100mm_Caliper/nut_mm.stl");
//translate([-50,30,0]) import("../_downloaded/100mm_Caliper/dial_mm.stl");


////// VARIABLES \\\\\\
height = 200;
body_d = 35;
body_side = body_d * 0.7;
body_pitch = 2;

//render_thread = false;
render_thread = true;
thread_resolution = 80;

arm_length = 120;
arm_h = 12;
arm_end = body_d * 0.3;

inside_arm_h = 6;
inside_arm_length = 25;

slop = 0.2;
thread_slop = 0.3;

////// VIEW \\\\\\
//debug_nut_dial();
//debug_body_slider();
//debug_body_slider2();

//test_parts();
body();
//slider();
//nut();
//dial();

////// MODULES \\\\\\

module _arm() {
    difference() {
        union() {
            chamfered_cylinder(body_d+8,arm_h,1.5,$fn=80);
            translate([0,-(arm_end*1.5)/2,0]) hull() {
                translate([-arm_length,arm_end/2,arm_h/2])
                cube([1,arm_end,arm_h],center=true);
                
                translate([(-body_d+8)/2,(arm_end*1.5)/2,arm_h/2])
                cube([2,arm_end*1.5,arm_h],center=true);
            }
            translate([-arm_length+arm_end/2,arm_end/2-(arm_end*1.5)/2,arm_h])
            cylinder(d=arm_end*0.9,h=3,center=true,$fn=50);
        }
        translate([-arm_length-arm_h*0.5,0,0])
        rotate([0,45,0])
        cube([arm_h*1.5,arm_end*2,arm_h*1.5],center=true);
    }
}

module _shaft(slop=0, thread=false) {
    d = body_d + slop;
    side = body_side + slop;
    intersection() {
        if (thread) {
            v_screw(h=height,
                    screw_d=body_d,
                    pitch=body_pitch,
                    direction=0,
                    steps=thread_resolution);
        } else {
            cylinder(d=d, h=height,$fn=80);
        }
        difference() {
            translate([0,0,height/2])
            cube([d,side,height], center=true);
            
            translate([-body_d/6,body_side*0.5,height/2])
            cube([body_d*0.15-slop,body_d*0.25-slop,height],center=true);
            
            translate([-body_d/6,-body_side*0.5,height/2])
            cube([body_d*0.15-slop,body_d*0.25-slop,height],center=true);
        }
        cylinder(d1=height*2+d/2-2,
                 d2=0,
                 h=height+d/2-2,
                 $fn=80);
    }
}

module _inside_arm() {
    difference() {
        translate([inside_arm_length/2,0,inside_arm_h/2])
        cube([inside_arm_length,2,inside_arm_h],center=true);

        translate([5,-0.4,0])
        rotate([-25,0,0])
        cube([inside_arm_length,2,inside_arm_h]);
        
        translate([inside_arm_length-inside_arm_h*1.5,-2,inside_arm_h])
        rotate([0,30,0])
        cube([15,4,inside_arm_h]);
        
    }
}

module body(thread=false) {
    
    module _scale() {
        marks = height - arm_h - 11;
        h_offset = arm_h + 1.5 - 0.4/2;
        for(i = [0:marks]) {
            translate([body_d/2*0.5,body_side/2,h_offset+i]) cube([3,1,0.4],center=true);
        }
        
        marks_10 = floor(marks/10);
        for(i = [0:marks_10]) {
            translate([body_d/2*0.5-1/2,body_side/2,h_offset+i*10]) cube([4,1,0.4],center=true);
            
            translate([body_d/2*0.5-6.5,body_side/2-1/2,h_offset+i*10])
            rotate([-90,-90,0])
            linear_extrude(1)
            text(str(i*10), size=3, halign="center");
        }
    }
    
    module _body_inside_arm() {
        translate([(body_d+8)/2+0.5,2/2+0.1,0])
        difference() {
            union() {
                translate([0,0,arm_h+inside_arm_h+1.5])
                _inside_arm();
                translate([7/2-2,0,arm_h/2])
                cube([7,2,arm_h],center=true);
                translate([5/2,0,(arm_h+inside_arm_h+1.5)/2])
                cube([5,2,arm_h+inside_arm_h+1.5],center=true);
            }
            translate([2,-2,0])
            rotate([0,45,0])
            cube([5,4,5]);
        }
        // support
        translate([(body_d+8)/2+5.7,0.1,0]) {
            cube([inside_arm_length-5,0.55,arm_h+inside_arm_h+1.3]);
            cube([0.55,3,arm_h+inside_arm_h-5]);
        }
    }
    
    union() {
        difference() {
            _shaft(slop=0, thread=render_thread);
            _scale();
        }
        _arm();
        _body_inside_arm();
    }
}

module slider() {
    difference() {
        union() {
            intersection() {
                translate([0,0,arm_h])
                mirror([0,0,1])
                _arm();
                translate([0,0,100/2])
                cube([500,200,100],center=true);
            }
            cylinder(d=body_d-body_pitch,h=35,$fn=70);
            translate([0,0,35])
            intersection() {
                translate([0,0,-1])
                chamfered_cylinder(body_d+body_pitch,4,1,$fn=70);
                hull() {
                    cylinder(d=body_d-body_pitch,h=1,$fn=70);
                    translate([0,0,body_pitch/3])
                    cylinder(d=body_d+body_pitch,h=5,$fn=70);
                }
            }
            
            translate([(body_d+8)/2+0.5,-2/2-0.1,inside_arm_h])
            rotate([180,0,0])
            _inside_arm();
            translate([(body_d+8)/2,-2/2-0.1,inside_arm_h/2])
            cube([5,2,inside_arm_h],center=true);
        }
        translate([0,0,-1]) _shaft(slop=slop, thread=false);
        
        translate([body_d/2,0,35])
        cube([10,body_side+slop,10],center=true);
        translate([-body_d/2,0,35])
        cube([10,body_side+slop,10],center=true);
        
        translate([0,(body_d+8)/2+0.5,arm_h/2+2])
        rotate([90,0,0])
        linear_extrude(1)
        polygon(points=[[-1.3,0],[0,3],[1.3,0]]);

    }
}

module nut() {
    thread_d = body_d + thread_slop;
    
    difference() {
        union() {
            chamfered_cylinder(body_d+5,35-arm_h,1,$fn=70);
            chamfered_cylinder(body_d+10,35-arm_h-10,1,$fn=70);
        }
        if(render_thread) {
            v_screw(h=35,
                    screw_d=thread_d,
                    pitch=body_pitch,
                    direction=0,
                    steps=thread_resolution);
        } else {
            cylinder(d=thread_d,h=35,$fn=70);
        }
        for(i=[0:29]) {
            translate([0,0,(35-arm_h-10)/2])
            rotate([0,0,360/30*i])
            rotate([0,45,0])
            scale([1.5,1,1])
            cube_donut(body_d+10,0.7,$fn=100);
        }
    }
}

module dial() {
    steps = body_pitch*10;
    inner_d = body_d+5+2*slop;
    outer_d = inner_d + 3;
    step = body_pitch/10;

    difference() {
        cylinder(d=outer_d,h=10,$fn=70);
        cylinder(d=inner_d,h=11,$fn=70);
        for(i=[0:steps-1]) {
            rotate([0,0,360/steps*i])
            translate([outer_d/2,0,10-3/2])
            cube([1,0.5,3],center=true);
        }
        for(i=[0:(steps-1)/2]) {
            rotate([0,0,360/(steps/2)*i])
            translate([outer_d/2-1/2,0,10-3])
            rotate([0,90,0])
            linear_extrude(1)
            text(str(i*step), size=3, valign="center");
        }
    }
}


module test_body() {
    intersection() {
        body();
        translate([0,0,20+10/2])
        cube([body_d+5,body_d+5,10],center=true);
    }
}

module test_slider() {
    intersection() {
        slider();
        cylinder(d=body_d+8,h=10);
    }
}

module test_parts() {
    nut();
    
    translate([body_d+7,0,-20])
    test_body();
    
    translate([0,body_d+10,0])
    test_slider();
    
    translate([body_d+10,body_d+10,0])
    dial();
}

module debug_nut_dial() {
    intersection() {
        nut();
        translate([0,0,15])
        cylinder(d=2*body_d,h=15);
    }
    
    translate([0,0,10])
    dial();
}

module debug_body_slider() {
    translate([0,0,-arm_h-1])
    intersection() {
        body();
        translate([0,0,arm_h/2+arm_h+1])
        cube([100,100,arm_h],center=true);
    }
    slider();
}

module debug_body_slider2() {
    intersection() {
        body();
        translate([0,0,70/2])
        cube([400,100,70],center=true);
    }
    translate([0,0,arm_h+1.5])
    slider();
}
