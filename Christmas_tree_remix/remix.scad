use <../lib/includes.scad>;
use <../Dollo/NEW_long_ties/include.scad>;

module stand() {
    
    module leg() {
        intersection() {
            translate([-70,0,-3]) rotate([0,45,0]) cylinder(d=15,h=100,$fn=10);
            translate([0,0,200/2]) cube([200,200,200],center=true);
        }
        
    }
    difference() {
        union() {
            for(i = [0:2]) {
                rotate([0,0,120*i]) leg();
            }
            translate([0,0,57]) cylinder(d1=17,d2=27,h=10,$fn=40);
            translate([0,0,66]) cylinder(d=23,h=11,$fn=40);
            translate([0,0,66.9]) v_screw(h=10.1, screw_d=26.5, pitch=3, direction=0, steps=50);
            translate([0,0,63]) g9_lamp_socket(54);
            
        }
        //translate([0,0,47]) cylinder(d1=8,d2=15,h=30,$fn=30);
        translate([14/2-3.3/2,1.15,47]) cylinder(d=3.3,h=30,$fn=30);
        translate([-14/2+3.3/2,1.15,47]) cylinder(d=3.3,h=30,$fn=30);
    }
}

module center() {
    difference() {
        union() {
            translate([-72.5,-73.4,0]) import("../_downloaded/Christmas_tree/short_base_center.stl");
            cylinder(d=31.5,h=10,$fn=40);
        }
        translate([0,0,-1]) v_screw(h=13, screw_d=27, pitch=3, direction=0, steps=50);
    }
}

module screw_cap() {
    h = 8;
    d = 7;
    difference() {
        intersection() {
            union() {
                cylinder(d=d,h=h,$fn=30);
                for(i=[0:9]) {
                    rotate([0,0,360/10*i])
                    translate([d/2,0,0]) cylinder(d=3,h=h,$fn=20);
                }
            }
            chamfered_cylinder(d+3,h,0.8,$fn=30);
        }
        M3_nut(3.4,cone=false, bridging=true);
        cylinder(d=3.3,h=h+1,$fn=20);
        translate([0,0,4.6]) cylinder(d=6.5,h=h,$fn=30);
    }
}

module screw_washer() {
    difference() {
        cylinder(d=6.2,h=3,$fn=40);
        cylinder(d=2.9,h=3,$fn=40);
    }
}

//import("../_downloaded/Christmas_tree/tree_trunk_texture.stl");
//import("../_downloaded/Christmas_tree/short_base_set.stl");
//import("../_downloaded/Christmas_tree/short_base_center.stl");


//mock_g9_lamp();
//g9_lamp_socket();
//stand();
//center();
screw_cap();
//screw_washer();