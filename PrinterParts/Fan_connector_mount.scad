include <../PCParts/common.scad>;

// pcb size
l = 4.02 * 2.54;


row1_x = 0.8 + 2.54 * 2;
row1_y = 2.54 * 2;
    
spacing = 2.54 * 3;


//debug();
//mock_connector_pcb(3);

//fan_connector_mount(3);
fan_connector_mount_bottom(3);

//fan_connector_mount(5);
//fan_connector_mount_bottom(5);

function pcb_w(connectors) = 
    connectors * spacing + 5.1;


module debug() {
    intersection() {
        fan_connector_mount(3);

        translate([0, 50/2 + 1, 0])
        cube([100, 50, 30], center=true);
    }

    translate([0, 0, 7.7])
    rotate([180, 0, 0])
    fan_connector_mount_bottom(3);
}


module mock_connector_pcb(connectors=5) {

    w = pcb_w(connectors);
    echo(w);
    
    union() {
        pcb_with_holes(w, l, h=1.6);

        for (i = [0:connectors - 1]) {
            translate([
                row1_x + i*spacing,
                row1_y, 1.78
            ])
            mock_fan_connector_male();

        }
    }
}

module fan_connector_mount(connectors=5) {

    w = pcb_w(connectors);

    difference() {

        hull() {
            translate([-(w + 5)/2, 0, 0])
            cylinder(d=l + 3, h=7.6, $fn=40);

            translate([(w + 5)/2, 0, 0])
            cylinder(d=l + 3, h=7.6, $fn=40);
        }

        // pcb hole
        translate([0, 0, 2 + 13/2])
        cube([w, l, 13], center=true);

        // cover holes
        translate([0, 0, 6.2 + 3/2])
        cube([w + 30, l - 0.8, 3], center=true);

        translate([0, 0, 10/2 + 3.6])
        cube([w, 20, 10], center=true);

        // fan connector holes
        for (i = [0:connectors - 1]) {
            translate([
                -w/2 + row1_x + i * spacing,
                0, -0.1
            ])
            scale([1.05, 1.04, 1])
            mock_fan_connector_male();
        }

        // mount holes
        translate([(w + 5)/2 + 1, 0, 0])
        cylinder(d=3.2, h=15, center=true, $fn=30);

        translate([-(w + 5)/2 - 1, 0, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        // cable holes
        translate([-w/2 - 3, l/2 - 1.4, 3.6 + 7/2])
        cube([13, 2, 7], center=true);

        translate([-w/2 - 3, -l/2 + 1.4, 3.6 + 7/2])
        cube([13, 2, 7], center=true);
    }
    %translate([-w/2, l/2, 3.6])
    rotate([180, 0, 0])
    mock_connector_pcb(connectors);
}

module fan_connector_mount_bottom(connectors=5) {

    w = pcb_w(connectors);

    difference() {
        union() {
            hull() {
                translate([-(w + 5)/2, 0, 0])
                cylinder(d=l + 3, h=1.4, $fn=40);

                translate([(w + 5)/2, 0, 0])
                cylinder(d=l + 3, h=1.4, $fn=40);

            }
            translate([0, 0, 4/2])
            cube([w - 0.4, l + 3, 4], center=true);
        }

        translate([w/2 + 20/2 - 0.2, l/2 - 0.5 + 4/2])
        cube([20, 4, 8], center=true);

        translate([w/2 + 20/2 - 0.2, -l/2 + 0.5 - 4/2])
        cube([20, 4, 8], center=true);

        translate([-w/2 - 20/2 + 0.2, l/2 - 0.5 + 4/2])
        cube([20, 4, 8], center=true);

        translate([-w/2 - 20/2 + 0.2, -l/2 + 0.5 - 4/2])
        cube([20, 4, 8], center=true);

        translate([0, 0, 1.4 + 13/2])
        cube([w, l - 1, 13], center=true);

        translate([(w + 5)/2 + 1, 0, 0])
        cylinder(d=3.2, h=15, center=true, $fn=30);

        translate([-(w + 5)/2 - 1, 0, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);
    }
}
