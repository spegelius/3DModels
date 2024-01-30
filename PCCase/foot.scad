use <../Dollo/NEW_long_ties/include.scad>;


//debug_foot();

//foot();
//foot_dampener();

foot2();
//foot2_dampener();


module debug_foot() {
    intersection() {
        union() {
            foot();

            translate([0,0,-0.05])
            foot_dampener();
        }
        translate([0,50/2-14,0])
        cube([40,50,60],center=true);
    }
}

module foot() {
    difference() {
        intersection() {
            scale([1, 45/30, 1.5])
            sphere(d=36, $fn=80);

            cylinder(d=100, h=22);
        }

        translate([6, 0, 10 + 100/2])
        cube([30, 60, 100], center=true);

        translate([6, -60/2, 10])
        rotate([-90, 0, 0])
        male_dovetail(60);

        translate([10, 14, 2])
        sphere(d=6, $fn=40);

        translate([-10, 14, 2])
        sphere(d=6, $fn=40);

        translate([10, -14, 2])
        sphere(d=6, $fn=40);
        
        translate([-10, -14, 2])
        sphere(d=6, $fn=40);
    }
}

module foot_dampener() {
    difference() {
        union() {
            difference() {
                intersection() {
                    scale([1, 45/30, 1.5])
                    sphere(d=36, $fn=80);

                    translate([0, 0, -1.6])
                    cylinder(d=100, h=1.6);
                }

                intersection() {
                    scale([1, 45/30, 1.5])
                    sphere(d=20, $fn=80);

                    translate([0, 0, -3])
                    cylinder(d=100, h=4);
                }
            }
            translate([10, 14, 2])
            sphere(d=5.5, $fn=40);

            translate([-10, 14, 2])
            sphere(d=5.5, $fn=40);

            translate([10, -14, 2])
            sphere(d=5.5, $fn=40);
            
            translate([-10, -14, 2])
            sphere(d=5.5, $fn=40);
        }
        translate([10, 14, 1])
        cylinder(d=2, h=10, $fn=10);

        translate([-10, 14, 1])
        cylinder(d=2, h=10, $fn=10);

        translate([10, -14, 1])
        cylinder(d=2, h=10, $fn=10);
        
        translate([-10, -14, 1])
        cylinder(d=2, h=10, $fn=10);
    }
}

module foot2() {
    difference() {
        hull() {
            translate([0, 0, 2/2])
            chamfered_cube_side(
                30, 60, 2, 7, center=true
            );

            translate([0, 0, 10 - 1/2])
            chamfered_cube_side(
                30, 50, 1, 5, center=true
            );
        }

        translate([0, -60/2, 10])
        rotate([-90, 0, 0])
        male_dovetail(60);

        translate([9, 19, 2.4])
        sphere(d=6, $fn=40);

        translate([-9, 19, 2.4])
        sphere(d=6, $fn=40);

        translate([9, -19, 2.4])
        sphere(d=6, $fn=40);

        translate([-9, -19, 2.4])
        sphere(d=6, $fn=40);

    }
}

module foot2_dampener() {

    difference() {
        union() {
            translate([0, 0, -2/2])
            chamfered_cube_side(
                28, 58, 2, 7, center=true
            );

            translate([9, 19, 2])
            sphere(d=5.5, $fn=40);

            translate([-9, 19, 2])
            sphere(d=5.5, $fn=40);

            translate([9, -19, 2])
            sphere(d=5.5, $fn=40);

            translate([-9, -19, 2])
            sphere(d=5.5, $fn=40);

        }

        chamfered_cube(
            13, 40, 20, 5, center=true
        );

        translate([9, 19, 1])
        cylinder(d=2, h=10, $fn=10);

        translate([-9, 19, 1])
        cylinder(d=2, h=10, $fn=10);

        translate([9, -19, 1])
        cylinder(d=2, h=10, $fn=10);

        translate([-9, -19, 1])
        cylinder(d=2, h=10, $fn=10);

    }
}