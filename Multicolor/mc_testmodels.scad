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

//testmodel1_debug();

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
testmodel2_part4();
