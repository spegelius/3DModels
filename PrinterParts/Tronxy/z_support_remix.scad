

module original() {
    translate([-17,38,114.57])
    rotate([180,0,0])
    import("../../_downloaded/X5S_z_support/X5S_Z_support_System_and_bed_lowering-8mm_rod.stl", convexity=5);
}

module middle_support() {
    translate([-17,-38,-73.6]) import("../../_downloaded/Tronxy_z_support/Standalone.stl", convexity=5);
}

module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15,h=24,center=true,$fn=30);
        cylinder(d=8,h=25,center=true,$fn=30);
    }
}


module plastic_bearing_housing() {
    difference() {
        union() {
            cylinder(d=32,h=5,$fn=40);
            cylinder(d=17.4,h=5+46.4,$fn=30);
        }
        cylinder(d=8,h=51,$fn=40);
    }
}

module hole_with_spring(d, h, top_gap=false) {
    module arc() {
        intersection() {
            difference() {
                cylinder(d=d+5,h=h,$fn=50);
                cylinder(d=d+3,h=h,$fn=50);
            }
            //cube([d*2,d*0.7,h*2],center=true);
            hull() {
                cylinder(d=1,h=h);
                translate([(d+5)/2,0,h/2]) cube([1,d*0.7,h],center=true);
            }
        }
    }
    
    scaling = (d-0.2)/d;
    
    union() {
        intersection() {
            cylinder(d=d+0.2,h=h,$fn=50);

            scale([scaling,1.1,1]) cylinder(d=d,h=h,$fn=50);
            scale([1.1,scaling,1]) cylinder(d=d,h=h,$fn=50);
        }
        translate([0,0,h/2]) cube([1,d+4.5,h],center=true);
        translate([0,0,h/2]) cube([d+4.5,1,h],center=true);
        
        for (i=[0:3]) {
            rotate([0,0,360/4*i]) arc();
        }
        if (top_gap) {
            translate([0,0,h-0.2]) cylinder(d=d+4,h=0.2,$fn=50);
        }
    }
}

//hole_with_spring(30, 20, top_gap=true);

module _remove_middle() {
    translate([0,0,37]) difference() {
        cube([130,50,10],center=true);
        translate([-65,0,0]) cylinder(d=30,h=10,center=true);
        translate([65,0,0]) cylinder(d=30,h=10,center=true);
    }
}

module new_z_support(final_render=false) {
    difference() {
        union() {
            difference() {
                original();
                _remove_middle();
                
            }
            translate([0,0,35]) middle_support();
            translate([-65,0,0]) {
                cylinder(d=30,h=51.4-10);
                translate([0,0,51.4-10]) cylinder(d1=30,d2=27,h=24);
            }
            translate([65,0,0]) {
                cylinder(d=30,h=51.4-10);
                translate([0,0,51.4-10]) cylinder(d1=30,d2=27,h=24);
            }
        }
        translate([-65,0,0]) {
            if (final_render) {
                hole_with_spring(17.6, 51.4-10, top_gap=true);
                translate([0,0,51.4-10+0.2]) hole_with_spring(15, 26);
            } else {
                cylinder(d=17.5, h=51.4-10, $fn=30);
                translate([0,0,51.4-10+0.2]) cylinder(d=15, h=26, $fn=30);
            }
            cylinder(d1=18.2,d2=16.8,h=0.7,$fn=30);
            translate([0,0,51.4-10+24-0.7]) cylinder(d1=14.6,d2=16,h=0.7,$fn=30);
        }
        translate([65,0,0]) {
            if (final_render) {
                hole_with_spring(17.5, 51.4-10, top_gap=true);
                translate([0,0,51.4-10+0.2]) hole_with_spring(15, 26);
            } else {
                cylinder(d=17.5, h=51.4-10, $fn=30);
                translate([0,0,51.4-10+0.2]) cylinder(d=15, h=26, $fn=30);
            }
            cylinder(d1=18.2,d2=16.8,h=0.7);
            translate([0,0,51.4-10+24-0.7]) cylinder(d1=14.6,d2=16,h=0.7,$fn=30);
        }
        
        translate([329/2,0,22.6]) cube([20,50,20],center=true);
        translate([-329/2,0,22.6]) cube([20,50,20],center=true);
        
        translate([320/2,-10.5,10.6]) cylinder(d2=6.6,d1=3.6,h=2,$fn=40);
        translate([320/2,10.5,10.6]) cylinder(d2=6.6,d1=3.6,h=2,$fn=40);
        translate([-320/2,-10.5,10.6]) cylinder(d2=6.6,d1=3.6,h=2,$fn=40);
        translate([-320/2,10.5,10.6]) cylinder(d2=6.6,d1=3.6,h=2,$fn=40);

    }
}

module height_block() {
    difference() {
        union() {
            cube([10,35,5],center=true);
            translate([0,-10.5,5/2]) cylinder(d1=6.5,d2=5,h=1,$fn=40);
            translate([0,10.5,5/2]) cylinder(d1=6.5,d2=5,h=1,$fn=40);
        }
        translate([0,-10.5,-5/2]) cylinder(d1=6.6,d2=3.6,h=2,$fn=40);
        translate([0,10.5,-5/2]) cylinder(d1=6.6,d2=3.6,h=2,$fn=40);
       
        translate([0,-10.5,0]) cylinder(d=4.5,h=20,center=true,$fn=40);
        translate([0,10.5,0]) cylinder(d=4.5,h=20,center=true,$fn=40);
    }
}

module debug() {
    intersection() {
        translate([0,0,5]) new_z_support();
        translate([0,40/2,0]) cube([400,40,220],center=true);
    }
    %translate([0,0,5/2]) cube([330,40,5],center=true);
    //cylinder(d=10,h=1,$fn=30);
    color("darkgrey") translate([-65,0,-5]) plastic_bearing_housing();
    translate([-65,0,51.4+24/2-5]) mock_LM8UU();
    
    translate([320/2,0,22]) height_block();
    
}

//debug();
//height_block();
rotate([0,0,45]) new_z_support(final_render=true);
