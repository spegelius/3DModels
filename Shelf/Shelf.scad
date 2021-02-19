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
//section_w = 170;
section_w = 220;
section_l = 16-2*slop;
section_y_pos = 20 + (section_l + 2*slop + 4)/2;
section_head_outer_d = section_l + 2*slop - 2*wall - 0.4;
section_head_d = 11 + slop;
//infill = true;
infill = false;

// positions for threaded rod holes
x_pos_1 = 15;
x_pos_2 = x_pos_1 + 10;
x_pos_3 = 166 - (section_l + 2*slop)/2 - 20;
x_pos_4 = x_pos_3 + 10;

//section_quide_1 = x_pos_2 + (x_pos_3 - x_pos_2)/3;
//section_quide_2 = x_pos_3 - (x_pos_3 - x_pos_2)/3;
//section_quide_3 = x_pos_4 + (section_w - x_pos_4)/2;

section_quide_1 = 52;
section_quide_2 = 113;
section_quide_3 = 174;

echo("Guide positions:")
echo(section_quide_1);
echo(section_quide_2);
if (!is_undef(section_quide_3))
    echo(section_quide_3);

////// VIEW //////
//debug_section_bracket();
//debug_section();
//debug_3x100();
//debug_section_support();
//debug_section_end_1();
//debug_section_end_2();

//shelf_top_bracket();
//shelf_section_bracket_1(section_w, section_l);
//shelf_section_bracket_1(section_w, section_l, open=true);
//shelf_section_bracket_2(section_w, section_l);
//shelf_section_bracket_2(section_w, section_l, open=true);
//shelf_section_bracket_middle(section_w, section_l);
//shelf_section_bracket_middle(section_w, section_l, open=true);
//shelf_section_bracket_support(section_w, section_l);
//shelf_section_bracket_support_small(section_w, section_l);
//shelf_section_support(section_w, section_l);

//shelf_section(section_w, section_l, 170, configuration=2);
//shelf_section(170, configuration=3);
//shelf_section(200, configuration=1);
//shelf_section(200, configuration=4);
//shelf_section(200, configuration=2);
//shelf_section(160, configuration=2);
//shelf_section(200, configuration=2, end=1);
//shelf_section(200, configuration=2, end=2);
//shelf_section(250, configuration=2);
//shelf_section(280, configuration=3);
//shelf_section(300);
//shelf_section(300, configuration=1);
//shelf_section(300, configuration=2);
//shelf_section(330, configuration=1);
//shelf_section(330, configuration=2);
//shelf_section(400);
//shelf_section(40, configuration=2, end=1);
//shelf_section(40, configuration=2, end=2);

//test_shelf_section_bottom();

//shelf_section_end_1();
//shelf_section_end_2();

//%translate([0,-200,0])
//cube([200,200,1]);

////// MODULES //////
module _arcify(x, y, size_x, size_y) {
    intersection() {
        translate([x,y,0])
        children();

        translate([5,0,0])
        cube([size_x,size_y,h]);
    }
}

//module arc(d, x, y, size_x, size_y) {
//    intersection() {
//        translate([x,y,0])
//        difference() {
//            chamfered_cylinder(d,h,2.5,$fn=160);
//            cylinder(d=d-20,h=3*h,center=true,$fn=160);
//
//            translate([0,0,-10+2.5])
//            chamfered_cylinder(d-20+5,10,2.5,$fn=160);
//
//            translate([0,0,h-2.5])
//            chamfered_cylinder(d-20+5,10,2.5,$fn=160);
//
//        }
//        translate([5,0,0])
//        cube([size_x,size_y,h]);
//    }
//}

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
            //arc(600, 276.4, -100.4, 160, 170);
            _arcify(276.4, -100.4, 160, 170)
            chamfered_tube(
                d=600,h=h,wall=10,chamfer=2.5,center=false,$fn=100);
            
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

module _section_form(width, depth, height) {
    hull() {
        translate([1/2,0,height/2])
        cube([1,depth,height],center=true);

        translate([width-depth/2,0,0])
        cylinder(d=depth,h=height,$fn=50); 
    }
}

module _bracket_mount_hole() {
    translate([0,0,h/2])
    rotate([0,90,0])
    cylinder(d=5,h=20,center=true,$fn=8);

    translate([80/2,0,h/2])
    rotate([0,90,0])
    cylinder(d=12,h=80,center=true,$fn=20);
}

module _shelf_section_bracket_base(w, l, open=false) {
    head_d = 10;
    
    _l = l + 2 * slop;

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
                    _section_form(w+2,_l+4,h);

                    translate(
                        [-5, section_y_pos+_l/2+2-10,0])
                    _arcify(300/2-2,300/2,145,135)
                    chamfered_tube(
                        d=300,h=h,wall=10,chamfer=2.5,center=false,$fn=160);

                    translate([22,57,h/2])
                    rotate([0,90,45])
                    chamfered_cube_side(h,10,55,2.5,center=true);
                }
                translate([2,section_y_pos,-1/2])
                _section_form(w,_l,h+1);

                if (open) {
                    translate([w+2,section_y_pos,(h+1)/2])
                    cube([_l,_l,h+1],center=true);
                }
                
                // mount holes
                translate([0,8,0])
                _bracket_mount_hole();

                translate([0,180-10,0])
                _bracket_mount_hole();

                // infill
                translate([0,200/2-10,7])
                cube([0.1,200,0.2],center=true);

                translate([0,200/2-10,h-7])
                cube([0.1,200,0.2],center=true);

                translate([22,57,7])
                rotate([0,0,-45])
                cube([0.1,95,0.2],center=true);

                translate([22,57,h-7])
                rotate([0,0,-45])
                cube([0.1,95,0.2],center=true);

                translate([-5, section_y_pos+_l/2+2-10,7])
                _arcify(300/2-2,300/2,155,155)
                tube(300-10,0.2,0.1,center=true,$fn=160);

                translate([-5, section_y_pos+_l/2+2-10,h-7])
                _arcify(300/2-2,300/2,155,155)
                tube(300-10,0.2,0.1,center=true,$fn=160);
                
            }
        }
    }
}

module _shelf_section_bracket(w, l, nuts=true, open=false) {
    
    module _mount_stud(width, depth) {
        chamfered_cube(width,depth,bracket_wall+7,1,center=true);
    }
    
    difference() {
        union() {
            union() {
                _shelf_section_bracket_base(w,l,open=open);

                // bottom
                translate([2,20+(section_l+4)/2,0])
                _section_form(w+1,l+1,bracket_wall);
            }

            // section mount studs
            if (nuts) {
                translate(
                    [2+x_pos_1 + 10/2,section_y_pos,
                    (bracket_wall+7)/2])
                _mount_stud(
                    x_pos_2-x_pos_1+11, section_head_outer_d-1);

                translate(
                    [2+x_pos_3 + 10/2,section_y_pos,
                    (bracket_wall+7)/2])
                _mount_stud(
                    x_pos_4-x_pos_3+11, section_head_outer_d-1);
            } else {
                translate(
                    [2+x_pos_1 + 10/2,section_y_pos,
                    (bracket_wall+7)/2])
                _mount_stud(
                    x_pos_2-x_pos_1+18,section_head_outer_d);

                translate(
                    [2+x_pos_3 + 10/2,section_y_pos,
                    (bracket_wall+7)/2])
                 _mount_stud(
                    x_pos_4-x_pos_3+18,section_head_outer_d);
            }
        }
        // section mount holes
        translate([2+x_pos_1,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.3])
            cylinder(d=bolt_d,h=8,$fn=25);
        }
        
        translate([2+x_pos_2,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.3])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
            
        translate([2+x_pos_3,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.3])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
        translate([2+x_pos_4,section_y_pos,0]) {
            translate([0,0,bracket_wall+5+0.3])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
    }
}

module shelf_section_bracket_2(w, l, open=false) {
    difference() {
        _shelf_section_bracket(w, l, nuts=true, open=open);

        translate([2,section_y_pos,0]) {
            translate([1/4,0,-10])
            _shelf_section_quides(w, l, 14,length=9,extra=0.4);

            translate([x_pos_1,0,-0.1]) {
                M4_nut_tapering(
                    h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }

            translate([x_pos_2,0,-0.1]) {
                M4_nut_tapering(
                    h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }

            translate([x_pos_3,0,-0.1]) {
                M4_nut_tapering(
                    h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }

            translate([x_pos_4,0,-0.1]) {
                M4_nut_tapering(
                    h=bracket_wall+4.5,cone=false,bridging=true);
                cylinder(d=bolt_d,h=10,$fn=25);
            }
        }
    }
}

module shelf_section_bracket_1(w, l, open=false) {
    difference() {
        mirror([0,1,0])
        _shelf_section_bracket(w, l, nuts=false, open=open);

        translate([2,-section_y_pos]) {
            // section mount studs
            translate([x_pos_1-1,0,-0.1]) {
                hull() {
                    cylinder(
                        d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    translate([10+2,0,0])
                    cylinder(
                        d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    cylinder(
                        d=section_head_d-1,h=bracket_wall+5.1,$fn=25);

                    translate([10+2,0,0])
                    cylinder(
                        d=section_head_d-1,h=bracket_wall+5.1,$fn=25);
                }
            }

            translate([x_pos_3-1,0,-0.1]) {
                hull() {
                    cylinder(
                        d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    translate([10+2,0,0])
                    cylinder(
                        d=section_head_d,h=bracket_wall+4.6,$fn=25);

                    cylinder(
                        d=section_head_d-1,h=bracket_wall+5.1,$fn=25);

                    translate([10+2,0,0])
                    cylinder(
                        d=section_head_d-1,h=bracket_wall+5.1,$fn=25);
                }
            }
        }
    }
}

module shelf_section_bracket_middle(w, l, open=false) {
    _l = l + 2*slop;
    union() {
        difference() {
            union() {
                _shelf_section_bracket_base(w, l, open=open);

                translate([2,section_y_pos,h/2-wall/2])
                _section_form(w+1,_l+1,wall);
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
                _shelf_section_quides(w, l, h,length=9,extra=0.4);
            }
        }
        translate([2,section_y_pos,h/2-wall/2])
        _section_form(w+1,_l+1,0.2);
    }
}

module shelf_section_bracket_support(w, l) {
    difference() {
        union() {
            _shelf_section_bracket_base(w, l);

            // reinforcement
            translate([0,20+l+wall*2,0])
            cube([w,5,h]);
        }
        translate([5,20-1,-1])
        cube([w,l+2*slop+3,h+2]);

        // chamfer
        translate([2+w+2-(l+4)/2,
                   section_y_pos,0])
        rotate([0,0,60])
        translate([(l+4)/2+5/2,0,0])
        cube([5,20,h*3],center=true);

        // section mount holes
        translate([x_pos_2+15.5,20+l,20/2-4.5])
        rotate([90,0,0])
        cylinder(d=4.7,h=20,center=true,$fn=20);

        translate([x_pos_2+15.5,20+l,20/2+4.5])
        rotate([90,0,0])
        cylinder(d=4.7,h=20,center=true,$fn=20);

        translate([x_pos_3-11.5,20+l,20/2-4.5])
        rotate([90,0,0])
        cylinder(d=4.7,h=20,center=true,$fn=20);

        translate([x_pos_3-11.5,20+l,20/2+4.5])
        rotate([90,0,0])
        cylinder(d=4.7,h=20,center=true,$fn=20);

        // infill
        translate([(w+20)/2-10,20+l+wall*2+5/2,7])
        cube([w+20,0.1,0.2],center=true);

        translate([(w+20)/2-10,20+l+wall*2+5/2,h-7])
        cube([w+20,0.1,0.2],center=true);
    }
}

module shelf_section_bracket_support_small(w,l) {
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
                translate([50,l+2-5+2.1,0])
                chamfered_cylinder(10,h,2.5,$fn=30);

                translate([0,60,0])
                chamfered_cylinder(10,h,2.5,$fn=30);

            }

            translate([2+41/2,(l+2)/2+2.1,h/2])
            cube([50,l+2,h],center=true);
        }
        translate([2,l/2+2,-1/2])
        _section_form(w,l+2*slop,h+1);

        // mount holes
        translate([0,32,0])
        _bracket_mount_hole();

        translate([0,80-8,0])
        _bracket_mount_hole();
    }
}

module _shelf_section_quides(w, l, height, length=7, extra=0, end=0) {

    g_l = l - 2*wall + extra;
    g_z = end != 1 ? 7+(height-7)/2 : height/2;
    g_h = end != 1 ? height-7 : height;
    
    g_top_z = height-4.5+length/2;

    difference() {
        union() {
            if (end != 2) {
                translate([wall+2.5/2,0,g_top_z])
                cube([2.5+extra,g_l,length], center=true);

                translate([section_quide_1,0,g_top_z])
                cube([2+extra,g_l,length], center=true);

                translate([section_quide_2,0,g_top_z])
                cube([2+extra,g_l,length], center=true);
            }

            if (!infill) {
                translate([section_quide_1,0,g_z])
                cube([1+extra,g_l,g_h], center=true);

                translate([section_quide_2,0,g_z])
                cube([1+extra,g_l,g_h], center=true);
            }

            if (!is_undef(section_quide_3)) {
                if (!infill) {
                    translate([section_quide_3,0,g_z])
                    cube([1+extra,g_l,g_h], center=true);
                }

                if (end != 2) {
                    translate([section_quide_3,0,g_top_z])
                    cube([2+extra,g_l,length], center=true);
                }
            }

            if (end != 2) {
                translate([w-15/2,0,g_top_z])
                cube([2.5+extra,g_l,length], center=true);

                translate([w-15/2+(15/2-1+extra)/2,
                       0,
                       g_top_z])
                cube([15/2-1+extra,2+extra,length],center=true);
            }
        }
        translate([0,0,height])
        _section_shell(w, l, 5, wall=wall+slop-extra, infill=false);
    }
}
//!_shelf_section_quides(10, length=7, extra=0);

module _section_shell(
    w, l, height, notch=false, wall=wall, infill=infill, end=0) {

    _notch = 1;
    _notch_2 = _notch + 2*wall;

    module _shell_minus() {
        difference() {
            translate([wall,0,-1])
            _section_form(w-2*wall, l-2*wall, height+2);

            if (notch) {
                translate([w/2,l/2-wall,(height+1)/2])
                cube([_notch_2, 2*wall, height+1],center=true);

                translate([w/2,-l/2+wall,(height+1)/2])
                cube([_notch_2, 2*wall, height+1],center=true);
            }
        }
    }

    module _shell() {
        difference() {
            difference() {
                _section_form(w,l,height);

                if (notch) {
                    translate([w/2,l/2-_notch/2,(height+1)/2])
                    cube([_notch, wall, height+1],center=true);

                    translate([w/2,-l/2+_notch/2,(height+1)/2])
                    cube([_notch, wall, height+1],center=true);
                }
            }
            if (end == 0) {
                _shell_minus();
            } else if (end == 1) {
                translate([0,0,1.6+1])
                _shell_minus();
            } else if (end == 2) {
                translate([0,0,-1.6-1])
                _shell_minus();
            }
        }
    }

    module _infill() {
        _w = sqrt(0.6*0.6*2);
        z = sqrt(50*50*2);
        echo(_w, z);
        count = ceil(height /z) + 2;

        intersection() {
            for(i=[0:count]) {
                translate([w/2,0,i*z-z+7])
                rotate([0,45,0])
                cube([2*w,l,_w],center=true);

                translate([w/2,0,i*z-z+7])
                rotate([0,-45,0])
                cube([2*w,l,_w],center=true);
            }
            translate([0,0,7])
            _section_form(w, l, height-7);
        }
    }

    union() {
        _shell();

        if (infill) {
            _infill();
        }
    }
}

// configurations:
// 0 = 4 rod tubes
// 1 = rod tubes 1 and 3
// 2 = rod tubes 2 and 4
// 3 = rod tubes 1 and 3 + joint tubes 2 and 4
// 4 = rod tubes 2 and 4 + joint tubes 1 and 3
// ends:
// 0 = none
// 1 = bottom
// 2 = top
module _shelf_section(
    w, l, height, configuration=0, supports=true, end=0) {
    
    module _rod_tube(h, nut=false) {
        cylinder(d=bolt_d+2.2,h=h,$fn=40);
        if (h >= 25) {
            translate([0,0,19/2])
            chamfered_cylinder(bolt_d+2.7,h-19,1,$fn=40);
        }
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
        translate([0,0,h/2+7]) {
            cylinder(d=bolt_d,h=h,center=true,$fn=40);

            if (h >= 25) {
                chamfered_cylinder(
                    bolt_d+0.7,h-20,1,center=true,$fn=40);
            }
        }
        if (end == 1) {
            translate([0,0,-0.1]) {
                hull() {
                    cylinder(d=section_head_d,h=6.3,$fn=25);
                    cylinder(d=section_head_d-1,h=6.8,$fn=25);
                }
            }
        } else if (end == 2) {
            translate([0,0,h+2*7]) {
                rotate([180,0,0])
                M4_nut_tapering(h=7,cone=false,bridging=true);

                cylinder(d=bolt_d,h=7*2,center=true,$fn=25);
            }
        }
    }

    module _tube_support() {
        h = 7-0.2;
        y = section_l / 2 - wall-1;

        if (supports && end != 1) {
            union() {
                tube(7,h,1.5);

                difference() {
                    translate([0,0,h/2])
                    cube([15,0.5,h],center=true);

                    cylinder(d=4);
                }

                translate([0,y,h/2])
                cube([15,0.5,h],center=true);

                translate([0,-y,h/2])
                cube([15,0.5,h],center=true);

                translate([0,0,0.25/2])
                cube([15,l-wall,.25],center=true);
            }
        }
    }

    module _flat(h=height, bottom=true) {
        w_bottom = 14+slop;
        w_top = 12;
        if (end == 1) {
            if (bottom) {
                translate([0,0,9/2])
                cube([w_bottom,l-1,9],center=true);
            } else {
                translate([0,0,h-7-2/2])
                cube([w_top,l-1,2],center=true);
            }
        } else if (end == 2) {
            if (bottom) {
                translate([0,0,7+2/2])
                cube([w_bottom,l-1,2],center=true);
            } else {
                translate([0,0,h-9/2])
                cube([w_top,l-1,9],center=true);
            }
        } else {
            if (bottom) {
                translate([0,0,7+2/2])
                cube([w_bottom,l-1,2],center=true);
            } else {
                translate([0,0,h-7-2/2])
                cube([w_top,l-1,2],center=true);
            }
        }
    }

    module _bottom_flats() {
        if (configuration == 0 || configuration == 1 || configuration == 3) {
            translate([x_pos_1-slop,0,0])
            _flat(bottom=true);

            translate([x_pos_3-slop,0,0])
            _flat(bottom=true);
        }
        if (configuration == 0 || configuration == 2 || configuration == 4) {
            translate([x_pos_2-slop,0,0])
            _flat(bottom=true);

            translate([x_pos_4-slop,0,0])
            _flat(bottom=true);
        }
        if (configuration == 3) {
            translate([x_pos_2-slop,0,0])
            _flat(bottom=true);
            
            translate([x_pos_4-slop,0,0])
            _flat(bottom=true);
        }
        if (configuration == 4) {
            translate([x_pos_1-slop,0,0])
            _flat(bottom=true);
            
            translate([x_pos_3-slop,0,0])
            _flat(bottom=true);
        }
    }

    module _top_flats() {
        if (configuration == 0 || configuration == 1 || configuration == 3) {
            translate([x_pos_1-slop,0,0])
            _flat(bottom=false);
            
            translate([x_pos_3-slop,0,0])
            _flat(bottom=false);
        }
        if (configuration == 0 || configuration == 2 || configuration == 4) {
            translate([x_pos_2-slop,0,0])
            _flat(bottom=false);
            
            translate([x_pos_4-slop,0,0])
            _flat(bottom=false);
        }
        if (configuration == 3) {
            translate([x_pos_2-slop,0,0])
            _flat(bottom=false, h=7+7+23);
      
            translate([x_pos_4-slop,0,0])
            _flat(bottom=false, h=7+7+23);
        }
        if (configuration == 4) {
            translate([x_pos_1-slop,0,0])
            _flat(bottom=false, h=7+7+23);
      
            translate([x_pos_3-slop,0,0])
            _flat(bottom=false, h=7+7+23);
        }
    }

    module _end_additions() {

        z = end == 1 ? 0 : height-9;

        if (end != 0) {
            // nut holders
            translate([x_pos_2-slop+13.5,0,z+9/2])
            cube([13,l-wall,9],center=true);

            translate([x_pos_3-slop-13.5,0,z+9/2])
            cube([13,l-wall,9],center=true);
        }
    }

    module _end_deletions() {

        module _nut_hole() {
            cylinder(d=4.3,h=50,center=true,$fn=40);
            hull() {
                rotate([0,0,30])
                M4_nut(cone=false);

                translate([0,5,])
                rotate([0,0,30])
                M4_nut(cone=false);
            }
        }

        if (end == 1) {
            // nut holes
            translate([x_pos_2-slop+13.5,-3.3/2,9/2])
            rotate([-90,0,0])
            _nut_hole();

            translate([x_pos_3-slop-13.5,-3.3/2,9/2])
            rotate([-90,0,0])
            _nut_hole();
        } else if (end == 2) {
            // nut holes
            translate([x_pos_2-slop+13.5,3.3/2,height-9/2])
            rotate([90,0,0])
            _nut_hole();

            translate([x_pos_3-slop-13.5,3.3/2,height-9/2])
            rotate([90,0,0])
            _nut_hole();
        }
        
    }

    difference() {
        union() {
            _section_shell(w, l, height, end=end);
            _bottom_flats();
            _top_flats();
            _end_additions();

            if (configuration == 0 || configuration == 1 || configuration == 3) {
                translate([x_pos_1-slop,0,7+(height-14)/2])
                cube([1.2,l-1,height-14],center=true);
                
                translate([x_pos_3-slop,0,7+(height-14)/2])
                cube([1.2,l-1,height-14],center=true);

                translate([x_pos_1-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_3-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_1-slop,0,0])
                _tube_support();

                translate([x_pos_3-slop,0,0])
                _tube_support();
            }

            if (configuration == 3) {
                translate([x_pos_2-slop,0,7+23/2])
                cube([1.2,l-1,23],center=true);

                translate([x_pos_4-slop,0,7+23/2])
                cube([1.2,l-1,23],center=true);
                
                translate([x_pos_2-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_4-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_2-slop,0,0])
                _tube_support();

                translate([x_pos_4-slop,0,0])
                _tube_support();
            }


            if (configuration == 0 || configuration == 2 || configuration == 4) {
                translate([x_pos_2-slop,0,7+(height-14)/2])
                cube([1.2,l-1,height-14],center=true);

                translate([x_pos_4-slop,0,7+(height-14)/2])
                cube([1.2,l-1,height-14],center=true);
              
                translate([x_pos_2-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_4-slop,0,7])
                _rod_tube(height-14, nut=false);
                
                translate([x_pos_2-slop,0,0])
                _tube_support();

                translate([x_pos_4-slop,0,0])
                _tube_support();
            }
            
            if (configuration == 4) {
                translate([x_pos_1-slop,0,7+23/2])
                cube([1.2,l-1,23],center=true);

                translate([x_pos_3-slop,0,7+23/2])
                cube([1.2,l-1,23],center=true);
                
                translate([x_pos_1-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_3-slop,0,7])
                _rod_tube(23, nut=true);
                
                translate([x_pos_1-slop,0,0])
                _tube_support();

                translate([x_pos_3-slop,0,0])
                _tube_support();
            }

            _shelf_section_quides(w, l, height, end=end);
        }
        
        _end_deletions();

        if (configuration == 0) {
            translate([x_pos_1-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_2-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_3-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_4-slop,0,0])
            _rod_hole(height-14, $fn=30);
        } else if (configuration == 1 ) {
            translate([x_pos_1-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_3-slop,0,0])
            _rod_hole(height-14, $fn=30);
        } else if (configuration == 2 ) {
            translate([x_pos_2-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_4-slop,0,0])
            _rod_hole(height-14, $fn=30);
        } else if (configuration == 3 ) {
            translate([x_pos_1-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_2-slop,0,0])
            _rod_hole(23, $fn=30);

            translate([x_pos_3-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_4-slop,0,0])
            _rod_hole(23, $fn=30);
        } else if (configuration == 4 ) {
            translate([x_pos_1-slop,0,0])
            _rod_hole(23, $fn=30);

            translate([x_pos_2-slop,0,0])
            _rod_hole(height-14, $fn=30);

            translate([x_pos_3-slop,0,0])
            _rod_hole(23, $fn=30);

            translate([x_pos_4-slop,0,0])
            _rod_hole(height-14, $fn=30);
        }
    }
}

end_h = 8;

module _section_end(w, l, nuts=false) {

    difference() {
        union() {
            _section_shell(w, l, end_h);

            _section_form(w,l,end_h-2);

            translate([x_pos_1-slop + 10/2,0,end_h/2])
            cube([x_pos_4-x_pos_3+19,l-1,end_h],center=true);

            translate([x_pos_3-slop + 10/2,0,end_h/2])
            cube([x_pos_4-x_pos_3+19,l-1,end_h],center=true);

            translate([x_pos_1-slop + 10/2,0,(end_h+7)/2])
            chamfered_cube(
                x_pos_4-x_pos_3+19,l-2*wall-0.5,end_h+7,1,center=true);

            translate([x_pos_3-slop + 10/2,0,(end_h+7)/2])
            chamfered_cube(
                x_pos_4-x_pos_3+19,l-2*wall-0.5,end_h+7,1,center=true);

            // nut holders
            translate([x_pos_2-slop+13.5,0,wall+8/2])
            cube([12,l-2*wall-1,8],center=true);

            translate([x_pos_2-slop+13.5,0,end_h/2])
            cube([12,l-wall,end_h],center=true);

            translate([x_pos_3-slop-13.5,0,wall+8/2])
            cube([12,l-2*wall-1,8],center=true);

            translate([x_pos_3-slop-13.5,0,end_h/2])
            cube([12,l-wall,end_h],center=true);
        }

        // nut holes
        translate([x_pos_2-slop+13.5,3.3/2,9/2])
        rotate([90,0,0]) {
            cylinder(d=4.3,h=50,center=true,$fn=40);

            hull() {
                M4_nut(cone=false);

                translate([0,5,])
                M4_nut(cone=false);
            }
        }

        translate([x_pos_3-slop-13.5,3.3/2,9/2])
        rotate([90,0,0]) {
            cylinder(d=4.3,h=50,center=true,$fn=40);

            hull() {
                M4_nut(cone=false);

                translate([0,4,])
                M4_nut(cone=false);
            }
        }


        // section mount holes
        translate([x_pos_1-slop,0,0]) {
            translate([0,0,end_h+5+0.3])
            cylinder(d=bolt_d,h=18,$fn=25);
        }
        
        translate([x_pos_2-slop,0,0]) {
            translate([0,0,end_h+5+0.3])
            cylinder(d=bolt_d,h=18,$fn=25);
        }
            
        translate([x_pos_3-slop,0,0]) {
            translate([0,0,end_h+5+0.3])
            cylinder(d=bolt_d,h=18,$fn=25);
        }
        translate([x_pos_4-slop,0,0]) {
            translate([0,0,end_h+5+0.3])
            cylinder(d=bolt_d,h=18,$fn=25);
        }
    }
}

module shelf_section_end_1(w, l) {
    difference() {
        union() {
            _section_end(w, l);

            translate([0,0,-3])
            _shelf_section_quides(w, l, 11);
        }

        translate([2,0,0]) {
            // section mount studs
            translate([x_pos_1-3-slop,0,-0.1]) {
                hull() {
                    cylinder(d=section_head_d,h=end_h+4.6,$fn=25);
                    cylinder(d=section_head_d-1,h=end_h+5.1,$fn=25);
                }
                hull() {
                    translate([10+2,0,0])
                    cylinder(d=section_head_d,h=end_h+4.6,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d-1,h=end_h+5.1,$fn=25);
                }
            }

            translate([x_pos_3-3-slop,0,-0.1]) {
                hull() {
                    cylinder(d=section_head_d,h=end_h+4.6,$fn=25);
                    cylinder(d=section_head_d-1,h=end_h+5.1,$fn=25);
                }

                hull() {
                    translate([10+2,0,0])
                    cylinder(d=section_head_d,h=end_h+4.6,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d-1,h=end_h+5.1,$fn=25);
                }
            }
        }
    }
}

module shelf_section_end_2(w, l) {
    difference() {
        _section_end(w, l, nuts=true);

        mirror([0,0,1])
        translate([0,0,-24])
        _shelf_section_quides(w, l, 14,length=9,extra=0.1);

        translate([x_pos_1-slop,0,-0.1]) {
            M4_nut_tapering(h=end_h+4.5,cone=false,bridging=true);
            cylinder(d=bolt_d,h=end_h+10,$fn=25);
        }

        translate([x_pos_2-slop,0,-0.1]) {
            M4_nut_tapering(h=end_h+4.5,cone=false,bridging=true);
            cylinder(d=bolt_d,h=end_h+10,$fn=25);
        }

        translate([x_pos_3-slop,0,-0.1]) {
            M4_nut_tapering(h=end_h+4.5,cone=false,bridging=true);
            cylinder(d=bolt_d,h=end_h+10,$fn=25);
        }

        translate([x_pos_4-slop,0,-0.1]) {
            M4_nut_tapering(h=end_h+4.5,cone=false,bridging=true);
            cylinder(d=bolt_d,h=end_h+10,$fn=25);
        }
    }
}

module shelf_section_support(w, l) {
    h = l - 2*wall - 0.5;

    difference() {
        union() {
            hull() {
                translate([-11,100-1/2,h/2])
                cube([10,1,h],center=true);

                translate([11,-100+1/2,h/2])
                cube([10,1,h],center=true);
            }            

            translate([0,0,h/2])
            cube([section_quide_2-section_quide_1+1,1,h],center=true);

            translate([0,0,h/2])
            cube([section_quide_2-section_quide_1-1.3,10,h],center=true);
        }

        hull() {
            translate([-11,100-0.1/2,h])
            rotate([0,45,0])
            cube([4,0.1,4],center=true);

            translate([11,-100+0.1/2,h])
            rotate([0,45,0])
            cube([4,0.1,4],center=true);
        }    

        hull() {
            translate([-11,100-0.1/2,0])
            rotate([0,45,0])
            cube([4,0.1,4],center=true);

            translate([11,-100+0.1/2,0])
            rotate([0,45,0])
            cube([4,0.1,4],center=true);
        }  
    }
}

module shelf_section(
    w,l, height, configuration=0, supports=true, end=0) {
    //rotate([0,0,-45])
    if (end == 2) {
        translate([0,0,height])
        rotate([180,0,0])
        _shelf_section(
            w, l, height, configuration=configuration,
            supports=false, end=end);
    } else {
        _shelf_section(
            w, l, height, configuration=configuration,
            supports=supports, end=end);
    }
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

module debug_section_bracket() {

    w = 170;
    l = section_l;

    // M4 rods to use
    rods = [280, 360];

    // TODO: dynamic prints
    echo("Total lenght: ", str(rods[0] + rods[1] - 30));
    echo("Print: ", str(rods[0]), str(rods[1]-30));

    intersection() {
        union() {
            shelf_section_bracket_1(w, l, open=true);

            translate(
                [2+slop,-20-(l+4)/2,bracket_wall+0.1])
            _shelf_section(
                w, l, rods[0], configuration=4);

            translate(
                [2+slop,-20-(section_l+4)/2,bracket_wall+0.2+rods[0]])
            _shelf_section(
                w, l, 50, configuration=2);

            translate(
                [2+slop,-20-(section_l+4)/2,
                bracket_wall+0.3+rods[0]+50])
            _shelf_section(
                w, l, 50, configuration=3);

            translate(
                [2+slop,-20-(section_l+4)/2,
                bracket_wall+0.4+rods[0]+100])
            _shelf_section(
                w, l, 50, configuration=1);
        }
        translate([0,-29.5,1])
        cube([240,29,500]);
    }

    translate([2+slop, 20+(section_l+4)/2,0])
    cylinder(d=4,h=100,$fn=20);

    intersection() {
        union() {
            shelf_section_bracket_2(w, l, open=true);

            translate(
                [2+slop, 20+(l+4)/2, rods[0]+bracket_wall+0.1])
            rotate([180,0,0])
            _shelf_section(
                w, l, rods[0], configuration=3);

            translate(
                [2+slop, 20+(l+4)/2,
                rods[0] + rods[1]-30 + bracket_wall + 0.1])
            rotate([180,0,0])
            _shelf_section(
                w, l, rods[1]-30, configuration=2);

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

module debug_section() {
    h = 100;

    end = 2;

    render()    
    intersection() {
        union() {
            _shelf_section(
                section_w, section_l, h, configuration=0, end=end);

            translate([section_w+5,0,0])
            _shelf_section(
                section_w, section_l, h, configuration=1, end=end);

            translate([2*(section_w+5),0,0])
            _shelf_section(
                section_w, section_l, h, configuration=2, end=end);

            translate([3*(section_w+5),0,0])
            _shelf_section(
                section_w, section_l, h, configuration=3, end=end);

            translate([4*(section_w+5),0,0])
            _shelf_section(
                section_w, section_l, h, configuration=4, end=end);
        }

        translate([0,0,-2])
        cube([3000,200,h+5]);
    }
    
    #translate([x_pos_1,0,0])
    cylinder(d=4,h=h);
}

module debug_3x100() {

    w = 220;
    l = 16-2*slop;

    #translate([x_pos_2,0,0])
    cylinder(d=4,h=1000);

    #translate([x_pos_1,0,1000-30])
    cylinder(d=4,h=1000);

    #translate([x_pos_2,0,2000-60])
    cylinder(d=4,h=1000);

    intersection() {
        union() {
            translate([0,0,1000])
            rotate([180,0,0]) {
                _shelf_section(
                    w, l, 200, configuration=4, supports=false);

                translate([0,0,200])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,400])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,600])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,800])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);
            }

            translate([0,0,1970.1])
            rotate([180,0,0]) {
                _shelf_section(
                    w, l, 170, configuration=3, supports=false);

                translate([0,0,170])
                _shelf_section(
                    w, l, 200, configuration=1, supports=false);

                translate([0,0,370])
                _shelf_section(
                    w, l, 200, configuration=1, supports=false);

                translate([0,0,570])
                _shelf_section(
                    w, l, 200, configuration=1, supports=false);

                translate([0,0,770])
                _shelf_section(
                    w, l, 200, configuration=1, supports=false);
            }

            translate([0,0,1970+970.2])
            rotate([180,0,0]) {
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,200])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,400])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,600])
                _shelf_section(
                    w, l, 200, configuration=2, supports=false);

                translate([0,0,800])
                _shelf_section(
                    w, l, 170, configuration=2, supports=false);
            }
        }
        cube([300,20,5000]);
    }
}

module debug_section_support() {

    w = 220;
    l = 16-2*slop;

    intersection() {
        union() {

            translate([2+slop,0,0])
            _shelf_section(w, l, 110, configuration=4);

            translate([2+slop,0,110+0.1])
            _shelf_section(w, l, 110, configuration=2);

        }
        translate([0,-29.5,1])
        cube([240,29,500]);
    }

    translate([section_quide_1+32.9,6,110+3])
    rotate([90,0,0])
    shelf_section_support(w, l);
}

module debug_section_end_1() {

    w = 220;
    l = 16-2*slop;

    intersection() {
        union() {
            //shelf_section_end_1(w, l);

            translate([0,0,0])
            _shelf_section(
                w, l, 50, configuration=1, supports=false, end=1);
        }
        translate([-1,-1,-1])
        cube([240,21,200]);
    }

    translate([-2.2,-30,-20/2])
    shelf_section_bracket_support(w, l);
}

module debug_section_end_2() {

    w = 220;
    l = 16-2*slop;

    intersection() {
        union() {
            //shelf_section_end_2(w, l);

            translate([0,0,50])
            rotate([180,0,0])
            _shelf_section(
                w, l, 50, configuration=1, supports=false, end=2);
        }
        cube([240,20,200]);
    }

    translate([-2.2,-30,-20/2])
    shelf_section_bracket_support(w, l);
}
