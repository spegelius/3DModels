
font = "Arial";

//plate();
//plate_2();
//name_text();
name_text_2();

module plate() {
    difference() {
        translate([0, 0, 1.6/2])
        cube([175, 25.5, 1.6], center=true);

        name_text();
    }
}

module plate_2() {
    difference() {
        translate([0, 0, 1.6/2])
        cube([175, 25.5, 1.6], center=true);

        name_text_2();
    }
}

module name_text() {
    translate([0, 5.5,1.6 - 0.6])
    linear_extrude(1)
    text(text="EXAMPLE  NAME", halign="center",
        valign="center", size=8, font=font);

    translate([0, -5.5 ,1.6 - 0.6])
    linear_extrude(1)
    text(text="NAME 2", halign="center",
        valign="center", size=8, font=font);
}

module name_text_2() {
    translate([0, 5.5,1.6 - 0.6])
    linear_extrude(1)
    text(text="EXAMPLE  NAME", halign="center",
        valign="center", size=8, font=font);

    translate([0, -5.5 ,1.6 - 0.6])
    linear_extrude(1)
    text(text="NAME2  NAME3", halign="center",
        valign="center", size=8, font=font);
}