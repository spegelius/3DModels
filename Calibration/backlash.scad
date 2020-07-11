
translate([-20,0,0])
pro_backlash();

translate([20,0,0])
anti_backlash();

//pro_backlash();
//anti_backlash();

module pro_backlash() {
    difference() {
        hull() {
            cube([28,28,5],center=true);

            translate([0,0,(5-4)/2])
            cube([30,30,4],center=true);
        }

        for(i=[0:3]) {
            rotate([0,0,i*90])
            translate([30/2,0,0])
            cube([5,4,10],center=true);
        }

        translate([-12,4,-5/2+4.2])
        linear_extrude(1)
        text("Y", size=8);

        translate([5,-30/2+4,-5/2+4.2])
        linear_extrude(1)
        text("X", size=8);
    }
}

module anti_backlash() {

    difference() {
        union() {
            hull() {
                cube([28,28,5],center=true);

                translate([0,0,(5-4)/2])
                cube([30,30,4],center=true);
            }
            cube([5,36,5],center=true);
            cube([36,5,5],center=true);
        }

        translate([-12,4,-5/2+4.2])
        linear_extrude(1)
        text("Y", size=8);

        translate([5,-30/2+4,-5/2+4.2])
        linear_extrude(1)
        text("X", size=8);
    }
}