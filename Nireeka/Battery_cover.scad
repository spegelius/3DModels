
use <../Dollo/NEW_long_ties/include.scad>;

w = 26;
l = 41;
extra = 0.7;

we = w + extra;
le = l + extra;

h = 6.5;

flex_cover();


module flex_cover() {
    union() {
        difference() {
            translate([0,0,h/2])
            rounded_cube(we, le, h, 3, center=true, $fn=80);
            
            translate([0, 0,h/2+1.6])
            cube([we-5,le-5,h],center=true);
        }

        // clip
        translate([0, -le/2-7/2+2,1.5/2])
        cube([8,7,1.5],center=true);

        // ring
        translate([0,-le/2-15/2-7,2/2])
        intersection() {
            donut(20,3,$fn=60);
            cylinder(d=26,h=2,center=true,$fn=60);
        }

        // charging plug ring
        translate([w/2-13.9/2-4.1, -l/2+13.9/2+2.5,1])
        difference() {
            cylinder(d=18,h=h-1,$fn=50);
            cylinder(d=14,h=h+1,$fn=50);
        }

        // power button ring
        translate([w/2-13.9/2-4.1, l/2-13.9/2-4.9,1])
        difference() {
            cylinder(d=17,h=h-1,$fn=50);
            cylinder(d=14,h=h+1,$fn=50);
        }

        // charging plug nob
        translate([w/2-14.5+6/2, -l/2+10.5-6/2,1])
        difference() {
            hull() {
                cylinder(d=6,h=6.5,$fn=30);
                cylinder(d=5,h=7.5,$fn=30);
            }                
            cylinder(d=4,h=8,$fn=30);
        }
        
        translate([-we/2+5,l/2-13.9/2-4.9,h/2])
        cube([5,1,h],center=true);

        translate([we/2-3,l/2-13.9/2-4.9,h/2])
        cube([2,1,h],center=true);

        translate([-we/2+5,-l/2+13.9/2+2.5,h/2])
        cube([5,1,h],center=true);
    }
}