use <../Dollo/NEW_long_ties/include.scad>;


//debug_testmodel1();

//testmodel1_part1();
//testmodel1_part2();
//testmodel1_part3();
//testmodel1_part4();


//debug_testmodel2();

//testmodel2_part1();
//testmodel2_part2();
//testmodel2_part3();
//testmodel2_part4();


//testmodel3_part1();
//testmodel3_part2();
//testmodel3_part3();
//testmodel3_part4();


//testmodel4_part1();
//testmodel4_part2();
//testmodel4_part3();
//testmodel4_part4();


//testmodel5_part1();
//testmodel5_part2();


//testmodel6_part1();
//testmodel6_part2();
//testmodel6_part3();


//testmodel7_part1();
//testmodel7_part2();
testmodel7_part3();


//testmodel8_part1();
//testmodel8_part2();
//testmodel8_part3();
//testmodel8_part4();



// Test model 1. Two models at he bottom. In between
// multi-model sections some space where
// only one model. One section with 4 models.
module testmodel1_part2() {
    color("red")
    union() {
        translate([5, 0, 6])
        cube([10, 20, 6]);

        translate([5, 0, 3])
        rotate([-90, 0, 0])
        cylinder(d=3, h=20, $fn=20);
    }
}

module testmodel1_part3() {
    color("yellow")
    union() {
        intersection() {
            translate([10, 10, 1/2])
            rotate([0, 0, 45])
            cube([20, 20, 1], center=true);

            cube([20, 20, 26]);
        }
        translate([0, 5, 16])
        rotate([0, 90, 0])
        hull() {
            translate([0, 9, 0])
            cylinder(d=6, h=20, $fn=30);

            translate([0, 3, 0])
            cylinder(d=6, h=20, $fn=30);
        }

        translate([10, 0, 3])
        rotate([-90, 0, 0])
        cylinder(d=3, h=20, $fn=20);
    }
}

module testmodel1_part4() {
    color("green")
    union() {
        translate([10, 10, 23])
        rotate([0, 0, 45]) 
        intersection () {
            rotate([0, 0, 45])
            cube([20, 20, 6], center=true);

            cube([10, 30, 6], center=true);
        }
        translate([15, 0, 3])
        rotate([-90, 0, 0])
        cylinder(d=3, h=20, $fn=20);
    }
}

module testmodel1_part1() {
    color("white")
    difference() {
        translate([0.01, 0.01, 0.01])
        cube([19.98, 19.98, 25.98]);
        testmodel1_part2();
        testmodel1_part3();
        testmodel1_part4();
    }
}

module debug_testmodel1() {
    testmodel1_part1();

    translate([21, 0, 0])
    testmodel1_part2();

    translate([42, 0, 0])
    testmodel1_part3();

    translate([63, 0, 0])
    testmodel1_part4(); 
}


// Test model2. 4 models starting from bottom. Models are different height, so at the top only one
// model.

testmodel2_d = 41;
testmodel2_step = 1.5;
testmodel2_step_d = testmodel2_d * PI/16 + 0.1;
testmodel2_h = 17 * testmodel2_step;

module testmodel2_part1() {
    difference() {
        union() {
            cylinder(
                d=testmodel2_d, h=testmodel2_h,
                $fn=50
            );

            for (i = [0:3]) {
                rotate([0, 0, i*90])
                translate([0, -testmodel2_d/2, 0])
                cylinder(
                    d=testmodel2_step_d,
                    h=testmodel2_step + i*4*testmodel2_step,
                    $fn=30
                );
            }
        }

        cylinder(
            d=testmodel2_d - 10, h=100,
            center=true, $fn=50
        );

        testmodel2_part2();
        testmodel2_part3();
        testmodel2_part4();
    }
}

module testmodel2_part2() {
    difference() {
        for (i = [0:3]) {
            rotate([0, 0, i*90 + 90/4])
            translate([0, -testmodel2_d/2, 0])
            cylinder(
                d=testmodel2_step_d,
                h=testmodel2_step*2 + i*4*testmodel2_step,
                $fn=30
            );
        }
        testmodel2_part3();
    }
}

module testmodel2_part3() {
    difference() {
        for (i = [0:3]) {
            rotate([0, 0, i*90 + 90/4 * 2])
            translate([0, -testmodel2_d/2, 0])
            cylinder(
                d=testmodel2_step_d,
                h=testmodel2_step*3 + i*4*testmodel2_step,
                $fn=30
            );
        }
        testmodel2_part4();
    }
}

module testmodel2_part4() {
    for (i = [0:3]) {
        rotate([0, 0, i*90 + 90/4 * 3])
        translate([0, -testmodel2_d/2, 0])
        cylinder(
            d=testmodel2_step_d,
            h=testmodel2_step*4 + i*4*testmodel2_step,
            $fn=30
        );
    }
}

module debug_testmodel2() {
    testmodel2_part1();
    testmodel2_part2();
    testmodel2_part3();
    testmodel2_part4();
}


// Test model 3. Only 1 model starts from bottom.
// Additional models are added as height goes up.

testmodel3_d = 25;
testmodel3_h = 30;

module testmodel3_part1() {
    difference() {
        union() {
            linear_extrude(
                testmodel3_h, convexity=10,
                twist=65
            )
            square(testmodel3_d, center=true);

            linear_extrude(
                testmodel3_h + 5, convexity=10,
                twist=75
            )
            translate([-testmodel3_d/2, 0])
            square(7, center=true);
        }
        testmodel3_part2();
        testmodel3_part3();
        testmodel3_part4();
    }
}

module testmodel3_part2() {
    rotate([0, 0, -7])
    translate([0, 0, 3])
    linear_extrude(
        testmodel3_h + 5, convexity=10, twist=75
    )
    translate([0, testmodel3_d/2, 0])
    square(7, center=true);
}

module testmodel3_part3() {
    rotate([0, 0, -14])
    translate([0, 0, 6])
    linear_extrude(
        testmodel3_h + 5, convexity=10, twist=75
    )
    translate([testmodel3_d/2, 0])
    square(7, center=true);
}

module testmodel3_part4() {
    rotate([0, 0, -21])
    translate([0, 0, 9])
    linear_extrude(
        testmodel3_h + 5, convexity=10, twist=75
    )
    translate([0, -testmodel3_d/2, 0])
    square(7, center=true);
}


// Test model 4. 3 models start from bottom, 1 of them are only 1 layer height. 4th model starts at 5mm

testmodel4_d = 25;

module testmodel4_part1() {
    difference() {
        cylinder(d=testmodel4_d, h=10, $fn=6);

        translate([0, 0, 16])
        sphere(d=20, $fn=12);

        testmodel4_part2();
        testmodel4_part3();
        testmodel4_part4();
    }
}

module testmodel4_part2() {
    translate([testmodel4_d/2, 0, 0])
    cylinder(d=14, h=1, $fn=6);
}

module testmodel4_part3() {
    translate([-testmodel4_d/2, 0, 0])
    cylinder(d=14, h=3, $fn=6);
}

module testmodel4_part4() {
    hull() {
        translate([0, 0, 5])
        cylinder(d=14, h=5.01, $fn=6);

        translate([0, 0, 12])
        cube([7, 7, 1], center=true);
    }
}


// Test model 5. Models have changing slopes, which
// should trigger variable layer heights in KISS,
// to test tower generation when there are multiple
// layer heights in the print

module testmodel5_part1() {
    difference() {
        translate([0, 0, 35/2 - 2])
        intersection() {
            sphere(d=35, $fn=40);

            cube([36, 36, 31], center=true);
        }

        testmodel5_part2();
    }
}

module testmodel5_part2() {
    intersection() {
        difference() {
            translate([0, 0, 31/2])
            rotate([0, 20, 0])
            cube([6, 40, 31], center=true);

            translate([0, 0, 18])
            rotate([0, 110, 0])
            cylinder(d=30, h=40, center=true); 
        }
        translate([0, 0, 31/2])
        cube([36, 36, 31], center=true);
    }
}


// Test model6. Intended for testing soluble supports.
// Support models are 2 and three. Model 2 can be
// same as main filament, model 3 is intended as soluble 
// layer. This also allows for testing how much
// purge is needed for the soluble filament; if the main 
// model breaks at the soluble layer heights,
// more purge is needed
module testmodel6_part1() {
    difference() {
        translate([0, 0, 25/2])
        cube([50, 20, 25], center=true);

        translate([0, 0, 15/2 + 18])
        cube([30, 25, 15], center=true);
        
        translate([0, 0, 10/2 - 3])
        cube([30, 25, 10], center=true);

        translate([0, -20/2, 0])
        cube([30, 10, 60], center=true);

        translate([0, 20/2, 0])
        cube([30, 10, 60], center=true);

        translate([0, -20/2 - 3, 0])
        rotate([45, 0, 0])
        cube([60, 10, 10], center=true);

        translate([0, -20/2 - 3, 25])
        rotate([45, 0, 0])
        cube([60, 10, 10], center=true);

        translate([0, 20/2 + 3, 0])
        rotate([45, 0, 0])
        cube([60, 10, 10], center=true);

        translate([0, 20/2 + 3, 25])
        rotate([45, 0, 0])
        cube([60, 10, 10], center=true);

        translate([0, -48, 25/2])
        rotate([0, 90, 0])
        cylinder(d=80, h=60, center=true, $fn=80);

        translate([0, 48, 25/2])
        rotate([0, 90, 0])
        cylinder(d=80, h=60, center=true, $fn=80);

    }
}

module testmodel6_part2() {
    translate([0, 0, 6/2])
    cube([29, 10, 6], center=true);
}

module testmodel6_part3() {
    translate([0, 0, -1/2 + 7])
    cube([30, 10, 1], center=true);
}


// Test model 7. Could be used to the supports, soluble
// or not.
module testmodel7_part1() {
    color("red")
    difference(){
        translate([0, 0, 44/2])
        sphere(d=28, $fn=60);

        testmodel7_part2();
        testmodel7_part3();
    }
}

module testmodel7_part2() {
    difference() {
        color("white")
        translate([0, 0, 44/2])
        rotate([90, 0, 0])
        cylinder(d=15, h=44, center=true,$fn=60);

        translate([0, 0, 44/2])
        cube([20, 20, 20], center=true);
    }
}

module testmodel7_part3() {
    difference() {
        color("green")
        cylinder(d=15, h=44, $fn=60);

        translate([0, 0, 44/2])
        cube([20, 20, 20], center=true);
    }
}




// Test model 8. 4 material model, created for
// testing thicc infill creation with varying tool
// changes per layer.
// - initially onyl one material
// - add another material when z = 5mm
// - add rest of the materials when z = 10mm
// Thicc infill should be under each tool change layer
// for each material
module testmodel8_part1() {
    difference() {
        union() {
            translate([80/2 - 15/2, 0, 0])
            cylinder(d=16, h=25, $fn=50);

            translate([-80/2 + 15/2, 0, 0])
            cylinder(d=16, h=25, $fn=50);

            translate([0, 80/2 - 15/2, 0])
            cylinder(d=16, h=25, $fn=50);

            translate([0, -80/2 + 15/2, 0])
            cylinder(d=16, h=25, $fn=50);
            
            translate([0, 0, 5])
            intersection() {
                tube(
                    d=80, h=20, wall=15,
                    center=false, $fn=50
                );

                translate([-50/2, -50/2, 0])
                cube([50, 50, 60], center=true);
            }
        }

        testmodel8_part2();
        testmodel8_part3();
        testmodel8_part4();
    }
}

module testmodel8_part2() {
    translate([0, 0, 5])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([50/2, -50/2, 0])
        cube([50, 50, 60], center=true);
    }

    translate([0, 0, 21])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([50/2, -50/2, 0])
        cube([50, 50, 60], center=true);
    }
}

module testmodel8_part3() {
    translate([0, 0, 10])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([50/2, 50/2, 0])
        cube([50, 50, 60], center=true);
    }

    translate([0, 0, 21])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([50/2, 50/2, 0])
        cube([50, 50, 60], center=true);
    }
}

module testmodel8_part4() {
    translate([0, 0, 10])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([-50/2, 50/2, 0])
        cube([50, 50, 60], center=true);
    }

    translate([0, 0, 15.4])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([-50/2, 50/2, 0])
        cube([50, 50, 60], center=true);
    }

    translate([0, 0, 21])
    intersection() {
        tube(d=80, h=3, wall=15, center=false, $fn=50);

        translate([-50/2, 50/2, 0])
        cube([50, 50, 60], center=true);
    }
}