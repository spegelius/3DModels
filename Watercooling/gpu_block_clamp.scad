// for DIY GPU block

//_holes();
//mock_gpu_block();
clamp();

//debug();

module mock_gpu_block() {
    union() {
        cube([44,44,16],center=true);

        translate([-44/2+4,4,0])
        rotate([-90,0,2])
        union() {
            cylinder(d=10,h=50,center=true,$fn=30);
            translate([0,0,50/2-1.5])
            rotate([20,0,0]) {
                cylinder(d=10,h=20);
                translate([0,0,3])
                cylinder(d=12.5,h=20);
            }
        }

        translate([44/2-4,4,0])
        rotate([-90,0,-2])
        union() {
            cylinder(d=10,h=50,center=true,$fn=30);
            translate([0,0,50/2-1.5])
            rotate([20,0,0]) {
                cylinder(d=10,h=20);
                translate([0,0,3])
                cylinder(d=12.5,h=20);
            }
        }
    }
}

module _holes(d=4, h=10) {
    for(i=[0:3]) {
        rotate([0,0,360/4*i])
        translate([51/2,51/2,0])
        cylinder(d=d,h=h,center=true,$fn=40);
    }
}

module clamp() {
    h = 8;
    difference() {
        union() {
            for(i=[0:3]) {
                rotate([0,0,360/4*i])
                hull() {
                    cube([30,30,h],center=true);
                    translate([51/2,51/2,0])
                    cylinder(d=10,h=h,center=true,$fn=40);
                }
            }
            cube([44,44,h],center=true);

            translate([-44/2-5/2,0,20/2-h/2])
            cube([5,15,20],center=true);

            translate([44/2+5/2,0,20/2-h/2])
            cube([5,15,20],center=true);

            translate([0,44/2+5/2,15/2-h/2])
            cube([15,5,15],center=true);

            translate([0,-44/2-5/2+1,15/2-h/2])
            cube([15,5,15],center=true);
        }
        _holes(d=4, h=10);
        
        translate([0,1,16/2+8/2])
        rotate([0,180,0])
        mock_gpu_block();
        
        // infill
        translate([5,0,0])
        rotate([0,0,45]) {
            translate([0,0,-1.5])
            cube([100,0.1,0.2],center=true);
            translate([0,0,1.5])
            cube([100,0.1,0.2],center=true);
        }

        translate([-5,0,0])
        rotate([0,0,45]) {
            translate([0,0,-1.5])
            cube([100,0.1,0.2],center=true);
            translate([0,0,1.5])
            cube([100,0.1,0.2],center=true);
        }
        
        translate([5,0,0])
        rotate([0,0,-45]) {
            translate([0,0,-1.5])
            cube([100,0.1,0.2],center=true);
            translate([0,0,1.5])
            cube([100,0.1,0.2],center=true);
        }

        translate([-5,0,0])
        rotate([0,0,-45]) {
            translate([0,0,-1.5])
            cube([100,0.1,0.2],center=true);
            translate([0,0,1.5])
            cube([100,0.1,0.2],center=true);
        }
    }
}

module debug() {
    mock_gpu_block();
    translate([0,-1,16/2+8/2])
    rotate([0,180,0])
    clamp();
}