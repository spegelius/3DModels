
module U604zz() {
    difference() {
        cylinder(d=13,h=4, $fn=30);
        cylinder(d=4,h=5, $fn=20);
        translate([0,0,4/2]) donut(13,2.1);
    }
}

module 608zz() {
    difference() {
        cylinder(d=22,h=7,$fn=50);
        cylinder(d=8,h=8,$fn=50);
    }
}

module 623zz() {
    difference() {
        hull() {
            cylinder(d=9,h=4,$fn=40);
            translate([0,0,0.5]) cylinder(d=10,h=3,$fn=40);
        }
        cylinder(d=3,h=15,$fn=30,center=true);
    }
}

module MR105zz() {
    difference() {
        cylinder(d=10,h=4,$fn=40);
        translate([0,0,-1/2]) cylinder(d=5,h=5,$fn=30);
    }
}

module 625zz() {
    difference() {
        hull() {
            cylinder(d=15,h=5,$fn=40);
            translate([0,0,0.5]) cylinder(d=16,h=4,$fn=40);
        }
        cylinder(d=5,h=15,$fn=30,center=true);
    }
}