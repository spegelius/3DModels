module tube() {
    difference() {
        cylinder(d=10,h=10,$fn=50);
        cylinder(d=9,h=10,$fn=50);
    }
}

translate([-80,0,0]) tube();
translate([-40,0,0]) tube();
tube();
translate([40,0,0]) tube();
translate([80,0,0]) tube();
translate([0,0,1/2]) cube([170,2,1],center=true);