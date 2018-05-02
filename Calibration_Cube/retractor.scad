$fn=30;

bottom_h = 0.2;

pillar_d = 3;

module part1() {
    translate([-1.5,-1.5,0]) cube([38,21,bottom_h]);
    translate([0,0,bottom_h]) cylinder(d=pillar_d, h=10);
    translate([5,10,bottom_h]) cylinder(d=pillar_d, h=10);
    translate([15,10,bottom_h]) cylinder(d=pillar_d, h=10);
    translate([25,12,bottom_h]) cylinder(d=pillar_d, h=10);
}

module part2() {
    translate([5,18,bottom_h]) cylinder(d=pillar_d, h=10);
    translate([35,10,bottom_h]) cylinder(d=pillar_d, h=10);
    translate([25,0,bottom_h]) cylinder(d=pillar_d, h=10);
    translate([15,1,bottom_h]) cylinder(d=pillar_d, h=10);
}

module retractor() {
    union() {
        part1();
        part2();
    }
}

//retractor();
part1();
//part2();
