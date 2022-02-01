
use <mockups.scad>;

w = 600;
d = 700;
h = 690;

CR10_S5_frame();
CR10_S5_hotend();
CR10_S5_x_carriage();

module CR10_S5_frame() {


    // sides
    translate([-w/2 + 40/2, 0, 20/2])
    cube([40, d, 20], center=true);

    translate([w/2 - 40/2, 0, 20/2])
    cube([40, d, 20], center=true);

    // front and back
    translate([0, -d/2 + 20/2, 20/2])
    cube([w, 20, 20], center=true);

    translate([0, d/2 - 20/2, 20/2])
    cube([w, 20, 20], center=true);

    // z
    translate([-w/2 + 40/2, -d/2 + 380 + 20/2, h/2])
    cube([40, 20, h], center=true);

    translate([w/2 - 40/2, -d/2 + 380 + 20/2, h/2])
    cube([40, 20, h], center=true);

    // z top
    translate([0, -d/2 + 380 + 20/2, h - 20/2])
    cube([w, 20, 20], center=true);

    // x beam
    translate([0, -d/2 + 380 + 20/2 - 26, h/2])
    cube([w, 20, 20], center=true);

    // y beams
    translate([-300/2 + 40/2, 0, 20/2 + 20])
    cube([40, d, 20], center=true);

    translate([300/2 - 40/2, 0, 20/2 + 20])
    cube([40, d, 20], center=true);
}

module CR10_S5_hotend(x_pos=0) {

    translate([16.7, -10.5, h/2 - 40.2])
    mock_creality_hotend();
}

module CR10_S5_x_carriage() {
    translate([0, 0, h/2 + 8])
    mock_creality_x_carriage();
}