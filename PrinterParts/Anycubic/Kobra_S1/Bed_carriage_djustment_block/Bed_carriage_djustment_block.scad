

//adjustment_block(h=0.6);
//adjustment_block(h=0.8);
//adjustment_block(h=1.0);
//adjustment_block(h=1.2);
//adjustment_block(h=1.4);
adjustment_block(h=1.6);


module adjustment_block(h=0.4) {
    difference() {
        translate([0, 0, (10 + h)/2])
        cube([27, 13, 10 + h], center=true);

        translate([-1, 2, (10 + h)/2 + h])
        cube([30, 13, 10 + h], center=true);

        hull() {
            translate([-15/2, -1, 0])
            cylinder(d=3.5, h=100, center=true, $fn=30);

            translate([-15/2, 20, 0])
            cylinder(d=3.5, h=100, center=true, $fn=30);
        }

        hull() {
            translate([15/2, -1, 0])
            cylinder(d=3.5, h=100, center=true, $fn=30);

            translate([15/2, 20, 0])
            cylinder(d=3.5, h=100, center=true, $fn=30);
        }

        hull() {
            translate([0, -1, 0])
            cylinder(d=3.8, h=100, center=true, $fn=30);

            translate([0, 20, 0])
            cylinder(d=3.8, h=100, center=true, $fn=30);
        }

        translate([0, -13/2 + 0.3, (10 + h)/2])
        rotate([90, 180, 0])
        linear_extrude(1)
        text(text=str(h), size=9, halign="center", valign="center");
    }
}