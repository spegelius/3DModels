
$fn=40;


difference() {
    union() {
        scale([1.7,1,1]) cylinder(d=20, h=58);
        translate([0,0,58]) hull() {
            scale([1.7,1,1]) cylinder(d=20, h=0.1);
            translate([0,0,7]) cylinder(d=6, h=1);
        }
    }
    translate([0,0,50-5]) cylinder(d=5, h=25);
}