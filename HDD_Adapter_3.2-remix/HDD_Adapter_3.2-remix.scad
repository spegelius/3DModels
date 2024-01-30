
stl_base_path = "../_downloaded/";
adapter_stl_path = str(
    stl_base_path,
    "HDD Adapter 3.2/"
);

supports();


module supports() {
    %import(str(
        adapter_stl_path,
        "hdd_adapter_32_sunk_screwholes.stl"
    ), convexity=10);

    module _supports() {
        #translate([0.5, -11, 0])
        cylinder(d=6, h=2.8, $fn=20);

        #translate([0.5, -20.9, 0])
        cylinder(d=6, h=2.8, $fn=20);

        #translate([0.5, -30.8, 0])
        cylinder(d=6, h=2.8, $fn=20);

        #translate([8.5, -20.9, 0])
        cylinder(d=6, h=2.8, $fn=20);

        #translate([16.5, -20.9, 0])
        cylinder(d=6, h=2.8, $fn=20);
    }

    _supports();

    translate([0, 61.75, 0])
    _supports();

    translate([-76.5, 0, 0])
    _supports();

    translate([-76.5, 61.75, 0])
    _supports();
}