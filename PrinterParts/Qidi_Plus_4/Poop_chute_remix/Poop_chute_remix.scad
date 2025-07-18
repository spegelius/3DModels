use <../../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../../../_downloaded/";
spath = str(
    stl_base_path, "Qidi Plus 4/Qidi Plus 4 poop chute purge collector/"
);


//_orig_chute();

new_poop_chute();


module _orig_chute() {
    import(
        str(spath, "poop-chute-zem.stl"),
        convexity=10
    );
}

module new_poop_chute() {
    union() {
        rotate([90, 0, 0])
        _orig_chute();
    }
}