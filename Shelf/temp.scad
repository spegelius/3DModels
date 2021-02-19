use <../Dollo/NEW_long_ties/include.scad>;

h = 12.2;

//debug_945_22();
//debug_945_16();

//debug_810_22();
//debug_810_16();

//debug_part2();

//part(170,31,23,end1=15);
//part(140,31,23);
//part(91,31,23,end2=15);

//part(170,23,17,end1=15);
//part(140,23,17);
//part(91,23,17,end2=15);

//part(120,31,23,end1=135/2+15);
//part(120,31,23);
//part(92,31,23,end2=135/2+15);

//part(120,23,17,end1=135/2+15);
//part(120,23,17);
//part(80,23,17);
//part(92,23,17,end2=135/2+15);

part2(182, end=true);
//part2(182);

module debug_945_22() {
    od = 31;
    id = 23;

    %translate([945/2+15,0,8/2+4.6])
    cube([945,22,8],center=true);

    translate([15,0,0])
    part(170,od,id,end1=15);

    translate([15+170+0.1,0,0])
    part(140,od,id);

    translate([15+170+140+0.2,0,0])
    part(140,od,id);

    translate([15+170+2*140+0.3,0,0])
    part(140,od,id);

    translate([15+170+3*140+0.4,0,0])
    part(140,od,id);

    translate([15+170+4*140+0.5,0,0])
    part(140,od,id);

    translate([15+170+5*140+0.6,0,0])
    part(91, od,id, end2=15);
}

module debug_945_16() {
    od = 23;
    id = 17;

    %translate([945/2+15,0,8/2+4.6])
    cube([945,16,8],center=true);

    translate([15,0,0])
    part(170,od,id,end1=15);

    translate([15+170+0.1,0,0])
    part(140,od,id);

    translate([15+170+140+0.2,0,0])
    part(140,od,id);

    translate([15+170+2*140+0.3,0,0])
    part(140,od,id);

    translate([15+170+3*140+0.4,0,0])
    part(140,od,id);

    translate([15+170+4*140+0.5,0,0])
    part(140,od,id);

    translate([15+170+5*140+0.6,0,0])
    part(91, od,id, end2=15);
}

module debug_810_22() {
    od = 31;
    id = 23;

    echo(135/2+15);
    %translate([810/2+135/2+15,0,8/2+4.6])
    cube([810,22,8],center=true);

    translate([135/2+15,0,0])
    part(120,od,id,end1=135/2+15);

    translate([135/2+15+120+0.1,0,0])
    part(140,od,id);

    translate([135/2+15+120+140+0.2,0,0])
    part(140,od,id);

    translate([135/2+15+120+2*140+0.3,0,0])
    part(140,od,id);

    translate([135/2+15+120+3*140+0.4,0,0])
    part(140,od,id);

    translate([135/2+15+120+4*140+0.4,0,0])
    part(120,od,id);

    translate([135/2+15+120+4*140+120+0.6,0,0])
    part(92, od,id, end2=135/2+15);
}

module debug_810_16() {
    od = 23;
    id = 17;

    %translate([810/2+135/2+15,0,8/2+4.6])
    cube([810,16,8],center=true);

    translate([135/2+15,0,0])
    part(120,od,id,end1=135/2+15);

    translate([135/2+15+120+0.1,0,0])
    part(120,od,id);

    translate([135/2+15+120+120+0.2,0,0])
    part(120,od,id);

    translate([135/2+15+120+2*120+0.3,0,0])
    part(120,od,id);

    translate([135/2+15+120+3*120+0.4,0,0])
    part(120,od,id);

    translate([135/2+15+120+4*120+0.4,0,0])
    part(120,od,id);

    translate([135/2+15+120+5*120+0.4,0,0])
    part(80,od,id);

    translate([135/2+15+120+5*120+80+0.6,0,0])
    part(92, od,id, end2=135/2+15);
}

module debug_part2() {

    w = 182;

    %translate([970/2-w/2,30,0])
    cube([970,23,12],center=true);

    intersection() {
        part2(w, end=true);

        translate([0,0,-20/2])
        cube([220,30,20],center=true);
    }

    translate([w-50+0.1,0.1,0])
    part2(w);

    translate([2*w-100+0.2,0.1,0])
    part2(w);

    translate([3*w-150+0.3,0.1,0])
    part2(w);

    translate([4*w-200+0.4,0.1,0])
    part2(w);

    translate([5*w-250+0.5,0.1,0])
    part2(w);

    translate([6*w-300+0.6,0.1,0])
    rotate([180,180,0])
    part2(w,end=true);
}

module _joint(h=5) {
    intersection() {
        hull() {
            translate([0,5,0])
            rotate([45,0,0])
            cube([50,h,h],center=true);

            translate([0,-5,0])
            rotate([45,0,0])
            cube([50,h,h],center=true);
        }

        cube([50,30,h],center=true);
    }
}

module part(w, od, id, end1=0, end2=0) {

    module _screw_hole() {
        union() {
            cylinder(d=7.5,h=0.601,$fn=40);

            translate([0,0,0.6]) {
                cylinder(d=3.6,h=10,$fn=40);
                cylinder(d1=7.5,d2=3,h=3,$fn=40);
            }
        }
    }

    difference() {
        union() {
            translate([w/2,0,h/2])
            cube([w,od,h],center=true);

            if (end1 == 0) {
                translate([-50/2+0.5,0,4.4/2])
                _joint(4.4);
            } else {
                translate([-end1/2,0,h/2])
                cube([end1,od,h],center=true);
            }
        }

        if (end2 == 0) {
            translate([w-0.5,0,10/2+4.4])
            cube([w*2,id,10],center=true);

            translate([w-50/2+0.1,0,4.4/2])
            _joint(5);
        } else {
            translate([(w-end2+1)/2,0,10/2+4.4])
            cube([w-end2+1,id,10],center=true);
        }

        // screw holes
        if (end2 == 0) {
            translate([w-70,0,-0.1])
            _screw_hole();
        } else {
            translate([w-end2-20,0,-0.1])
            _screw_hole();
        }
        if (end1 == 0) {
            translate([-20,0,-0.1])
            _screw_hole();
        } else {
            translate([20,0,-0.1])
            _screw_hole();
        }
    }
}

module part2(w=200,end=false) {

    module _joint2() {

        translate([w/2,20/2,0])
        difference() {
            union() {
                cube([100,20,h+1],center=true);

                translate([-100/2,0,0])
                rotate([0,45,0])
                cube([h,20,h],center=true);
            }

            translate([-100/2,-20/2,0])
            rotate([45,0,0])
            cube([49.5,5,5],center=true);
        }

        translate([w/2-7,0,0]) {
            rotate([90,0,0])
            cylinder(d=3.4,h=30,center=true,$fn=20);

            translate([0,-23/2,0])
            rotate([90,0,0])
            cylinder(d=9,h=6,center=true,$fn=20);
        }

        translate([w/2-43,0,0]) {
            rotate([90,0,0])
            cylinder(d=3.4,h=30,center=true,$fn=20);

            translate([0,-23/2+4,0])
            rotate([90,0,0])
            rotate([0,0,30])
            M3_nut(5);
        }

        translate([w/2,0,0])
        rotate([45,0,0])
        cube([50,5,5],center=true);

    }

    difference() {
        union() {
            cube([w,23,h],center=true);

            translate([w/2,0,0])
            intersection() {
                rotate([0,45,0])
                cube([h,23,h],center=true);

                cube([h*2,23,h],center=true);
            }

            if (!end) {
                translate([-w/2,0,0])
                intersection() {
                    rotate([0,45,0])
                    cube([h,23,h],center=true);

                    cube([h*2,23,h],center=true);
                }
            }
        }

        _joint2();

        if (!end) {
            rotate([0,0,180])
            _joint2();
        }

        translate([0,23/4,0])
        cube([w+10,0.05,h-2],center=true);

        translate([0,-23/4,0])
        cube([w+10,0.05,h-2],center=true);
    }
}