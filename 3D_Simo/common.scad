include <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "3D_Simo/"
);


module _orig_body_lock() {
    import(
        str(spath, "BODY LOCK.stl"),
        convexity=10
    );
}

module _orig_main_body() {
    import(
        str(spath, "MAIN BODY.stl"),
        convexity=10
    );
}

module _orig_3D_left() {
    import(
        str(spath, "3D LEFT.stl"),
        convexity=10
    );
}

module _orig_3D_right() {
    import(
        str(spath, "3D RIGHT.stl"),
        convexity=10
    );
}