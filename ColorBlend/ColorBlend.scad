

module thetext(texti, height=7, size=10, font="") {
    union() {
        rotate([90,0,0]) linear_extrude(height) text(texti, size, font=font);
        //cube([52, size-1, 0.4]);
    }
}

module slice(texti, font="", size=11,height=7,even=false) {
    slices = (size+7)/0.2/2;
    difference() {
        thetext(texti, height, size=size, font=font);
        for (i=[0:slices]) {
            if (even) {
                translate([0,-height,i*0.4-4+0.2]) cube([82,height*2,0.2]);
            } else {
                translate([0,-height,i*0.4-4]) cube([82,height*2,0.2]);
            }
            
        }
    }
}

slice("Colorblend", font="", height=5, even=false);
//slice("Colorblend", font="Comic Sans MS", even=true);

