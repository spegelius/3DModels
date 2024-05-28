
stl_path = "../_downloaded/Tesla/CCS cover/";


_orig_body();
//_orig_logo();
//_ps_logo();
//_tk_body();
//_tk_logo();

//new_body();
//new_logo();

module _orig_body() {
    import(str(
        stl_path, "Body.stl"
    ), convexity=10);
}

module _orig_logo() {
    import(str(
        stl_path, "Logo.stl"
    ), convexity=10);
}

module _ps_logo() {
    import(str(
        stl_path, "Logo_ps.stl"
    ), convexity=10);
}

module _tk_body() {
    _orig_body();

    translate([-35, 20, 1/2])
    cube([2, 2, 1], center=true);

    translate([35, 20, 1/2])
    cube([2, 2, 1], center=true);

    translate([0, -20, 1/2])
    cube([2, 2, 1], center=true);
}

module _tk_logo() {
    _orig_logo();

    translate([-35, 22, 2/2])
    cube([3, 3, 2], center=true);

    translate([35, 22, 2/2])
    cube([3, 3, 2], center=true);

    translate([0, -22, 2/2])
    cube([3, 3, 2], center=true);
}


module new_body() {
    difference() {
        _orig_body();
        new_logo();
    }

    
}

module new_logo() {
    _orig_logo();

}