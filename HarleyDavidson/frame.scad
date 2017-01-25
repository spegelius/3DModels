
import("E:\\3DModels\\HarleyDavidson\\Sketchup\\frame(repaired)_ml.stl", convexity=3);

//include<bend.scad>;

module pipe(length=2.5) {
    cylinder(h=length, r=2.4);
}

union () {
translate([61, 246, 55]) rotate([11, 11.9, 0]) pipe(length=80);
translate([93.3, 246, 55]) rotate([11, -11, 0]) pipe(length=80);

//bend
translate([58.9, 249.8, 44]) rotate([18, 11.6, 0]) pipe(length=13.5);
translate([56.8, 256.9, 33.7]) rotate([33.5, 11.6, 0]) pipe(length=13.5);
translate([55.5, 266.8, 26.6]) rotate([51, 11, 0]) pipe(length=12.5);
translate([55, 276, 24.2]) rotate([71.4, 11, 0]) pipe(length=11);
translate([54.9, 286, 23.6]) rotate([84.5, 11, 0]) pipe(length=11);
}