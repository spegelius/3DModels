use <../Dollo/NEW_long_ties/include.scad>;

module battery_1() {
    h = 180;
    difference() {
        union() {
            translate([0,-72/2+2/2,h/2])
            cube([84,2,180],center=true);

            translate([0,0,h/2])
            intersection() {
                translate([0,0,-3/2])
                rounded_cube(80,72,h+3,4,center=true,$fn=30);

                cube([80,72,h],center=true);
            }

            translate([0,-72/2+7/2+19,h])
            difference() {
                hull() {
                    translate([0,0,7.5-7/2])
                    rotate([0,90,0])
                    cylinder(d=7,h=12.5,center=true,$fn=30);

                    cube([12.5,7,1],center=true);
                }
                translate([0,0,5.5])
                cube([13,0.1,0.2],center=true);
                translate([0,0,3.75])
                cube([13,0.1,0.2],center=true);
                translate([0,0,2])
                cube([13,0.1,0.2],center=true);
            }

            translate([0,-72/2+7/2+19+10+12/2+7/2,h])
            difference() {
                hull() {
                    translate([0,2,8-4/2])
                    rotate([0,90,0])
                    cylinder(d=4,h=13,center=true,$fn=30);

                    translate([0,-2,8-4/2])
                    rotate([0,90,0])
                    cylinder(d=4,h=13,center=true,$fn=30);

                    translate([0,0,-1/2])
                    cube([13,12,1],center=true);
                }
                translate([0,1,5.5])
                cube([14,0.1,0.2],center=true);
                translate([0,1.2,3.75])
                cube([14,0.1,0.2],center=true);
                translate([0,1.4,2])
                cube([14,0.1,0.2],center=true);

                translate([0,-1,5.5])
                cube([14,0.1,0.2],center=true);
                translate([0,-1.2,3.75])
                cube([14,0.1,0.2],center=true);
                translate([0,-1.4,2])
                cube([14,0.1,0.2],center=true);
            }
        }

        cylinder(d=20,h=160);
        
        translate([25,20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([-25,20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([25,-20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([-25,-20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([0,72/2-18/2,h-16/2])
        cube([42.5,18,16],center=true);
    }
}

module battery_2() {
    h = 189;
    difference() {
        union() {
            translate([0,-72/2+2/2,h/2])
            cube([84,2,h],center=true);

            translate([0,0,h/2])
            intersection() {
                translate([0,0,-3/2])
                rounded_cube(80,72,h+3,4,center=true,$fn=30);

                cube([80,72,h],center=true);
            }
        }
        
        translate([0,-72/2,h+10/2])
        rotate([-2.5,0,0])
        cube([85,80,10],center=true);

        translate([0,-72/2+34.5,h+20/2-1.4])
        rotate([-15.5,0,0])
        cube([85,180,20],center=true);

        cylinder(d=20,h=160);
        
        translate([25,20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([-25,20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([25,-20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([-25,-20,0])
        cylinder(d=15,h=25,$fn=40);

        translate([80/2-20-11/2,-72/2+26+11/2,0])
        cylinder(d=1,h=h-20,$fn=30);

        translate([80/2-20-11/2,-72/2+26+11/2,h-20])
        cylinder(d1=1, d2=8,h=10,$fn=30);

        translate([80/2-20-11/2,-72/2+26+11/2,h-9])
        cylinder(d=11,h=9,$fn=30);

        translate([0,-72/2,50])
        rotate([-90,0,0])
        cylinder(d=7,h=40);

        translate([0,-72/2,100])
        rotate([-90,0,0])
        cylinder(d=7,h=40);

        translate([0,-72/2,150])
        rotate([-90,0,0])
        cylinder(d=7,h=40);
    }
}

module smoll_rod() {
    difference() {
        cylinder(d=14.5,h=45,$fn=30);
        cylinder(d=2,h=46,$fn=30);
    }
}

module long_rod() {
    intersection() {
        translate([0,0,19.5/2-1.5])
        rotate([0,90,0])
        difference() {
            cylinder(d=19.5,h=200,center=true,$fn=20);
            cylinder(d=3,h=201,center=true,$fn=20);
        }

        translate([0,0,20/2])
        cube([200,20,20],center=true);
    }
}

module handle() {
    module screw_hole() {
        union() {
            cylinder(d=4.2,h=5,$fn=40);

            translate([0,0,3.01])
            cylinder(d1=4.2,d2=8.2,h=2,$fn=30);
        }
    }

    difference() {
        translate([0,0,5/2])
        union() {
            rounded_cube_side(50,35,5,5,center=true,$fn=40);

            intersection() {
                rotate([90,0,0])
                donut(42,8,$fn=80);

                translate([0,0,50/2])
                cube([50,20,50],center=true);
            }
        }
        translate([50/2-5,35/2-5,0])
        screw_hole();

        translate([50/2-5,-35/2+5,0])
        screw_hole();

        translate([-50/2+5,-35/2+5,0])
        screw_hole();

        translate([-50/2+5,35/2-5,0])
        screw_hole();
    }
}

//battery_1();
//battery_2();
//smoll_rod();
//rotate([0,0,45])
//long_rod();
handle();
