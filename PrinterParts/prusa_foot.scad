$fn=50;


module prusa_foot() {
    difference() {
        union() {
            cylinder(d1=38, d2=27, h=13);
            translate([0,0,26/2]) cube([26, 22, 26], center=true);
        }
        translate([0,0,25/2+5]) cube([21.5, 18, 25], center=true);
        translate([-35/2,0,18/2+17]) rotate([0,90,0]) cylinder(d=18, h=35);
        translate([0,-35/2, 12+16/2]) rotate([-90,0,0]) cylinder(d=16, h=35);
    }
}

prusa_foot();