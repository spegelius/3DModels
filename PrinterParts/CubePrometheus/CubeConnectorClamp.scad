
//clamp(40, 13.2, 30, 4.8, 4.4, 2.8);
//clamp(46, 10.6, 36.5, 4.8, 4.5, 1.5);
clamp(45, 11, 33, 4.8, 4.5, 1.5);


module cone() {
    hull() {
        translate([0, 0, 1.9])
        cylinder(d=3.3, h=1, $fn=30);

        cylinder(d=7.3, h=0.1, $fn=30);
    }
}

module clamp(
    width, height, connector_w,
    connector_h, connector_left_offset,
    connector_bottom_offset
) {
    w = width + 14;
    h = height + 4;
    difference() {
        cube([w, h, 6]);

        translate([7, 2, 2]) {
            cube([width, height, 6]);

            translate([
                connector_left_offset,
                height -
                connector_bottom_offset -
                connector_h,
                -2
            ])
            cube([connector_w, connector_h, 6]);

            translate([
                connector_left_offset, (height -
                connector_bottom_offset-connector_h)/2 - 2,
                -2
            ])
            hull() {
                rotate([0, 45, 0])
                cube([
                    3,
                    height - connector_bottom_offset,
                    3
                ], center=true);

                translate([connector_w, 0, 0])
                rotate([0, 45, 0])
                cube([
                    3,
                    height - connector_bottom_offset,
                    3
                ], center=true);
            }
        }
        
        
        
        translate([3.3/2 + 2, (h)/2, 0])
        cylinder(d=3.3, h=7, $fn=30);

        translate([
            w - (3.3/2 + 2),
            (h)/2, 0
        ])
        cylinder(d=3.3, h=7, $fn=30);

        translate([3.3/2 + 2, (h)/2, -1])
        cone();

        translate([w - (3.3/2 + 2), (h)/2, -1])
        cone();
    }
}
