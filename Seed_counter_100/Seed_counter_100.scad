use <../Dollo/NEW_long_ties/include.scad>;


//seed_tray_100();
seed_tray_100_2();


module _seed_slot_1() {
    rounded_cube(
        3.8, 8.8, 10, 3, $fn=30
    );
}

module _seed_slot_2() {
    rounded_cube(
        3.5, 10.8, 10, 3, $fn=30
    );
}

module _seed_tray_100(slot=1) {
    h = 4;
    
    module _slots_1() {
        translate([-24.2, -66, 0])
        for(i = [0:9]) {
            for(j = [0:4]) {
                translate([j*10, i*13, 2])
                _seed_slot_1();
            }

            for(j = [0:4]) {
                translate([10/2 + j*10, 13/2 + i*13, 2])
                _seed_slot_1();
            }
        }
    }

    module _slots_2() {
        translate([-24.2, -67, 0])
        for(i = [0:9]) {
            for(j = [0:4]) {
                translate([j*10, i*13, 2])
                _seed_slot_2();
            }

            for(j = [0:4]) {
                translate([10/2 + j*10, 13/2 + i*13, 2])
                _seed_slot_2();
            }
        }
    }

    difference() {
        hull() {
            translate([-23, 64, 0])
            chamfered_cylinder(12, h, 1.5, $fn=30);

            translate([-23, -64, 0])
            chamfered_cylinder(12, h, 1.5, $fn=30);

            translate([23, 64, 0])
            chamfered_cylinder(12, h, 1.5, $fn=30);

            translate([23, -64, 0])
            chamfered_cylinder(12, h, 1.5, $fn=30);

            translate([40, 22, 0])
            chamfered_cylinder(12, h, 1.5, $fn=30);

            translate([40, -22, 0])
            chamfered_cylinder(12, h, 1.5, $fn=30);
        }

        if(slot == 1) {
            _slots_1();
        } else {
            _slots_2();
        }

        translate([34.5, 0, 57.5 + h])
        rotate([0, 90, 0])
        donut(100, 20, $fn=100);
    }
}

module seed_tray_100() {
    _seed_tray_100(slot=1);
}

module seed_tray_100_2() {
    _seed_tray_100(slot=2);
}
