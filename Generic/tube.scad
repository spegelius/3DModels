//longtube();
//tube_13_11_20();
elongated_tube();


module longtube() {
    l = sqrt(250*250 + 210*210) -8;
    echo (l);

    rotate([0,0,-50]) difference() {
        intersection() {
            translate([0,0,1.7]) rotate([-90,0,0]) cylinder(d=4,h=l,$fn=20);
            translate([-5,0,0]) cube([10,l,10]);
        }
        cube([5,5,5]);
    }
    %cube([250,210,1]);
}

module tube_13_11_20() {
    difference() {
        cylinder(d=13,h=20,$fn=80);
        cylinder(d=11.5,h=20,$fn=80);
    }
}

module elongated_tube() {
    difference() {
        hull() {
            translate([33/2 - 9/2, 0, 0])
            cylinder(d=11, h=8, $fn=30);

            translate([-33/2 + 9/2, 0, 0])
            cylinder(d=11, h=8, $fn=30);
        }

        hull() {
            translate([33/2 - 9/2, 0, 0])
            cylinder(d=9, h=20, center=true, $fn=30);

            translate([-33/2 + 9/2, 0, 0])
            cylinder(d=9, h=20, center=true, $fn=30);
        }
    }
}
