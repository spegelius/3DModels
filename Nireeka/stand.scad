
// length of the foot part
length = 130;

// offset of the locking clip, from the open end
clip_offset = 25;

module _stand_form(d=13, h=10) {
    inner_d = 10.7/13 * d;
    bottom = 7.2/13 * d;
    top = 4/13 * d;

    translate([0,d-inner_d/2,0])
    hull() {
        translate([-d/2+inner_d/2+0.1,0,0])
        cylinder(d=inner_d,h=h,$fn=40);

        translate([d/2-inner_d/2-0.1,0,0])
        cylinder(d=inner_d,h=h,$fn=40);

        translate([0,inner_d/2,h/2])
        cube([top,0.5,h],center=true);

        translate([0,-d+inner_d/2+bottom/2,h/2])
        cylinder(d=bottom,h=h,center=true,$fn=30);
    }
}

// print this and see how it fits the stand. Adjust form as needed.
module test_stand_form() {
    
    difference() {
        _stand_form(d=15, h=7);

        translate([0,1,-.1])
        _stand_form(d=13, h=8);
    }
}

module stand_leg() {

    difference() {
        union() {
            // leg
            hull() {
                rotate([90,0,0])
                _stand_form(20, h=4);

                // foot
                rotate([58,0,0])
                translate([0,25/2,0])
                hull() {
                    cylinder(d=25,h=3,$fn=30);

                    translate([0,15,0])
                    cylinder(d=22,h=3,$fn=30);
                }
            }
            // stand body
            rotate([90,0,0])
            _stand_form(20, h=length);
            
            // level bottom
            translate([0,-length/2,1/2])
            cube([5,length,1],center=true);

            // stand button holder
            translate([0,-length+clip_offset,22/2+1])
            cylinder(d=20,h=28-(22/2+1),$fn=40);
        }
        // stand hole
        translate([0,-10,3.5])
        rotate([90,0,0])
        _stand_form(13, h=length);

        // hole through for extra strength
        translate([0,-length/2,22/2])
        rotate([90,0,0])
        cylinder(d=2,h=length+clip_offset,center=true);

        // button indent
        translate([0,-length+clip_offset,28-9])
        cylinder(d=15.5,h=10,$fn=40);

        // lock hook indents
        translate([0,-length+clip_offset,12/2+7])
        difference() {
            cube([25,1.8,40],center=true);
            cube([16,2,12],center=true);
        }

        // foot indents
        rotate([58,0,0])
        for(i=[0:30]) {
            translate([-20+i*2,0])
            rotate([0,45,0])
            cube([1,80,1],center=true);

            translate([0,-20+i*2,0])
            rotate([45,0,0])
            cube([60,1,1],center=true);
        }
    }
}

stand_leg();
//test_stand_form();
