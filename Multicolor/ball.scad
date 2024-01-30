

//debug();


//ball();
//supports();
soluble_supports();


module debug() {
    intersection() {
        union() {
            ball();

            supports();
            
            //soluble_supports();
        }

        translate([0, 50/2, 0])
        cube([50, 50, 100], center=true);
    }
}


module ball() {
    translate([0, 0, 40/2 + 1])
    sphere(d=40, $fn=100);
}

module supports() {
    difference() {
        cylinder(d1=40, d2=41, h=12, $fn=50);

        translate([0, 0, 10])
        cylinder(d=38, h=12, $fn=50);

        translate([0, 0, 8])
        cylinder(d=35.4, h=12, $fn=50);

        translate([0, 0, 6])
        cylinder(d=32.6, h=12, $fn=50);

        translate([0, 0, 4])
        cylinder(d=29, h=12, $fn=50);

        translate([0, 0, 2])
        cylinder(d=24, h=12, $fn=50);

        translate([0, 0, 0.5])
        cylinder(d=17, h=12, $fn=50);

        translate([0, 0, -0.5])
        cylinder(d=14, h=12, $fn=50);

    }
}

module soluble_supports() {
    difference() {
        cylinder(d=39.5, h=12);

        supports();

        ball();
    }
}