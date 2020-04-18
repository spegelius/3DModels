use <../Dollo/NEW_long_ties/include.scad>;

g3_8_d = 16.6;
g1_4_d = 13.3;

thread_slop = 0.4;

module fitting_adapter_Eheim() {
    // G3/8 outer, G1/4 inner
    difference() {
        union() {
            cylinder(d=17.5,h=6,$fn=50);

            translate([0,0,5])
            v_screw(h=10, screw_d=g3_8_d-thread_slop,
                    pitch=1.337, direction=0, steps=80);
            
            cylinder(d=21,h=4,$fn=6);
        }
        intersection() {
            v_screw(h=6, screw_d=g1_4_d+thread_slop,
                    pitch=1.337, direction=0, steps=70);
            cylinder(d1=11+2*6,d2=11,h=6,$fn=60);
        }
        cylinder(d=11,h=20,$fn=60);
    }
}

module debug() {
    intersection() {
        fitting_adapter_Eheim();
        translate([0,30/2,0])
        cube([30,30,60],center=true);
    }
}

//debug();
fitting_adapter_Eheim();
