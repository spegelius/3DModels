module triangle() {
    rotate([90,0,0]) linear_extrude(height=5) {
        difference() {
            polygon(points=[[0,0],[0,70],[2,70], [70,2], [70,0]]);
            polygon(points=[[8,8],[8,52],[52,8]]);
        }
    }
}

union() {
    triangle();
    translate([0,-5,0]) rotate([0,0,90]) triangle();
}