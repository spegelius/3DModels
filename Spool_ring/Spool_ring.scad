
use <../Dollo/NEW_long_ties/include.scad>;

t_slop = 0.3;


//_spool_insert_disk(70);


//spool_ring(id=199, h=3);
//spool_ring(id=198, h=3);

//spool_insert();
//spool_insert_end();

//spool_insert(sd=54, h=62.2, id=50);
//spool_insert_end(sd=54);

// Creality Hyper Series
//spool_ring(id=200.5, h=3.6);
//spool_insert(sd=55.3, h=65, id=51);
//spool_insert_end(sd=55.3);


// PolyTerra PLA
//spool_ring(id=199, h=3);
//spool_insert(sd=55, h=65, id=51);
spool_insert_end(sd=55);


module spool_ring(id=199, h=3) {

    difference() {
        chamfered_cylinder(
            id + 3.4, h + 2, 1, $fn=200
        );

        intersection() {
            cylinder(
                d=id - 5, h=h*4, center=true, $fn=200
            );

            cube([id - 12, id - 12, h*4], center=true);
        }

        translate([0, 0, 1])
        cylinder(d=id + 0.4, h=h, $fn=200);

        translate([0, 0, 1.5])
        chamfered_cylinder(id + 0.4, h, 0.5, $fn=200);

        translate([0, 0, 2])
        cylinder(d=id - 0.8, h=h*2, $fn=200);
    }
}

module _spool_insert_disk(od) {

    difference() {
        hull() {
            cylinder(d=od - 1.2, h=2.6, $fn=80);

            translate([0, 0, 0.6])
            cylinder(d=od, h=2, $fn=80);
        }

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([od/2 - 4, 0, 0])
            cylinder(d=1.8, h=10, center=true, $fn=20);
        }

        difference() {
            translate([0, 0, 1])
            cylinder(d=od - 3, h=10, $fn=80);

            for(i = [0:5]) {
                rotate([0, 0, i*30])
                cube([200, 2, 10], center=true);
            }

            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([od/2 - 4, 0, 0])
                cylinder(
                    d=4, h=10, center=true, $fn=20
                );
            }
        }
    }
}

module spool_insert(sd=55.5, h=68, id=51) {
    od = sd + 20;
    th = h + 5.3;

    difference() {
        union() {
            _spool_insert_disk(od);

            translate([0, 0, 1])
            cylinder(d=sd, h=th - 6, $fn=80);
            
            translate([0, 0, th - 6])
            v_screw(
                h=6,
                screw_d=sd,
                pitch=1.5,
                direction=0,
                steps=80,
                depth=0.2,
                chamfer=false
            );
        }

        cylinder(
            d=id + 0.4, h=300, center=true, $fn=80
        );

        cylinder(
            d2=id + 0.3, d1=52.8,
            h=1.4, center=true, $fn=80
        );

        translate([0, 0, th])
        cylinder(
            d1=id + 0.3, d2=52.8,
            h=1.4, center=true, $fn=80
        );
    }
}

module spool_insert_end(sd=55.5) {
    od = sd + 20;

    difference() {
        union() {
            _spool_insert_disk(od);

            cylinder(
                d=sd + t_slop + 2.5, h=2.6, $fn=80
            );
        }

        translate([0, 0, -1])
        v_screw(
            h=4,
            screw_d=sd + t_slop,
            pitch=1.5,
            direction=0,
            steps=80,
            depth=0.2,
            chamfer=false
        );
    }
}