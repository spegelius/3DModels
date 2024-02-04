
w=95;
h=40;
thickness=1;

rim_thickness = 0.6;

module rim(w=240, h=100, thickness=1) {
    color("black")
    translate([0, 0, thickness + rim_thickness/2]) {
        difference() {
            cube([
                w - 1, h - 1, rim_thickness
            ], center=true);

            cube([
                w - 1 - 4, h - 1 - 4, 2
            ], center=true);
        }
    }
}

module plate(w=240, h=100, thickness=1) {
    
    hole_distance = 5;
    hole_w = w/2 - hole_distance;
    hole_h = h/2 - hole_distance;
    
    difference() {
        translate([0, 0, thickness/2])
        cube([w, h, thickness], center=true);

        translate([hole_w, hole_h,0])
        cylinder(d=3, h=thickness + 1, $fn=30);

        translate([-hole_w, hole_h, 0])
        cylinder(d=3, h=thickness + 1, $fn=30);

        translate([hole_w, -hole_h,0])
        cylinder(d=3, h=thickness + 1, $fn=30);

        translate([-hole_w, -hole_h, 0])
        cylinder(d=3, h=thickness + 1, $fn=30);
    }


}

module main_text() {
    translate([0, 0, thickness])
    color("black") {
        linear_extrude(height=1)
            text(
                text="3DPrinting",
                halign="center",
                valign="center",
                size=14
            );
    }
}

plate(w=w, h=h, thickness=thickness);
//rim(w=w, h=h, thickness=thickness);
//main_text();

