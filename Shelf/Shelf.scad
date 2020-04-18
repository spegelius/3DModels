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
section_hole_w = 166;
section_hole_l = 16;
section_w = section_hole_w-2*slop;
section_l = section_hole_l-2*slop;
section_y_pos = 20 + (section_hole_l + 4)/2;
section_head_d = 10;
section_quide_1 = 10+(section_hole_w-15) / 3;
section_quide_2 = section_hole_w - section_quide_1;

echo(section_quide_1);
echo(section_quide_2);

// position for holes
x_pos_1 = 15;
x_pos_2 = x_pos_1 + 10;
x_pos_3 = section_hole_w - section_hole_l/2 - 20;
x_pos_4 = x_pos_3 + 10;


////// VIEW //////
//debug_section();
//debug();

//shelf_top_bracket();
//shelf_section_bracket_1();
//shelf_section_bracket_2();
//shelf_section_bracket_middle();
//shelf_section_bracket_support();
//shelf_section_joiner_1();
//shelf_section_joiner_2();
//shelf_section_200();
shelf_section_300();

////// MODULES //////
module arc(d, x, y, size_x, size_y) {
    intersection() {
        translate([x,y]) difference() {
            cylinder(d=d,h=h,$fn=150);
            cylinder(d=d-20,h=3*h,center=true,$fn=150);
        }
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
            arc(600, 276.5, -100.4, 160, 170);
            
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

module _shelf_section_bracket_base() {
    head_d = 10;

    difference() {
        union() {
            difference() {
                union() {
                    // back
                    hull() {
                        cylinder(d=10,h=h,$fn=30);

                        translate([0,180,0])
                        cylinder(d=10,h=h,$fn=30);
                    }
                    translate([2,section_y_pos,0])
                    _section_form(section_hole_w+2,section_hole_l+4,h);

                    translate([-5,
                        section_y_pos+section_hole_l/2+2-10,0])
                    arc(300,300/2-2,300/2,150,135);

                    translate([20,55,h/2])
                    rotate([0,0,45])
                    cube([52,10,h],center=true);
                }
                translate([2,section_y_pos,-1/2])
                _section_form(section_hole_w,section_hole_l,h+1);
                
                // mount holes
                translate([0,8,h/2])
                rotate([0,90,0])
                cylinder(d=5,h=20,center=true,$f=30);

                translate([40/2,8,h/2])
                rotate([0,90,0])
                cylinder(d=12,h=40,center=true,$f=30);

                translate([0,180-10,h/2])
                rotate([0,90,0])
                cylinder(d=5,h=20,center=true,$f=30);

                translate([40/2,180-10,h/2])
                rotate([0,90,0])
                cylinder(d=12,h=40,center=true,$f=30);

                // infill
                translate([0,200/2-10,7])
                cube([0.1,200,0.2],center=true);

                translate([0,200/2-10,h-7])
                cube([0.1,200,0.2],center=true);
            }
        }
    }
}

module _shelf_section_bracket(nuts=true) {
    
    difference() {
        union() {
            union() {
                _shelf_section_bracket_base();
                // bottom
                translate([2,20+(section_l+4)/2,0])
                _section_form(section_hole_w+1,section_hole_l+1,wall);
            }
            // section mount studs
            if (nuts) {
                hull() {
                    translate([2+x_pos_1,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);

                    translate([2+x_pos_2,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);
                }
                hull() {
                    translate([2+x_pos_3,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);

                    translate([2+x_pos_4,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);
                }
            } else {
                hull() {
                    translate([2+x_pos_1-2,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);

                    translate([2+x_pos_2+2,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);
                }
                hull() {
                    translate([2+x_pos_3-2,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);

                    translate([2+x_pos_4+2,section_y_pos,0])
                    cylinder(d=11.6,h=wall+7,$fn=25);
                }
            }
        }
        // section mount holes
        translate([2+x_pos_1,section_y_pos,0]) {
            translate([0,0,wall+4+0.2])
            cylinder(d=bolt_d,h=8,$fn=25);
        }
        
        translate([2+x_pos_2,section_y_pos,0]) {
            translate([0,0,wall+4+0.2])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
            
        translate([2+x_pos_3,section_y_pos,0]) {
            translate([0,0,wall+4+0.2])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
        translate([2+x_pos_4,section_y_pos,0]) {
            translate([0,0,wall+4+0.2])
            cylinder(d=bolt_d,h=7,$fn=25);
        }
    }
}

module shelf_section_bracket_1() {
    difference() {
        _shelf_section_bracket(nuts=true);
        translate([2,section_y_pos,0]) {
            translate([x_pos_1,0,0])
            M4_nut_tapering(h=wall+4,cone=false,bridging=true);

            translate([x_pos_2,0,0])
            M4_nut_tapering(h=wall+4,cone=false,bridging=true);

            translate([x_pos_3,0,0])
            M4_nut_tapering(h=wall+4,cone=false,bridging=true);

            translate([x_pos_4,0,0])
            M4_nut_tapering(h=wall+4,cone=false,bridging=true);
        }
    }
}

module shelf_section_bracket_2() {
    difference() {
        mirror([0,1,0])
        _shelf_section_bracket(nuts=false);

        translate([2,-section_y_pos]) {
            translate([1/4,0,-10])
            _shelf_section_quides(14,length=9,extra=0.4);

            // section mount studs
            translate([x_pos_1-1,0,0]) {
                hull() {
                    cylinder(d=section_head_d,h=wall+4,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d,h=wall+4,$fn=25);
                }
            }

            translate([x_pos_3-1,0,0]) {
                hull() {
                    cylinder(d=section_head_d,h=wall+4,$fn=25);

                    translate([10+2,0,0])
                    cylinder(d=section_head_d,h=wall+4,$fn=25);
                }
            }
        }
    }
}

module shelf_section_bracket_middle() {
    union() {
        difference() {
            union() {
                _shelf_section_bracket_base();

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
        cube([section_hole_w,6,h+1]);

        // chamfer
        translate([2+section_hole_w+2-(section_hole_l+4)/2,
                   section_y_pos,0])
        rotate([0,0,60])
        translate([(section_hole_l+4)/2+5/2,0,h/2])
        cube([5,20,h],center=true);
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

module _shelf_section(height) {

    difference() {
        union() {
            difference() {
                _section_form(section_w,section_l,height);

                translate([wall,0,-1])
                _section_form(section_w-2*wall,section_l-2*wall,height+2);
            }
            translate([x_pos_1,0,7+(height-14)/2])
            cube([1.2,14,height-14],center=true);

            translate([x_pos_2,0,7+(height-14)/2])
            cube([1.2,14,height-14],center=true);

            translate([x_pos_3,0,7+(height-14)/2])
            cube([1.2,14,height-14],center=true);

            translate([x_pos_4,0,7+(height-14)/2])
            cube([1.2,14,height-14],center=true);

            _shelf_section_quides(height);

            translate([x_pos_1-slop,0,7]) {
                cylinder(d=bolt_d+2,h=height-14,$fn=25);
                cylinder(d=bolt_d+6,h=5.5,$fn=25);
            }

            translate([x_pos_2-slop,0,7]) {
                cylinder(d=bolt_d+2,h=height-14,$fn=25);
                translate([0,0,height-14-6])
                hull() {
                    cylinder(d=bolt_d+3,h=5,$fn=25);

                    translate([0,0,1.5])
                    cylinder(d=bolt_d+6,h=4,$fn=25);
                }
            }

            translate([x_pos_4-slop,0,7]) {
                cylinder(d=bolt_d+2,h=height-14,$fn=25);
                translate([0,0,height-14-6]) hull() {
                    cylinder(d=bolt_d+3,h=5,$fn=25);

                    translate([0,0,1.5])
                    cylinder(d=bolt_d+6,h=4,$fn=25);
                }
            }

            translate([x_pos_3-slop,0,7]) {
                cylinder(d=bolt_d+2,h=height-14,$fn=25);
                cylinder(d=bolt_d+6,h=5.5,$fn=25);
            }
            
            translate([x_pos_1+5-slop,0,7+2/2])
            cube([22,14,2],center=true);

            translate([x_pos_3+5-slop,0,7+2/2])
            cube([22,14,2],center=true);

            translate([x_pos_1+5-slop,0,height-7-2/2])
            cube([22,14,2],center=true);

            translate([x_pos_3+5-slop,0,height-7-2/2])
            cube([22,14,2],center=true);
        }
        translate([x_pos_1-slop,0,7.2]) {
            cylinder(d=bolt_d,h=height-10,$fn=25);
            M4_nut(h=3.6, cone=false, bridging=true);
        }
        translate([x_pos_2-slop,0,7.2]) {
            cylinder(d=bolt_d,h=height-10,$fn=25);

            translate([0,0,height-14-3.6])
            M4_nut(h=3.6, cone=false, bridging=true);
        }
        translate([x_pos_3-slop,0,7.2]) {
            cylinder(d=bolt_d,h=height-10,$fn=25);
            M4_nut(h=3.6, cone=false, bridging=true);
        }
        translate([x_pos_4-slop,0,7.2]) {
            cylinder(d=bolt_d,h=height-10,$fn=25);

            translate([0,0,height-14-3.6])
            M4_nut(h=3.6, cone=false, bridging=true);
        }
        
        // makes KISS treat enclosed areas as open
        translate([x_pos_1,15/2-2,height/2])
        rotate([0,90,0])
        cylinder(d=0.1,h=10,center=true);

        translate([x_pos_3,15/2-2,height/2])
        rotate([0,90,0])
        cylinder(d=0.1,h=10,center=true);
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
    rotate([0,0,-45]) _shelf_section(200);
}


module shelf_section_300() {
    rotate([0,0,-45]) _shelf_section(300);
}

module debug_section() {
    intersection() {
        union() {
            shelf_section_bracket_1();
            translate([2+slop,20+(section_l+4)/2,wall+0.1])
            _shelf_section(200);
        }
        cube([180,29,500]);
    }
    intersection() {
        union() {
            shelf_section_bracket_2();
            translate([2+slop,-20-(section_l+4)/2,200+wall+0.1])
            rotate([180,0,0])
            _shelf_section(200);
        }
        translate([0,-29.5,0]) cube([180,29,500]);
    }
}

module debug() {
    h = 100;
    
    intersection() {
        union() {
            _shelf_section(h);

            translate([-2-slop,-20-(section_l+4)/2,-wall-0.1])
            shelf_section_bracket_1();

            translate([-2-slop,-20-(section_l+4)/2,h+wall+0.1])
            rotate([180,0,0])
            shelf_section_bracket_2();
        }

        translate([0,0,-2])
        cube([200,200,h+5]);
    }
    
    #translate([x_pos_1,0,0])
    cylinder(d=4,h=h);
}

