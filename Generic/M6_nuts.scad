
use <../Dollo/NEW_long_ties/include.scad>;

M6_nut_orig();


module M6_nut_orig() {
    difference() {
        intersection() {
            M6_nut(cone=false);

            chamfered_cylinder(12, 5.2, 1.2, $fn=40);
        }

        translate([0, 0, -1])
        v_screw(
            h=10, screw_d=6.2, pitch=1, direction=0,
            steps=40, depth=0.2, chamfer=false
        );
    }
}
