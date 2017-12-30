$fn=40;

difference() {
    cube([155, 18.8, 80]);
    translate([110,-1,145]) rotate([-90,0,0]) hull() {
        cylinder(d=280,h=20, $fn=60);
        translate([50,-50,0]) cylinder(d=180,h=20, $fn=60);
    }
    translate([10, 5, 0]) cylinder(d=4, h=20);
    translate([10, 5, 4]) cylinder(d=8, h=50);
    translate([77, 11, 0]) cylinder(d=4, h=20);
    translate([77, 11, 4]) cylinder(d=8, h=50);
    translate([145, 5, 0]) cylinder(d=4, h=20);
    translate([145, 5, 4]) cylinder(d=8, h=50);
}

translate([0,10,10]) difference() {
    cube([30,5,100]);
    #translate([15,0,40]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([15,0,50]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([15,0,60]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([15,0,70]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([15,0,80]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([15,0,90]) rotate([-90,0,0]) cylinder(d=3, h=10);
}
    

translate([110,10,0]) difference() {
    cube([40,5,55]);
    #translate([10,0,10]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([10,0,20]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([10,0,30]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([10,0,40]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([10,0,50]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([30,0,10]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([30,0,20]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([30,0,30]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([30,0,40]) rotate([-90,0,0]) cylinder(d=3, h=10);
    #translate([30,0,50]) rotate([-90,0,0]) cylinder(d=3, h=10);

}