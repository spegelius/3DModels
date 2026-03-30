use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";

spath = str(
    stl_base_path,
    "Giant Lollipop/"
);



//_orig_stick();
//_orig_bottom();
//_orig_top();
//debug();

//new_stick();
//new_bottom();
//new_top();
joint_screw();



module _orig_stick() {
    translate([-23.87, -1.75, -111])
    import(
        str(
            spath,
            "Giant_Lollipop_Stick.stl"
        ),
        convexity=10
    );

    //%cylinder(d=25.1, h=1);
}

module _orig_bottom() {
    translate([-68.3, -138.19, 0])
    import(
        str(
            spath,
            "Giant_Lollipop_Bottom.stl"
        ),
        convexity=10
    );

    //%cylinder(d=136, h=1);
}

module _orig_top() {
    translate([-185.7, -67.8, 0])
    import(
        str(
            spath,
            "Giant_Lollipop_Top.stl"
        ),
        convexity=10
    );

    //%cylinder(d=127, h=1);
}

module debug() {
    intersection() {
        new_bottom();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    intersection() {
        translate([0, 0, 55.4])
        new_stick();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    intersection() {
        rotate([180, 0, 180])
        new_top();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    intersection() {
        translate([0, 0, -29/2])
        rotate([0, 0, 0.25*360]/2)
        joint_screw();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

}

module new_stick() {
    difference() {
        union() {
           _orig_stick();

           translate([0, 0, 1])
           cylinder(d=21, h=21);
        }

        difference() {
            translate([0, 0, -1])
            cylinder(d=50, h=22);

            translate([0, 0, 22])
            rotate([180, 0, 0])
            v_screw(
                h=22,
                screw_d=23,
                pitch=4,
                direction=0,
                steps=90,
                depth=1,
                chamfer=true
            );

            translate([0, 0, 17])
            chamfered_cylinder(26, 20, 4, $fn=50);
        }
        
        translate([0, 0, 2])
        chamfered_cylinder(13, 28, 6, $fn=80);

        translate([0, 0, 15])
        chamfered_cylinder(19.95, 28, 6, $fn=80);

    }
}

module new_bottom() {
    difference() {
        union() {
           _orig_bottom();

           translate([0, 0, 55])
           cylinder(d=26, h=21.4);
        }

        translate([0, 0, 55.2 + 22.2])
        rotate([180, 0, 0])
        v_screw(
            h=22.2,
            screw_d=23.6,
            pitch=4,
            direction=0,
            steps=90,
            depth=1,
            chamfer=true
        );

        translate([0, 0, 55.4 + 17])
        chamfered_cylinder(25.6, 20, 3.6, $fn=50);

        difference() {
            translate([0, 0, -30/2])
            v_screw(
                h=30,
                screw_d=110,
                pitch=4,
                direction=0,
                steps=90,
                depth=1,
                chamfer=true
            );

            translate([0, 0, 11])
            chamfered_cylinder(110, 30, 10, $fn=90);

            cylinder(d=96, h=100, center=true, $fn=90);
        }
    }
}

module new_top() {
    difference() {
        _orig_top();

        difference() {
            translate([0, 0, -30/2])
            v_screw(
                h=30,
                screw_d=110,
                pitch=4,
                direction=0,
                steps=90,
                depth=1,
                chamfer=true
            );

            translate([0, 0, 11])
            chamfered_cylinder(110, 30, 10, $fn=90);

            cylinder(d=96, h=100, center=true, $fn=90);
        }
    }
}

module joint_screw() {
    difference() {
        intersection() {
             v_screw(
                h=29,
                screw_d=110 - 0.6,
                pitch=4,
                direction=0,
                steps=90,
                depth=1,
                chamfer=false
            );

            chamfered_cylinder(110, 29, 3.7, $fn=90);
        }
        cylinder(d=97.5, h=100, center=true, $fn=90);
    }
}