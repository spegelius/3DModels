include <../Dollo/NEW_long_ties/include.scad>;

module mock_can() {
    translate([0,0,5]) rounded_cylinder(56,106,10,$fn=80);
    //cylinder(d=66,h=116,$fn=100);
}

module koozie() {
    difference() {
        scale([1.05,1.05,1]) import("../_downloaded/Bomb_Koozie/PerrierBombKoozie.stl", convexity=10);
        cylinder(d=67,200,$fn=180);
        
    }
}

module koozie2() {
    difference() {
        union() {
            import("../_downloaded/CanBomb/CanBomb.stl", convexity=10);
            translate([0,0,-0.1]) cylinder(d=68,h=8,$fn=40);
        }
        cylinder(d1=60,d2=67,h=8,$fn=100);
    }
}

module debug() {
    intersection() {
        union() {
            //koozie();
            koozie2();
        }
        //translate([0,0,10]) cylinder(d=66,h=200);
        translate([0,-200/2,-20]) cube([200,200,200]);
    }
    %mock_can();
}


//debug();
//koozie();
koozie2();
