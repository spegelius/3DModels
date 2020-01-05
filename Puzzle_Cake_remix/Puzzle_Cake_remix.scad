// Based on: https://www.thingiverse.com/thing:2758759

// Clone this somewhere and update the path: https://github.com/spegelius/Dollo.git
use <../Dollo/NEW_long_ties/include.scad>;

////// VIEW \\\\\\
//disk();
//case();

//_disk_support_form();
//disk_soluble_support();
//disk_bottom_support();
//case_support_soluble();
case_support();

////// MODULES \\\\\\
module disk() {
    import("../_downloaded/Puzzle Cake by Hanayama (Pac-man puzzle)/Cake_by_Hanayama_-_Disk.stl",
    convexity=10);
}

module case() {
    import("../_downloaded/Puzzle Cake by Hanayama (Pac-man puzzle)/Cake_by_Hanayama_-_Case.stl",
    convexity=10);

}

module _pie(h=5) {
    hull() {
        translate([-2/2-0.2,0,0])
        cylinder(d=2,h=h,$fn=40);
        translate([-23,0,h/2])
        cube([0.1,46.2,h],center=true);
    }
}

module _disk_support_form() {
    translate([0,0,-4])
    difference() {
        cylinder(d=29,h=3,$fn=50);
        translate([0,0,4]) disk();
        _pie();
    }
}

module disk_soluble_support() {
    intersection() {
        _disk_support_form();
        translate([0,0,-4+2.6])
        cylinder(d=32,h=1);
    }
}

module disk_bottom_support() {
    difference() {
        intersection() {
            _disk_support_form();
            translate([0,0,-4])
            cylinder(d=32,h=2.6);
        }
        translate([0,0,-4+0.2]) {
            tube(28,2,3.5,$fn=30);
            tube(20,2,3.5,$fn=30);
            tube(12,2,4.8,$fn=30);
        }
    }
}

module case_bottom_support_soluble() {
    color("beige")
    difference() {
        tube(40,0.2,5,$fn=50);
        _pie();
    }
}

module case_bottom_center_support_soluble() {
    color("beige")
    translate([0,0,2.2])
    difference() {
        cylinder(d=28.5,h=0.2,$fn=50);
        _pie();
    }
}

module case_bottom_side_support_soluble() {
    color("beige")
    translate([0,0,3.4])
    intersection() {
        tube(45.5,0.2,2,$fn=50);
        rotate([0,0,87.5]) _pie();
    }
}

module case_top_support_soluble() {
    color("beige")
    translate([0,0,13.1])
    difference() {
        tube(40,0.4,4.5,$fn=50);
        _pie();
    }
}

module case_top_center_support_soluble() {
    color("beige")
    translate([0,0,16.1])
    difference() {
        cylinder(d=29,h=0.4,$fn=50);
        _pie();
    }
}

module case_top_side_support_soluble() {
    color("beige")
    translate([0,0,10.6])
    intersection() {
        tube(45.5,0.4,2,$fn=50);
        rotate([0,0,87.5]) _pie();
    }
}

module case_support_soluble() {
    case_bottom_support_soluble();
    case_bottom_center_support_soluble();
    case_bottom_side_support_soluble();
    case_top_support_soluble();
    case_top_center_support_soluble();
    case_top_side_support_soluble();
}

module case_support() {
    translate([0,0,0.2])
    difference() {
        union() {
            cylinder(d=40,h=15.9,$fn=50);
            translate([0,0,3.4])
            intersection() {
                rotate([0,0,87.5]) _pie(7);
                tube(45.5,8,4,$fn=50);
            }
        }
        cylinder(d=30.1,h=2.2,$fn=50);

        translate([0,0,12.9])
        tube(40,3,5.5,$fn=50);
        _pie(20);
        
        translate([0,0,0.2])
        tube(39,12,4,$fn=50);

        translate([0,0,3.6])
        tube(44.5,6.3,2.25,$fn=50);
        
        translate([0,0,2.4]) {
            difference() {
                union() {
                    cylinder(d=28,h=12.9,$fn=50);
                    chamfered_cylinder(30,10.4,1,$fn=50);
                }
                cylinder(d=3,h=20,$fn=50);
                tube(17,12.9,0.5,$fn=50);
            }
        }
    }
}
