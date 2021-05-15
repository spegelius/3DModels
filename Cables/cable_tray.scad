
use <../Dollo/NEW_long_ties/include.scad>;

wall = 1.3;
hole_interval = 100;

width = 30;
depth = 13;

//debug_angled();
//debug_chamfer();
//debug_special1();

//cable_tray(248.5/2);
//cable_tray(240);
//cable_tray(149);
//cable_tray(190);
//cable_tray(130, top_guides=false, bottom_guides=false);
//cable_tray(180, chamfer=2);
//cable_tray(200, chamfer=1, support=true);
//cable_tray(200, chamfer=2);
//cable_tray(180, chamfer=1, support=true);
//cable_tray(300, bottom_guides=false);
//cable_tray_300_x2();

//cable_tray(80, top_chamfer=-45);
//cable_tray(80, top_chamfer=45);
//cable_tray(80, bottom_chamfer=45, support=true);
//cable_tray(130, top_chamfer=-45);
//cable_tray(138, bottom_chamfer=-45, support=true);
//cable_tray(140, top_guides=1);
//cable_tray(125, bottom_guides=0);

//cable_tray_special1();
//cable_tray_special2();

//cable_tray_cover_special1();
//cable_tray_cover_special2();

//cable_tray_cover(140);
cable_tray_cover(186);
//cable_tray_cover_300_x4();
//cable_tray_cover_300_x6();

//corner_tray();
//corner_tray_cover(100, 100);

//corner_tray(150, 100);
//corner_tray_cover(150, 100);

//corner_tray(125, 125);

//corner_tray(100, 100);
//corner_tray_cover(120, 120);
//corner_tray_cover(105, 105);
//corner_tray_cover(95, 145);
//corner_tray_cover();

//cable_tray_cover_angled(h=50);
//cable_tray_cover_angled2(h=80);

//cable_clip();


module _screw_hole() {
    rotate([90,0,0])
    hull() {
        cube([0.1,9,20],center=true);
        cube([4,5,20],center=true);
    }
}

module _tray_edge(h) {
    aspect = 7.5/4;
    union() {
        cube([3,5,h+1],center=true);

        translate([0,-5/2+wall/2,0])
        hull() {
            cube([5,wall,h+1],center=true);

            translate([-1/2+5/2,0,0])
            cube([1,wall*aspect*2,h+1],center=true);
        }
    }
}

module _tray(h=100) {

    translate([0,0,h/2])
    difference() {
        // main form
        rounded_cube_side(
            width,depth,h,1,center=true,$fn=20);

        // tray opening
        translate([0,-depth/2+7.1/2+wall,0])
        hull() {
            cube([width-2*wall,7.1,h+10],center=true);

            translate([0,-1/2+7.1/2+4,0])
            cube([width-2*wall-15,1,h+1],center=true);
        }

        // center opening
        translate([0,depth/2])
        cube([22,10,h+10],center=true);

        // clipping edges
        translate([width/2,depth/2,0])
        _tray_edge(h);

        translate([-width/2,depth/2,0])
        mirror([1,0,0])
        _tray_edge(h);
    }
}

module cable_tray(
    h=100, hole_offset=10, top_guides=2, bottom_guides=1, bottom_chamfer=0, top_chamfer=0, support=false) {

    // guide 0 = none
    // guide 1 = holes
    // guide 2 = clips

    h_o = hole_offset;

    module _guides_1() {
        translate([30/4,0,0])
        rotate([0,45,0])
        cube([4.1,14,4.1],center=true);

        translate([-30/4,0,0])
        rotate([0,45,0])
        cube([4.1,14,4.1],center=true);
    }

    module _guides_2() {
        translate([30/4,-13/2+wall/2,0])
        rotate([0,45,0])
        cube([4,wall,4],center=true);

        translate([-30/4,-13/2+wall/2,0])
        rotate([0,45,0])
        cube([4,wall,4],center=true);
    }

    module _main_tray() {
        difference() {
            union() {
                _tray(h=h);

                if (top_guides == 2 && 
                      top_chamfer == 0) {
                    // top guides
                    translate([0,0,h+1])
                    _guides_2();
                }

                if (bottom_guides == 2 && 
                      bottom_chamfer == 0) {
                    // bottom guides
                    translate([0,0,-1])
                    _guides_2();
                }
            }

            if (top_guides == 1 && top_chamfer == 0) {
                // top guides
                translate([0,0,h-1])
                _guides_1();
            }

            if (bottom_guides == 1 && 
                  bottom_chamfer == 0) {
                // bottom guides
                translate([0,0,1])
                _guides_1();
            }

            // screw holes
            if (h < 100) {
                translate([0,0,h/2])
                 _screw_hole();
            } else {
                for(i=[0:100]) {
                    translate([0,0,h_o+i*hole_interval])
                    _screw_hole();
                }
            }

            // top chamfer
            if (top_chamfer != 0) {
                translate([0,0,h-depth/2])
                rotate([top_chamfer,0,0])
                translate([0,0,20/2])
                cube([width+1,2*depth,20],center=true);
            }

            // bottom chamfer
            if (bottom_chamfer != 0) {
                translate([0,0,depth/2])
                rotate([bottom_chamfer,0,0])
                translate([0,0,-20/2])
                cube([width+1,2*depth,20],center=true);
            }
        }
    }

    module _support() {

        intersection() {
            translate([0,0,-30+depth-1])
            difference() {
                _tray(30);

                translate([0,0,30-depth/2])
                rotate([bottom_chamfer,0,0])
                translate([0,0,20/2])
                cube([width+1,2*depth,20],center=true);
            }

            translate([0,0,depth/2])
            cube([width+1,depth*2,depth],center=true);
        }

        // left
        translate([-width/2+1/2,-depth/2+1,depth/2])
        cube([0.8,1,depth],center=true);

        translate([-width/2+1/2,-depth/2+3,depth/2])
        cube([0.8,1,depth],center=true);

        translate([-width/2+1/2,-depth/2+6,depth/2])
        cube([0.8,1,depth],center=true);

        translate([-width/2+1/2,-depth/2+8.9,depth/2])
        cube([0.8,1,depth],center=true);

        translate([-width/2+1/2+3,-depth/2+12,depth/2])
        cube([0.8,1,depth],center=true);

        // right
        translate([width/2-1/2,-depth/2+1,depth/2])
        cube([0.8,1,depth],center=true);

        translate([width/2-1/2,-depth/2+3,depth/2])
        cube([0.8,1,depth],center=true);

        translate([width/2-1/2,-depth/2+6,depth/2])
        cube([0.8,1,depth],center=true);

        translate([width/2-1/2,-depth/2+8.9,depth/2])
        cube([0.8,1,depth],center=true);

        translate([width/2-1/2-3,-depth/2+12,depth/2])
        cube([0.8,1,depth],center=true);

        if (bottom_chamfer < 0) {
            translate(
                [width/2-1/2-4,-depth/2+1/2,depth/2])
            cube([1,0.8,depth],center=true);

            translate(
                [width/2-1/2-8,-depth/2+1/2,depth/2])
            cube([1,0.8,depth],center=true);

            translate(
                [width/2-1/2-12,-depth/2+1/2,depth/2])
            cube([1,0.8,depth],center=true);


            translate(
                [-width/2+1/2+4,-depth/2+1/2,depth/2])
            cube([1,0.8,depth],center=true);

            translate(
                [-width/2+1/2+8,-depth/2+1/2,depth/2])
            cube([1,0.8,depth],center=true);

            translate(
                [-width/2+1/2+12,-depth/2+1/2,depth/2])
            cube([1,0.8,depth],center=true);
            
        }
    }

    // bottom chamfer support
    union() {
        _main_tray();

        if (bottom_chamfer != 0) {
            if (support) {
                _support();
            }
        }
    }
}

module _chamfer(length=50, both_ends=false) {
    difference() {
        children();

        translate([-30/2,-50/2,length+.01])
        rotate([0,90/4,0])
        cube([100,50,50]);

        if(both_ends) {
            translate([-30/2,-50/2-0.01,0])
            rotate([0,-90/4,0])
            translate([0,0,-length])
            cube([100,50,50]);
        }
    }
}

module _cornerize(len1, len2) {
    union() {
        children(0);

        translate([-30/2,0,len1])
        rotate([0,90/4*2,0])
        translate([30/2,0,0])
        union() {
            children(1);

            translate([-30/2,0,50])
            rotate([0,90/2,0])
            translate([30/2,0,len2])
            mirror([0,0,1])
            children(2);
        }
    }
}

module corner_tray(len1=80, len2=80) {
    l1 = len1 - 35.35;
    l2 = len2 - 35.35;

    translate([30/2,l1+30+5.35,0])
    rotate([90,0,0])
    _cornerize(l1, l2) {
        // tray with quide holes
        difference() {
            _chamfer(l1)
            _tray(l1);

            // bottom guides
            translate([30/4,0,1])
            rotate([0,45,0])
            cube([4.1,14,4.1],center=true);

            translate([-30/4,0,1])
            rotate([0,45,0])
            cube([4.1,14,4.1],center=true);

            translate([0,0,l1/2])
            _screw_hole();
        }

        // middle tray
        _chamfer(50, both_ends=true)
        _tray(50);

        // tray with quides
        union() {
            difference() {
                _chamfer(l2)
                _tray(l2);

                translate([0,0,l2/2])
                _screw_hole();
            }

            // top guides
            translate([-30/4,-13/2+wall/2,-1])
            rotate([0,45,0])
            cube([4.1,wall,4.1],center=true);

            translate([30/4,-13/2+wall/2,-1])
            rotate([0,45,0])
            cube([4.1,wall,4.1],center=true);
        }
    }
}

module corner_tray_cover(len1=80, len2=80) {
    l1 = len1 - 35.35;
    l2 = len2 - 35.35;

    mirror([1,0,0])
    translate([30/2,l1+30+5.35,0])
    rotate([90,0,0])
    _cornerize(l1, l2) {
        _chamfer(l1)
        cable_tray_cover(h=l1);

        _chamfer(50, both_ends=true)
        cable_tray_cover(h=50);

        _chamfer(l2)
        cable_tray_cover(h=l2);
    }
}

module cable_tray_cover(h=100) {
    translate([0, 0, h/2])
    difference() {
        rounded_cube_side(30, 4, h, 1, center=true, $fn=20);

        hull() {
            translate([0, (4 - wall - 1.3)/2 - 4/2 + wall])
            cube([30 - 2*wall, 4 - wall - 1.3, h + 1], center=true);

            translate([0, 3.7, 0])
            cube([5, 1, h + 1], center=true);
        }

        translate([0, 4/2, 0])
        cube([25.2, 4, h + 1], center=true);
    }
}

module cable_tray_cover_angled(h=100, support=true) {
    difference() {
        union() {
            cable_tray_cover(h=h);

            translate([0,0,4])
            intersection() {
                rotate([-45,0,0])
                rounded_cube_side(30,28,40,1,center=true,$fn=20);

                translate([0,-20/2-1,20/2])
                cube([30,20,20],center=true);
            }
        }
        translate([0,0,4])
        intersection() {
            rotate([-45,0,0])
            cube([30-2*wall,28-2*wall,40],center=true);

            translate([0,-20/2,20/2-1])
            cube([30,20,20],center=true);
        }

        translate([0,-4/2-0.5,0])
        cube([31,4,8],center=true);
    }

    if (support) {
        intersection() {
            difference() {
                rounded_cube_side(30,39.5,7.6,1,center=true,$fn=20);
                rounded_cube_side(30-2*wall,39.5-3,8,0.1,center=true,$fn=20);
            }

            translate([0,-40/2-1,3.8/2])
            cube([40,40,3.8],center=true);
        }
    }
}

module cable_tray_cover_angled2(h=100, support=true) {
    difference() {
        union() {
            cable_tray_cover(h=h - 10.5);

            intersection() {
                rotate([-45,0,0])
                rounded_cube_side(
                    width,28,40,1,center=true,$fn=20);

                translate([0,-20/2-1,20/2])
                cube([30,20,20],center=true);
            }
        }

        intersection() {
            rotate([-45,0,0])
            cube([30-2*wall,28-2*wall,40],center=true);

            translate([0,-20/2,20/2-1])
            cube([30,20,20],center=true);
        }

        translate([0,-20.5,0])
        cube([width+1,10,10],center=true);
    }

    if (support ) {
        translate([0,-15.5,2.4/2])
        cube([width-3.5,1,2.4],center=true);
    }
}

module cable_clip() {
    difference() {
        union() {
            hull() {
                cylinder(d=9,h=1.6);

                translate([0,11-1/2,1.5/2])
                cube([3,1,1.5],center=true);
            }
            translate([0,11-6.4/2,4/2])
            cube([4,6.4,4],center=true);
        }
        cylinder(d=4.4,h=5,$fn=20);

        translate([0,11-6.4/2,1.8/2+2.2/2])
        cube([6,2.7,1.8],center=true);
    }
}

module cable_tray_300_x2() {
    cable_tray(300);

    translate([0,13+2,0])
    cable_tray(300);

    for(i=[1:5]) {
        translate([-30/2+3,13/2+1,i*50])
        cube([1,3,1],center=true);

        translate([30/2-3,13/2+1,i*50])
        cube([1,3,1],center=true);
    }
}

module cable_tray_200_x2() {
    cable_tray(200);

    translate([0,13+2,0])
    cable_tray(200);

    for(i=[1:4]) {
        translate([-30/2+3,13/2+1,i*50])
        cube([1,3,1],center=true);

        translate([30/2-3,13/2+1,i*50])
        cube([1,3,1],center=true);
    }
}

module cable_tray_special1(l=53, bottom_chamfer=45) {

    rotate([90,0,0])
    union() {
        intersection() {
            cable_tray(
                l, top_guides=0,
                bottom_chamfer=bottom_chamfer);

            difference() {
                hull() {
                    translate([-width/2+15/2,0,l-15/2])
                    rotate([90,0,0])
                    cylinder(d=15,h=25,center=true,$fn=80);

                    cube([width+1,25,1],center=true);

                    translate([width/2,0,l/2])
                    cube([1,25,l],center=true);
                }
                translate([width/2,wall,l-wall-15/2])
                cube([10,depth,15],center=true);
            }
        }

        translate([0,0,l-15/2])
        difference() {
            difference() {
                hull() {
                    translate([-width/2+15/2,1/2,0])
                    rotate([90,0,0])
                    cylinder(
                        d=15,h=depth-1,center=true,$fn=80);

                    translate([0,1/2,0])
                    cube([width,depth-1,1],center=true);

                    translate([width/2-1/2,1/2,0])
                    cube([1,depth-1,15],center=true);
                }
            }
            hull() {
                translate(
                    [-width/2+15/2,0,0])
                rotate([90,0,0])
                cylinder(
                    d=15-2*wall,h=depth+1,
                    center=true,$fn=80);

                cube(
                    [width-2*wall,depth+1,1],
                    center=true);

                translate([width/2,0,0])
                cube([1,depth+1,15-2*wall],center=true);
            }
            translate([0,0,-15/2+2])
            cube([width+5,depth+5,15],center=true);
        }
    }
}

module cable_tray_special2() {
    mirror([1,0,0])
    cable_tray_special1(l=50, bottom_chamfer=0);
}

module cable_tray_cover_special1(l=53, support=true) {
    difference() {
        union() {
            intersection() {
                cable_tray_cover_angled2(
                    h=l, support=support);

                hull() {
                    translate(
                        [width/2-15/2,0,l-15/2-10.5])
                    rotate([90,0,0])
                    cylinder(
                        d=15,h=depth*3,center=true,
                        $fn=80);

                    cube(
                        [width+1,depth*3,1],center=true);

                    translate([-width/2,0,l/2])
                    cube([1,depth*3,l],center=true);
                }
            }
            hull() {
                translate(
                    [-50/2,-4/2+wall/2,l-(l-28)/2-10.5])
                cube([50,wall,l-28],center=true);
            }
        }
        translate([10,wall,l-10.5-10/2+4.4])
        cube([width+1,4,10],center=true);

        translate([-10,wall,l-10.5])
        cube([width+1,4,2*wall+0.1],center=true);
    }
    // support
    s_h = 17.5-0.1;
    translate([-34.5-15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([-24-15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([-14-15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([-4-15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([-35/2-15,-4/2+wall/2,s_h/2])
    cube([34,0.5,s_h],center=true);
}

module cable_tray_cover_special2(support=true) {
    l = 50;
    difference() {
        union() {
            intersection() {
                cable_tray_cover(h=l);

                hull() {
                    translate(
                        [-width/2+15/2,0,l-15/2])
                    rotate([90,0,0])
                    cylinder(
                        d=15,h=depth*3,center=true,
                        $fn=80);

                    cube(
                        [width+1,depth*3,1],center=true);

                    translate([width/2,0,l/2])
                    cube([1,depth*3,l],center=true);
                }
            }
            hull() {
                translate(
                    [50/2,-4/2+wall/2,l-(l-28)/2])
                cube([50,wall,l-28],center=true);
            }
        }
        translate([-10,wall,l-10/2+4.4])
        cube([width+1,4,10],center=true);

        translate([10,wall,l])
        cube([width+1,4,2*wall+0.1],center=true);
    }
    // support
    s_h = 28-0.1;
    translate([34.5+15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([24+15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([14+15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([4+15,-4/2+wall/2,s_h/2])
    cube([1,5,s_h],center=true);

    translate([35/2+15,-4/2+wall/2,s_h/2])
    cube([34,0.5,s_h],center=true);
}

module cable_tray_cover_300_x4() {
    for(j=[0:3]) {
        translate([0,j*6,0])
        cable_tray_cover(300);
    }
    
    for(j=[0:2]) {
        translate([0,j*6,0])
        for(i=[1:5]) {
            translate([-30/2+1.9,4/2+1,i*50])
            cube([1,3,1],center=true);

            translate([30/2-1.9,4/2+1,i*50])
            cube([1,3,1],center=true);
        }
    }
}

module cable_tray_cover_300_x6() {
    union() {
        cable_tray_cover_300_x4();

        translate([16,9,0])
        rotate([0,0,90])
        cable_tray_cover(300);

        translate([-16,9,0])
        rotate([0,0,-90])
        cable_tray_cover(300);

        for(i=[1:5]) {
            translate([-30/2+0.5,-4/2-1,i*50])
            cube([1,3,1],center=true);

            translate([30/2-0.5,-4/2-1,i*50])
            cube([1,3,1],center=true);

            translate([-30/2+0.5,21,i*50])
            cube([1,3,1],center=true);

            translate([30/2-0.5,21,i*50])
            cube([1,3,1],center=true);
        }
    }
}

module debug_angled() {
    difference() {
        cable_tray(
            50, top_guides=false, bottom_guides=false);

        translate([-31/2,-13/2,0])
        rotate([-45])
        cube([31,20,30]);
    }

    translate([0,6,13])
    rotate([0,0,180])
    cable_tray_cover(40);

    translate([0,-13/2,13/2-0.1])
    rotate([-90,0,0])
    mirror([0,1,0])
    difference() {
        cable_tray(
            50, top_guides=false, bottom_guides=false);

        translate([-31/2,-13/2,0])
        rotate([-45])
        cube([31,20,30]);
    }

    translate([0,6.5+1.5,12.5])
    rotate([-90,0,0])
    cable_tray_cover_angled(h=40);

}

module debug_chamfer() {
    translate([0,depth/2,0])
    cable_tray(50, bottom_chamfer=45);

    rotate([90,0,180])
    translate([0,depth/2,0])
    cable_tray(50, bottom_chamfer=45);

    translate([0,13-0.2,10.5])
    rotate([0,0,180])
    cable_tray_cover_angled2(50);

    translate([0,28.3,12.8])
    rotate([-90,0,0])
    cable_tray_cover(21.7);
}

module debug_special1() {
    translate([0,depth/2,0])
    rotate([-90,0,0])
    cable_tray_special1();

    rotate([90,0,180])
    translate([0,depth/2,0])
    cable_tray(50, bottom_chamfer=45);

    translate([0,13-0.2,10.5])
    rotate([0,0,180])
    cable_tray_cover_special1(support=false);
}
