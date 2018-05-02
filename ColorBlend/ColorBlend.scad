

module thetext(texti, height=7, size=10, font="") {
    union() {
        translate([0,0,0]) linear_extrude(height) text(texti, size, font=font);
        //cube([52, size-1, 0.4]);
    }
}

module slice(texti, font, even=false) {
    slices = 15/0.2/2;
    difference() {
        translate([0,0,0.1]) rotate([90,0,0]) thetext(texti, size=12, font=font);
        for (i=[0:slices]) {
            if (even) {
                translate([0,-8,i*0.4+0.2]) cube([82,16,0.2]);
            } else {
                translate([0,-8,i*0.4]) cube([82,16,0.2]);
            }
            
        }
    }
}

slice("Bittium", font="", even=false);
//slice("Bittium", font="Comic Sans MS", even=true);

