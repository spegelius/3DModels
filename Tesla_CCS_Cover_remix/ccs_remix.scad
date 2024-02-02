
stl_path = "../_downloaded/Tesla/CCS cover/";


//_orig_body();

new_body();

module _orig_body() {
    import(str(
        stl_path, "Body.stl"
    ), convexity=10);
}

module new_body() {

    //%_orig_body();

    translate([0, 1, 0])
    import(str(
        stl_path, "Body_tk.stl"
    ), convexity=10);
}