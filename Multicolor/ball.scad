

//debug();


//ball();
supports();
//soluble_supports();


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

module supports(splits=true) {
    difference() {
        cylinder(d1=32, d2=41, h=12, $fn=50);

        // contours
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

        if (splits) {
            // splits
            cube([0.2, 50, 60], center=true);
            cube([50, 0.2, 60], center=true);
        }
    }
}

module soluble_supports() {
    difference() {
        cylinder(d1=31.5, d2=40, h=12);

        supports(splits=false);

        ball();
    }
}