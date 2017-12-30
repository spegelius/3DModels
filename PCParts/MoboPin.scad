$fn=30;

%difference() {
    translate([0,0,0.8/2]) cube([50,50,0.8], center=true);
    translate([0,0,-0.1]) cylinder(d=5, h=1, $fn=30);
}

module triangle(x,y,z) {
    points=[[x/2,-z/2],
            [0.05,z/2],
            [-0.05,z/2],
            [-x/2,-z/2]];
    rotate([90,0,0]) translate([0,0,-y/2]) linear_extrude(height=y) polygon(points=points);
}

translate([0,0,0.8]) difference() {
    union() {
        translate([0,0,-1.8]) cylinder(d=10, h=1, $fn=30);
        translate([0,0,-0.8]) cylinder(d=4.5, h=0.8, $fn=30);
        intersection() {
            cube([7,4,8], center=true);
            hull() {
                cylinder(d=6, h=1);
                translate([0,0,2]) cylinder(d=5, h=1);
            }
        }
        translate([0,0,3]) intersection() {
            cylinder(d=5, h=3);
            cube([7,4,8], center=true);
        }
        
        translate([0,0,6]) cylinder(d=3,h=2);

        translate([0,0,8]) intersection() {
            hull() {
                cylinder(d=4,h=1);
                translate([0,0,7-2.5/2]) sphere(d=2.5);
            }
            cube([7,2.6,14], center=true);
        }
    }
    
    //translate([-2,0,1.8]) rotate([0,5,0]) cube([0.5,7,4],center=true);
    //translate([2,0,1.8]) rotate([0,-5,0]) cube([0.5,7,4],center=true);
    
    //translate([-1.25,0,8.5]) rotate([0,8,0]) cube([0.5,7,5],center=true);
    //translate([1.25,0,8.5]) rotate([0,-8,0]) cube([0.5,7,5],center=true);
    
    //cube([1,12,8], center=true);
    //translate([0,0,9]) cube([0.6,12,7], center=true);
    
    translate([0,0,-1]) cube([1.5,12,4], center=true);
    translate([0,0,2.5]) triangle(1.5,12,3);
    translate([0,0,6.6]) cube([1,12,3], center=true);
    translate([0,0,10.5]) triangle(1,12,5);
}


