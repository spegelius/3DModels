
module part2() {
    translate([5,0,0]) cube([10,20,10]);
    translate([0,5,10]) cube([20,10,10]);
}



module part1() {
    difference() {
        cube([20,20,21]);
        part2();
    }
}

//part1();
part2();