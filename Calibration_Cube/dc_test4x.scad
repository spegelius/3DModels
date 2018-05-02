
module part2() {
    translate([5,0,6]) cube([10,20,6]);
    translate([5,0,2]) cube([2,20,1]);
}

module part3() {
    translate([0,5,13]) cube([20,10,6]);
    translate([10,0,2]) cube([2,20,1]);
}

module part4() {
    translate([10,10,23]) rotate([0,0,45]) 
    intersection () {
        rotate([0,0,45]) cube([20,20,6], center=true);
        cube([10,30,6], center=true);
    }
    translate([15,0,2]) cube([2,20,1]);
}

module part1() {
    difference() {
        cube([20,20,26]);
        part2();
        part3();
        part4();
    }
}

//part1();
//part2();
//part3();
part4();