
$fn=40;

use <../lib/includes.scad>;

module rose_import() {
    translate([0,0,5.25]) import ("../_downloaded/Super Rose/Roses.stl", convexity=10);
}

module stem_import() {
    import ("../_downloaded/Super Rose/Stems.stl", convexity=10);
}

module blub(d, h, mid_h, top_h, bottom_d, mid_d, top_d) {

    hull() {
        hull() {
            cylinder(d=bottom_d, h=1);
            translate([0,0,d/2+mid_h]) intersection() {
                sphere(d=mid_d);
                cube([mid_d,mid_d,mid_d/2], center=true);
            }
        }
        translate([0,0,top_h]) cylinder(d=d,h=1);
    }
    translate([0,0,top_h]) hull() {
        cylinder(d=d, h=1);
        translate([0,0,h-top_h]) cylinder(d=top_d, h=1);
    }
}

module center_part() {
    translate([0,0,1.26]) blub(d=21, h=73.7, mid_h=10, top_h=63, bottom_d=20.3, mid_d=20, top_d=25);
}

module petals1_part() {
    translate([0,0,1.25]) difference() {
        blub(d=29, h=71, mid_h=1.8, top_h=53, bottom_d=24, mid_d=28, top_d=34);
        blub(d=22, h=71, mid_h=3, top_h=53, bottom_d=20, mid_d=22, top_d=28);
    }
}

module petals2_part() {
    translate([0,0,1.25]) difference() {
        blub(d=38, h=70, mid_h=2.8, top_h=54, bottom_d=27.5, mid_d=38, top_d=45);
        blub(d=30, h=70, mid_h=4, top_h=54, bottom_d=24, mid_d=31, top_d=39);
    }
}

module petals3_part() {
    translate([0,0,1.25]) difference() {
        blub(d=46, h=66.5, mid_h=-1.5, top_h=53, bottom_d=31, mid_d=45.5, top_d=57);
        blub(d=40, h=66.5, mid_h=0, top_h=53, bottom_d=27.5, mid_d=39, top_d=48);
    }
}

module petals4_part() {
    translate([0,0,1.25]) difference() {
        blub(d=56, h=63.5, mid_h=-6.6, top_h=54, bottom_d=35, mid_d=51.5, top_d=66);
        blub(d=48, h=63.5, mid_h=-2, top_h=54, bottom_d=31.2, mid_d=47, top_d=57);
    }
}

module petals5_part() {
    translate([0,0,1.25]) difference() {
        blub(d=61, h=66, mid_h=-5, top_h=44, bottom_d=38.8, mid_d=62, top_d=82);
        blub(d=53, h=66, mid_h=-3, top_h=44, bottom_d=35, mid_d=55, top_d=67);
        translate([13,-33,57]) rotate([0,0,-30]) cube([5,30,5]);
        translate([-33,10,57]) rotate([0,0,-30]) cube([5,30,5]);
    }
    // petals extra material
    translate([12,31,53]) rotate([0,0,-25]) cube([80,8,8],center=true);
    translate([-12,-31,53]) rotate([0,0,-25]) cube([80,8,8],center=true);
}

module petals6_part() {
    translate([0,0,1.25]) difference() {
        blub(d=71, h=57, mid_h=-6, top_h=44.5, bottom_d=44, mid_d=71, top_d=109);
        blub(d=62, h=57, mid_h=-4, top_h=45.5, bottom_d=38.6, mid_d=63.5, top_d=77);
        translate([12,33,50]) rotate([0,0,-30]) cube([30,5,5],center=true);
        translate([-12,-33,50]) rotate([0,0,-30]) cube([30,5,5],center=true);
    }

    // petals extra material
    translate([35,0,50]) rotate([0,10,7]) cube([6,30,20],center=true);
    translate([-35,0,50]) rotate([0,-10,7]) cube([6,30,20],center=true);
    
    translate([22,-28,56]) rotate([0,10,-59]) cube([6,30,20],center=true);
    translate([-22,28,56]) rotate([0,-10,-59]) cube([6,30,20],center=true);
}

module center() {
    difference() {
        intersection() {
            rose_import();
            union() {
                center_part();
                difference() {
                    cylinder(d=20,h=1.4);
                    cylinder(d=8.5,h=1.5);
                }
            }
        }
    }
}

module petals1() {
    difference() {
        intersection() {
            rose_import();
            union() {
                petals1_part();
                difference() {
                    cylinder(d=24, h=1.4);
                    cylinder(d=20, h=1.5);
                }
            }
        }
        translate([12,0,0]) cylinder(d=3, h=2.5);
        translate([-12,0,0]) cylinder(d=3, h=2.5);
    }
}

module petals2() {
    difference() {
        intersection() {
            rose_import();
            union() {
                petals2_part();
                difference() {
                    cylinder(d=28, h=1.4);
                    cylinder(d=24, h=1.5);
                }
            }
        }
        translate([12,0,0]) cylinder(d=3, h=2.5);
        translate([-12,0,0]) cylinder(d=3, h=2.5);
    }
}

module petals3() {
    difference() {
        intersection() {
            rose_import();
            union() {
                petals3_part();
                difference() {
                    cylinder(d=31, h=1.4);
                    cylinder(d=28, h=1.5);
                }
            }
        }
    }
}

module petals4() {
    difference() {
        intersection() {
            rose_import();
            union() {
                petals4_part();
                difference() {
                    cylinder(d=35, h=1.4);
                    cylinder(d=31, h=1.5);
                }
            }
        }
    }
}

module petals5() {
    difference() {
        intersection() {
            rose_import();
            union() {
                petals5_part();
                difference() {
                    cylinder(d=38.5, h=1.4);
                    cylinder(d=35, h=1.5);
                }
            }
        }
    }
}

module petals6() {
    difference() {
        intersection() {
            rose_import();
            union() {
                petals6_part();
                difference() {
                    cylinder(d=43, h=1.4);
                    cylinder(d=38.5, h=1.5);
                }
            }
        }
    }
}

module _clip_body(d=8) {
    difference() {
        union() {
            cylinder(d=d, h=7);
            translate([0,0,7]) scale([1,(d-1)/d,1]) cylinder(d=d,h=1);
            translate([0,0,8]) scale([1,(d-1)/d,1]) cylinder(d1=d,1, h=6);
        }
        translate([0,0,6.5]) difference() {
            cube_donut(d, 1.5);
            translate([0,0,-5/2]) cylinder(d=d-1,h=5);
        }
    }

}

module stem() {
    difference() {
        stem_import();
        translate([0,0,-1-1.6]) _clip_body(d=8.4);
        translate([12,0,0]) cylinder(d=3, h=5);
        translate([-12,0,0]) cylinder(d=3, h=5);
    }
}

module clip() {
    difference() {
        intersection() {
            union() {
                cylinder(d=11, h=1);
                _clip_body();
            }
            cylinder(d=12, h=11);
        }
        translate([0,0,10/2+2])cube([1,10,10], center=true);

    }
}

module nub() {
    cylinder(d=2.7,h=6);
}

// for checking the internals
intersection () {
    //center();
    //petals1();
    //petals2();
    //petals3();
    //petals4();
    //petals5();
    //petals6();
    
    //rose();
    //translate([0.-40,0]) cube([80,80,80]);
}

//clip();
nub();
//stem();
//center();
//petals1();
//petals2();
//petals3();
//petals4();
//petals5();
//petals6();
