
module seagull() {
    //translate([-110,0,0]) import("../_downloaded/Seagull/SnavelMeeuw01.STL", convexity=10);
    import("../_downloaded/Seagull/tinkercadded.STL", convexity=10);
}

module human_head() {
    //translate([0,0,-270]) rotate([0,0,90]) import("../_downloaded/Head_model/head_model.STL", convexity=10);
    rotate([0,0,90]) import("../_downloaded/Head_model/tinkercadded.STL", convexity=10);
}

module seagull_beak() {
    scale([1.3,1.3,1.3]) rotate([50,0,0]) difference() {
        seagull();
        translate([]) rotate([40,0,0]) cube([90,180,105],center=true);
    }
}

module beak_nose_hole() {
    difference() {
        seagull_beak();
        translate([-1,14,-80]) human_head();
    }
}

//seagull();
//human_head();
//seagull_beak();
//beak_nose_hole();

module ear() {
    d = 8;
    difference() {
        hull() {
            cylinder(d=d,h=3,$fn=40);
            translate([-d/2,0,3/2]) cube([1,d,3],center=true);
        }
        cylinder(d=4,h=15,center=true,$fn=30);
    }
}

module tinkercad_beak() {
    scale([1.1,1.1,1.1]) union() {
        translate([-125,-125,0]) import("beak_tinkercad.STL", convexity=10);
        translate([21,0,2.3]) rotate([0,0,20]) rotate([0,-30,0]) ear();
        translate([-21.2,0,2.3]) rotate([0,0,160]) rotate([0,-30,0]) ear();
    }
}

tinkercad_beak();