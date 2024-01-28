end_d = 12;
top_d = 8;
h = 1.6;
block_d = 4;

//_block_form();
//_seal_form();
seal();

module _block_form(h=0.4) {
    hull() {
        translate([
            35/2 - block_d/2,
            35/2 - block_d/2, 0
        ])
        cylinder(d=block_d, h=h, $fn=30);

        translate([
            -35/2 + block_d/2,
            35/2 - block_d/2, 0
        ])
        cylinder(d=block_d, h=h, $fn=30);

        translate([
            35/2 - block_d/2,
            -35/2+block_d/2, 0
        ])
        cylinder(d=block_d, h=h, $fn=30);

        translate([
            -35/2 + block_d/2,
            -35/2 + block_d/2,0
        ])
        cylinder(d=block_d, h=h, $fn=30);

        translate([39.5/2 - end_d/2, 0, 0])
        cylinder(d=end_d, h=h, $fn=70);

        translate([-39.5/2 + end_d/2, 0, 0])
        cylinder(d=end_d, h=h, $fn=70);
    }
}

module _seal_form() {
    hull() {
        translate([38.8/2 - end_d/2, 0, 0])
        cylinder(d=end_d, h=h, $fn=70);

        translate([-38.8/2 + end_d/2, 0, 0])
        cylinder(d=end_d, h=h, $fn=70);

        translate([14/2, 26.5/2 - top_d/2, 0])
        cylinder(d=top_d, h=h, $fn=60);

        translate([-14/2, 26.5/2 - top_d/2, 0])
        cylinder(d=top_d, h=h, $fn=60);

        translate([14/2, -26.5/2 + top_d/2, 0])
        cylinder(d=top_d, h=h, $fn=60);

        translate([-14/2, -26.5/2 + top_d/2, 0])
        cylinder(d=top_d, h=h, $fn=60);
    }
}

module seal() {
    union() {
        difference() {
            _seal_form();

            translate([0, 0, -1])
            linear_extrude(h * 3)
            offset(r=-1.45)
            projection(cut=true)
            _seal_form();
        }

        difference() {
            _block_form(h=0.5);

            translate([0, 0, -1])
            linear_extrude(h * 3)
            offset(r=-1.45)
            projection(cut=true)
            _seal_form();
            
            translate([26/2, 24.5/2, 0])
            cylinder(d=4.1, h=5, center=true, $fn=40);

            translate([26/2, -24.5/2, 0])
            cylinder(d=4.1, h=5, center=true, $fn=40);

            translate([-26/2, 24.5/2, 0])
            cylinder(d=4.1, h=5, center=true, $fn=40);

            translate([-26/2, -24.5/2, 0])
            cylinder(d=4.1, h=5, center=true, $fn=40);
        }
    }
}
