module original() {
    rotate([0,0,-29]) translate([-145,-146.5]) import("../_downloaded/Wire_Clip_20x20/Wire_Clip_for_20x20_500_profile.stl", convexity=3);
}

module _clip_jaws(h=40) {
    intersection() {
        scale([1,1,2]) original();
        translate([5,-20/2,0]) cube([20,20,h]);
    }
}

module wire_clip_20_40() {
    h = 40;
    union() {
        _clip_jaws(h);
        translate([-2.8,0,0]) difference() {
            cylinder(d=20,h=h,$fn=40);
            cylinder(d=16.5,h=h+1,$fn=40);
            translate([0,-5/2,0]) cube([20,5,h+1]);
        }
    }
}

module wire_clip_25x20_40() {
    h = 40;
    union() {
        _clip_jaws(h);
        translate([-2.8,0,0]) difference() {
            hull() {
                translate([-5,0,0]) cylinder(d=20,h=h,$fn=40);
                cylinder(d=20,h=h,$fn=40);
            }
            hull() {
                translate([-5,0,0]) cylinder(d=16.5,h=h+1,$fn=40);
                cylinder(d=16.5,h=h+1,$fn=40);
            }
            translate([0,-5/2,0]) cube([20,5,h+1]);
        }
    }
}

//translate([0,20,0]) original();
//wire_clip_20_40();
wire_clip_25x20_40();

