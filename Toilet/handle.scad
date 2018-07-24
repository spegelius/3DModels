
length = 32;
h = 15;
dia = 12;
screw_d = 2.5;

module handle() {
    difference() {
        union() {
            translate([0,0,h]) hull() {
                sphere(d=dia, $fn=40);
                translate([0,length,0]) sphere(d=dia, $fn=40);
            }
            cylinder(d=dia,h=h,$fn=40);
            translate([0,length,0]) cylinder(d=dia,h=h,$fn=40);
            translate([-dia/2/2,0,0]) cube([dia/2,length,h]);
        }
        cylinder(d=screw_d,h=h,$fn=40);
        translate([0,length,0]) cylinder(d=screw_d,h=h,$fn=40);
    }
}

handle();