use <../Dollo/NEW_long_ties/include.scad>;


////// VARIABLES //////
// thickness of top bracket
h = 20;

// bolt hole dia
bolt_d = 4.5;

// slop between parts
slop = 0.25;

// section values
wall = 1.2;
bracket_wall = 1.6;
section_hole_w = 166;
section_hole_l = 16;
section_w = section_hole_w;
//section_w = 220;
section_l = section_hole_l-2*slop;
section_y_pos = 20 + (section_hole_l + 4)/2;
section_head_outer_d = section_hole_l - 2*wall - 0.4;
section_head_d = 11 + slop;
section_quide_1 = 10+(166-15) / 3;
section_quide_2 = 166 - section_quide_1;
//section_quide_3 = 220 - 35;

echo("Guide positions:")
echo(section_quide_1);
echo(section_quide_2);
if (!is_undef(section_quide_3))
    echo(section_quide_3);

// positions for holes
x_pos_1 = 15;
x_pos_2 = x_pos_1 + 10;
x_pos_3 = 166 - section_hole_l/2 - 20;
x_pos_4 = x_pos_3 + 10;


////// VIEW //////
//debug_section();
//debug();

//shelf_top_bracket();
//shelf_section_bracket_1();
//shelf_section_bracket_1(open=true);
//shelf_section_bracket_2();
//shelf_section_bracket_2(open=true);
//shelf_section_bracket_middle();
//shelf_section_bracket_middle(open=true);
//shelf_section_bracket_support();
//shelf_section_bracket_support_small();
//shelf_section_joiner_1();
//shelf_section_joiner_2();
//shelf_section_200();
//shelf_section_280(configuration=3);
//shelf_section_300();
//shelf_section_300(configuration=1);
shelf_section_330(configuration=2);
//shelf_section_400();
//test_shelf_section_bottom();

//%translate([0,-200,0])
//cube([200,200,1]);

////// MODULES //////
module arc(d, x, y, size_x, size_y) {
    intersection() {
        translate([x,y,0])
        difference() {
            chamfered_cylinder(d,h,2.5,$fn=160);
            cylinder(d=d-20,h=3*h,center=true,$fn=160);

            translate([0,0,-10+2.5])
            chamfered_cylinder(d-20+5,10,2.5,$fn=160);

            translate([0,0,h-2.5])
            chamfered_cylinder(d-20+5,10,2.5,$fn=160);

        }
        translate([5,0,0])
        cube([size_x,size_y,h]);
    }
}

module shelf_top_bracket() {
    difference() {
        union() {
            hull() {
                cylinder(d=10,h=h,$fn=30);

                translate([0,180,0])
                cylinder(d=10,h=h,$fn=30);
            }
            translate([0,120,0]) hull() {
                cylinder(d=10,h=h,$fn=30);

                translate([160,50,0])
                cylinder(d=10,h=h,$fn=30);
            }
            arc(600, 276.4, -100.4, 160, 170);
            
            translate([25,105,h/2])
            rotate([0,0,-35])
            cube([55,10,h],center=true);
        }
        
        // mount holes
        translate([0,50,h/2])
        rotate([0,90,0])
        cylinder(d=5,h=20,center=true,$f=30);

        translate([40/2,50,h/2])
        rotate([0,90,0])
        cylinder(d=12,h=40,center=true,$f=30);

        translate([0,180-10,h/2])
        rotate([0,90,0])
        cylinder(d=5,h=20,center=true,$f=30);

        translate([40/2,180-10,h/2])
        rotate([0,90,0])
        cylinder(d=12,h=40,center=true,$f=30);

        translate([25,140,h/2])
        rotate([90,0,0])
        cylinder(d=4,h=40,center=true,$f=30);

        translate([125,150,h/2])
        rotate([90,0,0])
        cylinder(d=4,h=40,center=true,$f=30);
        
        // infill
        translate([0,200/2-10,7])
        cube([0.1,200,0.2],center=true);

        translate([0,200/2-10,h-7])
        cube([0.1,200,0.2],center=true);
        
        translate([200/2-20,144,7])
        rotate([0,0,18])
        cube([220,0.1,0.2],center=true);

        translate([200/2-20,144,h-7])
        rotate([0,0,18])
        cube([220,0.1,0.2],center=true);
    }
}

module _section_form(width,depth,height) {
    hull() {
        translate([1/2,0,height/2])
        cube([1,depth,height],center=true);

        translate([width-depth/2,0,0])
        cylinder(d=depth,h=height,$fn=50); 
    }
}

module _backet_mount_hole() {
    translate([0,0,h/2])
    rotate([0,90,0])
    cylinder(d=5,h=20,center=true,$f=30);

    translate([80/2,0,h/2])
    rotate([0,90,0])
    cylinder(d=12,h=80,center=true,$f=30);
}

module _shelf_section_bracket_base(open=false) {
    head_d = 10;

    difference() {
        union() {
            difference() {
                union() {
                    // back
                    hull() {
                        chamfered_cylinder(10,h,2.5,$fn=30);

                        translate([0,180,0])
                        chamfered_cylinder(10,h,2.5,$fn=30);
                    }
                    translate([2,section_y_pos,0])
                    _section_form(section_hole_w+2,section_hole_l+4,h);

                    translate([-5,
                        section_y_pos+section_hole_l/2+2-10,0])
                    arc(300,300/2-2,300/2,145,135);

                    translate([22,57,h/2])
                    rotate([0,90,45])
                    //cube([52,10,h],center=true);
                    chamfered_cube_side(h,10,55,2.5,center=true);
                }
                translate([2,section_y_pos,-1/2])
                _section_form(section_hole_w,section_hole_l,h+1);

                if (open) {
                    translate([section_hole_w+2,section_y_pos,(h+1)/2])
                    cube([section_hole_l,section_hole_l,h+1],center=true);
                }
                
                // mount holes
                translate([0,8,0])
                _backet_mount_hole();

                translate([0,180-10,0])
                _backet_mount_hole();

                // infill
                translate([0,200/2-10,7])
                cube([0.1,200,0.2],center=true);

                translate([0,200/2-10,h-7])
                cube([0.1,200,0.2],center=true);
            }
        }
    }
}

module _shelf_section_bracket(nuts=true, open=false) {
    
    module _mount_stud(width, depth) {
        //cube([x_pos_2-x_pos_1+11,section_head_outer_d-1,bracket_wall+7],center=true);
        chamfered_cube(width,depth,bracket_wall+7,1,center=true);
    }
    
    difference() {
        union() {
            union() {
                _shelf_section_bracket_base(open=open);
                // bottom
                translate([2,20+(section_l+4)/2,0])
                _section_form(section_hole_w+1,section_hole_l+1,bracket_wall);
            }
            // section mount studs
            if (nuts) {
                translate([2+x_pos_1 + 10/2,section_y_pos,(bracket_wall+7)/2])
                _mount_stud(x_pos_2-x_pos_1+11, section_head_outer_d-1);

                translate([2+x_pos_3 + 10/2,section_y_pos,(bracket_wall+7)/2])
                _mount_stud(x_pos_4-x_pos_3+11, section_head_outer_d-1);
            } else {
                translate([2+x_pos_1 + 10/2,section_y_pos,(bracket_wall+7)/2])
                _mount_stud(x_pos_2-x_pos_1+18,section_head_outer_d);

                translate([2+x_pos_3 + 10/2,section_y_pos,(bracket_wall+7)/2])
                 _mount_stud(x_pos_4-x_pos_3+18,section_head_outer_d);
            }
        }
        // section mount holes
        translate([2+x_pos_1,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.2])
            cylinder(d=bolt_d,h=8,$fn=25);
        }
        
        translate([2+x_pos_2,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.2])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
            
        translate([2+x_pos_3,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.2])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
        translate([2+x_pos_4,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.2])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
    }
}

module shelf_section_bracket_2(open=false) {
    difference() {
        _shelf_section_bracket(nuts=true, open=open);
        translate([2,section_y_pos,0]) {
            translate([1/4,0,-10])
            _shelf_section_quides(14,length=9,extra=0.4);

            translate([x_pos_1,0,-0.1]) {
                M4_nut_tapering(h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }

            translate([x_pos_2,0,-0.1]) {
                M4_nut_tapering(h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }

            translate([x_pos_3,0,-0.1]) {
                M4_nut_tapering(h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }

            translate([x_pos_4,0,-0.1]) {
                M4_nut_tapering(h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }
        }
    }
}

module shelf_section_bracket_1(open=false) {
    difference() {
        mirror([0,1,0])
        _shelf_section_bracket(nuts=false, open=open);

        translate([2,-section_y_pos]) {
            // section mount studs
            translate([x_pos_1-1,0,-0.1]) {
                hull() {
                    cylinder(d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    cylinder(d=section_head_d-1,h=bracket_wall+5.1,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d-1,h=bracket_wall+5.1,$fn=25);
                }
            }

            translate([x_pos_3-1,0,-0.1]) {
                hull() {
                    cylinder(d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    cylinder(d=section_head_d-1,h=bracket_wall+5.1,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d-1,h=bracket_wall+5.1,$fn=25);
                }
            }
        }
    }
}

module shelf_section_bracket_middle(open=false) {
    union() {
        difference() {
            union() {
                _shelf_section_bracket_base(open=open);

                translate([2,section_y_pos,h/2-wall/2])
                _section_form(section_hole_w+1,section_hole_l+1,wall);
            }

            translate([2,section_y_pos,0]) {
                translate([x_pos_1,0,0])
                cylinder(d=bolt_d,h=h,$fn=25);

                translate([x_pos_2,0,0])
                cylinder(d=bolt_d,h=h,$fn=25);

                translate([x_pos_3,0,0])
                cylinder(d=bolt_d,h=h,$fn=25);

                translate([x_pos_4,0,0])
                cylinder(d=bolt_d,h=h,$fn=25);

                translate([1/4,0,-10])
                _shelf_section_quides(h,length=9,extra=0.4);
            }
        }
        translate([2,section_y_pos,h/2-wall/2])
        _section_form(section_hole_w+1,section_hole_l+1,0.2);
    }
}

module shelf_section_bracket_support() {
    difference() {
        union() {
            _shelf_section_bracket_base();

            // reinforcement
            translate([0,20+section_hole_l+wall*2,0])
            cube([section_hole_w,4,h]);
        }
        translate([5,20,0])
        cube([section_hole_w,section_hole_l+2,h+1]);

        // chamfer
        translate([2+section_hole_w+2-(section_hole_l+4)/2,
                   section_y_pos,0])
        rotate([0,0,60])
        translate([(section_hole_l+4)/2+5/2,0,h/2])
        cube([5,20,h],center=true);
    }
}

module shelf_section_bracket_support_small() {
    difference() {
        union() {
            // back
            hull() {
                chamfered_cylinder(10,h,2.5,$fn=30);

                translate([0,80,0])
                chamfered_cylinder(10,h,2.5,$fn=30);
            }
 
            hull() {
                chamfered_cylinder(10,h,2.5,$fn=30);

                translate([1,1,0])
                chamfered_cylinder(10,h,2.5,$fn=30);
            }

            hull() {
                translate([50,section_hole_l+2-5+2.1,0])
                chamfered_cylinder(10,h,2.5,$fn=30);

                translate([0,60,0])
                chamfered_cylinder(10,h,2.5,$fn=30);

            }

            translate([2+41/2,(section_hole_l+2)/2+2.1,h/2])
            cube([50,section_hole_l+2,h],center=true);
        }
        translate([2,section_hole_l/2+2,-1/2])
        _section_form(section_hole_w,section_hole_l,h+1);

        // mount holes
        translate([0,32,0])
        _backet_mount_hole();

        translate([0,80-8,0])
        _backet_mount_hole();

    }
}

module _shelf_section_quides(height, length=7, extra=0) {

    g_l = section_hole_l - 2*wall + extra;

    difference() {
        union() {
            translate([wall+1.5/2,0,height-5+length/2])
            cube([1.5+extra,g_l,length], center=true);

            translate([section_quide_1,0,3+(height-1)/2])
            cube([1+extra,g_l,height-1], center=true);

            translate([section_quide_2,0,3+(height-1)/2])
            cube([1+extra,g_l,height-1], center=true);

            translate([section_w-15/2,0,height-5+length/2])
            cube([1.5+extra,g_l,length], center=true);
            
            if (!is_undef(section_quide_3)) {
                translate([section_quide_3,0,3+(height-1)/2])
                cube([1+extra,g_l,height-1], center=true);

                translate([section_w-15/2,0,height-5+length/2])
                cube([1.5+extra,g_l,length], center=true);
            }

            translate([section_w-15/2+(15/2-1+extra)/2,
                       0,
                       height-5+length/2])
            cube([15/2-1+extra,1.5+extra,length],center=true);
        }
        translate([0,0,height])
        difference() {
            _section_form(section_w,section_l,5);

            translate([wall+slop-extra/2,0,0])
            _section_form(section_w-2*wall-2*slop+extra,
                          section_l-2*wall-2*slop+extra,
                          6);
        }
    }
}

// configurations:
// 0 = 4 rod tubes
// 1 = rod tubes 1 and 3
// 2 = rod tubes 2 and 4
// 3 = rod tubes 1 and 3 + joint tubes 2 and 4
// 4 = rod tubes 2 and 4 + joint tubes 1 and 3
module _shelf_section(height, configuration=0) {
    
    module _rod_tube(h, nut=false) {
        cylinder(d=bolt_d+2.2,h=h,$fn=40);
        if (nut) {
            translate([0,0,h-6])
            hull() {
                cylinder(d=bolt_d+3,h=5,$fn=40);

                translate([0,0,1.5])
                cylinder(d=bolt_d+6,h=4,$fn=40);
            }
        }
    }
    
    module _rod_hole(h) {
        translate([0,0,h/2]) {
            cylinder(d=bolt_d,h=h,center=true,$fn=40);

            if (h >= 25) {
                chamfered_cylinder(bolt_d+0.7,h-20,1,center=true,$fn=40);
            }
        }
    }

    module _tube_support() {
        h = 7-0.2;
        y = section_l / 4;

        union() {
            tube(7,h,1.5);

            translate([0,y,h/2])
            cube([12,0.5,h],center=true);

            translate([0,-y,h/2])
            cube([12,0.5,h],center=true);

            translate([0,0,0.25/2])
            cube([12,section_l/2,.25],center=true);
        }
    }

    difference() {
        union() {
            difference() {
                _section_form(section_w,section_l,height);

                translate([wall,0,-1])
                _section_form(section_w-2*wall,section_l-2*wall,height+2);
            }

            if (configuration == 0 || configuration == 1 || configuration == 3) {
                translate([x_pos_1,0,7+(height-14)/2])
                cube([1.2,section_hole_l-1,height-14],center=true);
                
                translate([x_pos_3,0,7+(height-14)/2])
                cube([1.2,section_hole_l-1,height-14],center=true);

                translate([x_pos_1-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_3-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_1,0,height-7-2/2])
                cube([11,section_hole_l-1,2],center=true);
                
                translate([x_pos_3,0,height-7-2/2])
                cube([11,section_hole_l-1,2],center=true);

                translate([x_pos_1,0,7+2/2])
                cube([11,14,2],center=true);

                translate([x_pos_3,0,7+2/2])
                cube([11,14,2],center=true);

                translate([x_pos_1,0,0])
                _tube_support();

                translate([x_pos_3,0,0])
                _tube_support();

            }

            if (configuration == 3) {
                translate([x_pos_2,0,7+23/2])
                cube([1.2,section_hole_l-1,23],center=true);

                translate([x_pos_4,0,7+23/2])
                cube([1.2,section_hole_l-1,23],center=true);
                
                translate([x_pos_2-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_4-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_2,0,7+23-2/2])
                cube([11,section_hole_l-1,2],center=true);
                
                translate([x_pos_4,0,7+23-2/2])
                cube([11,section_hole_l-1,2],center=true);

                translate([x_pos_2,0,7+2/2])
                cube([11,section_hole_l-1,2],center=true);
                
                translate([x_pos_4,0,7+2/2])
                cube([11,section_hole_l-1,2],center=true);

                translate([x_pos_2,0,0])
                _tube_support();

                translate([x_pos_4,0,0])
                _tube_support();
            }


            if (configuration == 0 || configuration == 2 || configuration == 4) {
                translate([x_pos_2,0,7+(height-14)/2])
                cube([1.2,section_hole_l-1,height-14],center=true);

                translate([x_pos_4,0,7+(height-14)/2])
                cube([1.2,section_hole_l-1,height-14],center=true);
              
                translate([x_pos_2-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_4-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_2,0,height-7-2/2])
                cube([11,section_hole_l-1,2],center=true);
                
                translate([x_pos_4,0,height-7-2/2])
                cube([11,section_hole_l-1,2],center=true);

                translate([x_pos_2,0,7+2/2])
                cube([11,14,2],center=true);

                translate([x_pos_4,0,7+2/2])
                cube([11,14,2],center=true);
                
                translate([x_pos_2,0,0])
                _tube_support();

                translate([x_pos_4,0,0])
                _tube_support();
            }
            
            if (configuration == 4) {
                translate([x_pos_1,0,7+23/2])
                cube([1.2,section_hole_l-1,23],center=true);

                translate([x_pos_3,0,7+23/2])
                cube([1.2,section_hole_l-1,23],center=true);
                
                translate([x_pos_1-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_3-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_1,0,7+23-2/2])
                cube([11,section_hole_l-1,2],center=true);
                
                translate([x_pos_3,0,7+23-2/2])
                cube([11,section_hole_l-1,2],center=true);

                translate([x_pos_1,0,7+2/2])
                cube([11,section_hole_l-1,2],center=true);
                
                translate([x_pos_3,0,7+2/2])
                cube([11,section_hole_l-1,2],center=true);

                translate([x_pos_1,0,0])
                _tube_support();

                translate([x_pos_3,0,0])
                _tube_support();
            }

            _shelf_section_quides(height);
        }
        if (configuration == 3) {
            translate([x_pos_2,0,7+23-3.6])
            M4_nut(h=3.8, cone=false, bridging=true);

            translate([x_pos_4,0,7+23-3.6])
            M4_nut(h=3.8, cone=false, bridging=true);
        } else if (configuration == 4) {
            translate([x_pos_1,0,7+23-3.6])
            M4_nut(h=3.8, cone=false, bridging=true);

            translate([x_pos_3,0,7+23-3.6])
            M4_nut(h=3.8, cone=false, bridging=true);
        }

        if (configuration == 0) {
            translate([x_pos_1-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_2-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_3-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_4-slop,0,7])
            _rod_hole(height-14, $fn=30);
        } else if (configuration == 1 ) {
            translate([x_pos_1-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_3-slop,0,7])
            _rod_hole(height-14, $fn=30);
        } else if (configuration == 2 ) {
            translate([x_pos_2-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_4-slop,0,7])
            _rod_hole(height-14, $fn=30);
        } else if (configuration == 3 ) {
            translate([x_pos_1-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_2-slop,0,7])
            _rod_hole(23, $fn=30);

            translate([x_pos_3-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_4-slop,0,7])
            _rod_hole(23, $fn=30);
        } else if (configuration == 4 ) {
            translate([x_pos_1-slop,0,7])
            _rod_hole(23, $fn=30);

            translate([x_pos_2-slop,0,7])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_3-slop,0,7])
            _rod_hole(23, $fn=30);

            translate([x_pos_4-slop,0,7])
            _rod_hole(height-14, $fn=30);
        }
    }
}

module shelf_section_joiner_1() {
    height = 80;
    module _base1() {
        difference() {
            _section_form(section_w-2*slop,section_l-2*slop,20);

            translate([0,0,-20])
            rotate([0,0,45])
            shelf_section_200();

            translate([x_pos_2,0,0])
            cylinder(d=bolt_d+1,h=100,center=true,$fn=25);

            cube([2*x_pos_2,30,100],center=true);

            translate([section_quide_1+section_w/2,0,0])
            cube([section_w,30,100],center=true);
        }
    }

    translate([-28,0,0])
    difference() {
        linear_extrude(height)
        offset(delta=-0.2)
        projection()
        _base1();

        linear_extrude(height+1)
        offset(delta=-0.2-wall)
        projection()
        _base1();
    }
}

module shelf_section_joiner_2() {
    height = 80;

    module _base2() {
        difference() {
            _section_form(section_w-2*slop,section_l-2*slop,20);

            translate([0,0,-20])
            rotate([0,0,45])
            shelf_section_200();

            translate([x_pos_3,0,0])
            cylinder(d=bolt_d+1,h=100,center=true,$fn=25);

            translate([section_quide_2-section_w/2,0,0])
            cube([section_w,30,100],center=true);

            translate([section_w,0,0])
            cube([2*(section_l/2+20),30,100],center=true);
        }
    }

    translate([-section_w/2-22,0,0])
    difference() {
        linear_extrude(height)
        offset(delta=-0.2)
        projection()
        _base2();

        linear_extrude(height+1)
        offset(delta=-0.2-wall)
        projection()
        _base2();
    }
}

module shelf_section_200() {
    rotate([0,0,-45])
    _shelf_section(200);
}

module shelf_section_280(configuration=0) {
    rotate([0,0,-45])
    _shelf_section(280, configuration=configuration);
}

module shelf_section_300(configuration=0) {
    rotate([0,0,-45])
    _shelf_section(300, configuration=configuration);
}

module shelf_section_330(configuration=0) {
    rotate([0,0,-45])
    _shelf_section(330, configuration=configuration);
}

module shelf_section_400() {
    rotate([0,0,-45])
    _shelf_section(400);
}

module test_shelf_section_bottom() {
    intersection() {
        rotate([0,0,-45])
        _shelf_section(50);

        translate([0,0,15/2])
        rotate([0,0,-45])
        cube([60,60,15],center=true);
    }
}

module debug_section() {

    // M4 rods to use
    rods = [280, 360];

    // TODO: dynamic prints
    echo("Total lenght: ", str(rods[0] + rods[1] - 30));
    echo("Print: ", str(rods[0]), str(rods[1]-30));

    intersection() {
        union() {
            shelf_section_bracket_1(open=true);

            translate([2+slop,-20-(section_l+4)/2,bracket_wall+0.1])
            _shelf_section(rods[0], configuration=4);

            translate([2+slop,-20-(section_l+4)/2,bracket_wall+0.2+rods[0]])
            _shelf_section(50, configuration=2);

            translate([2+slop,-20-(section_l+4)/2,bracket_wall+0.3+rods[0]+50])
            _shelf_section(50, configuration=3);

            translate([2+slop,-20-(section_l+4)/2,bracket_wall+0.4+rods[0]+100])
            _shelf_section(50, configuration=1);
        }
        translate([0,-29.5,1])
        cube([240,29,500]);
    }

    translate([2+slop, 20+(section_l+4)/2,0])
    cylinder(d=4,h=100,$fn=20);

    intersection() {
        union() {
            shelf_section_bracket_2(open=true);

            translate([2+slop,20+(section_l+4)/2,rods[0]+bracket_wall+0.1])
            rotate([180,0,0])
            _shelf_section(rods[0], configuration=3);

            translate([2+slop,20+(section_l+4)/2,rods[0]+rods[1]-30+bracket_wall+0.1])
            rotate([180,0,0])
            _shelf_section(rods[1]-30, configuration=2);

//            translate([2+slop,20+(section_l+4)/2,rods[0]+rods[1]-30+50+bracket_wall+0.1])
//            rotate([180,0,0])
//            _shelf_section(50, configuration=4);
//
//            translate([2+slop,20+(section_l+4)/2,rods[0]+rods[1]-30+100+bracket_wall+0.1])
//            rotate([180,0,0])
//            _shelf_section(50, configuration=1);
        }
        translate([0,0,2])
        cube([240,29,1500]);
    }
    #translate([17,30,1])
    cylinder(d=4,h=rods[0],$fn=20);

    #translate([27,30,rods[0]-29])
    cylinder(d=4,h=rods[1],$fn=20);

}

module debug() {
    h = 100;
    
    intersection() {
        union() {
            _shelf_section(h);

            translate([-2-slop,-20-(section_l+4)/2,-wall-0.1])
            shelf_section_bracket_1(open=true);

            translate([-2-slop,-20-(section_l+4)/2,h+wall+0.1])
            rotate([180,0,0])
            shelf_section_bracket_2(open=true);
        }

        translate([0,0,-2])
        cube([200,200,h+5]);
    }
    
    #translate([x_pos_1,0,0])
    cylinder(d=4,h=h);
}

