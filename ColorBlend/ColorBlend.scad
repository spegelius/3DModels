

module thetext(texti, height=7, size=10, font="") {
    union() {
        rotate([90,0,0])
        linear_extrude(height)
        text(texti, size, font=font);

        //cube([52, size-1, 0.4]);
    }
}

module slice(texti, font="", size=11,height=7,even=false, slice_h=0.2) {
    slices = (size+7)/slice_h/2;
    difference() {
        thetext(texti, height, size=size, font=font);
        for (i=[0:slices]) {
            if (even) {
                translate([0,-height,i*slice_h*2-6+slice_h])
                cube([82,height*2,slice_h]);
            } else {
                translate([0,-height,i*slice_h*2-6])
                cube([82,height*2,slice_h]);
            }
        }
    }
}

slice("Colorblend", font="", height=5, even=false);
//slice("Colorblend", font="Comic Sans MS", even=true);

