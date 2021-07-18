use <../Dollo/NEW_long_ties/include.scad>;

curtain_hanger();

module curtain_hanger() {
    difference() {
        intersection() {
            union() {
                rotate([0,90,0])
                rounded_cube_side(27,63,5,5,center=true,$fn=50);

                translate([0,-6.5,0])
                hull() {
                    translate([0,1.5,0])
                    cube([1,35,27],center=true);

                    translate([13,0,0])
                    scale([1,1,1.2])
                    rotate([0,90,0])
                    cylinder(d=28,h=1,$fn=50);
                }

                translate([14,-6.5,0])
                hull() {
                    scale([1,1,1.2])
                    rotate([0,90,0])
                    cylinder(d=28,h=1,$fn=50);

                    translate([83,1.5,0])
                    scale([1,1,1.4])
                    rotate([0,90,0])
                    cylinder(d=20,h=1,$fn=50);
                }

                translate([15+80+50/2-5,-6.5+1.5,0])
                scale([1,1,0.8])
                sphere(d=50,$fn=80);
            }
            cylinder(d=400,h=27,center=true);
        }

        translate([15+80+50/2-5,-6.5+1.5,0])
        difference() {
            hull() {
                cylinder(d=30,h=40,center=true,$fn=50);

                translate([0,30,0])
                cylinder(d=34,h=40,center=true,$fn=50);
            }
            translate([30/2+10/2-1,-1,0])
            scale([1,3.5,3])
            sphere(d=10,$fn=40);
        }

        translate([0,-63/2+5])
        rotate([0,90,0])
        cylinder(d=5.3,h=10,center=true,$fn=30);

        translate([0,63/2-6])
        rotate([0,90,0])
        hull() {
            cylinder(d=5.3,h=10,center=true,$fn=30);

            translate([0,-4,0])
            cylinder(d=5.3,h=10,center=true,$fn=30);
        }

        translate([0,63/2-12.5])
        rotate([0,90,0])
        cylinder(d=10.3,h=10,center=true,$fn=30);

        translate([-3,-6.5,0])
        rotate([0,90,0])
        cylinder(d1=10,d2=7,h=110,$fn=6);
    }
}