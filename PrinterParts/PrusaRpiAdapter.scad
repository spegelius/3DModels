
difference() {
    //translate([0,0,4/2]) cube([48,45,4],center=true);
    union() {
        hull() {
            translate([-43/2,-20,0]) cylinder(d=10,h=6,$fn=40);
            translate([43/2,20,0]) cylinder(d=10,h=6,$fn=40);
        }
        hull() {
            translate([43/2,-20,0]) cylinder(d=10,h=6,$fn=40);
            translate([-43/2,20,0]) cylinder(d=10,h=6,$fn=40);
        }

    }
    
    translate([-43/2,-20,-0.01]) cylinder(d=3.3,h=7,$fn=20);
    translate([-43/2,20,-0.01]) cylinder(d=2.8,h=7,$fn=20);
    
    translate([-43/2,-20,4]) cylinder(d=7,h=7,$fn=20);
    translate([43/2,-20,4]) cylinder(d=7,h=7,$fn=20);
    
    translate([43/2,-20,-0.01]) cylinder(d=3.3,h=7,$fn=20);
    translate([43/2,20,-0.01]) cylinder(d=2.8,h=7,$fn=20);

}