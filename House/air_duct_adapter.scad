use <../Dollo/NEW_long_ties/include.scad>;


//_adapter_form();

adapter_ring();
//adapter_ring_seal();


module _adapter_form(height=15) {
    difference() {
        union() {
            cylinder(
                d=102, h=height, $fn=50
            );

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([53, 0, 0])
                hull() {
                    cylinder(
                        d=15, h=height, $fn=30
                    );

                    translate([-7, 0, 0])
                    cylinder(
                        d=17, h=height, $fn=30
                    );

                }
            }
        }    

        cylinder(
            d=85, h=height*3, center=true,
            $fn=50
        );

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([111.5/2, 0, 0])
            hull() {
                cylinder(
                    d=6.5, h=height*3,
                    center=true, $fn=40
                );

                translate([5, 0, 0])
                cylinder(
                    d=7.5, h=height*3,
                    center=true, $fn=40
                );
            }
        }
    }
}

module adapter_ring() {

    h = 13;

    difference() {
        _adapter_form(h);

        translate([0, 0, -0.1])
        tube(98, 1.3, 2, $fn=50);

        translate([0, 0, h - 1])
        tube(98, 1.1, 2, $fn=50);

    }
}

module adapter_ring_seal() {
    union() {
        tube(102, 1, 17/2, $fn=50);

        tube(98, 1.8, 1.8, $fn=50);
    }
}