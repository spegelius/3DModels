// Test model 1. Two models at he bottom. In between multi-model sections some space where
// only one model. One section with 4 models.

module testmodel1_part2() {
    translate([5,0,6]) cube([10,20,6]);
    translate([5,0,2]) cube([2,20,1]);
}

module testmodel1_part3() {
    intersection() {
        translate([10,10,1/2]) rotate([0,0,45]) cube([20,20,1],center=true);
        cube([20,20,26]);
    }
    translate([0,5,13]) cube([20,10,6]);
    translate([10,0,2]) cube([2,20,1]);
}

module testmodel1_part4() {
    translate([10,10,23]) rotate([0,0,45]) 
    intersection () {
        rotate([0,0,45]) cube([20,20,6], center=true);
        cube([10,30,6], center=true);
    }
    translate([15,0,2]) cube([2,20,1]);
}

module testmodel1_part1() {
    difference() {
        cube([20,20,26]);
        part2();
        part3();
        part4();
    }
}

module debug_testmodel1() {
    testmodel1_part1();
    translate([21,0,0]) testmodel1_part2();
    translate([42,0,0]) testmodel1_part3();
    translate([63,0,0]) testmodel1_part4(); 
}

debug_testmodel1();

//testmodel1_part1();
//testmodel1_part2();
//testmodel1_part3();
//testmodel1_part4();


// Test model2. 4 models starting from bottom. Models are different height, so at the top only one
// model.
testmodel2_d = 20;
module testmodel2_part1() {
    difference() {
        union() {
            cylinder(d=testmodel2_d,h=23,$fn=50);
            translate([0,-testmodel2_d/2,0]) cylinder(d=6,h=16,$fn=20);
        }
        testmodel2_part2();
        testmodel2_part3();
        testmodel2_part4();
    }
}

module testmodel2_part2() {
    translate([testmodel2_d/2,0,0]) cylinder(d=6,h=22,$fn=20);
}

module testmodel2_part3() {
    translate([0,testmodel2_d/2,0]) cylinder(d=6,h=19,$fn=20);
}

module testmodel2_part4() {
    translate([-testmodel2_d/2,0,0]) cylinder(d=6,h=16,$fn=20);
}

module debug_testmodel2() {
    testmodel2_part1();
    testmodel2_part2();
    testmodel2_part3();
    testmodel2_part4();
}

//debug_testmodel2();

//testmodel2_part1();
//testmodel2_part2();
//testmodel2_part3();
//testmodel2_part4();


// Test model 3. Only 1 model starts from bottom. Additional model are added as height goes up.
testmodel3_d = 20;
module testmodel3_part1() {
    difference() {
        union() {
            linear_extrude(testmodel3_d,convexity=10,twist=65) square(testmodel3_d, center=true);
            linear_extrude(testmodel3_d,convexity=10,twist=65) translate([-testmodel3_d/2,0]) square(5, center=true);
        }
        testmodel3_part2();
        testmodel3_part3();
        testmodel3_part4();
    }
}

module testmodel3_part2() {
    translate([0,0,3]) linear_extrude(testmodel3_d,convexity=10,twist=65) translate([testmodel3_d/2,0]) square(5, center=true);
}

module testmodel3_part3() {
    translate([0,0,6]) linear_extrude(testmodel3_d,convexity=10,twist=65) translate([0,testmodel3_d/2]) square(5, center=true);
}

module testmodel3_part4() {
    translate([0,0,9]) linear_extrude(testmodel3_d,convexity=10,twist=65) translate([0,-testmodel3_d/2,]) square(5, center=true);
}


//testmodel3_part1();
//testmodel3_part2();
//testmodel3_part3();
//testmodel3_part4();


// Test model 4. 3 models start from bottom, 2 of them are only 1 layer height. 4th model starts at 5mm
testmodel4_d = 20;
module testmodel4_part1() {
    difference() {
        cylinder(d=testmodel4_d, h=10,$fn=6);
        testmodel4_part2();
        testmodel4_part3();
        testmodel4_part4();
    }
}

module testmodel4_part2() {
    translate([testmodel4_d/2,0,0]) cylinder(d=10,h=0.2,$fn=6);
}

module testmodel4_part3() {
    translate([-testmodel4_d/2,0,0]) cylinder(d=10,h=0.2,$fn=6);
}
module testmodel4_part4() {
    translate([0,0,5]) cylinder(d=10,h=5.01,$fn=6);
}

//testmodel4_part1();
//testmodel4_part2();
//testmodel4_part3();
//testmodel4_part4();

module testmodel5_part1() {
    difference() {
        translate([0,0,25/2-2]) intersection() {
            sphere(d=25, $fn=40);
            cube([26,26,21],center=true);
        }
        testmodel5_part2();
    }
}

// Test model 5. Models have changing slopes, which should trigger variable layer heights in KISS,
// to test tower generation when thee are multiple layer heights in the print
module testmodel5_part2() {
    intersection() {
        difference() {
            translate([0,0,21/2]) rotate([0,20,0]) cube([5,30,21],center=true);
            translate([0,0,20]) rotate([0,110,0]) cylinder(d=20,h=30,center=true); 
        }
        translate([0,0,21/2]) cube([26,26,21],center=true);
    }
}

//testmodel5_part1();
//testmodel5_part2();

// Test model6. Intended for testing soluble supports. Support models are 2 and three. Model 2 can be
// same as main filament, model 3 is intended as soluble layer. This also allows for testing how much
// purge is needed for the soluble filament; if the main model breaks at the soluble layer heights,
// mor purge is needed
module testmodel6_part1() {
    difference() {
        translate([0,0,20/2]) cube([50,10,20], center=true);
        #translate([0,0,10/2]) cube([30,10,10], center=true);
        testmodel6_part3();
    }
}

module testmodel6_part2() {
    translate([0,0,10/2]) cube([29,10,10], center=true);
}

module testmodel6_part3() {
    translate([0,0,1/2+10]) cube([30,10,1], center=true);
}

//testmodel6_part1();
//testmodel6_part2();
//testmodel6_part3();