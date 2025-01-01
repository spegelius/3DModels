
use <case_230_430_480.scad>;


//dimensions();
orientation();


module dimensions() {
    mockup();

    translate([0, -100, 0])
    //rotate([0, 0, 90])
    text(
        text = "Width >", size=40,
        font="Arial:style=Bold"
    );

    translate([300, 100, 0])
    rotate([0, 0, 90])
    text(
        text = "Depth >", size=40,
        font="Arial:style=Bold"
    );

    translate([300, 400, 0])
    rotate([90, -90, 0])
    text(
        text = "Height >", size=40,
        font="Arial:style=Bold"
    );
}

module orientation() {

    mockup();

    translate([-190, 20, 0])
    text(
        text = "Left", size=40,
        font="Arial:style=Bold"
    );

    translate([270, 20, 0])
    text(
        text = "Right", size=40,
        font="Arial:style=Bold"
    );
}