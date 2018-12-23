use <../Dollo/NEW_long_ties/include.scad>;

module stepper_rod_support() {
    h = 8;
    
    bolt_d = 3.2;
    $fn=50;
    
    difference() {
        hull() {
            translate([-31/2, 31/2,0]) cylinder(d=9,h=h);
            translate([-2, -31/2,0]) cylinder(d=9,h=h);
            translate([31/2, -31/2,0]) cylinder(d=9,h=h);
            translate([31/2, 31/2,0]) cylinder(d=9,h=h);
        }
        translate([-31/2, 31/2,0]) cylinder(d=bolt_d,h=h+1);
        translate([31/2, 31/2,0]) cylinder(d=bolt_d,h=h+1);
        translate([31/2, -31/2,0]) cylinder(d=bolt_d,h=h+1);
        
        translate([-31/2, 31/2,5]) cylinder(d=6.3,h=h+1);
        translate([31/2, 31/2,5]) cylinder(d=6.3,h=h+1);
        translate([31/2, -31/2,5]) cylinder(d=6.3,h=h+1);
        
        cylinder(d=14, h=h+1);

        //cube([10,30,21], center=true);
        
        intersection() {
            rotate([0,0,45]) rounded_cube_side(26,26,h*2+1,12, center=true);
            translate([0,-15,0]) cube([40,30,h+1]);
        }
        
        translate([0,0,h/2-7/2]) union() {
            cylinder(d1=14,d2=16,h=1);
            translate([0,0,0.99]) cylinder(d=16,h=5.02);
            translate([0,0,1+5]) cylinder(d1=16,d2=14,h=1);
        }
    }
}

stepper_rod_support();