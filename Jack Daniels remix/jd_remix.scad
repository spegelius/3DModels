
//white();
black();

module white() {
    translate([0,0,1.8])
    scale([1,1,2.6755])
    import("../_downloaded/Jack Daniel's coasters/White_dual.stl");

    // for scaling
    //cylinder(d=5,h=1.6);
}

module black() {
    difference() {
        intersection() {
            scale([1,1,4])
            hull()
            import("../_downloaded/Jack Daniel's coasters/White_dual.stl");

            cylinder(d=200,h=2);
        }
        white();
    }
}