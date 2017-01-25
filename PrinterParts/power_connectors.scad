
ATX_connector_offset = 24.6;
GPU_connector_offset = 5;

module plate() {
    cube([73, 42, 3]);
    translate([0,32,3]) cube([20, 10, 10]);
    translate([53,32,3]) cube([20, 10, 10]);
}

module back_plate_ATX() {
    difference() {
        cube([44, 27, 3]);
        translate([5, 4, -1]) cylinder(d=3.5, h=5, $fn=30);
        translate([5, 23, -1]) cylinder(d=3.5, h=5, $fn=30);

        translate([38.4, 4, -1]) cylinder(d=3.5, h=5, $fn=30);
        translate([38.4, 23, -1]) cylinder(d=3.5, h=5, $fn=30);
    }
}

module back_plate_GPU() {
    difference() {
        cube([12, 30, 3]);
        translate([6, 4, -1]) cylinder(d=3.5, h=5, $fn=30);
        translate([6, 26, -1]) cylinder(d=3.5, h=5, $fn=30);
    }
}

module plate_with_holes() {
    difference() {
    
        plate();
        
        // ATX
        translate([ATX_connector_offset,10,-1]) cube([43.4, 9.8, 5]);
        translate([ATX_connector_offset+20,19.8,-1]) cube([4, 2, 5]);

        translate([ATX_connector_offset+5, 6, -1]) cylinder(d=3.5, h=5, $fn=30);
        translate([ATX_connector_offset+5, 25, -1]) cylinder(d=3.5, h=5, $fn=30);

        translate([ATX_connector_offset+38.4, 6, -1]) cylinder(d=3.5, h=5, $fn=30);
        translate([ATX_connector_offset+38.4, 25, -1]) cylinder(d=3.5, h=5, $fn=30);

        // GPU
        translate([GPU_connector_offset+1,9,-1]) cube([11.8, 14, 5]);
        translate([GPU_connector_offset+12.8,14,-1]) cube([2, 4, 5]);
        translate([GPU_connector_offset+1,8,-1]) cube([2, 16, 5]);
        translate([GPU_connector_offset,18.75,-1]) cube([2, 3, 5]);
        translate([GPU_connector_offset,10.25,-1]) cube([2, 3, 5]);
        
        translate([GPU_connector_offset+6, 5, -1]) cylinder(d=3.5, h=5, $fn=30);
        translate([GPU_connector_offset+6, 27, -1]) cylinder(d=3.5, h=5, $fn=30);
        
        // mount holes
        translate([7, 37, -1]) cylinder(d=4.5, h=15, $fn=30);
        translate([66, 37, -1]) cylinder(d=4.5, h=15, $fn=30);
    }
}

module power_connectors() {
    plate_with_holes();
    translate([0,-30,0]) back_plate_ATX();
    translate([0,-62,0]) back_plate_GPU();
}

power_connectors();