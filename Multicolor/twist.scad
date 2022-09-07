
$fn = 40; 

//twube_1();
//twube_2();
//twube_3();
twube_4();


module twube_1() {
    linear_extrude(10, convexity=10, twist=45)
    square(10);
}

module twube_2() {
    rotate([0, 0, 90])
    twube_1();
}

module twube_3() {
    rotate([0, 0, 180])
    twube_1();
}

module twube_4() {
    rotate([0, 0, 270])
    twube_1();
}