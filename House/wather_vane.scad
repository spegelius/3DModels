use <../Dollo/NEW_long_ties/include.scad>;

thread_steps = 40;

module bearing_block() {
    difference() {
        union() {
            hull() {
                cylinder(d=15, h=3, $fn=40);

                translate([16,0,0])
                cylinder(d=12,h=3,$fn=30);

                translate([-16,0,0])
                cylinder(d=12,h=3,$fn=30);
            }
            cylinder(d=13,h=8,$fn=40);
        }

        cylinder(d=10.5,h=40,center=true,$fn=40);

        translate([-16,0,0])
        v_screw(h=10,
                screw_d=8.4,
                pitch=1.25,
                direction=0,
                steps=thread_steps,
                depth=0);

        translate([16,0,0])
        v_screw(h=10,
                screw_d=8.4,
                pitch=1.25,
                direction=0,
                steps=thread_steps,
                depth=0);
    }
}

module bolt() {
    difference() {
        union() {
            hexagon(13,4);

            translate([0,0,3.99])
            v_screw(h=6,
                    screw_d=8,
                    pitch=1.25,
                    direction=0,
                    steps=thread_steps,
                    depth=0,
                    chamfer=true);
        }
        cylinder(d=1,h=10,$fn=10);
    }
}

module drill_aid() {
    difference() {
        union() {
            hull() {
                cylinder(d=13, h=1.4, $fn=40);

                translate([16,0,0])
                cylinder(d=6,h=1.4,$fn=30);

                translate([-16,0,0])
                cylinder(d=6,h=1.4,$fn=30);
            }
            cylinder(d=13,h=3.4,$fn=40);
        }
        cylinder(d=9.3,h=40,center=true,$fn=40);

        translate([16,0,0])
        cylinder(d=3,h=4,$fn=30);

        translate([-16,0,0])
        cylinder(d=3,h=4,$fn=30);
    }
}

module stopper() {
    difference() {
        cylinder(d=20,h=20,$fn=30);
        cylinder(d=10.5,h=50,center=true,$fn=40);

        translate([0,0,5])
        rotate([90,0,0])
        cylinder(d=3.5,h=10,$fn=10);

        translate([0,0,15])
        rotate([90,0,0])
        cylinder(d=3.5,h=10,$fn=10);

    }
}

//bearing_block();
//bolt();
//drill_aid();
stopper();