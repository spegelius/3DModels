

//mock_idler();
//mock_idler_24();


module mock_idler() {
    d = 18;
    h = 11;
    $fn = 40;

    difference() {
        union() {
            cylinder(d=d + 3, h=1);

            cylinder(d=d, h=h);
            translate([0, 0, h - 1])
            cylinder(d=d + 3, h=1);
        }
        cylinder(d=5, h=h * 3, center=true);
    }
}

module mock_idler_24() {
    d = 24;
    h = 11;
    $fn = 40;

    difference() {
        union() {
            cylinder(d=d + 3, h=1);

            cylinder(d=d, h=h);
            translate([0, 0, h - 1])
            cylinder(d=d + 3, h=1);
        }
        cylinder(d=5, h=h * 3, center=true);
    }
}

module roller() {
    color("DarkSlateGray")
    render()
    difference() {
        hull() {
            cylinder(d=24, h=6, center=true, $fn=40);
            cylinder(d=20, h=11, center=true, $fn=40);
        }

        cylinder(d=5, h=15, center=true, $fn=40);
    }
}