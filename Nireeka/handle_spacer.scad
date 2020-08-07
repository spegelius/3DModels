
// for the phone holder
difference() {
    cylinder(d=32.5,h=15,$fn=40);
    cylinder(d=22,h=50,center=true,$fn=40);

    translate([0,10,0])
    cube([10,20,50],center=true);
    
}